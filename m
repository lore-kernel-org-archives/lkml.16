Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FD6242D82
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 10:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746180070; cv=none; b=TPAfjMKT/0lb7tLz+TA6Pyzzu8sGEJFnH9frWZxhcc5Fl+n9220uCLP1Vynq0LH0Ar//A0phU5OeNbrROK2n2u6uInPrkqgilAOm+WLr4Xkew2nHVVfXhWid9RA6NPzdpI00oEOKJ3IqG42aewMOZROLbQ5K5igVvW6DxBGeemA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746180070; c=relaxed/simple;
	bh=J9LDfo6gNpW71xs4AHsdLctBmBSEcjpZaBz793nPpSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NnenVMY6/5z2np0zCYvH87jsZ27G8ENN/2kLMTFo8px5zPaZ6lKFSpKcrWoV0mDFKL539L0xJQgjJ1g1DQw5HM3MhE3QYVC6RvDpGCpz3AqJCFpdmyOBozCOFt6pNuvUrpGkNOSS4lGaX26vAEojeb0DQyW4Uxyf4+JvOkaLM14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kOWOrp86; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kOWOrp86"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e5e22e6ed2so2773354a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 03:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746180067; x=1746784867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fs7nqD12lkBPC3o5IKJmDFRrEPWNWVuJ0deEV/XnG9g=;
        b=kOWOrp86fwZIqmrnzs4rxJoXPuzSO6ectUYp7XQd669jv0N5XSDGFLNhbX0uF7H9Hh
         YfrbIDUvDgPT9Z2xk7/ma0DdMDouiv2arVBC2ZAn5nW25NWlVYtD5MjwmYeA1UmWmxQv
         /z1INvP2Mmkpag6t36ns+z1w1oY3hRTVFHoP/9XQ0BDDfsHwAiciyF+27mpqzg9ad0Id
         fR8PG9olGLAcm6NBltxmrS3ZQOUzrtFPKP5zeWMGtaE5iTPIOrNHPBbbpIf0zSb78K0B
         KSrzyvsuxkhANyB7Lc5RRJAxoQ+FspCBucqcvVBIhC/SHI98rxTQH3zwpuhBbKP/qURt
         H/Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746180067; x=1746784867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fs7nqD12lkBPC3o5IKJmDFRrEPWNWVuJ0deEV/XnG9g=;
        b=XA2sTyqc6GpxilCw2DXTxpNwZa0UZd0kcDkvsdtmCowYCywX2v9xeCenbZlsSoa0hC
         VvRtY6w10+K9Ht8fS/WLGF/dKBvgWZQjZbem7JMgIotMtp4RdhMNIOk7SO++FwzUA7CU
         dgx3Pr//+DfhJ0xu/BsTEVfhBj3f9llD6mmQjkEuWkkZrhdwRHzn9zPub10L98fm+pdc
         FwEcHU186Jx17iEZE96FfbQnlccjo70Af2Er9xNWekBses1uH2fDqQLF24GopLoeWshs
         Sda1tW6/GpIZByM6djOHweOQHxFYC33G5H8Z+HjQXWsEQ9MvoEkj6uocRyM/oKFZfyOD
         XL1w==
X-Gm-Message-State: AOJu0YzLvqIxkUscUc/U81EW3K9TS//5PugQJGqNBv7NMvkx3gV8a7qc
	02594yXcjttoTDqYP0Bt1rU86OpDsOqx4fWoHUzkbcr30znll+WhrwALrReLTr9tygnqLtGeQrc
	XQMg=
X-Gm-Gg: ASbGncvXZPzsOrZ57PA9gozZyT7oEG7weBLo6T8Byg9185Il5iCxb3PKjno8HHoe6OP
	zfXiUwW6vdLYwxy+1c3+7Jv6KMjWGu4uhhK8l196uUzl/BTX775DdhPntUTkm4Y84OJEKygSRqa
	5qMQZnGupKCokNXlOOvwNNfvkET8RyBM/ENQ/yzv6Jt7fjWoQD/izW4GVcz+vxyxCEEeolzdMaV
	9OFP61d0iMtgxevYuXVuhQW7f0mPUMY0KAATSP2LnUIEkld5fWqnUBQcWuxn+O3XhLjyPz8plhO
	FknTEEEbYlIX18inqx7oBfhJzAtEtI8mi/bkhEDMr+yAUo2JhSqyA6AcQVyNOLybU2YQ0QW+Kl0
	CiY7+Zv+8b9bmOV8PWw==
X-Google-Smtp-Source: AGHT+IFFcCMXXLABaW9tvRZ1qpMWwe7p/TbtI+cL2YnquR0Nl0siV3BBf3ahUJ21DjrVNKWPwxmwtg==
X-Received: by 2002:a17:907:3f0f:b0:ace:9d35:6987 with SMTP id a640c23a62f3a-ad17ad24ac3mr199106166b.3.1746180066113;
        Fri, 02 May 2025 03:01:06 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891473a1sm26030566b.4.2025.05.02.03.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 03:01:05 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	op-tee@lists.trustedfirmware.org,
	linux-arm-kernel@lists.infradead.org
Cc: Olivier Masse <olivier.masse@nxp.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Sumit Garg <sumit.garg@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	azarrabi@qti.qualcomm.com,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Daniel Stone <daniel@fooishbar.org>,
	Rouven Czerwinski <rouven.czerwinski@linaro.org>,
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v8 07/14] tee: refactor params_from_user()
Date: Fri,  2 May 2025 11:59:21 +0200
Message-ID: <20250502100049.1746335-8-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250502100049.1746335-1-jens.wiklander@linaro.org>
References: <20250502100049.1746335-1-jens.wiklander@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Break out the memref handling into a separate helper function.
No change in behavior.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/tee/tee_core.c | 94 ++++++++++++++++++++++++------------------
 1 file changed, 54 insertions(+), 40 deletions(-)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index 685afcaa3ea1..820e394b9054 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -353,6 +353,55 @@ tee_ioctl_shm_register(struct tee_context *ctx,
 	return ret;
 }
 
+static int param_from_user_memref(struct tee_context *ctx,
+				  struct tee_param_memref *memref,
+				  struct tee_ioctl_param *ip)
+{
+	struct tee_shm *shm;
+
+	/*
+	 * If a NULL pointer is passed to a TA in the TEE,
+	 * the ip.c IOCTL parameters is set to TEE_MEMREF_NULL
+	 * indicating a NULL memory reference.
+	 */
+	if (ip->c != TEE_MEMREF_NULL) {
+		/*
+		 * If we fail to get a pointer to a shared
+		 * memory object (and increase the ref count)
+		 * from an identifier we return an error. All
+		 * pointers that has been added in params have
+		 * an increased ref count. It's the callers
+		 * responibility to do tee_shm_put() on all
+		 * resolved pointers.
+		 */
+		shm = tee_shm_get_from_id(ctx, ip->c);
+		if (IS_ERR(shm))
+			return PTR_ERR(shm);
+
+		/*
+		 * Ensure offset + size does not overflow
+		 * offset and does not overflow the size of
+		 * the referred shared memory object.
+		 */
+		if ((ip->a + ip->b) < ip->a ||
+		    (ip->a + ip->b) > shm->size) {
+			tee_shm_put(shm);
+			return -EINVAL;
+		}
+	} else if (ctx->cap_memref_null) {
+		/* Pass NULL pointer to OP-TEE */
+		shm = NULL;
+	} else {
+		return -EINVAL;
+	}
+
+	memref->shm_offs = ip->a;
+	memref->size = ip->b;
+	memref->shm = shm;
+
+	return 0;
+}
+
 static int params_from_user(struct tee_context *ctx, struct tee_param *params,
 			    size_t num_params,
 			    struct tee_ioctl_param __user *uparams)
@@ -360,8 +409,8 @@ static int params_from_user(struct tee_context *ctx, struct tee_param *params,
 	size_t n;
 
 	for (n = 0; n < num_params; n++) {
-		struct tee_shm *shm;
 		struct tee_ioctl_param ip;
+		int rc;
 
 		if (copy_from_user(&ip, uparams + n, sizeof(ip)))
 			return -EFAULT;
@@ -384,45 +433,10 @@ static int params_from_user(struct tee_context *ctx, struct tee_param *params,
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
-			/*
-			 * If a NULL pointer is passed to a TA in the TEE,
-			 * the ip.c IOCTL parameters is set to TEE_MEMREF_NULL
-			 * indicating a NULL memory reference.
-			 */
-			if (ip.c != TEE_MEMREF_NULL) {
-				/*
-				 * If we fail to get a pointer to a shared
-				 * memory object (and increase the ref count)
-				 * from an identifier we return an error. All
-				 * pointers that has been added in params have
-				 * an increased ref count. It's the callers
-				 * responibility to do tee_shm_put() on all
-				 * resolved pointers.
-				 */
-				shm = tee_shm_get_from_id(ctx, ip.c);
-				if (IS_ERR(shm))
-					return PTR_ERR(shm);
-
-				/*
-				 * Ensure offset + size does not overflow
-				 * offset and does not overflow the size of
-				 * the referred shared memory object.
-				 */
-				if ((ip.a + ip.b) < ip.a ||
-				    (ip.a + ip.b) > shm->size) {
-					tee_shm_put(shm);
-					return -EINVAL;
-				}
-			} else if (ctx->cap_memref_null) {
-				/* Pass NULL pointer to OP-TEE */
-				shm = NULL;
-			} else {
-				return -EINVAL;
-			}
-
-			params[n].u.memref.shm_offs = ip.a;
-			params[n].u.memref.size = ip.b;
-			params[n].u.memref.shm = shm;
+			rc = param_from_user_memref(ctx, &params[n].u.memref,
+						    &ip);
+			if (rc)
+				return rc;
 			break;
 		default:
 			/* Unknown attribute */
-- 
2.43.0

