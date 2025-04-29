Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01C129DB8D;
	Tue, 29 Apr 2025 11:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745926300; cv=none; b=bVP44ABcvHOVXEhishxWBjiUmY1+vouZ4vmSmNqmsKxepj7WX4j+JgFzG6OUIZsJoVOAXQ7LqyyOpWWXF6V8iCB5VPlJHlCoIUjUin60G0GfwWhoI4df0CMmf/SM4qptopVfr4EQnGFvdsYjHloX4pfvHDF/PxC4p2Fzh6bLt6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745926300; c=relaxed/simple;
	bh=uN4ty1fseBFNMwUuGFagV0dNlU0etgEJ1A2OrTvsxAs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XVJP9oQLZDtQkAcuMoFMWNWucTrEpQeZ+kw2YPxSQSVhU7/W0M/VxZagSw5f9/z+0CYKDQths4acDz9uB5v/0NW9JKbUFktZsuGDg3lPDjj1yubqYkRjc7JX3K1mQMnWuZHH/X9pj8RcKbW4nT2YO7Fz69S1FD5JzjufPDXZV/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=q6blwe0V; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="q6blwe0V"
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 904B31F945;
	Tue, 29 Apr 2025 13:31:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1745926288;
	bh=3IC7RgsdFRjgNaYf9Bgi/HQazgo9UqZR6LcWu3Lxorw=; h=From:To:Subject;
	b=q6blwe0VuViLMGWdxk2Q8Jg5bwm254tstAbZUf3GJpHVVQYpsAiW3T8DM3OwSYin0
	 V4iyB0dW6x/prfk0GRhPDsumLqBPVV2BCklB/Xcnd2qzPKVfXkQg7FlhgWOhrusU1R
	 jX0b4rKAs2gvxO9awAp4WMNe+rsnvWi5nvLxYJvlPiNGBeMK8yPERXEkjTy8Vk1GZY
	 IolJAKQpk/ECxFpQRt9gEioJqx4EXhTd+KLXl5H728WXTf7mv239KPg36UL9LabifY
	 WMxz8K16saan9eple72fd7sXoyiE+HYZ+pYq+E+1OBdYkvCU3I4JK2Bvcp+nL/rqK3
	 dlh5kYZBle7Vw==
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/4]  arm64: dts: freescale: imx8mp-toradex-smarc: add fan, ec, gpio
Date: Tue, 29 Apr 2025 13:31:15 +0200
Message-Id: <20250429113119.124427-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add fan, gpio expander and embedded-controller to the Toradex SMARC iMX8MP
device tree file.

All the required DT bindings and drivers are now in next:
 - https://lore.kernel.org/all/20250331072644.17921-1-francesco@dolcini.it/
 - https://lore.kernel.org/all/20250414171455.155155-1-francesco@dolcini.it/
 - https://lore.kernel.org/all/20250402102146.65406-1-francesco@dolcini.it/

Emanuele Ghidoli (2):
  arm64: dts: freescale: imx8mp-toradex-smarc: add embedded controller
  arm64: dts: freescale: imx8mp-toradex-smarc: add gpio expander

Francesco Dolcini (2):
  arm64: dts: freescale: imx8mp-toradex-smarc: add fan PWM configuration
  arm64: defconfig: Add Toradex Embedded Controller config

 .../freescale/imx8mp-toradex-smarc-dev.dts    |  9 +++++-
 .../dts/freescale/imx8mp-toradex-smarc.dtsi   | 30 +++++++++++++++++++
 arch/arm64/configs/defconfig                  |  1 +
 3 files changed, 39 insertions(+), 1 deletion(-)

-- 
2.39.5

