Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700F129C35C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 13:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749561381; cv=none; b=HUrV22yx/TsXxjK9rZ7k1pWlSp511blzbC+2E2AQGol+HfKmVaBEHpo3ul6wuJsKLVLyXCKedlTHH8OFQWPwPn1IaNREMmVjSArRPwCrWTCqYzTFLh1v9wagqH2oSGl6A6LH0nkR9QXqRptRNZTZ3lrLu9V1AH59VkV0o/YquGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749561381; c=relaxed/simple;
	bh=U4M/uCka6jhb4G8gyoW5PwwalKMKCj+JuNpoQ1l85So=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dLcyJC8z0cul8K5ErMyARE4BpjiCfoc3dGSK6cdV8bVVmOOu/QjuMP0Cp5aLf6Au0BszIhbhy2ix4hgH6XUqzLemaPisiS2nHM/S7llEZ4bneRD0DJSp22wOe5lqbk8AvpDbio/5aBclBWZ20X4lXAiiyll77Kjc8/aLx6ib9RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HKOQJ7z3; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HKOQJ7z3"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ade33027bcfso506098666b.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 06:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749561377; x=1750166177; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E8qa5LXunNhsp8X5JiJZg17KZ//sKeVB/2pNQGhvC/I=;
        b=HKOQJ7z30X7IEekgW+nG8M0OuPtFhvwbhNs1H03IRBBVFYU6B5ZKDuIysrh1onAhY4
         7d6n7ynm1tZawyyIGMWNaKHFcrbYW45s4Hai/FLI9SOacRme2w9NsKeO/7BstxaP4+BD
         h9GnRnYzea1BSmsXRq9N/m62IT1/avJnQlO7b7zT1RNwvHtxar+4/kGZpwOl9xABL54q
         Le/w3EyTBO7PFr2XO9cg+SfIjekWMU87LdhTzrB+CpXGZeQ8Yb30RhL1KZJqQPjFMUdZ
         8ZRFtS5QLxea2RuOZ8QRnGBMk1z9B+GtSGpkuEpkH4tNmOvXErs3NEjtIN8cTXf1lskh
         1OOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749561377; x=1750166177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E8qa5LXunNhsp8X5JiJZg17KZ//sKeVB/2pNQGhvC/I=;
        b=CInJZkQYSU4IBNF9HrQpNWbVP9YeSazOSeFebmhl41qc6TxppB6LIw8XpY42lbOe/M
         b8OGZs+MtQDfMI4gDd1IaG0JOa6KIB8FiM3ohHpIK1pJN3+koEC2/glCCLIQGcysD5MC
         D40u/I3e1hn1GxzJNrncUwemav8Z98ogtrefuSRTTTh3sea8SnzKh7rBdjhoQsjwjNR6
         1jYOqmOrpWgx3MnEwPDi8s9LGa5kA3Woxi3/Hh75VlfgT2Qzpc6gORpiOTMdRikf7WRD
         08lwJsVrUAonTALYZ2oP15CmxbFufI37N0EfId1iA6Mzsbk3YpaQvsZS0Hy4RAQCoCnz
         JHPw==
X-Gm-Message-State: AOJu0Yw+nGkhPff0D08LX8IP0P6s9S/Tn8GnkYc/MDHxDCchjyrpkxAc
	Axwlh4vXecG99dKm0KclgnvR3Gg3g21HXp19rpcnZGwtopa4FRJlM4DtVaKuJsnmkWtiMriHcMg
	Y5ac0ERQ=
X-Gm-Gg: ASbGnctgEWP62VPPzvbet+xKZgbUgDpOLI+an2hlnMhfLnS0ykNfbQzjPaMtLP+V2B+
	ykYIawIdbncJ6eYFXqVEyIsVb2RPxTmwTWJVtbYmUCIWnT0Qm8TXC5KwRsn8SlKUnT6XXMhyOJe
	rGisNt2CI0Oaja/iSw0JHJvWMDj2zKyEMVBMg4Yq5ckui4UNVConV6LoHhhJmR6yZKUq1LQTAAR
	o3MY3vPnEbddC6LrcApAaf8hgey/HVbXOI8iAjra3H+/aSCjtWuEaw4ZFo/i5VZxLUCOpV3keLR
	U2cNElA9OIl1cpar4HOz/SWQ4VkgwcwKJ0qmplKddI83OdH0xZMrS/9JW8eBN8zaq3Yo29/ph3n
	8EjbHiKNr1VBcfGhV0LVUE0VZZ4doMt2OqpDxvEM=
X-Google-Smtp-Source: AGHT+IGBtPqwFuuJoAzhUd8IVl8tNDOry1bNSziVae04YZxrWPyYutj0nX6K0MH+3Pmqe+BZwOKIiw==
X-Received: by 2002:a17:907:c12:b0:ad2:2569:696d with SMTP id a640c23a62f3a-ade7ac3db7amr264477666b.15.1749561377066;
        Tue, 10 Jun 2025 06:16:17 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade3206a1efsm643651666b.67.2025.06.10.06.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:16:16 -0700 (PDT)
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
	robin.murphy@arm.com,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: [PATCH v10 4/9] tee: refactor params_from_user()
Date: Tue, 10 Jun 2025 15:13:48 +0200
Message-ID: <20250610131600.2972232-5-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610131600.2972232-1-jens.wiklander@linaro.org>
References: <20250610131600.2972232-1-jens.wiklander@linaro.org>
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
Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
---
 drivers/tee/tee_core.c | 94 ++++++++++++++++++++++++------------------
 1 file changed, 54 insertions(+), 40 deletions(-)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index d113679b1e2d..5259b8223c27 100644
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

