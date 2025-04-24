Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E5E22D790;
	Thu, 24 Apr 2025 10:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745490421; cv=none; b=BeWDVTbth6Px80HdgpPCWDR65JcSNutYzixain1BbgIOAINgEfbGxsWa/QpDiN1kY+ybdRD7eaposh1irN0n8VAROzwMuMPN2YSphPgoLao8y8NVVD+OxDbcTpik9d+5UXjpI8lLWBQ4112kKK87TdqMHAN8CYCc31WdI+5zVuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745490421; c=relaxed/simple;
	bh=9zWp7WGj091+ZG2FSlP0T7J3sn+1tw+UEtNEfbmUjxQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H4OMAGDggovMc5uMdPnBm4Lmosz+jOsUvwJEwMCbToHvLxSGuQvyjiYGQWm/HRcqoCdY1sMI6365tCog1yvb+qN34CTP+ISlPLFSfCfmloRXTy3ENWvO6SAaH9uiVVWAabbQ4jlT1TZMk32Xvu+Na5u9Wf3xJLKoWmBgW7e2VnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qu6UUhQJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qu6UUhQJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5BA1C4CEE3;
	Thu, 24 Apr 2025 10:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745490420;
	bh=9zWp7WGj091+ZG2FSlP0T7J3sn+1tw+UEtNEfbmUjxQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qu6UUhQJCxqYrr81iVHhuMy20mqGqJVGW8zuJFIytlavKi7iQx+8yg7t1RAJtkjNu
	 epa1dTe1TlH89+QxPE4kyA5f6+Cd1JwbDbZgAH69e5BfgGi9OcvNamQ/0zxihvopph
	 i8Pdp6H4U6q/b9oDTWJN0PGh5BWMUU4ZlYvmH60jH2z9/96R8inXgyXFfVviEksIiK
	 ZqPUuLPL0GkKiiGHJU+bNKNJUkW4bN90Bgg8vxa1c1YMF2aSqCoEg4U11xu2tR5FF7
	 GB8q7rJ9JP2R7srQvfsynukmj6W5Zge5asiMBp984NlJuW7HmlS7MMyHBZwJYfBwpk
	 bcSLUsbM7+z+A==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Thu, 24 Apr 2025 12:25:25 +0200
Subject: [PATCH v2 14/22] arm64/sysreg: Add ICH_HFGITR_EL2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-gicv5-host-v2-14-545edcaf012b@kernel.org>
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

Add ICH_HFGITR_EL2 register description to sysreg.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 1b519e35000be328acfe26d51e098059f9cf9ef2..5af0dea6e775ea680686dbe4bc836b5f5b69fbc7 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -3616,6 +3616,21 @@ Res0	1
 Field	0	ICC_APR_EL1
 EndSysreg
 
+Sysreg	ICH_HFGITR_EL2	3	4	12	9	7
+Res0	63:11
+Field	10	GICRCDNMIA
+Field	9	GICRCDIA
+Field	8	GICCDDI
+Field	7	GICCDEOI
+Field	6	GICCDHM
+Field	5	GICCRDRCFG
+Field	4	GICCDPEND
+Field	3	GICCDAFF
+Field	2	GICCDPRI
+Field	1	GICCDDIS
+Field	0	GICCDEN
+EndSysreg
+
 Sysreg	ICH_HCR_EL2	3	4	12	11	0
 Res0	63:32
 Field	31:27	EOIcount

-- 
2.48.0

