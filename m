Received: from esa3.hc555-34.eu.iphmx.com (esa3.hc555-34.eu.iphmx.com [207.54.77.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E025222129B;
	Tue, 10 Jun 2025 10:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.54.77.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749550002; cv=none; b=DrfRqJFkV1damIqvZO8VM3UfpRcX4iX1431Az/hrdE62OdFgqm0KFSaVwDcf7kpfdgt+6fqoOdmGdj2xUeOxfxiDjVkBGAGVmvyUCngzI4gnNpkT7fXkGKXkBsosrATpuvqYsHhDY/9CDAbPCUvPTk8lB1Vc25oxZExOfbdMakE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749550002; c=relaxed/simple;
	bh=SN4p3535kdtcE359HyHqmgAqCNO8q/vwRTBRnnXqNN4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dc19hgP/4Jm3PAAjUGoCa6g/HMydZUw1ckg2R8bJ4aRO6szIWwX8H418OQ6isgtoYnqrKeWrYIrWcy4Xy+4VULgMPviHgd8edgcTFJQTAiO6t9Kmmd20funSc7wboiW5B02EToXFicY54JK5gTuZU5qUeft1QeN7blG/4jfv2so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com; spf=pass smtp.mailfrom=mobileye.com; dkim=fail (0-bit key) header.d=mobileye.com header.i=@mobileye.com header.b=ZJiHngc9 reason="key not found in DNS"; arc=none smtp.client-ip=207.54.77.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mobileye.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=mobileye.com header.i=@mobileye.com header.b="ZJiHngc9"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1749549998; x=1781085998;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SN4p3535kdtcE359HyHqmgAqCNO8q/vwRTBRnnXqNN4=;
  b=ZJiHngc9c4K8dEc/oNG+x0nqrUDRdh8SvDZ62MzEY8kZj7k1nEui8ppM
   Ax9XrQ9w+msyAY+X6MXfHDZYCKpJQVQoMgNSU+7HkYCj1z1TSxI5Zvfd1
   fgFXx+EL2auecS+vIceiO+6774siAY439teV0JLd8jGLQUP0zZk/B1YSD
   Kn23llagRTWvAp+OAT46e5oSQCMIFLyBQ+wUZt2v6HPQ/5deTN/EhGpmX
   ypF5SD0WoGVWLWjwPJu1MHJ+V5rvK+42XHcAKJJuY9bDP/ca+4gjUlxrh
   a2VHhncjpz2ZPLwKKZCAZ8A3fVYNJON/47WXoEEl8/K+8MzRM/zS9JA0C
   g==;
X-CSE-ConnectionGUID: TSqU/aK9R1y2qCI6ux7EpA==
X-CSE-MsgGUID: +nOGXVtuQ0+NanXVg0Rcxw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces03_data.me-corp.lan) ([146.255.191.134])
  by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 13:06:35 +0300
X-CSE-ConnectionGUID: txeNxAlZRW+e9WnO4RN3zQ==
X-CSE-MsgGUID: kvKai6YvSLuMpDdlPykeJQ==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.1])
  by ces03_data.me-corp.lan with SMTP; 10 Jun 2025 13:06:34 +0300
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Tue, 10 Jun 2025 13:06:34 +0300
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
Subject: [PATCH v2 0/7] MIPS P8700 variant of the ACLINT IPI controller
Date: Tue, 10 Jun 2025 13:05:33 +0300
Message-ID: <20250610100540.2834044-1-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
References: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

RISC-V draft specification for the ACLINT IPI controller describes
an "SSWI" device that allows to send IPI by writing register from the
S-mode (Linux kernel), as opposed to the "MSWI" device that does the
same from the M-mode. Sending IPI through the M-mode requires extra
SBI call, SSWI is much faster.

Support for the SSWI exists for the Thead board, it is almost as by
specification save for reading one custom CSR.

Soon to be released Mobileye SoC based on the MIPS P8700 RISC-V CPU has
variant of the ACLINT SSWI device that follows the spec exactly.

To support P8700, refactor Thead implementation, factoring out
generic code that complies with the draft spec, and provide
Thead and MIPS specific variants.

In addition, MIPS P8700 uses non contiguous hart indexes, and thus
requires "riscv,hart-indexes" property.

Patches 1 and 2 refactor "hart index" support, replacing
APLIC specific implementation with generic helper

Patch 3 adds dt-bindings

Patch 4 refactors Thead-specific SSWI, adding MIPS variant

Patch 5 adds "riscv,hart-indexes" support

Patches 6 and 7 do some minor improvements for the SSWI

Changed from v1:
1. RISC-V spec for the ACLINT is in a draft state, then can't
use "riscv," prefix. Restcucture commits to add MIPS specific
ACLINT-SSWI variant instead.

Vladimir Kondratiev (7):
  riscv: helper to parse hart index
  irqchip: riscv aplic: use riscv_get_hart_index()
  dt-bindings: interrupt-controller: add MIPS P8700 aclint-sswi
  irqchip: MIPS P800 variant of aclint-sswi
  irqchip: aslint-sswi: resolve hart index
  irqchip: aclint-sswi: reduce data scope
  irqchip: aclint-sswi: remove extra includes

 .../thead,c900-aclint-sswi.yaml               |  64 ++++++++--
 arch/riscv/include/asm/irq.h                  |   2 +
 arch/riscv/kernel/irq.c                       |  34 +++++
 drivers/irqchip/Kconfig                       |  16 +++
 drivers/irqchip/Makefile                      |   2 +-
 ...d-c900-aclint-sswi.c => irq-aclint-sswi.c} | 116 ++++++++++++------
 drivers/irqchip/irq-riscv-aplic-direct.c      |  16 +--
 7 files changed, 186 insertions(+), 64 deletions(-)
 rename drivers/irqchip/{irq-thead-c900-aclint-sswi.c => irq-aclint-sswi.c} (62%)


base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
-- 
2.43.0

