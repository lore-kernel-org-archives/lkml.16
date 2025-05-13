Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0536C2C0314;
	Tue, 13 May 2025 17:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747158588; cv=none; b=sll0qDDF+xZzXmjEH43hebQROoeTpdGWySTg+Jdm5Ry8+86rBYcI2l+Ai7yk/YCMDZT/vnX7cvBzRxrI2gk0KjCYLynCmTgejV07tqPMziIllCKoOr2J54kbGyJOXagww5KLHZB2tnPSOdv9j3xyJdHlWTKUy4xGY2G8EGUo58U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747158588; c=relaxed/simple;
	bh=dDrbPic70xFVMnGI2U6eslEy81yc+v4juJuGar89STY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rVVRPTqFAqVo/MwU/s8iQdB1YQqIVjpibkWvkkIZAAZFUfuOz+bdkrIj+r9IwkvQ5I6WVA2ejUKdbHvj7DuBzlEQ55yFIbVEDGuA2IOChj3UG3LclLCiu8KFoCeCp6cO5vPsqci1rQ2bJIIlfa2gLm15+REV5yLsviDgyxsnhx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AVxh4pqu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AVxh4pqu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F010EC4CEE4;
	Tue, 13 May 2025 17:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747158587;
	bh=dDrbPic70xFVMnGI2U6eslEy81yc+v4juJuGar89STY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AVxh4pquFWvird7felNFpM3U6HoTz4fTl3shNVuZb1HJt8FBkjeqrYyvDUQ/miEvz
	 iziTtbxgKOiPEknaX2glKXYOCCNyEHmS3zBmAcPiulo66AQIltOvmy4adKMbfpH9XM
	 IJQcJhrKbxdHfYxQ9p+p0C9y6mm20ZOF4iajHrzno3H78QAuB42Qet39q7kTACeAM3
	 /4aY4GfUdCIL91TcyTqFnCoRJNA8lyNF7HFwd2BAURDHRbOY0AxHysgYSv1qz1hDvH
	 wszvYr38t/zmZsH+91xrht78au1iNMwCJjQCUHzfihIpmEWRUVoQdIXxFxj0t9vi9l
	 0+NGx1/kgGwxw==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 13 May 2025 19:48:10 +0200
Subject: [PATCH v4 17/26] arm64: cpucaps: Add GICv5 CPU interface (GCIE)
 capability
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250513-gicv5-host-v4-17-b36e9b15a6c3@kernel.org>
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

Implement the GCIE capability as a strict boot cpu capability to
detect whether architectural GICv5 support is available in HW.

Plug it in with a naming consistent with the existing GICv3
CPU interface capability.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kernel/cpufeature.c | 7 +++++++
 arch/arm64/tools/cpucaps       | 1 +
 2 files changed, 8 insertions(+)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index cbb49de451f45fbee3100ea01e77b06352bd55ac..4d5163a20ee0fb09380ea5f1f2d37afb7257edfb 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -3041,6 +3041,13 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.matches = has_pmuv3,
 	},
 #endif
+	{
+		.desc = "GICv5 CPU interface",
+		.type = ARM64_CPUCAP_STRICT_BOOT_CPU_FEATURE,
+		.capability = ARM64_HAS_GICV5_CPUIF,
+		.matches = has_cpuid_feature,
+		ARM64_CPUID_FIELDS(ID_AA64PFR2_EL1, GCIE, IMP)
+	},
 	{},
 };
 
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index 860ec49cc0530885c138b7dc7f67d58cd69b2593..c36f4165e2bb460abde81baf453199f62dd265b0 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -35,6 +35,7 @@ HAS_GENERIC_AUTH_ARCH_QARMA3
 HAS_GENERIC_AUTH_ARCH_QARMA5
 HAS_GENERIC_AUTH_IMP_DEF
 HAS_GICV3_CPUIF
+HAS_GICV5_CPUIF
 HAS_GIC_PRIO_MASKING
 HAS_GIC_PRIO_RELAXED_SYNC
 HAS_HCR_NV1

-- 
2.48.0

