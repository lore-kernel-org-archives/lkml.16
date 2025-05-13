Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E41C2C1789;
	Tue, 13 May 2025 17:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747158579; cv=none; b=Nc4kh6gkRSBhvFsMs6YfNobneUQHYt+6GLHI3cgToo6hfNrN/giFLfY1i2/iu+1JJrUqfoAjRqpLsuyGDt+MP40g5Gu/G91vM4Edj4CdmFJEFbHCjUYrk6zNXZMJd88oNLkyTlUeZORaqqo7PxZcprotFBsBVqAXdUQfNinPVjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747158579; c=relaxed/simple;
	bh=gRWN4/WxQNgzKjCuCmcZKjoQVmfMZVTNU54WEek8EP4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YZmRRTnBhTpew9thI+2YVe7xxCH4rErW3hrq0S5Qg5L5BpcJOC1BhDk/tjGhTDtnzyVdZrb6SXgqr+ndBntBj1YqOvCd8Tw680l/Pw0Agak4xHUNzy5t5OBZsb2kps81ddl5O0ivnED13dbah/OTQXLfpIRH/vpEZBte/Nf4yWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mIn5dw22; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mIn5dw22"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFF28C4CEEF;
	Tue, 13 May 2025 17:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747158579;
	bh=gRWN4/WxQNgzKjCuCmcZKjoQVmfMZVTNU54WEek8EP4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mIn5dw22nEC6Onx7UbaWMxboYg/kDWpAx0LybxMflUdCHfIb+GQ9jDdQV0z6TiF8+
	 sC0TK2gTPgOHU9R+EfaQugB4Fe69M5WwoiTscJd4/0wh1JtrTTGHorUym9PC8Dr+0Z
	 3UfAlezP+LMms1mXn5krLSxaegSG2ioaLHakbRhNbGVLJIXGhEcVlnZqN29XcZxjfZ
	 kp+Oi1vB/KVBcXllDIXaUeSCNhtLvi69R7sEJEoM0FJygPoGADUcuMiuc4POMQxYXY
	 jMS/K4VbGcMz6r5otAagemzp1uTB8O3C987Xtm2omRadfhgp1O7U+I6b7yde1HVaiK
	 N677FnrBz3dGg==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 13 May 2025 19:48:08 +0200
Subject: [PATCH v4 15/26] arm64: Disable GICv5 read/write/instruction traps
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250513-gicv5-host-v4-15-b36e9b15a6c3@kernel.org>
References: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
In-Reply-To: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Sascha Bischoff <sascha.bischoff@arm.com>, 
 Timothy Hayes <timothy.hayes@arm.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Mark Rutland <mark.rutland@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>
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
index ebceaae3c749b84395c9c5eccf0caf874697ad11..109b72b657d2fbb6d39e0446c10d1b62e0a780b3 100644
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
+	mov	x0, #(ICH_HFGITR_EL2_GICRCDNMIA		| \
+		      ICH_HFGITR_EL2_GICRCDIA		| \
+		      ICH_HFGITR_EL2_GICCDDI		| \
+		      ICH_HFGITR_EL2_GICCDEOI		| \
+		      ICH_HFGITR_EL2_GICCDHM		| \
+		      ICH_HFGITR_EL2_GICCRDRCFG		| \
+		      ICH_HFGITR_EL2_GICCDPEND		| \
+		      ICH_HFGITR_EL2_GICCDAFF		| \
+		      ICH_HFGITR_EL2_GICCDPRI		| \
+		      ICH_HFGITR_EL2_GICCDDIS		| \
+		      ICH_HFGITR_EL2_GICCDEN)
+	msr_s	SYS_ICH_HFGITR_EL2, x0		// Disable instruction traps
+	mov_q	x0, (ICH_HFGRTR_EL2_ICC_PPI_ACTIVERn_EL1	| \
+		     ICH_HFGRTR_EL2_ICC_PPI_PRIORITYRn_EL1	| \
+		     ICH_HFGRTR_EL2_ICC_PPI_PENDRn_EL1		| \
+		     ICH_HFGRTR_EL2_ICC_PPI_ENABLERn_EL1	| \
+		     ICH_HFGRTR_EL2_ICC_PPI_HMRn_EL1		| \
+		     ICH_HFGRTR_EL2_ICC_IAFFIDR_EL1		| \
+		     ICH_HFGRTR_EL2_ICC_ICSR_EL1		| \
+		     ICH_HFGRTR_EL2_ICC_PCR_EL1			| \
+		     ICH_HFGRTR_EL2_ICC_HPPIR_EL1		| \
+		     ICH_HFGRTR_EL2_ICC_HAPR_EL1		| \
+		     ICH_HFGRTR_EL2_ICC_CR0_EL1			| \
+		     ICH_HFGRTR_EL2_ICC_IDRn_EL1		| \
+		     ICH_HFGRTR_EL2_ICC_APR_EL1)
+	msr_s	SYS_ICH_HFGRTR_EL2, x0		// Disable reg read traps
+	mov_q	x0, (ICH_HFGWTR_EL2_ICC_PPI_ACTIVERn_EL1	| \
+		     ICH_HFGWTR_EL2_ICC_PPI_PRIORITYRn_EL1	| \
+		     ICH_HFGWTR_EL2_ICC_PPI_PENDRn_EL1		| \
+		     ICH_HFGWTR_EL2_ICC_PPI_ENABLERn_EL1	| \
+		     ICH_HFGWTR_EL2_ICC_ICSR_EL1		| \
+		     ICH_HFGWTR_EL2_ICC_PCR_EL1			| \
+		     ICH_HFGWTR_EL2_ICC_CR0_EL1			| \
+		     ICH_HFGWTR_EL2_ICC_APR_EL1)
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

