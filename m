Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 525902D320C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 11:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749813145; cv=none; b=P7ePpLBsC9NwSMW1cwS9VWvIUTHUMkbPXovyES+ns5oL6Y0ClDWRFTiD9eCPT8KsMlse+MhRVpHqUHGL0nhC4dGj4/ABU1SlMi+rOd3yNlkGwisTXKZeIoA5FTrnjMV7BEP2UwZSmJsn9VWIlrEKX6nCzjzRI+5ECNGVfLq75p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749813145; c=relaxed/simple;
	bh=w0v50HIU2Vj2JQBBTN8UA4VKSZwTuBf0d2cykfkU/iM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W+QdNy75Mf9diRyTbsoaa+59v2A4UuCbGKkedpkdelHmAfPpOj7Kj4iqxahGIo89iWj9Qh5GrNjqCyMPqb6SGivr33OE166rCUlelYTlcnGd2LMNzT4mq7XZA24DCDD+KDJUIxI0bYdjqWE6Gs2RIWhBOC5sRIILi1K4YjuFfxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 59C431D6F;
	Fri, 13 Jun 2025 04:12:03 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 899263F59E;
	Fri, 13 Jun 2025 04:12:22 -0700 (PDT)
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
Subject: [PATCH 2/3] arm64: Enable EFI secret area Securityfs support
Date: Fri, 13 Jun 2025 12:11:52 +0100
Message-ID: <20250613111153.1548928-3-suzuki.poulose@arm.com>
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

Enable EFI COCO secrets support. Provide the ioremap_encrypted() support required
by the driver.

Cc: Sami Mujawar <sami.mujawar@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Steven Price <steven.price@arm.com>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 arch/arm64/include/asm/io.h          | 4 ++++
 drivers/virt/coco/efi_secret/Kconfig | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/io.h b/arch/arm64/include/asm/io.h
index 82276282a3c7..83e03abbb2ca 100644
--- a/arch/arm64/include/asm/io.h
+++ b/arch/arm64/include/asm/io.h
@@ -274,6 +274,10 @@ int arm64_ioremap_prot_hook_register(const ioremap_prot_hook_t hook);
 #define ioremap_np(addr, size)	\
 	ioremap_prot((addr), (size), __pgprot(PROT_DEVICE_nGnRnE))
 
+
+#define ioremap_encrypted(addr, size)	\
+	ioremap_prot((addr), (size), PAGE_KERNEL)
+
 /*
  * io{read,write}{16,32,64}be() macros
  */
diff --git a/drivers/virt/coco/efi_secret/Kconfig b/drivers/virt/coco/efi_secret/Kconfig
index 4404d198f3b2..94d88e5da707 100644
--- a/drivers/virt/coco/efi_secret/Kconfig
+++ b/drivers/virt/coco/efi_secret/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config EFI_SECRET
 	tristate "EFI secret area securityfs support"
-	depends on EFI && X86_64
+	depends on EFI && (X86_64 || ARM64)
 	select EFI_COCO_SECRET
 	select SECURITYFS
 	help
-- 
2.43.0

