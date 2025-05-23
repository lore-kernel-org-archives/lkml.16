Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FF0189919;
	Fri, 23 May 2025 10:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747997171; cv=none; b=jlGy1t/CSi9adnHSVtd3sDqP2VlliHXI+nuy+5jF2HgKbKb3TRocr/IiZiv2AR0GX0ANWlZB3rel1Sinlr24VgkOuTArC3eUDJ2dDOl5hDPrpf5i30hcf0w2PE/GhuKSHCrRWA6jfkyZbboepKR3ugbb4WiYcBPF8EFUsjauoc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747997171; c=relaxed/simple;
	bh=7HvdOFjy/qSjS9m8ifFf25BN9ifPXD7ylgf9PbJrc5E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bM01dgLrBe/6b3T9yc1zM/R5HSh3Vn2zQYHfeS2yFKDcRZGRJ1oZMpCq/s3yjl94xF7xAnhEETdR0CfzaNwAoTgX8qzhCHmdBDMsMHZFN293oG45Yc1Pblz7gHuQBGPSkRQuQ/YS1pFC4jZzysYDckIBlp2VfwM5HjlHKQtNvPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=MimChsLE; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="MimChsLE"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 5299D25D81;
	Fri, 23 May 2025 12:46:08 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MCRF59rG0MZi; Fri, 23 May 2025 12:46:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1747997166; bh=7HvdOFjy/qSjS9m8ifFf25BN9ifPXD7ylgf9PbJrc5E=;
	h=From:To:Cc:Subject:Date;
	b=MimChsLEwrQ+Sw6Hcs/Mirfmrlr0TlkIqc8MVFqaoG45utpuFJIYa8l043F6Nvt5t
	 MRZ/DrjASFCxy09Y4Kwzh2IwqxCHCLcV5KdNxidw+5CKBhRDk52H6CuxLPD7YdpmwP
	 aTcFm1pQevA3J/WcTgPdJYU0ut8gbFZnp+3mQ9ZttkvbxVOWwoYbafbXaoAYrToPNl
	 boq+BWumnr5pJ6fV7uuW4Fbz8pqA62YCqTkbK/oEETfKnA1uq5qs9IP0p+6i1+ODNx
	 0kgSl1piSxuuYNWYpWhDE8KGqEajmgtMTM4z4Crmm94ghhBkIm6HqReYPNbfFHry4V
	 rwcccAteKgxIQ==
From: Yao Zi <ziyao@disroot.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Mingcong Bai <jeffbai@aosc.io>,
	Kexy Biscuit <kexybiscuit@aosc.io>,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH 0/8] Add clock support for Loongson 2K0300 SoC
Date: Fri, 23 May 2025 10:45:44 +0000
Message-ID: <20250523104552.32742-1-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for Loongson 2K0300's clock controller.
Loongson 2 clock driver is prepared to support more clock variants and
its flexibility is improved. All clock hardwares except the output one
for GMAC module are then defined.

A clock tree dump could be obtained here[1]. This series depends on v3
of series "Initial support for CTCISZ Forever Pi"[2] to apply.

[1]: https://gist.github.com/ziyao233/8cd3ab8ebbf291b5a4643284309274ea
[2]: https://lore.kernel.org/loongarch/20250523095408.25919-1-ziyao@disroot.org/

Yao Zi (8):
  dt-bindings: clock: Document Loongson 2K0300 clock controller
  clk: loongson2: Allow specifying clock flags for gate clock
  clk: loongson2: Support scale clocks with an alternative mode
  clk: loongson2: Allow zero divisors for dividers
  clk: loongson2: Avoid hardcoding firmware name of the reference clock
  clk: loongson2: Add clock definitions for Loongson 2K0300 SoC
  LoongArch: dts: Add clock tree for Loongson 2K0300
  LoongArch: dts: Remove clock-frquency from UART0 of CTCISZ Forever Pi

 .../bindings/clock/loongson,ls2k0300-clk.yaml |  52 ++++++++
 .../dts/loongson-2k0300-ctcisz-forever-pi.dts |   1 -
 arch/loongarch/boot/dts/loongson-2k0300.dtsi  |  17 ++-
 drivers/clk/clk-loongson2.c                   | 124 +++++++++++++++---
 .../dt-bindings/clock/loongson,ls2k0300-clk.h |  54 ++++++++
 5 files changed, 224 insertions(+), 24 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/loongson,ls2k0300-clk.yaml
 create mode 100644 include/dt-bindings/clock/loongson,ls2k0300-clk.h

-- 
2.49.0

