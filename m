Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277C719DF75;
	Tue,  8 Apr 2025 10:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744109476; cv=none; b=A8wfQiCmB+16chpGfi/jsNw38CX944yh9cSmyIWWm32W+IuwzaFcp2XfcVM8IBHNIfYf95L5CeV/TlDH9/hNG9XpDypYb9E8bC9TKzaBzVT3FlmBpez2Y2P4MOXNJvzcRIOc6IMq358HHL2UBz/4urFOkbDwYWt2UrSO1bv/Yuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744109476; c=relaxed/simple;
	bh=kr4FIsYzSG8vhPEwCV+efvFDb0h/Nmo/+nvgPyW4hHA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TR95w6n+v03obpiqi8+cVI2K9Aj2OLLVEGy3df/d3mkK4CgAI/2yw3jBqhg/34x9gQ3BRw+QJAWaYEL0MW/k288KUpXGPDmDtpqO/owEcRa6WVFqNOxfDZoT7HJTb9MB74gFEIo9tjZ+jv+QRiT+xOACf7Ig450ZAgMLSd7JxFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V2k16FIK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V2k16FIK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C272C4CEE7;
	Tue,  8 Apr 2025 10:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744109475;
	bh=kr4FIsYzSG8vhPEwCV+efvFDb0h/Nmo/+nvgPyW4hHA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=V2k16FIKh3L0qk7mXkvtvYwDc4/1TV10uaJm4yIQthxTL2zOuLjIxeb7eA5e8E3YR
	 NSnepy9Jmq4ZIcPR0tyNALaph50n4itF3VLjyHzVscSf/8Z8ZGGbcRFQM2aYg2hi6Z
	 rcngSrv3xLfiZLJdDkbe5d9qnsGqTiJrHNkoiScJqvziZSk8lJC1usBoNW82pRILrc
	 yKL9t5COa1XQqb1P17IAIeJUGtH0DMHY8xYIodIH6PPYeubRD9m2fL5GaL2mMs3DpF
	 nnua16A9mkQgVkEjz7KI5eGhTbXvU3fTYTMsjL8suCwpAN3w9OviksFb+PzoySmhwq
	 qwY4VapIWJYdw==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 08 Apr 2025 12:50:06 +0200
Subject: [PATCH 07/24] arm64/sysreg: Add ICC_PPI_{C/S}ACTIVER<n>_EL1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gicv5-host-v1-7-1f26db465f8d@kernel.org>
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

