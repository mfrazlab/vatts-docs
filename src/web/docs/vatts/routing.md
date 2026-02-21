# Routing in Vatts.js

Vatts.js uses file-based routing for the **frontend** and configuration-based routing for the **backend**. This guide explains how routes work, how to create route files, and what patterns you can use.

---

## Frontend Routing (PathRouter)

Frontend routes are created automatically from the file structure in `/src/web`. You do not need to register routes manually.

### File and Folder Mapping

- `/src/web/page.tsx` -> `/`
- `/src/web/about/page.tsx` -> `/about`
- `/src/web/blog/[id]/page.tsx` -> `/blog/:id`

### Dynamic Segments

Vatts.js supports the following dynamic segment formats in folder names:

| Segment         | Matches                | Does Not Match |
|-----------------|------------------------|----------------|
| `[param]`       | `/1`, `/2`             | `/`, `/1/2`    |
| `[[param]]`     | `/`, `/en`, `/pt`      | `/en/us`       |
| `[...param]`    | `/a`, `/a/b`, `/a/b/c` | `/`            |
| `[[...param]]`  | `/`, `/a`, `/a/b/c`    | N/A            |

#### Examples

1. **Required Parameter** (`[param]`):

```
/src/web/blog/[id]/page.tsx -> /blog/:id
```

2. **Optional Parameter** (`[[param]]`):

```
/src/web/[[lang]]/about/page.tsx -> /:lang?/about
```

3. **Catch-all Routes** (`[...param]`):

```
/src/web/docs/[...slug]/page.tsx -> /docs/*
```

4. **Optional Catch-all Routes** (`[[...param]]`):

```
/src/web/[[...path]]/page.tsx -> /* (also matches /)
```

### Example Page

```tsx
// src/web/blog/[id]/page.tsx
import { Metadata } from "vatts/react";

export default function App({ params }: { params: { id: string } }) {
    return (
        <main>
            <h1>Blog Post {params.id}</h1>
            <p>This is a dynamic route with param: {params.id}</p>
        </main>
    );
}

export function generateMetadata({ params }: { params: { id: string } }): Metadata {
    return {
        title: `Blog Post ${params.id} | Vatts.js`,
        description: `Read the blog post with ID ${params.id}`,
        keywords: ["blog", "vatts", params.id]
    };
}
```

### Metadata Interface

The `Metadata` interface allows you to define SEO and document metadata:

```ts
export interface Metadata {
    title?: string;
    description?: string;
    keywords?: string | string[];
    author?: string;
    favicon?: string;
    viewport?: string;
    themeColor?: string;
    canonical?: string;
    robots?: string;
    openGraph?: {
        title?: string;
        description?: string;
        type?: string;
        url?: string;
        image?: string | {
            url: string;
            width?: number;
            height?: number;
            alt?: string;
        };
        siteName?: string;
        locale?: string;
    };
    twitter?: {
        card?: 'summary' | 'summary_large_image' | 'app' | 'player';
        site?: string;
        creator?: string;
        title?: string;
        description?: string;
        image?: string;
        imageAlt?: string;
    };
    language?: string;
    charset?: string;
    appleTouchIcon?: string;
    manifest?: string;
    other?: Record<string, string>;
    scripts?: Record<string, Record<string, string>>;
}
```

---

## Backend Routes

Backend routes live in `/src/backend/routes`. Each file exports a `BackendRouteConfig`.

### Route Configuration

```ts
export interface BackendRouteConfig {
    pattern: string;
    GET?: BackendHandler;
    POST?: BackendHandler;
    PUT?: BackendHandler;
    DELETE?: BackendHandler;
    WS?: WebSocketHandler;
    middleware?: VattsMiddleware[];
}
```

### HTTP Examples

1. **Basic GET Route**:

```ts
// src/backend/routes/api/version.ts
import { BackendRouteConfig, VattsResponse } from "vatts";

const route: BackendRouteConfig = {
    pattern: "/api/version",
    GET: () => {
        return VattsResponse.json({
            version: "1.0.0",
            name: "Vatts.js Example"
        });
    }
};

export default route;
```

2. **CRUD Endpoints**:

```typescript
// src/backend/routes/api/users.ts
import { BackendRouteConfig, VattsResponse } from "vatts";

const users = new Map<string, { id: string; name: string }>();

const route: BackendRouteConfig = {
    pattern: "/api/users/[[id]]",

    // List users or get one user
    GET: async (_request, params) => {
        if (params.id) {
            const user = users.get(params.id);
            if (!user) return VattsResponse.notFound();
            return VattsResponse.json(user);
        }
        return VattsResponse.json([...users.values()]);
    },

    // Create user
    POST: async (request) => {
        const user = await request.json();
        const id = Date.now().toString();
        users.set(id, { id, ...user });
        return VattsResponse.json({ id }, { status: 201 });
    },

    // Update user
    PUT: async (request, params) => {.
        if (!params.id) return VattsResponse.badRequest();
        const user = await request.json();
        users.set(params.id, { ...user, id: params.id });
        return VattsResponse.json({ success: true });
    },

    // Delete user
    DELETE: async (_request, params) => {
        if (!params.id) return VattsResponse.badRequest();
        users.delete(params.id);
        return VattsResponse.json({ success: true });
    }
};

export default route;
```

### WebSocket Examples

1. **Basic Chat**:

```ts
// src/backend/routes/ws/chat.ts
import { BackendRouteConfig, WebSocket } from "vatts";

const connections = new Set<WebSocket>();

const route: BackendRouteConfig = {
    pattern: "/ws/chat",
    WS: {
        onConnect: (ws) => {
            connections.add(ws);
            ws.send(JSON.stringify({ type: "welcome" }));
        },

        onMessage: (ws, message) => {
            const data = JSON.parse(message);

            // Broadcast to all connected clients
            connections.forEach((client) => {
                if (client !== ws) {
                    client.send(
                        JSON.stringify({
                            type: "message",
                            text: data.text
                        })
                    );
                }
            });
        },

        onClose: (ws) => {
            connections.delete(ws);
        }
    }
};

export default route;
```

