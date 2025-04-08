Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF00319DF75;
	Tue,  8 Apr 2025 10:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744109473; cv=none; b=FyElE7F4OWnfGvo2PMBXV12oKKkrFGEtgq0g77ferZWwDoysWNFXie8+KC/TKjxw8Xi2aAf5wWjVe+PH/s3/NGkdal+hOmkzHZKvcRlDNOSQz5fQeGGrmxN2GxdHFP7E+nfh8Qmh79VjD+et1vlEuOf6Vf9J6BwuVEBopd24N2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744109473; c=relaxed/simple;
	bh=eUBcCIH4szhTdWT4b2dVdh8O8kcTuP+XkEb7/cO8FcI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jf3a1GMGbtopzA6W090ANaYhh/PfgLMBqNdVsbpS0gEoGKMc516vlmPWJjV6NxCHgYL5015heBrujYY340NYc0n4H3BDg/Zn6SmN7WKDTCGFzPRlYJ83HDsnuHeCbI9k802MTWNzWqgGN5q7SLvLC47ITVePYuxX1OxFkabnvH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CP/eyDun; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CP/eyDun"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07815C4CEE5;
	Tue,  8 Apr 2025 10:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744109472;
	bh=eUBcCIH4szhTdWT4b2dVdh8O8kcTuP+XkEb7/cO8FcI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CP/eyDuna76WIQOXURkeSNYeN1WASmyCiQ/h0aniWChKSgMyN0r5PRcwhBT4hl35j
	 PH934lfjaxT2bE1ylVsJ+yUforc1DTm8m/oGfwYwm/Zlq6VcJYSYjpQ0GadQxmEb7o
	 TYsgA2mY0vVJ4T5jsQrRxgKJmKItULt3EZ7jLcC5WO7yJlAtpTcqRXcprZs+M0/pCm
	 L+QhH7XmB8RasXs99BAQQYsYtSre3E2l1kjnCj3AnP9oplxp6DScw/w5odb0fUUEV0
	 Vt9WV0qlLrysObTtqfCIfNthDv2fNOJUWrrZ3QgRelAs3z5z17AYqmjmNyDHCla2OK
	 wN6hhFOh9UE8Q==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 08 Apr 2025 12:50:05 +0200
Subject: [PATCH 06/24] arm64/sysreg: Add ICC_PPI_ENABLER<n>_EL1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gicv5-host-v1-6-1f26db465f8d@kernel.org>
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

Add ICC_PPI_ENABLER<n>_EL1 registers sysreg description.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 75 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index d046d719d4f69801aeef51b5b9437a0eaa04134e..6c5552707ad88c145adc8b7ceb3f63da401191ea 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2399,6 +2399,81 @@ Sysreg	ICC_PPI_HMR1_EL1	3	0	12	10	1
 Fields ICC_PPI_HMRx_EL1
 EndSysreg
 
+SysregFields	ICC_PPI_ENABLERx_EL1
+Field	63	EN63
+Field	62	EN62
+Field	61	EN61
+Field	60	EN60
+Field	59	EN59
+Field	58	EN58
+Field	57	EN57
+Field	56	EN56
+Field	55	EN55
+Field	54	EN54
+Field	53	EN53
+Field	52	EN52
+Field	51	EN51
+Field	50	EN50
+Field	49	EN49
+Field	48	EN48
+Field	47	EN47
+Field	46	EN46
+Field	45	EN45
+Field	44	EN44
+Field	43	EN43
+Field	42	EN42
+Field	41	EN41
+Field	40	EN40
+Field	39	EN39
+Field	38	EN38
+Field	37	EN37
+Field	36	EN36
+Field	35	EN35
+Field	34	EN34
+Field	33	EN33
+Field	32	EN32
+Field	31	EN31
+Field	30	EN30
+Field	29	EN29
+Field	28	EN28
+Field	27	EN27
+Field	26	EN26
+Field	25	EN25
+Field	24	EN24
+Field	23	EN23
+Field	22	EN22
+Field	21	EN21
+Field	20	EN20
+Field	19	EN19
+Field	18	EN18
+Field	17	EN17
+Field	16	EN16
+Field	15	EN15
+Field	14	EN14
+Field	13	EN13
+Field	12	EN12
+Field	11	EN11
+Field	10	EN10
+Field	9	EN9
+Field	8	EN8
+Field	7	EN7
+Field	6	EN6
+Field	5	EN5
+Field	4	EN4
+Field	3	EN3
+Field	2	EN2
+Field	1	EN1
+Field	0	EN0
+EndSysregFields
+
+Sysreg	ICC_PPI_ENABLER0_EL1	3	0	12	10	6
+Fields ICC_PPI_ENABLERx_EL1
+EndSysreg
+
+Sysreg	ICC_PPI_ENABLER1_EL1	3	0	12	10	7
+Fields ICC_PPI_ENABLERx_EL1
+EndSysreg
+
 SysregFields	ICC_PPI_PRIORITYRx_EL1
 Res0	63:61
 Field	60:56	Priority7

-- 
2.48.0

