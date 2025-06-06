Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307BB289367;
	Fri,  6 Jun 2025 12:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749211643; cv=none; b=jpWZp0QH8Qeel6ofcnNOUpmKHAjKIGbvl5E/QUZfGcYGLsLwrFTejAyNrQbierpsC0JqmiRH+nCTN45fORMGTpL3ckGkI1yoTuXY/9k2A9xPDmbo3XvNGTIHwBs3HKiYRaTf17cvsOWfiz4Scn+f3wa1rpRk1bCz1dCTKLEuwa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749211643; c=relaxed/simple;
	bh=1aU6DiPih2JcaZs55Kgy5nWudTSKniFEBn9Fbc0X48o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V0I2P5KuDbWK5tiI0CGrNzbn8Tpa3XSXz405L8Bc/+v0eanYQl+iqjZQmQqRX0zVeJPPkO4E16aPcuzKJpxcCVY5/D9PwuoFYMKqBZLRlo70vDaTPtP4FFffhAGUYysBnG7krXvP93KRtOG7ZJI9exy7Vkesn8BQAFvmsi4qrOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HiPXQgFP; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HiPXQgFP"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-450cfb790f7so15862245e9.0;
        Fri, 06 Jun 2025 05:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749211639; x=1749816439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oQLhyfa6s1Y1N2934/HNvah+Kn4N5hPI40oGFlKP6mM=;
        b=HiPXQgFPfZL7k+cBu/eUp5L83DjDppkH9bQ5cHulrJhJ9Eavd9cyIqiKKEpxAY82rl
         BPjtBX+XJ7Ty+5A0aw+zkfsxNBvU2gpHQyPdji+MwJgcn6B7rWxFwOf3nkOMI5C4Ucec
         go9yRQUMctFKpupr4Zg/pinlOnl3pdurOJYZTTc+MjZn1MJ8mPOUCfd3ZdS7cWdLgTLq
         qOaTmSGfcSumtTAe7mCG3IiSE+DeV7MKaOjLYDjU/nfQlsLrsqPIX0fpocfD1RXBKahp
         Klw7GmiZS+MWh5rOcdMgPvHBxx9eoasaIGv0VD3GYXL9Btgp5pb5w/f7uw6FqeOCBoM9
         VP/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749211639; x=1749816439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oQLhyfa6s1Y1N2934/HNvah+Kn4N5hPI40oGFlKP6mM=;
        b=haSkl7cqbbiFH5TzYxXmzEGH/DAIg4B6yV3kkRZRdoR3xYI5Ezam9Zb/H32ZAeHcpg
         Q/edPsfKChH1KW0GhIfLL6z5yroCdGnoG/LqyCI5K/L0Aasj51MCn4kpWbSRG3UMBSBu
         gzrwZxjVfEcm7w2q+N+KNkYGe5IxJnOmo/xD6jRO36ci4Q/2SN+a+y2p0+4q3VihMD5f
         oqP/Q1PeEH1j5GWLXKZdicNHWZ2IgNRw2W72vh4m02Ig7A81UKF9GmSgVwVBQqHEwM0n
         djYN11kHq657Z2ghR/gDoAL5rq3MZ8pPnOIP8pFY2UFPn+6Bb/XDhMjWSsnMR+vypDqq
         vPVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBay+ZnmBynmvocleDETo3tPkOZMILGEdNGx5F0zbqNA/oDcgfY6kvZl2KrGobwinSPHe7FF5+YqjL@vger.kernel.org
X-Gm-Message-State: AOJu0YzPRUrowBmeaEsKqF2cgfetWKsPfKSViSRzKZLWKeprFrh9ZOoN
	k2nrR9STYeMwXNF03zgfoiAaVwi1h0BtdkO40TZvc92wCysGG9ayk3HDz1arKQ==
X-Gm-Gg: ASbGncsrwMBSTA4yPcB6R2G+ff3/QneFR3UpCjsvGXpreh/TVoCAq0F7IiQf9K0LyBE
	eqnL4EqGV6JvBIfmr3xMOWPjEpIsfvjSs2l8vux5Hmyt8GNqg4LA0HDfxxbgVOfKHH89v2cZ0Il
	CEHqAUxl+LvcqwjBYbA3Z8w69HnqNS/ukPHoKnffrLc/sgG2dhH1JGIySsn3hNb28i854JncVxF
	lrTq1XSw94Sy7A/t0iqn8/MYt8lNgBpvLYbk5cRf45a7HFUCnQV4umGpC2/khjGkX3itX/IM9Jr
	KKQfQHVp7M77KGrhHhTvEbI1GLTKMYmmdJa+ksbICeO8ckXUrqfPFBetRffx6vCBR9KY2UD4l3W
	FW/2WRgH/4ec/4Q==
X-Google-Smtp-Source: AGHT+IGB7hSxzFM+Zz49/eCCU7lmuwQX9rezj6h1KVhyi70e6TzoiW+6dTVTsknwjab4QcSthNsc/Q==
X-Received: by 2002:a05:6000:24c8:b0:3a4:e56a:48c1 with SMTP id ffacd0b85a97d-3a531cbe5a3mr2728398f8f.55.1749211639298;
        Fri, 06 Jun 2025 05:07:19 -0700 (PDT)
Received: from masalkhi.. (ip-109-43-113-198.web.vodafone.de. [109.43.113.198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f516sm1671874f8f.74.2025.06.06.05.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 05:07:19 -0700 (PDT)
From: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: arnd@arndb.de,
	gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	abd.masalkhi@gmail.com
Subject: [PATCH v3 3/3] ABI: sysfs: add documentation for ST M24LR EEPROM and control interface
Date: Fri,  6 Jun 2025 12:06:31 +0000
Message-ID: <20250606120631.3140054-4-abd.masalkhi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250606120631.3140054-1-abd.masalkhi@gmail.com>
References: <20250606120631.3140054-1-abd.masalkhi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add sysfs ABI documentation for the STMicroelectronics M24LR device,
covering both the control interface (e.g., unlock, password update, UID,
memory size, and SSS entries) and EEPROM access via the nvmem subsystem.

Signed-off-by: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
---
Changes in v3:
 - Updated sysfs entry paths to use <busnum>-<primary-addr> to reflect the
   control address.

Changes in v2:
 - Added initial sysfs ABI documentation.
---
 .../ABI/testing/sysfs-bus-i2c-devices-m24lr   | 96 +++++++++++++++++++
 1 file changed, 96 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-i2c-devices-m24lr

diff --git a/Documentation/ABI/testing/sysfs-bus-i2c-devices-m24lr b/Documentation/ABI/testing/sysfs-bus-i2c-devices-m24lr
new file mode 100644
index 000000000000..53b6fe39162c
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-i2c-devices-m24lr
@@ -0,0 +1,96 @@
+What:           /sys/bus/i2c/devices/<busnum>-<primary-addr>/unlock
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
+What:           /sys/bus/i2c/devices/<busnum>-<primary-addr>/new_pass
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
+What:           /sys/bus/i2c/devices/<busnum>-<primary-addr>/uid
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
+What:           /sys/bus/i2c/devices/<busnum>-<primary-addr>/mem_size
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
+What:           /sys/bus/i2c/devices/<busnum>-<primary-addr>/sss<N>
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

