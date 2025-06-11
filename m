Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7024227E92
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 06:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749622478; cv=none; b=llobBe296HWpas5aEelItwKAu8iCJpTyg6vdlLxjiX5Xl61L+mfyoLvGbGg8F43f/EWdBQtBnzwKoSK2K8FzJ8JDWAT5P98s+xAcfB5C9v8ER/0Iki5IWWEqiYI7lyOJ+gbZTbC2a+4rS+enSia23xLIzmkPVhYTRTOTq73EJvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749622478; c=relaxed/simple;
	bh=HD2ybe35U69JMcN2LPl+PuBZpABAAgcl4909AF32gW8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qAykCUUjnQq6UAm9JEgrZkig2RtxsCuX81ZAhDfluSPUOq8ELKmVqgc9NzAbVJinTAuji4EXgGy11LSxfg4DtY+YamtRzwBgHzko2vAJb+0/Ci/TDIQDBhuzT7G8QBKJ56jN2xhvXq+h/W6uIEIIgP4vqRGFy7uztbTuHf22sQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aSTqdhgc; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aSTqdhgc"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a4eb4acf29so27467f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 23:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749622475; x=1750227275; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XnLFUD39k75RvyOsvSUpokGQQJJEnSjbraGrbRyjjYo=;
        b=aSTqdhgcoJ8k+BpaLRXELT4bZBQiDh3nqHs6Ja0U82wqRUtypWhreCuj7B95GQlJ4E
         sVKOUsYVWyQ+maYEnShQ2Q+XE3dFteTIt1TXhqSyjnzobbqdhtjl3VPM7lHx2QC8abiP
         Ozbtt7xN/A7UGnjx34wPsYNHBdhwBWEP85O1sJTpfviA6k7qzKzKMawqH4hpi5iTPm3b
         ng4pSPXUqU5O6xUJmYsnLhUSm8UL6fj5ccftWcQsWZEmY4kHH74+92+H3Ja2ukjDWY3J
         rVEgmVWRY0IA0bWmra5XbN1Om4wBHpPYU8K6eQORsCsU6vf2XkY1cL1j1ChepOXw7OdO
         u6AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749622475; x=1750227275;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XnLFUD39k75RvyOsvSUpokGQQJJEnSjbraGrbRyjjYo=;
        b=CYi3yNjI/6S6k0Cg82TV3NSX8OasIf03HdfIQmWoSsLxxGBSV1kUUwecYYVQhwDPLp
         b/JhD2y84lsRr4QUD3uADbT+jECt8QJjoQ3rcNm8y1X243smorpNWRDtfuglYeMAkQh2
         QMxSvqXCxU72Be1fC4YIrPBR/b4A6Q5THNuTIeNP4zOFdnQf24b61QIuuNcQMCMUbUmX
         y2G7b1PFqf940WaaUVAP2aK8i/P6YC3fQ2OWpyCRhv1sJ1CtF8GmZYYyZkemG5FY+AzS
         QSj+e7cX6/pwDjrp08ODzb7FtVH/nEdXxArAaL9MajN2ESN5hPSHCqoKzhFmTF80Olq6
         7zNA==
X-Forwarded-Encrypted: i=1; AJvYcCVFIpeJ9guILhaCuXg2eyuepOwsP8yk8V/+K/ooafw6XvwQLLVyhwTJOobdLAdqjcSg3zrnwiJszC3a4EI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyho/I7SQFCK9ouHqoFF3jPeYKqbtBsk8Co78FVPUQTjdnBYjmZ
	uScgbbGq5CzSrAByJ6/EwAEUqugDuU+GhcYXvY2PvXKxzSqFhFhcA9O2O4EO3lgF6pU=
X-Gm-Gg: ASbGncv9D0oUvQoR4t47t5iR40ncsSgGtqKvMs2ooJ/c5qcf9e4t4vqpN4v8H9Fytxi
	u3R3/e5P3UDsPvP2SE8zx+Z6gmsq22koGAB70p6KQ7G7H1aJyWEjZHC8N1zt3+yPIj82iKDvBK1
	KibLuQnlXfZXob3QvpFhWzOkQvZofFe2e1b3cQbG1C7JgatjlX0oeq4xnRxsNXvySlVSuKB6iJ0
	ZfFmXF9ueH09Urka5My2W71Do20NWvQ8Bo3ZK6GNAwOcUXP+jyUYX+HL4LhDtov+7DWPecXC+qW
	751SLbUDN/mLU33942uTa9Lp/XjFxGYJkIsErOn5d9ab5Pkb8vxn/hN2Ka2vMao9KGyaFC94bMh
	PLUsbVtYx2KcrvVjyuw==
X-Google-Smtp-Source: AGHT+IGoxFPnKSOuXs5+P+w12UCxO7i6IYKkquyOTs50YDw16EatHwFgkdZHgJxhBLiIsXS+NYIhbQ==
X-Received: by 2002:a05:6000:2507:b0:3a4:f7d9:9617 with SMTP id ffacd0b85a97d-3a55864e245mr501034f8f.0.1749622475009;
        Tue, 10 Jun 2025 23:14:35 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f516sm14142791f8f.74.2025.06.10.23.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:14:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 11 Jun 2025 08:13:39 +0200
Subject: [PATCH v2 07/17] pinctrl: bcm: Constify static 'pinctrl_desc'
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-pinctrl-const-desc-v2-7-b11c1d650384@linaro.org>
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
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1559;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=HD2ybe35U69JMcN2LPl+PuBZpABAAgcl4909AF32gW8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSR6k2VlhnFI+XkL8KeRAOaTjFqEm1OVlmncWS
 rPXhB+tl7qJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEkepAAKCRDBN2bmhouD
 16DFD/0SKqg2JC8W86kMSCJYitbKb6yqfOLns9qNtePf4wdTGlJeDaoc3YKlMDnvNZ+pOyKNe79
 ZvEAFS8hVTNcrOUlY6yoViXS+fdnvUzZRSKrhwnbFhGYdGsk4U0RI3BVQUJLJ1r1tpUniY8JPpa
 F4B8J8VlmdcwPlmxwdxKok+jE4TmbO/R8F5+2zqopNLDST0OktDaB8zVfMI3hU6EPMg/s5oPyzW
 qRhTjQ8G36rZRsT213YTjHbevOB7qDNNaqOZz+3/QfKuSsefkxdkJYIE8K5DvIB8z/dnd488oST
 wdobH5rJp0reL06Fu09kW3MCHDQoeBLfqNkbPm3QQdg/tWrON6ZB6PG4XcLA+QjKHWwuP0n5Vjz
 h1guP+Qfja/he/U/Be3awTAfepm1GoPL4rvF5XUdl8DblNAk7dpSyv8kLbvdYWn9ECWWgn7Kizr
 CI2vBrL/FLxPgPfqBCgAooN3zOV5IZzvcbEHxkd6hbCWAedVfM3YyCE9PI5iOok4s+hA9iqR7v+
 LoV9gliP0O/k6QKsu7CkMWOGtB/SDySHFkkxvMSsArd155YXJubuzfpRmLRD+9zGymyt3rbWxSS
 YvBomqxCg5/kd7H6bxQXfQVlWr4GCJLRsUvSB3kx9X6uRXHHY9dMK29lOnz1htG7rmxKXBGOWp+
 apN0cq+tr8+M+1w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

The local static 'struct pinctrl_desc' is not modified, so can be made
const for code safety.

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/bcm/pinctrl-bcm4908.c | 2 +-
 drivers/pinctrl/bcm/pinctrl-ns.c      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm4908.c b/drivers/pinctrl/bcm/pinctrl-bcm4908.c
index f190e0997f1fa9fe8bf07fc3ae5700bc721e1651..12f7a253ea4d5bd0af5dbabc320fc2df32172e4f 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm4908.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm4908.c
@@ -456,7 +456,7 @@ static const struct pinmux_ops bcm4908_pinctrl_pmxops = {
  * Controller code
  */
 
-static struct pinctrl_desc bcm4908_pinctrl_desc = {
+static const struct pinctrl_desc bcm4908_pinctrl_desc = {
 	.name = "bcm4908-pinctrl",
 	.pctlops = &bcm4908_pinctrl_ops,
 	.pmxops = &bcm4908_pinctrl_pmxops,
diff --git a/drivers/pinctrl/bcm/pinctrl-ns.c b/drivers/pinctrl/bcm/pinctrl-ns.c
index 6bb2b461950bef5c420f1b250d48fcf6e907b98f..03bd01b4a945adf72445576a8a111f3c0637e095 100644
--- a/drivers/pinctrl/bcm/pinctrl-ns.c
+++ b/drivers/pinctrl/bcm/pinctrl-ns.c
@@ -192,7 +192,7 @@ static const struct pinmux_ops ns_pinctrl_pmxops = {
  * Controller code
  */
 
-static struct pinctrl_desc ns_pinctrl_desc = {
+static const struct pinctrl_desc ns_pinctrl_desc = {
 	.name = "pinctrl-ns",
 	.pctlops = &ns_pinctrl_ops,
 	.pmxops = &ns_pinctrl_pmxops,

-- 
2.45.2

