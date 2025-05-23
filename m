Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11B622A1FA;
	Fri, 23 May 2025 09:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747994083; cv=none; b=tI41xjdgE/5DiRehX3jCIoarrb692OUx26Z1tmelqdcIQDcbxPvYKSFA6CMtfBYY6YNQzNyeznrExeaVqCh88hyI/E/S8zkC0Es9pkmKLw/YdxPzf43dISSezlggaA7pYJ5kFRLCsO4igt9JGW/SnwhJWheIk08ZqXtHP5iWKjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747994083; c=relaxed/simple;
	bh=RB99VirsIdmb8I1X4vyoUiocrkXLO/yI71p/wSx579I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PksB4qey0RjK10bd9L4Tknldc12vGzesUdAkEFBA1ufaIqK/It4tzHIrVpSkzbWjx6I1Giq9KdAAQFU/6Izcd73isnA49bE22bbzdf5a77sOtR28bTaHNeWn66B8eyRT/+2gpC+9HeYyCRRPTnwCcj7rsxB15ELy4HKL5BBUCM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=Y8RkrZWb; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="Y8RkrZWb"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 78B282627E;
	Fri, 23 May 2025 11:54:33 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ve9O3ZYTPBAa; Fri, 23 May 2025 11:54:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1747994072; bh=RB99VirsIdmb8I1X4vyoUiocrkXLO/yI71p/wSx579I=;
	h=From:To:Cc:Subject:Date;
	b=Y8RkrZWbGSJkM8qBV/68W9AEjnbkIDlEhrMZYfXdMEfseV91XuxwoKC+xNU2JNs99
	 ltG+1qHMolkvM6c019/T26rm3wQaz3bO67j7m8j/u7wVKc6mDR9tZpwHhbHAJlxBYN
	 CVYa5UeL6vvrAkV5zwkZz8u3w/2gckdSB4e/Dh9jiGI2h6Yjnz/OghkbhmLakMCDPi
	 pmq2ajY8JpXvEICHyNEsf3Z9e0LGyd6u0mjqnvhNU9ANshm1W3IAZb3iezameRSir6
	 dti429KFoEdnsM4NmkL9E1QPG9w7tYInX9ze9jNxssupVNMa7gFXRsvKHbPhgku9N/
	 uNol6QbZhbUKA==
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
Subject: [PATCH v3 0/4] Initial support for CTCISZ Forever Pi
Date: Fri, 23 May 2025 09:54:04 +0000
Message-ID: <20250523095408.25919-1-ziyao@disroot.org>
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

[1]: https://gist.github.com/ziyao233/f42c5058d83ae45222fbd0b8524f3e59

Changed from v2:
- Collect review tags
- Add a unitname for "soc" node
- Rename SoC devicetree to loongson-2k0300-ctcisz-forever-pi.dts for
  consistency
- Link to v2: https://lore.kernel.org/all/20250518080356.43885-1-ziyao@disroot.org/

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
 .../dts/loongson-2k0300-ctcisz-forever-pi.dts |  45 +++++
 arch/loongarch/boot/dts/loongson-2k0300.dtsi  | 184 ++++++++++++++++++
 5 files changed, 237 insertions(+)
 create mode 100644 arch/loongarch/boot/dts/loongson-2k0300-ctcisz-forever-pi.dts
 create mode 100644 arch/loongarch/boot/dts/loongson-2k0300.dtsi

-- 
2.49.0

