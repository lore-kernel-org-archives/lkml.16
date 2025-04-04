Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF7D1F417E
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 14:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743777152; cv=none; b=Ljwdq4KMeFWwa7F+cAM3uFBOEj9duueI2ELMvlA1d7xDyr4E4uY31EarlmMoZBQjJmAXt8sjiMc1oAr3I1VP9xa/EnNu4hQIJvItzdrULBAR3k9tbtSTz9Ta8pQcoIoixIy0EKOFj72rlCRUIrD/TkQxm8ADVp1DiEp34vjWWLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743777152; c=relaxed/simple;
	bh=ClljJjvyTa+hIt59esq/vRhRnkjP2r10upW6mdBKOtM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r3PYx841MCB3xfkRhh8swjOwZ1xvQwpv9Gj0/plGuvQnubl+aTQJzeMZkPPcs0qackbmbJw/LsmdHSjs91Cuc5mHNVD2jUWedXcWgkMmudCvRezlkKxNfWuYG9Vki962U9V3OL18pg7ggqk+HfXJ8rxKJoa6saxFPwtvYBF+6ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hkJKGOjU; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hkJKGOjU"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e5e22e6ed2so3068738a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 07:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743777148; x=1744381948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5X2I1MlNrc8OtxTMPdYsTmJ1JjM0sba198ISiH4P8wU=;
        b=hkJKGOjUH8FmaNaRqHIO++NhZGecEuF+oSre4s82U6omng+MowgS6q/I0lP7tWOQhi
         jPJEVNIVD35zcmtLLfPlLvC1COXGxjLPp1bJtSy5zI5A91n3R4mFpiuAeLhIyrjn+oyk
         iP2u8HCf4B94hRBc+az+hw1CfSJZ8+mF2P9egqBTUzh7Y5yxoWz8ktY/tqfjn1MuahDV
         ayynLxfdI7I085tMQXl+hNNWxLHPxZoHed+WM+xjK7JbsR0oIKv4TrN0GTQ+ED8PS/tc
         41rchPIevMIbASVElaE9NlNsBy8jTL7tCpqvCPEzIYdd3j3aWxOeZkMNZRO7JGfq1b5r
         JGKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743777148; x=1744381948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5X2I1MlNrc8OtxTMPdYsTmJ1JjM0sba198ISiH4P8wU=;
        b=QNTxxR1ZakAjGCMDXfshKzOKBRGJolL7X+isMp9A22CMya/uM2R5KQqcAe2xYrEGHQ
         XusyHQF+B1+g340snaYavinjJHvgpDQzunsW4R73ckbDfbvMHpRuovhTVAnJzu+mv7vo
         CcWS3SXerQYlQwc7K03BvDGZ8fJLmEVqg3K4S81uwuOSRrIW54033z9L7JKJEdwLzFJP
         b39OaGyEzq0b6JM7f4h9GiG8BTsy/X4uCxH0/zLUxpIRb9adoGyszUjvs2Er8XRatFph
         L3adBAVA3yrVhehgxYl8+EHoLaeDLelmfr1Acvf6of71Gv1+TsuZz9JD6N2AZ71yBs2e
         26Pg==
X-Gm-Message-State: AOJu0YzzZMg3+YNDgDfNuKAv9j428gxBmVd0/zUxRI1OBDsOndCyhaNr
	PKsaLWW9jnW6KfhFKtY5ETKNfvhNCgyiQlTG4/NYGLUk6Jk22pcTqenxyy7Wgb00y47RXjd8NwU
	/wZo=
X-Gm-Gg: ASbGncv8Rzbtrik/OU9miKq+ELVipxq+GT5kLZpFC8b4tYObkCWshvtUN2G3/fAjYGr
	P+FLkAmlkGPfSy2Xaa8dMztkyUFdhqKEl+KPWeNrHQz6xAAnDDILORVtbsBS0RfCbtilQKQxMB8
	meigxxPr+4yvAOcFTuez0v7jg+p++agOYgdZtnFt5HltMese+u51gY36IBKRRE0gTD7jJTYJVzK
	KYugXTZUdFGD5/Rwj7VizLPRAK43eNmPmZJJpnSNNkXTq6wwDqZQDw0+lrmaMUneHHeiU7iurqo
	yeyl+lP42kekEN0+dfTa49R5HjsuOx3s83CqFfUnwbmv5dzGckJyv2ruE0jgzQuI3yEUX/zlDbl
	WQMWEGhIqtxE4K6zoT7M0Fg==
X-Google-Smtp-Source: AGHT+IFkJLuZYKHkFqitQEQ3Yg1FLEq81E4C9if1/VM+Yaec4v2BrToG7RwujiSsE0q6nDmGLkPdOA==
X-Received: by 2002:a05:6402:4415:b0:5e5:e396:3f6e with SMTP id 4fb4d7f45d1cf-5f0b661aaebmr2120030a12.26.1743777148470;
        Fri, 04 Apr 2025 07:32:28 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f087f0a0f3sm2567450a12.43.2025.04.04.07.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 07:32:27 -0700 (PDT)
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
Subject: [PATCH v7 02/11] optee: pass parent device to tee_device_alloc()
Date: Fri,  4 Apr 2025 16:31:25 +0200
Message-ID: <20250404143215.2281034-3-jens.wiklander@linaro.org>
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

