Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A63170A26
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 20:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746391258; cv=none; b=qYvjCRU55W6knuGUccYGzkvp66QUT/pURSKNiB+3IbpxSa9yzj3xv6teYuymQCO0JFydNEYnWYQ6m67/fIi8jgVoAJjtERExCS2Ml5ItpQsq2tV948OJhoRJkM+GDb42qeSYAmxZiUkeyv4TndOqCcyy43VCFE534WKfiUsguOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746391258; c=relaxed/simple;
	bh=ymNnU9gWl9o2jOTTQYzyd9MueKx0Q6+Iy/qldp4aKKk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C2jhGb0hzN5OZ2DAO7iRf1XNC4QVGSEp7PwJyQMISulbH1Cp/SPUYx5K+vzTwKUbOzKJYbiT42ZOAp6BUUrqT5m5MiOVPwm+w34CO00H0IWvSPPkBbnpKDb50S4z9DocqGjTcfeCCZE/S5aDB3bqwbIxVl8sCnYj/WwSnWhpqXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LWMTivwK; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LWMTivwK"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7c59e7039eeso565904385a.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 13:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746391255; x=1746996055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ivHV0culI7q/iJMrYzdhZgCGEeG95tar4MqVt7/GJiw=;
        b=LWMTivwKuEnzbnddPY+192j3AlfZXuiyIiglBXi8PslR7FK+kB6YuYVcW1quHTXGGv
         vpGNYbXuhQEKFrWxLlioOl67P+JowEzl7xGmY66r63kDKtartOkQzhUG+yhBiUiWH832
         fYb6yU1FMf4Tbk6XlPfxnoF6EZtHtPWNzlpLbKFC9G+Um1MjEznsJRVmO5RkQl3g//+6
         kzSBBl3ZeDNV/0saTRgqY1SjkH0fmhMMYv1n8Gds8e0V8CkYv06YSA7ISLpmyUnoru19
         jqP2su28Na5XAunyetontguA4XtUavXXGr0zsTAzbY6jhWjMlHZ0XSY9RDlRTsboCmE9
         oWyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746391255; x=1746996055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ivHV0culI7q/iJMrYzdhZgCGEeG95tar4MqVt7/GJiw=;
        b=cRoMmny1nPO0FwCU7YHz1UcsecmAkNNCxk65wcJHb3rZXC2F55hwzuqVNdVU3yDOG+
         sL6TTRIH2WZ30zIMvY80df/Muk62AXTyhj262Q0zuxS7tOHPL6CRbp69D0P+Zmkx8/4a
         J3dLv/DCAnu1YBsrcWsEGyCL9zf0KHMiRoqIK11oBuM3O0JA+WLaDh3fM1ythepxnur2
         xt1IL2ydeyPV0EDadMHwH07LA2QMO/AWQMOyqf7RnsJA7bKZgmtQwgzpnOgHVZYnVDmF
         KoNfo7q9wLh0/u7fLXemFf29NcdTRn11qhWyBImQICCYdMAMlcaOViwLExuHUhHND/J9
         5tOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVajZQzQo4ma+UwB5ynOQT+EyAEsT76gtth5q2nm9kP1ALcG0L7e9kNwsVAUpiIXsmhAp8tsbfN7v5gzWY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdbE2CiD/cfSe3gM8Ky5VQM7ujRy8k890w5AU6wfYfbbqarK2P
	eandoBFsph9YgFUpBX9gbFpoQxJgGd+muWd0kNEb2Va1COK1mUnq
X-Gm-Gg: ASbGncuI+PycSQX0yKe7p1HYzWVh1iV2w0HHkfZNVFaxvTJgIk+DncfzehIVekWMwyJ
	U52y1Qx3RQDfwnVdRSrM4qovQ+9+Jp1kN3INKQNKwWV3wLLQo7r9DdAes/F4tcXdqXel94e16I2
	zcvAYd51C0Yp1SL2NH+Bj5BpSQiyu39KbrJQcKPCt0zjjsmgmkCJXgGdwu2LSE8mHLsnrO3KmWz
	GB8CQFiK2ysGsL9zlqNoggjXZd08bFK4Wn163x5nMJv03GKvxKd5QAzbHQlg/5gWEDhMAJ2i+pO
	AcKOUqXPhf9LRKcSbkrbilDu/5SBTV4JO6WbUvfWLhhq1SGf9ukiBhXPLY3ofvN6Eiohik+/BiI
	L3cgRx18m0xcAoCA=
X-Google-Smtp-Source: AGHT+IEa6cjtCqTlIuFgixtxgdR+H7qINB/tl+btB2wLVN9xTQrjPHB67BxJS8Gastvkmizoc6oHBg==
X-Received: by 2002:ad4:5ba1:0:b0:6ea:d393:9634 with SMTP id 6a1803df08f44-6f528c453bfmr86815886d6.3.1746391254838;
        Sun, 04 May 2025 13:40:54 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f50f3c3892sm46286516d6.34.2025.05.04.13.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 13:40:54 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-phy@lists.infradead.org
Cc: dominique.martinet@atmark-techno.com,
	frieder.schrempf@kontron.de,
	u.kleine-koenig@baylibre.com,
	aford@beaonembedded.com,
	Adam Ford <aford173@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] phy: freescale: fsl-samsung-hdmi: Refactor finding PHY settings
Date: Sun,  4 May 2025 15:40:41 -0500
Message-ID: <20250504204043.418924-2-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250504204043.418924-1-aford173@gmail.com>
References: <20250504204043.418924-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There are two functions, round_rate and set_rate that duplicate
a lot of the same work, so simplify the code by creating a helper
function that will identify the phy settings for a desired clock
rate and return the structure with the corresponding settings.
From this structure, the round_rate and set_rate can both get what
they need to achieve the clock setting closest to the desired rate
as possible while minimizing the duplicated code.

Also rename phy_clk_set_rate to fsl_samsung_hdmi_phy_clk_set_rate.

Suggested-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/drivers/phy/freescale/phy-fsl-samsung-hdmi.c b/drivers/phy/freescale/phy-fsl-samsung-hdmi.c
index 40f33e5ac6f5..a081f07681db 100644
--- a/drivers/phy/freescale/phy-fsl-samsung-hdmi.c
+++ b/drivers/phy/freescale/phy-fsl-samsung-hdmi.c
@@ -456,6 +456,8 @@ static int fsl_samsung_hdmi_phy_configure(struct fsl_samsung_hdmi_phy *phy,
 	int i, ret;
 	u8 val;
 
+	phy->cur_cfg = cfg;
+
 	/* HDMI PHY init */
 	writeb(REG33_FIX_DA, phy->regs + PHY_REG(33));
 
@@ -521,18 +523,9 @@ static void fsl_samsung_hdmi_calculate_phy(struct phy_config *cal_phy, unsigned
 	/* pll_div_regs 3-6 are fixed and pre-defined already */
 }
 
-static u32 fsl_samsung_hdmi_phy_get_closest_rate(unsigned long rate,
-						 u32 int_div_clk, u32 frac_div_clk)
-{
-	/* Calculate the absolute value of the differences and return whichever is closest */
-	if (abs((long)rate - (long)int_div_clk) < abs((long)(rate - (long)frac_div_clk)))
-		return int_div_clk;
-
-	return frac_div_clk;
-}
-
-static long fsl_samsung_hdmi_phy_clk_round_rate(struct clk_hw *hw,
-						unsigned long rate, unsigned long *parent_rate)
+static
+const struct phy_config *fsl_samsung_hdmi_phy_find_settings(struct fsl_samsung_hdmi_phy *phy,
+							    unsigned long rate)
 {
 	const struct phy_config *fract_div_phy;
 	u32 int_div_clk;
@@ -541,83 +534,66 @@ static long fsl_samsung_hdmi_phy_clk_round_rate(struct clk_hw *hw,
 
 	/* If the clock is out of range return error instead of searching */
 	if (rate > 297000000 || rate < 22250000)
-		return -EINVAL;
+		return NULL;
 
 	/* Search the fractional divider lookup table */
 	fract_div_phy = fsl_samsung_hdmi_phy_lookup_rate(rate);
+	if (fract_div_phy->pixclk == rate) {
+		dev_dbg(phy->dev, "fractional divider match = %u\n", fract_div_phy->pixclk);
+		return fract_div_phy;
+	}
 
-	/* If the rate is an exact match, return that value */
-	if (rate == fract_div_phy->pixclk)
-		return fract_div_phy->pixclk;
-
-	/* If the exact match isn't found, calculate the integer divider */
+	/* Calculate the integer divider */
 	int_div_clk = fsl_samsung_hdmi_phy_find_pms(rate, &p, &m, &s);
+	fsl_samsung_hdmi_calculate_phy(&calculated_phy_pll_cfg, int_div_clk, p, m, s);
+	if (int_div_clk == rate) {
+		dev_dbg(phy->dev, "integer divider match = %u\n", calculated_phy_pll_cfg.pixclk);
+		return &calculated_phy_pll_cfg;
+	}
 
-	/* If the int_div_clk rate is an exact match, return that value */
-	if (int_div_clk == rate)
-		return int_div_clk;
+	/* Calculate the absolute value of the differences and return whichever is closest */
+	if (abs((long)rate - (long)int_div_clk) <
+	    abs((long)rate - (long)fract_div_phy->pixclk)) {
+		dev_dbg(phy->dev, "integer divider = %u\n", calculated_phy_pll_cfg.pixclk);
+		return &calculated_phy_pll_cfg;
+	}
 
-	/* If neither rate is an exact match, use the value from the LUT */
-	return fract_div_phy->pixclk;
-}
+	dev_dbg(phy->dev, "fractional divider = %u\n", phy->cur_cfg->pixclk);
 
-static int phy_use_fract_div(struct fsl_samsung_hdmi_phy *phy, const struct phy_config *fract_div_phy)
-{
-	phy->cur_cfg = fract_div_phy;
-	dev_dbg(phy->dev, "fsl_samsung_hdmi_phy: using fractional divider rate = %u\n",
-		phy->cur_cfg->pixclk);
-	return fsl_samsung_hdmi_phy_configure(phy, phy->cur_cfg);
+	return fract_div_phy;
 }
 
-static int phy_use_integer_div(struct fsl_samsung_hdmi_phy *phy,
-			       const struct phy_config *int_div_clk)
+static long fsl_samsung_hdmi_phy_clk_round_rate(struct clk_hw *hw,
+						unsigned long rate, unsigned long *parent_rate)
 {
-	phy->cur_cfg  = &calculated_phy_pll_cfg;
-	dev_dbg(phy->dev, "fsl_samsung_hdmi_phy: integer divider rate = %u\n",
-		phy->cur_cfg->pixclk);
-	return fsl_samsung_hdmi_phy_configure(phy, phy->cur_cfg);
+	struct fsl_samsung_hdmi_phy *phy = to_fsl_samsung_hdmi_phy(hw);
+	const struct phy_config *target_settings = fsl_samsung_hdmi_phy_find_settings(phy, rate);
+
+	if (target_settings == NULL)
+		return -EINVAL;
+
+	dev_dbg(phy->dev, "round_rate, closest rate = %u\n", target_settings->pixclk);
+	return target_settings->pixclk;
 }
 
-static int phy_clk_set_rate(struct clk_hw *hw,
+static int fsl_samsung_hdmi_phy_clk_set_rate(struct clk_hw *hw,
 			    unsigned long rate, unsigned long parent_rate)
 {
 	struct fsl_samsung_hdmi_phy *phy = to_fsl_samsung_hdmi_phy(hw);
-	const struct phy_config *fract_div_phy;
-	u32 int_div_clk;
-	u16 m;
-	u8 p, s;
-
-	/* Search the fractional divider lookup table */
-	fract_div_phy = fsl_samsung_hdmi_phy_lookup_rate(rate);
+	const struct phy_config *target_settings = fsl_samsung_hdmi_phy_find_settings(phy, rate);
 
-	/* If the rate is an exact match, use that value */
-	if (fract_div_phy->pixclk == rate)
-		return phy_use_fract_div(phy, fract_div_phy);
+	if (target_settings == NULL)
+		return -EINVAL;
 
-	/*
-	 * If the rate from the fractional divider is not exact, check the integer divider,
-	 * and use it if that value is an exact match.
-	 */
-	int_div_clk = fsl_samsung_hdmi_phy_find_pms(rate, &p, &m, &s);
-	fsl_samsung_hdmi_calculate_phy(&calculated_phy_pll_cfg, int_div_clk, p, m, s);
-	if (int_div_clk == rate)
-		return phy_use_integer_div(phy, &calculated_phy_pll_cfg);
+	dev_dbg(phy->dev,  "set_rate, closest rate = %u\n", target_settings->pixclk);
 
-	/*
-	 * Compare the difference between the integer clock and the fractional clock against
-	 * the desired clock and which whichever is closest.
-	 */
-	if (fsl_samsung_hdmi_phy_get_closest_rate(rate, int_div_clk,
-						  fract_div_phy->pixclk) == fract_div_phy->pixclk)
-		return phy_use_fract_div(phy, fract_div_phy);
-	else
-		return phy_use_integer_div(phy, &calculated_phy_pll_cfg);
+	return fsl_samsung_hdmi_phy_configure(phy, target_settings);
 }
 
 static const struct clk_ops phy_clk_ops = {
 	.recalc_rate = phy_clk_recalc_rate,
 	.round_rate = fsl_samsung_hdmi_phy_clk_round_rate,
-	.set_rate = phy_clk_set_rate,
+	.set_rate = fsl_samsung_hdmi_phy_clk_set_rate,
 };
 
 static int phy_clk_register(struct fsl_samsung_hdmi_phy *phy)
-- 
2.48.1

