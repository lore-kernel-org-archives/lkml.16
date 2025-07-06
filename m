Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501DA19D8A3;
	Sun,  6 Jul 2025 18:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751827630; cv=none; b=HkK/ErFvlar/O1Mg6marJSyiLETywBc8f41ur9WjpsyS7uEjiPbL1NKifBbxjo2yMd9I9ckxG1NWNH+AH2P/AoHHf4CfwgAbEbdB/m4YSuihPld3pGqKtVQluWFtjiBJ6ypLWKFYhqsu7ie+N+jrq2I31IbWPKrOPR3znBku4lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751827630; c=relaxed/simple;
	bh=F01Zl2KLwJZEJs0qPrL6t3cMCxuqK7s2DTQP4dCVqcU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=m0/6BBH94AaroNfkFKDEvcAoGLvcjxKuodKpjh5HWIwuaqYIOmfZ4cBp/u25pbY7rBdadnLMsi+qso2IOVXi1eiaf2WONBh7OX2BuJaKs4JQtp5KO7g7znrhiujQF//i96JEStm5rlWrr3Nm7uAskXXbhospSpdh02DQH7ji61s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jd91LstO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jd91LstO"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CEEC3C4CEED;
	Sun,  6 Jul 2025 18:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751827629;
	bh=F01Zl2KLwJZEJs0qPrL6t3cMCxuqK7s2DTQP4dCVqcU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=jd91LstO7qvQFfLNUb8fxwQNFAdN2QkEKBC9UGL8cITx4f/bd0BT4Xz27XK8MjQg2
	 F/v6f3rQUVC7A1ewmzDgwgRVZ5oAieBG88Plesn+NNbsMTbtWzV4FfJDftanFKfYJq
	 7yVyHS/MwEaFn2QacHuGTJn/OkAYXTyNiHD+d2mVkJLHjgKqZxicSpkv32z3XrOABf
	 //qaVsKyyNAqGE9rdmPflSVlXeGFyWJAloP3Z0Bje0vFNS8dvkcT1Z3Lnsgz2wvV2l
	 Yp+8rSw8NHJMX6Aj3FGXA5wXXzBW5QKSL7CO1h3/pIyqnKML4NHxdNwFJfKWmuilaC
	 P3tFqL0saATCw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B117FC83F09;
	Sun,  6 Jul 2025 18:47:09 +0000 (UTC)
From: Frank Li via B4 Relay <devnull+Frank.Li.nxp.com@kernel.org>
Subject: [PATCH 00/11] ARM: dts: nxp: clean lpc18xx DTB check warning
Date: Sun, 06 Jul 2025 14:46:56 -0400
Message-Id: <20250706-lpc18xxx_dts-v1-0-7ae8cdfe8d7d@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKDEamgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDcwMz3ZyCZEOLioqK+JSSYt0kI0NjcyNDs1SzZAMloJaCotS0zAqwcdG
 xtbUAqorP3V4AAAA=
X-Change-ID: 20250706-lpc18xxx_dts-b2137216e6c0
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, vz@mleia.com, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751827628; l=1879;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=F01Zl2KLwJZEJs0qPrL6t3cMCxuqK7s2DTQP4dCVqcU=;
 b=Y44sZ3YsNp/IVrlrnvKtROO939BSVTW6WmqJDHFZ8OzLPEspu1u3iBWJ8qukYTqtKbLiW+fNR
 6+5hPmY9vrpDnEJLlArm74FP/V1e9PqGTeDkmqGWIPjxgFh5t5hSHCt
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-Endpoint-Received: by B4 Relay for Frank.Li@nxp.com/20240130 with
 auth_id=121
X-Original-From: Frank Li <Frank.Li@nxp.com>
Reply-To: Frank.Li@nxp.com

There are 3 dt-binding patch wait for pick.
[1] https://lore.kernel.org/imx/20250617-hound-of-improbable-intensity-e7c3c9@kuoka/
[2] https://lore.kernel.org/imx/174916907717.3619367.3745642154654809311.robh@kernel.org/
[3] https://lore.kernel.org/imx/175087864578.2055525.4510390315154712025.robh@kernel.org/

lpc18xx related DTB warnings reduce to 0.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Frank Li (11):
      ARM: dts: lpc18xx: rename node name flash-controller to spi
      ARM: dts: lpc18xx: rename node name mmcsd to mmc
      ARM: dts: lpc4350-hitex-eval: change node name flash to flash@0
      ARM: dts: lpc18xx: swap clock-names bic and cui
      ARM: dts: lpc: add #address-cells and #size-cells for sram node
      ARM: dts: lpc: add cfg surfix in pinctrl child node
      ARM: dts: lpc4357-myd-lpc4357: add power-supply for innolux,at070tn92
      ARM: dts: lpc: change node name 'button[0-9]' to button-[0-9]'
      ARM: dts: lpc4357-myd-lpc4357: change node name mdio0 to mdio
      ARM: dts: lpc18xx: add #address-cell and #szie-cell for spi flash controller
      ARM: dts: lpc18xx: add missed arm,num-irq-priority-bits

 arch/arm/boot/dts/nxp/lpc/lpc18xx.dtsi             | 14 ++++++++++----
 arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dts         |  6 +++---
 arch/arm/boot/dts/nxp/lpc/lpc4350-hitex-eval.dts   | 22 +++++++++++++---------
 arch/arm/boot/dts/nxp/lpc/lpc4350.dtsi             |  9 +++++++++
 .../arm/boot/dts/nxp/lpc/lpc4357-ea4357-devkit.dts | 21 +++++++++++----------
 arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dts  |  6 ++++--
 arch/arm/boot/dts/nxp/lpc/lpc4357.dtsi             |  9 +++++++++
 7 files changed, 59 insertions(+), 28 deletions(-)
---
base-commit: bb0fde92b56b76f7a0c90a6e9d9f050919fa835e
change-id: 20250706-lpc18xxx_dts-b2137216e6c0

Best regards,
--
Frank Li <Frank.Li@nxp.com>


