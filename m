Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD9177111;
	Mon,  5 May 2025 14:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746455828; cv=none; b=OF3idH0MzL/fr64OCx18baPWisrnhq/BiMUyspZZZQju6YiL373lRUIFSMq+IlicFW2A9hRRM10RxkVWCPcwPICcO9XUIdKpwY25VJ+zb42WxLCkR0E63b0xdlM9HgZF5kQzaSEaCtDwx7TiUfX9NnZzcPZvCT6KQK+QpgAEjo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746455828; c=relaxed/simple;
	bh=tSLuXiKVJyFpMImJ3aYXZGYN5StQ3ITwC7qZRqgwLG4=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=lAXEdweVtrF7UjTkSr3CG1+VHq4yT++xiqlBseDzDSVrb5rkEkPFqYFHmNOQHVId9l5ZWP3170J11XgDbVWQFoyOobM7226K0kP6J1sVFz9eR3yMAro9dyLWV0gDIvOtmASkByT1K+q0YKvRxCiUJppBZ7LXmMsnTzjYmvivs14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AO0JiCHp; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AO0JiCHp"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cfe574976so27189845e9.1;
        Mon, 05 May 2025 07:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746455825; x=1747060625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=KsiYSQaqI5xt4hpo9n+HFHiwvaYjALuwKisRyJqehjk=;
        b=AO0JiCHpQrkK1xyvNhgcEb/jOyaAHv0v36eUCyuDO5/MFQRSwot5VD1D0CMVvR5Q5t
         rmBrpA/deVuAGSnjtChmvxF1j05K0MyydbgCnnictFiFo1r54oMI+393dKCXZouwVtFJ
         bAgkKk1EPUjI6dXYY9mQle9qFNPKc2v2E903vy80j2O1GYHmSgdNcxIZ47Pag+QJs2mt
         tvLjzVkfXAPFvj0Swg+u9FanwqGfHW+eWqV4VThWWOxMYTl/9+rVdwIbD6yFC9YPvy7x
         iidrSvYZ0D4VHD/devQbrrWA4IqMG4TfyFuVk08sc6ndGATljowiWz5bpiYOPrMA5iVE
         wv/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746455825; x=1747060625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KsiYSQaqI5xt4hpo9n+HFHiwvaYjALuwKisRyJqehjk=;
        b=kXNSm/Xl6vNkkZwlqabNJFFdNE2mg2bKHt65kGEa1TUNda+NBO6kb9PowrIVPmi/R/
         Jl657ZwmcgKuwaljpjKD7pwe0kqexMrCmK1ncFmO8X6Kryr/wsDIplDf/kAfMPZW8jOu
         ZpS4pTnZ/xg0LFokPZGwme0824vhLJG025E+u28p6HfL8eppStC9CsxruylU854Svz6E
         sik2SkrwuDicWgH08v5+WYPuwyoG+Ro0e+F/2eDqqj/RES7Kaf9Px8SoWKmLREhGz22O
         DAlg3qDSQj4gNVrXervYP9LeX4hOt2JHW2i8T2oLVe/ZmjEr/nRoofDq7cQOlK7wbJeR
         2+zw==
X-Forwarded-Encrypted: i=1; AJvYcCVlOIgeiSCLCqyZPShARWzjrYuXAoFyndB960OL22iCX7zDb4aduPpKX45JlmSH2nVxY49jq1g8M7HhCGu7@vger.kernel.org, AJvYcCX4R6aw3MbUfSoRN+XYkENvrs3Vvxn4GfWo9LYDIhEtQCRDJmqnAImRUGlFoqVoCo1zR+z5osZrAEE6@vger.kernel.org
X-Gm-Message-State: AOJu0YxBErxIPXbOMAzitQeC8ECOpEuEd079zyjigHp5cSH29UdH678i
	PZD3N5W+mMM7Z2ILlbpVl1+Tutq7elPsK2cxhuBZWYgujU463pCTX62Fwayt
X-Gm-Gg: ASbGncsNzXN/48B42Cz2dcsEmC1t0YdgNEnktxgXxIB3Uig5Bg1imhurpEIYcFCwfyi
	Capba+5d3WJPVwdr8PFS33OE+zi7PsgND9qW6f+MgsaEyPVry15NZudjpU89s1FpWLSBQRZyhyy
	wBdX5auGJhsN8yWtOnu5DDN9UABB6BdFv+mZcP6OSw0r5iK+vsDR4e/AKDtzQr6XL1JbvUS6Pp5
	ZDtd6LnV6vFZWv4Vx12/SDXt5y4Ykvjja963vzkYNPRRtTI3M6g2Rw//cRtEyKa+OIVdNN11p/Z
	Q+DTfJBxFijQ26x9DFQQZViH5sNMVCPbLYni7MqbyTETlw==
X-Google-Smtp-Source: AGHT+IFTHVGI2vR6SnT1zPMrtW+l6TfoGzFy6CYCvq/IBo0x6vMnqBeTsKkgU/UY5Tffx9spt+ecAQ==
X-Received: by 2002:a05:600c:3ca5:b0:43b:cc42:c54f with SMTP id 5b1f17b1804b1-441bbed4726mr115777665e9.14.1746455824548;
        Mon, 05 May 2025 07:37:04 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441ad8149afsm116568875e9.0.2025.05.05.07.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 07:37:04 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: amlogic: sm1-bananapi: lower SD card speed for stability
Date: Mon,  5 May 2025 14:37:00 +0000
Message-Id: <20250505143700.4029484-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Users report being able to boot (u-boot) from SD card but kernel
init then fails to mount partitions on the card containing boot
media resulting in first-boot failure. System logs show only the
probe of the mmc devices: the SD card is seen, but no partitions
are found so init fails to mount them and boot stalls.

Reducing the speed of the SD card from 50MHz to 35MHz results in
complete probing of the card and successful boot.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
The same workaround of dropping to 35MHz is also done with the
ac2xx dtsi; which has a comment about CRC errors being seen at
50MHz. It's probable this is the same although I forget now how
that diagnosis was done (or who did it, Martin perhaps?). I've
removed the FIXUP comment and added one about boot failures
being seen at 50Mhz but if you prefer to repeat the CRC comment
from ac2xx feel free to fixup when applying or I can send a v2
with that change. Links to original issue reports with user test
results [0] [1] are below:

[0] https://github.com/LibreELEC/LibreELEC.tv/issues/10027
[1] https://github.com/libretro/Lakka-LibreELEC/issues/2059

 arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi
index 40db95f64636..03b4b414cd5f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi
@@ -384,11 +384,10 @@ &sd_emmc_b {
 
 	bus-width = <4>;
 	cap-sd-highspeed;
-	max-frequency = <50000000>;
+	/* Boot failures are observed at 50MHz */
+	max-frequency = <35000000>;
 	disable-wp;
 
-	/* TOFIX: SD card is barely usable in SDR modes */
-
 	cd-gpios = <&gpio GPIOC_6 GPIO_ACTIVE_LOW>;
 	vmmc-supply = <&tflash_vdd>;
 	vqmmc-supply = <&vddio_c>;
-- 
2.34.1

