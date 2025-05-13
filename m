Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D43C2BF984;
	Tue, 13 May 2025 17:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747158533; cv=none; b=pYPNSAueHqvz8MQkaadftHj6q/u/1ZHCXkcc57eXUUbSYhLjTS7Xt8c8j4tI15Utw0YRCaBEcTebKUoIsxKnQ7NvlG0iH7MVWyQMQdkPyzrlhxLhNl03+S/DRWZAWDLr8qjj6/XMYyiLwFImtLJ7a03+VLbgbE9Tk4pA/eo4oqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747158533; c=relaxed/simple;
	bh=L2AyC0q/j1rg0Q8xOp2gZtcfrltSKtgGKZOBzDeAFq4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a4FVrUYm4hbmp1QCUN3c4FWgvHwNyh2bdSUWdTSlOb+nziAOrz8b9OAlgmp3SYaAsS9UofL2rZdthrHgLDxdgpfw5M3k5M14Ci0LWxhTu7cyKoCVCPtQZ7UKHstj9gC26CrOAnCL1gTTDod+G1LTV6KoCqJx5VGKosG1Y/aWBIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Si3CbBIi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Si3CbBIi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76590C4CEE4;
	Tue, 13 May 2025 17:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747158532;
	bh=L2AyC0q/j1rg0Q8xOp2gZtcfrltSKtgGKZOBzDeAFq4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Si3CbBIi33CEmSG4N5JcX7DG+/zFMZgBY39aevyfWF/GzESs6Z0W5wURjq8giRZnx
	 C8fgH/z/xNuNVROorc/hm08x8gZCadSFfansf4ZSWkKILQqxMMf+aDuBUJTycPFspc
	 XJ4lDQSC6SvCP+1ZUidPBOoE6MwuSYmxqAdzwY6KziHbNz2ZcXJSr5xDZHXdrtGh4t
	 Lyp9UJZHaiw4vqwZXCmokMjECZIJtnNCCvH9yD5LgjOpJ44p4Bv1wDPtx0++0swZwu
	 jI6dMnKqsKvoVAsb4Vxs075jDQ4SwMRN8B8QrjgXpaWIfHhC95d+9S7JzPwaLH+UHZ
	 r/3XnpE7lbjZQ==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 13 May 2025 19:47:59 +0200
Subject: [PATCH v4 06/26] arm64/sysreg: Add ICC_PPI_ENABLER<n>_EL1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250513-gicv5-host-v4-6-b36e9b15a6c3@kernel.org>
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

Add ICC_PPI_ENABLER<n>_EL1 registers sysreg description.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 75 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 9d8e62f1c2f4f123f8f8b71966806a07ff006da1..02eb3fd876dcb1612dc5436d509a80f9e7f70903 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2399,6 +2399,81 @@ Field	1	Enabled
 Field	0	F
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

