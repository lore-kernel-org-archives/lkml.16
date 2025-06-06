Received: from freeshell.de (freeshell.de [116.202.128.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB02F2405ED;
	Fri,  6 Jun 2025 13:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.202.128.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749215438; cv=none; b=JDLrXRM2dj3MiEjDX12h3eWL/UPMzeXgkHDee6rfHj3GygGWiq4c+kTRTpKuGBD/ZP8Pi5Irp+CvQ6+yxL+OdNEOPnd145cYViT1rUkwiOuSVhIY3j3Z5Go0JlKchpMSEhXSD9NPmk9S2GIMfpGNjPtYSCWmtSzjmFkw5sc66eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749215438; c=relaxed/simple;
	bh=+yPr6VbEro0zZyE3N7k5jlifzdfsZRW/5nV+Zah/1zU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lbd3sYbs0wYohR4yOf271phOEEh2dY3/W1zXKQWqcOTC7FFsLz7LTAHF9TE+euBCRnpubcp6aPDon4+tooTizhoYYu8txiAdl+Qa45zgWQEFWhhgFpb5NnfJZYF+3D6enHlXp7R9TEVbRd7bp5+dgrawLsW8C00rJD3uB1CoN1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=freeshell.de; spf=pass smtp.mailfrom=freeshell.de; arc=none smtp.client-ip=116.202.128.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=freeshell.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freeshell.de
Received: from hay.lan. (unknown [IPv6:2605:59c0:20f3:a400:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 95339B4C440C;
	Fri,  6 Jun 2025 15:04:12 +0200 (CEST)
From: E Shattow <e@freeshell.de>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: E Shattow <e@freeshell.de>
Subject: [PATCH v1 0/3] riscv: dts: starfive: jh7110: More U-Boot downstream changes for JH7110
Date: Fri,  6 Jun 2025 06:02:35 -0700
Message-ID: <20250606130253.1105273-1-e@freeshell.de>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Bring in additional downstream U-Boot boot loader changes for StarFive
VisionFive2 board target (and related JH7110 common boards). There is a
memory controller with no downstream dt-binding; create a basic dt-binding
(and not any Linux driver) in support of the memory-controller dts node
needed by U-Boot starfive_ddr.c driver. Also add bootph-pre-ram hinting
to jh7110.dtsi needed at SPL boot phase.

Changes since RFC:

- Drop additional timer node from series as not strictly needed for boot.
- Add patch for starfive,jh7110-dmc binding
- Adjust ordering of bootph-pre-ram hints to follow devicetree style guide

E Shattow (3):
  dt-bindings: memory-controllers: add StarFive JH7110 SoC DMC
  riscv: dts: starfive: jh7110: add memory controller node
  riscv: dts: starfive: jh7110: bootph-pre-ram hinting needed by boot
    loader

 .../starfive,jh7110-dmc.yaml                  | 76 +++++++++++++++++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      | 22 ++++++
 2 files changed, 98 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/starfive,jh7110-dmc.yaml


base-commit: d50108706a63dfd896db42172bf9f6aebec219c5
-- 
2.49.0

