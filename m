Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473722BF965;
	Tue, 13 May 2025 17:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747158554; cv=none; b=KJpmAmCkIDejBVRdQvsM1yTG7s0aBEnJ9E1vT3U9AJUqhvNVIIAx6YhVGOlCm9s1Z+BWaoslMca1Fz6xxA2GQGAA/P5hSqCxsf+MqZQOeuglVdGKRFpsPOiqykGdvhBCRwPiPfgOfG0lEvr4USUgB9ssa7dW1BG/cg3VtsDIkjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747158554; c=relaxed/simple;
	bh=SXFEECeYxUYqUwYY8B25Y1oGt+ahu7Dn22kSvbswA/c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gB4T5PXId7NJSSJnQq7HrJzGeK1qfbnt6ujeYqpNV2NVaO0y4LqZmho7YFvrCDtLP0ELifRtEhZaSqWmUR9AI97tfIDTBUOz8lMPWRrwjxgZGHHF4ZjL0f43kC7oOqb2w2SynPlyjmlzmW9dez7XvU7E+beVKmJkPQTs53lC0w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q1f8UZcD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q1f8UZcD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F70AC4CEEF;
	Tue, 13 May 2025 17:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747158554;
	bh=SXFEECeYxUYqUwYY8B25Y1oGt+ahu7Dn22kSvbswA/c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Q1f8UZcDfVsZQ9NcnSlj0ZsU6vm2liUUqGTBACBkHS7Y+an+4A+tOOoi9/Crs7Dim
	 4O2R3J0P92fnHj8LObxckh8kJVb+sGVkzBc/ysyeJwmdnpNZ7W7D84XafOWP7ZRJtF
	 Rp51JIrKyioR8xAD3Sek3xvzkcxxg2CuNJo9cs7WqnAybvEfu9SKuo5vHHpKovap86
	 2yl5hCnoACBESRlG/PQ5SPU023e1pkHsRF8vudT9sOtQrL3Mk+DbHZlzneNNDVUp3f
	 M/iNlJwaa1WqCVavrG9s/CJNq/X6xGHc+8GlQKrV4xHkyP5NWH/p+mpPCIRC6XGdiX
	 m63O+Dqsgb0tg==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 13 May 2025 19:48:03 +0200
Subject: [PATCH v4 10/26] arm64/sysreg: Add ICC_PCR_EL1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250513-gicv5-host-v4-10-b36e9b15a6c3@kernel.org>
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

Add ICC_PCR_EL1 register description.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 60fd9bd44fa92af2634e49d9a650bb1c9049983c..b26e11b6e109850947be30dd2fb9c044d21c0aaa 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2806,6 +2806,11 @@ Res0	31:1
 Field	0	EN
 EndSysreg
 
+Sysreg	ICC_PCR_EL1	3	1	12	0	2
+Res0	63:5
+Field	4:0	PRIORITY
+EndSysreg
+
 Sysreg	CSSELR_EL1	3	2	0	0	0
 Res0	63:5
 Field	4	TnD

-- 
2.48.0

