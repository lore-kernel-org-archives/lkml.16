Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1569427FB2D
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 15:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747754702; cv=none; b=Q/XTCW9xBx153TKBEQnIaAeGAhW6Ecz2VfWk59kerZWIFyHr70kXyfqmBG2sHzMRt+QzTDTlDD/0CXxaUSkYufsixBoBZQp9TnjwwwpT5Rh/c5P0vUcxBRvPIiY8XTIREuKfKD0e4QTgJP4YnTgpk8NDm/l6nV7eaLfPNQXpNj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747754702; c=relaxed/simple;
	bh=HrWAkjXzo1cwOQkzp5D5PLjihxqiuqVqgMCi74TCylM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lBRZMQNCaz5FS+VnbJCsLuPm8DsuPz/36gFQUkhNVBcOCktKkRGVbX9jiTFqElWyIqQh209M1s1IkbgI48E+fAVATOz4h+VQxNX7ClIFp1/QuSsUnFsYVcApwaHxGF13RDnbYHWE/PQyhyZ5IVQQv6cMv+X3/l45vnQJIgTpwNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gfXFU4PG; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gfXFU4PG"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-601dfef6a8dso4003267a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 08:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747754697; x=1748359497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sws8LggPb3Nr4WEIwk49/i4GQcd2qsiJjDBUK0g1c0s=;
        b=gfXFU4PGCj+JV99lZR6A1oIf0EDlGCRXtA28zlGjNR0sRtrTG91gmKlcoGC6+Z2voy
         PPtx+UOtskL9zX8R2Ldr8ih+VS1ErUFk61EqHorpTAihOc6YUmXgRpVZfZqjcpv9MRQd
         sAfRvtCjDMYBKV/jpFAKpo7/f4p7nNgJFkWnegmZBfTEH+VIw0nAqtq29AxuoWVGBTN3
         Qstpz25KOrjBjX6fSyeARTzQAIXN9yrdgrKUfnCQgnKbCslsxya8H0hrLZXOGUAUwClX
         4YO/GhKegTdO6JDUOHgHFMPGY6mAgX0uiz3cExqCIUYrtbDZLF7PzRXsuAh22cs6TUFD
         mi6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747754698; x=1748359498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sws8LggPb3Nr4WEIwk49/i4GQcd2qsiJjDBUK0g1c0s=;
        b=I00er7KfSJsaudx1cXZnn746tsW6Tl8RPOCG03gE0RibSUK/1aIw8WVZu7GdCuPsRW
         iozFM/OunxG6L4YIdirkKFspkC6sJpab7jwp3r21IiUeCFsvM/At6OkjL3Whoiaq3y+n
         btHrybPvQfx00capxrxzw3BMDjTTaElCdo+W/9x2hUVgPEFcNsmDYpLzw7/fT4Ap6SIz
         DQqrLRx1zwAJX1LJBMHyd+A/tu9gjEqRRB6Z98MqZHPySxY3q6s3G9WI6uINEY+C8FB1
         ISjiGhy90LZ7BYMUtB4LaOJlCgU2TP/7iTtVHy+3QbWgpqPwdiMFB0TuaOF4Ahpxe0kP
         m7Rg==
X-Gm-Message-State: AOJu0YyrgutEHMsmzZidXJkSnuAaUeekncncOwpzc7H5Ks/Ikakqe1Py
	2ojF21JaE2uYFAZq8+Et6VQ4jWko4sRBbamdujTW4/g0gaxOErmWlcRO/VDICKP6y2IshpfYE19
	CEr3RSpA=
X-Gm-Gg: ASbGnctMfpMp8NKUw6qXgFUu9SA7tsiwLzioSQITqILVsEzwk91PLCA9bMKqx1r9X1j
	Rw590ge1oB0PhCuIJGnRhYR0ilPITXR16hXqh77eSgYHfqEyWam3ydvaKEezpWfFVW9LUx5AKMf
	TBNY7CuJ7UJlOw5hdCAConb5IkO3lEy8fej61kW3aaDWDe192tNkp0X7m1n1vdHBnSkE6D5UyP0
	j2aTb0yxPJu8a4MQVeEMOC20g93CIlFEd2n+CGLYpMn9eR5mN3FhtXs6DxP3X7nDaRqd7z/B0fp
	x913x8Ga41e79P6fsSq+v6CVOATwaKfjWsPTok6DLaArKa5E6ogFdtk86ExvmyWiiRDyI1eekBq
	01tKVYrFSzTzmYhT2o9rWPcpvAmkmd+A6MD/rXV0=
X-Google-Smtp-Source: AGHT+IFajjrVIsC7kJISaAObbiybAYfu3AaUSsn1KJ4AT03AxVtsB+czB4nAf85bGG6wnrUQQg0qnQ==
X-Received: by 2002:a17:907:7f08:b0:ac7:3817:d8da with SMTP id a640c23a62f3a-ad52d609170mr1346626366b.52.1747754697525;
        Tue, 20 May 2025 08:24:57 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d278257sm742608766b.82.2025.05.20.08.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 08:24:56 -0700 (PDT)
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
Subject: [PATCH v9 9/9] optee: smc abi: dynamic protected memory allocation
Date: Tue, 20 May 2025 17:16:52 +0200
Message-ID: <20250520152436.474778-10-jens.wiklander@linaro.org>
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

Add support in the OP-TEE backend driver for dynamic protected memory
allocation using the SMC ABI.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/tee/optee/smc_abi.c | 102 ++++++++++++++++++++++++++++++------
 1 file changed, 85 insertions(+), 17 deletions(-)

diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
index f3cae8243785..6b3fbe7f0909 100644
--- a/drivers/tee/optee/smc_abi.c
+++ b/drivers/tee/optee/smc_abi.c
@@ -965,6 +965,70 @@ static int optee_smc_do_call_with_arg(struct tee_context *ctx,
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
@@ -1216,6 +1280,8 @@ static const struct optee_ops optee_ops = {
 	.do_call_with_arg = optee_smc_do_call_with_arg,
 	.to_msg_param = optee_to_msg_param,
 	.from_msg_param = optee_from_msg_param,
+	.lend_protmem = optee_smc_lend_protmem,
+	.reclaim_protmem = optee_smc_reclaim_protmem,
 };
 
 static int enable_async_notif(optee_invoke_fn *invoke_fn)
@@ -1586,11 +1652,14 @@ static inline int optee_load_fw(struct platform_device *pdev,
 
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
@@ -1598,26 +1667,26 @@ static int optee_protmem_pool_init(struct optee *optee)
 
 		optee->smc.invoke_fn(OPTEE_SMC_GET_PROTMEM_CONFIG, 0, 0, 0, 0,
 				     0, 0, 0, &res.smccc);
-		if (res.result.status != OPTEE_SMC_RETURN_OK) {
-			pr_err("Secure Data Path service not available\n");
-			return 0;
-		}
-		rc = optee_set_dma_mask(optee, res.result.pa_width);
+		if (res.result.status == OPTEE_SMC_RETURN_OK)
+			rc = optee_set_dma_mask(optee, res.result.pa_width);
 		if (!rc)
 			pool = tee_protmem_static_pool_alloc(res.result.start,
 							     res.result.size);
-		if (IS_ERR(pool))
-			return PTR_ERR(pool);
+	}
 
+	if (dyn_protm && IS_ERR(pool))
+		pool = optee_protmem_alloc_dyn_pool(optee, heap_id);
+
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
@@ -1788,9 +1857,8 @@ static int optee_probe(struct platform_device *pdev)
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

