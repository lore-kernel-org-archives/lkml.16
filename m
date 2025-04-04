Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281711F76C0
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 14:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743777165; cv=none; b=ROscclXO6x+JEzPmpOEj/i33YsSfcNjNyt/7dsRJMEJEA8+1FqFB7mjeNh179ysjhVpkwkLO3J/x28R32i6HjuUrXNNrTn9jaoCC+X4ELEg4hA3LqHWNthXUeFQViosYDrYcxEj/u1LFLpcGtydpnR/hCSI0N2vXHbHdFwYz39s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743777165; c=relaxed/simple;
	bh=zrFJZPMQUAiOjSEiHKHv7pGInMwAQy09WYmg9hEUSrs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oq+ZD8nPDFx2ws9AngtXk44LArghUwN9vv6KGcTViHEuJjfRmPqAzEObLijE7nS/UPDqbdLz6r7hWT23QSTLXL4eElIxkYnMs/vb0KSsRf7X7AeWueLekww7CKsqmqV9sKOdxZmRlmQ/WAtXlMjldlMFVqwebP5qp1T1Rv17RUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rrGQLYVa; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rrGQLYVa"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e66407963fso4036131a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 07:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743777162; x=1744381962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qqVUo9839x0Dz2BO0CX+S7eZwnYbMhFJhNNlz9OFNHU=;
        b=rrGQLYVa44eJrFGWp34Bq9/yY5Aa1Vob9zzUba4Qk7m6QzmnHj8vGcuckHqAtFLTnc
         WoBVEAxbos6KOTP9X0LxxR5Mhk5l+yM9CWs3KrcQBWeV5Ptf1kZuwTH4AFyHhEJjOGVM
         KaEb24xZTMvfBdez5ZTk8zIOdYZABJYr1h6YUcONlfOeNz2FXg1Qez/qaRh18An7p7JX
         wojOaWKHJ5fGuWeUna44dNDvrltENpyVxyku+pXiq6k4NNhk8Lfjx/9FUptRusbYRbHV
         tJSOphQgA+DQnpZZnZBJ5mqxhYq34cxZvwQYgd8KZ5LdFlKK8I9f1PKwNSs3hpJ9IJRj
         MwGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743777162; x=1744381962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qqVUo9839x0Dz2BO0CX+S7eZwnYbMhFJhNNlz9OFNHU=;
        b=rXLMb9Sg/IffUU+F1NbnZHHhIXXZZWyR1oo22dM/2inngrxc7HV2Ixr0aPOF3GedKV
         171RWIIuhbZp75+UqloFjNUDKMcB2SRujFxJg0ZS4sY13w5ORaE88UCjaaqK1vsb35dB
         CEH7svMGR9f8ekHbolYslh/fZxMw6et3czIrHU3QNyKMUxyEgd0c+eXlMwYvKC/bsV/A
         untEQTr4LmiLF/c9O9gUuk8jV6+Ej1muAx2AMQjgVwlsM88y0UZ/aNUNL5Ufb74ySLPt
         dujcgQbI+Uy669NLNw2ZJGCOgMAvGZ9PS3ihVDvDau4tA+7ohmM6Y1BaloclZysITQ+/
         XB2Q==
X-Gm-Message-State: AOJu0YwOY/b7XBda5EXQNTZdQ88A/GvDGmS2uRQRIA8opEwe1u6BS1PJ
	sGEXaO7Y8ArhpAGM0nwQ05HpFzvi9UKWZ4oG+/8vPZAXKgI7gHq2gsTvQB6wrB6jCl25nPnDp+M
	7F8c=
X-Gm-Gg: ASbGnctqzh3j1GWt1nlddGhe3h3TmtRbuz5IaVmNY2fZp1h7VK9EiYqtg02tqcHNo/R
	uGDIvJco/u8IpbIWxlB+zM7uLGzKHsqzvz2wEJl41wZCQJ8yJ9yIRX5E0kP3cR6wDav+RMeV8Wc
	5c0BH363hbmxafy8hNPiZjVnKDr0ASoLg0dHQTjCL66qRkCrDHHD0iJulX7DAhtadjA2jrurGgT
	xUJdX+J6qQUYGVaiRqHWefbl9P4eiUA+gbPRI9SvOLGvSTuOXyMIxY5l6zemBkKM13cQ0JJLEq6
	W86edf/IIwF6GEGgRhjXfuI5aq1oNiz+uxiGN/nJV7Fq6WtoxF2G093yXEX4UhFmb9EgCKFpV5n
	m+SbdERPAUBGZIXg6KCeR8w==
X-Google-Smtp-Source: AGHT+IGI4VswEXbkr8wvPcpZqZzKqeC9kMo0saIbDftZfl+T9cBHd+BN83SFjwOfSSTztOoIdlkUdw==
X-Received: by 2002:a05:6402:5cb:b0:5ec:cc28:1a78 with SMTP id 4fb4d7f45d1cf-5f0b657a59dmr2556677a12.20.1743777161950;
        Fri, 04 Apr 2025 07:32:41 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f087f0a0f3sm2567450a12.43.2025.04.04.07.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 07:32:41 -0700 (PDT)
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
Subject: [PATCH v7 09/11] optee: support protected memory allocation
Date: Fri,  4 Apr 2025 16:31:32 +0200
Message-ID: <20250404143215.2281034-10-jens.wiklander@linaro.org>
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

Add support in the OP-TEE backend driver for protected memory
allocation. The support is limited to only the SMC ABI and for secure
video buffers.

OP-TEE is probed for the range of protected physical memory and a
memory pool allocator is initialized if OP-TEE have support for such
memory.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/tee/optee/core.c    |  1 +
 drivers/tee/optee/smc_abi.c | 44 +++++++++++++++++++++++++++++++++++--
 2 files changed, 43 insertions(+), 2 deletions(-)

diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
index c75fddc83576..c7fd8040480e 100644
--- a/drivers/tee/optee/core.c
+++ b/drivers/tee/optee/core.c
@@ -181,6 +181,7 @@ void optee_remove_common(struct optee *optee)
 	tee_device_unregister(optee->supp_teedev);
 	tee_device_unregister(optee->teedev);
 
+	tee_device_unregister_all_dma_heaps(optee->teedev);
 	tee_shm_pool_free(optee->pool);
 	optee_supp_uninit(&optee->supp);
 	mutex_destroy(&optee->call_queue.mutex);
diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
index cfdae266548b..c10b38b23586 100644
--- a/drivers/tee/optee/smc_abi.c
+++ b/drivers/tee/optee/smc_abi.c
@@ -1620,6 +1620,41 @@ static inline int optee_load_fw(struct platform_device *pdev,
 }
 #endif
 
+static int optee_rstmem_pool_init(struct optee *optee)
+{
+	enum tee_dma_heap_id heap_id = TEE_DMA_HEAP_SECURE_VIDEO_PLAY;
+	struct tee_protmem_pool *pool;
+	int rc;
+
+	if (optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_PROTMEM) {
+		union {
+			struct arm_smccc_res smccc;
+			struct optee_smc_get_protmem_config_result result;
+		} res;
+
+		optee->smc.invoke_fn(OPTEE_SMC_GET_PROTMEM_CONFIG, 0, 0, 0, 0,
+				     0, 0, 0, &res.smccc);
+		if (res.result.status != OPTEE_SMC_RETURN_OK) {
+			pr_err("Secure Data Path service not available\n");
+			return 0;
+		}
+
+		pool = tee_protmem_static_pool_alloc(res.result.start,
+						     res.result.size);
+		if (IS_ERR(pool))
+			return PTR_ERR(pool);
+
+		rc = tee_device_register_dma_heap(optee->teedev, heap_id, pool);
+		if (rc)
+			goto err;
+	}
+
+	return 0;
+err:
+	pool->ops->destroy_pool(pool);
+	return rc;
+}
+
 static int optee_probe(struct platform_device *pdev)
 {
 	optee_invoke_fn *invoke_fn;
@@ -1715,7 +1750,7 @@ static int optee_probe(struct platform_device *pdev)
 	optee = kzalloc(sizeof(*optee), GFP_KERNEL);
 	if (!optee) {
 		rc = -ENOMEM;
-		goto err_free_pool;
+		goto err_free_shm_pool;
 	}
 
 	optee->ops = &optee_ops;
@@ -1788,6 +1823,10 @@ static int optee_probe(struct platform_device *pdev)
 		pr_info("Asynchronous notifications enabled\n");
 	}
 
+	rc = optee_rstmem_pool_init(optee);
+	if (rc)
+		goto err_notif_uninit;
+
 	/*
 	 * Ensure that there are no pre-existing shm objects before enabling
 	 * the shm cache so that there's no chance of receiving an invalid
@@ -1823,6 +1862,7 @@ static int optee_probe(struct platform_device *pdev)
 		optee_disable_shm_cache(optee);
 	optee_smc_notif_uninit_irq(optee);
 	optee_unregister_devices();
+	tee_device_unregister_all_dma_heaps(optee->teedev);
 err_notif_uninit:
 	optee_notif_uninit(optee);
 err_close_ctx:
@@ -1839,7 +1879,7 @@ static int optee_probe(struct platform_device *pdev)
 	tee_device_unregister(optee->teedev);
 err_free_optee:
 	kfree(optee);
-err_free_pool:
+err_free_shm_pool:
 	tee_shm_pool_free(pool);
 	if (memremaped_shm)
 		memunmap(memremaped_shm);
-- 
2.43.0

