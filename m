Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1166122A4EC
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 23:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744241248; cv=none; b=asBM8p2WYVCiHBb/myfIdk+9JJYEnlwpG/njkHofqYoBROY+a5UqG7XT7nDnvTkxWIefTm5linSr9hKHhEqKtHKyW+KraTMzoBuPb1O63xUTicF1aTvssEE7kzVwez3XhsulLe6TQzlCczspwaWSbr2OnTBgLoIuUS58ymRAVDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744241248; c=relaxed/simple;
	bh=m2xpE6lwZqbxK0Pb/freCwyjE15OwL5imxKOrOzs1DQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MgdL8LGcG9nTLhEtmi8/aNGnQ3NEr8dTQElStmbLFrPs2iztvCp8cElxK1y9sGfOxRsgYdWHYY1MY/CFFzPCKlFoWWjb4cIatg5BHJ9wE3lKp0O2tN2z8bjAyufSvqGV81ah4ZfjEFFRZlPWO1wRK4+kHIR8JBFzi+VdMQxNXM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EGKjv+qA; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EGKjv+qA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744241247; x=1775777247;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=m2xpE6lwZqbxK0Pb/freCwyjE15OwL5imxKOrOzs1DQ=;
  b=EGKjv+qAAuHkxJMiFllMXI0rja5iEV+TCkN693p+2ySlbnSYh2djTYcF
   W6r71ja1DoFySOZx6gMj9tRgb6IFIXbDy7lf6IROnWpCbjxz72Ju+Xwcd
   foLyRR5TRslvgTDrS2UZJwoMLJH/5alTAlbUXN9Ewyig5kCP6WK2bVVa1
   rgcyM46qyejgDB9KjWjlV6fFUqbRSEhoBkaSfUrEo0dDl1X7YVgKPvlFU
   7myASZCDEq0uMqSkPNiNu4UOdbYJmbm39f+iBPGENkm4k/t8wxJFmHP60
   GjM3+2jpq2KjnQG9la2lF8vMpEMSAsOsremNV7f1pDH0cItxXoRUzhBJ6
   Q==;
X-CSE-ConnectionGUID: mB6azmKySPKnKNUq4vm5zw==
X-CSE-MsgGUID: 1awPm0UPRlubk2z5zfAXFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="68224075"
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; 
   d="scan'208";a="68224075"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 16:27:26 -0700
X-CSE-ConnectionGUID: fIl7S+baSqKtzG5lxJMYJw==
X-CSE-MsgGUID: wxorzy3gS/ax6N9sNPDnSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; 
   d="scan'208";a="133593104"
Received: from cbae1-mobl.amr.corp.intel.com (HELO cbae1-mobl.intel.com) ([10.124.161.191])
  by orviesa003.jf.intel.com with ESMTP; 09 Apr 2025 16:27:26 -0700
From: "Chang S. Bae" <chang.seok.bae@intel.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	colinmitchell@google.com,
	chao.gao@intel.com,
	chang.seok.bae@intel.com
Subject: [PATCH v3 6/6] x86/microcode/intel: Enable staging when available
Date: Wed,  9 Apr 2025 16:27:13 -0700
Message-ID: <20250409232713.4536-7-chang.seok.bae@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250409232713.4536-1-chang.seok.bae@intel.com>
References: <20250320234104.8288-1-chang.seok.bae@intel.com>
 <20250409232713.4536-1-chang.seok.bae@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the staging code being ready, check for staging availability by
reading these following MSRs:

  * IA32_ARCH_CAPABILITIES (bit 16) for the presence of
    IA32_MCU_ENUMERATION

  * IA32_MCU_ENUMERATION (bit 4) for the staging feature availability.

When available, enable it by setting the feature bit.

Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
---
V2 -> V3: No change
V1 -> V2: Fold MSR definings (Boris).
---
 arch/x86/include/asm/msr-index.h      |  7 +++++++
 arch/x86/kernel/cpu/microcode/intel.c | 17 +++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
index f5b05e4f1e27..4eb1001fc5ac 100644
--- a/arch/x86/include/asm/msr-index.h
+++ b/arch/x86/include/asm/msr-index.h
@@ -166,6 +166,10 @@
 						 * Processor MMIO stale data
 						 * vulnerabilities.
 						 */
+#define ARCH_CAP_MCU_ENUM		BIT(16) /*
+						 * Indicates the presence of microcode update
+						 * feature enumeration and status information
+						 */
 #define ARCH_CAP_FB_CLEAR		BIT(17)	/*
 						 * VERW clears CPU fill buffer
 						 * even on MDS_NO CPUs.
@@ -897,6 +901,9 @@
 #define MSR_IA32_UCODE_WRITE		0x00000079
 #define MSR_IA32_UCODE_REV		0x0000008b
 
+#define MSR_IA32_MCU_ENUMERATION	0x0000007b
+#define MCU_STAGING			BIT(4)
+
 #define MSR_IA32_MCU_STAGING_MBOX_ADDR	0x000007a5
 
 /* Intel SGX Launch Enclave Public Key Hash MSRs */
diff --git a/arch/x86/kernel/cpu/microcode/intel.c b/arch/x86/kernel/cpu/microcode/intel.c
index 542b3abad8e3..89c17cdd4336 100644
--- a/arch/x86/kernel/cpu/microcode/intel.c
+++ b/arch/x86/kernel/cpu/microcode/intel.c
@@ -959,6 +959,18 @@ static __init void calc_llc_size_per_core(struct cpuinfo_x86 *c)
 	llc_size_per_core = (unsigned int)llc_size;
 }
 
+static __init bool staging_available(void)
+{
+	u64 val;
+
+	val = x86_read_arch_cap_msr();
+	if (!(val & ARCH_CAP_MCU_ENUM))
+		return false;
+
+	rdmsrl(MSR_IA32_MCU_ENUMERATION, val);
+	return !!(val & MCU_STAGING);
+}
+
 struct microcode_ops * __init init_intel_microcode(void)
 {
 	struct cpuinfo_x86 *c = &boot_cpu_data;
@@ -969,6 +981,11 @@ struct microcode_ops * __init init_intel_microcode(void)
 		return NULL;
 	}
 
+	if (staging_available()) {
+		microcode_intel_ops.use_staging = true;
+		pr_info("Enabled staging feature.\n");
+	}
+
 	calc_llc_size_per_core(c);
 
 	return &microcode_intel_ops;
-- 
2.45.2

