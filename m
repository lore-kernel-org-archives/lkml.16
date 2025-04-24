Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33958221F0F;
	Thu, 24 Apr 2025 10:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745490393; cv=none; b=tL/5ee5sOLz83n6HBvxEAd6Nx2SwPfF7O9JwoKSGG0uyJEZonkHZaKSWNb76mihnTgLsKP2SbpMNfIyPLXQk8VQTM0+2JwvR+rtyyXHcSoRCgHTsHCkOZwz7khiwiV+E0r0ofKYIdoPfdwHhD7sAZ4kcnX8saj42URMS0C2I2wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745490393; c=relaxed/simple;
	bh=aABGEIrWEsGcFFHRxubhJftIId76X0k2qcZSdwnplek=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IY2P9f8ejcmltRYLfLUyVo/Ak6QWro6YdEfgvGzbXSvVlLeBK34HyGCxVQg4R4bDtn8XXEXDLcD/h/EzJFhigQQ0LUCTc+x8jLtjLynxJTZD9Ac8BsSItM52mlIWDopUWqrsW57YvP7qV3BmHRCWkbCvNDYsJ3EStLnAGNWyfBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HBybB16+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HBybB16+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8ACFC4CEE3;
	Thu, 24 Apr 2025 10:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745490392;
	bh=aABGEIrWEsGcFFHRxubhJftIId76X0k2qcZSdwnplek=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HBybB16+fsCutQzZUOtglVtIX3DMjYHUdACgl8SYiD1QHUtJ0GTMgfNb7I0dzQFxZ
	 bPKQxbwQZRHUlf3FzzE/UvhOztI5wfpHNZDtiF85DCpD9iSNVOQTGJFHLmgInFVyj+
	 cEvSewxpwNtI/1uDJCIm+RGGY0lRjmefMgxBQeaVl8+XWaYZUvLJgTeJqPIQfQ33UZ
	 8tSKTg5tpnJ0H5PE0+ey+Y4u+uNnmbsFqjSDWEUFaqXnSg//FC6xVUgXvI4ANov0Ac
	 fTpzJT3UXuODx5YDMmbnSuHW4ijpk/62PBLfKcl9qo/8lyQE+cMSelTzMejy3wuiSn
	 ri4E5SO2lHENQ==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Thu, 24 Apr 2025 12:25:20 +0200
Subject: [PATCH v2 09/22] arm64/sysreg: Add ICC_CR0_EL1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-gicv5-host-v2-9-545edcaf012b@kernel.org>
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

