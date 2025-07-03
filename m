Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756732D94B2
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 23:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751585123; cv=none; b=Hq/fJoExze5+z0SnLiWsDvrFabiFv3P6mW2ycEx1YfPTOYHdaP5UZ8AXVUlstL0nPK6TSYztb4OLfazlhR9FOvYv4XuIn6mh10XWxtmTNL0hAAJv3X2cLjXaah15a7TMEr499sXeki8ArXi1WaDOloSybtNwSBRH+OgFbM1Q+sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751585123; c=relaxed/simple;
	bh=JjW2YpRPz+0lPSN1r9ZPq4mBQxxVW0XXtxuqTB96kpo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AH8DdQlTy5Dv8PhTp5YeaYvPZpXNK3lnGwcO50tdj0BjKstgOFn2JExVoT5aYau1wtmad8SrtLF0oxZu1mO71HFGpXDjEbfrQZwYoC/k6bWMzjnOs7BD+Sufti+ytMW1P3uYaK4wDujDQXrKECAq8Rff0/rKUwUvCEsS0JawrXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CqRKVzxC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CqRKVzxC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751585120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V9SM1r4kZ+sX81Mdumv2hWNVumjYJEFhq1ifXw5ch4g=;
	b=CqRKVzxCiUz/3Axe6j+W85pd4Rhm+CdiG3cLqtZJKR/nulvhwKS/SrPtd3MHvZxOBvjmFA
	5ayeYLA7OshQh5D/KYjLfpVYZuUHAQEbtem6AY3Yb1REOy+4TOuOqzHJHtMVvEKppCeVGW
	hYQdxx4C4F18BjNlCI7vrfw/SRHLCF8=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581-fXTR2NiLPDiLtAU6cvrBiA-1; Thu, 03 Jul 2025 19:23:13 -0400
X-MC-Unique: fXTR2NiLPDiLtAU6cvrBiA-1
X-Mimecast-MFC-AGG-ID: fXTR2NiLPDiLtAU6cvrBiA_1751584993
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fb01bb5d9aso5073446d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 16:23:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751584993; x=1752189793;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V9SM1r4kZ+sX81Mdumv2hWNVumjYJEFhq1ifXw5ch4g=;
        b=q+68Tmz2eFbXifWaVDXzKs/8hytbGOYmgVaYw8AWzg2JFro8MgGExfJd6KOLwtntA7
         ETvHlvpkyNWFeNMzBReVGREuckmcHg/QuJrwHvEV6N1KmM+9/jtRvY0z+EWwLgFN1rGm
         Sr0gv9ar3XKtYcCNGak2kPGf37SdOzT6hJx6gt6sGkUS/0RPJ+uEBMTK1CvFiidhteIU
         6hJlYvq4d03dNduH7HIJ2wKkVsKyemSoyNlG9B0UlZvUOYar3Fb8lRkNjf6xA0bfozNy
         rRzT+HoVh1fMWvnyAY8ajwpgAmQeB72RoWpE+w6MLzshjWQErjJTGppeQ8hhbM0UuFjb
         mdWw==
X-Forwarded-Encrypted: i=1; AJvYcCUBkiKDuObvaROlSxtekTqU+1d/iTlbzATYAhxEMXxUzNaFlF+eTB0TD0tvhPX87iF99WzyeV4MJthQIkE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyks5phO8HNsgw23vPJLZDortzMPrNYZEO4pduyYqDFvA5tGYJU
	D3SJ/jj0tODd0PFZbKa7eOLpAgdKc/FD1cXbGkClf7gLADUKTiWHu+ACJF2WCOuWU9zt0PSMzpM
	Hp2s+uj+9lLpx461Z/BG+G6UlktnVJNziBXHJdv5raGvo4Ql7/ol5eHsiduZrjj3xlQ==
X-Gm-Gg: ASbGncvSbvABbdlZJv/Yt8eXFVHDrvY9YaFvONntIPgXEqgz3yE5cqu6y4DXP2otU7C
	Mf52xkDtCueeh6OTk/BSfP4K466GtipR+KlTJA+nbGTkAdiy6gRoEgEB50HWssoVqvuA2ZedPPe
	M758sDd42ZggOyVO+kHzmOVrQV0uSDkFAJVTm9CmVE5HpDZeCZgyn/MOheY4zfHgFWV0o9VEIRz
	e5Gqg/NkLhBulYwFp9EErJX3X0IYVZ5lqCB/2sVwZOHhYV1dC4j8zugwIHUQCCBPtsMnhImq6nG
	yAXKouU2WeRTKy0cf/VDDmkDikDqQ7zHn9EQiX8MBH3x2JvaT0s3+u/zKOA9Kw==
X-Received: by 2002:ad4:5def:0:b0:6fa:a4ed:cce5 with SMTP id 6a1803df08f44-702c6dd6d2cmr2496336d6.44.1751584992854;
        Thu, 03 Jul 2025 16:23:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGI3ipPg2Jg+5GD7hTnCiXfrGoYgoIQ3H/qFVOQMX3H3uHxeS2iTGlz+BWau3PM9f3haP1PQA==
X-Received: by 2002:ad4:5def:0:b0:6fa:a4ed:cce5 with SMTP id 6a1803df08f44-702c6dd6d2cmr2496116d6.44.1751584992485;
        Thu, 03 Jul 2025 16:23:12 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5a958sm4469956d6.84.2025.07.03.16.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 16:23:09 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 03 Jul 2025 19:22:28 -0400
Subject: [PATCH 04/10] clk: qcom: rpmh: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-clk-cocci-drop-round-rate-v1-4-3a8da898367e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751584976; l=1326;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=JjW2YpRPz+0lPSN1r9ZPq4mBQxxVW0XXtxuqTB96kpo=;
 b=zf4/vhBsMxt+TAFqD7aUPTk19Bt+lcfBLX/WML5Wb9wvluceirqF+3xXA/SRJdeeVovfmzXVw
 wjKAv88CuWoAzAa7aZ5FVjlB+6EYYOYea3w9xYISlQIYpuJFVJ7J6Lu
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/qcom/clk-rpmh.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 00fb3e53a388ed24ed76622983eb5bd81a6b7002..74b052ac1ee10bdeeb59880019fb06ad58db3f74 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -321,10 +321,10 @@ static int clk_rpmh_bcm_set_rate(struct clk_hw *hw, unsigned long rate,
 	return 0;
 }
 
-static long clk_rpmh_round_rate(struct clk_hw *hw, unsigned long rate,
-				unsigned long *parent_rate)
+static int clk_rpmh_determine_rate(struct clk_hw *hw,
+				   struct clk_rate_request *req)
 {
-	return rate;
+	return 0;
 }
 
 static unsigned long clk_rpmh_bcm_recalc_rate(struct clk_hw *hw,
@@ -339,7 +339,7 @@ static const struct clk_ops clk_rpmh_bcm_ops = {
 	.prepare	= clk_rpmh_bcm_prepare,
 	.unprepare	= clk_rpmh_bcm_unprepare,
 	.set_rate	= clk_rpmh_bcm_set_rate,
-	.round_rate	= clk_rpmh_round_rate,
+	.determine_rate = clk_rpmh_determine_rate,
 	.recalc_rate	= clk_rpmh_bcm_recalc_rate,
 };
 

-- 
2.50.0

