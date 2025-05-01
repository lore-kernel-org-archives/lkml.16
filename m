Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6998F4C79;
	Thu,  1 May 2025 04:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746074618; cv=none; b=KjMSBzPexghmd2DvaWlKk5rEnBXlB0bDoqUzmE74+mAAVyPwDeGV4uMy4pu9qlzPbPhkDkoM9XaDCXLCgg4bjrtF2gvhhP6/GWEIaCjoltsMpqK0l76Fgioj/x4X6mLphAdBB9vsm/4ncCMHaMxBY/ULCJkeCp3RZX+ygLE+d4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746074618; c=relaxed/simple;
	bh=4JkwcjE5GPk9uPDAK84KvKHdAkJ6Hc+IvsTERslfTjY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=Yl/ODclr1i8+29i7DgNt97ZVr4/55VUbL4ub8gAe8wsJz1fq5Qh1iOq8rs3mPPhH0hyS8kwu3Dxu+kiBYz5b4ogaxzeYrjwVaGyVETRAaoi90TvsxKRn8jdke7w0b9GOVVIvnevyMb6ooHWFvv+aGv+dsx39G77sxVxP1wIbABQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=j09EE/4Z; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="j09EE/4Z"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 0D0C825DDC;
	Thu,  1 May 2025 06:43:33 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ud8Ui2_EBSQ; Thu,  1 May 2025 06:43:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1746074612; bh=4JkwcjE5GPk9uPDAK84KvKHdAkJ6Hc+IvsTERslfTjY=;
	h=From:To:Subject:Date;
	b=j09EE/4ZxBp2Fl/fj12zjVXyBQ+uye8GyjmVdKfFJd4jKLZbAcpkb9wg/KGtTD2l2
	 ora8UneQELBXkv69vXUTALhhEyL8ppSk97mxpVAl5mx7v/XA8PNkGX4f41SpvteWD1
	 OCgWgOXtW0I4NbnvsmyQN6VbX4xRk8NdPfqL0ZmS7lWE4MpXlmHTKn6NiI2fS2DxXJ
	 QjsJ/lMaSFydzWxlH0fSY449CAyrGWeohAfpjv73ptABMpdIyELadvGLL72sqJPX8j
	 sEhNZnNEWZL70gdTLKwXME8s2jQqEg1d6TO62LxUB8xCrI9r+87h8DWm7DtxNiYQuk
	 hRxZuLGKfXYcw==
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
	Binbin Zhou <zhoubinbin@loongson.cn>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Mingcong Bai <jeffbai@aosc.io>,
	Kexy Biscuit <kexybiscuit@aosc.io>
Subject: [PATCH 0/4] Initial support for CTCISZ Ninenine Pi
Date: Thu,  1 May 2025 04:42:36 +0000
Message-ID: <20250501044239.9404-2-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for CTCISZ Ninenine Pi, which ships an Loongson
2K0300 SoC and various peripherals. The vendor prefix and the board are
documented and basic SoC/board devicetrees are added.

I've successfully booted into console with vendor U-Boot, a bootlog
could be obtained here[1]. DTB and initramfs must be built into the
kernel as the vendor bootloader cannot pass them and upstream U-Boot
support for LoongArch is still WIP.

Thanks for your time and review.

[1]: https://gist.github.com/ziyao233/7fd2c8b3b51ef9b30fe5c17faae1bc4e

Yao Zi (4):
  dt-bindings: vendor-prefixes: Add CTCISZ Technology Co., LTD.
  dt-bindings: LoongArch: Add CTCISZ Ninenine Pi
  LoongArch: dts: Add initial SoC devicetree for Loongson 2K0300
  LoongArch: dts: Add initial devicetree for CTCISZ Ninenine Pi

 .../bindings/loongarch/loongson.yaml          |   5 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/loongarch/boot/dts/Makefile              |   1 +
 arch/loongarch/boot/dts/loongson-2k0300.dtsi  | 197 ++++++++++++++++++
 .../boot/dts/ls2k0300-ctcisz-nineninepi.dts   |  41 ++++
 5 files changed, 246 insertions(+)
 create mode 100644 arch/loongarch/boot/dts/loongson-2k0300.dtsi
 create mode 100644 arch/loongarch/boot/dts/ls2k0300-ctcisz-nineninepi.dts

-- 
2.49.0

