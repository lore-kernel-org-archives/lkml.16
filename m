Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0EE0246790
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 10:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746180084; cv=none; b=L38GDCBGI89qJRxc1cJPSomT6ry5YX5bmVn9yTE7tZyK+bxZiIuCJaFUbXEIldAr9T/emKA/5ONcFehZbMzBVt3Bn8JqRVTMW7N1xwJ6ClH3S1cQeEgg9pVeGum13Q+vB1K7MA2tjs7/oT03SQZ1DBUMDyVl5xw/ITxb468sKx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746180084; c=relaxed/simple;
	bh=ZUwd027OBe08q9YquZgjzVa7y9MBnIPHNh4bwe/oj4A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YPB3P7aR5BXnI3yQSHPMbrxiXqWP7rm/KUMZUWerV1k+3kBVQM4kE69tp7DnH4I4HnLDboTmxz0tbqx2Bs2Rbz/1OkEFZ4EuYNB8UhSqtvjxcBfFQXH8+VwjotpHACgxIb67nRRHwQt9GfWpbU/+yiU4iGlpUEFZ90dEM0VLkaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Sblha9Uu; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Sblha9Uu"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-acbb48bad09so323450866b.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 03:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746180080; x=1746784880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OlmCXINH+dafzBgYNqgq0wXLz20MQsNU7TGuhsodLww=;
        b=Sblha9UuBFwGdLzFIysbFAxi7PT4Gcn5iwHs4hWXknwgdomnQh++J+gnfryQU+WWEC
         OTWXj5RjZNVScIH4MJLgs1FsrgizetRO2RNyUxyrQsngYbGTpHycD6Zj2YlpDLExYhqF
         Y8fOnm9qfwy21vRD91URaydv+h1AW1g33vxt/gY+DTlM95R3Q7odqJAVjk4V8cl9zG+Z
         FVQI0IMlDneVsNp6CHT6OAF+6Sndg+BE+63mESheBK53WDrzKcGMO+4w6ZF9t9Nzlwi5
         qH8AO9Qzn29RSVsUrRX/FyjbiQMZw2jBLPtFA5hs1/j5naudVWdtiwlxq0FdzjxaZCvl
         A2YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746180080; x=1746784880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OlmCXINH+dafzBgYNqgq0wXLz20MQsNU7TGuhsodLww=;
        b=if4jjRLCCtw/ckjmZjvX/bDOWmtmUo9YXW/2GS8/X+XKNtsCdRvsxLZPMs2oeAeaDI
         x0rfETsvv8O5apTd0OhZDlOEeDKkVvlifi3GdvjO7idC7UZCkIzAQ+j0Rz0ceF6YvOnB
         jJHnYxrHNzWBJ/sti51aiVbwwPGTjR01/eZBKr11P8mvkeZhxm8w+7xfu/xamgiDHm1B
         2zbjVifTc8FAa3cE/quG8gtbds2z9Se5CUfxgMCTooTqZnNR3GyTIvdX+E2P8NOMXkZS
         dxqezUdXzl3WlPSa9xB6EWH15dPmw6dQB9YNS0Mt7o3hNjx83hA0EBSAKnH1tqd6tEoT
         iw5A==
X-Gm-Message-State: AOJu0YwkC9cIzMS4BbZRCShTJnHB0sq/Tg1BNKspNGihOxKPV1nPNssJ
	YdTIuZfGrztc6TujUNTxcyRDK8Zn7mZmNnIxdaps18DMexSYYWr92X50J4eIZT8g+/tED/Fy1oW
	7ie8=
X-Gm-Gg: ASbGnctvsLOpYViu6rcU74PWS3yGUeOpIPSoJSEjeDjyFQHIIRCmQordE4d4WQaz04C
	TVdOYY0G6/AkR99uE62GK8z5Z7wD7ekD/OJioHGom8eP0A05xBN/0ewn3E2OA6K43go+C+KjOzO
	y6YBiJOSdqfqqrn3aOEnicLiKRqMGImO9Vp3TgLV+Ano3XVMXDFMwusw6JDUgxfe4Uczp2ssTmk
	Nm1mi3sop+0jPQ7/VPN8JPDQ1Q+BnOpW1lhO73hy8e5GxwUmtiWPGYM6JYqZohj9whoePHJ9pu1
	wDuX+xnpfC47U6Vioay/4RvTsI6jc9LZyqSjfWOKfYi4nluybZfjdihU4qQIXitrFC+YMwXG4bl
	S1a1psm0GoG+tfoop2A==
X-Google-Smtp-Source: AGHT+IEYfv3P+wsN6CjsHEtvD+7RxYmI0A0Zuh0sF27ecW7PLXPxnJ4H/XpyhrWak3QZy6czVPn/hg==
X-Received: by 2002:a17:907:728a:b0:ace:5461:81dd with SMTP id a640c23a62f3a-ad17acfda03mr249587766b.3.1746180079442;
        Fri, 02 May 2025 03:01:19 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891473a1sm26030566b.4.2025.05.02.03.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 03:01:18 -0700 (PDT)
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
Subject: [PATCH v8 14/14] optee: smc abi: dynamic protected memory allocation
Date: Fri,  2 May 2025 11:59:28 +0200
Message-ID: <20250502100049.1746335-15-jens.wiklander@linaro.org>
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

Add support in the OP-TEE backend driver for dynamic protected memory
allocation using the SMC ABI.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/tee/optee/smc_abi.c | 103 +++++++++++++++++++++++++++++-------
 1 file changed, 85 insertions(+), 18 deletions(-)

diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
index 7acb43852c4b..766e7f5a3953 100644
--- a/drivers/tee/optee/smc_abi.c
+++ b/drivers/tee/optee/smc_abi.c
@@ -1001,6 +1001,70 @@ static int optee_smc_do_call_with_arg(struct tee_context *ctx,
 	return rc;
 }
 
+static int optee_smc_lend_protmem(struct optee *optee, struct tee_shm *protmem,
+				  u16 *end_points, unsigned int ep_count,
+				  u32 use_case)
+{
+	struct optee_shm_arg_entry *entry;
+	struct optee_msg_arg *msg_arg;
+	struct tee_shm *shm;
+	u_int offs;
+	int rc;
+
+	msg_arg = optee_get_msg_arg(optee->ctx, 2, &entry, &shm, &offs);
+	if (IS_ERR(msg_arg))
+		return PTR_ERR(msg_arg);
+
+	msg_arg->cmd = OPTEE_MSG_CMD_LEND_PROTMEM;
+	msg_arg->params[0].attr = OPTEE_MSG_ATTR_TYPE_VALUE_INPUT;
+	msg_arg->params[0].u.value.a = use_case;
+	msg_arg->params[1].attr = OPTEE_MSG_ATTR_TYPE_TMEM_INPUT;
+	msg_arg->params[1].u.tmem.buf_ptr = protmem->paddr;
+	msg_arg->params[1].u.tmem.size = protmem->size;
+	msg_arg->params[1].u.tmem.shm_ref = (u_long)protmem;
+
+	rc = optee->ops->do_call_with_arg(optee->ctx, shm, offs, false);
+	if (rc)
+		goto out;
+	if (msg_arg->ret != TEEC_SUCCESS) {
+		rc = -EINVAL;
+		goto out;
+	}
+	protmem->sec_world_id = (u_long)protmem;
+
+out:
+	optee_free_msg_arg(optee->ctx, entry, offs);
+	return rc;
+}
+
+static int optee_smc_reclaim_protmem(struct optee *optee,
+				     struct tee_shm *protmem)
+{
+	struct optee_shm_arg_entry *entry;
+	struct optee_msg_arg *msg_arg;
+	struct tee_shm *shm;
+	u_int offs;
+	int rc;
+
+	msg_arg = optee_get_msg_arg(optee->ctx, 1, &entry, &shm, &offs);
+	if (IS_ERR(msg_arg))
+		return PTR_ERR(msg_arg);
+
+	msg_arg->cmd = OPTEE_MSG_CMD_RECLAIM_PROTMEM;
+	msg_arg->params[0].attr = OPTEE_MSG_ATTR_TYPE_RMEM_INPUT;
+	msg_arg->params[0].u.rmem.shm_ref = (u_long)protmem;
+
+	rc = optee->ops->do_call_with_arg(optee->ctx, shm, offs, false);
+	if (rc)
+		goto out;
+	if (msg_arg->ret != TEEC_SUCCESS)
+		rc = -EINVAL;
+
+out:
+	optee_free_msg_arg(optee->ctx, entry, offs);
+	return rc;
+}
+
 /*
  * 5. Asynchronous notification
  */
@@ -1252,6 +1316,8 @@ static const struct optee_ops optee_ops = {
 	.do_call_with_arg = optee_smc_do_call_with_arg,
 	.to_msg_param = optee_to_msg_param,
 	.from_msg_param = optee_from_msg_param,
+	.lend_protmem = optee_smc_lend_protmem,
+	.reclaim_protmem = optee_smc_reclaim_protmem,
 };
 
 static int enable_async_notif(optee_invoke_fn *invoke_fn)
@@ -1622,11 +1688,14 @@ static inline int optee_load_fw(struct platform_device *pdev,
 
 static int optee_protmem_pool_init(struct optee *optee)
 {
+	bool protm = optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_PROTMEM;
+	bool dyn_protm = optee->smc.sec_caps &
+			 OPTEE_SMC_SEC_CAP_DYNAMIC_PROTMEM;
 	enum tee_dma_heap_id heap_id = TEE_DMA_HEAP_SECURE_VIDEO_PLAY;
-	struct tee_protmem_pool *pool;
-	int rc;
+	struct tee_protmem_pool *pool = ERR_PTR(-EINVAL);
+	int rc = -EINVAL;
 
-	if (optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_PROTMEM) {
+	if (protm) {
 		union {
 			struct arm_smccc_res smccc;
 			struct optee_smc_get_protmem_config_result result;
@@ -1634,25 +1703,24 @@ static int optee_protmem_pool_init(struct optee *optee)
 
 		optee->smc.invoke_fn(OPTEE_SMC_GET_PROTMEM_CONFIG, 0, 0, 0, 0,
 				     0, 0, 0, &res.smccc);
-		if (res.result.status != OPTEE_SMC_RETURN_OK) {
-			pr_err("Secure Data Path service not available\n");
-			return 0;
-		}
+		if (res.result.status == OPTEE_SMC_RETURN_OK)
+			pool = tee_protmem_static_pool_alloc(res.result.start,
+							     res.result.size);
+	}
 
-		pool = tee_protmem_static_pool_alloc(res.result.start,
-						     res.result.size);
-		if (IS_ERR(pool))
-			return PTR_ERR(pool);
+	if (dyn_protm && IS_ERR(pool))
+		pool = optee_protmem_alloc_cma_pool(optee, heap_id);
 
+	if (!IS_ERR(pool)) {
 		rc = tee_device_register_dma_heap(optee->teedev, heap_id, pool);
 		if (rc)
-			goto err;
+			pool->ops->destroy_pool(pool);
 	}
 
+	if (protm || dyn_protm)
+		return rc;
+
 	return 0;
-err:
-	pool->ops->destroy_pool(pool);
-	return rc;
 }
 
 static int optee_probe(struct platform_device *pdev)
@@ -1823,9 +1891,8 @@ static int optee_probe(struct platform_device *pdev)
 		pr_info("Asynchronous notifications enabled\n");
 	}
 
-	rc = optee_protmem_pool_init(optee);
-	if (rc)
-		goto err_notif_uninit;
+	if (optee_protmem_pool_init(optee))
+		pr_info("Protected memory service not available\n");
 
 	/*
 	 * Ensure that there are no pre-existing shm objects before enabling
-- 
2.43.0

