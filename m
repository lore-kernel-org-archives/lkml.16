Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BAA2C1797;
	Tue, 13 May 2025 17:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747158584; cv=none; b=dI44R8D9zFjP/bFAT8ojUFtbylXSD482alnQ/DVMp7goYjEbGBFVWWOINXR8ZbXMuU38e3P360LjiWDUt8WgIkvMneSsf/K5/Q/4ksY85TUTBxWoYZHAh9/7Q+tfSgjZe/E8ayEpsC+tq3zrE7LeWfbIaoNXIm+0492Ey7/AKHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747158584; c=relaxed/simple;
	bh=J4d+23jK1xcMwImyyVNILtAarSzyfyzelW1CaxCFjwc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BwxI+BbhfQJc7lbQcfSROlihE2DKEwycJhHsgOKnypS3MYlzKQIQy4WRaTbJk8pqwGMJGhTQzJAZkz0eXXvnis3i//aM/zeQSL1CsTLXo+ff98WikJ64FopQikVZTDxAwjhZgx3FJ/zREB9t4Jk6T7kRLNfGBLObq54vzWbaE4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VntzJv0U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VntzJv0U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC0AAC4CEEF;
	Tue, 13 May 2025 17:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747158583;
	bh=J4d+23jK1xcMwImyyVNILtAarSzyfyzelW1CaxCFjwc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VntzJv0UGqj+kRgbCuIs5NGJ5EwztiHEcRlSiY2ri+k0qw+4rlrj+x1mdt3QQcpgz
	 d8SnWUZdKurf+n/sS+GNNEO2ixgNM2IZy96h5gbKLpmeXTfpOsMDOY4XuBbVk4dWS8
	 IYI/Y7N+lJU+r84TyT4vDrfNCX/29c/mjzW+EJ90UUxzBGrMc6g7K4wlF8XBkN4avw
	 6JyYnhVGgLjx5j/auzetMFOYfvMxWHEvoLYZnpK3q7OlGbkrdvE/RySU56XRE7/y+Y
	 ii0jFG9fEitoJqoZpLttPzfCOcsHMYNF0lX13i/6fZXf10twG4HNTqnNzmTI5G+bD3
	 XYojvTu+BEUIw==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 13 May 2025 19:48:09 +0200
Subject: [PATCH v4 16/26] arm64: cpucaps: Rename GICv3 CPU interface
 capability
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250513-gicv5-host-v4-16-b36e9b15a6c3@kernel.org>
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

In preparation for adding a GICv5 CPU interface capability,
rework the existing GICv3 CPUIF capability - change its name and
description so that the subsequent GICv5 CPUIF capability
can be added with a more consistent naming on top.

Suggested-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kernel/cpufeature.c | 10 +++++-----
 arch/arm64/tools/cpucaps       |  2 +-
 drivers/irqchip/irq-gic.c      |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 9c4d6d552b25cb3a31d1fb267bd73d3f82513e69..cbb49de451f45fbee3100ea01e77b06352bd55ac 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2283,11 +2283,11 @@ static bool can_use_gic_priorities(const struct arm64_cpu_capabilities *entry,
 				   int scope)
 {
 	/*
-	 * ARM64_HAS_GIC_CPUIF_SYSREGS has a lower index, and is a boot CPU
+	 * ARM64_HAS_GICV3_CPUIF has a lower index, and is a boot CPU
 	 * feature, so will be detected earlier.
 	 */
-	BUILD_BUG_ON(ARM64_HAS_GIC_PRIO_MASKING <= ARM64_HAS_GIC_CPUIF_SYSREGS);
-	if (!cpus_have_cap(ARM64_HAS_GIC_CPUIF_SYSREGS))
+	BUILD_BUG_ON(ARM64_HAS_GIC_PRIO_MASKING <= ARM64_HAS_GICV3_CPUIF);
+	if (!cpus_have_cap(ARM64_HAS_GICV3_CPUIF))
 		return false;
 
 	return enable_pseudo_nmi;
@@ -2483,8 +2483,8 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.matches = has_always,
 	},
 	{
-		.desc = "GIC system register CPU interface",
-		.capability = ARM64_HAS_GIC_CPUIF_SYSREGS,
+		.desc = "GICv3 CPU interface",
+		.capability = ARM64_HAS_GICV3_CPUIF,
 		.type = ARM64_CPUCAP_STRICT_BOOT_CPU_FEATURE,
 		.matches = has_useable_gicv3_cpuif,
 		ARM64_CPUID_FIELDS(ID_AA64PFR0_EL1, GIC, IMP)
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index 772c1b008e437ed34cedb1c0f663c4dcea8f6759..860ec49cc0530885c138b7dc7f67d58cd69b2593 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -34,7 +34,7 @@ HAS_GENERIC_AUTH
 HAS_GENERIC_AUTH_ARCH_QARMA3
 HAS_GENERIC_AUTH_ARCH_QARMA5
 HAS_GENERIC_AUTH_IMP_DEF
-HAS_GIC_CPUIF_SYSREGS
+HAS_GICV3_CPUIF
 HAS_GIC_PRIO_MASKING
 HAS_GIC_PRIO_RELAXED_SYNC
 HAS_HCR_NV1
diff --git a/drivers/irqchip/irq-gic.c b/drivers/irqchip/irq-gic.c
index 6503573557fdf295bc543b16b64e3e7dd6841321..1269ab8eb726afbb80849fd062612861680cb4d1 100644
--- a/drivers/irqchip/irq-gic.c
+++ b/drivers/irqchip/irq-gic.c
@@ -54,7 +54,7 @@
 
 static void gic_check_cpu_features(void)
 {
-	WARN_TAINT_ONCE(this_cpu_has_cap(ARM64_HAS_GIC_CPUIF_SYSREGS),
+	WARN_TAINT_ONCE(this_cpu_has_cap(ARM64_HAS_GICV3_CPUIF),
 			TAINT_CPU_OUT_OF_SPEC,
 			"GICv3 system registers enabled, broken firmware!\n");
 }

-- 
2.48.0

