Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7D528002B;
	Tue,  6 May 2025 12:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746534254; cv=none; b=iu3KCTwnasI1qWo645Vjk6EdVpAQFxPY6v+NqtpwN92Sap/1tXpzx9PoyayuinXAFDaepUms7R6er7bvvfwtomcCWw6azjLahc9Z1ZJxRR5Bxzxkxjn7E/yULelDrqmXue9G5QYYSwSh6kEnymREiCW5B4JSRgSj0vZBPJqBoZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746534254; c=relaxed/simple;
	bh=TEy69hatB9WvAQZk1Qj5SRXNdR02N3m6osQeJAFrqRk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tLZC4ZoK+G7SmDycbuGW949BqdOso97r2p5cukuZPuStR00xOraoTD72nzF8x33GlXH9IfcU1U5zvElQjeUH9Ubhqkf1Up7yEQrDxOzE+SspCLfiDoxl/AdIcmdS9enYlKxQ3qK6UTdGSahO8YD7VxDrDzo50O8xtjIgVxreaTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pP9mCQhJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pP9mCQhJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B08BC4CEE4;
	Tue,  6 May 2025 12:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746534253;
	bh=TEy69hatB9WvAQZk1Qj5SRXNdR02N3m6osQeJAFrqRk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pP9mCQhJlnmub9JIqm2vlrsuYyLARjeK5WZXkd0lACQUSKgl+l24d52bj3g6GExY4
	 uE+mGixk4ZDx3z0dD3m1BQuz1d+R/uoEhxyLLiMVxSz7UiQ7D722X9WajgtH2QUFkC
	 aOfmY6Jgy0XMN1zX04T/wnsipioKHe91Djq4yawwcZmAqDCv98fyLAqJJcvemX5owy
	 kXIqUwku0YWIr9kcNp0cgf/0i0/57m2UHr1xsEpHddrhr6vTDV/CIbmnAYqN7sitCS
	 oB0CKkQM10JxVS+a/pB72D3tNZ4CmK24cPo8D2o0jJMJkd3RyReSP4bIwsvzPSQaX3
	 MikjQEyvuXumQ==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 06 May 2025 14:23:32 +0200
Subject: [PATCH v3 03/25] arm64/sysreg: Add ICC_PPI_PRIORITY<n>_EL1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-gicv5-host-v3-3-6edd5a92fd09@kernel.org>
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

