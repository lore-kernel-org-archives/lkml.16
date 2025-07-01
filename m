Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0C6306DDC;
	Tue,  1 Jul 2025 21:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751403663; cv=none; b=d58l2/IyKRKz5EFKD3tUxIfbHTpgF1X0F6/eyGsZfpB1S1Nse8YD2EmVwhjESUutHvd3RQGqZl/B/+K6Elsl/BuZyw90BGj6cDkGwDKdvujelZ33pavdKVQqL+k8ioS5/3fqvrQxVpZOkubRvnvX6q4v+JN1LrLes/+Y2tHI0sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751403663; c=relaxed/simple;
	bh=aRbQmuJEznSzQqeie4s6hlmRRF6K8U0zUi5L3MIF69g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OD191t38Z9Dtk2u3/QHOnkadxCKEfXZvnIIfxuFxErpDHOZLUgCFJkUHUXHGvJ/XURafhbnClO+Nl8GGMo3OmeCqEjQHpQrFtTWwcRmCX/iim3OmTfai1q+dCVYM1c0tYeSpNnxKH3Swio8gf497hRijKc4Gw/cwDW7QwBWe6d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LNPFUFSJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LNPFUFSJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63DA5C4CEEB;
	Tue,  1 Jul 2025 21:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751403662;
	bh=aRbQmuJEznSzQqeie4s6hlmRRF6K8U0zUi5L3MIF69g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LNPFUFSJw+8fliEKOZFRx8WDpMurpWOn8XesWlsL3UTfjyt0L2lJE8SkCXQqs0oTx
	 V3YHLQXOI0yQtcMdFeXhnREEbn1psBH47yAzKBO0XW0WscZRLecE03pAI9tHMv/o4+
	 BAViGm4cOPp/HYdNOzUKwIfVWSt+UQ1kqCHDY0DQ5hECfljRBlW0UQ4ba54hNFn/r5
	 OAyySAyfCfewmCwbHvIPNyhrJ0Es+fimgLgu+3Q+pzIFRFqX1YTOcfsAD0HBjhGAx+
	 iaW7PRwAK23EkUFvJ4/a8EcfDhLijbrbFwdDms/ifDXqznAsNF39gmx9NEMi5VkwfN
	 7U8mo7gFER0RQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 01 Jul 2025 16:00:45 -0500
Subject: [PATCH 6/6] dt-bindings: trivial-devices: Add undocumented hwmon
 devices
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250701-dt-hwmon-compatibles-v1-6-ad99e65cf11b@kernel.org>
References: <20250701-dt-hwmon-compatibles-v1-0-ad99e65cf11b@kernel.org>
In-Reply-To: <20250701-dt-hwmon-compatibles-v1-0-ad99e65cf11b@kernel.org>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
 Frank Li <Frank.Li@nxp.com>, Jim Wright <wrightj@linux.vnet.ibm.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev

There's a bunch of undocumented, but already in use trivial hwmon
devices. Most are just variants of existing trivial devices.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/trivial-devices.yaml       | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 27930708ccd5..38a542d816c9 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -39,8 +39,14 @@ properties:
           - ad,adm9240
             # AD5110 - Nonvolatile Digital Potentiometer
           - adi,ad5110
+            # Temperature sensor with integrated fan control
+          - adi,adm1027
             # Analog Devices ADP5589 Keypad Decoder and I/O Expansion
           - adi,adp5589
+            # Temperature sensor with integrated fan control
+          - adi,adt7463
+            # Temperature sensor with integrated fan control
+          - adi,adt7468
             # Analog Devices LT7182S Dual Channel 6A, 20V PolyPhase Step-Down Silent Switcher
           - adi,lt7182s
             # AMS iAQ-Core VOC Sensor
@@ -291,6 +297,8 @@ properties:
           - mps,mp2891
             # Monolithic Power Systems Inc. multi-phase controller mp2993
           - mps,mp2993
+            # Monolithic Power Systems Inc. hot-swap protection device
+          - mps,mp5023
             # Monolithic Power Systems Inc. multi-phase hot-swap controller mp5920
           - mps,mp5920
             # Monolithic Power Systems Inc. multi-phase hot-swap controller mp5990
@@ -299,12 +307,24 @@ properties:
           - mps,mp9941
             # Temperature sensor with integrated fan control
           - national,lm63
+            # Temperature sensor with integrated fan control
+          - national,lm64
+            # Temperature sensor
+          - national,lm95235
+            # Temperature sensor
+          - national,lm95245
+            # Temperature sensor with integrated fan control
+          - national,lm96163
             # Serial Interface ACPI-Compatible Microprocessor System Hardware Monitor
           - national,lm80
             # Serial Interface ACPI-Compatible Microprocessor System Hardware Monitor
           - national,lm81
             # Temperature sensor with integrated fan control
           - national,lm85
+            # Temperature sensor with integrated fan control
+          - national,lm85b
+            # Temperature sensor with integrated fan control
+          - national,lm85c
             # I2C ±0.33°C Accurate, 12-Bit + Sign Temperature Sensor and Thermal Window Comparator
           - national,lm92
             # Nuvoton Temperature Sensor
@@ -357,12 +377,38 @@ properties:
           - silabs,si7020
             # Skyworks SKY81452: Six-Channel White LED Driver with Touch Panel Bias Supply
           - skyworks,sky81452
+            # Temperature sensor with integrated fan control
+          - smsc,emc6d100
+            # Temperature sensor with integrated fan control
+          - smsc,emc6d101
+            # Temperature sensor with integrated fan control
+          - smsc,emc6d102
+            # Temperature sensor with integrated fan control
+          - smsc,emc6d103
+            # Temperature sensor with integrated fan control
+          - smsc,emc6d103s
             # SparkFun Qwiic Joystick (COM-15168) with i2c interface
           - sparkfun,qwiic-joystick
             # Sierra Wireless mangOH Green SPI IoT interface
           - swir,mangoh-iotport-spi
             # Ambient Light Sensor with SMBUS/Two Wire Serial Interface
           - taos,tsl2550
+            # Digital PWM System Controller PMBus
+          - ti,cd9200
+            # Digital PWM System Controller PMBus
+          - ti,cd9220
+            # Digital PWM System Controller PMBus
+          - ti,cd9222
+            # Digital PWM System Controller PMBus
+          - ti,cd9224
+            # Digital PWM System Controller PMBus
+          - ti,cd9240
+            # Digital PWM System Controller PMBus
+          - ti,cd9244
+            # Digital PWM System Controller PMBus
+          - ti,cd9246
+            # Digital PWM System Controller PMBus
+          - ti,cd9248
             # Temperature and humidity sensor with i2c interface
           - ti,hdc1000
             # Temperature and humidity sensor with i2c interface
@@ -390,6 +436,10 @@ properties:
           - ti,tmp125
             # TI DC-DC converter on PMBus
           - ti,tps40400
+            # TI DCAP+ multiphase controller
+          - ti,tps53647
+            # TI DCAP+ multiphase controller
+          - ti,tps53667
             # TI Dual channel DCAP+ multiphase controller TPS53676 with AVSBus
           - ti,tps53676
             # TI Dual channel DCAP+ multiphase controller TPS53679

-- 
2.47.2

