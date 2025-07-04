Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9CA3074A4
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 13:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751636623; cv=none; b=LOCNQb+RI+9T0u+KjQhNrnxNih257IybgE7J049XuRd5sya4ABs4lTlBMoi7aZu86VDKRACYtXz4zyZT82XFL95V4SEF7hw1nBjg5D8J1H80V5EhICnr5oYvYQ9DiW151TEbwl0ntBnW1sEsVInDOJlLQqlHJzsY9zxrDwtW6kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751636623; c=relaxed/simple;
	bh=M7tY+scmVylTrlou9Rp9FnxcpUiMlaIeTJC2gmwJ4ig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SVfdS3tOMrRrhhVkBp27GenYM1tpej2I5pf38/6OccETiPxZCExOQSZszMDqRoVc+uW6N7E1IMrXmp1aPiab9/xEKp0NVZANq6FL0jQXDU6pHVLVtNRz8D5g4BOCsm2XiCyaZbkF8mKH+/IdZb5rYHQPQVRgIXAmvy1djD+f2po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=VjnoKEd3; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="VjnoKEd3"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-605b9488c28so1557069a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 06:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1751636619; x=1752241419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ueHz0+WTuip9yv5qTqxKUgIYQhvx0qJkHFXswHPC/Qk=;
        b=VjnoKEd3Z7VIz7UoMNY8vctYNI9V61n/Bd8vbetYV26dqN0nFon2gCdlmAPTAUDSXs
         hBJpDXUxLleCpvW5CMpMM0DvdjMrNJdhsE/YzGnyeTYZ7i3NWhyI+kZqRsEIHk0nURVU
         IeR70OIPh4/jnqbQsILEqutLjGVtC18UCT1cB8iaZvrenUXitb7ct5+mnOZTENEPFpHF
         dsTYMppZnbxheg3cmo+K2vyQHr6EXozvGp/Nkld/mtHGWEsuR+XsPltK+D1bCWYfOPgu
         iQQ2RCaRAj6cWlXtdl9PbWij54oDYrLT0bAsFjwtyNyirYp/8CxZf5nTxxSIGH7nyiuo
         KO5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751636619; x=1752241419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ueHz0+WTuip9yv5qTqxKUgIYQhvx0qJkHFXswHPC/Qk=;
        b=WbpMwQDwVkHTEyIm4fQdRzYH87AgqOQBlMuL5a1AgJhJlzDqZ7kmf8rK1tnPAUfrJz
         Xgv/EzoU8IEuapswQNy9uoWo7e7hXIMTlGBvvn0qjYwdZgyeXJ1w25RAADvhJhzNNgxk
         yhFGpUwEOM+AHjy0e3epELEv8ObfsDFBeDsa2xQq9WMMKzLtULPEitXEdqfsv5kSQT0w
         7nA9gimxhcvD0T844sbubj9zoa6BEtYuFHfNimVrQ0xdeaZrdOMm343G5ZcTI9zUIwyq
         Fv1MXCWP8WWKSp+aMiv5pbaBcdh8xOlkDhp6YKK3VYcGqvnpfACvyCKNUwDjInh5sEoc
         ZIAw==
X-Forwarded-Encrypted: i=1; AJvYcCVndOS54ehQi/WbChOQwMr6Poq0xRi78b4gvn5WvcKA0TvuZuDYJZU+Yqnk7FuJ3gpjYRWcp707hLFpoSQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0mU7e8v74xsDg5KOu/0C5N6glSzIlMZwZnNxlLavJAoM1MbGb
	iyeU/oYj/yi8sMxvSpeaaXMowYYXiG3zdVZfbgoHR9lyClFxM6rJlyZqh+U6v56uWt0=
X-Gm-Gg: ASbGncsLbUVuGdpxMqfAguGeQvu0TA/kgwe9SrYVNH1gPfLiMsnCe0lNvg9HkCgU2lP
	zBij/I9RMyXhcnGyC9JZ0DRp7os0+ll3jGMA0xaypo0UZdTqDuTz2UWWJV6uXoIvP6PiMmwOs32
	bYt4yk8Ety/AF5xpzBpZ6WJchXVt7MR/YPyaL2THK2RkowguJR9wt0xwJ4eJIYoZapaCQtM9WXz
	P5hBTfa7+ZnjbrrSSldx4WgFzloa17pP34cUWpUp7g0t0drUPWeDAgSJqmLIXuiJ1Bt2VChV31o
	4pXHZf+3CBT/Bff21ZjODUQgJPygYoovdYVwl6Pvb/N+PzU49TnWnUlsfEjUdYztHso1RVPnV+w
	zwtJviPhqr2H2G+o=
X-Google-Smtp-Source: AGHT+IG+frHC97zBi8VlnWvRpDDt8ket4dUiHsOVEqjVU3iscOOkzzN7emARwsu0wRqvHnPdro6New==
X-Received: by 2002:a50:cdcd:0:b0:604:e602:779a with SMTP id 4fb4d7f45d1cf-60fd34ab440mr1809894a12.28.1751636619461;
        Fri, 04 Jul 2025 06:43:39 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.83])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fd3895ac7sm1084916a12.30.2025.07.04.06.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 06:43:38 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 3/3] clk: renesas: r9a07g043: Add MSTOP for RZ/G2UL
Date: Fri,  4 Jul 2025 16:43:28 +0300
Message-ID: <20250704134328.3614317-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704134328.3614317-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250704134328.3614317-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add MSTOP configuration for all the module clocks on the RZ/G2UL
based SoCs (RZ/G2UL, RZ/V2L, RZ/Five).

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/clk/renesas/r9a07g043-cpg.c | 130 ++++++++++++++--------------
 1 file changed, 65 insertions(+), 65 deletions(-)

diff --git a/drivers/clk/renesas/r9a07g043-cpg.c b/drivers/clk/renesas/r9a07g043-cpg.c
index 02dc5cecfd8d..29e66d99e361 100644
--- a/drivers/clk/renesas/r9a07g043-cpg.c
+++ b/drivers/clk/renesas/r9a07g043-cpg.c
@@ -164,143 +164,143 @@ static const struct cpg_core_clk r9a07g043_core_clks[] __initconst = {
 static const struct rzg2l_mod_clk r9a07g043_mod_clks[] = {
 #ifdef CONFIG_ARM64
 	DEF_MOD("gic",		R9A07G043_GIC600_GICCLK, R9A07G043_CLK_P1,
-				0x514, 0, 0),
+				0x514, 0, MSTOP(BUS_REG1, BIT(7))),
 	DEF_MOD("ia55_pclk",	R9A07G043_IA55_PCLK, R9A07G043_CLK_P2,
-				0x518, 0, 0),
+				0x518, 0, MSTOP(BUS_PERI_CPU, BIT(13))),
 	DEF_MOD("ia55_clk",	R9A07G043_IA55_CLK, R9A07G043_CLK_P1,
-				0x518, 1, 0),
+				0x518, 1, MSTOP(BUS_PERI_CPU, BIT(13))),
 #endif
 #ifdef CONFIG_RISCV
 	DEF_MOD("iax45_pclk",	R9A07G043_IAX45_PCLK, R9A07G043_CLK_P2,
-				0x518, 0, 0),
+				0x518, 0, MSTOP(BUS_PERI_CPU, BIT(13))),
 	DEF_MOD("iax45_clk",	R9A07G043_IAX45_CLK, R9A07G043_CLK_P1,
-				0x518, 1, 0),
+				0x518, 1, MSTOP(BUS_PERI_CPU, BIT(13))),
 #endif
 	DEF_MOD("dmac_aclk",	R9A07G043_DMAC_ACLK, R9A07G043_CLK_P1,
-				0x52c, 0, 0),
+				0x52c, 0, MSTOP(BUS_REG1, BIT(2))),
 	DEF_MOD("dmac_pclk",	R9A07G043_DMAC_PCLK, CLK_P1_DIV2,
-				0x52c, 1, 0),
+				0x52c, 1, MSTOP(BUS_REG1, BIT(3))),
 	DEF_MOD("ostm0_pclk",	R9A07G043_OSTM0_PCLK, R9A07G043_CLK_P0,
-				0x534, 0, 0),
+				0x534, 0, MSTOP(BUS_REG0, BIT(4))),
 	DEF_MOD("ostm1_pclk",	R9A07G043_OSTM1_PCLK, R9A07G043_CLK_P0,
-				0x534, 1, 0),
+				0x534, 1, MSTOP(BUS_REG0, BIT(5))),
 	DEF_MOD("ostm2_pclk",	R9A07G043_OSTM2_PCLK, R9A07G043_CLK_P0,
-				0x534, 2, 0),
+				0x534, 2, MSTOP(BUS_REG0, BIT(6))),
 	DEF_MOD("mtu_x_mck",	R9A07G043_MTU_X_MCK_MTU3, R9A07G043_CLK_P0,
-				0x538, 0, 0),
+				0x538, 0, MSTOP(BUS_MCPU1, BIT(2))),
 	DEF_MOD("wdt0_pclk",	R9A07G043_WDT0_PCLK, R9A07G043_CLK_P0,
-				0x548, 0, 0),
+				0x548, 0, MSTOP(BUS_REG0, BIT(2))),
 	DEF_MOD("wdt0_clk",	R9A07G043_WDT0_CLK, R9A07G043_OSCCLK,
-				0x548, 1, 0),
+				0x548, 1, MSTOP(BUS_REG0, BIT(2))),
 	DEF_MOD("spi_clk2",	R9A07G043_SPI_CLK2, R9A07G043_CLK_SPI1,
-				0x550, 0, 0),
+				0x550, 0, MSTOP(BUS_MCPU1, BIT(1))),
 	DEF_MOD("spi_clk",	R9A07G043_SPI_CLK, R9A07G043_CLK_SPI0,
-				0x550, 1, 0),
+				0x550, 1, MSTOP(BUS_MCPU1, BIT(1))),
 	DEF_MOD("sdhi0_imclk",	R9A07G043_SDHI0_IMCLK, CLK_SD0_DIV4,
-				0x554, 0, 0),
+				0x554, 0, MSTOP(BUS_PERI_COM, BIT(0))),
 	DEF_MOD("sdhi0_imclk2",	R9A07G043_SDHI0_IMCLK2, CLK_SD0_DIV4,
-				0x554, 1, 0),
+				0x554, 1, MSTOP(BUS_PERI_COM, BIT(0))),
 	DEF_MOD("sdhi0_clk_hs",	R9A07G043_SDHI0_CLK_HS, R9A07G043_CLK_SD0,
-				0x554, 2, 0),
+				0x554, 2, MSTOP(BUS_PERI_COM, BIT(0))),
 	DEF_MOD("sdhi0_aclk",	R9A07G043_SDHI0_ACLK, R9A07G043_CLK_P1,
-				0x554, 3, 0),
+				0x554, 3, MSTOP(BUS_PERI_COM, BIT(0))),
 	DEF_MOD("sdhi1_imclk",	R9A07G043_SDHI1_IMCLK, CLK_SD1_DIV4,
-				0x554, 4, 0),
+				0x554, 4, MSTOP(BUS_PERI_COM, BIT(1))),
 	DEF_MOD("sdhi1_imclk2",	R9A07G043_SDHI1_IMCLK2, CLK_SD1_DIV4,
-				0x554, 5, 0),
+				0x554, 5, MSTOP(BUS_PERI_COM, BIT(1))),
 	DEF_MOD("sdhi1_clk_hs",	R9A07G043_SDHI1_CLK_HS, R9A07G043_CLK_SD1,
-				0x554, 6, 0),
+				0x554, 6, MSTOP(BUS_PERI_COM, BIT(1))),
 	DEF_MOD("sdhi1_aclk",	R9A07G043_SDHI1_ACLK, R9A07G043_CLK_P1,
-				0x554, 7, 0),
+				0x554, 7, MSTOP(BUS_PERI_COM, BIT(1))),
 #ifdef CONFIG_ARM64
 	DEF_MOD("cru_sysclk",   R9A07G043_CRU_SYSCLK, CLK_M2_DIV2,
-				0x564, 0, 0),
+				0x564, 0, MSTOP(BUS_PERI_VIDEO, BIT(3))),
 	DEF_MOD("cru_vclk",     R9A07G043_CRU_VCLK, R9A07G043_CLK_M2,
-				0x564, 1, 0),
+				0x564, 1, MSTOP(BUS_PERI_VIDEO, BIT(3))),
 	DEF_MOD("cru_pclk",     R9A07G043_CRU_PCLK, R9A07G043_CLK_ZT,
-				0x564, 2, 0),
+				0x564, 2, MSTOP(BUS_PERI_VIDEO, BIT(3))),
 	DEF_MOD("cru_aclk",     R9A07G043_CRU_ACLK, R9A07G043_CLK_M0,
-				0x564, 3, 0),
+				0x564, 3, MSTOP(BUS_PERI_VIDEO, BIT(3))),
 	DEF_COUPLED("lcdc_clk_a", R9A07G043_LCDC_CLK_A, R9A07G043_CLK_M0,
-				0x56c, 0, 0),
+				0x56c, 0, MSTOP(BUS_PERI_VIDEO, GENMASK(8, 7))),
 	DEF_COUPLED("lcdc_clk_p", R9A07G043_LCDC_CLK_P, R9A07G043_CLK_ZT,
-				0x56c, 0, 0),
+				0x56c, 0, MSTOP(BUS_PERI_VIDEO, GENMASK(8, 7))),
 	DEF_MOD("lcdc_clk_d",	R9A07G043_LCDC_CLK_D, R9A07G043_CLK_M3,
-				0x56c, 1, 0),
+				0x56c, 1, MSTOP(BUS_PERI_VIDEO, BIT(9))),
 #endif
 	DEF_MOD("ssi0_pclk",	R9A07G043_SSI0_PCLK2, R9A07G043_CLK_P0,
-				0x570, 0, 0),
+				0x570, 0, MSTOP(BUS_MCPU1, BIT(10))),
 	DEF_MOD("ssi0_sfr",	R9A07G043_SSI0_PCLK_SFR, R9A07G043_CLK_P0,
-				0x570, 1, 0),
+				0x570, 1, MSTOP(BUS_MCPU1, BIT(10))),
 	DEF_MOD("ssi1_pclk",	R9A07G043_SSI1_PCLK2, R9A07G043_CLK_P0,
-				0x570, 2, 0),
+				0x570, 2, MSTOP(BUS_MCPU1, BIT(11))),
 	DEF_MOD("ssi1_sfr",	R9A07G043_SSI1_PCLK_SFR, R9A07G043_CLK_P0,
-				0x570, 3, 0),
+				0x570, 3, MSTOP(BUS_MCPU1, BIT(11))),
 	DEF_MOD("ssi2_pclk",	R9A07G043_SSI2_PCLK2, R9A07G043_CLK_P0,
-				0x570, 4, 0),
+				0x570, 4, MSTOP(BUS_MCPU1, BIT(12))),
 	DEF_MOD("ssi2_sfr",	R9A07G043_SSI2_PCLK_SFR, R9A07G043_CLK_P0,
-				0x570, 5, 0),
+				0x570, 5, MSTOP(BUS_MCPU1, BIT(12))),
 	DEF_MOD("ssi3_pclk",	R9A07G043_SSI3_PCLK2, R9A07G043_CLK_P0,
-				0x570, 6, 0),
+				0x570, 6, MSTOP(BUS_MCPU1, BIT(13))),
 	DEF_MOD("ssi3_sfr",	R9A07G043_SSI3_PCLK_SFR, R9A07G043_CLK_P0,
-				0x570, 7, 0),
+				0x570, 7, MSTOP(BUS_MCPU1, BIT(13))),
 	DEF_MOD("usb0_host",	R9A07G043_USB_U2H0_HCLK, R9A07G043_CLK_P1,
-				0x578, 0, 0),
+				0x578, 0, MSTOP(BUS_PERI_COM, BIT(5))),
 	DEF_MOD("usb1_host",	R9A07G043_USB_U2H1_HCLK, R9A07G043_CLK_P1,
-				0x578, 1, 0),
+				0x578, 1, MSTOP(BUS_PERI_COM, BIT(7))),
 	DEF_MOD("usb0_func",	R9A07G043_USB_U2P_EXR_CPUCLK, R9A07G043_CLK_P1,
-				0x578, 2, 0),
+				0x578, 2, MSTOP(BUS_PERI_COM, BIT(6))),
 	DEF_MOD("usb_pclk",	R9A07G043_USB_PCLK, R9A07G043_CLK_P1,
-				0x578, 3, 0),
+				0x578, 3, MSTOP(BUS_PERI_COM, BIT(4))),
 	DEF_COUPLED("eth0_axi",	R9A07G043_ETH0_CLK_AXI, R9A07G043_CLK_M0,
-				0x57c, 0, 0),
+				0x57c, 0, MSTOP(BUS_PERI_COM, BIT(2))),
 	DEF_COUPLED("eth0_chi",	R9A07G043_ETH0_CLK_CHI, R9A07G043_CLK_ZT,
-				0x57c, 0, 0),
+				0x57c, 0, MSTOP(BUS_PERI_COM, BIT(2))),
 	DEF_COUPLED("eth1_axi",	R9A07G043_ETH1_CLK_AXI, R9A07G043_CLK_M0,
-				0x57c, 1, 0),
+				0x57c, 1, MSTOP(BUS_PERI_COM, BIT(3))),
 	DEF_COUPLED("eth1_chi",	R9A07G043_ETH1_CLK_CHI, R9A07G043_CLK_ZT,
-				0x57c, 1, 0),
+				0x57c, 1, MSTOP(BUS_PERI_COM, BIT(3))),
 	DEF_MOD("i2c0",		R9A07G043_I2C0_PCLK, R9A07G043_CLK_P0,
-				0x580, 0, 0),
+				0x580, 0, MSTOP(BUS_MCPU2, BIT(10))),
 	DEF_MOD("i2c1",		R9A07G043_I2C1_PCLK, R9A07G043_CLK_P0,
-				0x580, 1, 0),
+				0x580, 1, MSTOP(BUS_MCPU2, BIT(11))),
 	DEF_MOD("i2c2",		R9A07G043_I2C2_PCLK, R9A07G043_CLK_P0,
-				0x580, 2, 0),
+				0x580, 2, MSTOP(BUS_MCPU2, BIT(12))),
 	DEF_MOD("i2c3",		R9A07G043_I2C3_PCLK, R9A07G043_CLK_P0,
-				0x580, 3, 0),
+				0x580, 3, MSTOP(BUS_MCPU2, BIT(13))),
 	DEF_MOD("scif0",	R9A07G043_SCIF0_CLK_PCK, R9A07G043_CLK_P0,
-				0x584, 0, 0),
+				0x584, 0, MSTOP(BUS_MCPU2, BIT(1))),
 	DEF_MOD("scif1",	R9A07G043_SCIF1_CLK_PCK, R9A07G043_CLK_P0,
-				0x584, 1, 0),
+				0x584, 1, MSTOP(BUS_MCPU2, BIT(2))),
 	DEF_MOD("scif2",	R9A07G043_SCIF2_CLK_PCK, R9A07G043_CLK_P0,
-				0x584, 2, 0),
+				0x584, 2, MSTOP(BUS_MCPU2, BIT(3))),
 	DEF_MOD("scif3",	R9A07G043_SCIF3_CLK_PCK, R9A07G043_CLK_P0,
-				0x584, 3, 0),
+				0x584, 3, MSTOP(BUS_MCPU2, BIT(4))),
 	DEF_MOD("scif4",	R9A07G043_SCIF4_CLK_PCK, R9A07G043_CLK_P0,
-				0x584, 4, 0),
+				0x584, 4, MSTOP(BUS_MCPU2, BIT(5))),
 	DEF_MOD("sci0",		R9A07G043_SCI0_CLKP, R9A07G043_CLK_P0,
-				0x588, 0, 0),
+				0x588, 0, MSTOP(BUS_MCPU2, BIT(7))),
 	DEF_MOD("sci1",		R9A07G043_SCI1_CLKP, R9A07G043_CLK_P0,
-				0x588, 1, 0),
+				0x588, 1, MSTOP(BUS_MCPU2, BIT(8))),
 	DEF_MOD("rspi0",	R9A07G043_RSPI0_CLKB, R9A07G043_CLK_P0,
-				0x590, 0, 0),
+				0x590, 0, MSTOP(BUS_MCPU1, BIT(14))),
 	DEF_MOD("rspi1",	R9A07G043_RSPI1_CLKB, R9A07G043_CLK_P0,
-				0x590, 1, 0),
+				0x590, 1, MSTOP(BUS_MCPU1, BIT(15))),
 	DEF_MOD("rspi2",	R9A07G043_RSPI2_CLKB, R9A07G043_CLK_P0,
-				0x590, 2, 0),
+				0x590, 2, MSTOP(BUS_MCPU2, BIT(0))),
 	DEF_MOD("canfd",	R9A07G043_CANFD_PCLK, R9A07G043_CLK_P0,
-				0x594, 0, 0),
+				0x594, 0, MSTOP(BUS_MCPU2, BIT(9))),
 	DEF_MOD("gpio",		R9A07G043_GPIO_HCLK, R9A07G043_OSCCLK,
 				0x598, 0, 0),
 	DEF_MOD("adc_adclk",	R9A07G043_ADC_ADCLK, R9A07G043_CLK_TSU,
-				0x5a8, 0, 0),
+				0x5a8, 0, MSTOP(BUS_MCPU2, BIT(14))),
 	DEF_MOD("adc_pclk",	R9A07G043_ADC_PCLK, R9A07G043_CLK_P0,
-				0x5a8, 1, 0),
+				0x5a8, 1, MSTOP(BUS_MCPU2, BIT(14))),
 	DEF_MOD("tsu_pclk",	R9A07G043_TSU_PCLK, R9A07G043_CLK_TSU,
-				0x5ac, 0, 0),
+				0x5ac, 0, MSTOP(BUS_MCPU2, BIT(15))),
 #ifdef CONFIG_RISCV
 	DEF_MOD("nceplic_aclk",	R9A07G043_NCEPLIC_ACLK, R9A07G043_CLK_P1,
-				0x608, 0, 0),
+				0x608, 0, MSTOP(BUS_REG1, BIT(7))),
 #endif
 };
 
-- 
2.43.0

