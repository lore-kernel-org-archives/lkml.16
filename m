Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB26F26A1D8;
	Tue,  8 Apr 2025 10:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744109507; cv=none; b=XCdmP17gaY1XJOR3uWl+Up9krEsaf7XIkA+Y/ZBRupOOTvWbe249jFb4iZAChlw4yI+VoC8vnIJW8QgsQ1DoSVzdBvGCaZaf/hWUWY8RZD6kx1cWKe2cRg2YKgWK2d1Fm7dXS4Wuw9viwXMGBO7PLe9/Ve5XSgwkeOXwib8QmF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744109507; c=relaxed/simple;
	bh=1VFamCW1T2hwFfR2ldmMdvGBnFem7jd3W15avtomy2U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kPHclCOyxsuOiNOt5in9EQUGoehl5eQHawQrXuZMojAY/D92xX6z9WAr19D1vqSsShQjWhVZ/5y8t9I+jyNge6NePHhndSmmgFdYB2+BdbXXcOsdf2f3zlUPPmlMpZS5kKUI+eCpCK+Ja+EQfMDSdwMsF5veyW4mKFQskZ7YHpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lgJttQ21; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lgJttQ21"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6190C4CEEB;
	Tue,  8 Apr 2025 10:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744109507;
	bh=1VFamCW1T2hwFfR2ldmMdvGBnFem7jd3W15avtomy2U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lgJttQ21RqeRYvVhAbo24CKebPI5FCVfbMYp9EbD9S+MI+0FUXTp0a0oeKcj+HME8
	 Kzbfjmn3j+Uy6zK50WSb/JzseS9GhkPGN1Qbgbn+0ZmamCI766tI4gvDtiPc9TaMBy
	 d6SfBaFlBCNSTNeZD0HsvJvRvbTSbbx9iyFBBU61jjqEhnNKIxFhHIj3+B0OoD7UvB
	 LMdJcwHvdBPceX2HYypOaoI3b9GhrmJaWgtWllLFQSic8J7Pdb+LUOck1CrBlXFv05
	 y3mj2N0kMk7cBaev6wi//xxB4pP8Znu/CtQB3RF37EM2m+eP5S9SIYVZZI71oWNVsc
	 F0rhD8OoMj4gQ==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 08 Apr 2025 12:50:15 +0200
Subject: [PATCH 16/24] arm64: cpucaps: Add GCIE capability
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gicv5-host-v1-16-1f26db465f8d@kernel.org>
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

Implement the GCIE capability as a strict boot cpu capability to
detect whether architectural GICv5 support is available in HW.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kernel/cpufeature.c | 7 +++++++
 arch/arm64/tools/cpucaps       | 1 +
 2 files changed, 8 insertions(+)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 9c4d6d552b25cb3a31d1fb267bd73d3f82513e69..8c60591633f3d435ad9b80a10e484f26af328964 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -3041,6 +3041,13 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.matches = has_pmuv3,
 	},
 #endif
+	{
+		.desc = "GCIE",
+		.type = ARM64_CPUCAP_STRICT_BOOT_CPU_FEATURE,
+		.capability = ARM64_HAS_GCIE,
+		.matches = has_cpuid_feature,
+		ARM64_CPUID_FIELDS(ID_AA64PFR2_EL1, GCIE, IMP)
+	},
 	{},
 };
 
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index 772c1b008e437ed34cedb1c0f663c4dcea8f6759..e87e4bc2501f6b86352c03bd35adf33c160a577c 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -29,6 +29,7 @@ HAS_EVT
 HAS_FPMR
 HAS_FGT
 HAS_FPSIMD
+HAS_GCIE
 HAS_GCS
 HAS_GENERIC_AUTH
 HAS_GENERIC_AUTH_ARCH_QARMA3

-- 
2.48.0

