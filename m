Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F071F543F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 14:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743777160; cv=none; b=hDpE4tvpsq47LUMsx0tHgPN4tIqmEdaDLxYzYLH4l1VpePyzJu2qn+xqyr7r4Gex3WCh/DjRm0dhzhX+HZpNdoDJgAez8nyYS/YwG7IdXvm3Pz4c6qbo6YsvPk+/JhD3qBb4nSN9C666N/mA2x4UTP2r+uB3mPx0Fl5SAugkf48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743777160; c=relaxed/simple;
	bh=J9LDfo6gNpW71xs4AHsdLctBmBSEcjpZaBz793nPpSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b3JAhKXuPiyhhHIOAZexUZJS6oSLxNqpUqhv6WvFqUeSVoClHJTXXR4MTN786c5hIDsHPVks06ybpWsrHaBJNk1maZfSSlBtMDG9RZjdi2TsY1HadK10A25phMOiVZWaF1OXBDLxQkKtsVipIUw5JHkedqufob5m6cKL0mbJe/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B/ANd/Gf; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B/ANd/Gf"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9eb12so3151340a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 07:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743777156; x=1744381956; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fs7nqD12lkBPC3o5IKJmDFRrEPWNWVuJ0deEV/XnG9g=;
        b=B/ANd/Gf0Lo/F5CiDFD0vSztnIai2+87oiCr8rJIm5HAd8QScznnPEgoAhBpxMyZv2
         dpPdY1NhNO1SLX0OMsBxZqPmNwWG3CVLnuV736NbfkZVh4p2b5or3SgsTC3V5YLQi+82
         LCDtt0vlsEsHBR7qZgEZBtdTeTwWFMLemYokzUO81+cSZQKWToA6beJ2tp6ejsQwSCgv
         RWjW/4au1X57IA7/72AH1Wrj6Hl/0TSHanG7DISHIubuOPA4HMUIlP+lAIYPW3KIJlGk
         naXNk+WVUg70ScQXTBgosemQOsCeUaEeNfWzKMkiw2/zcdNKAdi4+ypY1UbZiyAmacGw
         g6Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743777156; x=1744381956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fs7nqD12lkBPC3o5IKJmDFRrEPWNWVuJ0deEV/XnG9g=;
        b=aLNEwlttHt5CXGme6WeORHfdpeLCfXg9aEpGneM0kOdc6ySnWSt5YKnXyct5HXXjPo
         uDCjIKUk0bqc3OpxU4Tihsrel0PU9W0OTrVNwImVw+CSNyclt1wnbrMLdaO3ovy2F2Oi
         1DAcPnui3AJyKtRtrjEOpiITBQxU/ojRzu32mad8TeUdjEgIVtT0RWyXz1EF1AeZQ0ib
         SWXf+s1XN/PAian7LYW6rlN7IEtPDxWNKcytWR7Qim8HZZtFBGZq5sWRzDZkqG1FKCO9
         bOCQs3FSlOZtONL+FBHj6+YVuAp1iFcpNdkNfmwpfhdMBZfr77vS9x0j+vPvTj8zEjCS
         nNBg==
X-Gm-Message-State: AOJu0YwekQAPpPxBryrSmzddWeAgPy7D3ktz0J5XQDLO0LM2K896cfl8
	53MZeNDuNKZcuPYWcP50zB9eIieGnxnJf9Nwux+b2cApqus0w/AjUHvJM1/GkUvFxOnkfX02+Jo
	LD5I=
X-Gm-Gg: ASbGncvnoYRh/bPYga5LrquwrNb+SE8zf08voaVD0y+Bz6tPpXJj2tEEkbpNWeFzI+O
	nGbs/foj276D0GqiMVUjoSoJT+xgrg9kjRW3V9GYiqf7Y4R5cnSdemW9XHOGvK2rK2OfdLJ4ets
	ufBGRA9P+PUqdDXiSKYwXi5irVzrKsGiA7T1HqfrF7lMJkdpMJ60u5vgxB/6wkZ3dOG0lI/ynST
	/YgW+F7VLb7WOM6hhtUQCorZvJjxGcqRo6aJxYcfrUYJHb/eB6HGDKqSwD6ULkGgfZmKyw42qSN
	GZReUIvgoGL1k+/I8gJ0aXWw+Bzw6DYU9/ZCebenTTexXl4UdgK965KYIMB8e+S1/JX5nvTsLWv
	qrFPUD/qExTzrVJBFgNPEaw==
X-Google-Smtp-Source: AGHT+IFs+Hyg3/qgGfM04VQJy6hexkwcypVkkd955EopjzAxNOwVqKRSb29t6l7fEI6wJVCNyo9dwQ==
X-Received: by 2002:a05:6402:42c7:b0:5ec:958b:6f5a with SMTP id 4fb4d7f45d1cf-5f0b4711e42mr2859878a12.28.1743777156026;
        Fri, 04 Apr 2025 07:32:36 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f087f0a0f3sm2567450a12.43.2025.04.04.07.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 07:32:35 -0700 (PDT)
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
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v7 06/11] tee: refactor params_from_user()
Date: Fri,  4 Apr 2025 16:31:29 +0200
Message-ID: <20250404143215.2281034-7-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250404143215.2281034-1-jens.wiklander@linaro.org>
References: <20250404143215.2281034-1-jens.wiklander@linaro.org>
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

