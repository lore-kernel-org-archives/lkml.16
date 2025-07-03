Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365162DFA22
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 23:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751584999; cv=none; b=qorfJqLLCutJndEy4XU7BLsV8oU/kBTl1g2R1WGMZuD19Cx9Djxy/WZiho9cByhpK9Mqxi8Y5XEJ0+O4PzBRVoiQQTgXw8I2JbgGprL7t6v5qRE4I2TQd63Lw4qV5+Rp/5tCY7v+DDW5ILVjLSeH2fWYvr9PJoCbuXGSHC+gztM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751584999; c=relaxed/simple;
	bh=jJkTWWJF3/5RXKxSt11n2asRYUE42Jhyt7x72H7Kcqg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RSF7TyMl0Xy2dDmD7Pt+ql1xi5mNgXQ0VUYyYKcHVR2kCsXU9G4akUL1SqemjBipM/EVEop3MaSMfgmsplxBl7g6/eSkr9mX/L2lgxZbqLOOQi5d8o1KtwjdertUh3wJnNJm7ae8yqhsJWZoN6jXZBqXFVTmmq1StXLWHOjJgII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A3ZnMapY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A3ZnMapY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751584997;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kG8RA2RMN+WwY2ubKngIBCBT47zo9cYuBqM+5cnEdCI=;
	b=A3ZnMapYgGhv9SkS1q8QAuUAtbL5OqJSzwOHl2iC7D5+dE5UKon8bvNvV0Gbbbe2vd1a4c
	mW4jIg/J63cAnQxtlHpJR0atHytJWDedWwNQh8ABcWdhNU6FCW0J66+X/ndPr5WEmOebi7
	G31+Z4wkIjMEz7ok6cFSpaKEpX3Eebk=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-TC6IXbMsPxaiXZtCkT_eQw-1; Thu, 03 Jul 2025 19:23:16 -0400
X-MC-Unique: TC6IXbMsPxaiXZtCkT_eQw-1
X-Mimecast-MFC-AGG-ID: TC6IXbMsPxaiXZtCkT_eQw_1751584996
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fabb9286f9so6594526d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 16:23:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751584996; x=1752189796;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kG8RA2RMN+WwY2ubKngIBCBT47zo9cYuBqM+5cnEdCI=;
        b=W37YtDk3FHwHOOTCij14Rzk8l0wZ3nFqGjo9I0JlwYsDvE6xpsjioxILKEZAkuHyy5
         8FOwDG6CgyWGpN5bnLAfnnfh0D6C3Hn1nKqescaErn+QmDMYfVqcUYRo57FqKTWB4M7y
         VaZ7HTFsYR9vchfYTadnLL3UjG0R+5VD/50GcvuGy7z1280a2mvPnc5OciXzTp+Vd5Sx
         BXqEKLRRb2oBSZ0oslBbjYS1BbEX2PpPVonBcM6CTWGrzeqW46TcJ0TIwp/yWIi3RlCy
         NoDYT81IioMb+eJHcxwUovURE6brA9wquzT3AN1AtFlK7JwcPTDEEcH0/Ubhh9NYeC4n
         3x3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUnF1sMqItstSIvpzWbjfr9ul66uhyLnj+CCy91vCyzHWqiWE1aVo+3MCX8C7aC5k654y7VBFNSIucwpKs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh1QeNJ8kIu6sWnLYcrZkx4gMcHiT9idmQpkuZoyTaZhvsp658
	ZawO+8fUyFq8uE5abErp3du+d+4vsdnYgVcmZbKLtI1nsF3lvucB5y7AOsC9EYYAg4lq5JmzNfP
	Ub2KGY9mJIspzNWjIB1Uez7axGJomWg8Dbmy4lP/zDM67ryNxKDQJc/3WGNs50DWxmA==
X-Gm-Gg: ASbGncvSHKMhH6Et9ojiqfAaHrwZbNFB+2EfEVTM4EwpI9AaJUrNAPXPAfGVhwz3z1E
	vqPQIzk+1NLjAu8rWljeuDOa8iv6blmaenFV5iws4x0nvSGzFG64sZqpQZTZw6GVAXs5BtRqZ1m
	uqa7nRYq4IO5uJ4YlphCBgsaoX+Kbo60JvWJkD0Uh/fyQNUr+++gm03gkRbv/LuCZVw04DaTftH
	ID/VCyp8bxJngtV7LCUyxHfsQrqmlUuYYQwFSKLuNRSunelrDgObuENEY7k35Uwlrqn9+IcDG9B
	13m22zMAChXF71w4ssTt9N/ydDKYdQ6zjI5YYqgcD9gj0SKauhdAgeIihDnaSg==
X-Received: by 2002:ad4:5ba5:0:b0:702:c123:da1c with SMTP id 6a1803df08f44-702c6d5a1bfmr3133326d6.18.1751584995742;
        Thu, 03 Jul 2025 16:23:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYU49F29nXLLJhUF6aQEdxZXPH42Yhu1DTnmyZaul5HXNd1rIQI+KPYemKNRW8NflwAqOr4g==
X-Received: by 2002:ad4:5ba5:0:b0:702:c123:da1c with SMTP id 6a1803df08f44-702c6d5a1bfmr3132936d6.18.1751584995402;
        Thu, 03 Jul 2025 16:23:15 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5a958sm4469956d6.84.2025.07.03.16.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 16:23:14 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 03 Jul 2025 19:22:29 -0400
Subject: [PATCH 05/10] clk: qcom: smd-rpm: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-clk-cocci-drop-round-rate-v1-5-3a8da898367e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751584976; l=1507;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=jJkTWWJF3/5RXKxSt11n2asRYUE42Jhyt7x72H7Kcqg=;
 b=WVf99xpXURqHDMOlRG1isIsZmcxQ2hVzruPLXEZLBIO4b3rIoDFPUB+65Us88g7XSb6xd555r
 vRtnzyNPfgpB/pkwsRXhEbFCMwp6sgfC61aI01PDavIaz23Jb23DZ8c
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/qcom/clk-smd-rpm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 3fbaa646286f284da12b902873b079863a2c0d77..3bf6df3884a542e7be572f2319990c2bfa7bc642 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -370,15 +370,15 @@ static int clk_smd_rpm_set_rate(struct clk_hw *hw, unsigned long rate,
 	return 0;
 }
 
-static long clk_smd_rpm_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *parent_rate)
+static int clk_smd_rpm_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
 {
 	/*
 	 * RPM handles rate rounding and we don't have a way to
 	 * know what the rate will be, so just return whatever
 	 * rate is requested.
 	 */
-	return rate;
+	return 0;
 }
 
 static unsigned long clk_smd_rpm_recalc_rate(struct clk_hw *hw,
@@ -427,7 +427,7 @@ static const struct clk_ops clk_smd_rpm_ops = {
 	.prepare	= clk_smd_rpm_prepare,
 	.unprepare	= clk_smd_rpm_unprepare,
 	.set_rate	= clk_smd_rpm_set_rate,
-	.round_rate	= clk_smd_rpm_round_rate,
+	.determine_rate = clk_smd_rpm_determine_rate,
 	.recalc_rate	= clk_smd_rpm_recalc_rate,
 };
 

-- 
2.50.0

