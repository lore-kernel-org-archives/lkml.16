Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E7F2D94BE
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 23:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751584988; cv=none; b=Ra9nh3yrQDJxPXiN117L2jt0xuFALH2n/tgOHzfzxNQM2iX5v85oR27HnO9tjN+Woo/X/3n88MU4FSiEpZb0ZoiY6uIPYPMpFY8ylqDSeqCgUQRC+Kk+GH9JWjG+EEt+uVzXSNL6hV0pdu2gfSOKp8mh/jkVm6uobW5IGz2u28I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751584988; c=relaxed/simple;
	bh=bUDrRrVU7cuzvOkq/BXSXRrTOJz73kF5fGj8HK4w53E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fYM/Hy0VsaT3HmAwvklakmeFga4WaJVp3uLLUuRFs5ODfaVG08zkeLCZUKMzeirkPjrZPg1sRoPS08Sm1iF7o4haFk/En/EfQdk9SOM1Kg5eUX1d/oxJQiQKRj8ntg5bMeS6qw5IeIC6Tw9jD4hBad4GkXDtzEvb9YNDSd/eXME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=giBQaoyj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="giBQaoyj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751584985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zb0t+bPuMy487CsPpINgg8YqC+3JQLKvQYW9mEqLvWM=;
	b=giBQaoyjd6rWISWSQ6KwIdGger7SAhg+ckTv6rpkqC40GrOiiCpsZkAqCqRj6+502Vsggp
	Iw8aYrnBoUPAsqeSVri61LXcu1c8RXqmOaY82cMuYb0+fQtM9tl0XZfKsep0weee7hbU3a
	17DZrNCYEj8INVuJ1Ril1xm4FJpvYP8=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-272-3skQ3MRZOi6XlHEX9nyvrg-1; Thu, 03 Jul 2025 19:23:04 -0400
X-MC-Unique: 3skQ3MRZOi6XlHEX9nyvrg-1
X-Mimecast-MFC-AGG-ID: 3skQ3MRZOi6XlHEX9nyvrg_1751584983
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fb5f70b93bso4246586d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 16:23:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751584983; x=1752189783;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zb0t+bPuMy487CsPpINgg8YqC+3JQLKvQYW9mEqLvWM=;
        b=L2iTNshFg/E7DF3vwxkBsIAuTn0dY97FmbX0Aee7IcZr0xxAtpZIx+G+ABzz6bVerO
         HFH8vcTnrTXyJ8GAm4m8xrvYDnYd9uKYJkjeMyZOGfb3caiQAlrLTfOABdUNjzGs1Als
         1SjxJHLk+hT0zaGK++z3P3wTPFNS7hmxaXGWfzWj1p5qyzZXtMVjhNRvPsBzu1ZXFlDM
         BkqtaDeWCtsfMcp3q+CiWc/K9yS6ewGkdBH0OAZyC+9zGqbDpabND6ki0NsyMN4i7pe2
         UkcgMtlVR7ciDM33MUkZBZATcdNmtISlzcpnWPryGvVvDDA5u1eqrya7HAwRPzqIvCDe
         mvzA==
X-Forwarded-Encrypted: i=1; AJvYcCUjHt6lpXWtheVNJfu9hP//2fqY23bViiq1oymjzdkS88KSbgarMhhQjioO3ImEaLfzxv9ebrPCLzvOrwo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRO2nt5xWYXdcL+1kNKH1edGUcFaNL95E20zeXET5x7UoC7HRp
	tX54XboFQv+WZpczqb6QXGFC0zcqvf6smBArPL5HGpark7hvNFabfaFWzRqw0Q3p1ECgOuu1J2X
	dv8F0TGFpeQXuJ50/70s7dFRZ95DQwDknkOzh2gPneOjcflvhnbeW3c/WKrO8BeR3rA==
X-Gm-Gg: ASbGnctQoRynicl2u4fpeoOHToGhmrE2cip01em9gtrd8hkRCkNq2FFzKWZTj0HEHyv
	XJc1tq1ct4YHjijxKE6OhIIX7SKNC3WNHTbSuXkHr+TfdLyjS9xdkEET9Q6MYgA9dedcFgB6fsY
	BFQ6M482WnCBuoxIodHUhYWZC0/Rr+UyAd6L9kInktzvaqKem5MeAASTVYcsnOXm/Xn0JzjepwM
	CBPceJD/4XcZXzTZbQC6n2vJfKxtPIiDQj4W/Q1SaKh5WZzZZ2WZL9RHC5hwZzFdGiOpbyAVXwe
	/0PlT/I4LGVz2FoThqEhd0noJWkSdTfyxmU6m9Xk5/pRibGFvB6SH50ZnHFHzg==
X-Received: by 2002:a05:6214:4109:b0:6fb:66cb:5112 with SMTP id 6a1803df08f44-702c6dbd1d7mr2609966d6.43.1751584983552;
        Thu, 03 Jul 2025 16:23:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyxhZnZ049hC67seKLZMmTesEshAPctloMTDGwamaQuOlXGGQBJwFhr4CP+VGmOImhVXHj5g==
X-Received: by 2002:a05:6214:4109:b0:6fb:66cb:5112 with SMTP id 6a1803df08f44-702c6dbd1d7mr2609726d6.43.1751584983157;
        Thu, 03 Jul 2025 16:23:03 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5a958sm4469956d6.84.2025.07.03.16.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 16:23:01 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 03 Jul 2025 19:22:25 -0400
Subject: [PATCH 01/10] clk: bcm: bcm2835: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-clk-cocci-drop-round-rate-v1-1-3a8da898367e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751584976; l=1979;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=bUDrRrVU7cuzvOkq/BXSXRrTOJz73kF5fGj8HK4w53E=;
 b=xUB+8pQNqSYfMSMKtJ+gOj0YuRr7Wv56SqgY0gPYScWgdV1HkGtTwLwdx9iGFlUExmLZuwyku
 mHoKvxPW2vyDCFHfBUgtY5dZ7pH4PFh8nPq0RUUJZ7MoCOhvyogjc9p
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/bcm/clk-bcm2835.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
index fb04734afc806286b6a68996f36bd8a49b542cc8..5e7788406de39c94884cbc3aa162c378443322c0 100644
--- a/drivers/clk/bcm/clk-bcm2835.c
+++ b/drivers/clk/bcm/clk-bcm2835.c
@@ -570,18 +570,23 @@ static long bcm2835_pll_rate_from_divisors(unsigned long parent_rate,
 	return rate >> A2W_PLL_FRAC_BITS;
 }
 
-static long bcm2835_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *parent_rate)
+static int bcm2835_pll_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
 {
 	struct bcm2835_pll *pll = container_of(hw, struct bcm2835_pll, hw);
 	const struct bcm2835_pll_data *data = pll->data;
 	u32 ndiv, fdiv;
 
-	rate = clamp(rate, data->min_rate, data->max_rate);
+	req->rate = clamp(req->rate, data->min_rate, data->max_rate);
 
-	bcm2835_pll_choose_ndiv_and_fdiv(rate, *parent_rate, &ndiv, &fdiv);
+	bcm2835_pll_choose_ndiv_and_fdiv(req->rate, req->best_parent_rate,
+					 &ndiv, &fdiv);
 
-	return bcm2835_pll_rate_from_divisors(*parent_rate, ndiv, fdiv, 1);
+	req->rate = bcm2835_pll_rate_from_divisors(req->best_parent_rate,
+						   ndiv, fdiv,
+						   1);
+
+	return 0;
 }
 
 static unsigned long bcm2835_pll_get_rate(struct clk_hw *hw,
@@ -783,7 +788,7 @@ static const struct clk_ops bcm2835_pll_clk_ops = {
 	.unprepare = bcm2835_pll_off,
 	.recalc_rate = bcm2835_pll_get_rate,
 	.set_rate = bcm2835_pll_set_rate,
-	.round_rate = bcm2835_pll_round_rate,
+	.determine_rate = bcm2835_pll_determine_rate,
 	.debug_init = bcm2835_pll_debug_init,
 };
 

-- 
2.50.0

