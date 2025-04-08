Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34018268C73;
	Tue,  8 Apr 2025 10:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744109497; cv=none; b=l6mWJZUoHPsp4KG9fvApMxn44KXtAK6RNStOgVEpmH2zs7yM7mPp/ULmlcY0CJHYDlkzUcO7+oBlcz/AliI2SR7AsayI4NZDu/qcPGr0tZBzbqXIiHZFjuwfeGZktbiuOlDg+2YrrabA3Cqcmk4znyr+PsCqTY5UpZ+DbotG8wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744109497; c=relaxed/simple;
	bh=3IG/dkyf3kNeiDq8iUpch8Bd+BjlFKQ3NbAf5IVjrxM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PDVERPrqk7iOYDWzagEtmTCrK8OR3XQ+ns07ZTMrwhAqiyCJde3VA8hKK2vQnJL8fmLc+NmZ7BUo+o075/AtIMu+cnSunDTeG5BkdDYusN9SC4fKWFQheLYaShs9zitH5xjPszGSVf2UIJjve6OejAO3UBLbyHuwkzHXgkfAMyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FHKQq4tw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FHKQq4tw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 068CDC4CEE7;
	Tue,  8 Apr 2025 10:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744109497;
	bh=3IG/dkyf3kNeiDq8iUpch8Bd+BjlFKQ3NbAf5IVjrxM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FHKQq4twrK7xTKWdKlPXPZsuvBDkicu1IY7gUhelIlyw8F51yyGrSCxthPOZJueZz
	 UECF4Uv/3UOFpXdj3bUFCyMDdOJyXV0dq0WdwHJoBP/sZ2sc2E2Jw7OJADD0R1U1J8
	 EeujiAHNfwx6qnvxU4n3QuS/8rFs6eZ07/9MrREzuXHL95/PJJxHQJbWlZNBhsyjGS
	 AY2y4tZCKQbarq4+0/3ypqStJiqiL7FhabuHNgVrRZFsdqTxl+QARXIK7suQ3NtZRT
	 1skYiLsUC3nRr1fwg4uXfQ/ZqgOKRZDSwtJR3O3sWhErD9GQ3FS6mL6ptSTlv8XoTi
	 L4u6wHsLrBxoA==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 08 Apr 2025 12:50:12 +0200
Subject: [PATCH 13/24] arm64/sysreg: Add ICH_HFGWTR_EL2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gicv5-host-v1-13-1f26db465f8d@kernel.org>
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

