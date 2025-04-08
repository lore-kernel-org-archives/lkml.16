Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFAE426A1AC;
	Tue,  8 Apr 2025 10:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744109505; cv=none; b=mR4I5p6y1SrlpHa+89eeIk+9f2eC1syWz6nUAb58DhdGUJGqO0EABNp+S71HxV9iHgW5sj11taKm11hx4TpFu/Uka3PNl3362QxrXKHwXQpTpII0agbrqBqHlsXG4/ABHQF9Jw6IAR5GxU3lQdFSF3GfFOh+l/I1dDRccXXGFv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744109505; c=relaxed/simple;
	bh=sVDAwu7zYs5UYmhKsIqu4Xi0KrfAlQzxvPf603/w1qs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VlCCRyFvqZH4zLleS19GNgKX3QVXYZ7akyIMmMczjaku4+I0zOExnwsQMQ+pdz5gw+0C5TxwVUV0B9ETcZI88nBuWtFVw/gY889mDmkeL0SAE6fs9uYwoSGspb/GIOvTGUswtd8aregsXQ6uR/ZNyvd2HZ4bsOz1efLhaKFQBuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NzskJDRL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NzskJDRL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A539C4CEE7;
	Tue,  8 Apr 2025 10:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744109504;
	bh=sVDAwu7zYs5UYmhKsIqu4Xi0KrfAlQzxvPf603/w1qs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NzskJDRL+zvRKPmHm6Vr3yQh8MiYkr9C4dyMFNcvNScc2hA6FgtNTx+Iazh1kF0c4
	 7Upk9Af0gbZMoWsQob/NhM0PfYF4vyKmim0tkl7n8oJ1THltSbnQI/+05Tk9q+M+mR
	 Njm3htHhK9jxgyY8F+WjZ02ADseeD+T/5xC2BvNCXhthtwzswS7Ljucg5loDwQ6vzX
	 0haifBTxZilEj170vSA85KjlYfSM5dFR+FjLRE3fR3j9YdyR015DTEQ+nVVRduVey8
	 TfkU6E/O8jhpke/H88GxKn7Zik1QJzMxud4zN+DIYHRkHvE40+x02NAxUr5nvfUn3J
	 4X+bt+5GCO2Bg==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 08 Apr 2025 12:50:14 +0200
Subject: [PATCH 15/24] arm64: Disable GICv5 read/write/instruction traps
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gicv5-host-v1-15-1f26db465f8d@kernel.org>
References: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
In-Reply-To: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Sascha Bischoff <sascha.bischoff@arm.com>, 
 Timothy Hayes <timothy.hayes@arm.com>, linux-arm-kernel@lists.infradead.org, 
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

