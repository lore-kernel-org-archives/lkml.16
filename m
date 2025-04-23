Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE398283C82
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 08:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745396602; cv=none; b=F9juo2HtDAsyzh7O45eIwbu4zzToEDdKVQA/GtAKQVHQqhl90DnEEIFAlMh/FdsBNQycYE6s+6zdopetKz3aZ91Gw0sWGNoPSMOnV3E8Wphy87sKm53YUfDQs8D5o9AiiN+pR+nUGIp9BXwbVZ7tUvtCbeMNijcTBjlbVoV6TAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745396602; c=relaxed/simple;
	bh=FDt808ioXfvg/ri68kgavNBFXzIhVQV7SGG7meNIS6k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uEQvWQIhBiVPUlG3UQ9GeKzIxy7qgIKILRHiA68RkIOxT8ijPjVkom7SRmtSTsWCHAwtnGnTDMULvRQCLS1jUx8xwcIOF4ZaQUEaBOOhLyBQDktq1fj/MrvYoqqiAM7dJu2xmdiWHi6MKW0nXX3uqgNeGZ9sv7hf8Q/C9TPdyCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rBoC6mTW; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rBoC6mTW"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39bf44be22fso4201594f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 01:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745396599; x=1746001399; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZvxsiEPvdpb5l2WB/p6Z/my19eCAalsXZfsDJGPws1k=;
        b=rBoC6mTWroNZ6Ccwtmre751AxOQv5TrbHJmHjxVz0xUYeTUmi3zBVdQYUTBPOHx6gj
         GLmNaI0ufmTUXBdFE9Gq/wfyoZG+ElQ0fpM+W0OvJn+3tHWmu9NFWRyNfAKLHA8Sl8md
         GsrMhugOmdvc9kPskSQlAjk1caOPkk7yvYl2sX9tKBv0g7zxDsMD5oIXT5qlcH8v1R6F
         kg5sdvD5ZzjM8JZTCKtuM1EG9BHl6I5BaZXssu5fqBFEtre7fhsYPjCU9JB+yKysiRQj
         ECzsZSqe61bAcsiwUJFUHMnAfeMcih+RC6+9VzS2p27ERSvtL7oMTkF7Xghlli+12UPk
         aZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745396599; x=1746001399;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZvxsiEPvdpb5l2WB/p6Z/my19eCAalsXZfsDJGPws1k=;
        b=VE5RaJN4+7R0lfmvir9n0zAp/Df9pJl8r/zg7jaWA6QDjvGHZvxza2bhP9nkxvW+Ww
         cTW8Z4egfM0mdiYGyG38s5y/BbMvLeF/mU7I2ij7H9pTkGQl80PSbNbNQjAy03QGgF4g
         myd+vYKBnQHKTneXnDLXT100ZoGxsUDOjndOu+1EXTZ9TPjkLB2cWHQsuVSYCNfYCHFQ
         ELvzK3b2CEOzljXsUpp9PPXAb6PwW1audSc2oN9N1XYRGLm7amb/U9ZmpJo1nqSQP/d1
         UPy5YAcjTS2YiBW3vTGVF0Gh6zM7KnHZt1Nvd6DdjdgytZQHeM31i3lvxhyZTcJjwKWb
         9hag==
X-Forwarded-Encrypted: i=1; AJvYcCWt8iACW6pmz8KIIidwSDYETPU006m+xslfas/YsKinxyOzzDmSKwlFATGWmM5T8KUjGip+U/nYuelKWaQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJAghDIT1ucGkokWkdng2clA1HfWu4H5undbxm4LfLqYnd1xJK
	p6iSuRIwu9VLWR3wBikHI2HkYla7bXqXiU+q3Upwjr9O8KjRzLdH7BdReIh22eU=
X-Gm-Gg: ASbGncuP5YTDqUr/dd3MJWV9Kv690kL7am5U1fLvuMZQTFYytR6nz7mRQyqtQXpKsi9
	hhVVuC9aIHrO8dKY43oPD3JrLPdgfbWr5aO89tmoTBxAASs2/BEaQGDZitFXJLnzdHdEEBLHumD
	4+HyAzm83tagSEo8YN9r/4goL4Yn+A7+CsbVNF1bpCQ3S9ncJs7xGQ5OJ4HVdYkl8j0xSRua+zc
	KTvr+gApJ0K1gXuPyRchWyUaQ7Xx3Th6FWKt/fl8QVHkh1Y8/lNlmkRS/e+Q6CTOXCv3dx+lBHN
	5HW5zbHPTFQ0ur/v39ahYh60Cl+gehX2MkuN1voZzBdTVg==
X-Google-Smtp-Source: AGHT+IEelUJ/5v3FltvPfU2HhobryVrZIBwS3AI8/YV8yIZfhl1ShQPfo3U4FD8Ljf8SiRZZYW9GyA==
X-Received: by 2002:a05:6000:2510:b0:39c:30f9:339c with SMTP id ffacd0b85a97d-39efba5a84dmr14374721f8f.28.1745396599114;
        Wed, 23 Apr 2025 01:23:19 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-44092d4707csm16964585e9.40.2025.04.23.01.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 01:23:18 -0700 (PDT)
Date: Wed, 23 Apr 2025 11:23:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] pinctrl: mediatek: common-v1: Fix error checking in
 mtk_eint_init()
Message-ID: <aAijc10fHka1WAMX@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The devm_kzalloc() function doesn't return error pointers, it returns
NULL on error.  Then on the next line it checks the same pointer again
by mistake, "->base" instead of "->base[0]".

Fixes: fe412e3a6c97 ("pinctrl: mediatek: common-v1: Fix EINT breakage on older controllers")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index 7585de11854b..8596f3541265 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -1018,12 +1018,12 @@ static int mtk_eint_init(struct mtk_pinctrl *pctl, struct platform_device *pdev)
 	pctl->eint->nbase = 1;
 	/* mtk-eint expects an array */
 	pctl->eint->base = devm_kzalloc(pctl->dev, sizeof(pctl->eint->base), GFP_KERNEL);
-	if (IS_ERR(pctl->eint->base))
+	if (!pctl->eint->base)
 		return -ENOMEM;
 
 	pctl->eint->base[0] = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(pctl->eint->base))
-		return PTR_ERR(pctl->eint->base);
+	if (IS_ERR(pctl->eint->base[0]))
+		return PTR_ERR(pctl->eint->base[0]);
 
 	pctl->eint->irq = irq_of_parse_and_map(np, 0);
 	if (!pctl->eint->irq)
-- 
2.47.2

