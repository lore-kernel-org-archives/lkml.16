Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7AD2EA153;
	Tue, 17 Jun 2025 16:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750177502; cv=none; b=II0GhPiioTPhXZcOtq/3gIq5GEFcDUamA+zKH3jDstMfmgZhjGU8dZ4CWeZsEXs543mmvVcUJUpR3D5TW0BZqrRCcZjQbPdeNV3aR4j6MqvGEM0SpTPZ8ZzlIKhhDozRTjie/QLrqk+s6iTvNxa/sKLZP2gIs02Ag8Fo4RDvdxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750177502; c=relaxed/simple;
	bh=FVR61cCvuPODVHOG+7g4ratLDexhFAS3ISo2xPSD1gw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Mw/Mn5hEO2OWvYH3PmCnR35u0qELqdzUj+6UXq+Dna6rXlcaWDsQlFadzT7arHgBoLr6nVpGeBujumwh0FEtOW7yPAnvYJSSnanFVz2F754N+RiWRTfxWFGq7vHFYppAWAjiNXyGuWjsOghgUpXeD3tpfWa4cvhAqwfotCg/mFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=lHQE29hR; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="lHQE29hR"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 6FD7325D1A;
	Tue, 17 Jun 2025 18:24:59 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0vwZ-zQvPBPT; Tue, 17 Jun 2025 18:24:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1750177498; bh=FVR61cCvuPODVHOG+7g4ratLDexhFAS3ISo2xPSD1gw=;
	h=From:To:Cc:Subject:Date;
	b=lHQE29hR2+jH2w6VRfjJbKtp4W3Ku1i64dh1+EYhSbz9DWPjTk04hXCcXxZgZ0nJq
	 TZQVJIZpLDKRwrqZBwfwL6oVZuZDNYSBOHM/ZiVY2180LzMCI2snK+qkERXRX4uTOR
	 8RFKkxuLlqr9qtk1tOjFa4CBbOxAX7KqVYedy7m2SCpcsb34A2Ui9GyCg6fmZ6f6GO
	 ApOm+S00Z3kJCpEQnFBsCiPpSRxyHysbyHeo6ZZyIbskYpL5OEHL0+E+B38te00iGM
	 A/l5IVPzLgtVD/oISjc3DWpIvaEJ+VKYbT74m+spgzleyZqFjdbt6LXbbwHUBDe5gf
	 lB9eRKoVfHDcA==
From: Yao Zi <ziyao@disroot.org>
To: Yinbo Zhu <zhuyinbo@loongson.cn>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Mingcong Bai <jeffbai@aosc.io>,
	Kexy Biscuit <kexybiscuit@aosc.io>,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH v2 0/8] Add clock support for Loongson 2K0300 SoC
Date: Tue, 17 Jun 2025 16:24:18 +0000
Message-ID: <20250617162426.12629-1-ziyao@disroot.org>
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

[1]: https://gist.github.com/ziyao233/160bb4693e7758b2a2a996d4510b7247
[2]: https://lore.kernel.org/all/20250523095408.25919-1-ziyao@disroot.org/

Changed from v1:
- Fold loongson,ls2k0300-clk.yaml into loongson,ls2k-clk.yaml
- Include the new binding header in MAINTAINERS
- Link to v1: https://lore.kernel.org/all/20250523104552.32742-1-ziyao@disroot.org/

Yao Zi (8):
  dt-bindings: clock: loongson2: Add Loongson 2K0300 compatible
  clk: loongson2: Allow specifying clock flags for gate clock
  clk: loongson2: Support scale clocks with an alternative mode
  clk: loongson2: Allow zero divisors for dividers
  clk: loongson2: Avoid hardcoding firmware name of the reference clock
  clk: loongson2: Add clock definitions for Loongson 2K0300 SoC
  LoongArch: dts: Add clock tree for Loongson 2K0300
  LoongArch: dts: Remove clock-frquency from UART0 of CTCISZ Forever Pi

 .../bindings/clock/loongson,ls2k-clk.yaml     |  26 +++-
 MAINTAINERS                                   |   1 +
 .../dts/loongson-2k0300-ctcisz-forever-pi.dts |   1 -
 arch/loongarch/boot/dts/loongson-2k0300.dtsi  |  17 ++-
 drivers/clk/clk-loongson2.c                   | 124 +++++++++++++++---
 .../dt-bindings/clock/loongson,ls2k0300-clk.h |  54 ++++++++
 6 files changed, 193 insertions(+), 30 deletions(-)
 create mode 100644 include/dt-bindings/clock/loongson,ls2k0300-clk.h

-- 
2.49.0

