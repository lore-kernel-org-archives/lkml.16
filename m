Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D101DEFEC;
	Thu, 17 Apr 2025 20:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744920894; cv=none; b=DADmCIe+JzRzvJ25Cv89Qgn9xvUr5sULnzngnsnuGJR5Ra+Vl1ovT3VeNiAqy/EtvrLvEkTwe54XXEJ83wG8nyqHyopmJdejH9csXjjW2JoPlpjTIhsqjSNyXyO9iAnMbELRwdM04UBwEN6KEOQXh5Bdcqh3FMFmyFqyz3Pt/ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744920894; c=relaxed/simple;
	bh=xe/XbPTNMWOUvfQhMFdfG53lPMV0wLrC8A5QFWBNKS0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NTOYzHGzf7Qqp/JBD2C17HeAc8Mw5m8CI2ALsEAg6adZ20vEW6Rt/w57vmbpSmp6Nvx1VxvdQl5yhOSvuK69PoR3+tBoGdbPNfQ44LlbIbH5ya/AAaYzhW9PEM6oamGCjrsht2lg6toJFCBtXNEQhPbPr79KY4CDpKfpD6wwY3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r10NY05y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r10NY05y"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8AB33C4CEE4;
	Thu, 17 Apr 2025 20:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744920893;
	bh=xe/XbPTNMWOUvfQhMFdfG53lPMV0wLrC8A5QFWBNKS0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=r10NY05yOB77fi0aqvmhXgWKsMRQseIxDak08DTixY5Ug5ulIVjlmAT/dsMJEZohq
	 EQ7/8OocWaHDz5HeLQjZ706zjtxL39pX8mAtbHIKU0feviQvdD2OCZEE8NerjPf2dz
	 vqAfJ6hkJCJfrMhp2EQ26bvkJb0c41/4+okWPSTLiKGRvyU5Zcs8EVg99yS1ewlnVC
	 /ZwSCUHe5zHk1TwdagE753PvPMLsyi0xP+/NDYg2hTi33sArShgR9gUWtBKb8y6Arb
	 haInWhBRNH4AOvAjNpm1cdyvAY8SapYD2/pqkC5lJIwzW0ZznIRVHkHk15PJagf0MT
	 Zn8MuFz/LKgDA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D486C369C9;
	Thu, 17 Apr 2025 20:14:53 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Subject: [PATCH v2 0/3] Generic SPMI NVMEM cell driver
Date: Thu, 17 Apr 2025 22:14:48 +0200
Message-Id: <20250417-spmi-nvmem-v2-0-b88851e34afb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADhhAWgC/23MQQ7CIBCF4as0sxYDg1DjynuYLipO20kEGjBE0
 3B3sWuX/0vet0GmxJTh0m2QqHDmGFrgoQO3jGEmwY/WgBKNPCkj8upZhOLJC5Jnq41WVvUG2mF
 NNPF7x25D64XzK6bPbhf1W/8yRQkpEKXt74RGu+k6+5GfRxc9DLXWL6oi6TqkAAAA
X-Change-ID: 20250415-spmi-nvmem-e08635316175
To: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744920892; l=1618;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=xe/XbPTNMWOUvfQhMFdfG53lPMV0wLrC8A5QFWBNKS0=;
 b=PkNjSV0OwrkOkY1LNHvy7Derfmr+FDdmzSUaInZjF/OLcjklbI9OTaW+BCAvz34VWtj4Ovewi
 RpF3HCcqh5pBfTFCg2faSAdPXskP15CraPq7sAW+xa/61BD5/tdzqB0
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Reply-To: fnkl.kernel@gmail.com

Hi.

This patch series adds a driver for exposing a set of SPMI registers
as NVMEM cells. This is used on Apple ARM platforms to store the RTC
offset and to communicate platform power state between the OS and
boot firmware.

The NVMEM cell consumer drivers will be sent in a further series.

Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
Changes in v2:
- s/pmu/pmic/
- Sort dts in unit-order, instead of t600x-unit-order
- Link to v1: https://lore.kernel.org/r/20250415-spmi-nvmem-v1-0-22067be253cf@gmail.com

---
Hector Martin (2):
      nvmem: Add spmi-nvmem driver
      arm64: dts: apple: Add PMU NVMEM

Sasha Finkelstein (1):
      dt-bindings: spmi: Add generic SPMI NVMEM

 .../devicetree/bindings/nvmem/spmi-nvmem.yaml      | 54 +++++++++++++++++++
 MAINTAINERS                                        |  2 +
 arch/arm64/boot/dts/apple/t6001.dtsi               |  1 +
 arch/arm64/boot/dts/apple/t6002.dtsi               |  1 +
 arch/arm64/boot/dts/apple/t600x-die0.dtsi          | 50 +++++++++++++++++
 arch/arm64/boot/dts/apple/t8103.dtsi               | 50 +++++++++++++++++
 arch/arm64/boot/dts/apple/t8112.dtsi               | 50 +++++++++++++++++
 drivers/nvmem/Kconfig                              | 13 +++++
 drivers/nvmem/Makefile                             |  2 +
 drivers/nvmem/spmi-nvmem.c                         | 62 ++++++++++++++++++++++
 10 files changed, 285 insertions(+)
---
base-commit: 2e0e70c95077172b29a5b13716c4b159d578e82c
change-id: 20250415-spmi-nvmem-e08635316175

Best regards,
-- 
Sasha Finkelstein <fnkl.kernel@gmail.com>


