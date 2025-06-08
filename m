Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF351917CD;
	Sun,  8 Jun 2025 18:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749408373; cv=none; b=pdw3xE/qHjIdlXqWtcZ9L5L6kDvlPTVWf0Rj0ybYqcw3mjn7VOTL+SgJ31ZM4ZmAO5ZdtaGo0meFwWfcL/mpO4Q57eTz2uK5ziyiq1yvrWxgsODiIaztGuc2/6BEuupzvmsW9zL7tDGnykJjMmqfhDeRJK9vCqvBuDs0JbN8oUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749408373; c=relaxed/simple;
	bh=5kinR0KrS7IkPwN9fE1QIIqbPAWuMKnmvKhh7UgyExg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FwMgi29nE7QBdMrGp+ObIq86yRusptsvxYZC/TqyMqsHGTe1nE/9SmAv+hQGUWBDJCkxqarOwysaEuBW9P+1sw0+SvPdYkfg4EZaSNGm4GdYxObdhhDc3VaXLRR/cWPFQ0x+JgldWcGy8gRx24flKJVEtNyEVak+Nu3XNLS4+GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OKP2rERf; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OKP2rERf"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-451d3f72391so48835265e9.3;
        Sun, 08 Jun 2025 11:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749408369; x=1750013169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nf6PjjJ5TJPZ+Dos5EBSJCJYt0quyjq/Hxi+5XwPSFE=;
        b=OKP2rERfTt/BTPc6FC9MOwiSz1mtitBUgnGyrqKjvmrcu81fasLv4X6IryQgObbf65
         0TT5Q4oqADbxuQSGP6UEKRaUYg9yZoKrP3renIpjAkCjZYiJpDIXhRckECZ4+cOCUjKr
         ECD1F4TdwU5yNMgXC7oLjRSh0L8UJfT3onTGI8uwewFARDTwQyJFK1i5DhsPV3WksP6o
         0x2gMydrbYM/NFdhSx7BZMub+aCAgoagS5w4mra4CBmQ7BSSH4DzXHgIunSgRafPai9a
         Nkz2n4Hc7hon1WNNPLXF+76+K18ijFhzDM/yfnAE3qiKUCY4HWSxKcB1dsR5+M0d4xuJ
         PE5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749408369; x=1750013169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nf6PjjJ5TJPZ+Dos5EBSJCJYt0quyjq/Hxi+5XwPSFE=;
        b=dGIP33aTo/t5fG/qycSOvWOJGj3EHNycejPIqf7jSnwn63GhCFcKlnebFdqquu8eqb
         XcOq5b67tubyXjWc4ul2GIYVDTBsQMGKTemNLogp0p3iCWpVfPeqJcs6XAyglwcsIuxF
         o+WwyS5I7ah20jJkCQ1MGUGFH5yQMQPqLNSL3maEFEOCW19CKidGE1Fy97Aj7gLPH0Ip
         vBa6MrcTCmQsnxA7Vep9u7CDC9SACakwHBXoA2U5gXz7MU61jWeJnvH1gD5N/hS98oJH
         p7FJRQiqyNFccdAryc0dgNDMXfdxR33k5cw89x4SXOpD/gxGQAGxCNwlOI6q3JNRn7k6
         q/sw==
X-Forwarded-Encrypted: i=1; AJvYcCWvgUgQ1PhBVgnX8CdkYHSgLd0WqR0p9UxBIr0XMWFtNrzr20F7IIgmxMurT6SkM+nWgG2bmtkAYF7k@vger.kernel.org
X-Gm-Message-State: AOJu0YyAoomKD6RQC+sY8Hl1j8duvDWAtBFkOfkVwUdrmwtwykWiLBHk
	O7J7OMQoAOj9LWjoWxhDQdShK2l6mIUesyur2wGtyvmLwP1FTe64SsgMPx7w8sQX
X-Gm-Gg: ASbGncvkD9ZQTp3pQGfG0EOLcDA4OySZE4VkZKerUR+1s1VBZDwhOVgA8u8p3E7Gw1+
	lAk/LxIH6ZN1QKIXtyAguf3FbpwiQKhjp/1mKjSSIykuigarIV6EItN/QBJCpXsxiR/GYSih+yb
	8k6eFSBIKwiYc9kG3wLXddb0l47RoBM9R5v0uF35ZLIzd6taYUJIbzlw7gBl7n9juqo3OgtuCJP
	vEVFUPDkLiFFKI7OuvCHGdvs0pr/GEpb1oguCwQ2Lpj4C25BsR3iu7gIbvJBFQiwe+VkJlqQ+Mc
	3Vv/dm6zI70jcfM/Mpj/LECplL+dHcbTONtVUKTLxhdiPtK23ls+kNNhy13f1N1M6UK0TPM9xVG
	u48U9Ti1sa1bvbQ==
X-Google-Smtp-Source: AGHT+IHrh3Ufshadaldzj7/sz/XQbdcLDGkH3q3WMhwjlL84aOnLgw1GRwUTyiJSwD3+kwYZk36QgA==
X-Received: by 2002:a05:600c:1c25:b0:44d:a244:4983 with SMTP id 5b1f17b1804b1-45201437a46mr108445675e9.3.1749408369235;
        Sun, 08 Jun 2025 11:46:09 -0700 (PDT)
Received: from masalkhi.. (ip-109-43-113-112.web.vodafone.de. [109.43.113.112])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5324361ffsm7621418f8f.47.2025.06.08.11.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 11:46:08 -0700 (PDT)
From: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: arnd@arndb.de,
	gregkh@linuxfoundation.org,
	W_Armin@gmx.de,
	luoyifan@cmss.chinamobile.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	abd.masalkhi@gmail.com
Subject: [PATCH v4 3/3] ABI: sysfs: add documentation for ST M24LR EEPROM and control interface
Date: Sun,  8 Jun 2025 18:27:14 +0000
Message-ID: <20250608182714.3359441-4-abd.masalkhi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250608182714.3359441-1-abd.masalkhi@gmail.com>
References: <20250608182714.3359441-1-abd.masalkhi@gmail.com>
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
Changes in v4:
 - Replaced 'sss<N>' entries with a single binary 'sss' attribute
 - Added 'total_sectors' attribute to report the number of valid SSS bytes
 - removed 'mem_size' attribute
---
 .../ABI/testing/sysfs-bus-i2c-devices-m24lr   | 100 ++++++++++++++++++
 1 file changed, 100 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-i2c-devices-m24lr

diff --git a/Documentation/ABI/testing/sysfs-bus-i2c-devices-m24lr b/Documentation/ABI/testing/sysfs-bus-i2c-devices-m24lr
new file mode 100644
index 000000000000..0af1afa45ea0
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-i2c-devices-m24lr
@@ -0,0 +1,100 @@
+What:           /sys/bus/i2c/devices/<busnum>-<primary-addr>/unlock
+Date:           2025-06-8
+KernelVersion:  6.15
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
+Date:           2025-06-8
+KernelVersion:  6.15
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
+Date:           2025-06-8
+KernelVersion:  6.15
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
+Date:           2025-05-31
+KernelVersion:  6.16
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
+Date:           2025-06-8
+KernelVersion:  6.15
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

