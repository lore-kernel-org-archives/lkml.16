Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F400822CBC6
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 06:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749622462; cv=none; b=h48F6oXwPpOoZ2KJZlo5thNzf3tjFjrG6cHDWsY+8nTdKJL06i/afUcEiEc72531PVpSE5c5cT1Sb+XUZKm1yd8H/XQEUiyb2WW6Ebop1V3yjiS3mLSB+uOtA4wH44IKpA+I2/1KqnQ/d+CFL2myxUapc5egsB4yrcaz1caO9UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749622462; c=relaxed/simple;
	bh=NNpY2A6LBp263syvyG1Ecsfx8CioM309dnOrlcmWHKA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R0zNZUpYZyUmoPms3pn2/uQvdmoMs/uFXPFcjk4dK/lj3zkQYJZ3rp9wIepK9Vt19nmJK2FmYXziB7szQFRcRZ2OfjLHfJZhAFGLr/KzIb6fYjfdmViW3xTsDweRaY0U6QVU+MmA24xTWqTQZdwAhis8XEZuaX2K0oJOB9rYzQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jCjuaYR7; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jCjuaYR7"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-450cfb8b335so287105e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 23:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749622459; x=1750227259; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q86QDWzbyqUrHwy10F9ZLVZs4bIWtafdYZALzNzfzYA=;
        b=jCjuaYR7O8tZkQzIrDwhyqdYKo7gzjZ6heJtIsGbQCMg90zGo1duRORdJqVtqhC3Rn
         bivuqUQZtpTVSqbOBs0fEY6AvyfrKimtF+8oOC8CrdqAMd1vkkcO5c3wh0hrGJWKNP9R
         cctucrVnc5l8ABnbI3mjbn+GBwldtp9NJIwf6UP5jbDfEcG5HVJDY1LGsqvGrGG8WHti
         63dTiJxUMuNAUP6QoKZDY6qbIO3NvuhuTbnLz8skuXYLXaPEaeJ1TPfcbXILOMiKGRH1
         syJmxEZXr1ej8YSiUg+PksC4eZDpXO3LX+oWtZIjEYLxCI88cYxcmLz8mbf7XZXJMeQL
         yA8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749622459; x=1750227259;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q86QDWzbyqUrHwy10F9ZLVZs4bIWtafdYZALzNzfzYA=;
        b=oSgfZUg+iLBk013TdwJ51Gw08kR1jWiSfeO79DibewBmekxgR9A5wcLSC3jkFD9Zcr
         1kDc4BlnGUYX5txfwB3hYueMZRy7AIdnATundvD4In4SlWwtt3Uzhwm75i+eoO/StpyB
         zWRYLwuWSOj4QjyIFuOthv4Pa7MjRHFTB5li/I/ixFvxWC6QUOQTcLL/y/EXF6/QCnfP
         mJ5BYkl33AdQj/088v1yjL3kzEIwguKTpNbuz7eGTcRbwd94iMzRXpcEAD04altWaykW
         XZhZEdJSO5ERca9pTc8cbioiloGYyps+3Rnxq/k7d/nwel5a/1gr3/Gn/ceBRaRLqrjl
         BSTA==
X-Forwarded-Encrypted: i=1; AJvYcCVBoEgJPQaFr7rdPl4znX/UWN49VxfX7u54j4mC36CkFgUhKKFAaBag/Hl4fQEB05wT2l22vVFhdViCQDU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYhAxwrv4I2XBTstq+9CBJ2cEPGtatm8kbGNhYqqmbWdKyEFJV
	cRhB9ijB32VOz0NrRLNUPuyisynfFaCdZ+oR/DaJM0+6zwprNei61yhMHemGphy10dE=
X-Gm-Gg: ASbGnctx293W/PEnfoD10B3fQRofMXHKmRBu+N8JLqZ4vWVYbAsuBgpU0ZhgYtc7MNF
	+LPdLTl35rX7GuJanvb949i0BuhCuNOaXU7FZvrj+bjr9cYo4TORVxYGmES4V7Zbod+Dm2b1QII
	1VgWcLLuwUJ5Nm3N/3wBV6d+3H4agKWfpBJj8C6EKAl1htd1hENRmBALpM3d/Jerb+0WoVhDdXJ
	gaK8Z778pL+OcxRt92CcJZVVadJtDXhA2emIqSCudtahdXy91KafT/ofY0JfDdeADmyBJ4CQeaX
	D9Dal1F0wTfCUJ0cOlXIdsmmaU8RuegrHqKStrQZq7m+tl8rDY2QLV1S63zpbeCQ5iZjGLp9r/O
	B8p9mPAw=
X-Google-Smtp-Source: AGHT+IG0MrurMqwANRNDslKVkh3dKprU9y6IrTQpViebfAkp6mB1Umn/L5OKQlg735b88DTWJ/T9nQ==
X-Received: by 2002:a05:6000:288e:b0:3a5:2dae:970f with SMTP id ffacd0b85a97d-3a558821396mr547873f8f.13.1749622459437;
        Tue, 10 Jun 2025 23:14:19 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f516sm14142791f8f.74.2025.06.10.23.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:14:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 11 Jun 2025 08:13:35 +0200
Subject: [PATCH v2 03/17] pinctrl: amd: Constify pointers to 'pinctrl_desc'
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-pinctrl-const-desc-v2-3-b11c1d650384@linaro.org>
References: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org>
In-Reply-To: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Jesper Nilsson <jesper.nilsson@axis.com>, 
 Lars Persson <lars.persson@axis.com>, Damien Le Moal <dlemoal@kernel.org>, 
 Vladimir Zapolskiy <vz@mleia.com>, Michal Simek <michal.simek@amd.com>, 
 Emil Renner Berthing <kernel@esmil.dk>, 
 Jianlong Huang <jianlong.huang@starfivetech.com>, 
 Hal Feng <hal.feng@starfivetech.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@axis.com, 
 linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2097;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=NNpY2A6LBp263syvyG1Ecsfx8CioM309dnOrlcmWHKA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSR6hdhqC2eDe217cvGUZMEh1W/4vld1oNnYW+
 YkZbRVX0u6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEkeoQAKCRDBN2bmhouD
 15CoD/4hfYjkCZdVyazNq2ibT7AGxKu+nI1YPoMthyyZMz5plU+l+nNgmymy2NyhFPLVlkvCK4A
 4FsvS1iJn3Dkr+y2bC4QBIUT6dXj23C/I9Y+3v2Xg6Hx56dWfC6oNqEvF+rYuLqoJpq7A4T3RPj
 11snIaP0e4JrVwiKZh0u+TcJM7WOVXMiQmX60PHyUR1rnzJ8HXuhCqTtE+RTBK6gIjHFzZGp5L9
 q8UgvNJTUf5z2aiIeb1m20vw8f+zaUsHEVTBA5pQfrzaP3VRCuXmtWb9nRDuE1Q5btLjbaAmtiG
 9eaROFIx5bFOf+Sg9Ok9Gj2Q10AZYnHmnkoy4IqVI6kGx30tO/SVz/T3rgjNol+hXAQHI1hLcmk
 XVGVC16NfQipwhxK+aPcl2ywGautuFcWgIHKgPcVZZENQIcSUvtYzB18VACNwO+5ipDcASefqro
 QFP3fiWL3DaMswdeQCBUr36ds+srNu1ED0hRChkBFVsv/mKeJCXpoy9aEwWCSVtFi89Zld0QFFX
 MVKlitmuZXfSPnxmXiQaGaYXstF+0Fj4VHKYg2U27Irx1aunnaZdNwgPgX5pSPhe9Y4xoUm0xrm
 2HtZbv19j2BQ7vx/8hkKMv2025M8QDoGlqAB55eUy1ppAZx8gZ1ZQyAOOBIcShwwTyUgeLGvELM
 hElg3VcQFmHOyDg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Internal functions obtaining pointers to 'struct pinctrl_desc' do not
modify the contents so they can be made pointers to const.  This makes
code safer, explicit and later allows constifying 'pinctrl_desc' in
pinctrl core code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/pinctrl-amd.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 5cf3db6d78b79af9ac5e7226de239a0d2f9aaacc..85617cfed2299e131c110e9d4084370790106404 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -872,7 +872,7 @@ static const struct pinconf_ops amd_pinconf_ops = {
 
 static void amd_gpio_irq_init(struct amd_gpio *gpio_dev)
 {
-	struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
+	const struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
 	unsigned long flags;
 	u32 pin_reg, mask;
 	int i;
@@ -901,7 +901,7 @@ static void amd_gpio_irq_init(struct amd_gpio *gpio_dev)
 static void amd_gpio_check_pending(void)
 {
 	struct amd_gpio *gpio_dev = pinctrl_dev;
-	struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
+	const struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
 	int i;
 
 	if (!pm_debug_messages_on)
@@ -957,7 +957,7 @@ static bool amd_gpio_should_save(struct amd_gpio *gpio_dev, unsigned int pin)
 static int amd_gpio_suspend_hibernate_common(struct device *dev, bool is_suspend)
 {
 	struct amd_gpio *gpio_dev = dev_get_drvdata(dev);
-	struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
+	const struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
 	unsigned long flags;
 	int i;
 	u32 wake_mask = is_suspend ? WAKE_SOURCE_SUSPEND : WAKE_SOURCE_HIBERNATE;
@@ -1001,7 +1001,7 @@ static int amd_gpio_hibernate(struct device *dev)
 static int amd_gpio_resume(struct device *dev)
 {
 	struct amd_gpio *gpio_dev = dev_get_drvdata(dev);
-	struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
+	const struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
 	unsigned long flags;
 	int i;
 

-- 
2.45.2

