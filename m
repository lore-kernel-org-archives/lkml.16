Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF4F2744E;
	Mon, 26 May 2025 10:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748256347; cv=none; b=QGlcLHIT4d8EO0JIjluY7EuhfIiY4SVbXmmfwptsn1zasopUU59NDWVGhORDcMyfz5XFpvQYTqLi1h+vTvyKEUtMeCIvWafgwKVD3gcDRKi5d72c4RkYGe74DwaNFG7U9gHNEKM7xrJclwwbZY37TxijWAMS2FtzZYfWxRyVqLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748256347; c=relaxed/simple;
	bh=3zQVdTY3RzRyRFYvs+PWvDmD2Tf4e73Q9ALAMl05qOs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lhPrIPD2bJvORWh4RKlRKbCi+ctYMGmBDexLitNNxG2E1uzg+lhVHZ1zAZY5Bb5ttIUnOxFKgyhB6Y5U8A6PLE3iht1t7LEEjtKcQftu0s/wh+y40pALs+T3g4za41JQkXoKZv3WZyLL+MyOzBDHqDmdVdEmZqBof9Pk2A+fmBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=kQ0zBpOS; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="kQ0zBpOS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1748256342;
	bh=3zQVdTY3RzRyRFYvs+PWvDmD2Tf4e73Q9ALAMl05qOs=;
	h=From:Date:Subject:To:Cc:From;
	b=kQ0zBpOSTeCp9zmSNgVxYVe6DUMhoeFj4bzHyhKKNgEaC0x41XaotCE+LC9OTdxeT
	 VNpmmDjro9BnQuS+PPK07bJjOBhaRp2wwDFToCMhi6u5p0nvBI+LCD19OERY98D2BZ
	 eSukh+fGA2be2YRO68SbBjpg6aS4U8RH3fylYZRZHyXfnAS+Bj4fWX7Ux6hBOTAL0W
	 tt8uVtY2IKFjPJvvv9UeihkTPZKtGXzgTfhXjFXs2mqIo3xu3qkb+tUe++7C8pBHRs
	 IaJuxxFCjG/Qo4IARD6/agWjZWzt3BPKqKVmDYDeNtVmII+O7ccYJUETbZZezsVQhk
	 bFM6maFnHBb5Q==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0BB2C17E0FD6;
	Mon, 26 May 2025 12:45:41 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Mon, 26 May 2025 12:45:27 +0200
Subject: [PATCH] arm64: dts: mediatek: mt8395-genio-1200-evk: Enable Audio
 DSP and sound card
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-mt8395-genio-1200-evk-sound-v1-1-142fb15292c5@collabora.com>
X-B4-Tracking: v=1; b=H4sIAEZGNGgC/y2NQQ6DIBAAv2L23E0AQ0P9SuMBcbWbBmgBjYnx7
 5La48xhZodMiSlD1+yQaOXMMVSQtwbcy4aZkMfKoITSQiuJvpj2oXGmwBGlEgJpfWOOSxhRW2M
 GN9mWhINa+CSaePvVn/3Fib5LnZRLwmAzoYvec+maQFvB/+gO/XGcEiLC3p4AAAA=
X-Change-ID: 20250521-mt8395-genio-1200-evk-sound-5a88bcfa3e0c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748256341; l=2546;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=3zQVdTY3RzRyRFYvs+PWvDmD2Tf4e73Q9ALAMl05qOs=;
 b=ZSIMkwdTldNoIvD/1HqGZSYHaXkeOwJEfPcba/BsazHrveVFYT4y0LFHyG62ifL165HfNMSVf
 k5IkYU2pjHbBxr+ZzuzZJbLIFI78UayRb8qrN+thf5G7IoDdonSBXFp
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=

Add in the mt8395-genio-1200-evk devicetree the memory regions for the
Audio DSP (ADSP) and Audio Front-End (AFE), and a sound card node
configured to use the ADSP.
This enables audio output through the 3.5mm headphone jacks (speaker or
earphone), available on the board.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
Tested on a Mediatek Genio 1200-EVK board with a kernel
based on linux-next (tag: next-20250526).
---
 .../boot/dts/mediatek/mt8395-genio-1200-evk.dts    | 46 +++++++++++++++++++++-
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
index be5e5f339e811728e91b1ffec45ada25f9b0208b..9f0734731b5ef3c6b86693a389adc399707d5212 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
@@ -79,9 +79,21 @@ bl31_secmon_mem: memory@54600000 {
 			reg = <0 0x54600000 0x0 0x200000>;
 		};
 
-		snd_dma_mem: memory@60000000 {
+		adsp_mem: memory@60000000 {
 			compatible = "shared-dma-pool";
-			reg = <0 0x60000000 0 0x1100000>;
+			reg = <0 0x60000000 0 0xf00000>;
+			no-map;
+		};
+
+		afe_dma_mem: memory@60f00000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x60f00000 0 0x100000>;
+			no-map;
+		};
+
+		adsp_dma_mem: memory@61000000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x61000000 0 0x100000>;
 			no-map;
 		};
 
@@ -179,6 +191,16 @@ wifi_fixed_3v3: regulator-2 {
 	};
 };
 
+&adsp {
+	memory-region = <&adsp_dma_mem>, <&adsp_mem>;
+	status = "okay";
+};
+
+&afe {
+	memory-region = <&afe_dma_mem>;
+	status = "okay";
+};
+
 &disp_pwm0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&disp_pwm0_pins>;
@@ -976,6 +998,26 @@ &scp {
 	status = "okay";
 };
 
+&sound {
+	compatible = "mediatek,mt8195_mt6359";
+	model = "mt8395-evk";
+	pinctrl-names = "default";
+	pinctrl-0 = <&audio_default_pins>;
+	audio-routing =
+		"Headphone", "Headphone L",
+		"Headphone", "Headphone R";
+	mediatek,adsp = <&adsp>;
+	status = "okay";
+
+	headphone-dai-link {
+		link-name = "DL_SRC_BE";
+
+		codec {
+			sound-dai = <&pmic 0>;
+		};
+	};
+};
+
 &spi1 {
 	pinctrl-0 = <&spi1_pins>;
 	pinctrl-names = "default";

---
base-commit: 22d449bcd69e66f25fe847b678738950dcf9301e
change-id: 20250521-mt8395-genio-1200-evk-sound-5a88bcfa3e0c

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

