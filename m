Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6730826B2A9
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 15:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747754692; cv=none; b=gmk4mcJMHOWTfsiuio/TgWd1PVXic2QbXSIfEuzQ5xZR6MzyqDRRrx7IPaGVRBKb+rciAz70847YSmI8XAFnlqOI26V+qxIjoSBqyRzYUDHQ2vqrB7tXVf2RV9yEkDDU3YonvOtWgu5/GIe0E6FQV3djoahWg0djzNZdNqf96SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747754692; c=relaxed/simple;
	bh=U4M/uCka6jhb4G8gyoW5PwwalKMKCj+JuNpoQ1l85So=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=okGBAMUZ/FtwNB70yH2LMwP47Rh0rPSFh3RCFDNXCc+JTT1ufP8xESdVy+BcnmGkMwmW5oX+dJH/ADA1aZsnIbFveat0I8OsuRlCdPTndqaLDBtdZK74oulREg+Yvk+qrpSMnPZBtHAu3LzWI3muv56F2aDXfqs/pN5uo3xEvgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UzTOnqNB; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UzTOnqNB"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ad53cd163d9so695802366b.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 08:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747754688; x=1748359488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E8qa5LXunNhsp8X5JiJZg17KZ//sKeVB/2pNQGhvC/I=;
        b=UzTOnqNBkIFkJ4ctiSfAeEl0xCtsojttVeqP/blVyoIgCyDFCdfMZMS7dq4nVbplsf
         GEWBkRGc/semg5EazQcGqryHy2MfnHLoF13HpjmJiBx9eNET2yg1qNrUyGH3UH5J6/L0
         IfA0DaJdHfu+ltnYIj2gEUnY7MERN9Xx7CVwZy7I0E9N0E4qSNLD/stLhvS1HovDqOR0
         CvSvbxNz9hb/lv2paZBPLRfzlHyLvp6oRTrFeP+pkbaJ6cCe7aXf9ON/CWx3enJlcS58
         7mwmdB3x4wwMB3zd70KXhegjhAexrECDLh0qxqN+TLoRtpoVOLGETKDjwYh6Zd/+2z6q
         XVLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747754688; x=1748359488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E8qa5LXunNhsp8X5JiJZg17KZ//sKeVB/2pNQGhvC/I=;
        b=UkNMGSY1vavJl5NiaT/RPkMnEfbr1q5SMu/gyvmevqCY4KQ5vKJWI8UG1Ym7cuH1jd
         ToPqJyuwAd2SDjiiNDJPdkIkK7k6waLdXnPHn3ysDdym0kEhFUSCmRDxxAK5PcJk4NXz
         iZsO9vEg04VmWaEi+4iI3JVGvbMARErCB9RjHba/C/wxtONDEGSa1HpkQl/kLohKTwtC
         VgUnMwKFl8VsBgKfP0QGy2pLWJ182YzRenKUnRmw5q8oI6QUxg591CU/DPXtZj1SJVms
         BV78EgmFMjGrNxRkYK54BrDVFI73qNvyA5X2enj70UTf7K50s1h2zd9WcOhn/Ko/AOm4
         4Jqw==
X-Gm-Message-State: AOJu0YxjVWFVsFkkaIAumIkJ/UfJGSJroIJkOLGHSw8AFhzGgtJRw1xD
	HCPHOi8GbLbc5YgfQZ7DNuCuwLPG/xoWm8hXIa999+q7FvxiJAHVU8WoDIMp8PJWTcLmqg+sTNc
	VkvlglYw=
X-Gm-Gg: ASbGnctjyMTieWyD1pyFYFndYv1V/L9SCtG/axn5bXPu41a/HnfhSGi8VSm3fQ95lPT
	f/4TqqKFZWASj5OeoicbVSXg/oo9R5MjvRahHI8DNYnVZYKL82DZ5ovNLtWISXZvAtWFaob/RGC
	qXlY+93d4DqNmpwwMJ0pCPNoZSpBDp0Qo27RiBln+okhg3srADbd4kYSq+1FzK22mXSisODjiyX
	LXwqeXxfY0jrYK6Zd1SQYxbWgRHqvq2Y2VBWVvr9jOWaI93JJaT7tX6TMoUgC2hk3WWsZ4l37Zl
	5LZvCGSofDaWSKM84KDA4qTu5/blawQ+Oc9QLeN0SJFSsA4GK+LmcnPCkxl5IXNgyJg6aj/tsJ/
	kT9NZqrxaEblC/S0uwI07Kl+heLhJ
X-Google-Smtp-Source: AGHT+IEImWs7uqKgqwvSaXfZnMr4lkCq2x7vYsraA2w6nH//5aCKKG0iMBeBMIE3Nx+R/TgNxy5Nsg==
X-Received: by 2002:a17:907:970a:b0:ad5:72d4:85f8 with SMTP id a640c23a62f3a-ad572d5076bmr655367366b.60.1747754688101;
        Tue, 20 May 2025 08:24:48 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d278257sm742608766b.82.2025.05.20.08.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 08:24:47 -0700 (PDT)
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
	Jens Wiklander <jens.wiklander@linaro.org>,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: [PATCH v9 4/9] tee: refactor params_from_user()
Date: Tue, 20 May 2025 17:16:47 +0200
Message-ID: <20250520152436.474778-5-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250520152436.474778-1-jens.wiklander@linaro.org>
References: <20250520152436.474778-1-jens.wiklander@linaro.org>
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

