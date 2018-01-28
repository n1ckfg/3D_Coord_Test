using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MatchView : MonoBehaviour {

    public Transform target;
    public Camera cam;

    private void Update() {
        Ray ray = cam.ScreenPointToRay(target.position);
        transform.position = ray.origin;
    }

}
