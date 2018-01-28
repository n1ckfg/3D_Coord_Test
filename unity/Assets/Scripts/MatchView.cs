using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MatchView : MonoBehaviour {

    public Transform target;
    public Camera cam;

    private void Update() {
        transform.position = new Vector3(target.position.x, target.position.y, transform.position.z);
    }

}
