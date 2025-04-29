Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B03274662
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745906822; cv=none; b=tHTQYpt+RtuEq3cEQ+bxLY5l1qTccaatCXas3uJ07zS+dZ11ixMSN+7krnr+RuhkjC5EcrF/gc677PcWItuX6eWp2lZQkndNQbjiyjUPmnZh0gCeNCRS8JtJirsUPxMsY8K+Cb5ePAF8ppwwuGKpWrwK36+xMkjGnwXp9aKkmDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745906822; c=relaxed/simple;
	bh=L1aYNBugHemRKih8UZAQrKIGP4q+CkmcvzSHZrTkdJw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nxoogVMTbsANNemj2ZGPiLGNbr7aQ7ZepD1dQFyppiVQ1AFo5UUvaJy5rrwvIu00BFtSr4TCJRIi2pG5QQIl+rIQOEq8SPHoiIOZUceF6NNg7Y6l3cLx3pNuKAudr7ilmNsy7/U63332enX+MxyiT6+MZqBg7Tb30/fdt54kXok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dQAwOahF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dQAwOahF"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNq1jA023841
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:07:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dnQ9ZvYmV3x3P6q8kxc8hFtmLDbG/Ebqq3P0pryF11M=; b=dQAwOahFBkP6mJIx
	cPHWb7aG6pA+zzilINQNCxYb7bSH46qPC+02Fj7txiHB2cdi+6aEdEY0rA9Qc91L
	ROtrefsQ70nm/R8tijnTYBSq5hPSr1Qn3SO62dOpGQAQMELcEeUApSj/hiibh1Xw
	xJ7ehz7puGgpostzR6SbSsUIgEFfmccBJamwVlphv4x2qdV0SxGqLAm5AswR6TPz
	ljKWO0kMXXeRId717WS4wbiCKYiDW/G6qK5yb5s6lrPA7IWofDZUkmCc0NwgAXd5
	ohTEpV0mqdVzML7Rw57/7Antq/qUh3rqLhqQR+6Z5TOYaMnsCwYVzbfO5thqGh/l
	n1b7UA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468muqkm26-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:07:00 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-736bf7eb149so3778454b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 23:06:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745906819; x=1746511619;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dnQ9ZvYmV3x3P6q8kxc8hFtmLDbG/Ebqq3P0pryF11M=;
        b=TJ2ZlAR4Lv84K+4IK/NdfzrMDz+nXHYAcQdJ3bAu4TpdbSQao6Wm+woDDQRA1G35Oe
         IfYj4P0XhOiZi4NYsFLjXASVykloB+WZIT/gY/2gLKi+MJO53kxww4J81EVVz7VnbsAU
         Id9f0Cr9Ki4zqIxw5oMGQOntLDHIQhwedJPpLu/jg3vdJeqA3ib8aGdqlNPvydv9pYO/
         1HflE6ePND32G2put7CGwRMCG9Ywy6HTaqHXm/NOiqwsCMZY8YqzUYN6vg/Y/FQCJ00N
         4qc4fUFQ3AvAkEufojPFMqVJka1JwrU3i/MxFgx4gOPTGvVA8jXUB+vi6A189IkkazyI
         CS1A==
X-Forwarded-Encrypted: i=1; AJvYcCX2IA/f/zjmL7gnM0a6rYQ8lcuyoZSXrvFQlWktgtJXMavkvB7WNT0ZXeXFIXd5tqAEsiuFOmMCrp0iRWI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwU5ytNqZIjHBKqSQnrbKqChsL1tqYVqn4xpsN1CGHH4+9eGYD1
	JbTOkCXaP0NB9pRemC2+gHOx01ivMAsB2HuH28uWvHvf/S5QZ1rb+dXKaNEdT7nATm0Z68zssTD
	ItKCrp6HYdqHMG3knKBzGkbjTT0ulVjSwNOw8tb9qVvFxRcM5aBMe1zkEbDT5Gw==
X-Gm-Gg: ASbGncs6bTJlB54XBxwvg3jrNSrUpa/ym7iGErGMaNTPyvw6A0dSkOEBmQ1DIxL3Vgx
	QrVEIi6PwCq833cJ9ptEMH8l16YZhuQPKt0qDKmNUJ1u6i8UKalQ75vAfaYp0xF5Y8P2YAwpdj8
	Arbu/z+RuVp6KH8l2gkQ9cWV9p2qtExAcfEN6lI179sRjpKUcbFSDHb/ksxSDGVdJSWQMnN6DZ3
	GJfYVqRubbb0X9ls7WS/RAwX/cvnFv6fu6Z2QHGdARHqOKPxwLixawJZXW5Wees0IEdz6iggVqs
	ce6Pqmvfe5Spsq8Zf8bLnJeaMRnBR66f+Of3cwkx0GU2i47QVnuF/Oy0pn9AlFynxkbuJJs=
X-Received: by 2002:a05:6a21:3e05:b0:1ee:e96a:d9ed with SMTP id adf61e73a8af0-2095b1f5f89mr2175857637.7.1745906818203;
        Mon, 28 Apr 2025 23:06:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHulkgSXpMufhY1kolwNeYf5vPD6BLjF1B7cv5zN7UHcdV02UCghJAy548hFwhdTnMqNVbqg==
X-Received: by 2002:a05:6a21:3e05:b0:1ee:e96a:d9ed with SMTP id adf61e73a8af0-2095b1f5f89mr2175831637.7.1745906817824;
        Mon, 28 Apr 2025 23:06:57 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25acd9cbsm9353642b3a.174.2025.04.28.23.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 23:06:57 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 23:06:23 -0700
Subject: [PATCH v4 02/11] tee: add close_context to TEE driver operation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-2-6a143640a6cb@oss.qualcomm.com>
References: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-0-6a143640a6cb@oss.qualcomm.com>
In-Reply-To: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-0-6a143640a6cb@oss.qualcomm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Apurupa Pattapu <quic_apurupa@quicinc.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-doc@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA0NCBTYWx0ZWRfX3TdwsekqMnn3 vJLBWlQhR5vhi9Z7Udd6YRKIhP7bbIL3OOiyD8Zq6TcU8yUZT0f8jOikFZv7TSUWxJWNUrJR4OG fK3tZp//8NbWMqo/zpWdnQGlTItmWSeclr3lJF5g7wjMChwH5iUT26hzSnH4E4kYBoBsGLZoUd0
 7LV8yTBxA/6t4tfk36+kzU/Rg9SxtVUHFEmAiTGzst+MupKs3CZaHhQANJTmmHnNKA4OikRMv6B zcP8ksnkeE+x32sKVamdsK1uw9YySXshDedPS/sUU7j2i9fZwPP2x3eNP9hc7YFZ6orhVUEa870 breooPe+e6rqKgBbxzlAF71qKa3PaG4gMSQPfPw1+jnQqb9pHwTx1jcRoYVEcW0awKw0humdjMt
 0cUQlXJQLqMLL24mzvIoIjcfrbrmAp9H61BU4ktwiyd/SuEaJCixAVgVSv5l0Btq7QrePXZt
X-Proofpoint-GUID: 8Lr33URvr5Z0uwzknhe3vF8CM7rvGBVA
X-Proofpoint-ORIG-GUID: 8Lr33URvr5Z0uwzknhe3vF8CM7rvGBVA
X-Authority-Analysis: v=2.4 cv=M/5NKzws c=1 sm=1 tr=0 ts=68106c84 cx=c_pps a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=0l_YNDiMcOfTHwIteTYA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290044

The tee_context can be used to manage TEE user resources, including
those allocated by the driver for the TEE on behalf of the user.
The release() callback is invoked only when all resources, such as
tee_shm, are released and there are no references to the tee_context.

When a user closes the device file, the driver should notify the
TEE to release any resources it may hold and drop the context
references. To achieve this, a close_context() callback is
introduced to initiate resource release in the TEE driver when
the device file is closed.

Relocate teedev_ctx_get, teedev_ctx_put, tee_device_get, and
tee_device_get functions to tee_core.h to make them accessible
outside the TEE subsystem.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/tee_core.c    |  7 +++++++
 drivers/tee/tee_private.h |  6 ------
 include/linux/tee_core.h  | 50 +++++++++++++++++++++++++++++++++++++++++++++--
 3 files changed, 55 insertions(+), 8 deletions(-)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index 24edce4cdbaa..721522fe5c63 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -79,6 +79,7 @@ void teedev_ctx_get(struct tee_context *ctx)
 
 	kref_get(&ctx->refcount);
 }
+EXPORT_SYMBOL_GPL(teedev_ctx_get);
 
 static void teedev_ctx_release(struct kref *ref)
 {
@@ -96,11 +97,15 @@ void teedev_ctx_put(struct tee_context *ctx)
 
 	kref_put(&ctx->refcount, teedev_ctx_release);
 }
+EXPORT_SYMBOL_GPL(teedev_ctx_put);
 
 void teedev_close_context(struct tee_context *ctx)
 {
 	struct tee_device *teedev = ctx->teedev;
 
+	if (teedev->desc->ops->close_context)
+		teedev->desc->ops->close_context(ctx);
+
 	teedev_ctx_put(ctx);
 	tee_device_put(teedev);
 }
@@ -1037,6 +1042,7 @@ void tee_device_put(struct tee_device *teedev)
 	}
 	mutex_unlock(&teedev->mutex);
 }
+EXPORT_SYMBOL_GPL(tee_device_put);
 
 bool tee_device_get(struct tee_device *teedev)
 {
@@ -1049,6 +1055,7 @@ bool tee_device_get(struct tee_device *teedev)
 	mutex_unlock(&teedev->mutex);
 	return true;
 }
+EXPORT_SYMBOL_GPL(tee_device_get);
 
 /**
  * tee_device_unregister() - Removes a TEE device
diff --git a/drivers/tee/tee_private.h b/drivers/tee/tee_private.h
index 9bc50605227c..d3f40a03de36 100644
--- a/drivers/tee/tee_private.h
+++ b/drivers/tee/tee_private.h
@@ -14,12 +14,6 @@
 
 int tee_shm_get_fd(struct tee_shm *shm);
 
-bool tee_device_get(struct tee_device *teedev);
-void tee_device_put(struct tee_device *teedev);
-
-void teedev_ctx_get(struct tee_context *ctx);
-void teedev_ctx_put(struct tee_context *ctx);
-
 struct tee_shm *tee_shm_alloc_user_buf(struct tee_context *ctx, size_t size);
 struct tee_shm *tee_shm_register_user_buf(struct tee_context *ctx,
 					  unsigned long addr, size_t length);
diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
index a38494d6b5f4..284ca6b3e03a 100644
--- a/include/linux/tee_core.h
+++ b/include/linux/tee_core.h
@@ -65,8 +65,9 @@ struct tee_device {
 /**
  * struct tee_driver_ops - driver operations vtable
  * @get_version:	returns version of driver
- * @open:		called when the device file is opened
- * @release:		release this open file
+ * @open:		called for a context when the device file is opened
+ * @close_context:	called when the device file is closed
+ * @release:		called to release the context
  * @open_session:	open a new session
  * @close_session:	close a session
  * @system_session:	declare session as a system session
@@ -76,11 +77,17 @@ struct tee_device {
  * @supp_send:		called for supplicant to send a response
  * @shm_register:	register shared memory buffer in TEE
  * @shm_unregister:	unregister shared memory buffer in TEE
+ *
+ * The context given to @open might last longer than the device file if it is
+ * tied to other resources in the TEE driver. @close_context is called when the
+ * client closes the device file, even if there are existing references to the
+ * context. The TEE driver can use @close_context to start cleaning up.
  */
 struct tee_driver_ops {
 	void (*get_version)(struct tee_device *teedev,
 			    struct tee_ioctl_version_data *vers);
 	int (*open)(struct tee_context *ctx);
+	void (*close_context)(struct tee_context *ctx);
 	void (*release)(struct tee_context *ctx);
 	int (*open_session)(struct tee_context *ctx,
 			    struct tee_ioctl_open_session_arg *arg,
@@ -154,6 +161,24 @@ int tee_device_register(struct tee_device *teedev);
  */
 void tee_device_unregister(struct tee_device *teedev);
 
+/**
+ * tee_device_get() - Increment the user count for a tee_device
+ * @teedev: Pointer to the tee_device
+ *
+ * If tee_device_unregister() has been called and the final user of @teedev
+ * has already released the device, this function will fail to prevent new users
+ * from accessing the device during the unregistration process.
+ *
+ * Returns: true if @teedev remains valid, otherwise false
+ */
+bool tee_device_get(struct tee_device *teedev);
+
+/**
+ * tee_device_put() - Decrease the user count for a tee_device
+ * @teedev: pointer to the tee_device
+ */
+void tee_device_put(struct tee_device *teedev);
+
 /**
  * tee_device_set_dev_groups() - Set device attribute groups
  * @teedev:	Device to register
@@ -315,4 +340,25 @@ struct tee_context *teedev_open(struct tee_device *teedev);
  */
 void teedev_close_context(struct tee_context *ctx);
 
+/**
+ * teedev_ctx_get() - Increment the reference count of a context
+ * @ctx: Pointer to the context
+ *
+ * This function increases the refcount of the context, which is tied to
+ * resources shared by the same tee_device. During the unregistration process,
+ * the context may remain valid even after tee_device_unregister() has returned.
+ *
+ * Users should ensure that the context's refcount is properly decreased before
+ * calling tee_device_put(), typically within the context's release() function.
+ * Alternatively, users can call tee_device_get() and teedev_ctx_get() together
+ * and release them simultaneously (see shm_alloc_helper()).
+ */
+void teedev_ctx_get(struct tee_context *ctx);
+
+/**
+ * teedev_ctx_put() - Decrease reference count on a context
+ * @ctx: pointer to the context
+ */
+void teedev_ctx_put(struct tee_context *ctx);
+
 #endif /*__TEE_CORE_H*/

-- 
2.34.1

