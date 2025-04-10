Received: from naesa06.arrow.com (naesa06.arrow.com [216.150.161.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DCA285416;
	Thu, 10 Apr 2025 15:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.150.161.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744298794; cv=none; b=u7VYYpNmPsBm0HV7KEB7MokvWc6uENoyS8BMwu2DBpzac8xDyiZz/eKwfVKq9dFeTdm0JT5ivRenZZvuVf02zckQpY5o2XrlLGnhUgRNT40xipgBEw7YcysXTHEB9ZHWiRQC+Vail5nHL2GNK3L5LFxVZKRbX+Hli3Gv9ZEr5jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744298794; c=relaxed/simple;
	bh=4iz47uWhgDwAGELAP/lwoYiYUFXUkygFkriWw75uAk0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Jx/htPzmTQ2QjktHioEsyd3YUe/x8NMAsr07Hrwa71vf5ESJzHi61kVsNU1/PH7NJlUtN87+ZXZcS/LvzaWyg2pQ+rK68wirwb3Zus/Dc7MZ0mXkqONOPYTYRAEyUhfnazGhdqJWpBl+T8LSnXSckwkqsO50ajGFfRK/zGQZz8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com; spf=pass smtp.mailfrom=einfochips.com; dkim=pass (2048-bit key) header.d=einfochips.com header.i=@einfochips.com header.b=tqm/Uyhh; arc=none smtp.client-ip=216.150.161.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=einfochips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=einfochips.com header.i=@einfochips.com header.b="tqm/Uyhh"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=einfochips.com; i=@einfochips.com; l=754; q=dns/txt;
  s=NAESA-Selector1; t=1744298792; x=1775834792;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4iz47uWhgDwAGELAP/lwoYiYUFXUkygFkriWw75uAk0=;
  b=tqm/UyhhIwAXXS6P+7wQCu6F+uFE4m/Q+VBzkQ064mc90SLQYzP66UMJ
   r4jUee/DsihU66jH4LJ8teqpNwUl5YuQXKfc95HzV6cM5uymlBEDE7y65
   Chm0SLcR8LK20Eg7frIA+J93c0RA1ojwwO5gb12M9LmLV9PS1/qKq0tG7
   iz7AeuX3OfNTAeC4azir0jfEfoUNwDKpbUdvxwxVA5Kyl7Kkxqqg536gX
   TF4ERP2637YPZpPxd06lHwj9bqBEYyI4/nqJatOSp27ehdJrN7UlBd1/o
   5tZHzzvEU5Re38Vm//E0gQDJ3PCD2Cky6d0hUElD1NFS5NMDv2WkQUgcR
   g==;
X-CSE-ConnectionGUID: 3vzjad4gTBOnzPbaBi1JFQ==
X-CSE-MsgGUID: cf0Kq4OaTyur+hWTGUjpHg==
X-IronPort-AV: E=Sophos;i="6.15,202,1739862000"; 
   d="scan'208";a="22941687"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa06out.arrow.com with ESMTP; 10 Apr 2025 09:25:23 -0600
Received: from AHMCPU1888.ap.corp.arrow.com ([172.25.5.100]) by eicahmirelay01.einfochips.com with Microsoft SMTPSVC(10.0.14393.4169);
	 Thu, 10 Apr 2025 20:55:19 +0530
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Min Lin <linmin@eswincomputing.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>,
	Yangyu Chen <cyy@cyyself.name>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Yu Chien Peter Lin <peterlin@andestech.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Kanak Shilledar <kanakshilledar@gmail.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Aradhya Bhatia <a-bhatia1@ti.com>,
	rafal@milecki.pl,
	Anup Patel <anup@brainfault.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 02/10] riscv: Add Kconfig option for ESWIN platforms
Date: Thu, 10 Apr 2025 20:55:11 +0530
Message-Id: <20250410152519.1358964-3-pinkesh.vaghela@einfochips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250410152519.1358964-1-pinkesh.vaghela@einfochips.com>
References: <20250410152519.1358964-1-pinkesh.vaghela@einfochips.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 10 Apr 2025 15:25:19.0631 (UTC) FILETIME=[C4E6E1F0:01DBAA2C]

Create a config option to build ESWIN SoC specific resources

Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/Kconfig.socs | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 8b503e54fa1b..e2a8022bdebd 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -1,5 +1,11 @@
 menu "SoC selection"
 
+config ARCH_ESWIN
+	bool "ESWIN SoCs"
+	help
+	  This enables support for ESWIN SoC platform hardware,
+	  including the ESWIN EIC7700 SoC.
+
 config ARCH_MICROCHIP_POLARFIRE
 	def_bool ARCH_MICROCHIP
 
-- 
2.25.1

