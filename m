Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B38D24A067;
	Sun, 27 Apr 2025 08:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745742386; cv=none; b=jhvg1+NQ5DgVNm+m/BYu5ckCJiTFAFi1zPuxHAmXdcgYY57N9gTc0OS6Qyqez9WDxAymIcYWdgOs1XMP/GExiSVmxSR4V3/fWi9Oq23M4gfkUXWuD+ZgWgDE/mFDAl2f3jwTIQ0rM6gfKEJDWaNHvGP+fNh+puEPxAs5DADRwUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745742386; c=relaxed/simple;
	bh=Ea/fJvP/2FdD4QRx6RhBWZrz6FDzUvgx1ZYUhh+WzsU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZEtdbEueNnjRFZGJjNzJC98IMsg62wNhLvc1DOaLyRtHO34NmoY0nu4wDm5szQelYxhzhl6YObLZlJ2+7j00HG3h7sgh3yVtvx7UfwWmiVrh8BdHJHTyVyLS7fw6/zagX2Z43x+M5DwyOGaNCTv0dDnYlOaNBMY1/CRhAvuwsN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YqXFzaxa; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YqXFzaxa"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-736c1cf75e4so3182875b3a.2;
        Sun, 27 Apr 2025 01:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745742383; x=1746347183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bn2eDJZEGPHUnz8R0+iyYHsVW148wSZoydE0VfHZX2w=;
        b=YqXFzaxaErHNMih21mL/1Za8NmO/79I6iaIL9LVseZPTrCVmMpUXTcEs9AvUIRuNfy
         i8S0B3Eb4YQaTVdEwUjgUTvK7Q65nIhDGTSmfjjiAAq9+B2ZKI2ugD5KcCrf6UgJdlA0
         XrzcvcXmmKXxz9Y+fB6X7NFz8Ghip4HIz+jOdvohsM1goY7Pr+tUPJ548ANVreG5/NQ3
         aGlKUvFjiCYSseZpoIJkg2KSfenRRKNwzNrsrA9KWBpz+FuiZVEP8jvsVMHqdpmssu+V
         UeXI23/BE3NPckGBV6/B7e4f2yI/x63qz+cY1r/agqgEjhCaqDz9vgc2AH+s+J1RjDzJ
         BDEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745742383; x=1746347183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bn2eDJZEGPHUnz8R0+iyYHsVW148wSZoydE0VfHZX2w=;
        b=MQdQyNJNDiRu8x6QYosnQ149kt6reo5UgPApo6lpSQ3Hgf3T/Y2lyNDMSYb6tVu3+Q
         +b/GKVfNMQ8M15Bf66NTnDcyhLIkfFNVXpDNVbZ1nZCMa70LtWXnj/6baqKS/EWHcajC
         SKZ1kPMwQ5/eYqpAr/qVHEv34eQt6Npug6C/vjXuUcFOieYkYi3Wecu9zwml3wMpwxJ1
         dyLQI35GtG48ERL0+U3WjwDFnkmJngzOcJNQHH9SyilDrE8OmNI5XqAdxuXN8F337Po4
         PsQYrE2JWN/tVLWhtMnFDb7crQBF0nznmF/EtNHG+UAOWsBTLH9ZNa/wCiC/+m7ekYJU
         Tg1w==
X-Forwarded-Encrypted: i=1; AJvYcCUSsDlRBswj/9Pe9hAuADoWphSa1lAS99k8LLnr6UsBop0+X4QHWRCNMm76rQOUNu4CCFIO5VVqvGDvRy8G@vger.kernel.org, AJvYcCUv0KKt8GNHqyq1Vcy573O0S5U7wdXfArYGPmNymshPwHNTgXGx6NtrqPkcy1yDlaIek2PfTJm/1VY3@vger.kernel.org, AJvYcCWGFsJEYl4IctX2moDGaY+lBsx03xeFZJJnTw2Bbyh9snvrWSakgI1UmO3WUWi4HsS7d2NxSzKIP2zy@vger.kernel.org
X-Gm-Message-State: AOJu0YyClDDSn3p0eTiGfiwEU9SLPhWd8EEpeeEpLtWIh6aP8mp0PcMi
	mHM3HBr2GWg/9SEZkFbk1jmGLDxB9VyAkKnx2n3ytHQLoXz38Qeg
X-Gm-Gg: ASbGncvwwHqmFZ7Rxp6AUPXM/iK0GdKliheuGhk5yPp3K1zMxeDWt8558cxXxDOoTY1
	kRGhOjhr38ehmzzAEWU9/58tJ2tuP+MfpZ6bcx+3eRad+hlKJLo4iU5Al4faApGa3QVSJeYe8RS
	iVlceMwTVHZxU70f/ipBXrAV5mDa0E/+cWFwlrSoz8Ivn6dvWgsCPrmUCGSRGM9+Dx+BLDOyU6k
	lk9PgrkUl4ifRDPUrCF+K1YuKY11JmZa7cw/DPICIxHSZ61sAF+MCQaBx/aXhgAwzBymvp7sVOY
	UF3A5gga4vL60CNMteMWC6hiAdS9OmdnxrLN0Hf7jmikMCzdT1pc5Q==
X-Google-Smtp-Source: AGHT+IFzZAZuflFPkU3MqoWhUEwdg0j/wbO+odL4l1iegaUwoMiDpQ56iI/0hVPdquw4PE+EsQUkfA==
X-Received: by 2002:a05:6a00:3e12:b0:736:32d2:aa82 with SMTP id d2e1a72fcca58-73fd8e548b8mr9932987b3a.23.1745742383453;
        Sun, 27 Apr 2025 01:26:23 -0700 (PDT)
Received: from localhost.localdomain ([14.171.43.210])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e2549f570sm5900852b3a.0.2025.04.27.01.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 01:26:23 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: andy@kernel.org
Cc: geert@linux-m68k.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	christophe.jaillet@wanadoo.fr,
	corbet@lwn.net,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Nam Tran <trannamatk@gmail.com>
Subject: [PATCH v8 4/5] docs: auxdisplay: document TI LP5812 RGB LED driver
Date: Sun, 27 Apr 2025 15:24:46 +0700
Message-Id: <20250427082447.138359-5-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250427082447.138359-1-trannamatk@gmail.com>
References: <20250427082447.138359-1-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The driver provides sysfs interfaces to control
and configure the LP5812 device and its LED channels.

The documetation describes the chip's capabilities,
sysfs interface, and usage examples.

Signed-off-by: Nam Tran <trannamatk@gmail.com>
---
 .../admin-guide/auxdisplay/index.rst          |  3 +-
 .../admin-guide/auxdisplay/lp5812.rst         | 79 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 3 files changed, 82 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/admin-guide/auxdisplay/lp5812.rst

diff --git a/Documentation/admin-guide/auxdisplay/index.rst b/Documentation/admin-guide/auxdisplay/index.rst
index e466f0595248..5d627f067c77 100644
--- a/Documentation/admin-guide/auxdisplay/index.rst
+++ b/Documentation/admin-guide/auxdisplay/index.rst
@@ -5,8 +5,9 @@ Auxiliary Display Support
 .. toctree::
     :maxdepth: 1
 
-    ks0108.rst
     cfag12864b.rst
+    ks0108.rst
+    lp5812.rst
 
 .. only::  subproject and html
 
diff --git a/Documentation/admin-guide/auxdisplay/lp5812.rst b/Documentation/admin-guide/auxdisplay/lp5812.rst
new file mode 100644
index 000000000000..58d716f899d1
--- /dev/null
+++ b/Documentation/admin-guide/auxdisplay/lp5812.rst
@@ -0,0 +1,79 @@
+========================
+Kernel driver for lp5812
+========================
+
+* TI/National Semiconductor LP5812 LED Driver
+* Datasheet: https://www.ti.com/product/LP5812#tech-docs
+
+Authors: Jared Zhou <jared-zhou@ti.com>
+
+Description
+===========
+
+The LP5812 is a 4x3 matrix LED driver with support for both manual and
+autonomous animation control. It provides features such as:
+
+- PWM dimming and DC current control
+- Slope time configuration
+- Autonomous Engine Unit (AEU) for LED animation playback
+- Flexible scan and drive mode configuration
+
+This driver provides sysfs interfaces to control and configure the LP5812
+device and its LED channels.
+
+Sysfs Interface
+===============
+
+LP5812 device exposes a chip-level sysfs group:
+  /sys/bus/i2c/devices/<i2c-dev-addr>/lp5812_chip_setup/
+
+The following attributes are available at chip level:
+  - device_enable: Enable/disable the device (RW)
+  - dev_config: Configure drive mode and scan order (RW)
+  - device_command: Issue device-wide commands (WO)
+  - sw_reset: Reset the hardware (WO)
+  - fault_clear: Clear any device faults (WO)
+  - tsd_config_status: Read thermal shutdown config status (RO)
+
+Each LED channel is exposed as:
+  /sys/bus/i2c/devices/<i2c-dev-addr>/led_<id>/
+
+Each LED exposes the following attributes:
+  - activate: Activate or deactivate the LED (RW)
+  - mode: manual or autonomous mode (RW)
+  - manual_dc: DC current value (0–255) (RW)
+  - manual_pwm: PWM duty cycle (0–255) (RW)
+  - autonomous_dc: DC current in autonomous mode (RW)
+  - pwm_dimming_scale: linear or exponential (RW)
+  - pwm_phase_align: PWM alignment mode (RW)
+  - autonomous_animation: Config autonomous animation mode with aeu number, start pause time, stop pause time, playback time (RW)
+  - aep_status: autonomous engine pattern status (RO)
+  - auto_pwm_val: pwm value in autonomous mode when pause the animation (RO)
+  - lod_lsd: lod and lsd fault detected status (RO)
+
+Example Usage
+=============
+
+To control led_A0 in manual mode::
+    echo 1 > /sys/bus/i2c/drivers/lp5812/xxxx/lp5812_chip_setup/device_enable
+    echo 1 > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/activate
+    echo manual > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/mode
+    echo 100 > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/manual_dc
+    echo 100 > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/manual_pwm
+
+To control led_A0 in autonomous mode::
+    echo 1 > /sys/bus/i2c/drivers/lp5812/xxxx/lp5812_chip_setup/device_enable
+    echo 1 > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/activate
+    echo autonomous > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/mode
+    echo 1:10:10:15 > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/autonomous_animation
+    echo 100 > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/AEU1/pwm1
+    echo 100 > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/AEU1/pwm2
+    echo 100 > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/AEU1/pwm3
+    echo 100 > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/AEU1/pwm4
+    echo 100 > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/AEU1/pwm5
+    echo 5 > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/AEU1/slope_time_t1
+    echo 5 > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/AEU1/slope_time_t2
+    echo 5 > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/AEU1/slope_time_t3
+    echo 5 > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/AEU1/slope_time_t4
+    echo 1 > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/AEU1/playback_time
+    echo start > /sys/bus/i2c/drivers/lp5812/xxxx/lp5812_chip_setup/device_command
diff --git a/MAINTAINERS b/MAINTAINERS
index 5d8ee0801c69..dd504dee3274 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24021,6 +24021,7 @@ M:	Nam Tran <trannamatk@gmail.com>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
 F:	Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812
+F:	Documentation/admin-guide/auxdisplay/lp5812.rst
 F:	Documentation/devicetree/bindings/auxdisplay/ti,lp5812.yaml
 F:	drivers/auxdisplay/Kconfig
 F:	drivers/auxdisplay/Makefile
-- 
2.25.1

