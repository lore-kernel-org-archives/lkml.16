Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3CC52D4B78
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 11:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749813147; cv=none; b=A+E7g1e1SBeycCv3a6H16VI7v6akXn9+ybj6eMLM0oitXW2JrRgTSYJXKOVp6VoJeo8ImYV6X1HKHPBUA8HzAp/092sRo3B91+xmBAQFPYowFoO+cFjXaUDDgUxh5juFfEFMOm4eCgWsNIiHeGP80/cr/TVymeRZlaM2gsc9YOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749813147; c=relaxed/simple;
	bh=dRxBMxxhLreYClrZY8rUIKdfpH7BRzMk7Jy/+D1IEdM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H+1S1v2QKjwNAc+zxxbJV/GGLNWQp5DYT287Ap/2EwF2gLwklvtSFmtQ92k7qNVPwKpcYwDPgA0B9aWfnKxVewDEUvN4kS1YGG8LnFNB3/cn++MsWN5rRWDL6i+Zlsa0kgGrHK2GhTZvrU6pC6bTqUoEFwLf0OmSHF73euf+pHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C59661D70;
	Fri, 13 Jun 2025 04:12:04 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EC6F63F59E;
	Fri, 13 Jun 2025 04:12:23 -0700 (PDT)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org,
	catalin.marinas@arm.com,
	sami.mujawar@arm.com,
	aneesh.kumar@kernel.org,
	steven.price@arm.com,
	linux-kernel@vger.kernel.org,
	sudeep.holla@arm.com,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH 3/3] arm64: acpi: Enable ACPI CCEL support
Date: Fri, 13 Jun 2025 12:11:53 +0100
Message-ID: <20250613111153.1548928-4-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613111153.1548928-1-suzuki.poulose@arm.com>
References: <20250613111153.1548928-1-suzuki.poulose@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ACPI CCEL memory area is reported as Non-Volatile storage area. Map it as
PAGE_KERNEL.

Cc: Sami Mujawar <sami.mujawar@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Steven Price <steven.price@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 arch/arm64/kernel/acpi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
index b9a66fc146c9..f52439d411a0 100644
--- a/arch/arm64/kernel/acpi.c
+++ b/arch/arm64/kernel/acpi.c
@@ -356,6 +356,11 @@ void __iomem *acpi_os_ioremap(acpi_physical_address phys, acpi_size size)
 			prot = PAGE_KERNEL_RO;
 			break;
 
+		case EFI_ACPI_MEMORY_NVS:
+			/* Non-volatile storage, required for CCEL */
+			prot = PAGE_KERNEL;
+			break;
+
 		case EFI_ACPI_RECLAIM_MEMORY:
 			/*
 			 * ACPI reclaim memory is used to pass firmware tables
-- 
2.43.0

