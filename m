Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B1027FD5B;
	Tue,  6 May 2025 12:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746534289; cv=none; b=lbTfKewKH4rqVzAk3lRSj9h3e7+dnixcRm9P4XaqDrMQjcNGanm5vDAfIbg0c0cUFtPNCfqcOFK/YfbXJ+EodaX6rlqoIpO/BChU7JmIQfnd7XbBgdWgBnxAY77zcVYOTqWKFH2N0v5qprclm3jx2VbDlbuFtXiA0upxaSMwRSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746534289; c=relaxed/simple;
	bh=Dk78WkgkowYSPPndroB+3TTj6jQAcxwQp1XS8EQ5gtg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aBJ/yixalIROgJHc/ZaxrFg/DXhMyXaoTqKCzib4tYgUSVD25ey7ET5aZQk+V5g2cV5dAKYXoK2JtQ4MWSK47QllmRl/bvl498S9K7YxPPNZXJ+NKKzVcxP+M9HdPcCr9eJI7l193pHKXHKQsSvS93tf22BSgYzQ7IFF/2+t5Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F4Lhskuf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F4Lhskuf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3355C4CEE4;
	Tue,  6 May 2025 12:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746534288;
	bh=Dk78WkgkowYSPPndroB+3TTj6jQAcxwQp1XS8EQ5gtg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=F4LhskuftmnNJUUbeCs4it+1aQlhCbN2dPm5El8d3mxhYb9PXrGjib6Aq9ApVmiKg
	 R6m/nx3PzMTC1/ITjIg6UURoT7zbm8IkGmfBFjhM/CxdBGpCjhQb7378aK3NfLNQhW
	 OHXDrVLxWCJvQNq5rT/NeAhBaIljXm3KiNLzYOrj29nchHj98OMhJORig42Q6U5TD1
	 pNVNGefEwJQFF0Hed4XZYa4RytuG4nukAQxLb0hgYLVQcoTAfuVyXlpW0PdPnKnZL3
	 AVXwbZ9MY8kuQU03STnAIMfMEBlYPXWkeDFZZ7kOh5D0Il8Dkl9qppAynB6/1yTmYj
	 BoWUcBLcEPmmA==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 06 May 2025 14:23:40 +0200
Subject: [PATCH v3 11/25] arm64/sysreg: Add ICC_IDR0_EL1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-gicv5-host-v3-11-6edd5a92fd09@kernel.org>
References: <20250506-gicv5-host-v3-0-6edd5a92fd09@kernel.org>
In-Reply-To: <20250506-gicv5-host-v3-0-6edd5a92fd09@kernel.org>
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

