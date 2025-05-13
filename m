Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net [60.248.80.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE59A23E342
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 09:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.248.80.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747129799; cv=none; b=HLDnzXPmYnwBXEZBEjsGePxvsDYecZBvqIFu8K0aQ5q4mu8SwQWQ0IwsczcGnqDp9o93lX0VUkPuJgwqK4QQLD23jV6sWF5/xoaYyNMiOVby1bAP85zUzzIpAWRhBTpQv2Ggaq9RGb7v5OECD1AgsaY4/DC3a3TaBp2OOvhJtAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747129799; c=relaxed/simple;
	bh=VbnAmLxBB+9ni3Y9B/gXoAlfLtNObeur1VJCWbvyhdM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DPtOOGs0PzVNc7gTMPXYNQRPdYiHo+Zs+YGU5CniPYMz2rT3hGz4p6pd1zCD0qSvSLLqW80EVLM1W0JC4pFfw3DirrtcAGaGeFFcOZ8o5tJnfQbvySasbR6+q+0IJwU0aTQSenZqogvcrTJr6hsiQFyblPawGNBLfFDeIXhv8rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=60.248.80.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (ATCPCS31.andestech.com [10.0.1.89])
	by Atcsqr.andestech.com with ESMTPS id 54D9njYE044800
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 May 2025 17:49:45 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS31.andestech.com
 (10.0.1.89) with Microsoft SMTP Server id 14.3.498.0; Tue, 13 May 2025
 17:49:44 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To:
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <tglx@linutronix.de>,
        <daniel.lezcano@linaro.org>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <tim609@andestech.com>,
        Ben Zong-You Xie <ben717@andestech.com>
Subject: [PATCH v3 1/9] riscv: add Andes SoC family Kconfig support
Date: Tue, 13 May 2025 17:49:25 +0800
Message-ID: <20250513094933.1631493-2-ben717@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250513094933.1631493-1-ben717@andestech.com>
References: <20250513094933.1631493-1-ben717@andestech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-DKIM-Results: atcpcs31.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 54D9njYE044800

The first SoC in the Andes series is QiLai. It includes a high-performance
quad-core RISC-V AX45MP cluster and one NX27V vector processor.

For further information, refer to [1].

[1] https://www.andestech.com/en/products-solutions/andeshape-platforms/qilai-chip/

Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
---
 arch/riscv/Kconfig.errata | 2 +-
 arch/riscv/Kconfig.socs   | 9 +++++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
index e318119d570d..be76883704a6 100644
--- a/arch/riscv/Kconfig.errata
+++ b/arch/riscv/Kconfig.errata
@@ -12,7 +12,7 @@ config ERRATA_ANDES
 
 config ERRATA_ANDES_CMO
 	bool "Apply Andes cache management errata"
-	depends on ERRATA_ANDES && ARCH_R9A07G043
+	depends on ERRATA_ANDES && (ARCH_R9A07G043 || ARCH_ANDES)
 	select RISCV_DMA_NONCOHERENT
 	default y
 	help
diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index a9c3d2f6debc..1bf5637f2601 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -1,5 +1,14 @@
 menu "SoC selection"
 
+config ARCH_ANDES
+	bool "Andes SoCs"
+	depends on MMU && !XIP_KERNEL
+	select ERRATA_ANDES
+	select ERRATA_ANDES_CMO
+	select AX45MP_L2_CACHE
+	help
+	  This enables support for Andes SoC platform hardware.
+
 config ARCH_MICROCHIP_POLARFIRE
 	def_bool ARCH_MICROCHIP
 
-- 
2.34.1

