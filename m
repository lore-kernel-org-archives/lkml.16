Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BAD236445;
	Wed, 30 Apr 2025 09:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746006127; cv=none; b=t6Q87VgTZvGpJmVZhSyloG0yMzsIlUijn4NtfHpPX7m06Oj706PZYvOChOZ3XmOvIEvilKgOYJcCK2MDHwLGqs7QN2whXaJU/Uvuw6QEeekBKJ3E9R+GAUVHDz+bQRIVU0K8rl4gik1oMgS4pyG0k7XQwkAtxacLWBCXL2/wmWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746006127; c=relaxed/simple;
	bh=pJbxGcz29I8juMZ+j5FeolmzTLNPWS2iU+EiN+lbjCo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pdJ+1MBlwJpUiLz16bBaMr1PD732vjkjn3kn2NFTeg6l6wvO1IxFmfNxB4pmV9nS+eAW+Kiuqp8YVsmOwx3eny9GmLq5GwranO0SpnS6Q311hhh1+BAPobtyYSJAe6mwEr1lMXmvC7Zr/AdH1Eqank5b/tDU4JKSUFWG3G4xvQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=jY81Mv2I; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="jY81Mv2I"
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 7F14A1F918;
	Wed, 30 Apr 2025 11:42:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1746006122;
	bh=67GVbn8v+Aat7A9f88pD3XUMhZlnrRNaXl+Zw0hEn0w=; h=From:To:Subject;
	b=jY81Mv2Izus9srgofcJ+JLTlzd+7JoWzKRLELU5z+EvosNVFGAxtml3gpXO3LtdyO
	 YLNM1PrINC1JAc5+BWagf25NeR8P4VJVtIdtUsDV7D4+oLZOlKpW4QzV1Ljh5ZfmFm
	 pwu6+n9VMYNFBWG4kssm2fdYVJvzyVoOPZe4IaJetduMgHwu/gPsNkND3RaLQZl91e
	 /bju1Q/jOSTvaI0RMTaF4Nkq6iQPUsE1dUKWjC2+6pnK9ukHx5xhKgTr7WAP2lVXO4
	 0wN14IVef8lHEUL89USAbHom0vx6RIcK3CgSwYahW0bzg4ylnSbOgYQG9vuSbwjohd
	 cQGFIEaz7NsVg==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v2 5/5] arm64: defconfig: Add Toradex Embedded Controller config
Date: Wed, 30 Apr 2025 11:41:51 +0200
Message-Id: <20250430094151.98079-6-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250430094151.98079-1-francesco@dolcini.it>
References: <20250430094151.98079-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Enable config for Toradex SMARC Embedded Controller, this is required
for proper reset and power-off functionalities on Toradex SMARC iMX8M
Plus.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
v2: add r-b peng
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index a92c4122a8b9..d4f1230250fa 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -680,6 +680,7 @@ CONFIG_GPIO_SL28CPLD=m
 CONFIG_GPIO_AGGREGATOR=m
 CONFIG_POWER_RESET_MSM=y
 CONFIG_POWER_RESET_QCOM_PON=m
+CONFIG_POWER_RESET_TORADEX_EC=m
 CONFIG_POWER_RESET_XGENE=y
 CONFIG_POWER_RESET_SYSCON=y
 CONFIG_POWER_RESET_SYSCON_POWEROFF=y
-- 
2.39.5

