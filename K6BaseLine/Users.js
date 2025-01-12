import http from 'k6/http';
import { sleep,check } from 'k6';

export const options = {
    vus: 20,
    stages: [
        { duration: '30s', target: 60 },
        { duration: '1m30s', target: 30 },
        { duration: '20s', target: 0 },
    ],

};


export default function () {
    const res = http.get('http://localhost:8080/api/v3/user/theUser');
    check(res, { 'status was 200': (r) => r.status == 200 });
    sleep(1);
  }