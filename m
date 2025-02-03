Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F7920C497
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 17:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738604697; cv=none; b=r+Ve37357wEJxwDp6sQ4Gsw9/R4w6mqUnvRIg+Xsmhf06ddj36yqw252rGKxk79nmXSHbPv/zKXRDc3+y1qtowFqpqiUKTT90Ocr613EnHvxMON1huh4fcZzQpkFU4fOv7NVOcDTVu8fqHg7Z04bzXf+5+L7cMtaTGuYlpHWd3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738604697; c=relaxed/simple;
	bh=DbUDVDtkkZceCtirbrMwJiUt2grZUOgxhaCxqgxOoMk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HfyX798uMOSGxVxK45zBe+ww9zwzFkxfGiS2nj5cUd71upA4I6ID5mpW9ql1Ny68CEcyYWYVPbdIKykq55JvD+RvXVfjbCB8h5jVwUVzHSQ1qrkBdCAj+GGtd01+CW7fx7cOPnbjTdqrOnTF5X0jDTZutLdJ3ZhDpW2VvqGj+7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=Qu0SnKJg; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="Qu0SnKJg"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1738604678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6Ox82t1s1wudEYSJtMWxiXluTW0Eijn+XKKN4GdXC50=;
	b=Qu0SnKJgk+fFUz3JPKuQKnCna/ZQ/U5UqRFT9m2amROG/u9Nz4V3gz8riHMqsbAHx28DAN
	lTejMbb7ZQvQdHj3uSu6lHooLCUw05pJXfz6Ajm3hG9ogdvHGQhgT4koyZrywXskXQkbcy
	PTR+lvRxaJUpgCQXD/EGfkVhwt4yG22LlCA7TZbyZ3e8si2GXX0rOI6NMo1ZVublS14Dwh
	8ndDmvTZ8eCBRA3BahfZL449niK8GznyqY0T4mE+npxcLg6wNx+Zg0sEf1Eq0K8TNEMz3P
	vRJsqwq0aeKKYotpIw9cG2w3pVE9u6LlgbLPMvN9SMOqfTsMO0u4+WFNeUzM/A==
From: Ferass El Hafidi <funderscore@postmarketos.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	funderscore@postmarketos.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Artur Weber <aweber.kernel@gmail.com>,
	Karl Chan <exxxxkc@getgoogleoff.me>,
	Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH v4 0/2] Add support for Xiaomi Mi TV Stick
Date: Mon,  3 Feb 2025 17:43:44 +0000
Message-ID: <20250203174346.13737-1-funderscore@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

This patch series aims to add initial support for the Xiaomi Mi TV
Stick.

Xiaomi Mi TV Stick is a small Amlogic-based Android TV stick released in 
2020, and known as `xiaomi-aquaman` internally (in the downstream kernel,
u-boot, ...)
Its specifications are as follows:
 * Amlogic S805Y SoC (believed to be mostly identical to S805X)
 * 8 GB eMMC
 * 1 GB of RAM
 * Android TV 9, upgradable to Android TV 10

There are multiple variants:
 * 1. Green PCB, manufactured in 2020, known UART pinout (helpfully 
   labeled on the board)
 * 2. Blue PCB, not much documentation about it, presumably manufactured
   between 2021 and 2023
 * 3. Green PCB, manufactured in 2023, known UART pinout, some layout
   changes compared to the 2020 variant

Among these variants, there are many boards using multiple different
Wi-Fi chips.  Supporting all of them is out of scope for this patch
series.

As of the time of writing this has only been tested on the 3rd variant.
It is believed that software-wise all three work mostly the same (if we 
don't count Wi-Fi), but testing on the other variants would still be
appreciated.

The devicetree is based on the Amlogic P241 DTS.

Changes since v3 [1]:
 * typo fix (`vbus-supply` in `&usb`)

Changes since v2 [2]:
 * fix SoB/From mismatch

Changes since v1 [3]:
 * remove useless nodes: cvbs-connector, ethmac, internal_phy, ir
 * add `amlogic,s805y` DT binding section
 * add S805Y dtsi: meson-gxl-s805y.dtsi
 * adjust DT `model` to "Xiaomi Mi TV Stick (Aquaman)"
 * explain the changes being done a bit more in the commit message for
   the DT patch
 * drop `clocks` and `clock-names` from pwm_ef (background: [4])
 * change sound `model` to "XIAOMI-AQUAMAN"

[1]: https://lore.kernel.org/all/20250203091453.15751-1-funderscore@postmarketos.org/
[2]: https://lore.kernel.org/all/20250201193044.28856-1-funderscore@postmarketos.org/
[3]: https://lore.kernel.org/all/20250131200319.19996-1-funderscore@postmarketos.org/
[4]: https://lore.kernel.org/linux-amlogic/20241227212514.1376682-1-martin.blumenstingl@googlemail.com/

Ferass El Hafidi (2):
  dt-bindings: arm: amlogic: add S805Y and Mi TV Stick
  arm64: dts: amlogic: add support for xiaomi-aquaman/Mi TV Stick

 .../devicetree/bindings/arm/amlogic.yaml      |   7 +
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../meson-gxl-s805y-xiaomi-aquaman.dts        | 285 ++++++++++++++++++
 .../boot/dts/amlogic/meson-gxl-s805y.dtsi     |  10 +
 4 files changed, 303 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s805y.dtsi

-- 
2.47.1

