Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55772281368;
	Tue,  6 May 2025 12:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746534280; cv=none; b=ugzMpduDxGr3FDzH1dM6k1HnfJR2jzXz8wWQzrg4dbOB8WcALnzbKNCEZQkOX4KMqXilGtNv4VZteOu+bsaMknzktOLL8hg2vpBMppwqCLTMkRJvEy51uuPeBgjOrjmMypb9q5hujbXUS/qRJBTQyY+G0BrspVtTliiObXk/I/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746534280; c=relaxed/simple;
	bh=aABGEIrWEsGcFFHRxubhJftIId76X0k2qcZSdwnplek=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cZRzMBTjONujAi0gafj6oOoihBUl7o6kzkwEr4Mx1m81rASriA+rc0+DDMNKPVFjndWevwq+p/1cLNR27YRQ2hacOr46Aa4EnqaDkswvNjC+A4Ps4Zh1VC72w6agEZr1NzC2t8WpPO5lNQPCa4fbQmj3lFBEoo9fjgSnvlitEzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FBXDAf60; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FBXDAf60"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E898EC4CEEE;
	Tue,  6 May 2025 12:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746534279;
	bh=aABGEIrWEsGcFFHRxubhJftIId76X0k2qcZSdwnplek=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FBXDAf60a8RKPxrbybL/t+7ybaq34zNLfJnqrxZH5G2+Ypuo8p6AFSVmkz4PB7MT7
	 NuJ4luoCgfaB/YrJTQJZuTawKzIFUoUXX4a5WJ3lu4F9EfApLF/o26nKAF+eo2NPD3
	 v0q2YbWV/z/TQrHHmEEeK8/pFqXhJlxjZortkcVsqnHsCCM1tdeL5Bwguq3l0sXjtO
	 uiWgRmDhlUsPPkoKy++SWFnEezwtno5n/tZOXyaTrKHk43RCTKMveocdIYsYyYUYeC
	 VSjvFxwLaZPcLEKnWzrSF+5b1xCuTueqtAkb6xrcwJmEt3J2UqDEIjOFgKRoiKsU4c
	 qDNPfONWVRVxA==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 06 May 2025 14:23:38 +0200
Subject: [PATCH v3 09/25] arm64/sysreg: Add ICC_CR0_EL1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-gicv5-host-v3-9-6edd5a92fd09@kernel.org>
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

Add ICC_CR0_EL1 register description.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 7acad93718c56729ce2a333ed007243ec554dbc9..c96243505031ea680c04a693fee2c96ad19e30ea 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2798,6 +2798,14 @@ Res0	14:12
 Field	11:0	AFFINITY
 EndSysreg
 
+Sysreg	ICC_CR0_EL1	3	1	12	0	1
+Res0	63:39
+Field	38	PID
+Field	37:32	IPPT
+Res0	31:1
+Field	0	EN
+EndSysreg
+
 Sysreg	CSSELR_EL1	3	2	0	0	0
 Res0	63:5
 Field	4	TnD

-- 
2.48.0

