Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C67E2BF3F0;
	Tue, 13 May 2025 17:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747158573; cv=none; b=XVXL9pIZRzgynT5Y1Wkw1Zx74ojOK+KDk0pNirxNGMcRSjRcpvlrXmg6F1c1gcX0b4gh8E///GPOlHIacPXFYLKgLmZ2f/w3oKmggF1A/MI8KocOeXAFq0YevPBqgkPZDyceFOYbxQuCULEOob98qCXKq/lVbVhhjWbaJeGPdFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747158573; c=relaxed/simple;
	bh=Tr4cD6xh6+1h9U0/qenfvi0xSs1rAOetTxU7+Kq/NsQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XJ6BROFC7E9i0SsWHO/si61MToFe3sJazyS2+AKxc9WW9TGMIEZggFGEa5nsWwrwz8Qtp6led20dxMj2DmFWt4BmNQPV+VDNiq2z7ZacTT+ba8JYVQ5HlcjapAg3+t2Rb9d5bNJHWx8Pu1S+ZKllBUpnX1E/GyTxqzS+AUHf4vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DGtVMW8r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DGtVMW8r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87268C4CEF1;
	Tue, 13 May 2025 17:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747158571;
	bh=Tr4cD6xh6+1h9U0/qenfvi0xSs1rAOetTxU7+Kq/NsQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DGtVMW8rWlmlHsxvE8L/kq0gSXkrCalgLvSXQiExTyXIA0NG9nKHPWWkeF2tB9t1a
	 xfAXFtFAWa+A40957fEYvgcaCYR3zwGDDkhvRoWn0QzqqNUdQkO/N3YOqeK23s7gvL
	 UenXU42zkwZTPPt4aV5YKqjcEfPOR/L5Mx/X9SVSr+o4XocT1G5YuYVhrrwArAZJtK
	 TCEmka/45nW1qrSvl89OyrI99YSdmouW/eQkvclwWe/wkNut4qaTbCZ0sOgm5eMNbz
	 zLGg72e3/8YQfiXYlgRpfVDP34TLDI92PaoUzdaRZkZcT9cjyCnl325Z6jMaP9kEzS
	 NlAlKkQNFnbRA==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 13 May 2025 19:48:06 +0200
Subject: [PATCH v4 13/26] arm64/sysreg: Add ICH_HFGWTR_EL2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250513-gicv5-host-v4-13-b36e9b15a6c3@kernel.org>
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

Add ICH_HFGWTR_EL2 register description to sysreg.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 7eb9bca61728d1bd1eedc0bfa6c8a904a25132fd..0927754d9fe2c5addbd9693d83b7324f1af66d3e 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -3601,6 +3601,21 @@ Field	1	ICC_IDRn_EL1
 Field	0	ICC_APR_EL1
 EndSysreg
 
+Sysreg	ICH_HFGWTR_EL2	3	4	12	9	6
+Res0	63:21
+Field	20	ICC_PPI_ACTIVERn_EL1
+Field	19	ICC_PPI_PRIORITYRn_EL1
+Field	18	ICC_PPI_PENDRn_EL1
+Field	17	ICC_PPI_ENABLERn_EL1
+Res0	16:7
+Field	6	ICC_ICSR_EL1
+Field	5	ICC_PCR_EL1
+Res0    4:3
+Field	2	ICC_CR0_EL1
+Res0	1
+Field	0	ICC_APR_EL1
+EndSysreg
+
 Sysreg	ICH_HCR_EL2	3	4	12	11	0
 Res0	63:32
 Field	31:27	EOIcount

-- 
2.48.0

