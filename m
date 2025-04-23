Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7699E28C5C5
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 17:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745428846; cv=none; b=tjo9uXD2L/ojmIR23x/0b0mZZpKUUH9SHmAWNjZOWe3QoupZ3GnuIWIpYy48noJprNiCSMSu38IsGtJYdpUd80fbK8CCQ1XeaVbnlssU/qhJWMwdVETmVBiVvJ4ThEVMMX7QfybcQa0oofCGGhLVpdsxEMlyqV8WrPO9YLN/SoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745428846; c=relaxed/simple;
	bh=iHQLMzaHxLYSZFGfaOlPWm3TXsT56q46iJUyFJPFR10=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pQL1aZL+piVbwG2wqDHqfguR1Pl3244fGqze7QnIAAAoHALhriqSSBvfbQ/K+QuM8+4MA3Ba4sR5uLN6c3pGKJ1J6mOq1cu2fh8lda+AhXSSr3WvmXk1KVPn+5qhHM39QhQAoktS8UNuOv8FXvLK7R9RWRIeU2FzQCApPgEQRFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=XX9DXs9D; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="XX9DXs9D"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so10205555e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 10:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1745428842; x=1746033642; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jSUESSRGCpyu+rpBjRVqzqkxBgsZWzSlb7G5QVFU3YA=;
        b=XX9DXs9DszmiX8ngWKdNrqUtnXGDU/xdXzSKN1DyxDm4b88qYNdn3xAoscwb1XTPz5
         K4NxsEWWKDcdsvmfLeReEgVQoIJgBAhkmIjSW2Ry5omYrd59QHr4zUAJT9PSM739EKtN
         39NTwSZ5ITeebrDCi68EAK4eZxlhA9P3Ytonr0/XhdzLDHwWMnJz1ryV68NqkArymmFT
         r6R7Ns8Y9ctH9wnCcsfOjI1WKHuYeIP9/RSK9phTUcicKbjo7T+Fl7zsZNz1lgbkBPxx
         I6eO6DkA3wDZ84Vkm5gJ34uMwviYDPC/mIHYpjcSvKYbOCUBTDQx58xwdKTXXcBwDCJn
         VQNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745428842; x=1746033642;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jSUESSRGCpyu+rpBjRVqzqkxBgsZWzSlb7G5QVFU3YA=;
        b=RtDbcNWbYsNoEmixLOPqgtbdzFZx2K6Qv3iQQMNH80xz/oH6ubA/Szy7G27E3NkmIq
         RdpzgI3kLMr8LxiuREPi78FdyYHplr8KNm74OQiTl73rRj7Z4fuNWnGAbbvvUGlB1XRA
         I8OzSfaOSAAFLRX1zvO0DV9PkLJ5lhIjjIH3I3z1XixXLvmsA2Vms5qQ0KTXxAW06ZVs
         zotYEeTLLr8HtTUTA0pY7uFU4eifu1u7Sxv+hmbvyKFpOcCTrSa3e5fH2LFHogYmDUe+
         h23ja25kTPHeCZIHqeD13AHp7gv5ovn4FTM2SakTYJItVKA7INspHRJEfualWdywB4hb
         ui5g==
X-Forwarded-Encrypted: i=1; AJvYcCVXSNWWiQmvbT4WPRrXpOExJ4BB01QwAEfvl3u3aYEJVcaPU3t2cnIfOvGSPxBcx6QXRoF0S2F6C3oudfM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2kbE0w6Znf64xvEH79z87RPra6yq3ODDnGmOYlw4pZQyz0Kbc
	gl1LjsA2A7Cfnk867ZCzdMbdhw/GZA5wGXOyxqqavYfIDQhfI4X9Rbcyp3ZSvvk=
X-Gm-Gg: ASbGnctMg1KEulHVZs6LTEIhV0xVEBtUlhmioYuI88db5kMCXFPTjsk9tdKEl9f4wfE
	NkrpSgQ4C+SoSIFP1q02Mvr3W6sgjR3fX0X0wRY+bFptytq9tQ8w68uYcVEeMrGqhpyPG3wjc0g
	bJAM+BRRqI0l87FQwN9lf5iFXI1KJ+EeI8Fl6FRIXH/0WNzVMhAmKmUe+NblDEZXgZbI4wTbLoi
	VDcgtSM6Nld4lYDDGwFhQTNPPk1P/SrgfWXuHduDbfQFyHQ+c7fM++LyPtGErCjt+tWt5ap8F6Z
	X4ISST8/DlAkiRHilJYXV1oOip6F2D/1h8FMu3/HtxE=
X-Google-Smtp-Source: AGHT+IGNrzHW1MMexsfwjLATKMrNMWSsxOAcs/cvthyNt3eB10C309nqJDj5AYKSBQ4rWCj+bv6jEg==
X-Received: by 2002:a05:6000:250a:b0:39d:8e61:b6eb with SMTP id ffacd0b85a97d-3a06c6baee3mr18451f8f.1.1745428841842;
        Wed, 23 Apr 2025 10:20:41 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-44092d18433sm32940945e9.1.2025.04.23.10.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 10:20:41 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Apr 2025 18:20:22 +0100
Subject: [PATCH v3 5/5] arm: dts: bcm2711-rpi: Add HEVC decoder node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-media-rpi-hevc-dec-v3-5-8fd3fad1d6fb@raspberrypi.com>
References: <20250423-media-rpi-hevc-dec-v3-0-8fd3fad1d6fb@raspberrypi.com>
In-Reply-To: <20250423-media-rpi-hevc-dec-v3-0-8fd3fad1d6fb@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 John Cox <john.cox@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>, 
 review list <kernel-list@raspberrypi.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: John Cox <jc@kynesim.co.uk>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

Add the configuration information for the HEVC decoder.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi | 4 ++++
 arch/arm/boot/dts/broadcom/bcm2711.dtsi     | 9 +++++++++
 2 files changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi b/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi
index c78ed064d166..7984caa861e6 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi
@@ -68,6 +68,10 @@ &hdmi1 {
 	wifi-2.4ghz-coexistence;
 };
 
+&hevc_dec {
+	clocks = <&firmware_clocks 11>;
+};
+
 &hvs {
 	clocks = <&firmware_clocks 4>;
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm2711.dtsi b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
index c06d9f5e53c8..bdb80f3611ca 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
@@ -617,6 +617,15 @@ xhci: usb@7e9c0000 {
 			status = "disabled";
 		};
 
+		hevc_dec: codec@7eb10000 {
+			compatible = "brcm,bcm2711-hevc-dec", "raspberrypi,hevc-dec";
+			reg = <0x0 0x7eb00000  0x10000>, /* HEVC */
+			      <0x0 0x7eb10000  0x1000>;  /* INTC */
+			reg-names = "hevc",
+				    "intc";
+			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		v3d: gpu@7ec00000 {
 			compatible = "brcm,2711-v3d";
 			reg = <0x0 0x7ec00000 0x4000>,

-- 
2.34.1

