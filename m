Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7D0253321
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 10:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746180080; cv=none; b=Uj1NmD4CR+aU/RtPmsGUM4h6Pf8wLJqDrqWtGtlbHfaYs3gq8iSdNhzMjpojOzT7Gnzz8/fOiju8X26/XlOQg0yK1pdohUdVfeU2D6aOaMLIbIpTvxLUH2oGTcvdGdupYfns1iLf+WQWsM4bOaNHzIF6dWZxkJWWufDjO976+xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746180080; c=relaxed/simple;
	bh=qWKjVCqV0w+dT8t2+rlJ6OZyMHmR7QzWxO1E0IapEGo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fcuFmMfTZoZ6fUDHguU9qq3MQtBMktIFhGFMRei2uBBMamth2+S1HnMs0wLMTGmN1N5uHqMxGIPxU6jlCGHi8FZhUd2OLWrAkDJ6vhaklW1fprsAgw43qxGLt3W0+5G2T4rPdyAK6qK9HKqdmzy+hcCsPj/4tmGWbXH45VKEYdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YrBsu8dj; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YrBsu8dj"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aca99fc253bso286721366b.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 03:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746180076; x=1746784876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aeQOjVkq3EBC9GxZGgQiApE4KnUvSm/cM8uXSgvbEb0=;
        b=YrBsu8dj60THQ/lLgnbDxxj0ytkW+IB699DwzR4kwPi7K32LRQvG3Mt+UruelwfMDb
         KQa0boXjpXFUsqFezckawUTcGnrTSOhxWtSaYPvCAlfGKv3LSsvFfNb0ixrmqymAem+P
         V0CfDS5sg1oE3e0gPtzRR0aBlZD5FWem2yzvcTcwtN/95W8JVe3fvb4B/aPt3lUpUiYQ
         CkrxI2plcVNMz+5FkcZReP+6FoP5V7j7Pa04mir71WOGOjHr4JwOi6ydPQ9JAnKMdBXz
         t9A6AroV329bAcSyqF5kQ0a2dntQuAuanwwdSsHt/oX6/XLjGPjIGe5biEstzbDVo1KU
         CMwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746180076; x=1746784876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aeQOjVkq3EBC9GxZGgQiApE4KnUvSm/cM8uXSgvbEb0=;
        b=wJmyLj/SDBS7B3/8AVzKpuYr4L1PR5GJ9vTef5StsqevAWKQBi1T1kq5G2sQOLtBCA
         TaIn9n7P92obiZat+RzcHDCcP6ygfSOwUMlsLHhi18mB5hsato6pbxsYwwfXGN27Yd8/
         T3dCWeSDz+vfqvf+PXyPdTvtTB4WkjZavEVE0hvkgisismmm1Uwo7zboi1mFQF/TbxI/
         h5Syljv5veWbngVV7IdNyrZU+dr+yUz9ctXJdOpLpVCllcCtF8td8ix6j5kWgAAN785K
         nJ8o0VlBRwuxQUiiLyFTBZ9F/MQsst6q6Ml9utynmizGiyszlXEyUyIFmYZyWA1/75y+
         Tf2Q==
X-Gm-Message-State: AOJu0YyI7udq5N39CuHq/KRlx+wGZ4+P+HQWD/xbGPUrrJ071yk1Po36
	EKTv5JV9SqkwBuPWzV66nTPPdZkGPRTM4fWYf3fRLMihlxuqa5UwCWvlLSq9yozeMkWZeCFRhmD
	AG2Q=
X-Gm-Gg: ASbGncsA4CNIf6Q1Pr8zYw8a54z2c+oqT+DWlRWykfzL0zYJKdO9bzWBWSSMJIF9nv6
	5WO/7yNbFtKSiKqHbqscCfQzBcPxFBOTs15Pcd7IIDFO0ZkplRx38E81MN4qf1k6SbBY0ooxX8i
	gscTwx3yGR3o+8ojsjMGmqtIwZ+y9M+o+ZXIiHfUKVz+vh22rnQXuJfsbW1uV5qNBDjzkTbe6lb
	pS21ZbljXJamY4GJ87gnk/BIW6M8WDarCkfGOPEt0YP3ru301jEfvf93x/U7xsRa91oE7nNcCZV
	AFbqzypiPalIeST1yVaJUjRtOHSEpBarGKjyWjdKbJCH+kp5L6OhXbYHg0wxCnxKZMUypdy/nZ1
	sEVYtUg9tLeFxjTDVMA==
X-Google-Smtp-Source: AGHT+IFF9zknIP+dqaL1V+FMTT0LVPgHDeyr+aipRO30IcpUVrj2BVxgOIBN2MQg2BYB/rbfAelPxg==
X-Received: by 2002:a17:907:96a2:b0:ace:3c0b:1947 with SMTP id a640c23a62f3a-ad17ad39db1mr215652166b.4.1746180075654;
        Fri, 02 May 2025 03:01:15 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891473a1sm26030566b.4.2025.05.02.03.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 03:01:15 -0700 (PDT)
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
Subject: [PATCH v8 12/14] optee: support protected memory allocation
Date: Fri,  2 May 2025 11:59:26 +0200
Message-ID: <20250502100049.1746335-13-jens.wiklander@linaro.org>
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
index cfdae266548b..7acb43852c4b 100644
--- a/drivers/tee/optee/smc_abi.c
+++ b/drivers/tee/optee/smc_abi.c
@@ -1620,6 +1620,41 @@ static inline int optee_load_fw(struct platform_device *pdev,
 }
 #endif
 
+static int optee_protmem_pool_init(struct optee *optee)
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
 
+	rc = optee_protmem_pool_init(optee);
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

