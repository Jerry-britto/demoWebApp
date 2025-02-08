const request = require("supertest");
const app = require("../server.js");

describe("API Endpoints", () => {
  test("GET / should return 'Hello, World!'", async () => {
    const res = await request(app).get("/");
    expect(res.statusCode).toBe(200);
    expect(res.text).toBe("Hello, World! This is my Node.js app! How was your day");
  });

  test("GET /api should return JSON with a message", async () => {
    const res = await request(app).get("/api");
    expect(res.statusCode).toBe(200);
    expect(res.body).toEqual({ message: "This is an API response!" });
  });
});
