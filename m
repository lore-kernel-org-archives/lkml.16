Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8DA2C0312
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 13:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749561387; cv=none; b=qvgMxYO4YUfUqxgIfw83eDB5EZI+2ypF17TCnCNUVI61fOctXQr8ceh6oGGneVPVFJu3GXsN4o2WREDimUIuWCdVMb/FpkScWgkC70QTeI041ig/Q6EBhHvYSjhLn6l2QCfJFC2az7DF4/kZd7i5yyD7f04+aMdM7EcDWgVR0FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749561387; c=relaxed/simple;
	bh=5UwVZIJDxgCN+xBsOIv6QYV6z9KChYCgV/TMz/0vRds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lNtWQmsPm/aPuZ08eD8gc2SKC9drxkfYLkpwgExDTvFlPe44h/Jfs0UZrBVAfSsa5dBxkrMRKCfftwcQTT0eZNlF79Wll6a0guNiZczgr6EgGWLLs5UNpiJ3Cey3xcBG4Fd7C93u7Pjh52n2wlnqzhtCcpRNhDZ12uVBRO+E92Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BRmXFIvy; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BRmXFIvy"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6070293103cso9007286a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 06:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749561383; x=1750166183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eLopRTDSnVY9U0JoSkY1CPfa4nNPv8DwxUkmGK1mPDY=;
        b=BRmXFIvyRyCqohouBDBLGTHL/Sv7/0Cu9HT3ZzyBVgWbRRPt8+4U2rF4NFN6xhkQLp
         hA0rXoMFsj1qpLymibHUjDvI9jBCuAuyOalKCMSV5Ornf91Jxc2/T67NoSZtTvaN+zpy
         pWaPEyauBwtrDZwmujNEaog1VvZlZONdXK2gBx9KfsAYBQxs049RZr2ZEertD1u/v+v+
         HpvqIPacwrrbLcV8wtJNeQuQ/jXzj5BAd0Z5jSW3v6khNahDnZIpHrm2Q1VYGnawzwKE
         1drUkPUndf0ined8JZZaYgE5isQJ3KTEYmZMvZZoMIexD4wvwmst7qXQ/+5LTWux9R50
         ek7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749561383; x=1750166183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eLopRTDSnVY9U0JoSkY1CPfa4nNPv8DwxUkmGK1mPDY=;
        b=Hwnd9ukaIXAt6uQDEHGmw8RA1FPz2bm1+ZGMsJpFkz+Pyp0+61Xo3HPfOQS+0nO7L4
         PqwdV2l2HUjt716Qt9U8xFJhLk0BvD79xL+LdMQYniVMv2wHl8xqGtT6TM1EfmGwdgeU
         0vK+ZfnjQo/r75fkVbw3rIToJAgKsOTf9AHBZNJ6lOjcZa+gg48RIxIScJ0Yv0Ukj+Qo
         mzITyoUHgaNr2Ei4oZgKogtDiIIfMXPgynLpwlyE63N+F9l8618qoMGIAVifu2Ie81ix
         ioE+z/f9Q8TbNuBqai5iQaAga2obDJy6ycc0JCuuHyOeheK5j6CKcRrUP2dPP87VK7x0
         jQvA==
X-Gm-Message-State: AOJu0YxJfZz4VUnXYq1wIq97aVKMpgpVjSK1WNc/wtKOg/YJOwL5BHBu
	H790iEtzt4whcwASyDyHGhDOyKwnZTMFmdmhTGJ9JudcScqcOc/BbmDPS1opTjW75HbMHCyx3Dm
	UBrElBqE=
X-Gm-Gg: ASbGncvZ2DOLNlsWD2YW5UupwUXKBWjT6Ll9qgtR5Zgjc9lM9nSugrvOMhKdj0oQr3F
	zfYvYQAjwnW9NPYPM23hXs6yUs+pqLkHzqk9+7v4tTfwrtzO90UoF9yLkNIFb75xPZAgcM1fl+S
	3KwFsYKyLWVe5O3BS+4rpJCJYXo7cNT32HN7d5lDCdHcsQxE0jXI2R5nVKId1h09TiBVuTrkvWK
	CIH3uhx7k1rslaXI9hjGg0MwIq/lkNgvCswQpTOjt4z4yNOlZ50rMyRnRkpcJKuzve7EEVSyHHJ
	zJ2RWqrru+XzsuqcwBf0h0z+QB0VeSN78KD4Sw0atIMfTy5+MfIHdNKbFiLeVReU1X3rVxDlrzR
	fA+A3wpMLfJuDXQ9DxXg7ECVz5aRAcw148+Sc2WA=
X-Google-Smtp-Source: AGHT+IFyL5VC1uzluSvFg2VJoydHPgfSnA6phexiqPEMkd8jHiXUwY4vJhu2YNpEpylX50vqAtDFrQ==
X-Received: by 2002:a17:907:7fa2:b0:ad2:3f9a:649f with SMTP id a640c23a62f3a-ade1a9c8022mr1430120666b.42.1749561382805;
        Tue, 10 Jun 2025 06:16:22 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade3206a1efsm643651666b.67.2025.06.10.06.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:16:22 -0700 (PDT)
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
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v10 7/9] optee: support protected memory allocation
Date: Tue, 10 Jun 2025 15:13:51 +0200
Message-ID: <20250610131600.2972232-8-jens.wiklander@linaro.org>
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

Add support in the OP-TEE backend driver for protected memory
allocation. The support is limited to only the SMC ABI and for secure
video buffers.

OP-TEE is probed for the range of protected physical memory and a
memory pool allocator is initialized if OP-TEE have support for such
memory.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/tee/optee/Kconfig         |  5 +++
 drivers/tee/optee/core.c          | 10 +++++
 drivers/tee/optee/optee_private.h |  2 +
 drivers/tee/optee/smc_abi.c       | 70 ++++++++++++++++++++++++++++++-
 4 files changed, 85 insertions(+), 2 deletions(-)

diff --git a/drivers/tee/optee/Kconfig b/drivers/tee/optee/Kconfig
index 7bb7990d0b07..50d2051f7f20 100644
--- a/drivers/tee/optee/Kconfig
+++ b/drivers/tee/optee/Kconfig
@@ -25,3 +25,8 @@ config OPTEE_INSECURE_LOAD_IMAGE
 
 	  Additional documentation on kernel security risks are at
 	  Documentation/tee/op-tee.rst.
+
+config OPTEE_STATIC_PROTMEM_POOL
+	bool
+	depends on HAS_IOMEM && TEE_DMABUF_HEAPS
+	default y
diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
index c75fddc83576..4b14a7ac56f9 100644
--- a/drivers/tee/optee/core.c
+++ b/drivers/tee/optee/core.c
@@ -56,6 +56,15 @@ int optee_rpmb_intf_rdev(struct notifier_block *intf, unsigned long action,
 	return 0;
 }
 
+int optee_set_dma_mask(struct optee *optee, u_int pa_width)
+{
+	u64 mask = DMA_BIT_MASK(min(64, pa_width));
+
+	optee->teedev->dev.dma_mask = &optee->teedev->dev.coherent_dma_mask;
+
+	return dma_set_mask_and_coherent(&optee->teedev->dev, mask);
+}
+
 static void optee_bus_scan(struct work_struct *work)
 {
 	WARN_ON(optee_enumerate_devices(PTA_CMD_GET_DEVICES_SUPP));
@@ -181,6 +190,7 @@ void optee_remove_common(struct optee *optee)
 	tee_device_unregister(optee->supp_teedev);
 	tee_device_unregister(optee->teedev);
 
+	tee_device_unregister_all_dma_heaps(optee->teedev);
 	tee_shm_pool_free(optee->pool);
 	optee_supp_uninit(&optee->supp);
 	mutex_destroy(&optee->call_queue.mutex);
diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee_private.h
index dc0f355ef72a..5e3c34802121 100644
--- a/drivers/tee/optee/optee_private.h
+++ b/drivers/tee/optee/optee_private.h
@@ -272,6 +272,8 @@ struct optee_call_ctx {
 
 extern struct blocking_notifier_head optee_rpmb_intf_added;
 
+int optee_set_dma_mask(struct optee *optee, u_int pa_width);
+
 int optee_notif_init(struct optee *optee, u_int max_key);
 void optee_notif_uninit(struct optee *optee);
 int optee_notif_wait(struct optee *optee, u_int key, u32 timeout);
diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
index f0c3ac1103bb..cf106d15e64e 100644
--- a/drivers/tee/optee/smc_abi.c
+++ b/drivers/tee/optee/smc_abi.c
@@ -1584,6 +1584,68 @@ static inline int optee_load_fw(struct platform_device *pdev,
 }
 #endif
 
+static struct tee_protmem_pool *static_protmem_pool_init(struct optee *optee)
+{
+#if IS_ENABLED(CONFIG_OPTEE_STATIC_PROTMEM_POOL)
+	union {
+		struct arm_smccc_res smccc;
+		struct optee_smc_get_protmem_config_result result;
+	} res;
+	struct tee_protmem_pool *pool;
+	void *p;
+	int rc;
+
+	optee->smc.invoke_fn(OPTEE_SMC_GET_PROTMEM_CONFIG, 0, 0, 0, 0,
+			     0, 0, 0, &res.smccc);
+	if (res.result.status != OPTEE_SMC_RETURN_OK)
+		return ERR_PTR(-EINVAL);
+
+	rc = optee_set_dma_mask(optee, res.result.pa_width);
+	if (rc)
+		return ERR_PTR(rc);
+
+	/*
+	 * Map the memory as uncached to make sure the kernel can work with
+	 * __pfn_to_page() and friends since that's needed when passing the
+	 * protected DMA-buf to a device. The memory should otherwise not
+	 * be touched by the kernel since it's likely to cause an external
+	 * abort due to the protection status.
+	 */
+	p = devm_memremap(&optee->teedev->dev, res.result.start,
+			  res.result.size, MEMREMAP_WC);
+	if (IS_ERR(p))
+		return p;
+
+	pool = tee_protmem_static_pool_alloc(res.result.start, res.result.size);
+	if (IS_ERR(pool))
+		devm_memunmap(&optee->teedev->dev, p);
+
+	return pool;
+#else
+	return ERR_PTR(-EINVAL);
+#endif
+}
+
+static int optee_protmem_pool_init(struct optee *optee)
+{
+	enum tee_dma_heap_id heap_id = TEE_DMA_HEAP_SECURE_VIDEO_PLAY;
+	struct tee_protmem_pool *pool = ERR_PTR(-EINVAL);
+	int rc;
+
+	if (!(optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_PROTMEM))
+		return 0;
+
+	pool = static_protmem_pool_init(optee);
+	if (IS_ERR(pool))
+		return PTR_ERR(pool);
+
+	rc = tee_device_register_dma_heap(optee->teedev, heap_id, pool);
+	if (rc)
+		pool->ops->destroy_pool(pool);
+
+	return rc;
+}
+
 static int optee_probe(struct platform_device *pdev)
 {
 	optee_invoke_fn *invoke_fn;
@@ -1679,7 +1741,7 @@ static int optee_probe(struct platform_device *pdev)
 	optee = kzalloc(sizeof(*optee), GFP_KERNEL);
 	if (!optee) {
 		rc = -ENOMEM;
-		goto err_free_pool;
+		goto err_free_shm_pool;
 	}
 
 	optee->ops = &optee_ops;
@@ -1752,6 +1814,9 @@ static int optee_probe(struct platform_device *pdev)
 		pr_info("Asynchronous notifications enabled\n");
 	}
 
+	if (optee_protmem_pool_init(optee))
+		pr_info("Protected memory service not available\n");
+
 	/*
 	 * Ensure that there are no pre-existing shm objects before enabling
 	 * the shm cache so that there's no chance of receiving an invalid
@@ -1787,6 +1852,7 @@ static int optee_probe(struct platform_device *pdev)
 		optee_disable_shm_cache(optee);
 	optee_smc_notif_uninit_irq(optee);
 	optee_unregister_devices();
+	tee_device_unregister_all_dma_heaps(optee->teedev);
 err_notif_uninit:
 	optee_notif_uninit(optee);
 err_close_ctx:
@@ -1803,7 +1869,7 @@ static int optee_probe(struct platform_device *pdev)
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

