Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E126D22D7B2;
	Thu, 24 Apr 2025 10:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745490426; cv=none; b=ZturyCXCpagB9JEH93aa1oJF/JbpWZvkZBX4xRR97TA01/kTjnKpHQjj3SqcuXr9JpEkbdps2O5B8OdjbmFi165SbjO8QeMtCDWjY7KsO0x6lcm6vBfwV1RWliSuj6olZurj9FwEEQcErDw/09gqC9LPQZxYm0QHw+beqjMZQAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745490426; c=relaxed/simple;
	bh=sVDAwu7zYs5UYmhKsIqu4Xi0KrfAlQzxvPf603/w1qs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mh1jgE6PtGREoY/OVCiE4xKdm1mtDfZvU8PM4RvT0+Hn4yCquX9s1yqWpZ0kNAdn0edxn0FfqouW6/R3gxUr5NV4yiCNRZvY/YHYAvAEXN+SQxdK4TdhyGo3RxZx3hAUsCEn2t1rp1yvIHEkzZuNex1BmLZxH5Clm8AVuhUapp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NzM267PE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NzM267PE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D1CCC4CEE4;
	Thu, 24 Apr 2025 10:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745490425;
	bh=sVDAwu7zYs5UYmhKsIqu4Xi0KrfAlQzxvPf603/w1qs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NzM267PEMO2IMqbSaEpPxJsVB5eAVB3PjRE0DQnnRhBZcG8xXm+/3b23qQMfoft51
	 nER8G4hqF7RSDaQCrK4/hrNw+BJfOq7EkV3eCoGJu8yRkgUZktUjbxuYbr/n7hZg9e
	 gBZCjOgZOl4nw/3Cc6Lki0f26Eep81WYh0rWLb5fDbqXatP07v81am6DsBkoXS6aCD
	 ib8suaDHL1/ZeJM6rbgH2HJ3kjPHc1lbkLK4SpGLe0hPNUks7t7a/aJUxj7j+xWWeH
	 JiFJ5ksM7HrgOi2VwUMN7nd3RVKaLlqVPsf/LaTU37pc1b9MluP1C66+X7FSTzePAo
	 VDgLVOYpOmapA==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Thu, 24 Apr 2025 12:25:26 +0200
Subject: [PATCH v2 15/22] arm64: Disable GICv5 read/write/instruction traps
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-gicv5-host-v2-15-545edcaf012b@kernel.org>
References: <20250424-gicv5-host-v2-0-545edcaf012b@kernel.org>
In-Reply-To: <20250424-gicv5-host-v2-0-545edcaf012b@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Sascha Bischoff <sascha.bischoff@arm.com>, 
 Timothy Hayes <timothy.hayes@arm.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.14.2

GICv5 trap configuration registers value is UNKNOWN at reset.

Initialize GICv5 EL2 trap configuration registers to prevent
trapping GICv5 instruction/register access upon entering the
kernel.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/el2_setup.h | 45 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
index ebceaae3c749b84395c9c5eccf0caf874697ad11..1e362bb3b042d51fff15a7c2abc73842930b275a 100644
--- a/arch/arm64/include/asm/el2_setup.h
+++ b/arch/arm64/include/asm/el2_setup.h
@@ -165,6 +165,50 @@
 .Lskip_gicv3_\@:
 .endm
 
+/* GICv5 system register access */
+.macro __init_el2_gicv5
+	mrs_s	x0, SYS_ID_AA64PFR2_EL1
+	ubfx	x0, x0, #ID_AA64PFR2_EL1_GCIE_SHIFT, #4
+	cbz	x0, .Lskip_gicv5_\@
+
+	mov	x0, #(1 << ICH_HFGITR_EL2_GICRCDNMIA_SHIFT	| \
+		      1 << ICH_HFGITR_EL2_GICRCDIA_SHIFT	| \
+		      1 << ICH_HFGITR_EL2_GICCDDI_SHIFT		| \
+		      1 << ICH_HFGITR_EL2_GICCDEOI_SHIFT	| \
+		      1 << ICH_HFGITR_EL2_GICCDHM_SHIFT		| \
+		      1 << ICH_HFGITR_EL2_GICCRDRCFG_SHIFT	| \
+		      1 << ICH_HFGITR_EL2_GICCDPEND_SHIFT	| \
+		      1 << ICH_HFGITR_EL2_GICCDAFF_SHIFT	| \
+		      1 << ICH_HFGITR_EL2_GICCDPRI_SHIFT	| \
+		      1 << ICH_HFGITR_EL2_GICCDDIS_SHIFT	| \
+		      1 << ICH_HFGITR_EL2_GICCDEN_SHIFT)
+	msr_s	SYS_ICH_HFGITR_EL2, x0		// Disable instruction traps
+	mov_q	x0, (1 << ICH_HFGRTR_EL2_ICC_PPI_ACTIVERn_EL1_SHIFT	| \
+		     1 << ICH_HFGRTR_EL2_ICC_PPI_PRIORITYRn_EL1_SHIFT	| \
+		     1 << ICH_HFGRTR_EL2_ICC_PPI_PENDRn_EL1_SHIFT	| \
+		     1 << ICH_HFGRTR_EL2_ICC_PPI_ENABLERn_EL1_SHIFT	| \
+		     1 << ICH_HFGRTR_EL2_ICC_PPI_HMRn_EL1_SHIFT		| \
+		     1 << ICH_HFGRTR_EL2_ICC_IAFFIDR_EL1_SHIFT		| \
+		     1 << ICH_HFGRTR_EL2_ICC_ICSR_EL1_SHIFT		| \
+		     1 << ICH_HFGRTR_EL2_ICC_PCR_EL1_SHIFT		| \
+		     1 << ICH_HFGRTR_EL2_ICC_HPPIR_EL1_SHIFT		| \
+		     1 << ICH_HFGRTR_EL2_ICC_HAPR_EL1_SHIFT		| \
+		     1 << ICH_HFGRTR_EL2_ICC_CR0_EL1_SHIFT		| \
+		     1 << ICH_HFGRTR_EL2_ICC_IDRn_EL1_SHIFT		| \
+		     1 << ICH_HFGRTR_EL2_ICC_APR_EL1_SHIFT)
+	msr_s	SYS_ICH_HFGRTR_EL2, x0		// Disable reg read traps
+	mov_q	x0, (1 << ICH_HFGWTR_EL2_ICC_PPI_ACTIVERn_EL1_SHIFT	| \
+		     1 << ICH_HFGWTR_EL2_ICC_PPI_PRIORITYRn_EL1_SHIFT	| \
+		     1 << ICH_HFGWTR_EL2_ICC_PPI_PENDRn_EL1_SHIFT	| \
+		     1 << ICH_HFGWTR_EL2_ICC_PPI_ENABLERn_EL1_SHIFT	| \
+		     1 << ICH_HFGWTR_EL2_ICC_ICSR_EL1_SHIFT		| \
+		     1 << ICH_HFGWTR_EL2_ICC_PCR_EL1_SHIFT		| \
+		     1 << ICH_HFGWTR_EL2_ICC_CR0_EL1_SHIFT		| \
+		     1 << ICH_HFGWTR_EL2_ICC_APR_EL1_SHIFT)
+	msr_s	SYS_ICH_HFGWTR_EL2, x0		// Disable reg write traps
+.Lskip_gicv5_\@:
+.endm
+
 .macro __init_el2_hstr
 	msr	hstr_el2, xzr			// Disable CP15 traps to EL2
 .endm
@@ -323,6 +367,7 @@
 	__init_el2_lor
 	__init_el2_stage2
 	__init_el2_gicv3
+	__init_el2_gicv5
 	__init_el2_hstr
 	__init_el2_mpam
 	__init_el2_nvhe_idregs

-- 
2.48.0

