Received: from esa4.hc555-34.eu.iphmx.com (esa4.hc555-34.eu.iphmx.com [207.54.77.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0682550C2;
	Mon,  9 Jun 2025 13:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.54.77.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749477074; cv=none; b=IovrmByX4rqBtedpTuiVjeYG8voUX2D8yo//GTAv5rOZjc32yUiVzVAqnjxDrWZukOV8ti76tmXfxr/6YAMKEA+75drqZ5kp0o3UCzWzJbU8niPFXp4jSn8PFuVi88Rl63uzaZIU/ETp0f+EIn7jNPd8BRnkOHIE6kbH9tOD07o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749477074; c=relaxed/simple;
	bh=401u0OSH88qHCJmEZO9VJhc7zw1kY/ESQqzyFm/CmVo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RP5EtA9uv37l/rybAgt/VH9/NCXFuXARusjh81GPId4/FVS6GhUlqzXZ7QGIaAsnF/mi4g10O3yvN0qlYnuCq4QFxrd7WkEPMlyjxG1VbvTj1ee0L58WkN6gwlp12Fd0ir8UPkQaqJRQGMVf+CMWxHZplWNTFStqyZ4zL/VLzT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com; spf=pass smtp.mailfrom=mobileye.com; dkim=fail (0-bit key) header.d=mobileye.com header.i=@mobileye.com header.b=ot3iqr1X reason="key not found in DNS"; arc=none smtp.client-ip=207.54.77.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mobileye.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=mobileye.com header.i=@mobileye.com header.b="ot3iqr1X"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1749477072; x=1781013072;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=401u0OSH88qHCJmEZO9VJhc7zw1kY/ESQqzyFm/CmVo=;
  b=ot3iqr1XErXffu3neJRM79Gz6C/Yyd7VI5GozhyQFYLTuGmLaY4ERpi3
   z99+6nMwy44oNsoMWWRnG7/5QdUs6uzzDQ/B9FvUaHFya9n/KaGbfbtIw
   z5LDo/a9nIRJGVOYnE86gjeLfQbQULfl84/KFYS2mjhgcXNw+SPsPJLRb
   iwNY1/hxRbgPRLfsLyfCrAmjEk6Jxxq+uKDgyrX32EQFKTH5KEfW8Mf10
   re0DDUfZ/A7oyduRu4sUpz4dwwIbQloNE/MR+TPA2W6WkGd60UlMuHHQQ
   xkCdhjh7Hjr/6EaVLkjn28wYOTymQkG3VsxkgBgwFMLKIHHIJAHuAOrU4
   A==;
X-CSE-ConnectionGUID: yn9h3P1jRZ2wK6r2MNhrWg==
X-CSE-MsgGUID: WIpOfn1KQWWaJrqXMXSUPA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces01_data.me-corp.lan) ([146.255.191.134])
  by esa4.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 16:47:58 +0300
X-CSE-ConnectionGUID: fNBtzWk5Tyilkr2G/AR+EQ==
X-CSE-MsgGUID: MUc4K3FVQWSfV2at324pHw==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.1])
  by ces01_data.me-corp.lan with SMTP; 09 Jun 2025 16:47:56 +0300
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Mon, 09 Jun 2025 16:47:56 +0300
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Ryo Takakura <takakura@valinux.co.jp>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: [PATCH v1 0/7] Risc-V ACLINT IPI controller
Date: Mon,  9 Jun 2025 16:47:42 +0300
Message-ID: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Risc-V specification for the ACLINT IPI controller
describes an "SSWI" device that allows to send IPI by
writing register from the S-mode (Linux kernel),
as opposed to the "MSWI" device that does the same from
the M-mode. Sending IPI through the M-mode requires
extra SBI call, SSWI is much faster. Support for the
SSWI exists for the Thead board, it is almost as by
specification save for reading one custom CSR.

Soon to be released Mobileye SoC based on the MIPS
P8700 Risc-v CPU has pristine ACLINT SSWI.

To support P8700, refactor Thead implementation -
provide generic one while keeping Thead-specific variant.

In addition, support Risc-v "hart index" - it is
required for the MIPS P8700 chip to be released soon

Patches 1 and 2 refactor "hart index" support, replacing
APLIC specific implementation with generic helper

Patch 3 documents generic "riscv,aclint-sswi" and optional
property "riscv,hart-indexes", same as for ACLINT.

Patch 4 promotes Thead-specific SSWI to generic one

Patch 5 adds "riscv,hart-indexes" support

Patches 6 and 7 do some minor improvements for the SSWI

Vladimir Kondratiev (7):
  riscv: helper to parse hart index
  irqchip: riscv aplic: use riscv_get_hart_index()
  dt-bindings: interrupt-controller: add generic Risc-v aclint-sswi
  irqchip: introduce generic Risc-V aclint-sswi
  irqchip: aslint-sswi: resolve hart index
  irqchip: aclint-sswi: reduce data scope
  irqchip: aclint-sswi: remove extra includes

 .../riscv,aclint-sswi.yaml                    |  89 ++++++++++++++
 .../thead,c900-aclint-sswi.yaml               |  58 ---------
 arch/riscv/include/asm/irq.h                  |   2 +
 arch/riscv/kernel/irq.c                       |  34 ++++++
 drivers/irqchip/Kconfig                       |  12 ++
 drivers/irqchip/Makefile                      |   2 +-
 ...d-c900-aclint-sswi.c => irq-aclint-sswi.c} | 114 ++++++++++++------
 drivers/irqchip/irq-riscv-aplic-direct.c      |  16 +--
 8 files changed, 214 insertions(+), 113 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,aclint-sswi.yaml
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml
 rename drivers/irqchip/{irq-thead-c900-aclint-sswi.c => irq-aclint-sswi.c} (63%)


base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
-- 
2.43.0

