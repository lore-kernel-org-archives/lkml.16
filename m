Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F79E2BD588
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 09:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744363084; cv=none; b=tO/fKGfF71ZN05aw3AkilaEX7h6KHBARHoVjbAJTOrYvWsOaXY5B6RANYVd1MRMAOlTrQpEtSZYvXSEXfzwBM3FMoErEJjKDRYwph8CqzVcidWTV2AVQMquqJDg4EZfRi2qFEWjrkU6VmeWpx2RYk1oU5nbyn7kS/deYpo84Y5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744363084; c=relaxed/simple;
	bh=GCfVnXKYhBNyS5RIYInr78Npox3lm4kjTzgx2nXDFCk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WSX3YXCw33z26O0ZnOdD/laedCQIz057L3E1AxYTHFWCP1ze3dBN/EFJMb/Csrg0iiGNpuDBSBctS4ihVpINf6Gu3CttcUx8CPihoGASk8wsyZaZ4iKgPTj4G/pwegqe803mIym65bkYKVZIfB+EcBUBG5Wxd0xVmY23C/oVJzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7BCCF1596;
	Fri, 11 Apr 2025 02:18:02 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E90163F792;
	Fri, 11 Apr 2025 02:17:58 -0700 (PDT)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mark Brown <broonie@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Jann Horn <jannh@google.com>,
	Jeff Xu <jeffxu@chromium.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Kees Cook <kees@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andy Lutomirski <luto@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Pierre Langlois <pierre.langlois@arm.com>,
	Quentin Perret <qperret@google.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Will Deacon <will@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org
Subject: [RFC PATCH v4 16/18] arm64: Enable kpkeys_hardened_pgtables support
Date: Fri, 11 Apr 2025 10:16:29 +0100
Message-ID: <20250411091631.954228-17-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250411091631.954228-1-kevin.brodsky@arm.com>
References: <20250411091631.954228-1-kevin.brodsky@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kpkeys_hardened_pgtables should be enabled as early as possible (if
selected). It does however require kpkeys being available, which
means on arm64 POE being detected and enabled. POE is a boot
feature, so calling kpkeys_hardened_pgtables_enable() just after
setup_boot_cpu_features() in smp_prepare_boot_cpu() is the best we
can do.

With that done, all the bits are in place and we can advertise
support for kpkeys_hardened_pgtables by selecting
ARCH_HAS_KPKEYS_HARDENED_PGTABLES if ARM64_POE is enabled.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/arm64/Kconfig      | 1 +
 arch/arm64/kernel/smp.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 5f81db8134da..3d90b895e2ef 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2199,6 +2199,7 @@ config ARM64_POE
 	select ARCH_USES_HIGH_VMA_FLAGS
 	select ARCH_HAS_PKEYS
 	select ARCH_HAS_KPKEYS
+	select ARCH_HAS_KPKEYS_HARDENED_PGTABLES
 	help
 	  The Permission Overlay Extension is used to implement Memory
 	  Protection Keys. Memory Protection Keys provides a mechanism for
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 3b3f6b56e733..074cab55f9db 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -35,6 +35,7 @@
 #include <linux/kgdb.h>
 #include <linux/kvm_host.h>
 #include <linux/nmi.h>
+#include <linux/kpkeys.h>
 
 #include <asm/alternative.h>
 #include <asm/atomic.h>
@@ -468,6 +469,7 @@ void __init smp_prepare_boot_cpu(void)
 	if (system_uses_irq_prio_masking())
 		init_gic_priority_masking();
 
+	kpkeys_hardened_pgtables_enable();
 	kasan_init_hw_tags();
 	/* Init percpu seeds for random tags after cpus are set up. */
 	kasan_init_sw_tags();
-- 
2.47.0

