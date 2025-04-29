Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065502741C8
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745906826; cv=none; b=YXxYavuXoloabrSnw5LHpCXBV8pF8W28CLJhbimcy5TqjsknCAv2d6ot3q0kj3G0kQT4+fpWM7y+XGJjUVVIsGzRaSEO5rerwtQAYRK6BNJ7O18PvawQ8eoOJmHxaUo4eSLq2gNjqwCvX10beN3R8qDYHFZBBD4E7DvPnpBo410=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745906826; c=relaxed/simple;
	bh=hec8UTOVXl69wb9lp8BTknO+2nJjRvi97d7lNb2Uw90=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aCuwdJnXZP2ZvpnbMj8fjpJBFWCOBxXUNR4u0prGO19iwdcwTCNzep5/GfGbBa1AN9C9IxOOpN1V7OMFWdlRRWQKuP+9wLBSTwwnhxori8uuqdlubIlyztV/uleN6hBZFAND7otmUZOTrC7sOCNq7XlporHSY3212m9jq73SBc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b2Qi97rK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b2Qi97rK"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNqNZ6012634
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nqaSzHCbIu6hmV519m/rD6Dou/IY7N09Q8GeFAdiYcA=; b=b2Qi97rKDRqJH7rz
	ra47+8sjYSo1ttkS/YayqpjFxPIGR4olVTykP5PzGGmnAP+hgdFs3xEiNljzdUbj
	VDIh7VBGlCyz6l/v6fZ5LTkodgVIYmQGpdpnVyAx1McgwUqaw8hjrs2Vy0PwaORp
	On4YlWpaW6m/PTDGRNrDaCNyJ987T+cHE8yv0vApI24ZVheaqpvs0shc7z95QZAX
	3vm+0V/HgO0I8HuZstj/BsXgivXCwW7NHq849NBthG5Njtzh3gvJw7rba8TdEnPp
	V9exiXy3VnkiarhqiiJodupru637AsCjp6pBA+OQoeIXvPXkaThwj1jfGELAeU8K
	HEMuUw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468q323crf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:07:03 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-736c1ea954fso2853707b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 23:07:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745906822; x=1746511622;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nqaSzHCbIu6hmV519m/rD6Dou/IY7N09Q8GeFAdiYcA=;
        b=ni22dGWOnlDGAlD61JDcUZki93xqUu7kHWj/IAlAHIyuP/MaHyBiya/XzrXalqXAt4
         tF8kpYeKIZqXLmvkTMwKisuLqU4p5bzuFneCmuQ+fhbheKIK29/K+2+spMpF0wob5iUc
         q0oBtncfJxsYZRKV9Xus1efj1WKkmCXrQ4w6OB1lvwxWBBi/it4fkUQsKPwg0ONgL8tk
         dUTTOL3TBbiQ5yAheWvMl0jIaMYzRQNBw1j3P0cpxcf+rD4EPwZx0W8RCoOz4m0BmJLT
         w0EAwfH8pt7Q0KZIdn3ezpWYMKAMI+P7/KoltEgrDqrII6eHZL/Pmh1qkbT0hnH5jxGT
         zgEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrBpeQPAE9nfV8c5jmAE0sPoXpWGYiIVik4GVjUcMqtDZ+rh5YJmtyNsAyzFChj2xnE1ajv4DDe9mUwlE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZLTra4hB87RGCrlHIagc/CI+3ZKzW+cONrT4Ggr7pV1sSrsnz
	JxGoik5e5/JsSAbpif5ERkcofmzZIdBuR0j9GuvgKlFr+pmf9fCAYN4znQw6VAocvW8urJuv/TO
	JSloKBXyj2CUhHJBDcC3rchq6Y69i0b7cP2VY93uhdmAe7NuV/E8p0ADKZ3VtDg==
X-Gm-Gg: ASbGncvqy1xnTyE+mB9mARjDvCVMeYm3WKw5JEBVnYHCQZC4hGypiEYNqzXRxd0NHL/
	rqIPu4QmKG+GtJkdkybiSVBZZxldSq/rNmBS/FxuckdsrXfMJD6m31vvvmF0LmSonRGtN9m/D3G
	XznCAOKXuyIww01/qQtFTqeVVTy1tq0VS+MJUfPGeb4WV99fKAs1PBJbvOJbR7WcvxlIh4IrywF
	kUNXIoX+URHncAG57k4kXrXSEZHFImvdj1jxbkE37v2PhraBUOEEZ1xw4BaVcRs4YfQzI4l1/h9
	MU9ljJTGSIdpmf/Ahid+TToGuMgbuu4k7riPKYPuWgTcPMvvdMEZXrMN/ZE+l0H9otG5K2Y=
X-Received: by 2002:a05:6a00:39a8:b0:736:5725:59b9 with SMTP id d2e1a72fcca58-74028f9268emr2549222b3a.2.1745906821634;
        Mon, 28 Apr 2025 23:07:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFEv6V5Tpr84FeHF/ZfJGFbkoO4ix0Gt3nO+nBQUToA9zLuAbRhNmsOjQ3n+amprRdKJ+VFg==
X-Received: by 2002:a05:6a00:39a8:b0:736:5725:59b9 with SMTP id d2e1a72fcca58-74028f9268emr2549177b3a.2.1745906821225;
        Mon, 28 Apr 2025 23:07:01 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25acd9cbsm9353642b3a.174.2025.04.28.23.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 23:07:00 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 23:06:25 -0700
Subject: [PATCH v4 04/11] tee: add TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-4-6a143640a6cb@oss.qualcomm.com>
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
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Authority-Analysis: v=2.4 cv=M7xNKzws c=1 sm=1 tr=0 ts=68106c87 cx=c_pps a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=fw-SQdjKjSnpQ1BqlTsA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: LO41jeDYItGzdoI2PRB3H4cjYnxi9Nlm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA0NCBTYWx0ZWRfX4kTpiNyF3ENN SD+8K6oeQq4qlhBV7c5ZNT7XZ9Z2wgW75GfcpKx6DmJkaA9tDvpx2oMZafZTBzSUpBzKQAkpXQZ t0YfhSsR44zGUvPpMHbqAApj7L6dYchk1IpCV4JzAum6hII/AM8RlIp2zkgbbsdOvx5CS6RFN1P
 Mm7ENeD8UyDF5I9IEY7sjXhoX9qo8RpQvtuHT5l+xi9Ixs78cR5454b6FHQKczjuJCdCm087b5A vWDy8HlLlJPT5WbcxPzrngGw3V6RebiTJWxl5Mlb0xhwIV5wIW/oeFxocdn0unB5VyUV+PHzPjI A8n+6f3UW2PXcGgTEzDEBC2hWYSHwKe68TpX/+6xbpKihUkIoj33BNBdpuEnHZMzdK9xL2JyrPN
 Uy0Pso+SlNOpXhJOU1XIOavS7r/mQxfuqpF/WyYsZy6t2xEVm0fvb3d6qeoHEudZU6xwsHE0
X-Proofpoint-ORIG-GUID: LO41jeDYItGzdoI2PRB3H4cjYnxi9Nlm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=999 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290044

The TEE subsystem allows session-based access to trusted services,
requiring a session to be established to receive a service. This
is not suitable for an environment that represents services as objects.
An object supports various operations that a client can invoke,
potentially generating a result or a new object that can be invoked
independently of the original object.

Add TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT/OUTPUT/INOUT to represent an
object. Objects may reside in either TEE or userspace. To invoke an
object in TEE, introduce a new ioctl. Use the existing SUPPL_RECV and
SUPPL_SEND to invoke an object in userspace.

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/tee_core.c   | 85 ++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/tee_core.h |  4 +++
 include/linux/tee_drv.h  |  6 ++++
 include/uapi/linux/tee.h | 41 +++++++++++++++++++----
 4 files changed, 130 insertions(+), 6 deletions(-)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index 7bf265c4ac65..fde8fab58398 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -379,6 +379,7 @@ static int params_from_user(struct tee_context *ctx, struct tee_param *params,
 		switch (ip.attr & TEE_IOCTL_PARAM_ATTR_TYPE_MASK) {
 		case TEE_IOCTL_PARAM_ATTR_TYPE_NONE:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT:
+		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT:
 			break;
 		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT:
@@ -397,6 +398,11 @@ static int params_from_user(struct tee_context *ctx, struct tee_param *params,
 				return -EFAULT;
 
 			break;
+		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT:
+		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INOUT:
+			params[n].u.objref.id = ip.a;
+			params[n].u.objref.flags = ip.b;
+			break;
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
@@ -470,6 +476,12 @@ static int params_to_user(struct tee_ioctl_param __user *uparams,
 			if (put_user((u64)p->u.ubuf.size, &up->b))
 				return -EFAULT;
 			break;
+		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT:
+		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INOUT:
+			if (put_user(p->u.objref.id, &up->a) ||
+			    put_user(p->u.objref.flags, &up->b))
+				return -EFAULT;
+			break;
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
 			if (put_user((u64)p->u.memref.size, &up->b))
@@ -622,6 +634,66 @@ static int tee_ioctl_invoke(struct tee_context *ctx,
 	return rc;
 }
 
+static int tee_ioctl_object_invoke(struct tee_context *ctx,
+				   struct tee_ioctl_buf_data __user *ubuf)
+{
+	int rc;
+	size_t n;
+	struct tee_ioctl_buf_data buf;
+	struct tee_ioctl_object_invoke_arg __user *uarg;
+	struct tee_ioctl_object_invoke_arg arg;
+	struct tee_ioctl_param __user *uparams = NULL;
+	struct tee_param *params = NULL;
+
+	if (!ctx->teedev->desc->ops->object_invoke_func)
+		return -EINVAL;
+
+	if (copy_from_user(&buf, ubuf, sizeof(buf)))
+		return -EFAULT;
+
+	if (buf.buf_len > TEE_MAX_ARG_SIZE ||
+	    buf.buf_len < sizeof(struct tee_ioctl_object_invoke_arg))
+		return -EINVAL;
+
+	uarg = u64_to_user_ptr(buf.buf_ptr);
+	if (copy_from_user(&arg, uarg, sizeof(arg)))
+		return -EFAULT;
+
+	if (sizeof(arg) + TEE_IOCTL_PARAM_SIZE(arg.num_params) != buf.buf_len)
+		return -EINVAL;
+
+	if (arg.num_params) {
+		params = kcalloc(arg.num_params, sizeof(struct tee_param),
+				 GFP_KERNEL);
+		if (!params)
+			return -ENOMEM;
+		uparams = uarg->params;
+		rc = params_from_user(ctx, params, arg.num_params, uparams);
+		if (rc)
+			goto out;
+	}
+
+	rc = ctx->teedev->desc->ops->object_invoke_func(ctx, &arg, params);
+	if (rc)
+		goto out;
+
+	if (put_user(arg.ret, &uarg->ret)) {
+		rc = -EFAULT;
+		goto out;
+	}
+	rc = params_to_user(uparams, arg.num_params, params);
+out:
+	if (params) {
+		/* Decrease ref count for all valid shared memory pointers */
+		for (n = 0; n < arg.num_params; n++)
+			if (tee_param_is_memref(params + n) &&
+			    params[n].u.memref.shm)
+				tee_shm_put(params[n].u.memref.shm);
+		kfree(params);
+	}
+	return rc;
+}
+
 static int tee_ioctl_cancel(struct tee_context *ctx,
 			    struct tee_ioctl_cancel_arg __user *uarg)
 {
@@ -677,6 +749,12 @@ static int params_to_supp(struct tee_context *ctx,
 			ip.b = p->u.ubuf.size;
 			ip.c = 0;
 			break;
+		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT:
+		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INOUT:
+			ip.a = p->u.objref.id;
+			ip.b = p->u.objref.flags;
+			ip.c = 0;
+			break;
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
@@ -789,6 +867,11 @@ static int params_from_supp(struct tee_param *params, size_t num_params,
 				return -EFAULT;
 
 			break;
+		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT:
+		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INOUT:
+			p->u.objref.id = ip.a;
+			p->u.objref.flags = ip.b;
+			break;
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
 			/*
@@ -869,6 +952,8 @@ static long tee_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		return tee_ioctl_open_session(ctx, uarg);
 	case TEE_IOC_INVOKE:
 		return tee_ioctl_invoke(ctx, uarg);
+	case TEE_IOC_OBJECT_INVOKE:
+		return tee_ioctl_object_invoke(ctx, uarg);
 	case TEE_IOC_CANCEL:
 		return tee_ioctl_cancel(ctx, uarg);
 	case TEE_IOC_CLOSE_SESSION:
diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
index 284ca6b3e03a..eb891de81e12 100644
--- a/include/linux/tee_core.h
+++ b/include/linux/tee_core.h
@@ -72,6 +72,7 @@ struct tee_device {
  * @close_session:	close a session
  * @system_session:	declare session as a system session
  * @invoke_func:	invoke a trusted function
+ * @object_invoke_func:	invoke a TEE object
  * @cancel_req:		request cancel of an ongoing invoke or open
  * @supp_recv:		called for supplicant to get a command
  * @supp_send:		called for supplicant to send a response
@@ -97,6 +98,9 @@ struct tee_driver_ops {
 	int (*invoke_func)(struct tee_context *ctx,
 			   struct tee_ioctl_invoke_arg *arg,
 			   struct tee_param *param);
+	int (*object_invoke_func)(struct tee_context *ctx,
+				  struct tee_ioctl_object_invoke_arg *arg,
+				  struct tee_param *param);
 	int (*cancel_req)(struct tee_context *ctx, u32 cancel_id, u32 session);
 	int (*supp_recv)(struct tee_context *ctx, u32 *func, u32 *num_params,
 			 struct tee_param *param);
diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
index 78bbf12f02f0..3b34fdcc855f 100644
--- a/include/linux/tee_drv.h
+++ b/include/linux/tee_drv.h
@@ -87,6 +87,11 @@ struct tee_param_ubuf {
 	size_t size;
 };
 
+struct tee_param_objref {
+	u64 id;
+	u64 flags;
+};
+
 struct tee_param_value {
 	u64 a;
 	u64 b;
@@ -97,6 +102,7 @@ struct tee_param {
 	u64 attr;
 	union {
 		struct tee_param_memref memref;
+		struct tee_param_objref objref;
 		struct tee_param_ubuf ubuf;
 		struct tee_param_value value;
 	} u;
diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
index 3e9b1ec5dfde..441d97add53f 100644
--- a/include/uapi/linux/tee.h
+++ b/include/uapi/linux/tee.h
@@ -48,8 +48,10 @@
 #define TEE_GEN_CAP_PRIVILEGED	(1 << 1)/* Privileged device (for supplicant) */
 #define TEE_GEN_CAP_REG_MEM	(1 << 2)/* Supports registering shared memory */
 #define TEE_GEN_CAP_MEMREF_NULL	(1 << 3)/* NULL MemRef support */
+#define TEE_GEN_CAP_OBJREF	(1 << 4)/* Supports generic object reference */
 
-#define TEE_MEMREF_NULL		(__u64)(-1) /* NULL MemRef Buffer */
+#define TEE_MEMREF_NULL		((__u64)(-1)) /* NULL MemRef Buffer */
+#define TEE_OBJREF_NULL		((__u64)(-1)) /* NULL ObjRef Object */
 
 /*
  * TEE Implementation ID
@@ -158,6 +160,13 @@ struct tee_ioctl_buf_data {
 #define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT	9
 #define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT	10	/* input and output */
 
+/*
+ * These defines object reference parameters.
+ */
+#define TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT	11
+#define TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT	12
+#define TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INOUT	13
+
 /*
  * Mask for the type part of the attribute, leaves room for more types
  */
@@ -195,15 +204,16 @@ struct tee_ioctl_buf_data {
  * @attr: attributes
  * @a: if a memref, offset into the shared memory object,
  *     else if a ubuf, address of the user buffer,
- *     else a value parameter
- * @b: if a memref or ubuf, size of the buffer, else a value parameter
+ *     else if an objref, object identifier, else a value parameter
+ * @b: if a memref or ubuf, size of the buffer,
+ *     else if objref, flags for the object, else a value parameter
  * @c: if a memref, shared memory identifier, else a value parameter
  *
  * @attr & TEE_PARAM_ATTR_TYPE_MASK indicates if memref, ubuf, or value is
  * used in the union. TEE_PARAM_ATTR_TYPE_VALUE_* indicates value,
- * TEE_PARAM_ATTR_TYPE_MEMREF_* indicates memref, and TEE_PARAM_ATTR_TYPE_UBUF_*
- * indicates ubuf. TEE_PARAM_ATTR_TYPE_NONE indicates that none of the members
- * are used.
+ * TEE_PARAM_ATTR_TYPE_MEMREF_* indicates memref, TEE_PARAM_ATTR_TYPE_UBUF_*
+ * indicates ubuf, and TEE_PARAM_ATTR_TYPE_OBJREF_* indicates objref.
+ * TEE_PARAM_ATTR_TYPE_NONE indicates that none of the members are used.
  *
  * Shared memory is allocated with TEE_IOC_SHM_ALLOC which returns an
  * identifier representing the shared memory object. A memref can reference
@@ -411,4 +421,23 @@ struct tee_ioctl_shm_register_data {
  * munmap(): unmaps previously shared memory
  */
 
+/**
+ * struct tee_ioctl_invoke_func_arg - Invokes an object in a Trusted Application
+ * @id:		[in] Object id
+ * @op:		[in] Object operation, specific to the object
+ * @ret:	[out] return value
+ * @num_params	[in] number of parameters following this struct
+ */
+struct tee_ioctl_object_invoke_arg {
+	__u64 id;
+	__u32 op;
+	__u32 ret;
+	__u32 num_params;
+	/* num_params tells the actual number of element in params */
+	struct tee_ioctl_param params[];
+};
+
+#define TEE_IOC_OBJECT_INVOKE	_IOR(TEE_IOC_MAGIC, TEE_IOC_BASE + 10, \
+				     struct tee_ioctl_buf_data)
+
 #endif /*__TEE_H*/

-- 
2.34.1

