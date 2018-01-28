using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Target : MonoBehaviour {

    public float range = 1f;
    public float speed = 0.1f;

    private Vector3 target = Vector3.zero;

    private void Start() {
        randomize();
    }
	
	void Update() {
        transform.position = Vector3.Lerp(transform.position, target, speed);
        if ((int) (transform.position.x * 10) == (int) (target.x * 10)) randomize();
	}

    void randomize() {
        target = new Vector3(Random.Range(-range, range), Random.Range(-range, range), Random.Range(-range, range));
    }

}
