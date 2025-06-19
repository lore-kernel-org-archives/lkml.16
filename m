Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD5430E852
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 21:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750367832; cv=none; b=JGjHKTip+X3DyBgQIWZchT7kon8Wev49/QLBfi16aoAf0eUr5MsWJIOQPu5y+ekWIn5z5SnfbJaRzSWU4R5fG5unKmzVdcJU/8mxOVKMkuySFIoM770Kz6YvdsY4jH7Fv8YwElRX8SPQdMABhv6S4oI9la78fguXXPSJy+Nubi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750367832; c=relaxed/simple;
	bh=oOQEXEh2RBd9vP0i7imc+zUjwaH66TSOeWKigQLWB50=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ORCcUG6EvXbRDF9wuqkVeTu2UGMJk0jBNM0gh4qrrn5S2q0cpmf6EscxuVJ3zn9x/Ecy/gF5nvf1B6lqrJsMns6nXduGVBq5w4dUGgxkmPGk5N+HlzWwAdEtQNfEO2Ea1xAoG3RPRtfh0nqncuEuaRGXKOMHhrCOhHXRt5B4KSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pJjn77/y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pJjn77/y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD771C4CEEA;
	Thu, 19 Jun 2025 21:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750367831;
	bh=oOQEXEh2RBd9vP0i7imc+zUjwaH66TSOeWKigQLWB50=;
	h=From:Date:Subject:To:Cc:From;
	b=pJjn77/yk3U9e9Qun3PFECIPdGdZ0cOSI11QmVIc0k58DOFXd6C8mOF6CsCZOvqex
	 BWh6Pyosyb7Ejujk/EvHsq2bjpPYvh0KhrTmJ3kaJdsfWhvn5wejX4zghzzdGLRNet
	 SSpGY5fI1RwXuEAU6oFa51JdRowyov48AnIJdsHB7TYPwXWhzUcTK776P0IupXubP6
	 VREU1CAbod9GuvJkPV+LOQA8a/WfoGCxuzaKbX8j94u9EnULC9XrzSN/NYGd1q3Ims
	 xkO4OQXeph6kk4M9FKWTjHmehqhpP25IgDxaGZpISwA8FS0EGciaM2AltlYhdgkId8
	 7eEcnTfsLiKGg==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 19 Jun 2025 22:15:41 +0100
Subject: [PATCH] arm64/gcs: Don't try to access GCS registers if
 arm64.nogcs is enabled
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-arm64-fix-nogcs-v1-1-febf2973672e@kernel.org>
X-B4-Tracking: v=1; b=H4sIAPx9VGgC/x2MQQqAIBAAvxJ7bkEtlfpKdJDcbA9pKEQQ/j3pO
 AwzLxTKTAXm7oVMNxdOsYHsO9gOFwMh+8aghNLCSIsun2bEnR+MKWwFlZCDN5Ox2gto1ZWpyf+
 4rLV+E/v7EGEAAAA=
X-Change-ID: 20250617-arm64-fix-nogcs-2013d69675d0
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-08c49
X-Developer-Signature: v=1; a=openpgp-sha256; l=2608; i=broonie@kernel.org;
 h=from:subject:message-id; bh=oOQEXEh2RBd9vP0i7imc+zUjwaH66TSOeWKigQLWB50=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoVH5VqNcGDViByaNhlmaX8qdDhYs8rVdJvcjDB
 q7ZIbJ/IiCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaFR+VQAKCRAk1otyXVSH
 0EiMB/9AlDj/ViIYNHqxaJVggjR4vVxJk5WUCoeIsDLhGvUg/nujPLPEUctxo3b5HrseC7rvF2N
 GJmWOABxfFTUuio3afvaLZqr9AibN8u4TFqRWDtEIQcP/GG6yd9OUUdU1PayVZax+wtPDIHl5BO
 2aQMF2828HrCuG6fQm7JaV5NzRh0cu/mWTGpwdUFl03SISHCQHB4GSE3Bf8sRT4RgEVc10VvF6h
 NOqea3IfS/6W1XYPf3FBCGkaYD4SnjfnztFxJRDnnSBJeltk2VXoVJKzFDNbQnIMREUaIEDDOL+
 5wG2Xy3guVU6gezcH8sUh0zMqVdo3KdvxTkTNlAClODBpeZZ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

During EL2 setup if GCS is advertised in the ID registers we will reset the
GCS control registers GCSCR_EL1 and GCSCRE0_EL1 to known values in order to
ensure it is disabled. This is done without taking into account overrides
supplied on the command line, meaning that if the user has configured
arm64.nogcs we will still access these GCS specific registers. If this was
done because EL3 does not enable GCS this results in traps to EL3 and a
failed boot which is not what users would expect from having set that
parameter.

Move the writes to these registers to finalise_el2_state where we can pay
attention to the command line overrides. For simplicity we leave the
updates to the traps in HCRX_EL2 and the FGT registers in place since these
should only be relevant for KVM guests and KVM will manage them itself for
guests. This follows the existing practice for other similar traps for
overridable features such as those for TPIDR2_EL0 and SMPRI_EL1.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/el2_setup.h | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
index ba5df0df02a4..9f38340d24c2 100644
--- a/arch/arm64/include/asm/el2_setup.h
+++ b/arch/arm64/include/asm/el2_setup.h
@@ -287,17 +287,6 @@
 .Lskip_fgt2_\@:
 .endm
 
-.macro __init_el2_gcs
-	mrs_s	x1, SYS_ID_AA64PFR1_EL1
-	ubfx	x1, x1, #ID_AA64PFR1_EL1_GCS_SHIFT, #4
-	cbz	x1, .Lskip_gcs_\@
-
-	/* Ensure GCS is not enabled when we start trying to do BLs */
-	msr_s	SYS_GCSCR_EL1, xzr
-	msr_s	SYS_GCSCRE0_EL1, xzr
-.Lskip_gcs_\@:
-.endm
-
 /**
  * Initialize EL2 registers to sane values. This should be called early on all
  * cores that were booted in EL2. Note that everything gets initialised as
@@ -319,7 +308,6 @@
 	__init_el2_cptr
 	__init_el2_fgt
 	__init_el2_fgt2
-        __init_el2_gcs
 .endm
 
 #ifndef __KVM_NVHE_HYPERVISOR__
@@ -371,6 +359,13 @@
 	msr_s   SYS_MPAMHCR_EL2, xzr		// clear TRAP_MPAMIDR_EL1 -> EL2
 
 .Lskip_mpam_\@:
+	check_override id_aa64pfr1, ID_AA64PFR1_EL1_GCS_SHIFT, .Linit_gcs_\@, .Lskip_gcs_\@, x1, x2
+
+.Linit_gcs_\@:
+	msr_s	SYS_GCSCR_EL1, xzr
+	msr_s	SYS_GCSCRE0_EL1, xzr
+
+.Lskip_gcs_\@:
 	check_override id_aa64pfr0, ID_AA64PFR0_EL1_SVE_SHIFT, .Linit_sve_\@, .Lskip_sve_\@, x1, x2
 
 .Linit_sve_\@:	/* SVE register access */

---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250617-arm64-fix-nogcs-2013d69675d0

Best regards,
--  
Mark Brown <broonie@kernel.org>

