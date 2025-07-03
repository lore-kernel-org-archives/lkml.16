Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5762E172E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 23:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751585012; cv=none; b=Tgi4i2TEqCDf0Ap72q65s5L5l534Uo0cO+uPfPmZpnH4VdvSotqaK7NbojZOb0iQZTAxCpnLDsQg7p/Re5WutXhpa7JNO5ez3s+s6VsYUzeTfqd3AgEoLuFONCq0H2DUhxGILVe8CJLTrGL65lm2YdNzyO1jEM01Syk2MZWufE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751585012; c=relaxed/simple;
	bh=MG6R6xLI8D2rCtfPyeozFwBeKwPJHUOoxhsT2UMyvnU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p1UNnpcC9SVTXurtvdAuw6kXUK1cjlcaqoZQX3qtXHHQXQcdQmQJYC4GzQyU8JG2ss4rLA4MKZjaDSYEj9r/WFZ9GMkBiyfUPL1claQSeqNON0p7i42blFZCC4wADOIF6TYjYfnNLKsmZ/rGu5lugJBHlNASjy0pyiE5UyoMKOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i2B5hA6f; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i2B5hA6f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751585010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zl8tqJGsXRRT241pfz1ME5G6IziLWcd0tIVkpvs50QQ=;
	b=i2B5hA6fKMHDbJ3APtXNAKBeY8pxRJY5KJrz2DAUM2NqeKSVmNKsCV5tSzokJaKuS3DldQ
	LrpqINv12IKPWBT7cizkH9kHmvFT2pyL/623Z3Y0t+rQlsJuUm02PMJn5+WZ7ACFQOAIvO
	ZmBUobc6u69ClZ1neVXxTlX3rl2SDKc=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-385-qyCEpLKCMXWrKSDaxBI7Wg-1; Thu, 03 Jul 2025 19:23:29 -0400
X-MC-Unique: qyCEpLKCMXWrKSDaxBI7Wg-1
X-Mimecast-MFC-AGG-ID: qyCEpLKCMXWrKSDaxBI7Wg_1751585008
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fb3487d422so4435876d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 16:23:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751585008; x=1752189808;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zl8tqJGsXRRT241pfz1ME5G6IziLWcd0tIVkpvs50QQ=;
        b=pS+ACs5LeDTvmzGaIICv89e6/+Koasz4hsEYRhohEvKaN+m4QNnw5hFNqvJ7j/ppy/
         Vzxe4zoh7OHJmUzbMBA0FUj5EVnVSv5Hxld8o727yFKp26pPj7dduFqZP0zgez5W23ws
         rzTG+9b20p/VUXWGu+McHanbiWpt2x7QNEz/W51w3w1WYK4e/LI9oILOBMu+xOHqbNY/
         cvYkylQV4bxiCqSq4rQ5+uUhRRaLiLVH41SejA8dO3GK2mwYix7Dy7grMTl+2vjxTK84
         O9FrgGiDQst6pEhnqZvnUgSmfTTYsRr7n+MnjEf6Ij++/kHfBAiesUcLkG1hOX3GT30j
         Apyw==
X-Forwarded-Encrypted: i=1; AJvYcCXeAqe0t/j7+4T2SkMfTQ3UUH7qkxbEV/hsGVoq4ys5YT1mAyKrT5KtxeQQjnyTqSJc0GzOdmUWuPARGhk=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywilta4prwwkIoQtTRkv7lU5HDaFoOLKSh9Zwa/JFFFMk84fqNT
	uCY8Jeqz4UOky37mhMbs+w9Hv0Qs5GBtrlK1Sj1ivafG9HT1f0RPPZ7kj5o6DMyLwNSe2OY2cHP
	hdeCWcvri4Tnxh1zBeHbYlO3Yl1qgc7L6QyoyJW9tZKKR0Pu9vvIE/6cuLAxK3hSVtw==
X-Gm-Gg: ASbGncsIPL+jjpXyBpzr75duXgXTsroaLmh4WyMVFGID7n8CZzdJ8pe6QkjRyV3iOix
	nalKFWN1Vb7edaDgu/u2+bcNy9bk2CZxq5CmbIRrgY/h1baOSwzQ0up80he6NgA68I7IJjSIJWx
	pctrJ0b0hIKB3UdDTay9/lnm+lKgKzs9GXpFa7NqPf93buiEXwYKZvRDWqVX6Lp48I3F81+n/69
	x7wCwiQ69Z47jXIoL8MD7C6y9nyJ0FK4UUhdGi40TbVGyY0cbpQb+HA0evENyehP17612JR6N2E
	JH8V29gddcn7v2BsyHZfwWNmmrkig3s3Wk7ThZQwspmqJvIJHeUUMvgDPVmRYw==
X-Received: by 2002:a05:6214:202d:b0:6fd:74df:896 with SMTP id 6a1803df08f44-702c6d0108fmr3206466d6.3.1751585008548;
        Thu, 03 Jul 2025 16:23:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtEKstDD58UA9ynnp87TZzDRG0nHv8TZdipy2JJJ0KGfqawoV2yWwrMW4WiJnElhNazWCQfg==
X-Received: by 2002:a05:6214:202d:b0:6fd:74df:896 with SMTP id 6a1803df08f44-702c6d0108fmr3206086d6.3.1751585008137;
        Thu, 03 Jul 2025 16:23:28 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5a958sm4469956d6.84.2025.07.03.16.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 16:23:26 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 03 Jul 2025 19:22:33 -0400
Subject: [PATCH 09/10] clk: sunxi-ng: ccu_nkmp: convert from round_rate()
 to determine_rate()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-clk-cocci-drop-round-rate-v1-9-3a8da898367e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751584976; l=2425;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=MG6R6xLI8D2rCtfPyeozFwBeKwPJHUOoxhsT2UMyvnU=;
 b=gtIoYUrg7pKik5I/T79/xPlRf6FIf6RrEY9VaGQ5cG9HAHNGprjV14FnyjTOfqDKEtgskKdxi
 LMUL+S4rLZMAOnlypm4OupDw0dn6pZZJxEd6jy2V8Nc2541mBH3ukUS
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/sunxi-ng/ccu_nkmp.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_nkmp.c b/drivers/clk/sunxi-ng/ccu_nkmp.c
index 6e03b69d402848b237154319d2296ffb4133a213..25efb5b3760759f2943737856246ce93000ebf05 100644
--- a/drivers/clk/sunxi-ng/ccu_nkmp.c
+++ b/drivers/clk/sunxi-ng/ccu_nkmp.c
@@ -127,20 +127,20 @@ static unsigned long ccu_nkmp_recalc_rate(struct clk_hw *hw,
 	return rate;
 }
 
-static long ccu_nkmp_round_rate(struct clk_hw *hw, unsigned long rate,
-			      unsigned long *parent_rate)
+static int ccu_nkmp_determine_rate(struct clk_hw *hw,
+				   struct clk_rate_request *req)
 {
 	struct ccu_nkmp *nkmp = hw_to_ccu_nkmp(hw);
 	struct _ccu_nkmp _nkmp;
 
 	if (nkmp->common.features & CCU_FEATURE_FIXED_POSTDIV)
-		rate *= nkmp->fixed_post_div;
+		req->rate *= nkmp->fixed_post_div;
 
-	if (nkmp->max_rate && rate > nkmp->max_rate) {
-		rate = nkmp->max_rate;
+	if (nkmp->max_rate && req->rate > nkmp->max_rate) {
+		req->rate = nkmp->max_rate;
 		if (nkmp->common.features & CCU_FEATURE_FIXED_POSTDIV)
-			rate /= nkmp->fixed_post_div;
-		return rate;
+			req->rate /= nkmp->fixed_post_div;
+		return 0;
 	}
 
 	_nkmp.min_n = nkmp->n.min ?: 1;
@@ -152,12 +152,13 @@ static long ccu_nkmp_round_rate(struct clk_hw *hw, unsigned long rate,
 	_nkmp.min_p = 1;
 	_nkmp.max_p = nkmp->p.max ?: 1 << ((1 << nkmp->p.width) - 1);
 
-	rate = ccu_nkmp_find_best(*parent_rate, rate, &_nkmp);
+	req->rate = ccu_nkmp_find_best(req->best_parent_rate, req->rate,
+				       &_nkmp);
 
 	if (nkmp->common.features & CCU_FEATURE_FIXED_POSTDIV)
-		rate = rate / nkmp->fixed_post_div;
+		req->rate = req->rate / nkmp->fixed_post_div;
 
-	return rate;
+	return 0;
 }
 
 static int ccu_nkmp_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -227,7 +228,7 @@ const struct clk_ops ccu_nkmp_ops = {
 	.is_enabled	= ccu_nkmp_is_enabled,
 
 	.recalc_rate	= ccu_nkmp_recalc_rate,
-	.round_rate	= ccu_nkmp_round_rate,
+	.determine_rate = ccu_nkmp_determine_rate,
 	.set_rate	= ccu_nkmp_set_rate,
 };
 EXPORT_SYMBOL_NS_GPL(ccu_nkmp_ops, "SUNXI_CCU");

-- 
2.50.0

