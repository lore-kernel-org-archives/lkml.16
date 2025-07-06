Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6020E20371E;
	Sun,  6 Jul 2025 10:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751799222; cv=none; b=p0Yp7XmZBWpQVfaRW3XU5D0uCJtwJTTc/0WU66q4R5XPNxHsjY3uQkHqzjIQVKB7rUXLcZEqg4DVWnqng71WJke+GUay13uOFe7nktKGSzxfxiIeTDzyjw2zzduwyAKWuOU9F/CfwrOnIYpppZEF0rkmSjqI2x5jGpVjh5qK+Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751799222; c=relaxed/simple;
	bh=4IuGkBAIazyGMLiME+vT9KFCku4kgPkeBaX7/u3IJ/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OFaQtlnUIFSdtsv0AkxveTU5vT14ts/4CTuF+q0yduHRXJW3tOJNDVC1+c5COKoOtEYtJUDSHx1t1fSkvpTQwfNOzQ/faReJa5ovf5K7xZJVlKICSqRo4oMUA+ucIuZF6r8cVSHaERr1syuXgFhPdFY1qEO/AKSgRELvJQTvvKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K+9QeKdJ; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K+9QeKdJ"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4538a2fc7ffso22402205e9.0;
        Sun, 06 Jul 2025 03:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751799218; x=1752404018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cx5QGxAm4KSR88bli+PY12DeIIpwtafObIGcIC0Auxg=;
        b=K+9QeKdJ/0RusgKaHmynqy05fmSA4jt3AiCDa7TDzSWBC1eFc69EJRqWXB6+pElJsp
         hIfNRXzNmi1oPZBQsNQs46/23eosBzH8mt42b3xSRvGm294IHGqW02jGnV2MqDO1tpPV
         AgLgkbT72F6oVcp5BZowk9F/viXQuy14fRcZVmjlwpacSivt9TH4jhmFWA8+hOxy1nXz
         5ByDYbLE2Qhj3l96pKFOALzqSqRGeffZ5jp2c6f0ebl3oAztRkG/L14gShgCn/bwEJY+
         w/y9DAqSKq1FTnQHjomTAL93YDm6eQCUcUbreClJjYEruTNKh11mVOx47G3NDSHDwK3t
         MoFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751799218; x=1752404018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cx5QGxAm4KSR88bli+PY12DeIIpwtafObIGcIC0Auxg=;
        b=eiOY9N1EibSPMPJ2PMlhIR+zKoLs9jNRqT+BnAHrihVYc0zS3uzhZ4h5ErAKV9jNUd
         McC1WIzE0bjcN7kduRG9Yq3M/O1e+e+VbjhQHfHKpgk2oF+xR7uHrOxYxC+RJVexvgY8
         vjBucIyxQ8+fKtSAyODZ3RTelJiVa7kAkD4xbUzw+wA+Xl2lohpHldnsH1LvozOwVpwp
         JBnsBYDon8SdMN5ssXiXjzxa72o2oR+Cm0jo1WLgtEtATrPULpU+SsF+UTB+YuHhwOJ5
         7wP9LDZTwtK4/hE10DanxABlsozH6goryZpgjtolBYXvyIdWpBbiSMqgSQeKdkMuJIUa
         pZ2w==
X-Forwarded-Encrypted: i=1; AJvYcCUAXam4ybqCllPGmDw1Y/soBtndnObxR27EvTq4eN5C1iZqCcdsrNIYepn3ompP0S46/QfBNd/8Hvfc@vger.kernel.org, AJvYcCW3WuOHEqYcuu9Cs6B7f5Au54xEKSMLBKcU4pFKuq/9q+xpBFVJdX3hgG56xKlbgVl1DM3ntQ6xJXMaoRv2@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5mDe6R2GiAfnIMjeB2z8HMCSF2Z9FLqQ7legyDRJ3yBe7wszP
	F1zYK1FtHk7q5edJPL435FJoFQOX5ZnP3F25QSqfTtJJ4tMQ5lFAEE3+
X-Gm-Gg: ASbGnctCSmDfpeG2I7TgMAE+SSwtzRxx/8fQ5t9L9xxfn7WNenA41TX1b83efPS7u5B
	xZJd6hQlnD636N75rS6lncVxdJkaqzei78tV9kSW/mUcK2IUyscGsY1r0mEpn2WCPZsjsWn0pDx
	WIRkDA5xb6LTcPiFesd4JtpWNrm35BMjXpO02EMo+VHL9A2Y91S/oti+C0dli99R7j3+5cY4vHr
	zXzH1iOPZZ+RwH1sh6TNsJnvu7En5qagr7rRGqlnGskkBA0+jTl1aUDIj3WAHJ+Q0YNCi9ndnJE
	nI3iRSiqJpzqRpik427PIhFKpqoJLmnLdrTlIIOIwav+J8JT3/g/J9cy92VZSJErqqnfCxPuew9
	0DZ4h/IQuXoMl+nWpzjWilUj6omli
X-Google-Smtp-Source: AGHT+IEjC7VTe9NCDYYryYO3iznsEJZvYcF9cPukiBM5UOv8jBd6MygsaOOP+inmd3JbzzQKP0/aJw==
X-Received: by 2002:a05:600c:3227:b0:453:79e8:e92d with SMTP id 5b1f17b1804b1-454b1f4891bmr50953675e9.5.1751799217330;
        Sun, 06 Jul 2025 03:53:37 -0700 (PDT)
Received: from masalkhi.. (pd907d170.dip0.t-ipconnect.de. [217.7.209.112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b1634147sm80283985e9.18.2025.07.06.03.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 03:53:37 -0700 (PDT)
From: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
To: arnd@arndb.de,
	gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org
Cc: conor+dt@kernel.org,
	luoyifan@cmss.chinamobile.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	christophe.jaillet@wanadoo.fr,
	abd.masalkhi@gmail.com
Subject: [PATCH v6 3/3] ABI: sysfs: add documentation for ST M24LR EEPROM and control interface
Date: Sun,  6 Jul 2025 10:53:11 +0000
Message-ID: <20250706105311.395162-4-abd.masalkhi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250706105311.395162-1-abd.masalkhi@gmail.com>
References: <20250706105311.395162-1-abd.masalkhi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add sysfs ABI documentation for the STMicroelectronics M24LR device,
covering both the control interface (e.g., unlock, password update, UID,
total sectors, and SSS entries) and EEPROM access via the nvmem subsystem.

Signed-off-by: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
---
Changes in v6:
 - No changes
 - Link to v5: https://lore.kernel.org/all/20250704123914.11216-4-abd.masalkhi@gmail.com/

Changes in v5:
 - Fix dates and update targeted kernel version.
 - Link to v4: https://lore.kernel.org/lkml/20250608182714.3359441-4-abd.masalkhi@gmail.com/

Changes in v4:
 - Replaced 'sss<N>' entries with a single binary 'sss' attribute
 - Added 'total_sectors' attribute to report the number of valid SSS bytes
 - removed 'mem_size' attribute
 - Fix dates and update targeted kernel version.
 - Link to v3: https://lore.kernel.org/lkml/20250606120631.3140054-4-abd.masalkhi@gmail.com/

Changes in v3:
 - Updated sysfs entry paths to use <busnum>-<primary-addr> to reflect the
   control address.
 - Link to v2: https://lore.kernel.org/lkml/20250601153022.2027919-4-abd.masalkhi@gmail.com/

Changes in v2:
 - Added initial sysfs ABI documentation.
---
 .../ABI/testing/sysfs-bus-i2c-devices-m24lr   | 100 ++++++++++++++++++
 1 file changed, 100 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-i2c-devices-m24lr

diff --git a/Documentation/ABI/testing/sysfs-bus-i2c-devices-m24lr b/Documentation/ABI/testing/sysfs-bus-i2c-devices-m24lr
new file mode 100644
index 000000000000..7c51ce8d38ba
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-i2c-devices-m24lr
@@ -0,0 +1,100 @@
+What:           /sys/bus/i2c/devices/<busnum>-<primary-addr>/unlock
+Date:           2025-07-04
+KernelVersion:  6.17
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
+What:           /sys/bus/i2c/devices/<busnum>-<primary-addr>/new_pass
+Date:           2025-07-04
+KernelVersion:  6.17
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
+What:           /sys/bus/i2c/devices/<busnum>-<primary-addr>/uid
+Date:           2025-07-04
+KernelVersion:  6.17
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
+What:           /sys/bus/i2c/devices/<busnum>-<primary-addr>/total_sectors
+Date:           2025-07-04
+KernelVersion:  6.17
+Contact:        Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
+Description:
+                Read-only attribute that exposes the total number of EEPROM
+                sectors available in the M24LR chip.
+
+                Format:
+                  - 1 to 2 hex digits (e.g. "F")
+                  - No "0x" prefix
+                  - Includes a trailing newline
+
+                Notes:
+                  - Value is encoded by the chip and corresponds to the EEPROM
+                    size (e.g., 3 = 4 kbit for M24LR04E-R)
+
+What:           /sys/bus/i2c/devices/<busnum>-<primary-addr>/sss
+Date:           2025-07-04
+KernelVersion:  6.17
+Contact:        Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
+Description:
+                Read/write binary attribute representing the Sector Security
+                Status (SSS) bytes for all EEPROM sectors in STMicroelectronics
+                M24LR chips.
+
+                Each EEPROM sector has one SSS byte, which controls I2C and
+                RF access through protection bits and optional password
+                authentication.
+
+                Format:
+                  - The file contains one byte per EEPROM sector
+                  - Byte at offset N corresponds to sector N
+                  - Binary access only; use tools like dd, Python, or C that
+                    support byte-level I/O and offset control.
+
+                Notes:
+                  - The number of valid bytes in this file is equal to the
+                    value exposed by 'total_sectors' file
+                  - Write access requires prior password authentication in
+                    I2C mode
+                  - Refer to the M24LR datasheet for full SSS bit layout
-- 
2.43.0

