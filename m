Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12304153808
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 13:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745845608; cv=none; b=jaLLy1199mXX9ANcGUWA69T6+4KFQOb9tbtiTyyVPTtMfHwAW95BrS8jVbVhQ5GwdDaTO9crmzcmtiKrsO1nbsaRcl15i6GXcVzS88T54GQtXbSF341ouVe8O9XoTN2w1Fc+OzuHmZAMWN5Sbak3a2odVYFK7UapXzYtTYi0kWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745845608; c=relaxed/simple;
	bh=kizWqzMNFmgR60mkvmbS6oCE+rarY1QuT4OaG2lkkVI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=RbpUd7zJpa6DFfrMY0NZJXTKLVgjc60QNQi94SbwQQBfGplt2+9EXbn4/culFDDfDkTyrogxdCLkQaE2pqpoqmvvZoZCelxuWfjU3hgaB/bJPfrmuP5U1Hon/a8O4OqaGSXef8ahhDJEINPAONu4k2CJrvj3c/b1QHs53APc1Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3/CzySbB; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3/CzySbB"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43ef83a6bfaso83955e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 06:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745845605; x=1746450405; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nvLAbZYfFQKGy/FERvdT0DqFWRZ1/MlHWogjm8C7Zfk=;
        b=3/CzySbB/P+3x+MUYj8DvMiU51tRdvPkB3R/I/IFhWgn3tPWmV5ggLVznsrH/Sh3S0
         UsCAuzbOS8jZM3Gm0frlnvt7o/2FHkW5e6q312HrXwqMN0jUXhbWYffUqw3WdjRH+gcZ
         d/i2oDUzTiBw0Bp6hyxMIzOwWAo8fLyuAUR8SkLzQ8cpfAoI9Ni75OjlDPnJkZRv9c5x
         /nHVrCU+UQ41jqbLhrttJEUqOR2n1F7mp/ECiL2m1UjRLTItgYxuDrnRZXQBPtIo1h6u
         Ns8thsOVQDV+bOLWKHz3R7i4mXwXoeEgsP3+hxRwxAvfqjT5NsLLfH/nmPd9WMtYQegv
         XlOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745845605; x=1746450405;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nvLAbZYfFQKGy/FERvdT0DqFWRZ1/MlHWogjm8C7Zfk=;
        b=UbhkuzB8QorD49JVUv8YjwSCa/cR41Sr+qP6l50g6W22/pZdMGSXYGGRbO72IyY0wt
         pDiR9b4dMIei1n/Va7TSEgQPVmbNf1yO+4muwoPMBhMxZZ4h0Tc6QGOXuudIiviAyb4i
         WMm8p7xDGSfRl4+Fg8AuPut/0owggjPQx7OiQGEZjQtd5x9B0Hhv/giRcaeCToD1BX5G
         w9vFBwqBz7St8oXhNxPI+zVHApfbdvtTvhjocUreb5zb3NnRybTe/tMsxTsOq9fu2iCD
         R0RmLl3OAjIyHH5ln1aSH3j+FLQXbKEQg9ZAy38/giMr5pjPyc8XU4zlPFEVG6gA0KeI
         VazA==
X-Forwarded-Encrypted: i=1; AJvYcCXUgHOzt8+KzaJD+3mhiqtmu0H7vvCdfBZVsmtwteQ+6bSKu6mWeZlAJvdMm9VkMonqfyw3pDLef3Kpnqw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzan9dRqxfHrQ0ndpGyK/aqW/uUFsp3h3IMCF9g3qhzHd7eAE2d
	EXowyIWKYGLQmCE8Ivd6lQYMKnP1nFR1TbWRODkHShegYtiFs4K1k5bbF4L61cR9+f1zwbbejz6
	EODeT
X-Gm-Gg: ASbGncv2AROaqgrEUbEttRSCKKtCTRXYjvCqXWsHeGmNyuiYebBLcdAr+ZfRQoyueLe
	y50pOQ/OspeOjIk2kL+JP/TnDPWvRwTWg3jHg27FUQ2e5CLJmTm0yTGXg2p/ze4hCI21bDdcfnB
	sleDmogROJZNGoxsFjCGS4U3NFm6fZGIbhSN4s9Ubwda0aP3++49PWGNaUBdbhFU276tPi6jsjh
	fsodA4v0WxB1s9FBliW1NICSZa+0jBrVf3pw9jIbx9LGIrJUEZZSlZalqwWMWVVKVLbvQ2PDRBB
	fjtG4YzC7aX+WVyyCs3x5FP9jrKOyA==
X-Google-Smtp-Source: AGHT+IEykLXoXlbkAd/X8uncP/K+4vtORWNQv8YmaqBoxD7Iq+cnxEh28NmlW+WZF8+LyhbN4eb0JA==
X-Received: by 2002:a05:600c:3b9a:b0:439:7fc2:c7ad with SMTP id 5b1f17b1804b1-440ad80afedmr2570685e9.7.1745845604800;
        Mon, 28 Apr 2025 06:06:44 -0700 (PDT)
Received: from localhost ([2a00:79e0:9d:4:b294:6c33:84f6:5361])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a073c8ca99sm11007348f8f.20.2025.04.28.06.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 06:06:44 -0700 (PDT)
From: Jann Horn <jannh@google.com>
Date: Mon, 28 Apr 2025 15:06:43 +0200
Subject: [PATCH] tee: Prevent size calculation wraparound on 32-bit kernels
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-tee-sizecheck-v1-1-5c3c25a2fa79@google.com>
X-B4-Tracking: v=1; b=H4sIAGJ9D2gC/x3MSwqAIBRG4a3IHSeYJD22Eg1Cf+sSVGhEJO49a
 fgNzkkUERiRBpEo4ObIx15QV4LsOu8LJLti0kob1ehOXoCM/MKusJvUfe8MvO+8bak0Z4Dn5/+
 NU84fnDc/7V8AAAA=
X-Change-ID: 20250428-tee-sizecheck-299d5eff8fc7
To: Jens Wiklander <jens.wiklander@linaro.org>, 
 Sumit Garg <sumit.garg@kernel.org>
Cc: op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org, 
 Jann Horn <jannh@google.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745845603; l=2910;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=kizWqzMNFmgR60mkvmbS6oCE+rarY1QuT4OaG2lkkVI=;
 b=GWF9549lxno1IrKfrhYq2AJtgcIyYl+2/sinaiNLhCp0AUIt04a6fGIz8lixvTXSTlni3t9Y2
 Cgi37/gteMLDEb0hBkXc2nCAXB1NoAIMIBihciEW4Yqv5nyk+QvYUu1
X-Developer-Key: i=jannh@google.com; a=ed25519;
 pk=AljNtGOzXeF6khBXDJVVvwSEkVDGnnZZYqfWhP1V+C8=

The current code around TEE_IOCTL_PARAM_SIZE() is a bit wrong on
32-bit kernels: Multiplying a user-provided 32-bit value with the
size of a structure can wrap around on such platforms.

Fix it by using saturating arithmetic for the size calculation.

This has no security consequences because, in all users of
TEE_IOCTL_PARAM_SIZE(), the subsequent kcalloc() implicitly checks
for wrapping.

Signed-off-by: Jann Horn <jannh@google.com>
---
Note that I don't have a test device with a TEE; I only compile-tested
the change on an x86-64 build.
---
 drivers/tee/tee_core.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index d113679b1e2d..acc7998758ad 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -10,6 +10,7 @@
 #include <linux/fs.h>
 #include <linux/idr.h>
 #include <linux/module.h>
+#include <linux/overflow.h>
 #include <linux/slab.h>
 #include <linux/tee_core.h>
 #include <linux/uaccess.h>
@@ -19,7 +20,7 @@
 
 #define TEE_NUM_DEVICES	32
 
-#define TEE_IOCTL_PARAM_SIZE(x) (sizeof(struct tee_param) * (x))
+#define TEE_IOCTL_PARAM_SIZE(x) (size_mul(sizeof(struct tee_param), (x)))
 
 #define TEE_UUID_NS_NAME_SIZE	128
 
@@ -487,7 +488,7 @@ static int tee_ioctl_open_session(struct tee_context *ctx,
 	if (copy_from_user(&arg, uarg, sizeof(arg)))
 		return -EFAULT;
 
-	if (sizeof(arg) + TEE_IOCTL_PARAM_SIZE(arg.num_params) != buf.buf_len)
+	if (size_add(sizeof(arg), TEE_IOCTL_PARAM_SIZE(arg.num_params)) != buf.buf_len)
 		return -EINVAL;
 
 	if (arg.num_params) {
@@ -565,7 +566,7 @@ static int tee_ioctl_invoke(struct tee_context *ctx,
 	if (copy_from_user(&arg, uarg, sizeof(arg)))
 		return -EFAULT;
 
-	if (sizeof(arg) + TEE_IOCTL_PARAM_SIZE(arg.num_params) != buf.buf_len)
+	if (size_add(sizeof(arg), TEE_IOCTL_PARAM_SIZE(arg.num_params)) != buf.buf_len)
 		return -EINVAL;
 
 	if (arg.num_params) {
@@ -699,7 +700,7 @@ static int tee_ioctl_supp_recv(struct tee_context *ctx,
 	if (get_user(num_params, &uarg->num_params))
 		return -EFAULT;
 
-	if (sizeof(*uarg) + TEE_IOCTL_PARAM_SIZE(num_params) != buf.buf_len)
+	if (size_add(sizeof(*uarg), TEE_IOCTL_PARAM_SIZE(num_params)) != buf.buf_len)
 		return -EINVAL;
 
 	params = kcalloc(num_params, sizeof(struct tee_param), GFP_KERNEL);
@@ -798,7 +799,7 @@ static int tee_ioctl_supp_send(struct tee_context *ctx,
 	    get_user(num_params, &uarg->num_params))
 		return -EFAULT;
 
-	if (sizeof(*uarg) + TEE_IOCTL_PARAM_SIZE(num_params) > buf.buf_len)
+	if (size_add(sizeof(*uarg), TEE_IOCTL_PARAM_SIZE(num_params)) > buf.buf_len)
 		return -EINVAL;
 
 	params = kcalloc(num_params, sizeof(struct tee_param), GFP_KERNEL);

---
base-commit: b4432656b36e5cc1d50a1f2dc15357543add530e
change-id: 20250428-tee-sizecheck-299d5eff8fc7

-- 
Jann Horn <jannh@google.com>

