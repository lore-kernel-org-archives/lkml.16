Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1755F227EAF;
	Thu, 24 Apr 2025 10:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745490383; cv=none; b=H5l7YVsDA0DIyulufx5C8VXjjGwkSTa99Os2xgo5f0u52KNQC2oaWelNnFVTeqYFkCRGVqExQs9F8vbn7JXmv02ktWaYYl0JRawWlwMSoYtgnslCxGUpcDKtWdjrs9ECbtC37sn2IgP7FyM5LsaKS51pVLTbt10XOLkmlCJDmKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745490383; c=relaxed/simple;
	bh=kr4FIsYzSG8vhPEwCV+efvFDb0h/Nmo/+nvgPyW4hHA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IhIGOO4xcHcvC8IX4cL9kDxmOd6lEp9fmmAQ8c18JaV1Ohb6DURCUIZbz/oBJbkKdwN/QoxpAONdVxnAXaR58Sp0uBQinjS35OYPLYHeOhzopfS9RZZpw+sEfQpLXtbWwYN+TNe+Wuqb2fTGZOASXEUqMMeemGG+R/XyO2Zpd8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ILKyBt1I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ILKyBt1I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE89EC4CEE4;
	Thu, 24 Apr 2025 10:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745490381;
	bh=kr4FIsYzSG8vhPEwCV+efvFDb0h/Nmo/+nvgPyW4hHA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ILKyBt1IczSJiTJPvZMBBVo8QwbcOmuh8v5F9KPko4PDKCnBGqFWWEk1Ddo2ZeoSQ
	 FqyVtfMbxxlfMjkEhpnfwtwnPV1Es4iBa9nouBPw/L5881GL5ShkIC3RqCowyIwY30
	 tfaXfhAqmULzHGW58B7ZHWExlQ5YWq0K/DumgvQJSVaceVzcBpcscPWVbikUAAdMfI
	 8ecczXF9vlIjnfD91cGAHWIF0q+rGxH8zW2lEvLfWzgWOrfnH3OKWP3S0kfTshUw+6
	 m2rj+gD+HA54nKPjR067r5S8dJfQa8TUmGdaoNEN9q+tsPS8aXVH1aa6JfpeJgMmCO
	 MjaCdA4Dzn7fg==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Thu, 24 Apr 2025 12:25:18 +0200
Subject: [PATCH v2 07/22] arm64/sysreg: Add ICC_PPI_{C/S}ACTIVER<n>_EL1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-gicv5-host-v2-7-545edcaf012b@kernel.org>
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

Add ICC_PPI_{C/S}ACTIVER<n>_EL1 registers description.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 83 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 6c5552707ad88c145adc8b7ceb3f63da401191ea..0485721e1575c9ed158210c6f02fb9af2828f2d5 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2474,6 +2474,89 @@ Sysreg	ICC_PPI_ENABLER1_EL1	3	0	12	10	7
 Fields ICC_PPI_ENABLERx_EL1
 EndSysreg
 
+SysregFields	ICC_PPI_ACTIVERx_EL1
+Field	63	Active63
+Field	62	Active62
+Field	61	Active61
+Field	60	Active60
+Field	59	Active59
+Field	58	Active58
+Field	57	Active57
+Field	56	Active56
+Field	55	Active55
+Field	54	Active54
+Field	53	Active53
+Field	52	Active52
+Field	51	Active51
+Field	50	Active50
+Field	49	Active49
+Field	48	Active48
+Field	47	Active47
+Field	46	Active46
+Field	45	Active45
+Field	44	Active44
+Field	43	Active43
+Field	42	Active42
+Field	41	Active41
+Field	40	Active40
+Field	39	Active39
+Field	38	Active38
+Field	37	Active37
+Field	36	Active36
+Field	35	Active35
+Field	34	Active34
+Field	33	Active33
+Field	32	Active32
+Field	31	Active31
+Field	30	Active30
+Field	29	Active29
+Field	28	Active28
+Field	27	Active27
+Field	26	Active26
+Field	25	Active25
+Field	24	Active24
+Field	23	Active23
+Field	22	Active22
+Field	21	Active21
+Field	20	Active20
+Field	19	Active19
+Field	18	Active18
+Field	17	Active17
+Field	16	Active16
+Field	15	Active15
+Field	14	Active14
+Field	13	Active13
+Field	12	Active12
+Field	11	Active11
+Field	10	Active10
+Field	9	Active9
+Field	8	Active8
+Field	7	Active7
+Field	6	Active6
+Field	5	Active5
+Field	4	Active4
+Field	3	Active3
+Field	2	Active2
+Field	1	Active1
+Field	0	Active0
+EndSysregFields
+
+Sysreg	ICC_PPI_CACTIVER0_EL1	3	0	12	13	0
+Fields ICC_PPI_ACTIVERx_EL1
+EndSysreg
+
+Sysreg	ICC_PPI_CACTIVER1_EL1	3	0	12	13	1
+Fields ICC_PPI_ACTIVERx_EL1
+EndSysreg
+
+Sysreg	ICC_PPI_SACTIVER0_EL1	3	0	12	13	2
+Fields ICC_PPI_ACTIVERx_EL1
+EndSysreg
+
+Sysreg	ICC_PPI_SACTIVER1_EL1	3	0	12	13	3
+Fields ICC_PPI_ACTIVERx_EL1
+EndSysreg
+
 SysregFields	ICC_PPI_PRIORITYRx_EL1
 Res0	63:61
 Field	60:56	Priority7

-- 
2.48.0

