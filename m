Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC8D2BF3F0;
	Tue, 13 May 2025 17:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747158524; cv=none; b=oRbhJhyN6AXFl5uDVA3izpmG2jSPzBEWQpCOFvZH4akTXhKiEHAReWBsOpEpaVTMnmU5stp6/XCC9nYVj+n4YpRbc8GzINtCMx91S6TOfsTd6ETDFuwobEhgxZS7zHCFj81vIDKunUFNbBSVI6oDoshROfxf+uxIWUyn0OPEcKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747158524; c=relaxed/simple;
	bh=2YTGxvNsFd02iaNjDUmMIj9h6dgCA0z3/xkUeoHi+gs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B5URzTkKBE5aVsKgDDwxsvoVwkFMzq8Nq/IzByDmNXvdWWIUW7yKws31DeXhCZkwVJN81xd+M1AoUCqFEZVVCPpUTf1SRQNy/pNbzYN6Kp9+n6oBNeBaWLGyj5tlLtnBlSlSNWZn1noTnXLCqVikGrsfzKT5KN/ZhykINP0edrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GW0ZpR9V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GW0ZpR9V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59099C4CEE4;
	Tue, 13 May 2025 17:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747158524;
	bh=2YTGxvNsFd02iaNjDUmMIj9h6dgCA0z3/xkUeoHi+gs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GW0ZpR9VCMB0gv7WPg525ZHC8LatSaJkjsxzGw1v/y90b7vubWmA2+SmDxTDX4MgN
	 8Dk2y9LvRlZDV3WZzfmiDCmREoeEdVY6TU74OX7GxMpVNKRfki+na47I3L0MMsPGWc
	 qt++tOUe5jiITTb6lr9Ic/QEXud3fjTdzJfYnpemqX/CvuQsUQgFLLPQlKks5CYP4f
	 59dMk57kqGj/gzbu12haOXAo5nW4HKxP9R/mphBiXdynF3RJE7LtfO/F0fbou/Djy8
	 xtmcruEIMYyRz83vpCkAeV63E3Qg2VrI6cdYI1U1fTJRFXB848Nxgx/gLk9xcDlCyO
	 2dExUnewTdjGQ==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 13 May 2025 19:47:57 +0200
Subject: [PATCH v4 04/26] arm64/sysreg: Add ICC_ICSR_EL1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250513-gicv5-host-v4-4-b36e9b15a6c3@kernel.org>
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

Add ICC_ICSR_EL1 register sysreg description.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index ca6d81b1c6a3d7d66d4b02479123e842aa2bbe62..6f18ceeff0de324ab954b14136b44da102bc0539 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2310,6 +2310,20 @@ Field	31	C
 Field	30:0	P
 EndSysreg
 
+Sysreg	ICC_ICSR_EL1	3	0	12	10	4
+Res0	63:48
+Field	47:32	IAFFID
+Res0	31:16
+Field	15:11	Priority
+Res0	10:6
+Field	5	HM
+Field	4	Active
+Field	3	IRM
+Field	2	Pending
+Field	1	Enabled
+Field	0	F
+EndSysreg
+
 SysregFields	ICC_PPI_PRIORITYRx_EL1
 Res0	63:61
 Field	60:56	Priority7

-- 
2.48.0

