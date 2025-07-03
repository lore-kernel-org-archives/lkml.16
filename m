Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683422E11BB
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 23:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751585009; cv=none; b=lU3hfp+VKvJksI/JDMeMYZMi+x0gHQSZxtsYaWLwRf/BKOc+CbMA+GI9rhUQqpQTPpesCOQvm+b8Q6p981bek8t4FbGy/s7X+ifur6CPyJrdmhICQbFy3qkbrq9AQ6IF8W0rbmRFyfBgCFVRBFz09HpQwusHlsfHW8jg8F4ujI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751585009; c=relaxed/simple;
	bh=btToz2S3ADP3ZxZpciNSy/MUe5vuMQa0nAdFifjfxYg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uaFMwBv9JIpfjsWNSKtil0RSqf0AW+G+wZu8LxAuoolIEzQjmklryEf8wI1Zhzl4oQMeEVRY0kUyKAdm9K6kOuG89Dp7ZxnuicpDCzw1phCFbJ7coRDD8Mn8R8ilTx+oPpUxO/9L3MSWF9gp/u7NnZJhmJEC6wX+/UFwHsKz7bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HgRWBlL9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HgRWBlL9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751585006;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PLJPkvu+exBJdImF9hJf2W6Rmq4JjRca1LT16iZ+xSg=;
	b=HgRWBlL9BhglwFuxNhGyQLnYwojLJWAC5CtX4FTQDXWZHtcBJKHT6Cet8Yw95mdWrpeVfs
	oAgKXrBSIbCvTefY/iDxD6IRJKzO0moqkQrONMk4MZx3rOkNmt/w134UVgUWrCS5cSob4q
	xHGuXOH3LH0S04rsGKXzvufpxCVqBsQ=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-53-auCvtnmXN_qTOnPEO2oNUg-1; Thu, 03 Jul 2025 19:23:25 -0400
X-MC-Unique: auCvtnmXN_qTOnPEO2oNUg-1
X-Mimecast-MFC-AGG-ID: auCvtnmXN_qTOnPEO2oNUg_1751585005
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6faca0f2677so8523266d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 16:23:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751585005; x=1752189805;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PLJPkvu+exBJdImF9hJf2W6Rmq4JjRca1LT16iZ+xSg=;
        b=c84pLUBSCkliHhemvkZWEqqQci7kyI3VUMYDEFWAQObM7/8POzPg2aw0UrXU6WtL6G
         BRprI/IwohRWD1W9m47COtJEFZflYjwTp+QGGq5n1094/L7l7z7rhaXIyUJna631ogA0
         aCyBI4T5zgeDyMpW6IzmA5YJ2ZX6X3heBP02GLupa+hkIveFAyBb2ZdK8cwnXkOp4mO1
         kN1YJTAnTEmbL29O4h5El9IFnLXF/0+cAZ30k0ECuxcTETmzl1HxX1dyrpAzIh0o+Acr
         B9ZYDiNXJ9vbsSKrasuimoAAdN0C9xqUCO+oMn5bavzAYFjst1WWQaWHvoX8Tq6kK73x
         AVvA==
X-Forwarded-Encrypted: i=1; AJvYcCVoihscRFPYYRgjKKXL9eYuq+Jw0eRhryZuyv9qLaeJw+etcJbrAORWPRqqsvpovX485FSpbou/2FUwCkg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMV1quy3h7hXZMuyuRhHyT3OFyxB+L0VloJp9ZkxSCECF4LT3Z
	/EUHhE2vAk5/aRDbxGY+SGt7Lea7xOFUv8U4Mf+T0BE6CbO6L7o3rAfpNbIPDPGJqR7YCf////G
	8mldIuByEegFvJ3gJEAEA82h5z1Ju9/e+7P6zZzbWe+cS0p9RBc8MmeTXaYAvhibMSQ==
X-Gm-Gg: ASbGncupl6FoZHh8qk0szeaj9ZsOD/w2M2tgL6WVI9lBYTDHOv4mzxMbb/D/GqChBUd
	fAhsphhHDwBBnNBLJ5a1XhmOwTcZfQ8I6FqP5mASe/76VlbU1IMPjIKEXJieTe2YrElD6keMTiB
	8e+mGkC217MZxR0/A+fKgkkzWvjIfuF0uaJfXkQ++s/HLD7gt3BdXdPaKXa9PnQAdjClcCAcndE
	fcn4NTsD7dRuQiVMl0T5hl8q36a4sMj9xtUwiX2LO6DTh9RRkEGBYfDsg4XbpeL8mD3v+r38qmU
	oJqe4PKfxdEzUQRo29BxxvivQyGwA6pcE0tfEaGCZm8dnZloRdqIs3HZmv2sKw==
X-Received: by 2002:a05:6214:5016:b0:6fa:bd17:313 with SMTP id 6a1803df08f44-702c6dd28f5mr2312846d6.30.1751585004837;
        Thu, 03 Jul 2025 16:23:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZUTcv/RXxDRv5oOXWGYLGuMzoJgJUUqtfCFBZdCd61PSDSlgd+Ecfdnm9HkmgohROAdoaIQ==
X-Received: by 2002:a05:6214:5016:b0:6fa:bd17:313 with SMTP id 6a1803df08f44-702c6dd28f5mr2312506d6.30.1751585004446;
        Thu, 03 Jul 2025 16:23:24 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5a958sm4469956d6.84.2025.07.03.16.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 16:23:23 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 03 Jul 2025 19:22:32 -0400
Subject: [PATCH 08/10] clk: sunxi-ng: ccu_nk: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-clk-cocci-drop-round-rate-v1-8-3a8da898367e@redhat.com>
References: <20250703-clk-cocci-drop-round-rate-v1-0-3a8da898367e@redhat.com>
In-Reply-To: <20250703-clk-cocci-drop-round-rate-v1-0-3a8da898367e@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Bjorn Andersson <andersson@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751584976; l=1938;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=btToz2S3ADP3ZxZpciNSy/MUe5vuMQa0nAdFifjfxYg=;
 b=d2ZMlN6C58BBAH6QeN6ACobOCoE2MjYgmAG9txbKa5xDhf1dkWNsPCaDoFCNoKlsbitIMf4tY
 rlssfLZk/Y8AJ4/97xBA/IKkdc92QGnzsPYwRqblNmN4ZVeb/pGltBT
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/sunxi-ng/ccu_nk.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_nk.c b/drivers/clk/sunxi-ng/ccu_nk.c
index 555e99de2cc6ee0c84ccaaac9ee83be2d88741a0..5db748fbb5bd9399a2d551c8821a4bb17ded005a 100644
--- a/drivers/clk/sunxi-ng/ccu_nk.c
+++ b/drivers/clk/sunxi-ng/ccu_nk.c
@@ -92,26 +92,26 @@ static unsigned long ccu_nk_recalc_rate(struct clk_hw *hw,
 	return rate;
 }
 
-static long ccu_nk_round_rate(struct clk_hw *hw, unsigned long rate,
-			      unsigned long *parent_rate)
+static int ccu_nk_determine_rate(struct clk_hw *hw,
+				 struct clk_rate_request *req)
 {
 	struct ccu_nk *nk = hw_to_ccu_nk(hw);
 	struct _ccu_nk _nk;
 
 	if (nk->common.features & CCU_FEATURE_FIXED_POSTDIV)
-		rate *= nk->fixed_post_div;
+		req->rate *= nk->fixed_post_div;
 
 	_nk.min_n = nk->n.min ?: 1;
 	_nk.max_n = nk->n.max ?: 1 << nk->n.width;
 	_nk.min_k = nk->k.min ?: 1;
 	_nk.max_k = nk->k.max ?: 1 << nk->k.width;
 
-	rate = ccu_nk_find_best(*parent_rate, rate, &_nk);
+	req->rate = ccu_nk_find_best(req->best_parent_rate, req->rate, &_nk);
 
 	if (nk->common.features & CCU_FEATURE_FIXED_POSTDIV)
-		rate = rate / nk->fixed_post_div;
+		req->rate = req->rate / nk->fixed_post_div;
 
-	return rate;
+	return 0;
 }
 
 static int ccu_nk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -155,7 +155,7 @@ const struct clk_ops ccu_nk_ops = {
 	.is_enabled	= ccu_nk_is_enabled,
 
 	.recalc_rate	= ccu_nk_recalc_rate,
-	.round_rate	= ccu_nk_round_rate,
+	.determine_rate = ccu_nk_determine_rate,
 	.set_rate	= ccu_nk_set_rate,
 };
 EXPORT_SYMBOL_NS_GPL(ccu_nk_ops, "SUNXI_CCU");

-- 
2.50.0

