Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FDB267AF3;
	Tue,  8 Apr 2025 10:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744109462; cv=none; b=L6fB7k/pebs1FKvwF954B9/CJNTxGZ1sm0ey+KQXpHHa/M9OQAjBvda2unr8nSDQEKGWJft2wU9qwOJBaD1m/ddXZeiE+7T2XzD/+IduKFyh34pLTpll1lnQ7mWE4EbanDBEnXNxf/v9nhWOEfQWYa0pLMOYp/DDgUxk/NBqFUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744109462; c=relaxed/simple;
	bh=TEy69hatB9WvAQZk1Qj5SRXNdR02N3m6osQeJAFrqRk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kg65rkcFn93y8qhoa5TbQIEdSji8TUkkv9rWOrmIeEB9+CBUX7i3Ild1X3qoz5n6elJNRZBT3DyEBZww2XcSt9kb9Y/4jHyYdAJtJTOAV/lUkuW2+L9snOhy/ZO5iPz/uktx30BXpGrjuUFAQ4O+JFC36utSUiAMf+8B5HyqV6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YUCkX0ul; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YUCkX0ul"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DE57C4CEE5;
	Tue,  8 Apr 2025 10:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744109461;
	bh=TEy69hatB9WvAQZk1Qj5SRXNdR02N3m6osQeJAFrqRk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YUCkX0ulvIxZ4N51xRAyWmVK7w0m0lvL2hCAQJaaQcN+Y4TXiug/Sw+Hhn6p5wCfK
	 jT1lYHerOEPk+LPgEqRevmpsOq7aPBvLc76gH9Z1abKqSOJLtMQieQeZtFbl0VNhQb
	 TgVYAT8x4jHasXDH8l33BJQW5Q/z/7E69bGHqO981KMv/wslZmQCLOJFsOIEZVDomc
	 gFP2/sgRrg+viz5wx60caX1rXZokKMH2MzsXb2gooSViFvIEStGyl9VJxoueX0lrT9
	 qSttCm6VKP5rWV2yhLkjGDPKnYYa4Zljt/AQfUuSBTzVg9Rl2o5mqVh7GObxW20H9S
	 cx2x2lJqaAv+Q==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 08 Apr 2025 12:50:02 +0200
Subject: [PATCH 03/24] arm64/sysreg: Add ICC_PPI_PRIORITY<n>_EL1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gicv5-host-v1-3-1f26db465f8d@kernel.org>
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

Add ICC_PPI_PRIORITY<n>_EL1 sysreg description.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 83 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 06e1fb5e126b41b7e41fffa0a00553d73197ac3c..0cc1268c0bfad8266da47b441e80c603e46c00ae 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2310,6 +2310,89 @@ Field	31	C
 Field	30:0	P
 EndSysreg
 
+SysregFields	ICC_PPI_PRIORITYRx_EL1
+Res0	63:61
+Field	60:56	Priority7
+Res0	55:53
+Field	52:48	Priority6
+Res0	47:45
+Field	44:40	Priority5
+Res0	39:37
+Field	36:32	Priority4
+Res0	31:29
+Field	28:24	Priority3
+Res0	23:21
+Field	20:16	Priority2
+Res0	15:13
+Field	12:8	Priority1
+Res0	7:5
+Field	4:0	Priority0
+EndSysregFields
+
+Sysreg	ICC_PPI_PRIORITYR0_EL1	3	0	12	14	0
+Fields	ICC_PPI_PRIORITYRx_EL1
+EndSysreg
+
+Sysreg	ICC_PPI_PRIORITYR1_EL1	3	0	12	14	1
+Fields	ICC_PPI_PRIORITYRx_EL1
+EndSysreg
+
+Sysreg	ICC_PPI_PRIORITYR2_EL1	3	0	12	14	2
+Fields	ICC_PPI_PRIORITYRx_EL1
+EndSysreg
+
+Sysreg	ICC_PPI_PRIORITYR3_EL1	3	0	12	14	3
+Fields	ICC_PPI_PRIORITYRx_EL1
+EndSysreg
+
+Sysreg	ICC_PPI_PRIORITYR4_EL1	3	0	12	14	4
+Fields	ICC_PPI_PRIORITYRx_EL1
+EndSysreg
+
+Sysreg	ICC_PPI_PRIORITYR5_EL1	3	0	12	14	5
+Fields	ICC_PPI_PRIORITYRx_EL1
+EndSysreg
+
+Sysreg	ICC_PPI_PRIORITYR6_EL1	3	0	12	14	6
+Fields	ICC_PPI_PRIORITYRx_EL1
+EndSysreg
+
+Sysreg	ICC_PPI_PRIORITYR7_EL1	3	0	12	14	7
+Fields	ICC_PPI_PRIORITYRx_EL1
+EndSysreg
+
+Sysreg	ICC_PPI_PRIORITYR8_EL1	3	0	12	15	0
+Fields	ICC_PPI_PRIORITYRx_EL1
+EndSysreg
+
+Sysreg	ICC_PPI_PRIORITYR9_EL1	3	0	12	15	1
+Fields	ICC_PPI_PRIORITYRx_EL1
+EndSysreg
+
+Sysreg	ICC_PPI_PRIORITYR10_EL1	3	0	12	15	2
+Fields	ICC_PPI_PRIORITYRx_EL1
+EndSysreg
+
+Sysreg	ICC_PPI_PRIORITYR11_EL1	3	0	12	15	3
+Fields	ICC_PPI_PRIORITYRx_EL1
+EndSysreg
+
+Sysreg	ICC_PPI_PRIORITYR12_EL1	3	0	12	15	4
+Fields	ICC_PPI_PRIORITYRx_EL1
+EndSysreg
+
+Sysreg	ICC_PPI_PRIORITYR13_EL1	3	0	12	15	5
+Fields	ICC_PPI_PRIORITYRx_EL1
+EndSysreg
+
+Sysreg	ICC_PPI_PRIORITYR14_EL1	3	0	12	15	6
+Fields	ICC_PPI_PRIORITYRx_EL1
+EndSysreg
+
+Sysreg	ICC_PPI_PRIORITYR15_EL1	3	0	12	15	7
+Fields	ICC_PPI_PRIORITYRx_EL1
+EndSysreg
+
 Sysreg	PMSELR_EL0	3	3	9	12	5
 Res0	63:5
 Field	4:0	SEL

-- 
2.48.0

