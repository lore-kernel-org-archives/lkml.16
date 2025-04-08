Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0816E268C64;
	Tue,  8 Apr 2025 10:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744109494; cv=none; b=gnvmwHabemBbY4+UgcHLrkNmNHtXUwbaODrC6xw1PVl6eAYl4baODz5VpNePQ9H0FMSenrE3FMtAaFjs6gcQlbboK5tl+NHNJ77SxVsU77zHABWox/ooZLCWJ4pEQFPPbOhj7wQc0zV4ET45Rv709dh+DSUE4MuSSuvrSsyeGHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744109494; c=relaxed/simple;
	bh=jtBNyXLItJhfIxTK4Pp6vzdTvnQztzIAhQqNSaBxo3Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gb8/8RPlwsXIMovGcCWcNjSMqZEKeCYD8eknyNyah3mEz8MWtuPqDMVx29B90jjQscU1cYw7V+tQle4uFEtp4QZLUDDrHQgs6qnJiM4rcj2Q9SUwfGv80kFPhF8eXe7lTkYOkwLlQsfZnAuqo0ApnnagDhaQAHPrP/57Okk5e60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gcHqfVKg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gcHqfVKg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71841C4CEE5;
	Tue,  8 Apr 2025 10:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744109493;
	bh=jtBNyXLItJhfIxTK4Pp6vzdTvnQztzIAhQqNSaBxo3Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gcHqfVKgcYLuBTU7Og2f0WEJNqp2cezz1sPjSWcx3UmMF78B2KB9vzySIEjnh7VDr
	 4csyHcatdloWToED15Ve0fmNnzc/GNVle91dhOyXR5p2E8KD2gIRCq5SyfUWw+fop/
	 QpRBWbicqARu5AyUE18/EnD5etROcE91/mwr2pmzEwXK+L9CbzE7wLRfBT243NIAiT
	 Mz3BxcPM6/FlooovDmqVvoHGnOnJUWutivaVHYl4nCF5sGPOzou7FxddLIBQbljKb6
	 e8+sF71ud1+JFjSVMBoxQDEsKuyGt0B8UG8oTs/nBj/peNURNYGPMxEIU/kC9tUiUJ
	 CJ4YjTIsz7RkA==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 08 Apr 2025 12:50:11 +0200
Subject: [PATCH 12/24] arm64/sysreg: Add ICH_HFGRTR_EL2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gicv5-host-v1-12-1f26db465f8d@kernel.org>
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

Add ICH_HFGRTR_EL2 register description.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 1ec8113df713dfea6d38e39c42eba1e3dca5eea5..0c0e805481c84a14ae62d199466171d97d54ef90 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -3583,6 +3583,24 @@ Field	31:16	PhyPARTID29
 Field	15:0	PhyPARTID28
 EndSysreg
 
+Sysreg	ICH_HFGRTR_EL2	3	4	12	9	4
+Res0	63:21
+Field	20	ICC_PPI_ACTIVERn_EL1
+Field	19	ICC_PPI_PRIORITYRn_EL1
+Field	18	ICC_PPI_PENDRn_EL1
+Field	17	ICC_PPI_ENABLERn_EL1
+Field	16	ICC_PPI_HMRn_EL1
+Res0	15:8
+Field	7	ICC_IAFFIDR_EL1
+Field	6	ICC_ICSR_EL1
+Field	5	ICC_PCR_EL1
+Field	4	ICC_HPPIR_EL1
+Field	3	ICC_HAPR_EL1
+Field	2	ICC_CR0_EL1
+Field	1	ICC_IDRn_EL1
+Field	0	ICC_APR_EL1
+EndSysreg
+
 Sysreg	ICH_HCR_EL2	3	4	12	11	0
 Res0	63:32
 Field	31:27	EOIcount

-- 
2.48.0

