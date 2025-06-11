Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF67A239E81;
	Wed, 11 Jun 2025 08:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749629130; cv=none; b=r9y3EFTkkOLJNH0ztEA5jHOIFwfHoOaSAIOTU9ExHy2vBLSWBkJpJmhm4hKPgBtEGywZQoFO6+Y0d3qLbMg2MY9BzoRBKjT+bAzJWdXj9SzzPt58NqSwlhf2vAffdBIPiRlWjoK8VkZHHIoN/tYZkNpJhiQUs9Uo4bpWGqujfVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749629130; c=relaxed/simple;
	bh=DWsDJ9U/JC+qetxWQCrbdluirS5E+WJOviIcuHxHNds=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ffI7DP4/yHTHH0b9FW/KMLvwCwm6SDxG4SKRTY8jof8akzMFToB4Hgrxo7JNpm/IrFLa/OqsIFnMLAp06uAxJNtotb1G5W/2BQuyVDRv4inW8gs3WD9w10niqUHm6ZOjsBd55VPV6McE9S9nDpqf8EjLqJV1/k6UlD+mpYMTVAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ile+KnDt; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ile+KnDt"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22c33677183so51872115ad.2;
        Wed, 11 Jun 2025 01:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749629128; x=1750233928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KKbu1o95QNnYrie8L7Z3Lpp3SPlLgdV1zXb1UY/Ga98=;
        b=Ile+KnDtjXiuFZ3zOP3togdOctewEAll0CwpoSSGTrFI7wwkbAM6IDEuu6J+ovSSiF
         WwTuZPUGvFknk1GLRAJSzJ2+VniEHaKx8GTBHOGXoSbg69asD9pbLccn+zge9RSFrEkF
         jaQAoiTRe1x2FhcH67fn9aSxhsYeNscTEDpS3wPlW65TcZZS5tFjq7pGus2sPKlScXnd
         H5d+F05x171lgtubcEuq+BFqBl6z4ocea+IcFegT75avx9DefZnwZEHozNmngRIeoKLn
         8eQwGxqAeCd5MopPuzdCIiXr5BX1a/tDAWA6cQCS9dK6IiyfRTUqVd82l4ySgvtFhgOd
         3WIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749629128; x=1750233928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KKbu1o95QNnYrie8L7Z3Lpp3SPlLgdV1zXb1UY/Ga98=;
        b=toTDkE0n/VcQEC7iR/aaB88/OStllumop/NL7gT1s+GQsEpblkYLaX8cI93mFt7PPx
         RrplKO8BEPYvZ9VdBR+S+w6hCsZ1yh7Pl/RPCmFr3jHRPN5MipaZIIoXCCL+odlfRGVe
         HWnNJ0FjHY7tc93mH0IoLrnFOwO9BJyuIOZIiJ8oxm9+vtWSCm03QWliaMC9Slluphtz
         d4kwvKFh2caXXhHR08Nwli5r9oq7iZVFdO/gG2ThmVNs2XiNubu6gh8B1VofWzPURZL4
         en7ok5izP6+RZHLJyyPz4C1VsLD/1QngwN5QKx6OH/AmoTdgmOlEb+i5UOPVuV4k/Hsw
         Dh7Q==
X-Forwarded-Encrypted: i=1; AJvYcCU9rudPSxcEZRKDyvGQ2EcRo6NuMy4epdSZDjGuAmaxLE/DTIgQ4h6uI25tyrP0eoM2tgVY8CKcrN9/@vger.kernel.org, AJvYcCVMabZawBMZtky3SEsnQIcXZF2FFjcMFKQa1vx5YKm85C7YQ0ppHPKy8xFGzESvOqxR9XXuWn2G66RwAFJj@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3dBGo+iS56GdivPF4cs1uzdIbt84GpRYpiyfy4EBIsszEMTgf
	8kpjGmSnR8TUF1LzE/HLy/xwhda7TIYilARgR7roOG2d3ronugEOXuyF
X-Gm-Gg: ASbGncvvhV6zoPw0d/1JnlONpVgg9Kme/2l2OLOhrnOxp+YoLGQd7cqMKvbwW7Svg11
	3U1dJcYdgzymTwzDRZUQ4Hv6yH7t9K9oytaGHdZWkBzhJL6nZKqw+ch+Bq6Szn6eijteFr/WIyn
	mvzXxZP3RD4RutKK5G6hk0fxPz0YBmmGSFFG3V0r2QDvWrSmlcnD27izWY5nWiQeEhmMoFCGwSw
	MM+LV8jJwy3buJBISvHGDlSOTmm+LOcMJ1fOfo+Foa5g6qnfCAO7M4rbHwWg4K/mA2bX7noekAy
	C8bVurrc+3sba2nKZC2FIbfk3ONBP7nhUqsPZxxdrPM278kbPyKsSYFlj8zccs3Hbe6DhjJ11/u
	Ctu0zf9RWwHVrTzwtNlvi6P6RtryjK47GnF6ye7JjwsfMwZ6PdEmN3QNFFCvq5hd45OsPpHG8Jy
	DTdojccA==
X-Google-Smtp-Source: AGHT+IGeLq1+OHxDZevQ6QLgjMpafO8y79YrpEjfJFZArC1M6ed/pAiO8LgUIMW+68fVDNOZqDVkAA==
X-Received: by 2002:a17:903:3c47:b0:235:2375:7ead with SMTP id d9443c01a7336-2364269a903mr28755145ad.28.1749629128388;
        Wed, 11 Jun 2025 01:05:28 -0700 (PDT)
Received: from localhost.localdomain (2001-b400-e357-b8a8-7759-271d-6134-9aa3.emome-ip6.hinet.net. [2001:b400:e357:b8a8:7759:271d:6134:9aa3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2363ad90982sm21283835ad.220.2025.06.11.01.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 01:05:28 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: peteryin.openbmc@gmail.com
Subject: [PATCH v2 3/5] ARM: dts: aspeed: harma: add ADC128D818 for voltage monitoring
Date: Wed, 11 Jun 2025 16:05:12 +0800
Message-Id: <20250611080514.3123335-4-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250611080514.3123335-1-peteryin.openbmc@gmail.com>
References: <20250611080514.3123335-1-peteryin.openbmc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the ADC128D818 device to I2C bus 29 to support voltage monitoring
on the Harma platform. This enables accurate measurement of system
voltages through the onboard ADC.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 .../boot/dts/aspeed/aspeed-bmc-facebook-harma.dts   | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index 344e20394665..25b873ace2ea 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -529,6 +529,19 @@ eeprom@54 {
 				compatible = "atmel,24c64";
 				reg = <0x54>;
 			};
+
+			adc@1d {
+				compatible = "ti,adc128d818";
+				reg = <0x1d>;
+				ti,mode = /bits/ 8 <1>;
+			};
+
+			adc@1f {
+				compatible = "ti,adc128d818";
+				reg = <0x1f>;
+				ti,mode = /bits/ 8 <1>;
+			};
+
 		};
 		imux30: i2c@2 {
 			#address-cells = <1>;
-- 
2.25.1

