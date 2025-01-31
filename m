Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6182D14B092;
	Fri, 31 Jan 2025 21:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738357731; cv=none; b=gb2+vsl3fr1Guy+bwHwlvecSMo1UR/Op6Gr+tSECSJj5aZzgrN3QqCwVQgGgwGFA2k0LpEN8I5JsePCHxu4qW5LduxP71BH4rfOHBK1riwJKwfxNlrHbvv+k3tapHSVQuMdtpNUbEq967ZWlmaAlog9q41o/zqiOemaLHKBTdvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738357731; c=relaxed/simple;
	bh=kwRAFNwdHgPKjApGVq1mNUl2Zb/Zs8pER8puJ31Zghs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rwbgzrnOtHduVQckp6JNSKinnOc2A08EXz3MwU277kMZhMWWWN1Ko6du9P5VRC41i5SEk7lRlkbBqtjHxksRjYQ8ecx0gqSwQtzGg5x0WPLr4vOzn+e0+CpCJOvrUMDQrMrXAuYsGWMfEnWZF/6dBETMtlCWCnIG0uloZnWKFnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A452QXk0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A452QXk0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB275C4CED1;
	Fri, 31 Jan 2025 21:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738357729;
	bh=kwRAFNwdHgPKjApGVq1mNUl2Zb/Zs8pER8puJ31Zghs=;
	h=From:Subject:Date:To:Cc:From;
	b=A452QXk0ceURR20sjPDIPDsE4BAQKH71KqakJ9lqLH9Gh0MkR/2NA88eGlRxOoqHD
	 fl4PjJfAV11CrNKqTXWxD/QsNXuID6EENkJc728+wXrmP3TSlE+/FyrKoI0mmonROG
	 6Int9xqYSU+UEAWic5GUeRXmE2Y0c+hHRTjpGabBH4Y9R7l/6GdVo880nqKTotIZR6
	 JE/eDa/Jq2LkSJTqtP6yZEmPJhxo/o7ydo0Reiq9enWPGGWq3WQaxkKxxdxxUP048X
	 jeHt/SugLpaMWM4x5ra+BiGhWHY4NG8VwxQY5tPaJtOghf5TBm7x1ngLjkCGOFATuB
	 R8sfsxv21m+Tg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Subject: [PATCH 0/6] marvell: DT root compatible fixes
Date: Fri, 31 Jan 2025 15:08:24 -0600
Message-Id: <20250131-dt-marvell-fixes-v1-0-55f9f6acd4b1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMg7nWcC/x3LSwqAMAwA0auUrA0k1m68irgoNmrAH60UQXp3i
 8vHMC8kiSoJevNClKxJz6OCGwPT6o9FUEM1tNQ6YssYbtx9zLJtOOsjCdlPnSVyHQlD3a4of6j
 XMJbyAcrcWDpiAAAA
X-Change-ID: 20250131-dt-marvell-fixes-1ac4300540e1
To: Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robert.marko@sartura.hr>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev

This series adds some missing root node compatibles and fixes some 
errors in dts files for the root node compatibles.

Signed-off-by: "Rob Herring (Arm)" <robh@kernel.org>
---
Rob Herring (Arm) (6):
      dt-bindings: marvell: armada-37xx: Add glinet,gl-mv1000 compatible
      dt-bindings: marvell: armada-7k-8k: Move Armada 8KPlus to schema
      dt-bindings: marvell: armada-7k-8k: Add missing 7040 and 8040 board compatibles
      arm64: dts: marvell: Drop incomplete root compatible/model properties
      arm64: dts: marvell: Fix missing/incorrect "marvell,armada3710" compatible
      arm64: dts: marvell: Add missing board compatible for IEI-Puzzle-M801

 .../bindings/arm/marvell/armada-37xx.yaml          |  1 +
 .../bindings/arm/marvell/armada-7k-8k.yaml         | 25 ++++++++++++++++++++++
 .../devicetree/bindings/arm/marvell/armada-8kp.txt | 15 -------------
 arch/arm64/boot/dts/marvell/armada-371x.dtsi       | 17 ---------------
 arch/arm64/boot/dts/marvell/armada-3720-db.dts     |  2 +-
 .../dts/marvell/armada-3720-espressobin-emmc.dts   |  2 +-
 .../dts/marvell/armada-3720-espressobin-ultra.dts  |  2 +-
 .../marvell/armada-3720-espressobin-v7-emmc.dts    |  2 +-
 .../dts/marvell/armada-3720-espressobin-v7.dts     |  2 +-
 .../boot/dts/marvell/armada-3720-espressobin.dts   |  2 +-
 .../boot/dts/marvell/armada-3720-gl-mv1000.dts     |  2 +-
 .../boot/dts/marvell/armada-3720-turris-mox.dts    |  2 +-
 arch/arm64/boot/dts/marvell/armada-372x.dtsi       |  3 ---
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi       |  2 --
 arch/arm64/boot/dts/marvell/armada-7020.dtsi       |  6 ------
 arch/arm64/boot/dts/marvell/armada-7040.dtsi       |  6 ------
 arch/arm64/boot/dts/marvell/armada-8020.dtsi       |  6 ------
 .../boot/dts/marvell/armada-8040-puzzle-m801.dts   |  2 +-
 arch/arm64/boot/dts/marvell/armada-8040.dtsi       |  6 ------
 arch/arm64/boot/dts/marvell/armada-8080.dtsi       |  6 ------
 arch/arm64/boot/dts/marvell/armada-ap806-dual.dtsi |  3 ---
 arch/arm64/boot/dts/marvell/armada-ap806-quad.dtsi |  3 ---
 arch/arm64/boot/dts/marvell/armada-ap806.dtsi      |  5 -----
 arch/arm64/boot/dts/marvell/armada-ap807-quad.dtsi |  3 ---
 arch/arm64/boot/dts/marvell/armada-ap807.dtsi      |  5 -----
 .../dts/marvell/armada-ap810-ap0-octa-core.dtsi    |  1 -
 arch/arm64/boot/dts/marvell/armada-ap810-ap0.dtsi  |  2 --
 arch/arm64/boot/dts/marvell/cn9130-sr-som.dtsi     |  3 ---
 28 files changed, 35 insertions(+), 101 deletions(-)
---
base-commit: 69b8923f5003664e3ffef102e73333edfa2abdcf
change-id: 20250131-dt-marvell-fixes-1ac4300540e1

Best regards,
-- 
Rob Herring (Arm) <robh@kernel.org>

