Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8B22356B4
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 08:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743584229; cv=none; b=FPy+dVzbYigWcchT/JKKG1jaQFtvViimI4RxfKi5QDAqt6PbX85tE75hDbeQ4O++sQ8YIwcmtsJW0Rg1EzzgQoe3C72oJo8sCqI1QxuCBYA8a/bZwKro4fI4OFQX8aI6/Z7W5sI/FRvfLjNVyiRTBHdVGwBwwKeec0/r6adpnzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743584229; c=relaxed/simple;
	bh=J17KQUAM1UFEkPNdLI3YGj21IY194ZTnRhYG21HH2uM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jyGuQbcbEy8n7bRju1IiH784pZGaOvZd5dDhIYEbBmj/8bPHpvX3I6HJQX7sedorGYnu/hSyExf/6kH2mVqYCNtpA/AM5OoqqZQ8lalVJoIwPwxUJKlQwWWpSg2qt9F97PgrykNWpwuUTdmtgRLka4Dvfuug2xrHOVL0L8xlp/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hyQD6zSz; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hyQD6zSz"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22438c356c8so124578015ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 01:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743584226; x=1744189026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+4XJSflMgjyjzi+qNJEGdLwxClIxHg4Ygzp0rQjBYsY=;
        b=hyQD6zSzD6wuDkj1SGaqFmKcH88H8hRaHOQ3yyxFpC/1tIJe3iTywsdGmqlC7liJZF
         1D2jG8SF1pc0qTQtPOqERDzxdtyl2Rk1mJupqCUGZlMN8mAqg6xFNRiEFWg+Pvw45v6x
         fnd1FEPZisS+gzM/2Q/pu6OILX9g9LbjMNx87wCN30VSJAgZ8c15BP/XyyLMxc2u5ADH
         rsoTXf8nVrpO4VrCKo7gm4KLQIZqRWpwstCnRFWcg0v5JJ8hIOYUaUubpnnd5wq8wq5B
         VuPSv8hNJqcWw5Z51WSbhqRrWmko0i+jtyicyk5S2ZahIT+lCYe0JawzWkac4wV13D/S
         JLMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743584226; x=1744189026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+4XJSflMgjyjzi+qNJEGdLwxClIxHg4Ygzp0rQjBYsY=;
        b=mBiOAkyR4vLpAzCOF9Kw/odVqhwid+YL2fDGDbIaON24AB5pfJYJvuUTvTL3HHGXcU
         yCV2zDgBj2RudFl+waih2FiiV1EtAB2V9+pbGBr7Z5FJbT2NpZkk3xvditpfbHDKWoUs
         AJNY63x1mHkpgriHi8W4yi0rPx5bv0Aee36QKfRUHsO3MelPdSklbjJbsta55YPtN0Al
         HfEY9daivS2WkhhpiWDN3BAMSKDAGv6pio42egq+qfHBCQiA8TsBBYfbY7G6iPjMZUf0
         Gay651oXCLOVfxmysD3LJ+0JC6h5NRI6eQb4b6Yp94+84lXZtyoVRCw6Z8n16vm5xBCA
         iBBw==
X-Forwarded-Encrypted: i=1; AJvYcCVTqLJ8+dsbAG6BEgL9N17LfzRYpM1axFrbcPxyrlqP5Alybb1j2SolaxvClwQFXvguDf3+P8ikqFPebxg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwYzCYlRnvPl/Yj/1SK7aNjRmdoeLCeixgUYdp4P+BuOCEx2Io
	eviVkpgfgnELfYLZTo7sVDNAO6siZs8WGQBf60xplDcMi47f3coUkaHW9zWQ0mo=
X-Gm-Gg: ASbGnctE6yd6pNWHfWMP4JePvazaHFBmQBERTIbzv1EHZKsjLkF2un/zDLM7HR2xEZi
	TnZ65BZ5fHzn2vXmkt8H88fWciJau1/8ai9pyw2Mxd5ynK9EcM1djzC8be7tXe+cYKX1z4ntvUt
	jPstsw7N0CnpHAAor93KgW2Uij6ywIZeAAe5/N+CNePVVyWshPFsuyNYGlcLOF8MttY1hTugod0
	ALQ8/83q5eWZRNfPckoYJW4gtTKPG15VgxznW10rSwFbBtTkmZ5BFhhYHJdDvKeA5Vtes0lS8ME
	bOeXArJqY0LKImJxut5Tp7WfxsJIhQfV2cacJn7FujWNn11pHpAE3K/ToA0MX9VLMEy8
X-Google-Smtp-Source: AGHT+IHwQPrOaNhtlYiwAS4XhB+tYwg3EASzgu0dw0IADcCjm0bGuGF5TGg+UMtsF7o//7yupE9vjQ==
X-Received: by 2002:aa7:88c1:0:b0:736:3d7c:2368 with SMTP id d2e1a72fcca58-7398036fc34mr19960413b3a.7.1743584226080;
        Wed, 02 Apr 2025 01:57:06 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739710b38d5sm10741865b3a.139.2025.04.02.01.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 01:57:05 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id EED478058E;
	Wed,  2 Apr 2025 17:06:09 +0800 (CST)
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
Subject: [PATCH 1/3] mtd: spi-nor: macronix: Drop the redundant flash info fields
Date: Wed,  2 Apr 2025 16:51:27 +0800
Message-Id: <20250402085129.1027670-2-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250402085129.1027670-1-linchengming884@gmail.com>
References: <20250402085129.1027670-1-linchengming884@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Cheng Ming Lin <chengminglin@mxic.com.tw>

Many flash devices share the same ID but have different part numbers.
To avoid confusion, the part number field is removed.

Additionally, since SFDP already provides size information and
functionality covered by no_sfdp_flags, these fields are also removed.

Furthermore, when 4-byte address instruction table is available,
the SPI_NOR_4B_OPCODES flag is no longer needed and is removed.

Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
---
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
c22015
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
macronix
zynq> hexdump -Cv /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
00000000  53 46 44 50 00 01 01 ff  00 00 01 09 30 00 00 ff  |SFDP........0...|
00000010  c2 00 01 04 60 00 00 ff  ff ff ff ff ff ff ff ff  |....`...........|
00000020  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000030  e5 20 81 ff ff ff ff 00  00 ff 00 ff 08 3b 00 ff  |. ...........;..|
00000040  ee ff ff ff ff ff 00 ff  ff ff 00 ff 0c 20 10 d8  |............. ..|
00000050  00 ff 00 ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000060  00 36 00 27 f6 4f ff ff  fe cf ff ff ff ff ff ff  |.6.'.O..........|
00000070
zynq> sha256sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
08935e50e96c5981966dfbf2d495a13072270e372db36734e8cfd73f872912f9  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
zynq> cat /sys/kernel/debug/spi-nor/spi0.0/capabilities
Supported read modes by the flash
 1S-1S-1S
  opcode        0x03
  mode cycles   0
  dummy cycles  0
 1S-1S-2S
  opcode        0x3b
  mode cycles   0
  dummy cycles  8

Supported page program modes by the flash
 1S-1S-1S
  opcode        0x02
zynq> cat /sys/kernel/debug/spi-nor/spi0.0/params
name            (null)
id              c2 20 15 c2 20 15
size            2.00 MiB
write size      1
page size       256
address nbytes  3
flags           HAS_16BIT_SR

opcodes
 read           0x3b
  dummy cycles  8
 erase          0xd8
 program        0x02
 8D extension   none

protocols
 read           1S-1S-2S
 write          1S-1S-1S
 register       1S-1S-1S

erase commands
 20 (4.00 KiB) [2]
 d8 (64.0 KiB) [3]
 c7 (2.00 MiB)

sector map
 region (in hex)   | erase mask | overlaid
 ------------------+------------+----------
 00000000-001fffff |     [   3] | no
zynq> dd if=/dev/urandom of=/tmp/spi_test bs=1M count=2
2+0 records in
2+0 records out
2097152 bytes (2.0MB) copied, 0.085111 seconds, 23.5MB/s
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
e27a5ff67d79d89711cd564f46f383b0517cc2456acebaed136edefb27451742  /tmp/spi_read
e27a5ff67d79d89711cd564f46f383b0517cc2456acebaed136edefb27451742  /tmp/spi_test
zynq> mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
zynq> mtd_debug read /dev/mtd0 0 2097152 /tmp/spi_read
Copied 2097152 bytes from address 0x00000000 in flash to /tmp/spi_read
zynq> sha256sum /tmp/spi*
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  /tmp/spi_read
e27a5ff67d79d89711cd564f46f383b0517cc2456acebaed136edefb27451742  /tmp/spi_test
zynq> mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 2097152 (2M)
mtd.erasesize = 65536 (64K)
mtd.writesize = 1
mtd.oobsize = 0
regions = 0

zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
c22018
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
macronix
zynq> hexdump -Cv /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
00000000  53 46 44 50 06 01 02 ff  00 06 01 10 30 00 00 ff  |SFDP........0...|
00000010  c2 00 01 04 10 01 00 ff  84 00 01 02 c0 00 00 ff  |................|
00000020  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000030  e5 20 f1 ff ff ff ff 07  44 eb 08 6b 08 3b 04 bb  |. ......D..k.;..|
00000040  fe ff ff ff ff ff 00 ff  ff ff 44 eb 0c 20 0f 52  |..........D.. .R|
00000050  10 d8 00 ff 82 41 bd 00  81 e5 7b c6 44 03 67 38  |.....A....{.D.g8|
00000060  30 b0 30 b0 f7 bd d5 5c  4a be 29 ff e1 d0 ff ff  |0.0....\J.).....|
00000070  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000080  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000090  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
000000a0  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
000000b0  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
000000c0  00 00 ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
000000d0  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
000000e0  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
000000f0  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000100  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000110  00 36 00 27 9d f9 c0 64  85 cb ff ff ff ff ff ff  |.6.'...d........|
00000120
zynq> sha256sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
c7c4287a584fa23f4f5037a90ab0ee6ddc6ff3f0cee89889e54465e86542c85e  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
zynq> cat /sys/kernel/debug/spi-nor/spi0.0/capabilities
Supported read modes by the flash
 1S-1S-1S
  opcode        0x03
  mode cycles   0
  dummy cycles  0
 1S-1S-2S
  opcode        0x3b
  mode cycles   0
  dummy cycles  8
 1S-2S-2S
  opcode        0xbb
  mode cycles   0
  dummy cycles  4
 1S-1S-4S
  opcode        0x6b
  mode cycles   0
  dummy cycles  8
 1S-4S-4S
  opcode        0xeb
  mode cycles   2
  dummy cycles  4
 4S-4S-4S
  opcode        0xeb
  mode cycles   2
  dummy cycles  4

Supported page program modes by the flash
 1S-1S-1S
  opcode        0x02
zynq> cat /sys/kernel/debug/spi-nor/spi0.0/params
name            (null)
id              c2 20 18 c2 20 18
size            16.0 MiB
write size      1
page size       256
address nbytes  3
flags           HAS_LOCK | HAS_4BIT_BP | SOFT_RESET

opcodes
 read           0xeb
  dummy cycles  6
 erase          0xd8
 program        0x02
 8D extension   none

protocols
 read           1S-4S-4S
 write          1S-1S-1S
 register       1S-1S-1S

erase commands
 20 (4.00 KiB) [1]
 52 (32.0 KiB) [2]
 d8 (64.0 KiB) [3]
 c7 (16.0 MiB)

sector map
 region (in hex)   | erase mask | overlaid
 ------------------+------------+----------
 00000000-00ffffff |     [   3] | no
zynq> dd if=/dev/urandom of=/tmp/spi_test bs=1M count=2
2+0 records in
2+0 records out
2097152 bytes (2.0MB) copied, 0.084103 seconds, 23.8MB/s
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
8efea8e5af575b4fa5097eb68c30c313d2c232daf6a7c0ecd6940cbefbd937b7  /tmp/spi_read
8efea8e5af575b4fa5097eb68c30c313d2c232daf6a7c0ecd6940cbefbd937b7  /tmp/spi_test
zynq> mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
zynq> mtd_debug read /dev/mtd0 0 2097152 /tmp/spi_read
Copied 2097152 bytes from address 0x00000000 in flash to /tmp/spi_read
zynq> sha256sum /tmp/spi*
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  /tmp/spi_read
8efea8e5af575b4fa5097eb68c30c313d2c232daf6a7c0ecd6940cbefbd937b7  /tmp/spi_test
zynq> mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 16777216 (16M)
mtd.erasesize = 65536 (64K)
mtd.writesize = 1
mtd.oobsize = 0
regions = 0

zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
c22019
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
macronix
zynq> hexdump -Cv /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
00000000  53 46 44 50 06 01 02 ff  00 06 01 10 30 00 00 ff  |SFDP........0...|
00000010  c2 00 01 04 10 01 00 ff  84 00 01 02 c0 00 00 ff  |................|
00000020  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000030  e5 20 fb ff ff ff ff 0f  44 eb 08 6b 08 3b 04 bb  |. ......D..k.;..|
00000040  fe ff ff ff ff ff 00 ff  ff ff 44 eb 0c 20 0f 52  |..........D.. .R|
00000050  10 d8 00 ff d6 59 dd 00  82 9f 03 db 44 03 67 38  |.....Y......D.g8|
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
00000110  00 36 00 27 9d f9 c0 64  85 cb ff ff ff ff ff ff  |.6.'...d........|
00000120
zynq> sha256sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
70fa5d53fd09472e3af67d32d82f01ffcbfac31241b2aa81dfaba08527125123  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
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
id              c2 20 19 c2 20 19
size            32.0 MiB
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
 c7 (32.0 MiB)

sector map
 region (in hex)   | erase mask | overlaid
 ------------------+------------+----------
 00000000-01ffffff |     [   3] | no
zynq> dd if=/dev/urandom of=/tmp/spi_test bs=1M count=2
2+0 records in
2+0 records out
2097152 bytes (2.0MB) copied, 0.083873 seconds, 23.8MB/s
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
13695582843c76df744571844a323ba75d6c4c71f4fe27315e78ce8944cf6c2a  /tmp/spi_read
13695582843c76df744571844a323ba75d6c4c71f4fe27315e78ce8944cf6c2a  /tmp/spi_test
zynq> mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
zynq> mtd_debug read /dev/mtd0 0 2097152 /tmp/spi_read
Copied 2097152 bytes from address 0x00000000 in flash to /tmp/spi_read
zynq> sha256sum /tmp/spi*
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  /tmp/spi_read
13695582843c76df744571844a323ba75d6c4c71f4fe27315e78ce8944cf6c2a  /tmp/spi_test
zynq> mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 33554432 (32M)
mtd.erasesize = 65536 (64K)
mtd.writesize = 1
mtd.oobsize = 0
regions = 0

zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
c2201a
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
macronix
zynq> hexdump -Cv /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
00000000  53 46 44 50 00 01 01 ff  00 00 01 09 30 00 00 ff  |SFDP........0...|
00000010  c2 00 01 04 60 00 00 ff  ff ff ff ff ff ff ff ff  |....`...........|
00000020  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000030  e5 20 f3 ff ff ff ff 1f  44 eb 08 6b 08 3b 04 bb  |. ......D..k.;..|
00000040  fe ff ff ff ff ff 00 ff  ff ff 44 eb 0c 20 0f 52  |..........D.. .R|
00000050  10 d8 00 ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000060  00 36 00 27 9d f9 c0 64  85 cb ff ff ff ff ff ff  |.6.'...d........|
00000070
zynq> sha256sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
373bf7251146d12849dbfa877f84f66a46ed3bf7079f2b369cc215a4f077254c  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
zynq> cat /sys/kernel/debug/spi-nor/spi0.0/capabilities
Supported read modes by the flash
 1S-1S-1S
  opcode        0x03
  mode cycles   0
  dummy cycles  0
 1S-1S-2S
  opcode        0x3b
  mode cycles   0
  dummy cycles  8
 1S-2S-2S
  opcode        0xbb
  mode cycles   0
  dummy cycles  4
 1S-1S-4S
  opcode        0x6b
  mode cycles   0
  dummy cycles  8
 1S-4S-4S
  opcode        0xeb
  mode cycles   2
  dummy cycles  4
 4S-4S-4S
  opcode        0xeb
  mode cycles   2
  dummy cycles  4

Supported page program modes by the flash
 1S-1S-1S
  opcode        0x02
 1S-1S-4S
  opcode        0x34
zynq> cat /sys/kernel/debug/spi-nor/spi0.0/params
name            (null)
id              c2 20 1a c2 20 1a
size            64.0 MiB
write size      1
page size       256
address nbytes  4
flags           4B_OPCODES | HAS_16BIT_SR

opcodes
 read           0xec
  dummy cycles  6
 erase          0xdc
 program        0x34
 8D extension   none

protocols
 read           1S-4S-4S
 write          1S-1S-4S
 register       1S-1S-1S

erase commands
 20 (4.00 KiB) [1]
 52 (32.0 KiB) [2]
 d8 (64.0 KiB) [3]
 c7 (64.0 MiB)

sector map
 region (in hex)   | erase mask | overlaid
 ------------------+------------+----------
 00000000-03ffffff |     [   3] | no
zynq> dd if=/dev/urandom of=/tmp/spi_test bs=1M count=2
2+0 records in
2+0 records out
2097152 bytes (2.0MB) copied, 0.083717 seconds, 23.9MB/s
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
9e4550acef4209bb5e51c80dff2b228c42970b5ae2c23a1afd2fdc749594b484  /tmp/spi_read
9e4550acef4209bb5e51c80dff2b228c42970b5ae2c23a1afd2fdc749594b484  /tmp/spi_test
zynq> mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
zynq> mtd_debug read /dev/mtd0 0 2097152 /tmp/spi_read
Copied 2097152 bytes from address 0x00000000 in flash to /tmp/spi_read
zynq> sha256sum /tmp/spi*
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  /tmp/spi_read
9e4550acef4209bb5e51c80dff2b228c42970b5ae2c23a1afd2fdc749594b484  /tmp/spi_test
zynq> mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 67108864 (64M)
mtd.erasesize = 65536 (64K)
mtd.writesize = 1
mtd.oobsize = 0
regions = 0

zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
c2201b
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
macronix
zynq> hexdump -Cv /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
00000000  53 46 44 50 06 01 02 ff  00 06 01 10 30 00 00 ff  |SFDP........0...|
00000010  c2 00 01 04 10 01 00 ff  84 00 01 02 c0 00 00 ff  |................|
00000020  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000030  e5 20 fb ff ff ff ff 3f  44 eb 08 6b 08 3b 04 bb  |. .....?D..k.;..|
00000040  fe ff ff ff ff ff 00 ff  ff ff 44 eb 0c 20 0f 52  |..........D.. .R|
00000050  10 d8 00 ff d6 49 c5 00  85 df 04 e3 44 03 67 38  |.....I......D.g8|
00000060  30 b0 30 b0 f7 bd d5 5c  4a 9e 29 ff f0 50 f9 85  |0.0....\J.)..P..|
00000070  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000080  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000090  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
000000a0  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
000000b0  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
000000c0  7f ef ff ff 21 5c dc ff  ff ff ff ff ff ff ff ff  |....!\..........|
000000d0  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
000000e0  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
000000f0  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000100  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000110  00 36 00 27 9d f9 c0 64  85 cb ff ff ff ff ff ff  |.6.'...d........|
00000120
zynq> sha256sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
bec91ac20c9f7c63a00992fd2f779f8c5378d8f9afc699a2c741be5bdf268e35  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
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
id              c2 20 1b c2 20 1b
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
2097152 bytes (2.0MB) copied, 0.084372 seconds, 23.7MB/s
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
6238ab82a1364a95b63bdff6040c640f8224b111c672a3a75530d862dbace7de  /tmp/spi_read
6238ab82a1364a95b63bdff6040c640f8224b111c672a3a75530d862dbace7de  /tmp/spi_test
zynq> mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
zynq> mtd_debug read /dev/mtd0 0 2097152 /tmp/spi_read
Copied 2097152 bytes from address 0x00000000 in flash to /tmp/spi_read
zynq> sha256sum /tmp/spi*
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  /tmp/spi_read
6238ab82a1364a95b63bdff6040c640f8224b111c672a3a75530d862dbace7de  /tmp/spi_test
zynq> mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 134217728 (128M)
mtd.erasesize = 65536 (64K)
mtd.writesize = 1
mtd.oobsize = 0
regions = 0

zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
c2253a
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
macronix
zynq> hexdump -Cv /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
00000000  53 46 44 50 06 01 02 ff  00 06 01 10 30 00 00 ff  |SFDP........0...|
00000010  c2 00 01 04 10 01 00 ff  84 00 01 02 c0 00 00 ff  |................|
00000020  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000030  e5 20 fb ff ff ff ff 1f  44 eb 08 6b 08 3b 04 bb  |. ......D..k.;..|
00000040  fe ff ff ff ff ff 00 ff  ff ff 44 eb 0c 20 0f 52  |..........D.. .R|
00000050  10 d8 00 ff 87 49 b5 00  82 df 04 e2 44 03 67 38  |.....I......D.g8|
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
00000110  00 20 50 16 9d f9 c0 64  85 cb ff ff ff ff ff ff  |. P....d........|
00000120
zynq> sha256sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
faa50d0c2c8f26dbdfb400c995bd19a4a492404336588a72c596088c5641164f  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
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
id              c2 25 3a c2 25 3a
size            64.0 MiB
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
 c7 (64.0 MiB)

sector map
 region (in hex)   | erase mask | overlaid
 ------------------+------------+----------
 00000000-03ffffff |     [   3] | no
zynq> dd if=/dev/urandom of=/tmp/spi_test bs=1M count=2
2+0 records in
2+0 records out
2097152 bytes (2.0MB) copied, 0.084626 seconds, 23.6MB/s
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
41a0ed8ab44ff2005767e66f5afd4e1fc0b8be4fb84df4ce6bc0adeb6a327565  /tmp/spi_read
41a0ed8ab44ff2005767e66f5afd4e1fc0b8be4fb84df4ce6bc0adeb6a327565  /tmp/spi_test
zynq> mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
zynq> mtd_debug read /dev/mtd0 0 2097152 /tmp/spi_read
Copied 2097152 bytes from address 0x00000000 in flash to /tmp/spi_read
zynq> sha256sum /tmp/spi*
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  /tmp/spi_read
41a0ed8ab44ff2005767e66f5afd4e1fc0b8be4fb84df4ce6bc0adeb6a327565  /tmp/spi_test
zynq> mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 67108864 (64M)
mtd.erasesize = 65536 (64K)
mtd.writesize = 1
mtd.oobsize = 0
regions = 0

zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
c2253c
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
macronix
zynq> hexdump -Cv /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
00000000  53 46 44 50 06 01 02 ff  00 06 01 10 30 00 00 ff  |SFDP........0...|
00000010  c2 00 01 04 10 01 00 ff  84 00 01 02 c0 00 00 ff  |................|
00000020  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000030  e5 20 fb ff ff ff ff 7f  44 eb 08 6b 08 3b 04 bb  |. ......D..k.;..|
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
cc502e1eba91c51e5758d7c41b19e77bfe5a403c2145e4572777c41f9bd48ae1  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
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
id              c2 25 3c c2 25 3c
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
2097152 bytes (2.0MB) copied, 0.084135 seconds, 23.8MB/s
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
ab0d96ddd3bfa96c2fc6e8ab466f82d0ac9b1b54ae04331a46388790407c1a0d  /tmp/spi_read
ab0d96ddd3bfa96c2fc6e8ab466f82d0ac9b1b54ae04331a46388790407c1a0d  /tmp/spi_test
zynq> mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
zynq> mtd_debug read /dev/mtd0 0 2097152 /tmp/spi_read
Copied 2097152 bytes from address 0x00000000 in flash to /tmp/spi_read
zynq> sha256sum /tmp/spi*
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  /tmp/spi_read
ab0d96ddd3bfa96c2fc6e8ab466f82d0ac9b1b54ae04331a46388790407c1a0d  /tmp/spi_test
zynq> mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 268435456 (256M)
mtd.erasesize = 65536 (64K)
mtd.writesize = 1
mtd.oobsize = 0
regions = 0

zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
c2813a
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
macronix
zynq> hexdump -Cv /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
00000000  53 46 44 50 08 01 04 fd  00 07 01 14 40 00 00 ff  |SFDP........@...|
00000010  87 01 01 1c 90 00 00 ff  0a 00 01 08 00 01 00 ff  |................|
00000020  05 00 01 05 20 01 00 ff  84 00 01 02 34 01 00 ff  |.... .......4...|
00000030  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
00000040  e5 20 8a ff ff ff ff 1f  00 ff 00 ff 00 ff 00 ff  |. ..............|
00000050  ee ff ff ff ff ff 00 ff  ff ff 00 ff 0c 20 10 d8  |............. ..|
00000060  00 ff 00 ff 8b 79 01 00  8f 12 00 e2 cc 04 67 46  |.....y........gF|
00000070  30 b0 30 b0 f4 bd d5 5c  00 00 00 ff 10 10 00 20  |0.0....\....... |
00000080  00 00 00 00 00 00 7c a3  48 00 00 00 00 00 77 77  |......|.H.....ww|
00000090  00 00 00 00 00 00 00 40  0f d1 ff f3 0f d1 ff f3  |.......@........|
000000a0  00 05 00 90 00 05 00 b1  00 2b 00 95 00 2b 00 96  |.........+...+..|
000000b0  72 71 03 b8 72 71 03 b8  00 00 00 00 90 a3 18 82  |rq..rq..........|
000000c0  00 c0 69 96 00 00 00 00  00 00 00 00 72 71 00 98  |..i.........rq..|
000000d0  72 71 00 b8 72 71 00 99  00 00 00 00 72 71 00 98  |rq..rq......rq..|
000000e0  72 71 00 f8 72 71 00 99  72 71 00 f9 00 00 00 00  |rq..rq..rq......|
000000f0  00 00 00 00 01 15 01 d0  72 71 06 d8 00 00 86 50  |........rq.....P|
00000100  00 00 06 01 00 00 00 00  02 00 01 03 00 02 00 00  |................|
00000110  00 00 06 01 00 00 00 00  00 00 72 06 00 02 00 00  |..........r.....|
00000120  00 ee c0 69 72 72 71 71  00 d8 f7 f6 00 00 00 00  |...irrqq........|
00000130  14 45 98 80 43 06 0f 00  21 dc ff ff              |.E..C...!...|
0000013c
zynq> sha256sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
492e48f9266779b75fd21c689b8fb651a03881d72d241f4db9edecf9d493fc1b  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
zynq> cat /sys/kernel/debug/spi-nor/spi0.0/capabilities
Supported read modes by the flash
 1S-1S-1S
  opcode        0x13
  mode cycles   0
  dummy cycles  0
 8D-8D-8D
  opcode        0xee
  mode cycles   0
  dummy cycles  16

Supported page program modes by the flash
 1S-1S-1S
  opcode        0x12
 8D-8D-8D
  opcode        0x12
zynq> cat /sys/kernel/debug/spi-nor/spi0.0/params
name            (null)
id              c2 81 3a c2 81 3a
size            64.0 MiB
write size      1
page size       256
address nbytes  4
flags           4B_OPCODES | HAS_4BAIT | HAS_16BIT_SR | IO_MODE_EN_VOLATILE | SOFT_RESET | RWW | 1<<17

opcodes
 read           0xee
  dummy cycles  16
 erase          0xdc
 program        0x12
 8D extension   invert

protocols
 read           8D-8D-8D
 write          8D-8D-8D
 register       8D-8D-8D

erase commands
 21 (4.00 KiB) [2]
 dc (64.0 KiB) [3]
 c7 (64.0 MiB)

sector map
 region (in hex)   | erase mask | overlaid
 ------------------+------------+----------
 00000000-03ffffff |     [   3] | no
zynq> dd if=/dev/urandom of=/tmp/spi_test bs=1M count=2
2+0 records in
2+0 records out
2097152 bytes (2.0MB) copied, 0.085986 seconds, 23.3MB/s
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
92f3075bebc368c9675ea8019fb3b175576fd8fcef45f32126b1e0f961bcbf29  /tmp/spi_read
92f3075bebc368c9675ea8019fb3b175576fd8fcef45f32126b1e0f961bcbf29  /tmp/spi_test
zynq> mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
zynq> mtd_debug read /dev/mtd0 0 2097152 /tmp/spi_read
Copied 2097152 bytes from address 0x00000000 in flash to /tmp/spi_read
zynq> sha256sum /tmp/spi*
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  /tmp/spi_read
92f3075bebc368c9675ea8019fb3b175576fd8fcef45f32126b1e0f961bcbf29  /tmp/spi_test
zynq> mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 67108864 (64M)
mtd.erasesize = 65536 (64K)
mtd.writesize = 1
mtd.oobsize = 0
regions = 0

zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
c29e16
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
macronix
zynq> hexdump -Cv /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
00000000  53 46 44 50 00 01 01 ff  00 00 01 09 30 00 00 ff  |SFDP........0...|
00000010  c2 00 01 04 60 00 00 ff  ff ff ff ff ff ff ff ff  |....`...........|
00000020  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000030  e5 20 f1 ff ff ff ff 01  44 eb 08 6b 08 3b 04 bb  |. ......D..k.;..|
00000040  ee ff ff ff ff ff 00 ff  ff ff 00 ff 0c 20 0f 52  |............. .R|
00000050  10 d8 00 ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000060  00 36 00 27 9e 49 ff ff  d9 f8 ff ff ff ff ff ff  |.6.'.I..........|
00000070
zynq> sha256sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
cf7b2e5b00388040786877de15f7594fcc064a1b7dbe34393a06d462cc1da9b0  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
zynq> cat /sys/kernel/debug/spi-nor/spi0.0/capabilities
Supported read modes by the flash
 1S-1S-1S
  opcode        0x03
  mode cycles   0
  dummy cycles  0
 1S-1S-2S
  opcode        0x3b
  mode cycles   0
  dummy cycles  8
 1S-2S-2S
  opcode        0xbb
  mode cycles   0
  dummy cycles  4
 1S-1S-4S
  opcode        0x6b
  mode cycles   0
  dummy cycles  8
 1S-4S-4S
  opcode        0xeb
  mode cycles   2
  dummy cycles  4

Supported page program modes by the flash
 1S-1S-1S
  opcode        0x02
zynq> cat /sys/kernel/debug/spi-nor/spi0.0/params
name            (null)
id              c2 9e 16 c2 9e 16
size            4.00 MiB
write size      1
page size       256
address nbytes  3
flags           HAS_16BIT_SR

opcodes
 read           0xeb
  dummy cycles  6
 erase          0xd8
 program        0x02
 8D extension   none

protocols
 read           1S-4S-4S
 write          1S-1S-1S
 register       1S-1S-1S

erase commands
 20 (4.00 KiB) [1]
 52 (32.0 KiB) [2]
 d8 (64.0 KiB) [3]
 c7 (4.00 MiB)

sector map
 region (in hex)   | erase mask | overlaid
 ------------------+------------+----------
 00000000-003fffff |     [   3] | no
zynq> dd if=/dev/urandom of=/tmp/spi_test bs=1M count=2
2+0 records in
2+0 records out
2097152 bytes (2.0MB) copied, 0.084090 seconds, 23.8MB/s
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
4f28908b56bf0242163de2bb1f52295ed45b98d16fdbfdc9fd30d1dfcdc540cb  /tmp/spi_read
4f28908b56bf0242163de2bb1f52295ed45b98d16fdbfdc9fd30d1dfcdc540cb  /tmp/spi_test
zynq> mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
zynq> mtd_debug read /dev/mtd0 0 2097152 /tmp/spi_read
Copied 2097152 bytes from address 0x00000000 in flash to /tmp/spi_read
zynq> sha256sum /tmp/spi*
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  /tmp/spi_read
4f28908b56bf0242163de2bb1f52295ed45b98d16fdbfdc9fd30d1dfcdc540cb  /tmp/spi_test
zynq> mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 4194304 (4M)
mtd.erasesize = 65536 (64K)
mtd.writesize = 1
mtd.oobsize = 0
regions = 0

 drivers/mtd/spi-nor/macronix.c | 36 +++++++++-------------------------
 1 file changed, 9 insertions(+), 27 deletions(-)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 4b09e5add630..2acd8e28d1c4 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -88,10 +88,8 @@ static const struct flash_info macronix_nor_parts[] = {
 		.name = "mx25l8005",
 		.size = SZ_1M,
 	}, {
+		/* MX25L1606E */
 		.id = SNOR_ID(0xc2, 0x20, 0x15),
-		.name = "mx25l1606e",
-		.size = SZ_2M,
-		.no_sfdp_flags = SECT_4K,
 	}, {
 		.id = SNOR_ID(0xc2, 0x20, 0x16),
 		.name = "mx25l3205d",
@@ -103,29 +101,21 @@ static const struct flash_info macronix_nor_parts[] = {
 		.size = SZ_8M,
 		.no_sfdp_flags = SECT_4K,
 	}, {
+		/* MX25L12805D */
 		.id = SNOR_ID(0xc2, 0x20, 0x18),
-		.name = "mx25l12805d",
-		.size = SZ_16M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP,
-		.no_sfdp_flags = SECT_4K,
 	}, {
+		/* MX25L25635E, MX25L25645G */
 		.id = SNOR_ID(0xc2, 0x20, 0x19),
-		.name = "mx25l25635e",
-		.size = SZ_32M,
-		.no_sfdp_flags = SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.fixups = &mx25l25635_fixups
 	}, {
+		/* MX66L51235F */
 		.id = SNOR_ID(0xc2, 0x20, 0x1a),
-		.name = "mx66l51235f",
-		.size = SZ_64M,
-		.no_sfdp_flags = SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.fixup_flags = SPI_NOR_4B_OPCODES,
 		.fixups = &macronix_qpp4b_fixups,
 	}, {
+		/* MX66L1G45G */
 		.id = SNOR_ID(0xc2, 0x20, 0x1b),
-		.name = "mx66l1g45g",
-		.size = SZ_128M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.fixups = &macronix_qpp4b_fixups,
 	}, {
 		/* MX66L2G45G */
@@ -167,11 +157,8 @@ static const struct flash_info macronix_nor_parts[] = {
 		.size = SZ_16M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
+		/* MX25U51245G */
 		.id = SNOR_ID(0xc2, 0x25, 0x3a),
-		.name = "mx25u51245g",
-		.size = SZ_64M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
-		.fixup_flags = SPI_NOR_4B_OPCODES,
 		.fixups = &macronix_qpp4b_fixups,
 	}, {
 		.id = SNOR_ID(0xc2, 0x25, 0x3a),
@@ -185,11 +172,8 @@ static const struct flash_info macronix_nor_parts[] = {
 		.id = SNOR_ID(0xc2, 0x25, 0x3b),
 		.fixups = &macronix_qpp4b_fixups,
 	}, {
+		/* MX66U2G45G */
 		.id = SNOR_ID(0xc2, 0x25, 0x3c),
-		.name = "mx66u2g45g",
-		.size = SZ_256M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
-		.fixup_flags = SPI_NOR_4B_OPCODES,
 		.fixups = &macronix_qpp4b_fixups,
 	}, {
 		.id = SNOR_ID(0xc2, 0x26, 0x18),
@@ -215,15 +199,13 @@ static const struct flash_info macronix_nor_parts[] = {
 		.size = SZ_4M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
+		/* MX25UW51245G */
 		.id = SNOR_ID(0xc2, 0x81, 0x3a),
-		.name = "mx25uw51245g",
 		.n_banks = 4,
 		.flags = SPI_NOR_RWW,
 	}, {
+		/* MX25L3255E */
 		.id = SNOR_ID(0xc2, 0x9e, 0x16),
-		.name = "mx25l3255e",
-		.size = SZ_4M,
-		.no_sfdp_flags = SECT_4K,
 	},
 	/*
 	 * This spares us of adding new flash entries for flashes that can be
-- 
2.25.1

