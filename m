Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4981424CEF0
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 08:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670769; cv=none; b=UbMidmVqmDufkw2acmlR/CTuNjaQW7EfG1gWkAswmpuDN8Lei11h3zIw37ADjp2UHRTB8d5Up9orO1RvWvw7nOFHp67ziIFr7YxA1+7ugLyKpy7+1UM07JEleQYAFV07jCOqwNSY9f8v2KcRADav2+y8asNiMaYYUaGTzRTbxBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670769; c=relaxed/simple;
	bh=GESUUSr32C5v+JmyTkWMyaf4NO/174Vzhegyb1L9aRw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DxJnxbY+zbaW5TYsEz2KPT2aUm6famp+4ryQ8EgPOtj0wUpSMeSe6ax+KnsshsuZsrpWEpXhfMM6HWQhe8TBfdobxW08NtlaLPVOfqxL/1Hv+eSVLHQaa9XlneYqkj6K4XTysB1nC5qN6LdnKnbpfHPpGfFSSngEIdRwGnEXgNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BjAy18u5; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BjAy18u5"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac6e8cf9132so123717966b.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 01:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670759; x=1744275559; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PSEpA1j4+zmEauzOiOoF/mVKhD6CkjV25eyM5OWecNk=;
        b=BjAy18u5MDej46oSBLQj9uVL1Sf6Rm4PoIgfKOjGinEeCUa9eopc4vUN5LTSw8eQ0O
         KTh/zspz9CGcOj4RXCBWPauFPj5z3+7caeFdcB3iMMHTiztBuqFll3G82TeCMsHP0uoO
         gRk/E6nTEEj/R+RXpo6u2RaPjb/3UGgr0PIugrhU4jbkxD1zmJ10jfQU76aLRnMq6liz
         wnRlZGQfZF47MrHsz/ttO99IjC19HSV+bATLwDazmoLahCcuXevWH71OM259jXhQTN+z
         UKI15hg7XN9Lf80ZWYNViOMEuCHA2wyOsXw5lVRCisF8y43b2auBJXwzz9Y3lNWV9Np2
         +wcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670759; x=1744275559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PSEpA1j4+zmEauzOiOoF/mVKhD6CkjV25eyM5OWecNk=;
        b=FZY2oVvHntXIfJZmKkXvky44ymS71fHZ06i7I/BanRobbDNFlVci9eosO/T3LQb/cZ
         +Ks6HowY6lLYF/EoseCciuqM4JSWacwYhvgYdTXpPj/N4UmdxWN7TSw5CtIjDueh8S5x
         wQyqE0dpIVIRXs+FDgtUlZ+I5cYZbNt29nwBUF3E8crUFIlfxVwChhMZntiZNApNZPTK
         ekAU6EuvANNvvoq2rSmmEUu20ERGpkvJDX3/GeR9VandOMHh+jWxeXxxnZbBbyGFPSdd
         WXdVaLpLZgAwsHXsNcMVVyHNKujFteKQKbBinmRM2K8q2Bzd5+arf8WYdTgcC2LRCl9p
         fRbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWU02Gf9g486Vq1hdIKgVAHyP4szQXw7NSMglYLMocOUH5l1+Iyf2QjekxogUarEIdDoh8iW6wynODhRZQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzdfxDc0WMTjvQ5w3w0H5CEB2OwDvSbPPRN6ufRRmaAAmqeT9R
	VdOrPCH1ZM96xqAtj4hth3VIxeXF2mSYYPEdxHX7vu+8ApvPrpLCFV/erFF9T3Q=
X-Gm-Gg: ASbGncvNJ9TIlO4XXaMY4Jbl4UztXHsTwfGVUu/tj2ptzje93bV9u7QJ0yBLHIgqhKq
	duwcYdKdiZ1aSiUfvQbez/cdlWLfkhSbAR1VuH6GcJ3di+xDcEvx1bKyXobC3+MwNo7aKjUKA9r
	883nbMKbCajQqBlM+VwYnqMXi+d0EfDluLRCpbtQ7MgDf7ruh9CDoWzysjkaey5tUjiYk+27wXg
	vqrQK/n3J4MGtpVclnUvTZfsBWVq+3LcoePGgNcq5WILHk32ihYmVQzuymkx3JugnIBtK4jgLmz
	P8PPWfEIz5Ns3UEni1trPdnPMwUK7WgEiS9iFyieyxs0KNLp6A7cNnTX5N2zu2AdE+R5/ekkNmH
	Emo40bIXWy7q+oQJNSWxbW34esW/3
X-Google-Smtp-Source: AGHT+IH778midZRWwNsQwTegqpsc1cU2/xzEiQMSkFa1kd7UfUZDcEcX+jZvLbDF0curTDRXNPPiPQ==
X-Received: by 2002:a17:907:3d8f:b0:ac7:81bd:60e3 with SMTP id a640c23a62f3a-ac7c0935350mr136224366b.27.1743670758907;
        Thu, 03 Apr 2025 01:59:18 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:18 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:23 +0100
Subject: [PATCH v3 31/32] rtc: s5m: replace open-coded read/modify/write
 registers with regmap helpers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-31-b542b3505e68@linaro.org>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
In-Reply-To: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Instead of the open-coded read/modify/write sequence, we can simply use
the regmap helpers regmap_set_bits() and regmap_update_bits()
respectively.

This makes the code easier to read, and avoids extra work in case the
underlying bus supports updating bits via
struct regmap_bus::reg_update_bits() directly (which is the case for
S2MPG10 on gs101 where this driver communicates via ACPM).

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-s5m.c | 28 +++++++---------------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index fb65a8e439d72d9070751c00f5826a403ac0b416..2ad01fb3bc72fe9259a8307584c9cf3a839bd492 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -279,17 +279,9 @@ static int s5m_check_pending_alarm_interrupt(struct s5m_rtc_info *info,
 static int s5m8767_rtc_set_time_reg(struct s5m_rtc_info *info)
 {
 	int ret;
-	unsigned int data;
-
-	ret = regmap_read(info->regmap, info->regs->udr_update, &data);
-	if (ret < 0) {
-		dev_err(info->dev, "failed to read update reg(%d)\n", ret);
-		return ret;
-	}
-
-	data |= info->regs->write_time_udr_mask;
 
-	ret = regmap_write(info->regmap, info->regs->udr_update, data);
+	ret = regmap_set_bits(info->regmap, info->regs->udr_update,
+			      info->regs->write_time_udr_mask);
 	if (ret < 0) {
 		dev_err(info->dev, "failed to write update reg(%d)\n", ret);
 		return ret;
@@ -303,19 +295,12 @@ static int s5m8767_rtc_set_time_reg(struct s5m_rtc_info *info)
 static int s5m8767_rtc_set_alarm_reg(struct s5m_rtc_info *info)
 {
 	int ret;
-	unsigned int data;
-
-	ret = regmap_read(info->regmap, info->regs->udr_update, &data);
-	if (ret < 0) {
-		dev_err(info->dev, "%s: fail to read update reg(%d)\n",
-			__func__, ret);
-		return ret;
-	}
+	unsigned int udr_mask;
 
-	data |= info->regs->write_alarm_udr_mask;
+	udr_mask = info->regs->write_alarm_udr_mask;
 	switch (info->device_type) {
 	case S5M8767X:
-		data &= ~S5M_RTC_TIME_EN_MASK;
+		udr_mask |= S5M_RTC_TIME_EN_MASK;
 		break;
 	case S2MPG10:
 	case S2MPS15X:
@@ -327,7 +312,8 @@ static int s5m8767_rtc_set_alarm_reg(struct s5m_rtc_info *info)
 		return -EINVAL;
 	}
 
-	ret = regmap_write(info->regmap, info->regs->udr_update, data);
+	ret = regmap_update_bits(info->regmap, info->regs->udr_update,
+				 udr_mask, info->regs->write_alarm_udr_mask);
 	if (ret < 0) {
 		dev_err(info->dev, "%s: fail to write update reg(%d)\n",
 			__func__, ret);

-- 
2.49.0.472.ge94155a9ec-goog

