Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01FBE15B135;
	Thu, 10 Apr 2025 00:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744246772; cv=none; b=op5XwhivrwfDPYSy/tEOQuNZqYK+A80U7XWMEIrae2ia0/FPBhHfJr+RtZQFyNb4Xxxzj7ZMpI3mQGRSbfmIxCYxtWmoF6wJfIcxynrVzNskELbipfmoGtjudvL5/tP3JZQe0osPu9zz25s8NW7oWZPgSVisc6Yy9PPbIC+ijCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744246772; c=relaxed/simple;
	bh=SWhM1Y9cbsDX3DmoQkxqoydODQzVCEIE8uwUZP2DfSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wk4qHUy0rHImJQhJjmqMDP4RmANk7qw4u3tOnqgButOURVv+qCT/ZG58ooDXzpav5EVtBvQHTXKe270AxEmwdVrifTo3jZFR9PFkHvscVqz8E+3s6fVFqwKQKAKYB3zIfOBkc4RpFpm7ITYuVPfEIhsU5YQiJ9rNtFQLvBFpi2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EZoMQdrO; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EZoMQdrO"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7c5a88b34a6so31083785a.3;
        Wed, 09 Apr 2025 17:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744246770; x=1744851570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DWzUEf6VPqNr8t6mjQWXtWJZNm2EpdCNeJxperBpJB8=;
        b=EZoMQdrOjdPfNpUP99pdIifiyZQqX0eOutUKtuVq0GJPfC7dtEeiJVHYY/2EGocw7D
         x+rmRRqSrMoiJREBF4TF3zwGnSWHKXa7K9upN4PsC9+iSydN5J+MB3nhZCQuMAmSNJCN
         WCNUoP75OitPwmjlcG6ITJttgnMOefdUuZDQ9ALWVbqdGU+GaC5E28PqqE1m75ZvQQHG
         8cT1GUn15VgdfYlJDy0V6WhV2SgLVk5jY7ncRT8DbRbzJUcNXn7yW6zbouZ/6/FspMrT
         JKF4d1UX3n/3/vgJAxYlscpNXRpRj87cf5Rukuk2CqXRo3f4gbWHU8LznaubDLEEaKis
         ro/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744246770; x=1744851570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DWzUEf6VPqNr8t6mjQWXtWJZNm2EpdCNeJxperBpJB8=;
        b=fpFAxOLrOVa+Z72MxktbZvXI1RCYSNkfkV/YhjqJ/IN/Amo1o1Ej0OZs/k37/EuLng
         iSD5P472kMleVMl4sR1eJbedQckJIaKu5IXJ2I8T6ygqMD6QayMq0yZw3u/o/Uls6LR/
         fcam9NjOaEWrTYjZt5h44gHcjYeozbniC++OtcsnJUEGRn/HidPpT//HgoUa9vjeVD2J
         kyOUmV1Zkvug7v5RnCX/q8NORzSc+v9ZNuPZtimS7OCdajJ5YQJ/ipLRvsyfikC4CcLG
         NjhBYZ1poGX8QJmWk+2mqjNDYBKF9+b9NmxNr+lQhzeMOr/ZLHWuOZOstOGfUU8UL710
         06+g==
X-Forwarded-Encrypted: i=1; AJvYcCUg6ehZujgNamb1Kwhnd45ccEYGmc99nvSPE/AwZXBDvSyM9xd7XNIj8H+AUx1Ef/JKoFaf6TUzbn9ZB0D0@vger.kernel.org, AJvYcCUtbUjHQlBXO/BTCM9r1W1M/4H/LfC60LvYEaWbvIRej8/hCkzIQpddpOBpEkeInXcip7CWDa6iMn4I@vger.kernel.org
X-Gm-Message-State: AOJu0YzhHX9Sb5wZ85T1rB/ESR4yl5lSg8PAUDtlEm5lHXcfTldhkPVS
	zKJxmnudK6Mk3V/HM9hLenRSoNJPfPfdQBWhmCW8Azn+tEfsj1h3
X-Gm-Gg: ASbGncuFK3obWaDGQbrQOoVRsUHeKt6++r0PvhHFeyrsvyPSrTiETEOvPdnYXRPMRqh
	sbZYbALmaS3+VW/6HpYweSPKyF4qzYCBHxYYn/tl+58wFHMaUmkXIJ1ppf5fgP/UaRwBO2Rzpmd
	Z0U9S1j+4VuQL00LgGAWtzyEfbOOjNCE0IuSaed5lrwDUtC2pZ/OX6hPHSNnNJcOMKD1b+80AMg
	9WhN2AbIy72oRHlsC9qjaIqf0Saa1DitwuVlZNNwgCzrPBHFi+n9DBWOMArDvsmqOhtlOtf/cu1
	cnbWpsvQB4uLMvE5FLpyuBMUL/9uo7pZkYtWkqrCm7UzyQGQaPhaDYFw/WpzxSLtSvPrRTA8Mhv
	kQMKOV4s7m9u4+o4=
X-Google-Smtp-Source: AGHT+IEOUsk3UgJ2ZjGZnVGL3oNGyliUXyIV9Ti6Sx7NFXjHWz4LHaoRQc2J2+koxguq/sC09DyYdQ==
X-Received: by 2002:a05:620a:3944:b0:7c0:b523:e1b6 with SMTP id af79cd13be357-7c7a765becbmr144726185a.11.1744246769928;
        Wed, 09 Apr 2025 17:59:29 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a895180esm9590685a.46.2025.04.09.17.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 17:59:29 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/9] arm64: dts: imx8mp-beacon: Fix RTC capacitive load
Date: Wed,  9 Apr 2025 19:58:57 -0500
Message-ID: <20250410005912.118732-3-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250410005912.118732-1-aford173@gmail.com>
References: <20250410005912.118732-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Although not noticeable when used every day, the RTC appears to drift
when left to sit over time.  This is due to the capacitive load
default being 7000, when the hardware is really using 12500.
Fixing this setting to fix the drift.

Fixes: 25a5ccdce767 ("arm64: dts: freescale: Introduce imx8mp-beacon-kit")
Signed-off-by: Adam Ford <aford173@gmail.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi
index 15f7ab58db36..88561df70d03 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi
@@ -257,6 +257,7 @@ eeprom@50 {
 	rtc: rtc@51 {
 		compatible = "nxp,pcf85263";
 		reg = <0x51>;
+		quartz-load-femtofarads = <12500>;
 	};
 };
 
-- 
2.48.1

