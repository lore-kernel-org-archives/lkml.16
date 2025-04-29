Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA802777F9
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745906834; cv=none; b=YrXMn2qZKyDnN6Yb0fvvapDt/HrkdcH92XVR5JH5Qmf/rc1C/eial93FUvsU8O12Kh20zkbnppJwEw3CGZBhUQ7xR5U0g1laIFtMLh9MKKZNaL43y5Jc2cXtkSRrct9icpHMpG/arTFheu4vWcB1c+SaUNmlhYix8tM1uzyO3nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745906834; c=relaxed/simple;
	bh=gRSWjiLARrzmQRjZB5msPGkCXYVjyOfXLJXcn1Bq8mI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GAzcENxMZRvVgBHgROGQPEHfOZA5cqR3GU6Za4msj1l+6NzR1bI70iAMM78CdwM5ND9GPPMslAbYjdLy4u/OsG/PoH7d4BXchPmCjubCTH+TK4MuahGHUBKTFfQzcXgHmNJiNMVEDIkqGmGjLmUyUQIX0vTlYJZXOLzWeC7QDIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NxkJKZPG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NxkJKZPG"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNq955025304
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:07:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Do1ywL2aPWTcX1TQtpVzcVjGBq9aILCb5vCCA7xohNA=; b=NxkJKZPGJwcm8SdG
	DOtY9IFdfS1/xRc257+yHF6FsqpLUsbX1FJnWEgpV7Ob4bN11jSB8EP6LYP8otrl
	rwb8w7UZLnxSKJ3f74F6Mh8OVltlEN+jOBWU1KNxwDBh+DEppYmrzbektOdhm9v8
	rfYauelfA66RsM3j+ultj0PrdvHSdWts4Y6Ba/1FZCYu6bV+tADspUS8UNC0SnnL
	7K79LlIMIpNTW50yKWh8agm9EA8FzIJjUZGykwZKn9ByteuNJ0zJtXpHdTrAto27
	NJAHbXPXhkccBUaS4DlGISWc/qqWM1NnjLqn4XTwK3sEqt4ECURxLBQHQNBaNfwr
	Et3P/w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468muqkm3d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:07:11 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-736cb72efd5so4208961b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 23:07:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745906830; x=1746511630;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Do1ywL2aPWTcX1TQtpVzcVjGBq9aILCb5vCCA7xohNA=;
        b=AoVxp5j8Q81YrpKzS4xu+F2N2/3z8Z0M2WrsTx3oreNTTJZ214nlzZYSv0qKGCLsWM
         2F3oKpa47TundTt4KKhP4cuAUqmQ2LrluiwhrWmJwZsLBdtK+y94sQZOBVkj5HuR8AKY
         +6FPQCCGAQHJ9ylI/UH28EJljp5jTNfnW6dBUoZIbuK1WhQ25d+WPNeQQhpHvB2+DaKl
         Nu4xvx2EIbZWSVGSU13mjIf8IoOJgHKblnCXaI/tH4nf6eu65kwQKycgyoNqEL3v6Xap
         aw0wpBUMHNgyxFETSNDW21tU/t+SFaEwq5hHj9A5Ce5HIkbWqSLgz2jyz98u2+Z16LWD
         qBYA==
X-Forwarded-Encrypted: i=1; AJvYcCVF03f40+TeCSiMymJnu432XFFfqttUY1FAyrGHMksCeUCPwUDy55RU0UADIflBJiCHjB46RCnQaopThK4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxR7cjzSNuNscDoqBYdq7uJI9uZf2ADaCkuGiKjoRCrOVag04z7
	Z/ZXudchP9M/+4g1I0XjizH/nCnW/YXib7MjzOVfDjbwbAPr3yrKgTlkocpoxGyNbUsruYk5cT3
	DENKLbQcEp8G1BXVsdRrz0pIu0vs5Alj6+uC7imi0nLk6DtzLlaql/qf+nhGyPA==
X-Gm-Gg: ASbGnct+7Oi+YxJS83g64jsgUyei+fAf+4+G8GyWdlTFaU5BChNZCVNUXJ8b3Mh1QuG
	UjtqTdTBeHVZjaI1Kk9lxWoXwmdGqyMB+Zo0+1iz+MawlG8nX3/BcqqHGnOSASSkgRDq5GavccW
	lTB15USwoPmw1alwq0l5d+XvhY8K9SdEL6dhZ0A+FadgIgHZdXyRusGsXC47oH8/hF+KKi4BKfa
	x44SEugKiXq9K03/W5W2N4+ZEj8CV2eFyW951DgGznhpZwhorn/aRMMRaO405bzHtuS3iHX3bGJ
	KjEs1CqBZT4tNPWJMOjibWSZBDiBBnsPpVW9BTu5nv8IApGgIhR4KkaMU3pmM83bnlZtVxA=
X-Received: by 2002:a05:6a00:1942:b0:736:ab49:d56 with SMTP id d2e1a72fcca58-7402710d0afmr3239288b3a.1.1745906829923;
        Mon, 28 Apr 2025 23:07:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJCLBOCrwppDN55T67L8JyaCUrnYNo1UO1BS0g+YB8+xMmPNXJ21ihJHILegBGscF2pG70MQ==
X-Received: by 2002:a05:6a00:1942:b0:736:ab49:d56 with SMTP id d2e1a72fcca58-7402710d0afmr3239250b3a.1.1745906829502;
        Mon, 28 Apr 2025 23:07:09 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25acd9cbsm9353642b3a.174.2025.04.28.23.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 23:07:08 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 23:06:30 -0700
Subject: [PATCH v4 09/11] qcomtee: add primordial object
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-9-6a143640a6cb@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA0NCBTYWx0ZWRfX6eTVTkcIwHuw sczDqLT0eE5ztSkHkhz7uau4I/uizHVVF1o5Cr7tR+9bdYXRklwrx59AESFRnQdRX0Dd4hnSO/E +3kNFZglTTmApx/vtQOmgI+8hWqwP0b2lDfdagiwTdCUnMjOVHCm16wFoOBomjUv7wVC3f9D41U
 BKc1wSq585fXzm3/ewODRVa9ODMXshZLg/6buGZRIHNJzUBpUvLWFKKbmDN65eE89cuy7iGjy/u hvaa6oQ8aGdL+HplLA+9DrxfvvP42XebT97Tigc4HJbvZTSThFWQB+OV/SNvzgzU03LHGFt8Aci qg97iZZqbn2NGHc6BaoLN0mI46VFO6dtq5CwmFm4VeQcF2xxN/XPTI/E1q/KkoAEKnDhYl/eQ7p
 5hHTHk9Ll1ojd8FJK2Tf1TWfZAR3EU8+vCPVt3C2fhjYYdA3cknYEd9w8dftK74qBESPtqVZ
X-Proofpoint-GUID: U-8B653Qd4L4ELMr3DvaTRC5sIYtdyOd
X-Proofpoint-ORIG-GUID: U-8B653Qd4L4ELMr3DvaTRC5sIYtdyOd
X-Authority-Analysis: v=2.4 cv=M/5NKzws c=1 sm=1 tr=0 ts=68106c8f cx=c_pps a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=6dJEewf6gjddJ4Qna_sA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290044

After booting, the kernel provides a static object known as the
primordial object. This object is utilized by QTEE for native
kernel services such as yield or privileged operations.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/qcomtee/Makefile          |  1 +
 drivers/tee/qcomtee/core.c            | 19 +++++++---
 drivers/tee/qcomtee/primordial_obj.c  | 65 +++++++++++++++++++++++++++++++++++
 drivers/tee/qcomtee/qcomtee_private.h |  3 ++
 4 files changed, 83 insertions(+), 5 deletions(-)

diff --git a/drivers/tee/qcomtee/Makefile b/drivers/tee/qcomtee/Makefile
index 1b14b943e5f5..a3a2d00e83f0 100644
--- a/drivers/tee/qcomtee/Makefile
+++ b/drivers/tee/qcomtee/Makefile
@@ -3,6 +3,7 @@ obj-$(CONFIG_QCOMTEE) += qcomtee.o
 qcomtee-objs += async.o
 qcomtee-objs += call.o
 qcomtee-objs += core.o
+qcomtee-objs += primordial_obj.o
 qcomtee-objs += qcom_scm.o
 qcomtee-objs += release.o
 qcomtee-objs += shm.o
diff --git a/drivers/tee/qcomtee/core.c b/drivers/tee/qcomtee/core.c
index ad3b28f32529..a1ac492fd21a 100644
--- a/drivers/tee/qcomtee/core.c
+++ b/drivers/tee/qcomtee/core.c
@@ -39,10 +39,12 @@ int qcomtee_next_arg_type(struct qcomtee_arg *u, int i,
 }
 
 /*
- * QTEE expects IDs with the QCOMTEE_MSG_OBJECT_NS_BIT set for objects
- * of the QCOMTEE_OBJECT_TYPE_CB type.
+ * QTEE expects IDs with QCOMTEE_MSG_OBJECT_NS_BIT set for objects of
+ * QCOMTEE_OBJECT_TYPE_CB type. The first ID with QCOMTEE_MSG_OBJECT_NS_BIT
+ * set is reserved for the primordial object.
  */
-#define QCOMTEE_OBJECT_ID_START (QCOMTEE_MSG_OBJECT_NS_BIT + 1)
+#define QCOMTEE_OBJECT_PRIMORDIAL (QCOMTEE_MSG_OBJECT_NS_BIT)
+#define QCOMTEE_OBJECT_ID_START (QCOMTEE_OBJECT_PRIMORDIAL + 1)
 #define QCOMTEE_OBJECT_ID_END (U32_MAX)
 
 #define QCOMTEE_OBJECT_SET(p, type, ...) \
@@ -127,7 +129,9 @@ static void qcomtee_object_release(struct kref *refcount)
  */
 int qcomtee_object_get(struct qcomtee_object *object)
 {
-	if (object != NULL_QCOMTEE_OBJECT && object != ROOT_QCOMTEE_OBJECT)
+	if (object != &qcomtee_primordial_object &&
+	    object != NULL_QCOMTEE_OBJECT &&
+	    object != ROOT_QCOMTEE_OBJECT)
 		return kref_get_unless_zero(&object->refcount);
 
 	return 0;
@@ -140,7 +144,9 @@ EXPORT_SYMBOL_GPL(qcomtee_object_get);
  */
 void qcomtee_object_put(struct qcomtee_object *object)
 {
-	if (object != NULL_QCOMTEE_OBJECT && object != ROOT_QCOMTEE_OBJECT)
+	if (object != &qcomtee_primordial_object &&
+	    object != NULL_QCOMTEE_OBJECT &&
+	    object != ROOT_QCOMTEE_OBJECT)
 		kref_put(&object->refcount, qcomtee_object_release);
 }
 EXPORT_SYMBOL_GPL(qcomtee_object_put);
@@ -222,6 +228,9 @@ static struct qcomtee_object *qcomtee_local_object_get(unsigned int object_id)
 {
 	struct qcomtee_object *object;
 
+	if (object_id == QCOMTEE_OBJECT_PRIMORDIAL)
+		return &qcomtee_primordial_object;
+
 	guard(rcu)();
 	object = xa_load(&xa_qcom_local_objects, object_id);
 	/* It already checks for %NULL_QCOMTEE_OBJECT. */
diff --git a/drivers/tee/qcomtee/primordial_obj.c b/drivers/tee/qcomtee/primordial_obj.c
new file mode 100644
index 000000000000..a30967d89c91
--- /dev/null
+++ b/drivers/tee/qcomtee/primordial_obj.c
@@ -0,0 +1,65 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/delay.h>
+#include "qcomtee_private.h"
+
+/**
+ * DOC: Primordial Object
+ *
+ * After boot, the kernel provides a static object of type
+ * %QCOMTEE_OBJECT_TYPE_CB called the primordial object. This object is used
+ * for native kernel services or privileged operations.
+ *
+ * We support:
+ *  - %QCOMTEE_OBJECT_OP_YIELD to yield by the thread running in QTEE.
+ *  - %QCOMTEE_OBJECT_OP_SLEEP to wait for a period of time.
+ */
+
+#define QCOMTEE_OBJECT_OP_YIELD 1
+#define QCOMTEE_OBJECT_OP_SLEEP 2
+
+static int
+qcomtee_primordial_obj_dispatch(struct qcomtee_object_invoke_ctx *oic,
+				struct qcomtee_object *primordial_object_unused,
+				u32 op, struct qcomtee_arg *args)
+{
+	int err = 0;
+
+	switch (op) {
+	case QCOMTEE_OBJECT_OP_YIELD:
+		cond_resched();
+		/* No output object. */
+		oic->data = NULL;
+		break;
+	case QCOMTEE_OBJECT_OP_SLEEP:
+		/* Check message format matched QCOMTEE_OBJECT_OP_SLEEP op. */
+		if (qcomtee_args_len(args) != 1 ||
+		    args[0].type != QCOMTEE_ARG_TYPE_IB ||
+		    args[0].b.size < sizeof(u32))
+			return -EINVAL;
+
+		msleep(*(u32 *)(args[0].b.addr));
+		/* No output object. */
+		oic->data = NULL;
+		break;
+	default:
+		err = -EINVAL;
+	}
+
+	return err;
+}
+
+static struct qcomtee_object_operations qcomtee_primordial_obj_ops = {
+	.dispatch = qcomtee_primordial_obj_dispatch,
+};
+
+struct qcomtee_object qcomtee_primordial_object = {
+	.name = "primordial",
+	.object_type = QCOMTEE_OBJECT_TYPE_CB,
+	.ops = &qcomtee_primordial_obj_ops
+};
diff --git a/drivers/tee/qcomtee/qcomtee_private.h b/drivers/tee/qcomtee/qcomtee_private.h
index a6f2c0591580..e59cfb3b79dd 100644
--- a/drivers/tee/qcomtee/qcomtee_private.h
+++ b/drivers/tee/qcomtee/qcomtee_private.h
@@ -219,4 +219,7 @@ int qcomtee_user_object_submit(struct tee_context *ctx,
 			       struct tee_param *params, int num_params,
 			       int req_id, int errno);
 
+/* (2) Primordial Object. */
+extern struct qcomtee_object qcomtee_primordial_object;
+
 #endif /* QCOMTEE_PRIVATE_H */

-- 
2.34.1

