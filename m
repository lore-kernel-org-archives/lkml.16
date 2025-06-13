Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B61A2D879C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 11:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749813150; cv=none; b=XYU8F9b1865TTB40nygSsH93qLn01g0Qw4FBbImseTzLMgZnJsc/Wclr6/v32+Xbcj00kZoz4wSIm8CcyRV8+ve5uuodHAW313q7Ferz/0q2p2zBU1JhDA8+QUDWePHANnmbVMqAD4u4ccC28ZGO1Zbsfd5okiu59+yCPcZCw68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749813150; c=relaxed/simple;
	bh=0REG/zbLfQM6oL3as2H+NdQ8dWf2KHS+uwkIi/jVwfM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KJCFZJxBrDc+3oWL9wmbjHd9YKxQfTXor/JHE8Jw2XV1S8l2lUCUqCuiE7EosQo6xMpKcwWOIDxFIP8xLk9QsJEKTqJn8rdygKaZM7ZWfqVLhnZpA+uxy8qTqEEy63zxtjKWIOiYyKtFSd6vZN5SgnL8Gkb+yVx6v99GhyAqOzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ECA9E1D14;
	Fri, 13 Jun 2025 04:12:01 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 284E63F59E;
	Fri, 13 Jun 2025 04:12:21 -0700 (PDT)
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
Subject: [PATCH 1/3] arm64: realm: ioremap: Allow mapping memory as encrypted
Date: Fri, 13 Jun 2025 12:11:51 +0100
Message-ID: <20250613111153.1548928-2-suzuki.poulose@arm.com>
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

For ioremap(), so far we only checked if it was a device (RIPAS_DEV) to choose
an encrypted vs decrypted mapping. However, we may have firmware reserved memory
regions exposed to the OS (e.g., EFI Coco Secret Securityfs, ACPI CCEL).
We need to make sure that anything that is RIPAS_RAM (i.e., Guest
protected memory with RMM guarantees) are also mapped as encrypted.

Rephrasing the above, anything that is not RIPAS_EMPTY is guaranteed to be
protected by the RMM. Thus we choose encrypted mapping for anything that is not
RIPAS_EMPTY. While at it, rename the helper function

  __arm64_is_protected_mmio => arm64_rsi_is_protected

to clearly indicate that this not an arm64 generic helper, but something to do
with Realms.

Cc: Sami Mujawar <sami.mujawar@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Steven Price <steven.price@arm.com>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 arch/arm64/include/asm/io.h  |  2 +-
 arch/arm64/include/asm/rsi.h |  2 +-
 arch/arm64/kernel/rsi.c      | 26 ++++++++++++++++++++++----
 3 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/io.h b/arch/arm64/include/asm/io.h
index 9b96840fb979..82276282a3c7 100644
--- a/arch/arm64/include/asm/io.h
+++ b/arch/arm64/include/asm/io.h
@@ -311,7 +311,7 @@ extern bool arch_memremap_can_ram_remap(resource_size_t offset, size_t size,
 static inline bool arm64_is_protected_mmio(phys_addr_t phys_addr, size_t size)
 {
 	if (unlikely(is_realm_world()))
-		return __arm64_is_protected_mmio(phys_addr, size);
+		return arm64_rsi_is_protected(phys_addr, size);
 	return false;
 }
 
diff --git a/arch/arm64/include/asm/rsi.h b/arch/arm64/include/asm/rsi.h
index b42aeac05340..88b50d660e85 100644
--- a/arch/arm64/include/asm/rsi.h
+++ b/arch/arm64/include/asm/rsi.h
@@ -16,7 +16,7 @@ DECLARE_STATIC_KEY_FALSE(rsi_present);
 
 void __init arm64_rsi_init(void);
 
-bool __arm64_is_protected_mmio(phys_addr_t base, size_t size);
+bool arm64_rsi_is_protected(phys_addr_t base, size_t size);
 
 static inline bool is_realm_world(void)
 {
diff --git a/arch/arm64/kernel/rsi.c b/arch/arm64/kernel/rsi.c
index ce4778141ec7..c64a06f58c0b 100644
--- a/arch/arm64/kernel/rsi.c
+++ b/arch/arm64/kernel/rsi.c
@@ -84,7 +84,25 @@ static void __init arm64_rsi_setup_memory(void)
 	}
 }
 
-bool __arm64_is_protected_mmio(phys_addr_t base, size_t size)
+/*
+ * Check if a given PA range is Trusted (e.g., Protected memory, a Trusted Device
+ * mapping, or an MMIO emulated in the Realm world).
+ *
+ * We can rely on the RIPAS value of the region to detect if a given region is
+ * protected.
+ *
+ *  RIPAS_DEV - A trusted device memory or a trusted emulated MMIO (in the Realm
+ *		world
+ *  RIPAS_RAM - Memory (RAM), protected by the RMM guarantees. (e.g., Firmware
+ *		reserved regions for data sharing).
+ *
+ *  RIPAS_DESTROYED is a special case of one of the above, where the host did
+ *  something without our permission and as such we can't do anything about it.
+ *
+ * The only case where something is emulated by the untrusted hypervisor or is
+ * backed by shared memory is indicated by RSI_RIPAS_EMPTY.
+ */
+bool arm64_rsi_is_protected(phys_addr_t base, size_t size)
 {
 	enum ripas ripas;
 	phys_addr_t end, top;
@@ -101,18 +119,18 @@ bool __arm64_is_protected_mmio(phys_addr_t base, size_t size)
 			break;
 		if (WARN_ON(top <= base))
 			break;
-		if (ripas != RSI_RIPAS_DEV)
+		if (ripas == RSI_RIPAS_EMPTY)
 			break;
 		base = top;
 	}
 
 	return base >= end;
 }
-EXPORT_SYMBOL(__arm64_is_protected_mmio);
+EXPORT_SYMBOL(arm64_rsi_is_protected);
 
 static int realm_ioremap_hook(phys_addr_t phys, size_t size, pgprot_t *prot)
 {
-	if (__arm64_is_protected_mmio(phys, size))
+	if (arm64_rsi_is_protected(phys, size))
 		*prot = pgprot_encrypted(*prot);
 	else
 		*prot = pgprot_decrypted(*prot);
-- 
2.43.0

