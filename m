Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71FA1AE877
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 08:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738916578; cv=none; b=EScI6iv6XopqWFNKh0l+Knm3P7SyN/Z5yDydgdQBn4OPIrBnTZHXP4wXgjI24Qo8sl/tQ2MdwX6V3Sm1+Dq0gbyVfZxmfN1Gnw5XRs2prlaxwMlOvc30/UdEWkUomtbbKjZIL93jNcBatZbBwtViuKNAnY9Te0gT9jUN+YG6BdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738916578; c=relaxed/simple;
	bh=uyIPqJtcAeA2olpBoS+hiPrvu9ArIEtSVxfiTvl9wHQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=A1j4JMFVy3svcdOne+lfj0bAQNmZr53bJgPL2xbQxQe+/iO4hBXksfTta0k7y+8Y0om7nYQHfH7HZPsV7WhRQ4n90fuAqP01cSist5PDXuxXrZ7Blo3nsm8SnuJSc1u85T5i4TZB5oomIErExCvlWJWO85vHtOSRdEGiF9f/U6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OH/JSeeV; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OH/JSeeV"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-21f48ebaadfso20293025ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 00:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738916576; x=1739521376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lbQ9smQGiQ3pQ47PhLzxsopzKF4AYaEjDdxKrNjHerU=;
        b=OH/JSeeV6HdR6IthtRwKi9cdciyUo0rghxfxyQPwVaNPmZG4PzakkHEFLQkuPy5H/r
         GjEnD7PwubJ+WWFHx9ebtJz5Ao0dF9IjkUJLmizxuDJeHSN+96WNfSHIGqu6UPSg1vtf
         jKmDtDBDazvRBSSCjcx91ijX/UVnv+07xvpIP3g0l+ZED6qbW0MubNOemkC6D8gAQNcj
         ZRc2YElI3MmgMKod0PlZiC6+p/9uSS85SsWL1brg6YWdM0B3wOD06Tcbe0QVxPJzp2Oe
         MdTOApzfi3qtPZWbkfZxW6dmuZXZ7TT9D5sXbnXVKhDwbYkBZoALgYtdNEp5LQU1oZU9
         GR0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738916576; x=1739521376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lbQ9smQGiQ3pQ47PhLzxsopzKF4AYaEjDdxKrNjHerU=;
        b=rPbxK7FWFLwuTJvqI/nJAZF3czLJAaagYpmiEGMs3f7xHfl8/NuXHBgZspCTbZj+Uo
         AHQqndgrRAg2AI4EJNxm1eZqwTd/cEWk0mzKkWQqTpOZgjJUlw/2G7M8GAEgDhtb6yf5
         lhcRlcF+DWU3HbaNMmldWarzuAhFEzFTI96xxvEPk3ttIQ4tz/nUPWi4F6bno+UXvOyR
         O6VWY/xW7PfRYSxjc+tNSr9ge8ScfJ3ZwntBT9fYbvNmj3imiVKtHIMTBZfRVV4gNrD9
         Ys1RQ0kHoPUA6wT3DEECR0fgCpmODhlcMj5BNVXcmSVr8rmqfsAazxFf3tahQ11htDy1
         lJoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVE4yXjJ/KX8dsjA/QYrxrDFpw1PolAID7JQpWEiz9HqdJBQcHb1rxJSJN/sYnhgX3Lhv1wOrN2D2rBo1g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9ssEfVKCT+6vnCXbc+ZkILeTbqyZl821qkrdErVmNw/Rb6PNX
	F8w4NLUeA1bARTZuOMCFiSGfOeOpnGmwfTUf7MvjJ3Ggt/oUYBrIuafhug==
X-Gm-Gg: ASbGncsXrp2M1CBf+076KWk3+rhVEndJoDuZfaA2FCU6opdorMI9GU0FeTzQUvy+PPI
	naygphsdHTBjBIzwK+1mqSUQR3J2UrlHpYVUwIiNe4SJctYWH6xA7G1SBev591vKblx+OLoh/W/
	1iI6CZjJkHYejErt9829DbEMgADiwS7Y99ZKrJpatBauNvh+VfLXff84AXYaxVROkaXFk2kLc8p
	QDLl9XxPGfSgbxsfam7GCYZ3XoC3wHqjccF3smqZa1QluLK5Z3Uw9DBRYfKhOuqPj5/lFEQLfqd
	4ImQAfxHeuUvlZ6UqBWYQZ74mvZFPimso/ryB+M=
X-Google-Smtp-Source: AGHT+IHkz5YJLMmlyCKbgMmwY1B9eZyCM6gtFZO7Tzp+qwSeB03U8dc72lq9ltLkPefYXgVcG6LALg==
X-Received: by 2002:a05:6a21:9003:b0:1e0:ce71:48e0 with SMTP id adf61e73a8af0-1ee03b70c4cmr4837597637.39.1738916576105;
        Fri, 07 Feb 2025 00:22:56 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048a9e0bdsm2487921b3a.24.2025.02.07.00.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 00:22:55 -0800 (PST)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 5A54A805EC;
	Fri,  7 Feb 2025 16:33:31 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH 2/2] mtd: spi-nor: macronix: Add support for Macronix NOR Flash
Date: Fri,  7 Feb 2025 16:18:46 +0800
Message-Id: <20250207081846.362919-3-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250207081846.362919-1-linchengming884@gmail.com>
References: <20250207081846.362919-1-linchengming884@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Cheng Ming Lin <chengminglin@mxic.com.tw>

Due to incorrect values in the 4-BAIT table for these two flash IDs,
it is necessary to add these two flash IDs with fixups.

Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
---
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
c2201c
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
macronix
zynq> hexdump -Cv /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
00000000  53 46 44 50 06 01 02 ff  00 06 01 10 30 00 00 ff  |SFDP........0...|
00000010  c2 00 01 04 10 01 00 ff  84 00 01 02 c0 00 00 ff  |................|
00000020  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000030  e5 20 fb ff ff ff ff 7f  44 eb 08 6b 08 3b 04 bb  |. ......D..k.;..|
00000040  fe ff ff ff ff ff 00 ff  ff ff 44 eb 0c 20 0f 52  |..........D.. .R|
00000050  10 d8 00 ff 87 49 bd 00  84 d2 04 e2 44 03 67 38  |.....I......D.g8|
00000060  30 b0 30 b0 f7 bd ff 5c  4a 9e 29 ff f0 50 f9 85  |0.0....\J.)..P..|
00000070  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000080  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000090  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
000000a0  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
000000b0  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
000000c0  7f 8f ff ff 21 5c dc ff  ff ff ff ff ff ff ff ff  |....!\..........|
000000d0  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
000000e0  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
000000f0  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000100  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000110  00 36 00 27 9d f9 c0 64  85 cb ff ff ff ff ff ff  |.6.'...d........|
00000120
zynq> sha256sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
9af233495e5cffd2f38e9e2b8334a0d51c01fa93e9a17a991f674c8d6a350358  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
zynq> cat /sys/kernel/debug/spi-nor/spi0.0/capabilities
Supported read modes by the flash
 1S-1S-1S
  opcode        0x13
  mode cycles   0
  dummy cycles  0
 1S-1S-2S
  opcode        0x3c
  mode cycles   0
  dummy cycles  8
 1S-2S-2S
  opcode        0xbc
  mode cycles   0
  dummy cycles  4
 1S-1S-4S
  opcode        0x6c
  mode cycles   0
  dummy cycles  8
 1S-4S-4S
  opcode        0xec
  mode cycles   2
  dummy cycles  4
 4S-4S-4S
  opcode        0xec
  mode cycles   2
  dummy cycles  4

Supported page program modes by the flash
 1S-1S-1S
  opcode        0x12
 1S-1S-4S
  opcode        0x34
 1S-4S-4S
  opcode        0x3e
zynq> cat /sys/kernel/debug/spi-nor/spi0.0/params
name            (null)
id              c2 20 1c c2 20 1c
size            256 MiB
write size      1
page size       256
address nbytes  4
flags           4B_OPCODES | HAS_4BAIT | SOFT_RESET

opcodes
 read           0xec
  dummy cycles  6
 erase          0xdc
 program        0x3e
 8D extension   none

protocols
 read           1S-4S-4S
 write          1S-4S-4S
 register       1S-1S-1S

erase commands
 21 (4.00 KiB) [1]
 5c (32.0 KiB) [2]
 dc (64.0 KiB) [3]
 c7 (256 MiB)

sector map
 region (in hex)   | erase mask | overlaid
 ------------------+------------+----------
 00000000-0fffffff |     [   3] | no
zynq> dd if=/dev/urandom of=/tmp/spi_test bs=1M count=2
2+0 records in
2+0 records out
2097152 bytes (2.0MB) copied, 0.082418 seconds, 24.3MB/s
zynq> mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
zynq> mtd_debug read /dev/mtd0 0 2097152 /tmp/spi_read
Copied 2097152 bytes from address 0x00000000 in flash to /tmp/spi_read
zynq> hexdump /tmp/spi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0200000
zynq> sha256sum /tmp/spi_read
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  /tmp/spi_read
zynq> mtd_debug write /dev/mtd0 0 2097152 /tmp/spi_test
Copied 2097152 bytes from /tmp/spi_test to address 0x00000000 in flash
zynq> mtd_debug read /dev/mtd0 0 2097152 /tmp/spi_read
Copied 2097152 bytes from address 0x00000000 in flash to /tmp/spi_read
zynq> sha256sum /tmp/spi*
affd6358abe2a75a7edd4d28a9c62bbb25d485c8958993d6e4fbc3de579b8dc0  /tmp/spi_read
affd6358abe2a75a7edd4d28a9c62bbb25d485c8958993d6e4fbc3de579b8dc0  /tmp/spi_test
zynq> mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
zynq> mtd_debug read /dev/mtd0 0 2097152 /tmp/spi_read
Copied 2097152 bytes from address 0x00000000 in flash to /tmp/spi_read
zynq> sha256sum /tmp/spi*
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  /tmp/spi_read
affd6358abe2a75a7edd4d28a9c62bbb25d485c8958993d6e4fbc3de579b8dc0  /tmp/spi_test

zynq> mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 268435456 (256M)
mtd.erasesize = 65536 (64K)
mtd.writesize = 1
mtd.oobsize = 0
regions = 0

zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
c2253b
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
macronix
zynq> hexdump -Cv /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
00000000  53 46 44 50 06 01 02 ff  00 06 01 10 30 00 00 ff  |SFDP........0...|
00000010  c2 00 01 04 10 01 00 ff  84 00 01 02 c0 00 00 ff  |................|
00000020  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000030  e5 20 fb ff ff ff ff 3f  44 eb 08 6b 08 3b 04 bb  |. .....?D..k.;..|
00000040  fe ff ff ff ff ff 00 ff  ff ff 44 eb 0c 20 0f 52  |..........D.. .R|
00000050  10 d8 00 ff 89 49 bd 00  8d 12 00 e2 44 03 67 44  |.....I......D.gD|
00000060  30 b0 30 b0 f7 bd d5 5c  4a 9e 29 ff f0 50 f9 85  |0.0....\J.)..P..|
00000070  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000080  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000090  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
000000a0  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
000000b0  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
000000c0  7f 8f ff ff 21 5c dc ff  ff ff ff ff ff ff ff ff  |....!\..........|
000000d0  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
000000e0  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
000000f0  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000100  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000110  00 20 00 17 9d f9 c0 64  85 cb ff ff ff ff ff ff  |. .....d........|
00000120
zynq> sha256sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
ef47525560aa30ca7eb4634eb2eb15a0aa618d3b61f774933f9935d05fb475f6  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
zynq> cat /sys/kernel/debug/spi-nor/spi0.0/capabilities
Supported read modes by the flash
 1S-1S-1S
  opcode        0x13
  mode cycles   0
  dummy cycles  0
 1S-1S-2S
  opcode        0x3c
  mode cycles   0
  dummy cycles  8
 1S-2S-2S
  opcode        0xbc
  mode cycles   0
  dummy cycles  4
 1S-1S-4S
  opcode        0x6c
  mode cycles   0
  dummy cycles  8
 1S-4S-4S
  opcode        0xec
  mode cycles   2
  dummy cycles  4
 4S-4S-4S
  opcode        0xec
  mode cycles   2
  dummy cycles  4

Supported page program modes by the flash
 1S-1S-1S
  opcode        0x12
 1S-1S-4S
  opcode        0x34
 1S-4S-4S
  opcode        0x3e

zynq> cat /sys/kernel/debug/spi-nor/spi0.0/params
name            (null)
id              c2 25 3b c2 25 3b
size            128 MiB
write size      1
page size       256
address nbytes  4
flags           4B_OPCODES | HAS_4BAIT | SOFT_RESET

opcodes
 read           0xec
  dummy cycles  6
 erase          0xdc
 program        0x3e
 8D extension   none

protocols
 read           1S-4S-4S
 write          1S-4S-4S
 register       1S-1S-1S

erase commands
 21 (4.00 KiB) [1]
 5c (32.0 KiB) [2]
 dc (64.0 KiB) [3]
 c7 (128 MiB)

sector map
 region (in hex)   | erase mask | overlaid
 ------------------+------------+----------
 00000000-07ffffff |     [   3] | no

zynq> dd if=/dev/urandom of=/tmp/spi_test bs=1M count=2
2+0 records in
2+0 records out
2097152 bytes (2.0MB) copied, 0.082397 seconds, 24.3MB/s
zynq> mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
zynq> mtd_debug read /dev/mtd0 0 2097152 /tmp/spi_read
Copied 2097152 bytes from address 0x00000000 in flash to /tmp/spi_read
zynq> hexdump /tmp/spi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0200000
zynq> sha256sum /tmp/spi_read
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  /tmp/spi_read
zynq> mtd_debug write /dev/mtd0 0 2097152 /tmp/spi_test
Copied 2097152 bytes from /tmp/spi_test to address 0x00000000 in flash
zynq> mtd_debug read /dev/mtd0 0 2097152 /tmp/spi_read
Copied 2097152 bytes from address 0x00000000 in flash to /tmp/spi_read
zynq> sha256sum /tmp/spi*
8b57e38d293cf08cca7ef239ee70d20d70356ae798c2065576463414e490a759  /tmp/spi_read
8b57e38d293cf08cca7ef239ee70d20d70356ae798c2065576463414e490a759  /tmp/spi_test
zynq> mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
zynq> mtd_debug read /dev/mtd0 0 2097152 /tmp/spi_read
Copied 2097152 bytes from address 0x00000000 in flash to /tmp/spi_read
zynq> sha256sum /tmp/spi*
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  /tmp/spi_read
8b57e38d293cf08cca7ef239ee70d20d70356ae798c2065576463414e490a759  /tmp/spi_test

zynq> mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 134217728 (128M)
mtd.erasesize = 65536 (64K)
mtd.writesize = 1
mtd.oobsize = 0
regions = 0

 drivers/mtd/spi-nor/macronix.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index ada17999ccbb..d8c7607b3f22 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -127,6 +127,9 @@ static const struct flash_info macronix_nor_parts[] = {
 		.size = SZ_128M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.fixups = &macronix_qpp4b_fixups,
+	}, {
+		.id = SNOR_ID(0xc2, 0x20, 0x1c),
+		.fixups = &macronix_qpp4b_fixups,
 	}, {
 		.id = SNOR_ID(0xc2, 0x23, 0x14),
 		.name = "mx25v8035f",
@@ -182,6 +185,9 @@ static const struct flash_info macronix_nor_parts[] = {
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.fixup_flags = SPI_NOR_4B_OPCODES,
 		.fixups = &macronix_qpp4b_fixups,
+	}, {
+		.id = SNOR_ID(0xc2, 0x25, 0x3b),
+		.fixups = &macronix_qpp4b_fixups,
 	}, {
 		.id = SNOR_ID(0xc2, 0x25, 0x3c),
 		.name = "mx66u2g45g",
-- 
2.25.1

