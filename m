Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8171C3F02;
	Mon, 10 Feb 2025 08:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739177417; cv=none; b=JGxwKfKKD2ZKb7ptfsc/og2xZdklYqGKNGxUiyvDe7vqPd6Vjcu+trG+HXY3sqVbRgaJNt/hvYUdt5BbLA30mbWX4jUCAWM+m24Ba8M0wVorT5telJsy19izQoJvFhwasll6ppjI6YG9SBqT7U/EVF9OpsvCMpmur68897PhL3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739177417; c=relaxed/simple;
	bh=te/tt+fLtUJmOx+wv0yYcEBUvxvlfidQnbSFEuEQpsc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eZHw62GkIuS+xcLRcjsOw2RMK/7Yk4zYeUPjd/uWv4fVfQtbXZNSwNjkOhR4XLifCz0PJ/MmNnCtiFLHJxTvbc3tTuxqqtbgB1amz3k4df2uAP2y9q1O7OO2Shbi2hgTgzr1UUm9HgNRmFoSUZbh5OS154kPipCPfaGPKqr0Jy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 10 Feb
 2025 16:50:04 +0800
Received: from twmbx02.aspeed.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 10 Feb 2025 16:50:04 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: ryan_chen <ryan_chen@aspeedtech.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@aj.id.au>, <linux-clk@vger.kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v8 1/3] dt-binding: clock: ast2700: modify soc0/1 clock define
Date: Mon, 10 Feb 2025 16:50:02 +0800
Message-ID: <20250210085004.1898895-2-ryan_chen@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250210085004.1898895-1-ryan_chen@aspeedtech.com>
References: <20250210085004.1898895-1-ryan_chen@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

remove soc0 clock:
 SOC0_CLK_UART_DIV13
 SOC0_CLK_HPLL_DIV_AHB
 SOC0_CLK_MPLL_DIV_AHB
add soc0 clock:
 SOC0_CLK_AHBMUX
 SOC0_CLK_MPHYSRC
 SOC0_CLK_U2PHY_REFCLKSRC
add soc1 clock:
 SOC1_CLK_I3C

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 include/dt-bindings/clock/aspeed,ast2700-scu.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/include/dt-bindings/clock/aspeed,ast2700-scu.h b/include/dt-bindings/clock/aspeed,ast2700-scu.h
index 63021af3caf5..c7389530629d 100644
--- a/include/dt-bindings/clock/aspeed,ast2700-scu.h
+++ b/include/dt-bindings/clock/aspeed,ast2700-scu.h
@@ -13,18 +13,17 @@
 #define SCU0_CLK_24M		1
 #define SCU0_CLK_192M		2
 #define SCU0_CLK_UART		3
-#define SCU0_CLK_UART_DIV13	3
 #define SCU0_CLK_PSP		4
 #define SCU0_CLK_HPLL		5
 #define SCU0_CLK_HPLL_DIV2	6
 #define SCU0_CLK_HPLL_DIV4	7
-#define SCU0_CLK_HPLL_DIV_AHB	8
+#define SCU0_CLK_AHBMUX		8
 #define SCU0_CLK_DPLL		9
 #define SCU0_CLK_MPLL		10
 #define SCU0_CLK_MPLL_DIV2	11
 #define SCU0_CLK_MPLL_DIV4	12
 #define SCU0_CLK_MPLL_DIV8	13
-#define SCU0_CLK_MPLL_DIV_AHB	14
+#define SCU0_CLK_MPHYSRC	14
 #define SCU0_CLK_D0		15
 #define SCU0_CLK_D1		16
 #define SCU0_CLK_CRT0		17
@@ -68,6 +67,7 @@
 #define SCU0_CLK_GATE_UFSCLK	53
 #define SCU0_CLK_GATE_EMMCCLK	54
 #define SCU0_CLK_GATE_RVAS1CLK	55
+#define SCU0_CLK_U2PHY_REFCLKSRC 56
 
 /* SOC1 clk */
 #define SCU1_CLKIN		0
@@ -160,4 +160,5 @@
 #define SCU1_CLK_GATE_PORTDUSB2CLK	85
 #define SCU1_CLK_GATE_LTPI1TXCLK	86
 
+#define SCU1_CLK_I3C	87
 #endif
-- 
2.34.1

