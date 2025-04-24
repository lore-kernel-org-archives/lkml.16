Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C6B22C321;
	Thu, 24 Apr 2025 10:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745490410; cv=none; b=JMuYjcY5+x52sOw0LJ/lpeJm983k6URgb+x9V4wLncwwx1IY5DLeIqtYoYV1UoNVJI7Zm1vIjLSzNtKBdvz3yRl13EI7QtBXphqvnIGBGXb95yIT+7cgBB7Yj9lE/Jfubq1m0dFWH5+X1s5JVKV+OCQeK6lPlseMCj2tqUotyts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745490410; c=relaxed/simple;
	bh=jtBNyXLItJhfIxTK4Pp6vzdTvnQztzIAhQqNSaBxo3Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A7DVqKeIsRdbzY6emvk1aOoqVxyJ1H5UonvteW/S+JLWITxd8hSY2Nrb+hQNEUBtn5+PQxNzLWoQZGSzvrF3sybNeFXKBQBnAb/P6lFIDFqESGd71xEqtSHUndiEyG8NbhwuN8fFg4leRLD7bIcSTfY7ckXcWUqo4O9AU273aRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X0lL+Alh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X0lL+Alh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95E84C4CEE3;
	Thu, 24 Apr 2025 10:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745490409;
	bh=jtBNyXLItJhfIxTK4Pp6vzdTvnQztzIAhQqNSaBxo3Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=X0lL+Alhg7F5HZy+FTpyT9n0TCzhkIOLCSMBG+n0pgEhSuE2cvEyzb0kyM/gj+LTk
	 tdd0Z89BO4OdQKZC9Feg1mrqRZipgSZJ+5hRxyFifVk0Uokd1wT93Our4CiX2SknND
	 9vD4JprQYgrgaff91AQOSHr6O47gwqlmNpRHrooiMFjKpm9516deNcls/9B2KmsgNn
	 zbjJDQIXj3Fm5xGSZYePfFg+1+le82lrKxN8TKN1BjOcfCQx7MY3gaGfxOToEDG/da
	 FzbKwtwcbx3YHOntrHyy0/sh5RJxYAv+iFnR2u2Y6ddE3LarsjGx4JNGVG0N5F6wiT
	 FDqvDjNs5u6Lg==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Thu, 24 Apr 2025 12:25:23 +0200
Subject: [PATCH v2 12/22] arm64/sysreg: Add ICH_HFGRTR_EL2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-gicv5-host-v2-12-545edcaf012b@kernel.org>
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

