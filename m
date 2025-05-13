Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865752BF974;
	Tue, 13 May 2025 17:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747158562; cv=none; b=PzYdkisKt0r8UIZrBFFTCiCATBgThoY+ktDjO8K9WE4eNP0BRFksThMQVu8mWN7QVjNmw56QE15OYRqtQLl5YbY1LeizEzlZ6e/Ij9sjLwGiPitRw6LlF+ILmBTb7cF+ZzL8SwTn2f/hshVNB/dBrftntnas49aFPFL8w0fAIu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747158562; c=relaxed/simple;
	bh=Wo+8ZCVDmb0B4uso6wnZUfaOVqcaGAW+YnwXXYWbbY8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R7U1k4JLctL8ZsHLTS3sp81Of8vVmKdeElqaJshnlVI0k9csnTl28YUc2S9hK5ZfGHi54ktyjZpQtd6jbPty6LK/weJnS8iE9VcuUdy9sv6K7LxjiW07cJ1RyA/EPxlosK0N6ziYaaFCxMq472TNOvToDForpO/+zti9OwaY9Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ca+9n4My; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ca+9n4My"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 886DFC4CEF0;
	Tue, 13 May 2025 17:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747158562;
	bh=Wo+8ZCVDmb0B4uso6wnZUfaOVqcaGAW+YnwXXYWbbY8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ca+9n4MyRwBBYr7qFOSjhwp09DucVZPyYFT080Q3fBZR0DIqUD/FWi3tpWQGU2BWR
	 VHp6+yUgDgDPC6FNJ6d2iXfjumKbJ+7P6YnVWxAtU0A2jXwHlYjE69WwSyWwSqcnjp
	 cJOrXA18iitGRjZiEAd6S6MpdB2RFU8w1f5wfBfPGGcVQGDcsWOEEWwML84eS8487G
	 W2h0pbOuj7g0PMzrrFZZW/LJF+/K+1vkoUccGQYALXmCG2An3l+80aezKQ3v7gDqDo
	 qK0KkWiTLbn6itGNu+CcuttMNrmFBHhe7zM4WA2VFZKxB7ZV2WR7ZZdDNXATsbNPTs
	 16bFfw/NsOE7Q==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 13 May 2025 19:48:05 +0200
Subject: [PATCH v4 12/26] arm64/sysreg: Add ICH_HFGRTR_EL2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250513-gicv5-host-v4-12-b36e9b15a6c3@kernel.org>
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

Add ICH_HFGRTR_EL2 register description.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index d54c9783acb85f1049dbe51f9a37157d0fe03292..7eb9bca61728d1bd1eedc0bfa6c8a904a25132fd 100644
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

