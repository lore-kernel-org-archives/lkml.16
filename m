Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C341A5B8B
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 18:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746212206; cv=none; b=uuWFilm/dS8m3olWzUXt/AWfV1hqZp4eRp5JcpPv3GGgv7YWCbh54xhrrUcSAcAX4HGLcoYcRSOJVvg5X1aAJlz7ruzRbour/zHnwiX2RjdQiG6c34zqZpBJolYkBwtBnsLdvqjV9agH78tVQVpu3iSmCPoLilZBitTqz9zZ6v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746212206; c=relaxed/simple;
	bh=KrHe6rCKK3XOCsAXyoXf55D/TclPHcujrKoExJak+yA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jqhozoWzXZMaVVWvqwovEZ79KyOj3xMSs1xYdaBt5g4pdF8w+SmUU5ROZMVOyXh2Vn6ulBsKmDyVf1DVDLcgtKHrjW6p44Oth8Q4dh5uqYCaiE5IF/ONqwMugJU697T2iuLVyZ+yhtshf5vxHm+CbKh+bF4jR7ycbnkihuVChXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=O+HDTF0Z; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="O+HDTF0Z"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1746212201;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tUiAFxy5skE5YbaQGck7/P6OD/BsoHInEzdKecMCezI=;
	b=O+HDTF0ZKrlcgDSH2aG1tqQioGarZrlIJK4k27dgFOtkvMydkwXvgJZBbyrVQyR6k3b5am
	r2+ui2bFVD1Q6tR+hXWaPDZR74+FIYY6vM70x1SAKVBhcN/AJuAY72Yj3DZXDaq+HzcfRU
	pKwCroElOvSCwKuddGlZbxdZgFteBigTDeB/JsISP0dLwku3rd3wCSNb34iAsLPMVDbxLd
	Wm4yM8xQJqRLHej/FlT6hNN1kxn3HmObVQtNXUvSr57cGShFD9cpH43kibT7G5id/EEBz9
	XeseAUUfXSnvKc5mK3fDftvIGVhpU03HgLIyhU8gpqO0slDB8N4+Yw8XhQCGXw==
From: Ferass El Hafidi <funderscore@postmarketos.org>
Subject: [PATCH v6 0/2] Add support for Xiaomi Mi TV Stick
Date: Fri, 02 May 2025 18:56:04 +0000
Message-Id: <20250502-aquaman-v6-0-f1af347d9709@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEQVFWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyzHQUlJIzE
 vPSU3UzU4B8JSMDI1MDUwMj3cTC0sTcxDxd00QDS8uU1CRjM0MjJaDqgqLUtMwKsEnRsbW1ALg
 dZXtZAAAA
X-Change-ID: 20250502-aquaman-5a099deb3612
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Ferass El Hafidi <funderscore@postmarketos.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Developer-Signature: v=1; a=openpgp-sha256; l=3633;
 i=funderscore@postmarketos.org; h=from:subject:message-id;
 bh=KrHe6rCKK3XOCsAXyoXf55D/TclPHcujrKoExJak+yA=;
 b=owEBbQKS/ZANAwAIAYSvy9DXiZoDAcsmYgBoFRVR/szR/TpYA4UMAtSFDh/afbLw8Y5+fSa1+
 D5c+joOzkmJAjMEAAEIAB0WIQQDAbw3+1VcrP15i+6Er8vQ14maAwUCaBUVUQAKCRCEr8vQ14ma
 A6vbD/0TBxtvuxxrCNr32NNZgcir3YpNz6VR0bjhJqK3uW+mtYLpkfCqDExpq5GmWte/wEiSJ6W
 7Ef0Btg2warElsyQimNq86FzDpF0RDsSowPolgztluHtnDJATqQwSqeiEn0impA6IwUO5kqs9ZP
 GDMMaeC43f88JLvRML7+FZTWaBzHZ5aykmvvwxyhXc+OzNgyPMvZ+7JYRNaPaj+Axq64rUcq9Ez
 0uD3qttT5lLOZEOJYXkRAJ0niu1/Iz/xs85McdABy40PFZoFMQPTC2NXXRCs+NBtyR91nqazaO1
 bpLzHKHg4diyHR3uBF3sceE+7B1a9KBjupisJ9AdHNdex1TxvTsBMQxPGGyrb6qpNd8QlBHy19F
 DVUfLGU4IsfedTDgNvNfB+fxFTt5mA89/i8gDTc6/aqiIXoGwqjhchFy1l2+DzdLMMIDX/UH31O
 b3qf7HhB1LuKwzQuvOUIb65uTSsYRje6lhGIS/GhX/c+/KT+RPumoK7N1Pw3m1b/rNK1AixVSlL
 YlZF96RZLFAvzWJfj/e0vrnvZQwZ47zjGbsEuhWMz7CLMF9uEnedFMFzKqQoRYoCfnM+/6fWeHP
 9xe7VN+28iFge5nNUGu4k4w0JtMf+KNFa3jGekXISeIV16obtYnO88aOf3YYqmjdWlZyuy2VDc7
 1sKTPHUa7otCO6Q==
X-Developer-Key: i=funderscore@postmarketos.org; a=openpgp;
 fpr=0301BC37FB555CACFD798BEE84AFCBD0D7899A03
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
 * Wi-Fi + Bluetooth
 * Android TV 9, upgradable to Android TV 10
 * Google-certified

There are multiple variants:
 * 1. Green PCB, manufactured in 2020, known UART pinout (helpfully 
   labeled on the board)
 * 2. Blue PCB, not much documentation about it, presumably manufactured
   between 2021 and 2023
 * 3. Green PCB, manufactured in 2023/2024, known UART pinout, some layout
   changes compared to the 2020 variant

Among these variants, there are many boards using multiple different
Wi-Fi chips.  Supporting all of them is out of scope for this patch
series.  However, there has been some work identifying Wi-Fi/Bluetooth 
since v4.  Some variants use a Realtek module while others use an
Amlogic module.

As of the time of writing this has only been tested on the 3rd variant.
It is believed that software-wise all three work mostly the same (if we 
don't count Wi-Fi/BT), but testing on the other variants would still be
appreciated.  Sadly, booting Mainline linux is slightly more
challenging on some versions of the original firmware.

The devicetree is based on the Amlogic P241 DTS.

Changes since v5 [1]:
 * add R-b from Martin (bindings patch)
 * remove mentions to analog audio in/out

Changes since v4 [2]:
 * add Acked-by from krzk (bindings patch)
 * Wi-Fi on sd_emmc_b

Changes since v3 [3]:
 * typo fix (`vbus-supply` in `&usb`)

Changes since v2 [4]:
 * fix SoB/From mismatch

Changes since v1 [5]:
 * remove useless nodes: cvbs-connector, ethmac, internal_phy, ir
 * add `amlogic,s805y` DT binding section
 * add S805Y dtsi: meson-gxl-s805y.dtsi
 * adjust DT `model` to "Xiaomi Mi TV Stick (Aquaman)"
 * explain the changes being done a bit more in the commit message for
   the DT patch
 * drop `clocks` and `clock-names` from pwm_ef (background: [6])
 * change sound `model` to "XIAOMI-AQUAMAN"

More information is available on the postmarketOS wiki page [7].

[1]: https://lore.kernel.org/all/20250319190150.31529-2-funderscore@postmarketos.org/
[2]: https://lore.kernel.org/all/20250203174346.13737-1-funderscore@postmarketos.org/
[3]: https://lore.kernel.org/all/20250203091453.15751-1-funderscore@postmarketos.org/
[4]: https://lore.kernel.org/all/20250201193044.28856-1-funderscore@postmarketos.org/
[5]: https://lore.kernel.org/all/20250131200319.19996-1-funderscore@postmarketos.org/
[6]: https://lore.kernel.org/linux-amlogic/20241227212514.1376682-1-martin.blumenstingl@googlemail.com/
[7]: https://wiki.postmarketos.org/wiki/Xiaomi_Mi_TV_Stick_(xiaomi-aquaman)

Signed-off-by: Ferass El Hafidi <funderscore@postmarketos.org>
---
Ferass El Hafidi (2):
      dt-bindings: arm: amlogic: add S805Y and Mi TV Stick
      arm64: dts: amlogic: add support for xiaomi-aquaman/Mi TV Stick

 Documentation/devicetree/bindings/arm/amlogic.yaml |   7 +
 arch/arm64/boot/dts/amlogic/Makefile               |   1 +
 .../dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dts | 262 +++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-gxl-s805y.dtsi   |  10 +
 4 files changed, 280 insertions(+)
---
base-commit: 1a30661c20dee51675a1ddee1b81b6a0e8580412
change-id: 20250502-aquaman-5a099deb3612

Best regards,
-- 
Ferass El Hafidi <funderscore@postmarketos.org>

