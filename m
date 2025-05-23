Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D302045B5
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 16:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748016421; cv=none; b=o6Ca1+Y5AfO5qAhvM91AkxpofM+Lo2ehVRGQUgYEfkUDor3IY5IfRti+FCYNYH8hLXkZbVsi4n1cwSc2w5tp1758UlB+VkVOIYTKNPaBm/r1cIo5I1eRIPK0Vqbjt8c3OtTVM/74Ub51UearCHyDjcCkMPZFC4EyjfttPOxzCeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748016421; c=relaxed/simple;
	bh=WA5dqhze8NRn8+fhKp+DCFUWDEMVFNX6jxw+Hwyiv9I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DqHoGWYQA//Rk6gkjXNtIPMGaKj9amfLJtR8cVJgb0ljWL/o2/+ANd5HPffxx66i0w3xBnFw6gm4JhuFrhopB1MWyxVgFPZ2FwIWIKgnnR2hIP8Lai+dtgJrhimqeWTCfCxutiY5MViDfWyqc2bOWwUuvz3s5XBfR3Ug35jgihI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yZzB1YIv; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yZzB1YIv"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a363d15c64so66664f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 09:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748016418; x=1748621218; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qVA1Wq02RwkJ8tKlxk+KwgWL1KTqqPjG9SMiOazJCzY=;
        b=yZzB1YIvtdng6TWNstVm/zzhkQlF30/ijeSBTsOSwyCFqFGCOVaihTq5ysFVckeqz1
         eCCp4Am1G6X92cHKXcpRCjf+wDlXzIP3X2KJrv6+Y0/Fvfj7AuMT+RROKVmpGTYr1Uoc
         EwLRgjERzNdw4SuxsU45LwHTvzcJ2QPXLTSXEQQwabmixLew23PxlgSNOTmKPEMefK12
         h56LlV+b5LkkZfePCgINh3hnlSunv5+JqDK2Dc/Fkj8BRl5SLJHHmQlsrXQ1Nex9AgBz
         5lZg/2U1BWygkcGAsuqLMYN9wx7LcGyO+Yu95lJ/KiZaVEOgJPBkw/VS/PICikh/Dybu
         MeaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748016418; x=1748621218;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qVA1Wq02RwkJ8tKlxk+KwgWL1KTqqPjG9SMiOazJCzY=;
        b=TQnBbzLoFgLMmMV3ZQ/qrqKgqqwZeI+OwOk9XzVsif/AGlw4OpoCI1OjOe2dYtrkAe
         AbV5W1/oAkBwIv27LPrWyRrauyEq7FF08IzxAS7YpCWEDG68qz86nd6O0plWcOVE5t1W
         jlZH3BWJHNvNsW6ycHQXfZ44/Q36mzpM/um5q8TMPW0Z7OSa1YoIwZZBlnbzTzUIS2Xq
         HPE60FdCXZVfSBcfd+s9inDS4fzUv3qZKqXwblF5Bw8/QmyCq7lZbFzAJNS1cBdq3Umw
         QlgvQ1CVNPP+hMl683kxvGgLYUkcQJpVFrB+jqntCMPJA1oOxhOjKN9iWGgYs+ALYoP8
         +I/g==
X-Forwarded-Encrypted: i=1; AJvYcCVKKblyPeG8WShcvfg8S+EyyRgSmOVah0LrGBqYjp0dcO+OLWvHwl8bVlfaeOFfVuX33CrvuUqYhvZSrdw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlqPhJTUxyvid3P/JnwwFWr4itc2JUSB1NXdKy1lQFqcK8t1vA
	+/mM59bjCTQR0NKtoL3fMpX6tpV5ZeqVuo1fPMuUJdXhU1cQxX8hX+kAxAgrygBPsn8=
X-Gm-Gg: ASbGncurL0OCeo2YFPuXxyU816V63+oKmaxJVboq9FwH9dGTfPdBtkhnOzrD3qkxkll
	pMABDl0Vg6aSnSB3PKnUWKp54nmovDx+AwPG9R1cOGMl32LZBkCrkEhij9d79Rl3OM2100oVtEl
	Us9nbJU1aTANV7hqj/dOBZCSM5snfXxrinpZJbksgoS9czSavF9Cd/m83T4XiCbo3jCKE3b+73x
	AENsIBi0VRQm5FtHSpodJANA7y6Gam4XMTKuTkWBWzKNKCie/Bqk/YyCsvxuIzYKpDMB21Vtn2C
	ZcnPPq1xLnycPRacM0ciJKthR8AEEAOUxfXdEJPUo9R7+Dbg6UtNxsfzM60oVhlLUS4=
X-Google-Smtp-Source: AGHT+IF56UQSCz5q5QoQKyBHSndYLKMFyKvT78EcNJOHgSCsSRrkaKawUqXQh0qLd3vhveIRpS1mOQ==
X-Received: by 2002:a05:6000:2011:b0:3a3:6f1a:b8f9 with SMTP id ffacd0b85a97d-3a36f1aba52mr19442998f8f.15.1748016417661;
        Fri, 23 May 2025 09:06:57 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a35ca5a8cfsm27334537f8f.37.2025.05.23.09.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 09:06:57 -0700 (PDT)
Date: Fri, 23 May 2025 19:06:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Qiu-ji Chen <chenqiuji666@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] dmaengine: mediatek: Re-enable IRQs in mtk_cqdma_tx_status()
Message-ID: <aDCdHh-G2ShU6uid@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This code calls spin_lock_irqsave() twice but obviously we can't store
two sets of flags in the same "flags" variable.  The result is that we
never re-enable IRQs in mtk_cqdma_tx_status().

Fixes: 157ae5ffd76a ("dmaengine: mediatek: Fix a possible deadlock error in mtk_cqdma_tx_status()")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/dma/mediatek/mtk-cqdma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/mediatek/mtk-cqdma.c b/drivers/dma/mediatek/mtk-cqdma.c
index 47c8adfdc155..9f0c41ca7770 100644
--- a/drivers/dma/mediatek/mtk-cqdma.c
+++ b/drivers/dma/mediatek/mtk-cqdma.c
@@ -449,9 +449,9 @@ static enum dma_status mtk_cqdma_tx_status(struct dma_chan *c,
 		return ret;
 
 	spin_lock_irqsave(&cvc->pc->lock, flags);
-	spin_lock_irqsave(&cvc->vc.lock, flags);
+	spin_lock(&cvc->vc.lock);
 	vd = mtk_cqdma_find_active_desc(c, cookie);
-	spin_unlock_irqrestore(&cvc->vc.lock, flags);
+	spin_unlock(&cvc->vc.lock);
 	spin_unlock_irqrestore(&cvc->pc->lock, flags);
 
 	if (vd) {
-- 
2.47.2

