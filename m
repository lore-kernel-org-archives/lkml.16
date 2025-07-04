Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9532E0920
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 16:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751645696; cv=none; b=iGAZ9lo1uXtcaVMbhQxrZxcoId575Zb9SlHFfCNS/177i4ecEu39grMm5BDx6q8yLFMy7Hm3FXG4RUqcHfSg1B0cgHL8f0CbOqiFGA649+kdsy+g34FmHHGyfIs/ytTZaKnQ2QuZmqPKrpmEfesWvaXDCCzLbzun/DzI2wUoVhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751645696; c=relaxed/simple;
	bh=BH1aKcd76IaUZZ/ToYr9eDZkVxa6rxOK7GvAzGHVDi4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aIjW6JTws+8WlxRVLoGSNyCt5r6pyo9AflOXFyUedxmF8jw1r94bM6uZFHK1aUWo6Q/2pUk02suY+llHquV+D+hfEfCdI8/gAKZSe3YmuGBRJ6NRzvcNnj1WmG+YtNC9jx02uUaNupNU/RxgpVMLa8n/ouPi1ZP13eJzfRjI3d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=BSCbg6+e; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="BSCbg6+e"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ae361e8ec32so244604366b.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 09:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1751645693; x=1752250493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJ/8zy8l4B85cHtddHm5bMRDVmAGhs389YDqHOJWbP8=;
        b=BSCbg6+eqWxsdM+U4V+a2msCtN9paviA8SqT1mQaT4m+JjPTt/qE6lzwqKeRrxFQbW
         6/WpbORYsVosT4sAg1E3xuUgAHt8JD4ZiKTkoIOPFNEb6VVX5aIOOXZ3p6MeXqbTXNGs
         DApTUTlwAEdFF6mEDQRMOFHHl6Da/4uPOfPYofeZDLvri0GYWXXzvOuFyNMKzq9zpfiK
         x8iZ8bqRH8YWa3Ze5MxGT+46IGjwIIY1jQcb1W8CHAJIN2TNlwbaM/6LOZf7U54wGaKC
         n0zdwpEQ1Ax9WdQtH8dCw9Nwfg+ZI9xBASWVofuaAXNqARrLnrR+6aL/TsEb4x6gF1jv
         DubQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751645693; x=1752250493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YJ/8zy8l4B85cHtddHm5bMRDVmAGhs389YDqHOJWbP8=;
        b=QbBo/CJ96LS2MLLOZI8BX/GtKYaJ4fRC1f7bYdWmHD1A87ybLQYNU+E5JR9GIYWsOT
         Ng4u8QK5mrZ27oZxb4Mpaq7oVOOcljnKgcOPzrdVwSO3lPhJeuJvxQugVc/JsB8Oirlz
         BI9eTO/IdOC7qZep5BHzBO2CE+2P08c6mQGV5knMO78hJe/dxeZcHJLKZbRKeOE5yZHF
         jx5jnVjOKK9/eLG0lKbZz6re7MK/vzmGXMnGeVGLvuaXmw34O+9ApEfQx5iUbkHAYYbY
         kVyRJ+IZiCfVI/I9mhzyitDA6a9bIolPH3qBsvZvsojbBIv1+MOk7JdTLuoEO+EfGrGy
         fxlw==
X-Forwarded-Encrypted: i=1; AJvYcCVFZgjg68U5qauY1ml7/wkTnFX5DNiM1BaN9lVxKrDTXkv0dOCp0My/9z3wdsZen0/7xqsrDRy9mugGhcE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeQh1PKTMLI1DgGiFLkG6v4uiWH+G8ceLhScoy2YRLoj8znQy8
	u+jHQf1m+oIe5bp7g+fKP1OOsqQ5ORcNFULXBzqIwLn22x8PGv1CX8STsXlSW06i3fE=
X-Gm-Gg: ASbGncuUEOGtvM8j/QK/ZmesnhSIPcPJltrHZ7RwiTQ0x476zKoqv11xjJVISaLXijv
	w828LojIq+17Th96N/oro4dhKBiJInI6Kgs/hGqke0EAFCI4HCDFhMUpCHkNgwt/2Xk9iYJxD7s
	voFFFL79D8GvnxttxLIktqKfbQNMCLZGj0mq2dlDoSEIpCwQZqIYdzLtbq0TpsXaYq2W3W6rS4R
	DhA8fSPCQ2dTrMjVSnFQab85izyKjwXntYg6a+oZeKE9ZODzipIE+oi+vtaWlYpO0ibNgUiUpiJ
	BExFWa+dGJjLe4DXBUWnu6dU89gTD2cP/ImGcOMBUNOdxjrWOCkZ9hE7ej+RSpbV/xQui3QDXay
	tYwb2F6uEHHhTC3E=
X-Google-Smtp-Source: AGHT+IGDhz0qhVTw0+Jv8lS4jO8NKu6i+6S1WnDonE3OKo10n+XAusMMQdVW5VodGZ41K5WwIdd9Lg==
X-Received: by 2002:a17:907:72c2:b0:ae3:bd92:e69b with SMTP id a640c23a62f3a-ae3fbc4c2a9mr336020266b.7.1751645693200;
        Fri, 04 Jul 2025 09:14:53 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.83])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d9215sm194703766b.2.2025.07.04.09.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 09:14:52 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	lizhi.hou@amd.com
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v3 9/9] arm64: defconfig: Enable PCIe for the Renesas RZ/G3S SoC
Date: Fri,  4 Jul 2025 19:14:09 +0300
Message-ID: <20250704161410.3931884-10-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704161410.3931884-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250704161410.3931884-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable PCIe for the Renesas RZ/G3S SoC.

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- collected tags

Changes in v2:
- none

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 739b19302865..b3533ba5be7e 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -227,6 +227,7 @@ CONFIG_PCIE_MEDIATEK_GEN3=m
 CONFIG_PCI_TEGRA=y
 CONFIG_PCIE_RCAR_HOST=y
 CONFIG_PCIE_RCAR_EP=y
+CONFIG_PCIE_RENESAS_RZG3S_HOST=m
 CONFIG_PCIE_ROCKCHIP_HOST=m
 CONFIG_PCI_XGENE=y
 CONFIG_PCI_IMX6_HOST=y
-- 
2.43.0

