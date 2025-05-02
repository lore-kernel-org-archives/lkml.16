Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9225A238C35
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 10:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746180060; cv=none; b=kDkBaw72hYpUg7xvrVJ2VjzIeOhJRUfDEJbomh1Yyqx5ayH6hxS9F4JQ5k6XsjRGjlRuIeVcPjlmo/y7SjwHSBFn0L2SuQ3fhgrJl/g5ymdJIZxYUKZcunxJneuO2mjmAxQEBkRQMaXQsZJ0ubx2vL5OdSgh0Y1VnohxlshMDVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746180060; c=relaxed/simple;
	bh=ClljJjvyTa+hIt59esq/vRhRnkjP2r10upW6mdBKOtM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mNfDZi/sAvMJcjlmzsqQBW/Kg+68ngKQytfgegD2c8hxMtPo5APypzy3EBBAYk2WOuq8FLNXActHIiVQrZ00qDQBvVdTMFamCaXhCPAT4bOLz6xptbVl86LS6S4lNOCVppt4N486F1Q1J8Xt0aAWHa4/rg6RyJtaLQVoOjt55Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QwXxWk/C; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QwXxWk/C"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-acb415dd8faso270547766b.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 03:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746180056; x=1746784856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5X2I1MlNrc8OtxTMPdYsTmJ1JjM0sba198ISiH4P8wU=;
        b=QwXxWk/C7ctR0XXAawQ2/OH4u8VX7Iudnsh62++BVJHzaUxM5UVU0h1oZ1Ubgu+nsx
         8aWk3m/mQChfqEq0k52fSDrgy8pViDBbfzi9m11A3FJjM86WSOJSa7CAR7TWQ6vcJ+i/
         rgPevFNZK5u9CMcOl6w+1FTNAFJvItCiK5eNPhqo4zvqrbO+2xANSGcaOMEwgFr1VlzQ
         4nTK092QWCQJeBUZa3qWSeaiA9dJaWDffcez3M/2rON1bV711+oRP0LOgmW1vU2fXnU3
         1pJYvENF0zJZUtD53E1MJnISi2uggjPuhwclNHIsfiYxHUXNfIWgovsKkf2lAB3zTUsG
         dTAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746180056; x=1746784856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5X2I1MlNrc8OtxTMPdYsTmJ1JjM0sba198ISiH4P8wU=;
        b=OnQ3QhaJTtdDEn/nPg2tuhsUT0ogaeK84U1WXJOJcz3KsGR4flo3luw8mhnMw6lW69
         8YWdzRZ+lmt42dREGs22V2Lf2T4DMwAvbG506FDM7gpJANtTiCpBzSNYe5iOIyFkbG2e
         RWLR529S9M1xBAebpYW5fGYgR03SGP4LPKSLn+NJtgNOcFfSg3GnVx/+IrGeI9MFqR5S
         xg5tNFthe4nLlqN1O/RXTCb/tf0/hxuxJKi8B9WCqFUVwsnPR3n4sPbZLWadPEV3FUaD
         fHvM7yPBwxjj31DAji/RglocBLfU/9/O6auGYi4AhwdLPKDrQmkPFK3oPna36Ei7Rlr6
         zW/w==
X-Gm-Message-State: AOJu0Yxv04/E9seKbBS0Imyni2Vk/6SDps8xcKHQm9uDu2wYn/KoliDL
	dWo6VtNtFtZgQoLkC/MkH6sYogopEgJHpeA+dyfe9zX4MYbmm20uVWWzPrK3enS7yqh1YrqwDXk
	tO94=
X-Gm-Gg: ASbGnctFxpVWqIXhKS8oLeLGgQAK/jxaSIpIWH0nu+z1NpGTycsqM1zNY2ru45toS4J
	GUimzpLv4lYK7BZVVorBOdRIXYgL9TCI+TvPDJuxo1VFxaJHJr/ILH6NAW7Q+6tbWC1QsZn9sr7
	K40z6VgbgTXJxSiXdyG8Hs8JSxqToXCRKWX/c36Hg0etbgq03RDPajzjvT/ZgO7jxgLCU4qWwP1
	rMXt4gpVf8VVEjb+CclVdGCl5F/3+4XGeP0PGQ3Vy4pKXodx0h9YPxGmdHgUJpdjkK/GPQa7B1k
	FkqZpL9W4Yy8vHt/oypONUHO8T9oaVLsuXKgzUNkkdzbLytnS+R7Zz7s528udoD0PTzb7XNBexv
	+T6dgy3AnQivBWewu2w==
X-Google-Smtp-Source: AGHT+IExOoNljerMnP1yPtzh01rTrQJbnwgTFzxXZMgDFfUCD64SgckGTYoDWopJzNJPBPdV4tUdDA==
X-Received: by 2002:a17:906:6a23:b0:ace:ed3b:285e with SMTP id a640c23a62f3a-ad17af80380mr236112866b.56.1746180056392;
        Fri, 02 May 2025 03:00:56 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891473a1sm26030566b.4.2025.05.02.03.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 03:00:55 -0700 (PDT)
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
Subject: [PATCH v8 02/14] optee: pass parent device to tee_device_alloc()
Date: Fri,  2 May 2025 11:59:16 +0200
Message-ID: <20250502100049.1746335-3-jens.wiklander@linaro.org>
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

During probing of the OP-TEE driver, pass the parent device to
tee_device_alloc() so the dma_mask of the new devices can be updated
accordingly.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
Reviewed-by: Sumit Garg <sumit.garg@kernel.org>
---
 drivers/tee/optee/ffa_abi.c | 8 ++++----
 drivers/tee/optee/smc_abi.c | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/optee/ffa_abi.c
index f3af5666bb11..4ca1d5161b82 100644
--- a/drivers/tee/optee/ffa_abi.c
+++ b/drivers/tee/optee/ffa_abi.c
@@ -914,16 +914,16 @@ static int optee_ffa_probe(struct ffa_device *ffa_dev)
 	    (sec_caps & OPTEE_FFA_SEC_CAP_RPMB_PROBE))
 		optee->in_kernel_rpmb_routing = true;
 
-	teedev = tee_device_alloc(&optee_ffa_clnt_desc, NULL, optee->pool,
-				  optee);
+	teedev = tee_device_alloc(&optee_ffa_clnt_desc, &ffa_dev->dev,
+				  optee->pool, optee);
 	if (IS_ERR(teedev)) {
 		rc = PTR_ERR(teedev);
 		goto err_free_pool;
 	}
 	optee->teedev = teedev;
 
-	teedev = tee_device_alloc(&optee_ffa_supp_desc, NULL, optee->pool,
-				  optee);
+	teedev = tee_device_alloc(&optee_ffa_supp_desc, &ffa_dev->dev,
+				  optee->pool, optee);
 	if (IS_ERR(teedev)) {
 		rc = PTR_ERR(teedev);
 		goto err_unreg_teedev;
diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
index f0c3ac1103bb..165fadd9abc9 100644
--- a/drivers/tee/optee/smc_abi.c
+++ b/drivers/tee/optee/smc_abi.c
@@ -1691,14 +1691,14 @@ static int optee_probe(struct platform_device *pdev)
 	    (sec_caps & OPTEE_SMC_SEC_CAP_RPMB_PROBE))
 		optee->in_kernel_rpmb_routing = true;
 
-	teedev = tee_device_alloc(&optee_clnt_desc, NULL, pool, optee);
+	teedev = tee_device_alloc(&optee_clnt_desc, &pdev->dev, pool, optee);
 	if (IS_ERR(teedev)) {
 		rc = PTR_ERR(teedev);
 		goto err_free_optee;
 	}
 	optee->teedev = teedev;
 
-	teedev = tee_device_alloc(&optee_supp_desc, NULL, pool, optee);
+	teedev = tee_device_alloc(&optee_supp_desc, &pdev->dev, pool, optee);
 	if (IS_ERR(teedev)) {
 		rc = PTR_ERR(teedev);
 		goto err_unreg_teedev;
-- 
2.43.0

