Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A9B224B10;
	Thu, 24 Apr 2025 10:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745490404; cv=none; b=OqXQxHD40pzY1Wq4Jmgi+V3hkGaeuJOsRS/2gmjxqGG0NlD86M5Mj3QcOyeLs22+Ilu3vaIO6SWxKizV4o2Qgxh9D7RoFkWTBfAe6jqWHls5YsJrSsN0Tj7c3U9DL6f6yqlt2kzA2PPOKnA366OeiD6AjKvhwmES+eaKaV0hVoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745490404; c=relaxed/simple;
	bh=Dk78WkgkowYSPPndroB+3TTj6jQAcxwQp1XS8EQ5gtg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hlYts+G3u+jlMacFy7gKlKFe/Ps0n6l4AZGTd7Yfel2Lbyk07j2pfCEb+efZAU9YpjNFmesKWIuSnslmaSWEl65uIDRi9H+tlP+r04LRRW2RWq8MwYLLU/7gro0WSkGaKWTCxt0xPAJs9gUVSpvb4I6xSkaCQoueAtCi59iB8NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PZrHJuOy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PZrHJuOy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE98EC4CEE3;
	Thu, 24 Apr 2025 10:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745490403;
	bh=Dk78WkgkowYSPPndroB+3TTj6jQAcxwQp1XS8EQ5gtg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PZrHJuOyOr+DjlEgWYw8lklQLm4mI8ftUNQPhpx6Y4rdrvD0oftIfPXYf48Hbd1hO
	 QMP7tzqYuFKcpKmpkYezNFR1C4l6jryEgzXCWrWAoh1QDCmh1CiuS4B0U2nEQOLEiS
	 HmaTbaCxh8HPByAvi13Pptu+caSAYGBCm69iUBXDAWzhMSaagjRwE4zn/cGg/uiUos
	 nxbhajYZKhBaUpFEK8JJYgSVC3VEJui9KQqmbdfF0WC2Pcn0G8K6T0d1Lz70+qDmGy
	 9bi/PUoGKLM/SFcgqMxuunSZiOG2H2IbS/Fhu413+NlJsGeByNrgUuzk8e2RfvjF4B
	 7uUm412twV8gA==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Thu, 24 Apr 2025 12:25:22 +0200
Subject: [PATCH v2 11/22] arm64/sysreg: Add ICC_IDR0_EL1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-gicv5-host-v2-11-545edcaf012b@kernel.org>
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

Add ICC_IDR0_EL1 register description.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 9a2ddab8661c85586b0e91f7eaabd5a6b3409c67..1ec8113df713dfea6d38e39c42eba1e3dca5eea5 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2399,6 +2399,22 @@ Sysreg	ICC_PPI_HMR1_EL1	3	0	12	10	1
 Fields ICC_PPI_HMRx_EL1
 EndSysreg
 
+Sysreg	ICC_IDR0_EL1	3	0	12	10	2
+Res0	63:12
+UnsignedEnum	11:8	GCIE_LEGACY
+	0b0000	NI
+	0b0001	IMP
+EndEnum
+UnsignedEnum	7:4	PRI_BITS
+	0b0011	4BITS
+	0b0100	5BITS
+EndEnum
+UnsignedEnum	3:0	ID_BITS
+	0b0000	16BITS
+	0b0001	24BITS
+EndEnum
+EndSysreg
+
 SysregFields	ICC_PPI_ENABLERx_EL1
 Field	63	EN63
 Field	62	EN62

-- 
2.48.0

