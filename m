Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4CE2D94B3;
	Fri,  4 Jul 2025 12:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751632780; cv=none; b=YdMN7ScFwmeDxmkraNyXyf6LhTBrGUGtgah+Fqn7E07Ql2GUOO2G96sKaQGJooyiwj6sA/uhYpVMYWHy8zigMZ/E7bfqSdkb4PyBbP4XfDslnLh2rLNRHaYrj+RPCSAJzUqw/uYwGJtfcc4+5Y4G8mVTNHmpzz5tokPVtAK4fzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751632780; c=relaxed/simple;
	bh=haAArsBIaCLMYn+fzqMTOQZT2x7ckR6s52vp8NB0sJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QhzuggtgWgtN4aGttKu8C6cY9A1KiJ0unwSv3k3UPZbAYVTWh21b5M6OAYTWZ++NQzrQ1WMbXZTnCT14U4YCS9/oGZSlVhCTM5mHBbAwOskLLuwe8kTioqyas1kQSw/z7zo6cudG5kPY4jdFdCWsnmkyEFptunyxrBQs8OBbbYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M2QRAnWa; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M2QRAnWa"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-60c4521ae2cso1564560a12.0;
        Fri, 04 Jul 2025 05:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751632777; x=1752237577; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M0BePG++JTGMS0NHh0YtfxYeLObtiOJoLmtOtSBDm70=;
        b=M2QRAnWa3s/1eYDuBK/P1sVb5TGJimVHF5ikkRId7jkj6v6Iy2kXhf72BQmJecQk34
         NHqj+4ewRL3Df6f8PfxbrDKJ/qEQoDdffykfa/OUJ7CIoXDWh0DCCXbk+uhyI8oHKZgE
         u64jxIuYmn2tlB4UbEoDZmGxqzVL/heUc1NqexU3TioJH2OCM2vgvHpIde8Ic0EIb+Ma
         K3GDpoCBcVDBnN49hcccoaMQWE3kBsEWEof8NkRMvfkSbclVTJDIUd2kou3GdJOQm/34
         AqXtafsgHJfa2L0cBvwFRwcDDi3cJaNcRjL6ianLBjSjf8PyxCzaNSMcQUf+DcijeBhG
         gCZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751632777; x=1752237577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M0BePG++JTGMS0NHh0YtfxYeLObtiOJoLmtOtSBDm70=;
        b=dueWYfKcKo9snd5jwdUXAjENVeMJiIR0WT9F7bcwM4nAddTcpbaIOQDTTpBcgF7xfa
         Mz68AAYa3ciB9HAFAuXVz+BbpGTGUURsY2uEqqLROn4sMwLU0vpRzSN5xqkD/TTVkDo5
         c7fIjXrEm5CsmCQEVAalKh8IOfgbBJKSVrXlvpPHlI6OhfUm+MAIc+an1KT9EgG3Q25X
         135uuCzqM2zJADfUxke3FQFk7FTSNEWho/AC3ZsiXQ5ICyr26z3ldbF4h47QEVrRdx8k
         TBngj0OJVNREYJiY56PDqAabLryMbyS5PoIfEsKLuNYNlo+P4wxNUabZqDq+Sl9WP7iH
         pTxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVk4hzws2aIc9hE7e95AKaOJ/SHZzSziPNKfHkLkJLYe7U3pia+MO0xXi7Qo3VX2FxeJ4hT4WoYxKpn@vger.kernel.org
X-Gm-Message-State: AOJu0YxRyOt/KzNTIxZ5ladOCb7Qyme9vnZlqAZJSttysFGp01ayJOfI
	K1q2J9PuBlDpovVBcxNvqu7bDnBAHpqr+SyPFQ8TeW0GrZR4XaIw+ejvksh64g==
X-Gm-Gg: ASbGncsIZnyo73YEVduLAS1CKv2j/2Xnuome7Lt1OHrE+cs+ZQKmsl/XxVrrcJUlpyA
	PaUllujez4leo78x6n8ISeoxM1eWH1hUtJNqVU06Lll9ZV6CNfI7EGSr2i/dENAzCLx9PwsqW5f
	KUAcLL26TlCMmpeFu++5ePcSnOKg5uz3U1dPnrRsvXKwFooSJCvhrVaZ1MSen1koSRD3ji3Mipc
	VnDbJ+KWgY0IxrJapGOUujwtY/TUpGU5gWEBg3NpdYyAbzUAe4dWaQwPP66oPD9Uxj8MKZbetbP
	QCyGG3+NOX9tIJNXQLDBL/Ze/pW0e5IUvxrAsE9R2Debl8bnv3O5LlMI7U82ecslzODvfFKU1Yn
	kbV+lbqjuo7uuJrni276jHcehHEoZhBUxX/lg6g==
X-Google-Smtp-Source: AGHT+IHLWB6pjah+7yOb8Dyb8eT2w6mn5+S7aG39JoIMayz1missewywuSFXRntDt2LAVnpGFQRNkQ==
X-Received: by 2002:a17:907:84c:b0:ae3:b2b7:7f2f with SMTP id a640c23a62f3a-ae3fbd4423dmr200274166b.40.1751632776526;
        Fri, 04 Jul 2025 05:39:36 -0700 (PDT)
Received: from masalkhi.. (ip-078-042-182-222.um17.pools.vodafone-ip.de. [78.42.182.222])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6b43264sm166648066b.141.2025.07.04.05.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 05:39:36 -0700 (PDT)
From: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: arnd@arndb.de,
	gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	luoyifan@cmss.chinamobile.com,
	abd.masalkhi@gmail.com
Subject: [PATCH v5 3/3] ABI: sysfs: add documentation for ST M24LR EEPROM and control interface
Date: Fri,  4 Jul 2025 12:39:14 +0000
Message-ID: <20250704123914.11216-4-abd.masalkhi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704123914.11216-1-abd.masalkhi@gmail.com>
References: <20250704123914.11216-1-abd.masalkhi@gmail.com>
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

