Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72932DCBFA
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 23:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751584990; cv=none; b=h6YcKvmDXJqzXuR7TcRA18cYG8YCEL3gmsl6e+DFLu92jCgFt2rG8j+DCXkpwN2FUiJKV1vWiXr2x4O1bTwNDfKQ7gjHf5z86InTkDWuqZcwHH8g8CbrzB0DymnRSWO30ykcW8l3RreqFT4n23k7V27jey30ql9WMg0N8AIADyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751584990; c=relaxed/simple;
	bh=1SBXkivgAIQT/xpKmW16GCKl6DQTPvDdkzKcxCMxAeE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Iyj8ME0M+Hj+61KWv6npFuYQFcxAMuQC3H+yG/tpo84OpuY5IWoxGgBGugInDVHBxhth2N+XFLOvH4ok6yjBx0bv/qbcbfsMrbRwEoJdplz23foJrV2wek/DRpmZJU19uAxmmfTsape9AQKYr/3/Sazx5Z9BlrGBkWNHvwbfBSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R5cVmnOn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R5cVmnOn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751584987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=glmhRhvorqftCM1PQW39H91YcYQ1dirxkl9GgHITt1M=;
	b=R5cVmnOngN3fMvA8hxWdRDFYpT01YwW8114t1zR72utiSYNNCYvW3SwXtttpZvVuck2osL
	h9eIflC7U0mk/Wm53kbeNj1CFNQGsyXdjurK7yOcXGw1uPFxX9OXRc/QUUHLacbcHIwbt4
	4ecpvBknqOyI+HrSwxNoH7NWsEUg4B8=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-424-yKrxoK90N96Q2zdAUM5Tig-1; Thu, 03 Jul 2025 19:23:06 -0400
X-MC-Unique: yKrxoK90N96Q2zdAUM5Tig-1
X-Mimecast-MFC-AGG-ID: yKrxoK90N96Q2zdAUM5Tig_1751584986
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fac216872cso8454426d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 16:23:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751584986; x=1752189786;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=glmhRhvorqftCM1PQW39H91YcYQ1dirxkl9GgHITt1M=;
        b=baws4voOV+n1jYpIoks3wkJbRTGfGKdS52/mfUjQld9FzK+Ry9gJPoHPHCqeLBP2XA
         oUivr3NJvlzh1VVoqc4GzpWFOJPtytInuFAdFeNl1uovnrmblxHWlKBhXrhJtmaH2mOZ
         jPwo1TmSnsZ0bmkCkF77DqRhpnSZ5UPkDlyxuWAlXmFbNHx73NEQK49oPQGz6/NnnJtz
         gwGLT7+Jt7Aq8UYcV+xzHokGAjCeU3JXlj8xnOSc7OMu/SH5lKK8vfOT/PijoNbBSYaY
         T7/E/CRDzksNOjV+eDeNNwzofnX26wOjCMaR5wUEmtWOAGZj675H9bttFVWshXperDZD
         Q8dw==
X-Forwarded-Encrypted: i=1; AJvYcCUmV+IjIck2R9L9q+sza8AfA5xsu4SyN2TIHMcdSAl3LFhYS3sA3gzSp/oFm0OZf8NaM/V6HrIDWx41zAM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+yjyDQbjbgLGS1U5gkj4/Iz0E5GVsfDXz9ln9fhuPrLjqAcX8
	53JitYL1JFx0W4E/+20BtwYLkm4HS8BlV0Oe5hU8UbR2QtCDlhAxALv1erF6hbEZ6jPwi5Ttka2
	fB5H24jS+Nei/jA21p/5aOKOGHJ18Gq5aSg7PSkerfbkJFdtbYdChwkVRczEzKwlnww==
X-Gm-Gg: ASbGnctjmGrwpKeh08RC0mx4lVEWPpuuxvTxGa+FpgEbWYfDF+Pz+vUZPWIu4KOkeEE
	EPji7zSA/uaExxzey53aMXWFhcDNNAAVoER5xbUsH2Ve6XwQstdKtLpDKDGb0+kBJSe8LLtHqCy
	6lHo3AGfaZZF7ir7efHr7eMmcXsmogwYoRzOVwLfCzKIkWo3r8PJuLXWQze2e2Yns1yrVAY2vY3
	QwcrivaO8XHu+aLDLFfee8T6El2KTfAuQHK1GhwDbj2M93ORCIkREB40AOeKrm4GDOBPJr8tf+6
	dLXTkGLFGijws2fQyerTdGy2LLUuq1G/nkKl2xL3yjw8GPHhJPT+ngp2CSmqXg==
X-Received: by 2002:a05:6214:2dca:b0:6fb:5f1d:bf8c with SMTP id 6a1803df08f44-702c6d01136mr4001156d6.11.1751584986106;
        Thu, 03 Jul 2025 16:23:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXulxd6EhHQEWqdLCkq6bowgpk9H5xc/2E0qAWrXV2cw9IMvYCQaGyeK1vlKk4+HCoD7JcAA==
X-Received: by 2002:a05:6214:2dca:b0:6fb:5f1d:bf8c with SMTP id 6a1803df08f44-702c6d01136mr4000676d6.11.1751584985738;
        Thu, 03 Jul 2025 16:23:05 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5a958sm4469956d6.84.2025.07.03.16.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 16:23:04 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 03 Jul 2025 19:22:26 -0400
Subject: [PATCH 02/10] clk: qcom: gcc-ipq4019: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-clk-cocci-drop-round-rate-v1-2-3a8da898367e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751584976; l=1744;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=1SBXkivgAIQT/xpKmW16GCKl6DQTPvDdkzKcxCMxAeE=;
 b=F0GhFYifg67W61nanNKHwHfKd+yXvRKHNLyjxttEwNvS+4WIggMD8oWPnfPgFZE6hEmZ1fiIO
 n/Dix9ZjUe/BuSWXFyFuVK1zEaIQUGKOyn0QrOGVaTFUnEWIHOKyt1n
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/qcom/gcc-ipq4019.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/gcc-ipq4019.c b/drivers/clk/qcom/gcc-ipq4019.c
index d38628b5226898b6a556a1fe16806cb79c4735da..5ac44cfb53ce023c0668afdcb67de636f3319197 100644
--- a/drivers/clk/qcom/gcc-ipq4019.c
+++ b/drivers/clk/qcom/gcc-ipq4019.c
@@ -125,21 +125,23 @@ static const struct clk_fepll_vco gcc_fepll_vco = {
  * It looks up the frequency table and returns the next higher frequency
  * supported in hardware.
  */
-static long clk_cpu_div_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *p_rate)
+static int clk_cpu_div_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
 {
 	struct clk_fepll *pll = to_clk_fepll(hw);
 	struct clk_hw *p_hw;
 	const struct freq_tbl *f;
 
-	f = qcom_find_freq(pll->freq_tbl, rate);
+	f = qcom_find_freq(pll->freq_tbl, req->rate);
 	if (!f)
 		return -EINVAL;
 
 	p_hw = clk_hw_get_parent_by_index(hw, f->src);
-	*p_rate = clk_hw_get_rate(p_hw);
+	req->best_parent_rate = clk_hw_get_rate(p_hw);
+
+	req->rate = f->freq;
 
-	return f->freq;
+	return 0;
 };
 
 /*
@@ -205,7 +207,7 @@ clk_cpu_div_recalc_rate(struct clk_hw *hw,
 };
 
 static const struct clk_ops clk_regmap_cpu_div_ops = {
-	.round_rate = clk_cpu_div_round_rate,
+	.determine_rate = clk_cpu_div_determine_rate,
 	.set_rate = clk_cpu_div_set_rate,
 	.recalc_rate = clk_cpu_div_recalc_rate,
 };

-- 
2.50.0

