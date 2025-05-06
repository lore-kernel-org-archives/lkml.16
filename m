Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DFF283151;
	Tue,  6 May 2025 12:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746534315; cv=none; b=T58pBQ7QFS4iUOl6aiAJexuu9WlDb1Hm2F8V4gXuJDeuDRSYQ3jEzQLU9nBsnGOry3/uE5w+/MHIxYntHjDhbAVDpzzItXrmqz3eK9KeUOyUgc9HtNn8iJwITvpSM1JYhn7dDCtNVWKUJJfEsDhJrQ2GESTQ0D7GOFReEWaZFlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746534315; c=relaxed/simple;
	bh=dDrbPic70xFVMnGI2U6eslEy81yc+v4juJuGar89STY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GLZkslsu+o2SqS0BEvk7L16t5jBfU2jI74YVLsiyuICpwblbTDYEGgxx38LweVXtb6su7kxNxuht/onevTGMqy8230Em9QFXqVK+ZKEfEbVos/PJIq6KpCOMhGNvic6kq66EjqulGSIi2AAlKFgBE3mtG1MQzexJd0TTu03TwcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LbjSjXAV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LbjSjXAV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20921C4CEED;
	Tue,  6 May 2025 12:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746534315;
	bh=dDrbPic70xFVMnGI2U6eslEy81yc+v4juJuGar89STY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LbjSjXAVhVSlEHcrJzX7tgIA89wQSsrb4eBKyzvPN3BFVrT5I+VhjxmR93MK4f8xk
	 vBsXVFaL9vnObqFl9NCj7nCsNX2+T4Hky5kCCk8pW5om9qUQmAuei/8mhic7+yXnAV
	 YrEtF1Lnq5CCc6UinWafNu7i7SVBcAYrqZoVMJX7uZ4r61CMupczbQJrICKbzDItF1
	 YXg9mPeQhKV0CflYou/kMFz4Cq8p8v5QBAb3onCj2dK0mQ/cVwVBV8EPN1Ol0Klh5w
	 1g8cXa0DDA/RHiXHhIbG+18fx2CR+sCESRONWTtAJYWAeP88wbMq7/SMCpS0fSmGKV
	 vRb5G+7I54q+A==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 06 May 2025 14:23:46 +0200
Subject: [PATCH v3 17/25] arm64: cpucaps: Add GICv5 CPU interface (GCIE)
 capability
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-gicv5-host-v3-17-6edd5a92fd09@kernel.org>
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

