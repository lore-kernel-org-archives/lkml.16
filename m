Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48496248889;
	Sun, 27 Apr 2025 08:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745742382; cv=none; b=g+hVtvKhqChQ7nUBimJA29VU3IGkLI0TI01HT6/QtUa9LiHs37qqoHxSG1uVeqM/4JCAuO2sZinDoULB5iL1BycnI9l1GcNMjhFJYaHNeW630+rCK0iU6j/siG8LYAIwHb7rh9Bc6mEDE8dgd9P5BCvBcodsnMIpYCQJspPiYIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745742382; c=relaxed/simple;
	bh=cXHKMMt9x+B+XoZXvvBTPnl/DdUA4LwPQQZ2ZK89Jv8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dr2dE6I0tgwACQY+bNev3lJuPzmynDXzco0VKtXJP/ENJ87ICk3AItDF4b0CR5hepTPUczqjC12AvAH3hXlJ2XeEsjVAFj6A+nqh8qjWj+0llT8YoKHd1t1wN9s7NbRewIXXwqkcqFIftdIWv/fxahVTaZeMANeqLHw/K07aw+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KFap3sRr; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KFap3sRr"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7394945d37eso3240630b3a.3;
        Sun, 27 Apr 2025 01:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745742377; x=1746347177; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rAHOOZ2NfcJK36SwKCvU8hUdcb2kgW0MQQU/N5qjNJY=;
        b=KFap3sRrTUs6PZ/kR1pGcJh8Dn0hGowRI4rShN9JwenfOSVfnd4tqUNxwcStuIj9vj
         qyI9g5hMOdxHqPGK8YrqQDDX2GirlPnH0D99beSPDgKZ/n+Qao/G33rrwnBsRteZXQmj
         6zkwO81kh4CpgwsEkS5jWTgXlztF03s7Q6LVbCE+VJ0UoOViO80mU1LLeReRTOYALPLJ
         81TMm9qppCdQ8UMNEgF+/VJavl9d7sBeC4xCVE5gKI8L3sR8W3t2IkDLPdGYkFVBgMDO
         tahLbMhyD4wIetCXArP3tO4uainS+QTmxGHoQKagPw7XtvmNWT2GebcLfQLAqwmYbAi4
         doiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745742377; x=1746347177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rAHOOZ2NfcJK36SwKCvU8hUdcb2kgW0MQQU/N5qjNJY=;
        b=uhFgU0ssr35rt1GFk0jR2/U7bhlmhu3BxmQEPfrXuwaP6L2px6eRBXwtp2HVjWQABH
         Xi5R2/gWqyMAFxoJClzhHdga6UzBJybxNsZuA2BXRlGqq7vBT3li/elC6Z0njTulu/lJ
         Pz4POv6zHIvWOsf/z1EQDlSSFawQWm970egCGEDINjPn3SEh7aFEnbXeoqi6bwdKXeLw
         ffbeh8oyVROOTBo8sSNWZiFybGagTacTHX886Q3SdekGqeOXGUWk/LkG7L4w+Y0FGVJJ
         iV8dDXFH9uUUg5spt2EuEH2AweElVb+/5G08vGITWEN25wArLfMdL+fjlo+zZIGaxJod
         x6Jg==
X-Forwarded-Encrypted: i=1; AJvYcCUOGKozKSFJT13ZkVbe/gUeJIUgsHEq2CoIcZZlLXk+ZzVvSKzy/nw0N13rxgmV/Tf6Cn7UUxnQ43tc@vger.kernel.org, AJvYcCVM0iETmz73k1GWRWR59AOcvFwKzsqw8EY7T+gTLdZFS6CWnmR+C+tll1tKsHYrZR2LIbPWxnuUinA+qYDr@vger.kernel.org, AJvYcCWpYtwy2qHrW7X/tP4Vk84GIAc5hDh9KG2t3nw43lS/Qqjsj3J6iD5m2R6H2L7kpKrsFO8nWGmp8iyc@vger.kernel.org
X-Gm-Message-State: AOJu0YxK8+5+AEmKuyejy8zu+pIAeThzCFWTgPZsOEV6XvGlVQ3sYWSy
	+ywxY/oPK/iroXcYkzASLE2jFBdmmbrAqXWXTrYLUU79ivVHjV5u/XfWOF8R
X-Gm-Gg: ASbGncv+ktkp82HEiRhbOHmtlPO8LtoUwzfjAiaG4m7hdbgvNLua+KHkwOCYt3Ym9ix
	0hqBqdxGMddBT9jTApNbvGy03Heq0xh2bGK40AwLyANLgT6mzF9BNJ237nfWcCB1kgwnFgZ9nRa
	PkhflBTpCUhMHzikafhDAt/wpbH7ShfQecyDPc4m/hTCg/S3UiWhNE5/wXMb+TELImgDTSHoSwM
	6bSkfXQs2M20f//xDati021FDwj/s5dBOdjKNWywcTDOJ2ki59BqbvjSqnkl5HsUDLA0lWwlK6D
	EVplJT2NNY0gHfjZDPiQ7BUlEyjH8qcNtBX/VUR11+68l7Gr6xyBag==
X-Google-Smtp-Source: AGHT+IEWyTJYvTQ8G6tSxlCsQ7uD5ydQMJw2gBZOYNudrhjDGhuqX8sdYQfAp1s2YVBSyzK/XuG/jg==
X-Received: by 2002:a05:6a20:9f8f:b0:1f1:432:f4a3 with SMTP id adf61e73a8af0-2046a56d06emr6773136637.23.1745742377485;
        Sun, 27 Apr 2025 01:26:17 -0700 (PDT)
Received: from localhost.localdomain ([14.171.43.210])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e2549f570sm5900852b3a.0.2025.04.27.01.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 01:26:17 -0700 (PDT)
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
Subject: [PATCH v8 3/5] docs: ABI: Document LP5812 sysfs interfaces
Date: Sun, 27 Apr 2025 15:24:45 +0700
Message-Id: <20250427082447.138359-4-trannamatk@gmail.com>
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

The LP5812 is a 4 × 3 matrix RGB LED driver
with autonomous animation engine control.

The driver provides interfaces to configure
LED modes manual/autonomous, set PWM/DC values,
and manage autonomous animation engines.

Signed-off-by: Nam Tran <trannamatk@gmail.com>
---
 .../ABI/testing/sysfs-bus-i2c-devices-lp5812  | 144 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 145 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812

diff --git a/Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812 b/Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812
new file mode 100644
index 000000000000..04689663a643
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812
@@ -0,0 +1,144 @@
+What:		/sys/bus/i2c/devices/.../lp5812_chip_setup/device_enable
+Date:		May 2025
+KernelVersion:	6.16
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        Enables or disables the LP5812 device. (RW)
+        0 - Disable
+        1 - Enable
+
+What:		/sys/bus/i2c/devices/.../lp5812_chip_setup/dev_config
+Date:		May 2025
+KernelVersion:	6.16
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        Configures drive mode and scan order. (RW)
+        Some valid values: tcmscan:4:0:1:2:3 (default), tcmscan:3:0:1:2, mixscan:2:2:0:3, mixscan:3:0:1:2:3
+
+What:		/sys/bus/i2c/devices/.../lp5812_chip_setup/device_command
+Date:		May 2025
+KernelVersion:	6.16
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        Issues device-level commands. (WO)
+        Valid values: "update", "start", "stop", "pause", "continue"
+
+What:		/sys/bus/i2c/devices/.../lp5812_chip_setup/sw_reset
+Date:		May 2025
+KernelVersion:	6.16
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        Triggers a software reset of the device. (WO)
+        1 - resets device
+        0 - does not reset device
+
+What:		/sys/bus/i2c/devices/.../lp5812_chip_setup/fault_clear
+Date:		May 2025
+KernelVersion:	6.16
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        Clears fault status. (WO)
+        1 - clears fault status
+        0 - does not clear fault status
+
+What:		/sys/bus/i2c/devices/.../lp5812_chip_setup/tsd_config_status
+Date:		May 2025
+KernelVersion:	6.16
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        Report the current thermal shutdown config status. (RO)
+
+What:		/sys/bus/i2c/devices/.../led_<id>/activate
+Date:		May 2025
+KernelVersion:	6.16
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        Activate or deactivate the specified LED channel. (RW)
+        1 - Activate
+        0 - Deactivate
+
+What:		/sys/bus/i2c/devices/.../led_<id>/mode
+Date:		May 2025
+KernelVersion:	6.16
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        Selects LED operation mode. (RW)
+        Valid values: "manual", "autonomous"
+
+What:		/sys/bus/i2c/devices/.../led_<id>/manual_dc
+Date:		May 2025
+KernelVersion:	6.16
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        DC current level in manual mode. (RW)
+        Valid values: 0 - 255
+
+What:		/sys/bus/i2c/devices/.../led_<id>/manual_pwm
+Date:		May 2025
+KernelVersion:	6.16
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        PWM duty cycle in manual mode. (RW)
+        Valid values: 0 - 255
+
+What:		/sys/bus/i2c/devices/.../led_<id>/autonomous_dc
+Date:		May 2025
+KernelVersion:	6.16
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        DC current level used in autonomous mode. (RW)
+        Valid values: 0 - 255
+
+What:		/sys/bus/i2c/devices/.../led_<id>/autonomous_dc
+Date:		May 2025
+KernelVersion:	6.16
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        DC current level used in autonomous mode. (RW)
+        Valid values: 0 - 255
+
+What:		/sys/bus/i2c/devices/.../led_<id>/pwm_dimming_scale
+Date:		May 2025
+KernelVersion:	6.16
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        PWM dimming scale type. (RW)
+        Valid values: "linear", "exponential"
+
+What:		/sys/bus/i2c/devices/.../led_<id>/pwm_phase_align
+Date:		May 2025
+KernelVersion:	6.16
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        Configures PWM phase alignment. (RW)
+        Valid values: "forward", "middle", "backward"
+
+What:		/sys/bus/i2c/devices/.../led_<id>/autonomous_animation
+Date:		May 2025
+KernelVersion:	6.16
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        Controls AEU configuration and playback. (RW)
+        Format: (aeu number):(start pause time):(stop pause time):(playback time)
+        with aeu number 1, 2, 3; playback time 0 - 15
+
+What:		/sys/bus/i2c/devices/.../led_<id>/aep_status
+Date:		May 2025
+KernelVersion:	6.16
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        Shows current animation pattern status, value from 0 to 7. (RO)
+
+What:		/sys/bus/i2c/devices/.../led_<id>/auto_pwm_val
+Date:		May 2025
+KernelVersion:	6.16
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        Shows the pwm value in autonomous mode when pause the animation, value from 0 to 255. (RO)
+
+What:		/sys/bus/i2c/devices/.../led_<id>/lod_lsd
+Date:		May 2025
+KernelVersion:	6.16
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        0 0 mean no lod and lsd fault detected, 1 1 mean lod and lsd fault detected (RO)
diff --git a/MAINTAINERS b/MAINTAINERS
index 091373b01dc2..5d8ee0801c69 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24020,6 +24020,7 @@ TEXAS INSTRUMENTS' LP5812 4X3 MATRIX LED DRIVER
 M:	Nam Tran <trannamatk@gmail.com>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
+F:	Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812
 F:	Documentation/devicetree/bindings/auxdisplay/ti,lp5812.yaml
 F:	drivers/auxdisplay/Kconfig
 F:	drivers/auxdisplay/Makefile
-- 
2.25.1

