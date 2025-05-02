Received: from freeshell.de (freeshell.de [116.202.128.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA0E218AC4;
	Fri,  2 May 2025 10:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.202.128.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746182320; cv=none; b=CrAMmUQt5E5aIJZ6N84hPDFIUQLXyFR06Dx8L4Dm+zIdL6cbnuFrtkGXRcYJwTuBk0LudZCZi/jNBiuR5YPB6XJFFstWuEz0f47fXTDX9xN0Hgw1c3rfvhOPeiHORtl61k8lR0fbje7aOKYU5Nlpehu3HxTpKrACfCDp9iJz2rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746182320; c=relaxed/simple;
	bh=AQnW11KWu9mqpFt20FwUtyK06KEjtBjjaWlsRp9FXGA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k/9AeAPHW8wnAyFVdJRBw9uqM4Pzn2njEBJVWw3UrMSaKVw2WP4JmEVRQZtk4S0jmz+VMJhNB2XY2fBMuWjX0LYYNWS9OV/sZF5v6dUg/af5Ie3aKP9zeIR8AQPcmOCRLGcRyq/kwec598Kc2NMDvwSsbGS7unFQ/XBchHKCAwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=freeshell.de; spf=pass smtp.mailfrom=freeshell.de; arc=none smtp.client-ip=116.202.128.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=freeshell.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freeshell.de
Received: from hay.lan. (unknown [IPv6:2605:59c0:20f3:a400:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id DA9EFB4C23D2;
	Fri,  2 May 2025 12:31:18 +0200 (CEST)
From: E Shattow <e@freeshell.de>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	E Shattow <e@freeshell.de>
Subject: [PATCH v3 0/4] riscv: dts: starfive: jh7110-common: Sync downstream U-Boot changes
Date: Fri,  2 May 2025 03:30:40 -0700
Message-ID: <20250502103101.957016-1-e@freeshell.de>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

U-Boot boot loader has adopted using the Linux dt-rebasing tree for dts
with StarFive VisionFive2 board target (and related JH7110 common boards).
Sync the minimum changes from jh7110-common.dtsi needed for boot so these
can be dropped from U-Boot.

Changes since v2:

- 1/5 -> 1/4: Do not replace assigned CPU core or PLL0 clock when adding new
  assignments. Adjust patch name and commit message accordingly.
- 2/5 -> 2/4: Detail reason for qspi setting changes in commit message
- 3/5 -> Drop uart0 clock-frequency patch
- 4/5 -> 3/4: Add reviewed by tag (no change)
- 5/5 -> 4/4: Follow dts coding style sort order. Add bootph-pre-ram hint
  for mmc interfaces

Note: mmc boot source modes of JH7110 loader on mask ROM are deprecated as
of StarFive JH7110 User Guide 1.2 revision. The loader expects data within
range of LBA 0 and LBA 1 in conflict with GUID Partition Table.

SD Card and eMMC boot media are prepared as follows:

# GPT partition SD Card or eMMC as
# 1: Secondary Program Loader @ 0x200000
# 2: Main payload area for use by SPL
# 3: EFI System Partition
sgdisk --clear \
  --new=1:2M:+2M --typecode=1:2E54B353-1271-4842-806F-E436D6AF6985 \
  --new=2:4M:+4M --typecode=2:5B193300-FC78-40CD-8002-E86C45580B47 \
  --new=3:8M:+100M --typecode=3:EF00 /dev/sdX

# Write offset value in bytes of loader 'backup section' SPL as part1 @ 2M
python3 <<-EOF
with open("/dev/sdX", "r+b") as f:
  f.seek(0x0004)
  f.write((0x200000).to_bytes(4, "little"))
EOF

# Write invalid CRC to trigger 'Main section boot fail,use backup section'
python3 <<-EOF
with open("/dev/sdX", "r+b") as f:
  f.seek(0x0290)
  f.write((0x5A5A5A5A).to_bytes(4, "little"))
EOF

E Shattow (4):
  riscv: dts: starfive: jh7110-common: add CPU BUS PERH QSPI clocks to
    syscrg
  riscv: dts: starfive: jh7110-common: qspi flash setting read-delay 2
    cycles max 100MHz
  riscv: dts: starfive: jh7110-common: add eeprom node to i2c5
  riscv: dts: starfive: jh7110-common: bootph-pre-ram hinting needed by
    boot loader

 .../boot/dts/starfive/jh7110-common.dtsi      | 31 ++++++++++++++++---
 1 file changed, 27 insertions(+), 4 deletions(-)


base-commit: ebd297a2affadb6f6f4d2e5d975c1eda18ac762d
-- 
2.49.0

