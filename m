Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189C61F2369
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 20:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738353935; cv=none; b=Qvu+C0AQ2FbvqjLEmR3DrOxBeEI8GwZNldOQYdB/yWZj7Sx+1lBxiCNM24hpSasJSGASdrps36Ty9+9j23dFGkDIPNWMo6sX3EDkdoYQAjwpn8u2m65g1MEQyGfOKl9SbaK6chrpBLwnevt1MogV5q1NhM/zjhOSqnRfg75NJ3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738353935; c=relaxed/simple;
	bh=v6L1s4uY8CUGCEsr2aiOibx4Eq0kdztum4jG4JFrF0g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aAsBOSEuEBU4l8g1gyyuGeOpTWgRfv/kHPUxTaUwoIeRJ5lWrFHXaoYywpTPIPeurGRTlc2auRsrT3JbCt7fCtkBl2ry954JUTwIrtJUt2SJOsOq10fAll2mza308ALBZ1q3Ur0BeAtXMUDaK7LmFyBcvXgN1uDawP8Z2jlXzJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=louedIrh; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="louedIrh"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1738353916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5H6l7E3aEB09Gr5Jf/JwrLVFXYb4G8ESjD4h4tWwSZ8=;
	b=louedIrhltO6zW6cURWyNiMUL7cviQQgu9NZtF/LIhyyvvEmkSV/hFPwaeBQy9obxK0YQk
	yZCCtF8i8eAi+qWv88jwnm4ciwmP6IBHJ+HD38ujpcKUHhEXNq3NBCNIGzhpCYoISEc+5Q
	5Hn8fzD2sYYXh1Y2aS8VQdX6iCkMzX3ex7IxFf+v3f8GGEPBHgLw3pLh/YRDp0RUBka81u
	/NXIlDw+lqYh0chABIANQyKzZ1Bwq5TRhCSB51JFqKHnFDnqMBJ+qEVVIBabxFdAtX7ivf
	DRnmDvaESEw9eaWr8arXbXJdETroANgev8G6V2H5osolpftI2DrLub3k6cvKQQ==
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
	Karl Chan <exxxxkc@getgoogleoff.me>
Subject: [PATCH 0/2] Add support for Xiaomi Mi TV Stick
Date: Fri, 31 Jan 2025 20:03:17 +0000
Message-ID: <20250131200319.19996-1-funderscore@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Ferass El Hafidi <funderscore@postmarketos.org>

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

Ferass El Hafidi (2):
  dt-bindings: arm: amlogic: add Xiaomi Mi TV Stick
  arm64: dts: amlogic: add support for xiaomi-aquaman/Mi TV Stick

 .../devicetree/bindings/arm/amlogic.yaml      |   1 +
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../meson-gxl-s805y-xiaomi-aquaman.dts        | 311 ++++++++++++++++++
 3 files changed, 313 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dts

-- 
2.47.1

