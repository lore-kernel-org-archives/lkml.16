Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B944021ADAB
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 09:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746003725; cv=none; b=clwa2tO1+Y3jTwwmNzBVIYGFDJ6J1NF6oy4656Xfj7RL8j4FvPG1cxRZBq35qzGXwGwa4dD1PDCO26yBgJQDmd0AqydaBmA+SZ9uFlsEvemIKIivjEJpMbuU7praoT2xs/DajgHofAR5MRlYPpf/8CdKO5l61gkbBdnltvw3Elc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746003725; c=relaxed/simple;
	bh=L7m7/oDOVyLCTBoHwxcpvzWEPQ5God4FzUVY+/hwE20=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=N18P2wwOPctsPz+JWkQ3FQ0IOLM3quSR31uGfz1SRnQ7+I7JaIfMmf72o6wuBCHNFWnDOMCYquMtXjmpNLQaLqZPUa3jm+WoNOVnVu2Gd8kwoiBMgfOSN3woSehj4MBKGA2Z97tYg6UnxrlIzB6KCe0cajDE131E/8Eil0zJ8zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1uA3K3-00036b-RX; Wed, 30 Apr 2025 11:01:43 +0200
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1uA3K3-000OlJ-1Y;
	Wed, 30 Apr 2025 11:01:43 +0200
Received: from localhost ([::1] helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1uA3K3-00E1q2-1F;
	Wed, 30 Apr 2025 11:01:43 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH v4 0/3] clk: add support for TI CDCE6214
Date: Wed, 30 Apr 2025 11:01:33 +0200
Message-Id: <20250430-clk-cdce6214-v4-0-9f15e7126ac6@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO3mEWgC/3XMQQ6CMBCF4auQrq2ZTgsFV97DuIB2qo0GSEGCI
 dzdwoqgLv+XvG9iHQVPHTslEws0+M43dQx1SJi5l/WNuLexGQKmoCDn5vngxhrKUCgORitQ0hr
 MNIuXNpDz48pdrrHvvuub8F71QSzrH2gQHHhlFWkosCyEO7dU3159aGo/Hi2xRRtwKxQ7AaOgo
 MK00ohkqp+C3AgCdoKMgtXSuMI5aXP4EuZ5/gACoD8MMQEAAA==
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, 
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>, 
 Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746003703; l=2340;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=L7m7/oDOVyLCTBoHwxcpvzWEPQ5God4FzUVY+/hwE20=;
 b=bgdEW5W5Ln/+GzTpAi73T021/b4KxvzNBza+YfQ0zZUa9FbpFmSWQ+HDyom7uRyTHsbXv1+lP
 hi20JrJ0DE3BcwblgEbzmtHvbCcJIItJRvyoxSmm0PS9ec4BM7WqmoF
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: s.hauer@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

The CDCE6214 is a Ultra-Low Power Clock Generator With One PLL, Four
Differential Outputs, Two Inputs, and Internal EEPROM.

This series adds a common clk framework driver for this chip along with
the dt-bindings document and a small fix needed for the common clk
framework.

Sascha

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
Changes in v4:
- add missing '>' modifier in include/dt-bindings/clock/ti,cdce6214.h
- fix clocks maxItems should be 2
- add missing license in include/dt-bindings/clock/ti,cdce6214.h
- Fix checkpatch issues
- Link to v3: https://lore.kernel.org/r/20250410-clk-cdce6214-v3-0-d73cf9ff3d80@pengutronix.de

Changes in v3:
- Use string properties instead of int for enums
- Use units from property-units in dtschema
- Link to v2: https://lore.kernel.org/r/20250409-clk-cdce6214-v2-0-40b25b722ecb@pengutronix.de

Changes in v2:
- Use consistent quotes in binding document
- make clock-names an enum to make each clock fully optional
- drop '|' in binding description where not needed
- encode clock input mode into integer
- encode clock output mode into integer
- do not use defines for reg properties
- support setting load capacity for the oscillator via device tree
- support setting Bias current for the oscillator via device tree
- support setting polarities of CMOS outputs via device tree
- fix compatible string in driver
- remove unused struct cdce6214_config
- Link to v1: https://lore.kernel.org/r/20250408-clk-cdce6214-v1-0-bd4e7092a91f@pengutronix.de

---
Sascha Hauer (3):
      clk: make determine_rate optional for non reparenting clocks
      dt-bindings: clock: add TI CDCE6214 binding
      clk: add TI CDCE6214 clock driver

 .../devicetree/bindings/clock/ti,cdce6214.yaml     |  155 +++
 drivers/clk/Kconfig                                |    7 +
 drivers/clk/Makefile                               |    1 +
 drivers/clk/clk-cdce6214.c                         | 1310 ++++++++++++++++++++
 drivers/clk/clk.c                                  |    3 +-
 include/dt-bindings/clock/ti,cdce6214.h            |   25 +
 6 files changed, 1500 insertions(+), 1 deletion(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250408-clk-cdce6214-0c74043dc267

Best regards,
-- 
Sascha Hauer <s.hauer@pengutronix.de>

