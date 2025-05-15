Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E3A296FD7;
	Thu, 15 May 2025 19:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747337985; cv=none; b=cTFvqwOhCCBZVvd1iZuJ6fo1kwmB9c6mgXbXNpUTBcvuasQK8Gm6bPYxOpjET83S4cnpTB+Myt+tz+kX1vbA5kOSskSDXbp9m5jCQ9q2AeMvIIAOmun9SQ5AqTSo41HEhJ60/IKNzEVzqHjjCLgOnmon9fJ0Epo3+kzrcMR83cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747337985; c=relaxed/simple;
	bh=msMkmhWnNvxKSFEWR1uGtz4EIsA1+5WBZuXVqWt8sas=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p5DX6oL943yX01ujS00diut63C9Lhb/NzYUAJTgQ0AdPdxAhAptiGeb58E8vjyFm2iPDG1+7nHj9HyfwOUkADHoZe7+3DNuFI1gHUbJ460NKaQTU4RlPM+PKv0YRE25O1U3Zvh8NiwNk1DfgWFGsYIRO2SPoRwoN7wTWj0cknbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C6pryVDq; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C6pryVDq"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54e7967cf67so1397434e87.0;
        Thu, 15 May 2025 12:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747337982; x=1747942782; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ztoxRIl32pn+lHQPC8pOhD5GWYf9JmH9tkdLgFwOVZ8=;
        b=C6pryVDqR0qR+kUJhD+CvMFf32llNcG6ePtljmJElnRW4Rn5T6dFqlBqPHBA6qo1DE
         HH6felFq/B+LscrH6BL7QUDZzJxtVcMYQDFGtl1u65yKpvSiJ/NpGgMACtZON7huLlAk
         hg1gaJohmIF4L4stBol/mIdYcqJyDjCKbaKO9pfbSZQyRkylYzNrGdgIifGC1PXFaJnV
         mJp4HPYe1xIe9lG3Q43UySkz16RkdJnw4uTJvbzAcW7kmeRphn1VWkdE1kK337o4VV4E
         26lh0/eObm1VGOkBeBW3K3lSREx+jHdktEeVn/fVrLOmIEvC7aTSYoJeLQsV/PRiDB+Z
         Xf6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747337982; x=1747942782;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ztoxRIl32pn+lHQPC8pOhD5GWYf9JmH9tkdLgFwOVZ8=;
        b=bQPlciORgLygf8lt7K5Ci9725Kao4ILfiNEFWrOnvNAIDRWV12bNWXEPJJZlvNkxSX
         38cgIT0Uxe6oXGB+4VXFx+OstjT0OjxUDAaJnu7lbPySfjR2V8Am8oHJHGnf47J/+P7Q
         X3zFIq9xdO09Vp12qRUen5kWr47eFV8ImWDTS5a+jK8gGRoJ+CLJ+WycwTwocZGbH7P5
         kfG1pPSnDMneiA5POm/aAhOlwJHa/5+KjdXmW0eSpwZqCk4CZG5u7lEDu1yInU3vp5xY
         eDYu2j1H3JVa42b01MuI9sLjmrffaxdT7/fE83LyxCe2DRFcOSND0GbpBv0UvVfeBNfI
         QWUA==
X-Forwarded-Encrypted: i=1; AJvYcCUFNuTYUZ08QZsaqgZSZl/ZlCyPj7RC1SqW+uatpk6RZTCvqok3UFtrLN0hCxf+Q0rbBv8TobiWOfhFmS+G@vger.kernel.org, AJvYcCX9ZJ1WTE9fpsXtw7+SGbDrZoRb7RJcdSoKMZHWfbiXm0xdlyyfpODVOFNmZa21W5P2PwpHyEm2yx1G@vger.kernel.org
X-Gm-Message-State: AOJu0YxOeCP3gL0oOBQe5RMgSqANqbManzyQ833D8N+m29sMt3LYkcNr
	rDxnqZhH6FipDCsFW0xvU0V0cC0+2D95e4T5JnCSk63ycFglyVRTrqcX5BePYtq6Hta94w==
X-Gm-Gg: ASbGncuVuJU2Dt2CaPRX+dRQgfMS0Fsp+eDpcC6qK2+JeTUe1J5D9eCK1WUoSe39N+Y
	pgVx63Nzco2UuoyGEiOLN6VvXyuJy2fYpmFGZ3YSaLT/BJKZFk9tdi9KUoadjy9TXYO4zt1RPpQ
	pviiIrNitCDoAictndNwYQSPG9Dc/TjfgVSJudSUqlJ7h8kLh44Pm8VJjoJ2ORsNa3wBHMck+Vw
	PG5soogq/02xAoWzzNG/e5MOOCqoa/Uk2nBC1IqPlmyXr65fPgJSiXT2J8W+mqa4eY5iPMuVfTk
	TIAkqSSCyFLGHy8gTBRRkmpgP8IP/TRM30v4c32oX2mEdIoBMnv9KgWBS2f47CNF
X-Google-Smtp-Source: AGHT+IG8cLoAANRKhgLA2jopEPXu1VbmIaAxbxB53ovg0VB8IyYML64L+msYGXFT89Y46+b8TfrE9w==
X-Received: by 2002:a05:6512:2286:b0:545:60b:f381 with SMTP id 2adb3069b0e04-550e71d2f97mr203539e87.29.1747337981672;
        Thu, 15 May 2025 12:39:41 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([95.167.212.10])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703f544sm72297e87.235.2025.05.15.12.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 12:39:41 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 15 May 2025 22:38:42 +0300
Subject: [PATCH v2 3/5] ARM: dts: vt8500: Use generic node name for the
 SD/MMC controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-wmt-dts-updates-v2-3-246937484cc8@gmail.com>
References: <20250515-wmt-dts-updates-v2-0-246937484cc8@gmail.com>
In-Reply-To: <20250515-wmt-dts-updates-v2-0-246937484cc8@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747337978; l=2298;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=msMkmhWnNvxKSFEWR1uGtz4EIsA1+5WBZuXVqWt8sas=;
 b=eTz+eURZ11lSQBB8wLmkqX8sOrEnqqh8QQVKtBYV1rEAp9Vq40gZQCOeYddbkV+3VIZVQyCmG
 AV5NJngmKJnDp+oavXWLfZ3WvzKSQN/l5a17x6zu540o6yLsQ7Wn/VT
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

Current guidelines recommend mmc@ node names, so use that instead.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 arch/arm/boot/dts/vt8500/wm8505.dtsi | 2 +-
 arch/arm/boot/dts/vt8500/wm8650.dtsi | 2 +-
 arch/arm/boot/dts/vt8500/wm8750.dtsi | 2 +-
 arch/arm/boot/dts/vt8500/wm8850.dtsi | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/vt8500/wm8505.dtsi b/arch/arm/boot/dts/vt8500/wm8505.dtsi
index 8c99374822f65352102df83a33a1ac072127ebc1..915adbf6e1e0ba69643eaf51b71222316c06ecf5 100644
--- a/arch/arm/boot/dts/vt8500/wm8505.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8505.dtsi
@@ -284,7 +284,7 @@ rtc@d8100000 {
 			interrupts = <48>;
 		};
 
-		sdhc@d800a000 {
+		mmc@d800a000 {
 			compatible = "wm,wm8505-sdhc";
 			reg = <0xd800a000 0x400>;
 			interrupts = <20>, <21>;
diff --git a/arch/arm/boot/dts/vt8500/wm8650.dtsi b/arch/arm/boot/dts/vt8500/wm8650.dtsi
index 2daff177979b482eac7e21ec1b17ba000ea69ef3..82eef7504364484dc88e3b439bdde905085b89e1 100644
--- a/arch/arm/boot/dts/vt8500/wm8650.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8650.dtsi
@@ -192,7 +192,7 @@ usb@d8007b00 {
 			interrupts = <43>;
 		};
 
-		sdhc@d800a000 {
+		mmc@d800a000 {
 			compatible = "wm,wm8505-sdhc";
 			reg = <0xd800a000 0x400>;
 			interrupts = <20>, <21>;
diff --git a/arch/arm/boot/dts/vt8500/wm8750.dtsi b/arch/arm/boot/dts/vt8500/wm8750.dtsi
index 60220d299e21101ce8102b376bec5382ef5ac0d1..5342b7fe4ef89a50f0a95a8515dc1b70461dd7c4 100644
--- a/arch/arm/boot/dts/vt8500/wm8750.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8750.dtsi
@@ -324,7 +324,7 @@ rtc@d8100000 {
 			interrupts = <48>;
 		};
 
-		sdhc@d800a000 {
+		mmc@d800a000 {
 			compatible = "wm,wm8505-sdhc";
 			reg = <0xd800a000 0x1000>;
 			interrupts = <20 21>;
diff --git a/arch/arm/boot/dts/vt8500/wm8850.dtsi b/arch/arm/boot/dts/vt8500/wm8850.dtsi
index 1efb8989931d0dab7b946c906b50292b09fc8bb3..f741a3e88d74ab4740f200b9b96201b3dc799bad 100644
--- a/arch/arm/boot/dts/vt8500/wm8850.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8850.dtsi
@@ -294,7 +294,7 @@ rtc@d8100000 {
 			interrupts = <48>;
 		};
 
-		sdhc@d800a000 {
+		mmc@d800a000 {
 			compatible = "wm,wm8505-sdhc";
 			reg = <0xd800a000 0x1000>;
 			interrupts = <20 21>;

-- 
2.49.0

