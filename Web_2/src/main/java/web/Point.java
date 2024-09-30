package web;

public class Point {
    private float x;
    private float y;
    private float r;
    Point(float x, float y, float r) {
        this.x = x;
        this.y = y;
        this.r = r;
    }

    public boolean checkArea() {
        if (x >= 0 && y >= 0 && x * x + y * y <= r * r) {
            return true;
        }
        if (x >= 0 && y <= 0 && y >= x - r) {
            return true;
        }
        if (x <= 0 && y <= 0 && x >= -r && y >= -r / 2) {
            return true;
        }
        return false;
    }

    public float getX() {
        return x;
    }

    public float getY() {
        return y;
    }

    public float getR() {
        return r;
    }
}
