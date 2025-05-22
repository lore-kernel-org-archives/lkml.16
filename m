Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31DA944F;
	Thu, 22 May 2025 17:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747934762; cv=none; b=K74pda+1F6zGFQ68vOnB0C+5eM7G0Cda8o6rT+ahHtDucwb8BViEn987wxg9vDu3swkTSrwtbtiTbMucmHQF79pr7hqRj2bS26GRiR4qX0/YewhU13KycwHULCPTEaQ1pIrqGKkTnSEvOz1rjC+IHdxirHhyY6G0ybndt1JxOyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747934762; c=relaxed/simple;
	bh=uOQ7wxdf8FJNN3N9wmkzDgq7UlSNeZWKUtueMlHVw0E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vigw92O4xDKa+yjwZCiBpE2pwoTnsbKaJLS3FhaLTM0G7m+sVre8RaKt6jZU15Zwe11r+hXPYUe2LvzGBJ7bC8cSQvBSCz2bBEaCm/GyxR91E23uCT7JrfQtHKV1/sAVyA6tvjlN2gp9b/aaLnfSOEocqeerxXu+l0dPcSLUAlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=glGaKvm1; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="glGaKvm1"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-742caef5896so4515440b3a.3;
        Thu, 22 May 2025 10:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747934760; x=1748539560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R6zhe//+mK/YJYFppCQ8AQ0H2uErJNI3PakLy/YR+LI=;
        b=glGaKvm17x0Ba9X7bX08ywZp86J/DXSA4D9bCd51R/7oF4XjADGYsdI9TUR0FEdjIW
         Ebb/J/cL0jdSHiteVzcBotuPcGXcL0EubI3RDBHP9uTspXP2oh6KO2LfTqGsr7A7Z9fN
         Xus5qTApBGQdGTXzYMc8UIWvI7b8UaPk9Km6JCPNcNjhIrNCnMjKKKYcHh5nQgxDSqeb
         0YAj4gQmves489USqidtsPOwKbWDNhcrH7RMUc99Fg6YmS/8qz4YWaoq1v3sHekug1Ya
         78YXWg1ySlMnR3IwP0Ulw8xjy1cTcwick+nCP1tfNkvO1yW1InvsJ+4Z+X+fhc6brciC
         /BbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747934760; x=1748539560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R6zhe//+mK/YJYFppCQ8AQ0H2uErJNI3PakLy/YR+LI=;
        b=WYZANfrZitjHx8AH1YJpuDyWc0LsjmX09teqelA6mInfQJZ56XZ7sYYwI53JwMaRpf
         b7YFPOonGac96IGJPVyShyLdGstVlLPUn7JoHtvypwO/yhi846iY/sC14Vnt8y/7ZYHl
         ZcBhauajcJa08l1ZZqtsR9zB6AiVEGmM8RlaN8t8jUcH/FPXiy0yoV+Bx2V3J/Hwgeks
         6wtpg1o+g4zGA7GjBJLvpMsbOLJJyg2UJHycOOwZ26WjSm7YgRNGp4j4za+XzzYjeLTJ
         ahf/nMVqh+SxcicVsSbq7gngq5tirilRAx5SEnDu2Dh6MH48GPIak2LQWK+kzS3Li8z3
         rDAg==
X-Forwarded-Encrypted: i=1; AJvYcCUiRfUuaKgiPqNEu57gIqOa5aO7AL5qfQ+j33e19rZ9Jg0eW+z5yxXrmaD53NRDsp6vg0pYuKRcMa8R+0yS@vger.kernel.org, AJvYcCXPGfYrS88nhfbylavGSeOasJyYKcCiXIlTzGxwZl2TCliYKU1gbukAyQHyJK0pGOQuYU9ygtmGSCK+@vger.kernel.org
X-Gm-Message-State: AOJu0YxnkXJRAQSdkYVt2jxK9K0Lh4Z4ufudaAp7Ip5O914x8zQHkfim
	bZiiwCQ6eDwG10VGnVUWz/07QHjNIld200VSTsSMJ9BCrlioNhUE0300Hlbc3w==
X-Gm-Gg: ASbGncskmRT0xZ1WhoDpW97qKsSWX44/8Grs8nMFST/7IonqPW2SkH/3Udc3dX8c46T
	TerAwHFXF33iabWhoDgHve7wy8oHNW2D1kLduQH1P45kjQwIpEJADPFbh4c/NQiaOHif9dW3keq
	K08t5iG1QhLT+qIUa5Ehaqxr+YUSpE4lcmP2mqQQ9FUE+XxYjOp0FImpwodEvTUyf0ggTF39AYk
	j8tPliWnSfHK0czt/+7pdLwogPqKvas92RgY+yXQV4iQp6bFIp/ZYsK1Sb2FeTaexcQsUbUICS7
	LZVr4nJpRITyLLDy/foYI3fBDSKfRVv3shd5E0/IZOdrPg31Rfym58FS5pQxya5C
X-Google-Smtp-Source: AGHT+IGXvr9532fhWigFZ8cMVaxNwepNz/118pYhgTKFbN3mZan6kqoTUhTAU3oKtR/8/PWsVK+lfA==
X-Received: by 2002:a05:6a00:3694:b0:740:596b:eaf4 with SMTP id d2e1a72fcca58-742a98a31f4mr36947909b3a.16.1747934759815;
        Thu, 22 May 2025 10:25:59 -0700 (PDT)
Received: from localhost.localdomain ([45.112.0.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a982a08esm11471586b3a.112.2025.05.22.10.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 10:25:59 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-amlogic@lists.infradead.org (open list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Wayne Schroeder <raz@chewies.net>
Subject: [PATCH v3 2/2] arm64: dts: amlogic: Adjust USB PHY power supply references
Date: Thu, 22 May 2025 22:55:32 +0530
Message-ID: <20250522172535.302064-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250522172535.302064-1-linux.amoon@gmail.com>
References: <20250522172535.302064-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to the Odroid-N2 schematics, the micro-USB phy is powered
via a gpio-controlled regulator PWREN, updates the phy-supply to
correctly assign the power supply for usb2_phy.

Additionally, the USB3 combo port, which connects to the onboard
4-port USB hub, is powered by the main VCC_5V rail. Updated the
phy-supply to correctly assign vcc_5v for the USB controller node.

These changes ensure accurate power supply configuration for
USB components, improving hardware compatibility and power management.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
new patch
---
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi | 2 +-
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid.dtsi    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
index ad959f8bc1acd..9d63ab82302eb 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
@@ -310,7 +310,7 @@ &toacodec {
 };
 
 &usb {
-	vbus-supply = <&usb_pwr_en>;
+	phy-supply = <&vcc_5v>;
 };
 
 &usb2_phy1 {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid.dtsi
index 7e8964bacfce7..b105a8ae2fec6 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid.dtsi
@@ -437,5 +437,5 @@ &usb {
 };
 
 &usb2_phy0 {
-	phy-supply = <&vcc_5v>;
+	phy-supply = <&usb_pwr_en>;
 };
-- 
2.49.0

