Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C344919B3EC;
	Sun, 18 May 2025 08:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747555472; cv=none; b=mBChAsdNum5sJjozNpCjz1ohQHV3OYsGr5UDcR6gTlIatW29GrBrR4zOxtIVlQu+LQShrOp8jF/pihJYhJVK3SwUzvujeYoxwJ/mmCC4ATOc89DEuuzGgIL+PlzdOU3s22eQ0SrKBC2LGnYLDTMQ8YWUw+Q291aTuXaLksBa1ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747555472; c=relaxed/simple;
	bh=qePj0YixsvkA+CzrUyZ0PqeV2u8FUKJIVJoaNt3JlYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kFgbKETx65AASyZu73VsRzfrQuRHdY9PgmCnfhegslZ1wlmNnULoMEXm1n8pjdPb9OKu3yQ0evutHVgiwH51zpYzKyd7RJKiiYHTx9tc/AH5PoFoCBrXwef6MDxJ3F1UACaHEyTS8jlxqcEmHJVZGodXmX9y725efFmRdRC9Bh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=I6uQflbp; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="I6uQflbp"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 5BA1B25CE3;
	Sun, 18 May 2025 10:04:21 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gbn3_WMjAtMM; Sun, 18 May 2025 10:04:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1747555453; bh=qePj0YixsvkA+CzrUyZ0PqeV2u8FUKJIVJoaNt3JlYQ=;
	h=From:To:Cc:Subject:Date;
	b=I6uQflbpc9GIUMConefud+QMQfgAhheIf5xabVr1M/D4AT2eD2FhGsBuNIYeCj7TL
	 sB+X/DB+6/MIhTGCZ9KLWk4V1PnGoKPDQQmh62dMaE/WzXGTAi72o8ly5ggF8R6tsP
	 WXv08oYVl5+Q6CWLX8lF1QKJWSRTca/WA4TL+PYAsUOhA/WkQyeKLPsxuugkiycQi2
	 e37PpMPfk14cQxswk9uD1ZtgJFamoK4Bq2uqL3Xi+D9teHNYb2pDVNPEHS+SKTdYuT
	 AF0pZO+ysS/2VmVPr3fTq3Awd2b1lqwjoS65HxaC/sW0cKNhu+nDNPOD06PGdM6BYs
	 zg1eU4NBwfDEw==
From: Yao Zi <ziyao@disroot.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Yao Zi <ziyao@disroot.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Junhao Xie <bigfoot@classfun.cn>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Aradhya Bhatia <a-bhatia1@ti.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Binbin Zhou <zhoubinbin@loongson.cn>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Mingcong Bai <jeffbai@aosc.io>,
	Kexy Biscuit <kexybiscuit@aosc.io>
Subject: [PATCH v2 0/4] Initial support for CTCISZ Forever Pi
Date: Sun, 18 May 2025 08:03:52 +0000
Message-ID: <20250518080356.43885-1-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for CTCISZ Forever Pi, which ships an Loongson
2K0300 SoC and various peripherals. The vendor prefix and the board are
documented and basic SoC/board devicetrees are added.

I've successfully booted into console with vendor U-Boot, a bootlog
could be obtained here[1]. DTB and initramfs must be built into the
kernel as the vendor bootloader cannot pass them and upstream U-Boot
support for LoongArch is still WIP.

Thanks for your time and review.

[1]: https://gist.github.com/ziyao233/54ef900406876b5554f627d1ba0e130e

Changed from v1 ("Initial support for CTCISZ Ninenine Pi")
- Board binding:
  - Use "Forever Pi" instead of "Ninenine Pi" as translation of the
    board model
- SoC devicetree:
  - Move UART aliases to the board dt
  - Add the missing space in definition of liointc0
- Link to v1: https://lore.kernel.org/all/20250501044239.9404-2-ziyao@disroot.org/

Yao Zi (4):
  dt-bindings: vendor-prefixes: Add CTCISZ Technology Co., LTD.
  dt-bindings: LoongArch: Add CTCISZ Forever Pi
  LoongArch: dts: Add initial SoC devicetree for Loongson 2K0300
  LoongArch: dts: Add initial devicetree for CTCISZ Forever Pi

 .../bindings/loongarch/loongson.yaml          |   5 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/loongarch/boot/dts/Makefile              |   1 +
 arch/loongarch/boot/dts/loongson-2k0300.dtsi  | 184 ++++++++++++++++++
 .../boot/dts/ls2k0300-ctcisz-forever-pi.dts   |  45 +++++
 5 files changed, 237 insertions(+)
 create mode 100644 arch/loongarch/boot/dts/loongson-2k0300.dtsi
 create mode 100644 arch/loongarch/boot/dts/ls2k0300-ctcisz-forever-pi.dts

-- 
2.49.0

