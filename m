Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3727E28150A
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 10:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748428929; cv=none; b=sp1AK4qNRbbl482xcY1mN+D8SdPzHw9V6YVDcDqStJ33mmNzDZHWxQlcEpOgqiX8E4jbIGG0I0gd8ZcI+LM61JEJL1gOH4qfLZojJt05hgTjBE22c9Kuuofu+JzxwBSoRv7CjTwapUaRsdEf49W3guOmzqDU51fpIpqW18rX4Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748428929; c=relaxed/simple;
	bh=AZcW1cQpsVdpMlMJDu5jWEgQJ6HALLwy007zMLKEIYo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u5GqE1htFIQV1rVDTsz1k7tcM3V2ofvL4xj7+acTdAaRNQRINwjiqOf95MmUCKEMaO9eADeC1BpfxyZhxdemw5EswQI6mcqW7fKrGOWVWQDF18+XyoL5nAdA4Y0hZPz2pjm+n7hOGNBfADy3DDwXv/3LJpRRV0ENfaNVv9b9FwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zJOlii+P; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zJOlii+P"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a4d10e910fso230657f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 03:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748428924; x=1749033724; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mUavy7B2LDMdwrM/5bMX/h9Rv/lKrrO3+mfX8hz6Iuk=;
        b=zJOlii+Pg5/CBnrMuTgvIJfsofHY7X71z48vCfN08dTSxGeJWHS74QMAlWbFYdNbxh
         iRQbuT8S+9QkgLjImjJ/5KYfOArqubZK2jrxV0Cbo9sNYNEeIL5GttRI5Tb8VPerOZES
         iZ16cTDpa1a8I8PzE9JPu+gVRIcaEqEgHUo/tVjVWDO/vZeUI/u4yf3Ms6ubpaV+Bo0B
         40GiBH6A7qcTryBw0icelxe2g/W+zUAjCd2BcjMXu3Ky8fGAFi5wSRbzvWhOhNcwIFDK
         1ASFU9gki6K9jw2desdJzKL1Yunc93CEQXXRsZCbm5MT2yKoL8KKLvJMn8TZUvHJ6gJL
         ZYlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748428924; x=1749033724;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mUavy7B2LDMdwrM/5bMX/h9Rv/lKrrO3+mfX8hz6Iuk=;
        b=Q0Z9EgxlcoOsg6M+tQSk1QRygQSvmQON8vNP4m9XNPRBUJOo5GNVE9qdLYLYI5j4Yl
         lFVtKrM45dak7ok1hlSBKWzgkQds3zIqaVW9m6Ex7/p9XA0+GuH5Pqx0/e4EIe8rsw3n
         WEO398wagbyj0anM9ZzlSoV9b/1Ixus98v2YgPI4TumtQFSI4OqW8JsG0oCKLHlv7K2i
         0rkRul6c67Ovwan0uydV9NJ/aV6jA1mPhUgH5tx9HlireW6UF0ThLsaZ+ieczzLDhBaq
         UeBIS0t7oXbUHA8o0eZsT6zHLwQgibWD8FtJTJsJzVkQsnb/n/9U5FSR8K1NvfeV9ZCg
         NuTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkiQdXYVcmyRULxTLv8H41yNrm8PRoPKcCXT/zQ/4iFNOZh7sB/hqfEbEAgSUnDC2vLncsFRAg5HEyzms=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcOh8NMCZuVAO2zaJ5jn3uUuGxiUxJOZDyBJhqnSt9+zvnwI5C
	Qg2svjLRnBfw+5F7exw72fw9vhBXhwjlcYj9nBhDvopJxTBOTCGUmFff3dmED2+J6dw=
X-Gm-Gg: ASbGncuPLkZAOFcGt0rERYVm3Sm3O0H5DdiWUn0q6pnIdPDUlVZrFbX1rcfb4dhrJdA
	A8ZyUzvUZFlZgKuEsTBKwWj9d1prQiJ0RpxH0qTNNWkINNm8Yr/komY3iVJnDYY8WzA47luLxer
	hMLBH9W2QokCfFIQWITOT6TeoexrZIzbPjjtkZJj1S10uzpK3/Jj3wbYz0DGuk8kd3vs9ERQntP
	2Pb6SQQEbL64gu6dqLVCJaJz3gTNvMJhZ6oCT6XzM/wTEy3/KX/djDO2HMRYlJuTikYJCGdbM5M
	tDCKEiQxC5Lu/m/KkvySJG8NGHnKSdJ9mAhV5bCbAnv4ZSIyIv8l3tCd0hzhct89HyjPjNQF9gR
	7uAs5QQ==
X-Google-Smtp-Source: AGHT+IHLM1FIhtqqL05DozCCpKQWY7ameEkMInI+HoHz6qQ+L3KMHdThy3m2Nh51nEncLqfROzqPGg==
X-Received: by 2002:a05:6000:2481:b0:3a4:d4a0:1315 with SMTP id ffacd0b85a97d-3a4d4a01404mr4061984f8f.6.1748428924388;
        Wed, 28 May 2025 03:42:04 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450064add8bsm17331595e9.17.2025.05.28.03.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 03:42:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 May 2025 12:41:06 +0200
Subject: [PATCH 10/17] pinctrl: bcm: cygnus-nsp: Move fixed assignments to
 'pinctrl_desc' definition
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-pinctrl-const-desc-v1-10-76fe97899945@linaro.org>
References: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
In-Reply-To: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
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
 Lars Persson <lars.persson@axis.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Damien Le Moal <dlemoal@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, 
 Michal Simek <michal.simek@amd.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Jianlong Huang <jianlong.huang@starfivetech.com>, 
 Hal Feng <hal.feng@starfivetech.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@axis.com, 
 linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2020;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=AZcW1cQpsVdpMlMJDu5jWEgQJ6HALLwy007zMLKEIYo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNuhRNPIvcbeE3O4oOSmCsEkL1h48gBgln+KJb
 OsiC6vomEaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDboUQAKCRDBN2bmhouD
 16dvD/4+GqEjL6kp16pjaPce/8s4v6Ut3thCgUQUhMlVSN3KQ5BciDx6aymKzKDe6Y385QtYh6/
 TTbLcF7wMxIsiys8zs4Joov8pnnsJFMs89/RxAHCkv0jVyWz1R82g5U3UxeAzVHOSClfzkG1ssx
 rukU7ZnCn8leZIhYYtv1kPDJSN5TvvmrLMqPDoeXKp/lmIMXMAfV7gA+hzg2SonnOP8zFIU/Cgk
 Bsnu0o5djTismPPoU+dVEC8OOtOQs51mMYYsJ3bpo6w+8AXjqnqHArInHHG+DyKfsdfpU2p8NqJ
 CLciuXZuNgs3KdwBmhn+8j50u4rJxhfzbl96q5Ni+ucZpmPmB8YxYQLGCUBO4LZ8SJQopvZsb/M
 1D8cTgPoL8lL1WXelX1KC3g47FDzSwwJt3+NZAP2BKjEwfdLYApjYJv1SJm1HhO2ce5DwkkZVsS
 /ROWyFqUhckAQmPUVie/ZniAhKPP5NTi+3jDxP4DWLXZqnPD/cogYNuFscfAWmwOnNkRuuWvYaP
 ji598GViXmlJqT0LLbAldcUL4DyM0ovnfcXI8abCONH0ZZVFzuPQ3PrnsyUe2LKxqoq9kV1uqCt
 wrnlxC3wix5d5II5R2Z1TpjlzSjyFuBlPhYTuEv/7Pl/umwQK+v7ZNFofeJ7Q4gFZDAw7FZIXgE
 CEW4yw0hnhFONeA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Assign 'struct pinctrl_desc' .npins member in definition to make clear
that number of pins is fixed and have less code in the probe.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/bcm/pinctrl-nsp-mux.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-nsp-mux.c b/drivers/pinctrl/bcm/pinctrl-nsp-mux.c
index eb6298507c1d1873f9d5a90ec724b36af6d4da48..9b716c0d2b9456b9e64ca1094375effefdf4817c 100644
--- a/drivers/pinctrl/bcm/pinctrl-nsp-mux.c
+++ b/drivers/pinctrl/bcm/pinctrl-nsp-mux.c
@@ -525,6 +525,7 @@ static struct pinctrl_desc nsp_pinctrl_desc = {
 	.name = "nsp-pinmux",
 	.pctlops = &nsp_pinctrl_ops,
 	.pmxops = &nsp_pinmux_ops,
+	.npins = ARRAY_SIZE(nsp_pins),
 };
 
 static int nsp_mux_log_init(struct nsp_pinctrl *pinctrl)
@@ -556,7 +557,6 @@ static int nsp_pinmux_probe(struct platform_device *pdev)
 	struct resource *res;
 	int i, ret;
 	struct pinctrl_pin_desc *pins;
-	unsigned int num_pins = ARRAY_SIZE(nsp_pins);
 
 	pinctrl = devm_kzalloc(&pdev->dev, sizeof(*pinctrl), GFP_KERNEL);
 	if (!pinctrl)
@@ -589,11 +589,12 @@ static int nsp_pinmux_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	pins = devm_kcalloc(&pdev->dev, num_pins, sizeof(*pins), GFP_KERNEL);
+	pins = devm_kcalloc(&pdev->dev, ARRAY_SIZE(nsp_pins), sizeof(*pins),
+			    GFP_KERNEL);
 	if (!pins)
 		return -ENOMEM;
 
-	for (i = 0; i < num_pins; i++) {
+	for (i = 0; i < ARRAY_SIZE(nsp_pins); i++) {
 		pins[i].number = nsp_pins[i].pin;
 		pins[i].name = nsp_pins[i].name;
 		pins[i].drv_data = &nsp_pins[i].gpio_select;
@@ -604,7 +605,6 @@ static int nsp_pinmux_probe(struct platform_device *pdev)
 	pinctrl->functions = nsp_pin_functions;
 	pinctrl->num_functions = ARRAY_SIZE(nsp_pin_functions);
 	nsp_pinctrl_desc.pins = pins;
-	nsp_pinctrl_desc.npins = num_pins;
 
 	pinctrl->pctl = devm_pinctrl_register(&pdev->dev, &nsp_pinctrl_desc,
 					 pinctrl);

-- 
2.45.2

