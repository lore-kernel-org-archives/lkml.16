Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC6B1DE3BE
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 13:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739109377; cv=none; b=Nvlo4hcvR0ca3kX7BY6nL3ezxghXHcNv3V4hTTKbNv/c6SA2jkXGySVCvdOBopwr9QhLlpDFjmbDDjhQ0oTMv8pAA9yYQiZ6bD2+Ps/ffo/3CdAjJCxT4qhNvOOcWOTtUGVr3XqRDF206nqxXalF3Et+VWe8J6h2dC2edi7PnNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739109377; c=relaxed/simple;
	bh=Fp5B/TYrsCp2bsOyDjm8MqsN013zHZhI0MruvmxETKI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BEKE5J8VVRNRruJecufCUyO6uw6HX5/ElCi+Nq/DrtXevglP+f8hG91zKFNoxHDGxAtkvDHrvDwUnavok+vGeAiXzpCUVcgfC1xpeRPgW3qfogtx7dbLrt97Anh3P1rXDhi2/LvST8QnneD4XPJxUWO7pK+Tc/ak9IaI/dAAHCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svenpeter.dev; spf=pass smtp.mailfrom=svenpeter.dev; dkim=pass (2048-bit key) header.d=svenpeter.dev header.i=@svenpeter.dev header.b=eoC2qDdw; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=emqaK/vf; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svenpeter.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svenpeter.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svenpeter.dev header.i=@svenpeter.dev header.b="eoC2qDdw";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="emqaK/vf"
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 63E4F11400B6;
	Sun,  9 Feb 2025 08:56:13 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Sun, 09 Feb 2025 08:56:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1739109373; x=1739195773; bh=PF0zmXy3ds
	iUkXl30IYIMBmC20fNuat6h4RHVl7ROG0=; b=eoC2qDdwexfyxAs6+9ftAdv/W8
	FL87lIimEU/HBvzhldA/s3D3Hj0fEiPG6nOsDPyYs8fabTt1b5Dp7pOgCJBVEqP4
	2ZasOlH/dh+Tt/uyKWBZ3EECWvzMxpVur6dC+EHYUKRiImzcNfzk/QY18oOLIuLt
	9G6y7yQzZv5JXzA2hNcCJdBMBh8q4R641f6CzVzeTxSZYpKnojg17M2AGAqEbvye
	K7B89OXYiNFEn3E5AqAL/xut4INKya8obavxJfKuUTs54MxX9qRReFDC0Ibwzt5U
	U3KvkP03Ws+WenQ3BOzxXhj6G8N6AsC7692EFcqcjp4nEoXiAszKsw8BcrCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1739109373; x=1739195773; bh=PF0zmXy3dsiUkXl30IYIMBmC20fNuat6h4R
	HVl7ROG0=; b=emqaK/vfJVEo85KdkD2UzY+1FFVjmSR6DmKKWhvoa4dARksbpFP
	tY4m74qg1lWQK3k6Kaw3cBcGZzMuGIHHUFFXvi4aMreCpJBCXBURIlRk6U7wI3i8
	zboi8vAOYvUIVH84aGytFd8EEf4Q6OeXv3YQUkQpBQrKsoUcn2raK9hW0wV8NKL5
	1rXUhSrl8Abbnz+B1yM1vjrxghkUHjj0eiN0Eg4kirnLIum8gczj35l3fVj3cd7G
	gTCobXer/AoonDPEPtpPP37lRQB+bQcWDyXh/fZ32UKsc6aEgJm23yjWWp5NzI2s
	LceKgoo0fP/0VLQrjWNmk9gDAYKvatPDBbA==
X-ME-Sender: <xms:_bOoZ16-m764wDY1i7jULBZaU9_jRz_YfEkTLdMJB2TCQBeO9ejyqw>
    <xme:_bOoZy6e9l99EUmKD5CZlxM5YixRVi5y1Q6YK197iC2jWx53QFGayVpTMgz2OZXOO
    kR_94OJsYsuj4OgZPI>
X-ME-Received: <xmr:_bOoZ8cF5xtWPTdBwoNV_5Ulq-d970Rd0TVLVBPs1YTMCUscI7tACHrmfmt2pF0i_WZX482hkMJjKbjuZtu7HA5OggTJy_rQ6_211zv4p4DUKxvgKBCw4TQJxyADF30>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefheefudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecunecujfgurhephffvve
    fufffkofgggfestdekredtredttdenucfhrhhomhepufhvvghnucfrvghtvghruceoshhv
    vghnsehsvhgvnhhpvghtvghrrdguvghvqeenucggtffrrghtthgvrhhnpeduieeihfegte
    fgkedtieffkefhjeegieekffdtgffhgeevgeekgeejteeuffdvieenucffohhmrghinhep
    ghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepshhvvghnsehsvhgvnhhpvghtvghrrdguvghvpdhnsggprhgtphhtthho
    peehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehsohgtsehlihhsthhsrdhlih
    hnuhigrdguvghvpdhrtghpthhtohepshhvvghnsehsvhgvnhhpvghtvghrrdguvghvpdhr
    tghpthhtoheprghsrghhiheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhope
    hlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhr
    ghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdroh
    hrgh
X-ME-Proxy: <xmx:_bOoZ-Kr5Zp_wUBIy5Gq3D9hdMmpMyt2Xy3j-OaqIayNGcVFUDmBbQ>
    <xmx:_bOoZ5L_0vgannOO-XYbntStyjpHIU6l21lHuS4CtE7bsktEL3ja5A>
    <xmx:_bOoZ3yZ8jp9_A3xYmwssrtjATunkaRcbWRu_ZbJ_muw80ZQOFl8YA>
    <xmx:_bOoZ1JTHoix4UnSxbSoE5nSANSQu-UHV8D5B4v3TUtFMwLZSg8F5g>
    <xmx:_bOoZ3j3pETG60HsZ1PV1ESlGILEPfaGuw2LZ_-qxRihO4Gs6XcOtlJ_>
Feedback-ID: i51094778:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 9 Feb 2025 08:56:12 -0500 (EST)
From: Sven Peter <sven@svenpeter.dev>
To: soc@lists.linux.dev
Cc: Sven Peter <sven@svenpeter.dev>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] Apple SoC DT updates for v6.15
Date: Sun,  9 Feb 2025 14:55:58 +0100
Message-Id: <20250209135558.8243-1-sven@svenpeter.dev>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Please merge these DT changes for v6.15.

This batch adds device trees for Apple T2 SoCs used in pre-M1 x86 machines
as a co-processor and also adds cpufreq and PMGR nodes to a bunch of pre-M1
Apple iDevice SoC device trees.


Best,


Sven


The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://github.com/AsahiLinux/linux.git tags/asahi-soc-dt-6.15

for you to fetch changes up to ca96d759d8d24d90b1726c2cc7c568ff4728bb42:

  arm64: dts: apple: t8015: Add cpufreq nodes (2025-02-09 11:50:13 +0000)

----------------------------------------------------------------
Apple SoC DT updates for 6.15:

- Added device trees for Apple T2 SoCs
- Added cpufreq and PMGR compatibles and nodes for Apple A7-A11 and T2
  SoCs

----------------------------------------------------------------
Nick Chan (23):
      arm64: dts: apple: Split s8000/s8003 SoC DTS files
      dt-bindings: arm: apple: Add T2 devices
      arm64: dts: apple: Add T2 devices
      dt-bindings: arm: apple: apple,pmgr: Add A7-A11, T2 compatibles
      dt-bindings: arm: apple: apple,pmgr-pwrstate: Add A7-A11, T2 compatibles
      arm64: dts: apple: s5l8960x: Add PMGR node
      arm64: dts: apple: t7000: Add PMGR node
      arm64: dts: apple: t7001: Add PMGR node
      arm64: dts: apple: s800-0-3: Add PMGR nodes
      arm64: dts: apple: s8001: Add PMGR nodes
      arm64: dts: apple: t8010: Add PMGR nodes
      arm64: dts: apple: t8011: Add PMGR nodes
      arm64: dts: apple: t8012: Add PMGR nodes
      arm64: dts: apple: t8015: Add PMGR nodes
      arm64: dts: apple: s5l8960x: Add cpufreq nodes
      arm64: dts: apple: t7000: Add cpufreq nodes
      arm64: dts: apple: t7001: Add cpufreq nodes
      arm64: dts: apple: Add cpufreq nodes for S8000/S8003
      arm64: dts: apple: s8001: Add cpufreq nodes
      arm64: dts: apple: t8010: Add cpufreq nodes
      arm64: dts: apple: t8011: Add cpufreq nodes
      arm64: dts: apple: t8012: Add cpufreq nodes
      arm64: dts: apple: t8015: Add cpufreq nodes

 Documentation/devicetree/bindings/arm/apple.yaml   |  41 +
 .../devicetree/bindings/arm/apple/apple,pmgr.yaml  |   5 +
 .../bindings/power/apple,pmgr-pwrstate.yaml        |   5 +
 arch/arm64/boot/dts/apple/Makefile                 |  16 +
 arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi         |   5 +
 arch/arm64/boot/dts/apple/s5l8960x-air1.dtsi       |   5 +
 arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi      |   5 +
 arch/arm64/boot/dts/apple/s5l8960x-opp.dtsi        |  45 +
 arch/arm64/boot/dts/apple/s5l8960x-pmgr.dtsi       | 610 ++++++++++++++
 arch/arm64/boot/dts/apple/s5l8960x.dtsi            |  23 +
 arch/arm64/boot/dts/apple/s5l8965x-opp.dtsi        |  45 +
 arch/arm64/boot/dts/apple/s800-0-3-pmgr.dtsi       | 757 +++++++++++++++++
 arch/arm64/boot/dts/apple/s800-0-3.dtsi            | 172 ++++
 arch/arm64/boot/dts/apple/s8000.dtsi               | 162 +---
 arch/arm64/boot/dts/apple/s8001-common.dtsi        |   1 +
 arch/arm64/boot/dts/apple/s8001-j98a-j99a.dtsi     |  26 +
 arch/arm64/boot/dts/apple/s8001-j98a.dts           |   1 +
 arch/arm64/boot/dts/apple/s8001-j99a.dts           |   1 +
 arch/arm64/boot/dts/apple/s8001-pmgr.dtsi          | 822 ++++++++++++++++++
 arch/arm64/boot/dts/apple/s8001.dtsi               |  81 ++
 arch/arm64/boot/dts/apple/s8003.dtsi               |  63 +-
 arch/arm64/boot/dts/apple/s800x-6s.dtsi            |   4 +
 arch/arm64/boot/dts/apple/s800x-ipad5.dtsi         |   4 +
 arch/arm64/boot/dts/apple/s800x-se.dtsi            |   4 +
 arch/arm64/boot/dts/apple/t7000-6.dtsi             |   8 +
 arch/arm64/boot/dts/apple/t7000-j42d.dts           |   5 +
 arch/arm64/boot/dts/apple/t7000-mini4.dtsi         |   8 +
 arch/arm64/boot/dts/apple/t7000-n102.dts           |   4 +
 arch/arm64/boot/dts/apple/t7000-pmgr.dtsi          | 641 ++++++++++++++
 arch/arm64/boot/dts/apple/t7000.dtsi               |  60 ++
 arch/arm64/boot/dts/apple/t7001-air2.dtsi          |   1 +
 arch/arm64/boot/dts/apple/t7001-pmgr.dtsi          | 650 ++++++++++++++
 arch/arm64/boot/dts/apple/t7001.dtsi               |  65 ++
 arch/arm64/boot/dts/apple/t8010-7.dtsi             |  12 +
 arch/arm64/boot/dts/apple/t8010-ipad6.dtsi         |  12 +
 arch/arm64/boot/dts/apple/t8010-n112.dts           |   4 +
 arch/arm64/boot/dts/apple/t8010-pmgr.dtsi          | 772 +++++++++++++++++
 arch/arm64/boot/dts/apple/t8010.dtsi               | 108 +++
 arch/arm64/boot/dts/apple/t8011-common.dtsi        |   1 +
 arch/arm64/boot/dts/apple/t8011-pmgr.dtsi          | 806 ++++++++++++++++++
 arch/arm64/boot/dts/apple/t8011-pro2.dtsi          |   8 +
 arch/arm64/boot/dts/apple/t8011.dtsi               | 101 +++
 arch/arm64/boot/dts/apple/t8012-j132.dts           |  14 +
 arch/arm64/boot/dts/apple/t8012-j137.dts           |  14 +
 arch/arm64/boot/dts/apple/t8012-j140a.dts          |  14 +
 arch/arm64/boot/dts/apple/t8012-j140k.dts          |  14 +
 arch/arm64/boot/dts/apple/t8012-j152f.dts          |  15 +
 arch/arm64/boot/dts/apple/t8012-j160.dts           |  14 +
 arch/arm64/boot/dts/apple/t8012-j174.dts           |  14 +
 arch/arm64/boot/dts/apple/t8012-j185.dts           |  14 +
 arch/arm64/boot/dts/apple/t8012-j185f.dts          |  14 +
 arch/arm64/boot/dts/apple/t8012-j213.dts           |  15 +
 arch/arm64/boot/dts/apple/t8012-j214k.dts          |  15 +
 arch/arm64/boot/dts/apple/t8012-j215.dts           |  15 +
 arch/arm64/boot/dts/apple/t8012-j223.dts           |  15 +
 arch/arm64/boot/dts/apple/t8012-j230k.dts          |  14 +
 arch/arm64/boot/dts/apple/t8012-j680.dts           |  15 +
 arch/arm64/boot/dts/apple/t8012-j780.dts           |  15 +
 arch/arm64/boot/dts/apple/t8012-jxxx.dtsi          |  44 +
 arch/arm64/boot/dts/apple/t8012-pmgr.dtsi          | 837 ++++++++++++++++++
 arch/arm64/boot/dts/apple/t8012-touchbar.dtsi      |  20 +
 arch/arm64/boot/dts/apple/t8012.dtsi               | 281 +++++++
 arch/arm64/boot/dts/apple/t8015-common.dtsi        |   1 +
 arch/arm64/boot/dts/apple/t8015-pmgr.dtsi          | 931 +++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8015.dtsi               | 144 ++++
 65 files changed, 8531 insertions(+), 127 deletions(-)
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-opp.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s5l8965x-opp.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s800-0-3-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s800-0-3.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s8001-j98a-j99a.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s8001-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t7000-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t7001-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8010-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8011-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j132.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j137.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j140a.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j140k.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j152f.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j160.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j174.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j185.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j185f.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j213.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j214k.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j215.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j223.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j230k.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j680.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j780.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-jxxx.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8012-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8012-touchbar.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8012.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8015-pmgr.dtsi
