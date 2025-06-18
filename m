Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92F71DFDA1
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 04:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750220823; cv=none; b=HTXi//vQV+AdEp4c23ccFdpe/DVyssZ5pY70+elLdmuknntTBKGRn0Wfn0SVkQcxfc4pXvVIf02Q9QJXZ5j6WDyNF++1UwDXy4A2vbvp+eZK8Y/WchNfNtsbFICpWGfbfJWSKfZ6EJQZPbSC6RMBo/M88BHLM18VLUIDKxQCwdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750220823; c=relaxed/simple;
	bh=Re7uJ68Ehg6FTxwG5PwASqyRnnvQuln7dCvdjpWABto=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Yrceaq8hhienmrLM+Yv2KuoyHREyv58xr2c6uYlbWsSwVHZfCeGJSZawjcl0YXiFi4oS4mUiEHMtyvgvKaVaQfavJL0/0IADLjojt5omLk94kEeeWFP4ZJQF97EkRsCYPgpEiJ80IbXTds/fiLLGJMYFJSGYfNM7vZJgWeVvfD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cMOaRcvp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cMOaRcvp"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I2s86A018553
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 04:26:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HYo/jTJnslty2qiYpTIGQd
	70ScyWgQWrHYTXzntSuZw=; b=cMOaRcvpLfneOBXi7/Lf5u9F/foeHEZfZEo9a9
	HC9mCxRN8HXH6OJTVRrQn1g2gRsXa+xv9JSRp/cfIcAf11Atj7tb7gYluGtBKcbu
	UslDAUwzYUH6YvKnhN3fHKpPs3xKRWU2vYgod2nZxn87LX4pv4lFg+70LM4supCb
	Es+Yp3uA54kbKj5+plq8L+87pySFAhqdlbeJsqgnxU3njR8bJ0tW8nlUK9GkK/yh
	mbAkv6eABIP9yk4BwFWlyDWEaMrgeNTqLBlHJQIHxbTo8X6BDjPTMzp6Eutgh+Fp
	UsTOU+wx2LS5m0B2IG9keHf+7ZIJpm5qvYAGEN6vR7oDQ5WA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hfjr7t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 04:26:58 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-747af0bf0ebso5312508b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 21:26:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750220817; x=1750825617;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HYo/jTJnslty2qiYpTIGQd70ScyWgQWrHYTXzntSuZw=;
        b=tvivbjELOg5k1zRMF+T4dPjL4ZN2lYJ5sObVPHAotDPaxbpUuS9T4do0l0Mb2iXBjg
         rq0/d7QmPjHf8L2++K2P/CR3ynU0Wh6HObbfNuMNVg/gCJKXMtlwZ08ax4Im2m6l/hX2
         j+RV3L9Q4YsJptJCvAUS24MnsHiJRLdE6UJkpQvrbOKFy1BjBvCKMMOB5GJD1gO0O9gZ
         4BQdM+a6c9WUo1Gnbvu5MfDzasQNGm+CbLWoLPSLg/5fQU2rgSemYsy5KPXWOm2P3q1P
         QxGIVrygQ3R4AB1UxzAjqXvpzXNaIv3fm96MDd9CQRZwj0cMCo6VNsmIE6VJ4ySvsdaE
         CX0w==
X-Forwarded-Encrypted: i=1; AJvYcCU5L6gFxJCE7VMQ6ETNwxo3olimztgKp4BKhYcolazBzASL1ZEB6+IGocCz313rQMShfzQ6powE2YWKmII=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlyRRtlqXAHUzTLX9mRY65o1KDJMgP1gZprhi7Bk1OnQobJUjC
	cahHsuIYtLq7x+zdi98k7F1s5/x9OKmqF0BwLKtPRdS3vVBlFu9QUnui22SkbRrDeLVu0ecm7iu
	9PvudSj+xuSqWcylmEyrsvR+xJptUX35KGnyGN6KtE8j9oHjlYaO0FbQBZUkAGKZqPRPbTg1XiW
	kT
X-Gm-Gg: ASbGncsysCVDGJPymXHj//GrGcAkbxhUQ3YIhI5avdLy+y91AVWKXJcBCqTgLBNSl2p
	559WzIsf4ZKTuQ499CrPrx7qKtT+SWAfAPaaYQ2cobYiXo/qVnK0iQrgRU11/RXF7XpAHsaQJSN
	rqYw6ch9Jdst4+zj4zFGqCD/8LSkLdC8xgk8DaUUDL5fidD7+5+Prz8ZpQnHrv/0y5z9BoZLUqK
	E8wktjqz7c7uTJACZb3Rd6dJNNfL959tcpS3SfzSzeahx8nOAaHzvOJ79KR8Z41wZWirJE7ENxB
	YllvQZ4HNzVphd0876msbw0HjOK6GotwJxE/XyMPTT89k01DBwJuIbQG7rj4wjtvghhHzLe46UY
	bQHMyHg==
X-Received: by 2002:a05:6a00:92a8:b0:742:a5f2:9c51 with SMTP id d2e1a72fcca58-7489cfeb010mr22046439b3a.16.1750220817486;
        Tue, 17 Jun 2025 21:26:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNdoo1zE+YYZvAP9uC0JrnzDCOJF8BLEa+zrc49IDdrGbi4+kZ4TzqDxfxMmnSgeKPJmqXbQ==
X-Received: by 2002:a05:6a00:92a8:b0:742:a5f2:9c51 with SMTP id d2e1a72fcca58-7489cfeb010mr22046406b3a.16.1750220816940;
        Tue, 17 Jun 2025 21:26:56 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7489000749csm10252212b3a.68.2025.06.17.21.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 21:26:56 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Tue, 17 Jun 2025 21:26:22 -0700
Subject: [PATCH v2] tee: optee: prevent use-after-free when the client
 exits before the supplicant
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-fix-use-after-free-v2-1-1fbfafec5917@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAO0/UmgC/22NQQ6CMBBFr0Jm7ZC2UiGuvIdhUeiMNBGqLTQaw
 t2tJO7cTPJ+/n+zQqTgKMK5WCFQctH5KYM6FNAPZroROpsZlFBanESF7F64RELDMwXkQIQNs+y
 01bauK8jDR6Dc2qXXNvPg4uzDe/+R5Df96fQ/XZIo0dTCqmPHrKrm4mMsn4u5934cy3yg3bbtA
 80QXZO7AAAA
To: Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDAzNSBTYWx0ZWRfXyi9TS2w4RdJV
 b3YkDHGXXRTMbO4K+Q4PBAPgavG7G+EeiEPpkUv61siIWzlT+q7SEFSS9/Nw6e5jB/MeJI6rZcg
 yn0vYHITBSJO0TIcfoL1bdueZU7mYnOCDu7VcYGzxPwxlvlk13NjTDZ/2WCUJikcYAqRUwdkPZY
 U//J1A6g+Bdd/6lKpjnkW3s0uu3KVjgsPpeT2xuAA+aZ6KrUcrxZ1D+LLfbxiKj+uYMRAg/S/e5
 m1yBXS5qrOU2eu4txla2ASnEaAu6ESfD5ICfD6QjJRnYoOBVyUcgaqhrL1tGgufSCH0Npk2CDvf
 RUdqB1BuGix0zeZbM7MYuVNBeKbYEIFArcv3hmpBBwg+tiVGAHSc5c9MkkmuJPtDEmGdTtF6JLz
 e/yYGEQQH1TQ0rcjqnrIeOgsJP5MpGo/HPwFZ9Jza50zhhO64N1otzIGgbx0cV7/DGa5hOOa
X-Authority-Analysis: v=2.4 cv=VvEjA/2n c=1 sm=1 tr=0 ts=68524012 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=BsZwT7xNq_OLigDTsxMA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: jP82CHREDWo-NXXsq3relXl6O7WCw2rj
X-Proofpoint-ORIG-GUID: jP82CHREDWo-NXXsq3relXl6O7WCw2rj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_01,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506180035

Commit 70b0d6b0a199 ("tee: optee: Fix supplicant wait loop") made the
client wait as killable so it can be interrupted during shutdown or
after a supplicant crash. This changes the original lifetime expectations:
the client task can now terminate while the supplicant is still processing
its request.

If the client exits first it removes the request from its queue and
kfree()s it, while the request ID remains in supp->idr. A subsequent
lookup on the supplicant path then dereferences freed memory, leading to
a use-after-free.

Serialise access to the request with supp->mutex:

  * Hold supp->mutex in optee_supp_recv() and optee_supp_send() while
    looking up and touching the request.
  * Let optee_supp_thrd_req() notice that the client has terminated and
    signal optee_supp_send() accordingly.

With these changes the request cannot be freed while the supplicant still
has a reference, eliminating the race.

Fixes: 70b0d6b0a199 ("tee: optee: Fix supplicant wait loop")
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
Changes in v2:
- Replace the static variable with a sentinel value.
- Fix the issue with returning the popped request to the supplicant.
- Link to v1: https://lore.kernel.org/r/20250605-fix-use-after-free-v1-1-a70d23bff248@oss.qualcomm.com
---
 drivers/tee/optee/supp.c | 110 ++++++++++++++++++++++++++++++++---------------
 1 file changed, 75 insertions(+), 35 deletions(-)

diff --git a/drivers/tee/optee/supp.c b/drivers/tee/optee/supp.c
index d0f397c90242..fa39f5f226aa 100644
--- a/drivers/tee/optee/supp.c
+++ b/drivers/tee/optee/supp.c
@@ -9,6 +9,7 @@
 
 struct optee_supp_req {
 	struct list_head link;
+	int id;
 
 	bool in_queue;
 	u32 func;
@@ -19,6 +20,9 @@ struct optee_supp_req {
 	struct completion c;
 };
 
+/* It is temporary request used for invalid pending request in supp->idr. */
+#define INVALID_REQ_PTR ((struct optee_supp_req *)ERR_PTR(-ENOENT))
+
 void optee_supp_init(struct optee_supp *supp)
 {
 	memset(supp, 0, sizeof(*supp));
@@ -102,6 +106,7 @@ u32 optee_supp_thrd_req(struct tee_context *ctx, u32 func, size_t num_params,
 	mutex_lock(&supp->mutex);
 	list_add_tail(&req->link, &supp->reqs);
 	req->in_queue = true;
+	req->id = -1;
 	mutex_unlock(&supp->mutex);
 
 	/* Tell an eventual waiter there's a new request */
@@ -117,21 +122,40 @@ u32 optee_supp_thrd_req(struct tee_context *ctx, u32 func, size_t num_params,
 	if (wait_for_completion_killable(&req->c)) {
 		mutex_lock(&supp->mutex);
 		if (req->in_queue) {
+			/* Supplicant has not seen this request yet. */
 			list_del(&req->link);
 			req->in_queue = false;
+
+			ret = TEEC_ERROR_COMMUNICATION;
+		} else if (req->id  == -1) {
+			/*
+			 * Supplicant has processed this request. Ignore the
+			 * kill signal for now and submit the result.
+			 */
+			ret = req->ret;
+		} else {
+			/*
+			 * Supplicant is in the middle of processing this
+			 * request. Replace req with INVALID_REQ_PTR so that
+			 * the ID remains busy, causing optee_supp_send() to
+			 * fail on the next call to supp_pop_req() with this ID.
+			 */
+			idr_replace(&supp->idr, INVALID_REQ_PTR, req->id);
+			ret = TEEC_ERROR_COMMUNICATION;
 		}
+
 		mutex_unlock(&supp->mutex);
-		req->ret = TEEC_ERROR_COMMUNICATION;
+	} else {
+		ret = req->ret;
 	}
 
-	ret = req->ret;
 	kfree(req);
 
 	return ret;
 }
 
 static struct optee_supp_req  *supp_pop_entry(struct optee_supp *supp,
-					      int num_params, int *id)
+					      int num_params)
 {
 	struct optee_supp_req *req;
 
@@ -153,8 +177,8 @@ static struct optee_supp_req  *supp_pop_entry(struct optee_supp *supp,
 		return ERR_PTR(-EINVAL);
 	}
 
-	*id = idr_alloc(&supp->idr, req, 1, 0, GFP_KERNEL);
-	if (*id < 0)
+	req->id = idr_alloc(&supp->idr, req, 1, 0, GFP_KERNEL);
+	if (req->id < 0)
 		return ERR_PTR(-ENOMEM);
 
 	list_del(&req->link);
@@ -214,7 +238,6 @@ int optee_supp_recv(struct tee_context *ctx, u32 *func, u32 *num_params,
 	struct optee *optee = tee_get_drvdata(teedev);
 	struct optee_supp *supp = &optee->supp;
 	struct optee_supp_req *req = NULL;
-	int id;
 	size_t num_meta;
 	int rc;
 
@@ -223,16 +246,47 @@ int optee_supp_recv(struct tee_context *ctx, u32 *func, u32 *num_params,
 		return rc;
 
 	while (true) {
-		mutex_lock(&supp->mutex);
-		req = supp_pop_entry(supp, *num_params - num_meta, &id);
-		mutex_unlock(&supp->mutex);
+		scoped_guard(mutex, &supp->mutex) {
+			req = supp_pop_entry(supp, *num_params - num_meta);
+			if (!req)
+				goto wait_for_request;
 
-		if (req) {
 			if (IS_ERR(req))
 				return PTR_ERR(req);
-			break;
+
+			/*
+			 * Process the request while holding the lock,
+			 * so that optee_supp_thrd_req() doesn't pull the
+			 * request out from under us.
+			 */
+
+			if (num_meta) {
+				/*
+				 * tee-supplicant support meta parameters ->
+				 * requests can be processed asynchronously.
+				 */
+				param->attr =
+					TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT |
+					TEE_IOCTL_PARAM_ATTR_META;
+				param->u.value.a = req->id;
+				param->u.value.b = 0;
+				param->u.value.c = 0;
+			} else {
+				supp->req_id = req->id;
+			}
+
+			*func = req->func;
+			*num_params = req->num_params + num_meta;
+			memcpy(param + num_meta, req->param,
+			       sizeof(struct tee_param) * req->num_params);
+
+			return 0;
 		}
 
+		/* Check for the next request in the queue. */
+		continue;
+
+wait_for_request:
 		/*
 		 * If we didn't get a request we'll block in
 		 * wait_for_completion() to avoid needless spinning.
@@ -245,27 +299,6 @@ int optee_supp_recv(struct tee_context *ctx, u32 *func, u32 *num_params,
 			return -ERESTARTSYS;
 	}
 
-	if (num_meta) {
-		/*
-		 * tee-supplicant support meta parameters -> requsts can be
-		 * processed asynchronously.
-		 */
-		param->attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT |
-			      TEE_IOCTL_PARAM_ATTR_META;
-		param->u.value.a = id;
-		param->u.value.b = 0;
-		param->u.value.c = 0;
-	} else {
-		mutex_lock(&supp->mutex);
-		supp->req_id = id;
-		mutex_unlock(&supp->mutex);
-	}
-
-	*func = req->func;
-	*num_params = req->num_params + num_meta;
-	memcpy(param + num_meta, req->param,
-	       sizeof(struct tee_param) * req->num_params);
-
 	return 0;
 }
 
@@ -297,12 +330,19 @@ static struct optee_supp_req *supp_pop_req(struct optee_supp *supp,
 	if (!req)
 		return ERR_PTR(-ENOENT);
 
+	/* optee_supp_thrd_req() already returned to optee. */
+	if (IS_ERR(req))
+		goto failed_req;
+
 	if ((num_params - nm) != req->num_params)
 		return ERR_PTR(-EINVAL);
 
+	req->id = -1;
+	*num_meta = nm;
+failed_req:
 	idr_remove(&supp->idr, id);
 	supp->req_id = -1;
-	*num_meta = nm;
+
 
 	return req;
 }
@@ -328,9 +368,8 @@ int optee_supp_send(struct tee_context *ctx, u32 ret, u32 num_params,
 
 	mutex_lock(&supp->mutex);
 	req = supp_pop_req(supp, num_params, param, &num_meta);
-	mutex_unlock(&supp->mutex);
-
 	if (IS_ERR(req)) {
+		mutex_unlock(&supp->mutex);
 		/* Something is wrong, let supplicant restart. */
 		return PTR_ERR(req);
 	}
@@ -358,6 +397,7 @@ int optee_supp_send(struct tee_context *ctx, u32 ret, u32 num_params,
 
 	/* Let the requesting thread continue */
 	complete(&req->c);
+	mutex_unlock(&supp->mutex);
 
 	return 0;
 }

---
base-commit: 3be1a7a31fbda82f3604b6c31e4f390110de1b46
change-id: 20250604-fix-use-after-free-8ff1b5d5d774

Best regards,
-- 
Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

