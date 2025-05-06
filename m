Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE9C283139;
	Tue,  6 May 2025 12:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746534312; cv=none; b=eF+J8mn1LZbGAcDVQ3ybiTQh12cE2aKk/oeFh58u/UlEA4+3P8yxlnBppRE4pleRvXY0GO2keHxOOwqKvgHR4VUtCBLkbSZ5v3cjnvKWtmqybHfI654StD+Y3ebWAP+ljcE3cXEFq8GggYivUxsd2Y5TjKo9D8Wk38fK07WnN10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746534312; c=relaxed/simple;
	bh=J4d+23jK1xcMwImyyVNILtAarSzyfyzelW1CaxCFjwc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m5ZtpVW3FAUdHduXrx1soFQ8qKJHipQXNm1aRKSGWEqCRWMH1GwuEX+VTGD2n8wiH98txWS5kmFFL76/N2DMLXX6zoVEKzRn13a4wufazhzbz/EpNqeQS0FBObFeT0SzXcTZqEX/0nicyBKy+T5kQjmDvu7jS3h6cF4j4g45ImQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oMgVqzfh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oMgVqzfh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE7D8C4CEE4;
	Tue,  6 May 2025 12:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746534310;
	bh=J4d+23jK1xcMwImyyVNILtAarSzyfyzelW1CaxCFjwc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oMgVqzfhMhks+7LgtwSz3BViAVXuV2TpcsegwgPYw8M8RiCiir6can3wbiOx9eowt
	 2FVIq5hS7eQM2Sh9S8UQ7Dupznk/PTJ+3MXjtwqRH9RbIsXeMsRG+n1Hx7rifEZgI3
	 4vZI3NRD3OrZG9XaHD9JUtuScYsaYvm6RtfrWf/KOZHmS8wUF1eSglhWxhytBYOEIR
	 ekljig2gLlyrgBMMBRePou2aCT8yc89Ap3bW0SxYscaAA4+u38YWshQoMTd/KAR4bC
	 rZnRbOVe05Nmb0eccUXEHG0jOBlM5z7q2jW6zaIgkbfJDNtK91v4McJ5gP/Zj+MYt7
	 kfSOptTJRvjLg==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 06 May 2025 14:23:45 +0200
Subject: [PATCH v3 16/25] arm64: cpucaps: Rename GICv3 CPU interface
 capability
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-gicv5-host-v3-16-6edd5a92fd09@kernel.org>
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

