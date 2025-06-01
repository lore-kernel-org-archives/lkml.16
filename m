Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28001E5B7E;
	Sun,  1 Jun 2025 15:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748791839; cv=none; b=QNJBM0QNiMIAsiCd9yCVS7b6xYSnXLs1O8ZRTGVGe/KdSSJyGxiR8MhmLqhcwixpDPjaQdzvJxt/d4cibTuR3gusSTVnwQlraDEEmqV2gNxuS0yfILruu7Aim/tFJP0n6ulVPtR2hDTwtvME6JyYvXmPAwiTuN5JUiUI51RnPFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748791839; c=relaxed/simple;
	bh=0wieX5NuxYk/LiD+mjNO8Zs26Ia6xYIUPnmSEjMOONo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dPMhqIXzGcBTPkxClWUO+nHiRqbpYb8ctpmK8OdEMIN1GS7YouvAaY2FaW5Vuh0kOCAkWCtQwrxivH+p+ixGzPZM4knstiJXWx+N4UwE3clUM3Zb6TrJQdMVlPNSdpeshnry3dXtcKhoj+ppLUah9fm88sKGTuR//U8aebI4nXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jN+EeBgU; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jN+EeBgU"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-451d7b50815so3037945e9.2;
        Sun, 01 Jun 2025 08:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748791836; x=1749396636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vp4d6Wy5vGq3sICHMUeIJP1OVosyCqD10aDzdmsDzoI=;
        b=jN+EeBgUv0ADyC5aiTegPoG01w6bIgqtKOuFsxhIlGfI5qT7S4mZwocOACa6fgObqU
         iPIYqmlSjct4Ikujw8ikxHz+2MntjY73KYLLrsjHvn8UVHYcZV5ZgbTSA1TaXVhTUYKl
         mJK4Yn5BydNt6gHT1Ew5Wu7DszF84avkUCl2dW/Mwbtr7jvLKDAy1WShIdYGPE5jRt6E
         yupWVvDmlgq6FfZJyhAud5TbhYY+0k1Lgi2BV96ttzSaOtFYUjj6365fk8FQfhqpmoV9
         XB/Op/7qK227XNDt0QYtqQnuaW3WNp6cbI2BMn2KbXxVI3cQ3Gb6gW3OwK2INiysPzuU
         J/xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748791836; x=1749396636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vp4d6Wy5vGq3sICHMUeIJP1OVosyCqD10aDzdmsDzoI=;
        b=KWxvUw8r51LXjdQJwgJu98rRzWLL0HdfA9DOt5Hjf2jYDGTzfoxdXgzfRK9HBmzIPk
         R39spn90b/VEcR8yDS4WM4PaDgc7p/LxwdRave8LOpdP9uNX1XZatx9UAycBY6vDGPpE
         6y6OF9WRQ5ATCi5bUtzD8GqMDbrcztsjDfjtZjTSNqVDrjNGRAiwb7o43taZOESfE6oM
         XXoY0RjB5fauao8Ets1FFa52Qm56AY5N+nb+Dpe0WfMdyNwl22gwp2kEOrSORfevXuYI
         3jddNzFKGAbeJX76sx+gOEyoNoyO073ZHJ8shhEYzbwbg+JXPGu2E4vQc6cxlp7dvpik
         tMcw==
X-Forwarded-Encrypted: i=1; AJvYcCV8zasw5HECtN4Lja9nASFo5GSFZfBlpHEbYWJphJlPSD6/4tVcTFjp3GmlEXrrcaHRutPhkjf2ms84@vger.kernel.org
X-Gm-Message-State: AOJu0YyA/kU2OsklsIn8/vWkVjML1n0Kdl4ZST6Ui9E8obcgbLEckbg0
	H+maJM961RCpkI6hgk6pBctWeNt8SNlj1m7b00eLOXqbEQUf9ea55F0lcSz1Fy7P
X-Gm-Gg: ASbGncs0nmUxM3TlzebgWQEvbIiu+RIDbuoHPQ5dblAFGcQ5AxlxNXUuP0StJiwN0UV
	EZo8WwTNL7a5rP4lcvN2nhZY6dNwbWi1mTTU89MtAYi/MCZXtAta1jQlD5ZbUKGGAnSbtnqjA+k
	oL4wmHbg+ohsi/1IZluiPZUXkfZlNRwoyVKWMoqrMD2rldlfoRyNOwT0eb1OnISAvHh7msJ8OPF
	B8wSuSwH+metPZNi5BDL0AWincgzHnzB9Uyo+u2G6+fUhKAR5vjjPugsjK43OX5bf+aXPSzIyrH
	NkGYJ5bTSiPebvWOGNlJpUiQUW0Inj54bFJGVZiLGXTF4HBfa5V0wXVtaXmu17r4LQmpGM4nZej
	5F9cDUpTBiCw=
X-Google-Smtp-Source: AGHT+IFHs+rDPB7aNp07uLTRNS0C/Oo52G05FESJT1pt0dpM6Pe6FACuzwMi5zlYWjUb+eNmTNZpxg==
X-Received: by 2002:a05:600c:3f10:b0:441:d438:4ea5 with SMTP id 5b1f17b1804b1-450d8874a83mr68821225e9.20.1748791835546;
        Sun, 01 Jun 2025 08:30:35 -0700 (PDT)
Received: from masalkhi.. (ip-109-43-115-37.web.vodafone.de. [109.43.115.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d800671csm88780205e9.30.2025.06.01.08.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 08:30:34 -0700 (PDT)
From: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: arnd@arndb.de,
	gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	abd.masalkhi@gmail.com
Subject: [PATCH v2 3/3] ABI: sysfs: document control attributes for ST M24LR
Date: Sun,  1 Jun 2025 15:30:21 +0000
Message-ID: <20250601153022.2027919-4-abd.masalkhi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250601153022.2027919-1-abd.masalkhi@gmail.com>
References: <20250601153022.2027919-1-abd.masalkhi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add documentation for sysfs attributes used by the M24LR control
interface, including unlock, password update, UID, memory size,
and sector security status.

Signed-off-by: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
---
 .../testing/sysfs-bus-i2c-devices-m24lr_ctl   | 96 +++++++++++++++++++
 1 file changed, 96 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-i2c-devices-m24lr_ctl

diff --git a/Documentation/ABI/testing/sysfs-bus-i2c-devices-m24lr_ctl b/Documentation/ABI/testing/sysfs-bus-i2c-devices-m24lr_ctl
new file mode 100644
index 000000000000..50228f9f43f6
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-i2c-devices-m24lr_ctl
@@ -0,0 +1,96 @@
+What:           /sys/bus/i2c/devices/<busnum>-<addr>/unlock
+Date:           2025-05-31
+KernelVersion:  6.16
+Contact:        Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
+Description:
+                Write-only attribute used to present a password and unlock
+                access to protected areas of the M24LR chip, including
+                configuration registers such as the Sector Security Status
+                (SSS) bytes. A valid password must be written to enable write
+                access to these regions via the I2C interface.
+
+                Format:
+                  - Hexadecimal string representing a 32-bit (4-byte) password
+                  - Accepts 1 to 8 hex digits (e.g., "c", "1F", "a1b2c3d4")
+                  - No "0x" prefix, whitespace, or trailing newline
+                  - Case-insensitive
+
+                Behavior:
+                  - If the password matches the internal stored value,
+                    access to protected memory/configuration is granted
+                  - If the password does not match the internally stored value,
+                    it will fail silently
+
+What:           /sys/bus/i2c/devices/<busnum>-<addr>/new_pass
+Date:           2025-05-31
+KernelVersion:  6.16
+Contact:        Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
+Description:
+                Write-only attribute used to update the password required to
+                unlock the M24LR chip.
+
+                Format:
+                  - Hexadecimal string representing a new 32-bit password
+                  - Accepts 1 to 8 hex digits (e.g., "1A", "ffff", "c0ffee00")
+                  - No "0x" prefix, whitespace, or trailing newline
+                  - Case-insensitive
+
+                Behavior:
+                  - Overwrites the current password stored in the I2C password
+                    register
+                  - Requires the device to be unlocked before changing the
+                    password
+                  - If the device is locked, the write silently fails
+
+What:           /sys/bus/i2c/devices/<busnum>-<addr>/uid
+Date:           2025-05-31
+KernelVersion:  6.16
+Contact:        Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
+Description:
+                Read-only attribute that exposes the 8-byte unique identifier
+                programmed into the M24LR chip at the factory.
+
+                Format:
+                  - Lowercase hexadecimal string representing a 64-bit value
+                  - 1 to 16 hex digits (e.g., "e00204f12345678")
+                  - No "0x" prefix
+                  - Includes a trailing newline
+
+What:           /sys/bus/i2c/devices/<busnum>-<addr>/mem_size
+Date:           2025-05-31
+KernelVersion:  6.16
+Contact:        Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
+Description:
+                Read-only attribute that exposes the internal memory size code
+                of the M24LR device, as stored in the system register area.
+
+                Format:
+                  - Unsigned 8-bit integer
+                  - Includes a trailing newline
+
+                Notes:
+                  - Value is encoded by the chip and corresponds to the EEPROM
+                    size (e.g., 3 = 4 kbit for M24LR04E-R)
+
+What:           /sys/bus/i2c/devices/<busnum>-<addr>/sss<N>
+Date:           2025-05-31
+KernelVersion:  6.16
+Contact:        Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
+Description:
+                Read/write attribute representing the Sector Security Status
+                (SSS) byte for EEPROM sector <N> in the M24LR chips. Each sector
+                has one SSS byte, which defines I2c and RF access control via a
+                combination of protection and password settings.
+
+                Format:
+                  - Read: returns a 8-bit hexadecimal value followed by a
+                          newline
+                  - Write: requires exactly one or two hexadecimal digits
+                      - No "0x" prefix, whitespace, or trailing newline
+                      - Case-insensitive
+
+                Notes:
+                  - Refer to the M24LR chip datasheet for full bit definitions
+                    and usage
+                  - Write access requires prior password authentication in I2C
+                    mode
-- 
2.43.0

