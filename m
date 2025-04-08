Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D2C2686AF;
	Tue,  8 Apr 2025 10:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744109490; cv=none; b=EOyQeE+abMNOaqmy5lmTqD56NN0TG3CrZgKzPcFSYRPbAOWKy5jCgjDDVSU6En4MrTMAVckH3Ybt1YfxoMbAroWsKyRDzIFP6RFhdTPHr9ECqI3zsZ6q0AK8YJpqT7ZO1a78G/tO3mWd9Byc5Mho6pRXXwE8HxBeS+B1TqbChxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744109490; c=relaxed/simple;
	bh=Dk78WkgkowYSPPndroB+3TTj6jQAcxwQp1XS8EQ5gtg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZgwYtoshCGXg4cGykTNJarHvueSYbB1nd/w3EUd2y3UI2JU3rQPs1RQk5+bhgnweFpJXqzvKdgfaA9WDXbCqV5ROEZNYtmQrDBVU1I90RZYqIkpisjIss0e6HhBCZ3CFGKbotVLvtvMwAXRC3ecALHF6DOMDDw7Rm63sYRjo9+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z8JOL97P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z8JOL97P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3250C4CEE7;
	Tue,  8 Apr 2025 10:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744109489;
	bh=Dk78WkgkowYSPPndroB+3TTj6jQAcxwQp1XS8EQ5gtg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Z8JOL97PD3zlgguwVdPmHQrUGhcV92w6q/9eDzQEu1K6ldhM2x8pICfBH2Jiva+fH
	 z8Yd1Fbeu0KlmxO29wzPQTkB1YEIqLs+2TbzYONJpKLRQXnI+E67a8b5CI7ZqLrweQ
	 BUg5ZDMdn03ICM34rzt2jPZFU+BB1FyFrtdszLulcqWPMz/Y3Xn8VrHbYgv5NDpYc/
	 9b10i4Mfw//PVkk+07tpQJLRstpt+EhHlkB49F5ilr4w3ZTNec+pkYtePkJFza86pY
	 tiCqefJxhsYWq1DfHb8dP1dRze2qbjfHjasr3On99wOo867aCnKOuEuVKY9jFEO5Cy
	 YQi/aA9p2uxTQ==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 08 Apr 2025 12:50:10 +0200
Subject: [PATCH 11/24] arm64/sysreg: Add ICC_IDR0_EL1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gicv5-host-v1-11-1f26db465f8d@kernel.org>
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

