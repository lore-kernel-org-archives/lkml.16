Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9506522CBD8;
	Thu, 24 Apr 2025 10:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745490415; cv=none; b=a8MukxooOVPhGZDzNP1cp3siNbBChLibHVPIrfBQ4DIHnMz9qX6TpUcW9grkPpu7lddK4+C1anLRsP1iPNPOh6/taZpJjWTWtdpGnSCc2syJVtEVpZJYs1iExXSq/UbgSyRZtQ0sh1N7/n39qy2WuVo3OrvTaSv4H6dMVkVQc6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745490415; c=relaxed/simple;
	bh=3IG/dkyf3kNeiDq8iUpch8Bd+BjlFKQ3NbAf5IVjrxM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qB06ui+mRZlRC5TNtQPxnuD8xNB+NOqyOW0IJ+eLHfldVAxtgQoF1TdDTPRj0auk+xIYJ/0+X+jITnaY+A98kv/4WzBt8iDUHbInXWj1HgekRv/r7MCGGAgjhvI+on9H1x5JOJ4hisKThfUe6dj66nOxZ8XtmOZc6yWSivH6ksI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M28sLNqC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M28sLNqC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46018C4CEE4;
	Thu, 24 Apr 2025 10:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745490415;
	bh=3IG/dkyf3kNeiDq8iUpch8Bd+BjlFKQ3NbAf5IVjrxM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=M28sLNqC620m8NNrZgATeqJdSe7yKMG2RDnyR6Jf7ZcFygLnMTPr+0Fr7JPr1X0BQ
	 yzOF6EZWn19L9mWBN1MARdfa8p82q9wZy35KNA9tQMu+L3fTf+9tQHgvhKoj+SAu/e
	 03X6RyLzqpHaOwKbEJ/k5mNH//b79cjCLvs0LVN2kH7KD2helyorXWataIb2bToOe4
	 DLQJhOpUKAoKLexh2G9NAZa3tRYfcAscu7UlHpOJzEB/5s3fTJ2eHgW355dMhsJxRx
	 BHQcOuL2qxDTD5zwYMB6yl0z0GfY6krxfSB7meTsDmYqODONopxfCSffa632fjkSxx
	 WuwxK3bC/KmJw==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Thu, 24 Apr 2025 12:25:24 +0200
Subject: [PATCH v2 13/22] arm64/sysreg: Add ICH_HFGWTR_EL2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-gicv5-host-v2-13-545edcaf012b@kernel.org>
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

Add ICH_HFGWTR_EL2 register description to sysreg.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 0c0e805481c84a14ae62d199466171d97d54ef90..1b519e35000be328acfe26d51e098059f9cf9ef2 100644
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

