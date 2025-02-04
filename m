Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD112165E8;
	Tue,  4 Feb 2025 17:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738690651; cv=none; b=dnsUyelbWAjtU/ejfR+r03BFvoITr6Q8c4lLfr/M97EAW4aRjlJNzJxd4xIN6VObP2K7p5GZYAue2tsdFWh2r7AnjZGjm2pYrKnPpsKZBiJLqRigXkMRf1mjRbPqefuUNIY2PWlfa44VaqafBeoSR+Abz/WbcNfdJU8vIC9VJIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738690651; c=relaxed/simple;
	bh=oiRBgvokfmZMzIN+jtwGJEePgjLFxs7ade5tHmSo4go=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=puBU+/sQ0C6paUOFHKbD9ZKh/IvHqLmtBc06ez87gJKq+5Q28J3IqzYr6mvL5kWYglUrAOX6tEfQiQchgMWTmvwOL0HDKH6z/OgDVIQzK4/LDYKLbj6dJ6SjhlUG7W7JggH+maTeR9rwpj12XHbk/6soFHqMuxepPLJdmqwzwxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AT+emMBs; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AT+emMBs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738690649; x=1770226649;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oiRBgvokfmZMzIN+jtwGJEePgjLFxs7ade5tHmSo4go=;
  b=AT+emMBscQCyn5fPQ0oRIf8s1+/d9RwkDxYMHXX17mDxoicd+LJWOuql
   geskYX11c+AAzWrHvldMohSNmfnEGiQdy+kv/pJnxUrlpFswzzsAzI0Cq
   jy13QgoMsIBxhruW2ZqAMoFWabJM8BDv5EC5BuIGZzwJZ4HBMe6fP2g62
   R+eV2bJlg52AwWy1Ou8c5BEZMWqD6jJkWdrgGEeZjoibPrWWGT3fPxdS0
   R0QO1iDNLI7pnezuNXF7v3EB5fBt3Q7HFszVJd2HgnP+JGLDm6cStpnN8
   S94DXFk0kg2w/nXh7IFPyousj4GdP0EiGRz8RkhxDl8vSLWJIIjrjjjW3
   A==;
X-CSE-ConnectionGUID: TUiqvFdBQDmPQDh4wL0PMg==
X-CSE-MsgGUID: PsWR+aN/S5KFnRReagCVAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38931159"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="38931159"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 09:37:29 -0800
X-CSE-ConnectionGUID: VKIBhH62QgyxuyV1BEgDvg==
X-CSE-MsgGUID: /T7gEKWsTDWNscbEm9C8IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="147867163"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO wieczorr-mobl1.intel.com) ([10.245.244.61])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 09:37:17 -0800
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: luto@kernel.org,
	xin@zytor.com,
	kirill.shutemov@linux.intel.com,
	palmer@dabbelt.com,
	tj@kernel.org,
	andreyknvl@gmail.com,
	brgerst@gmail.com,
	ardb@kernel.org,
	dave.hansen@linux.intel.com,
	jgross@suse.com,
	will@kernel.org,
	akpm@linux-foundation.org,
	arnd@arndb.de,
	corbet@lwn.net,
	maciej.wieczor-retman@intel.com,
	dvyukov@google.com,
	richard.weiyang@gmail.com,
	ytcoode@gmail.com,
	tglx@linutronix.de,
	hpa@zytor.com,
	seanjc@google.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	justinstitt@google.com,
	jason.andryuk@amd.com,
	glider@google.com,
	ubizjak@gmail.com,
	jannh@google.com,
	bhe@redhat.com,
	vincenzo.frascino@arm.com,
	rafael.j.wysocki@intel.com,
	ndesaulniers@google.com,
	mingo@redhat.com,
	catalin.marinas@arm.com,
	junichi.nomura@nec.com,
	nathan@kernel.org,
	ryabinin.a.a@gmail.com,
	dennis@kernel.org,
	bp@alien8.de,
	kevinloughlin@google.com,
	morbo@google.com,
	dan.j.williams@intel.com,
	julian.stecklina@cyberus-technology.de,
	peterz@infradead.org,
	cl@linux.com,
	kees@kernel.org
Cc: kasan-dev@googlegroups.com,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	llvm@lists.linux.dev,
	linux-doc@vger.kernel.org
Subject: [PATCH 14/15] x86: Make software tag-based kasan available
Date: Tue,  4 Feb 2025 18:33:55 +0100
Message-ID: <794a931acfb8e73e28c02932ef08bed9254f164e.1738686764.git.maciej.wieczor-retman@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
References: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make CONFIG_KASAN_SW_TAGS available for x86 machines if they have
ADDRESS_MASKING enabled (LAM) as that works similarly to Top-Byte Ignore
(TBI) that allows the software tag-based mode on arm64 platform.

Set scale macro based on KASAN mode: in software tag-based mode 32 bytes
of memory map to one shadow byte and 16 in generic mode.

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
 arch/x86/Kconfig                | 8 ++++++++
 arch/x86/boot/compressed/misc.h | 2 ++
 arch/x86/include/asm/kasan.h    | 2 +-
 arch/x86/kernel/setup.c         | 2 ++
 4 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index dfec7bc692d4..afbcf27ad278 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -36,6 +36,7 @@ config X86_64
 	select ARCH_HAS_ELFCORE_COMPAT
 	select ZONE_DMA32
 	select EXECMEM if DYNAMIC_FTRACE
+	select ARCH_HAS_KASAN_SW_TAGS_DENSE
 
 config FORCE_DYNAMIC_FTRACE
 	def_bool y
@@ -190,6 +191,7 @@ config X86
 	select HAVE_ARCH_JUMP_LABEL_RELATIVE
 	select HAVE_ARCH_KASAN			if X86_64
 	select HAVE_ARCH_KASAN_VMALLOC		if X86_64
+	select HAVE_ARCH_KASAN_SW_TAGS		if ADDRESS_MASKING
 	select HAVE_ARCH_KFENCE
 	select HAVE_ARCH_KMSAN			if X86_64
 	select HAVE_ARCH_KGDB
@@ -394,6 +396,12 @@ config KASAN_SHADOW_OFFSET
 	hex
 	default 0xdffffc0000000000 if KASAN_GENERIC
 
+config KASAN_SHADOW_SCALE_SHIFT
+	int
+	default 5 if KASAN_SW_TAGS_DENSE
+	default 4 if KASAN_SW_TAGS
+	default 3
+
 config HAVE_INTEL_TXT
 	def_bool y
 	depends on INTEL_IOMMU && ACPI
diff --git a/arch/x86/boot/compressed/misc.h b/arch/x86/boot/compressed/misc.h
index dd8d1a85f671..397a70558ffa 100644
--- a/arch/x86/boot/compressed/misc.h
+++ b/arch/x86/boot/compressed/misc.h
@@ -13,6 +13,8 @@
 #undef CONFIG_PARAVIRT_SPINLOCKS
 #undef CONFIG_KASAN
 #undef CONFIG_KASAN_GENERIC
+#undef CONFIG_KASAN_SW_TAGS
+#undef CONFIG_KASAN_SW_TAGS_DENSE
 
 #define __NO_FORTIFY
 
diff --git a/arch/x86/include/asm/kasan.h b/arch/x86/include/asm/kasan.h
index 79151356d5f2..99ff4ae83bf7 100644
--- a/arch/x86/include/asm/kasan.h
+++ b/arch/x86/include/asm/kasan.h
@@ -6,7 +6,7 @@
 #include <linux/kasan-tags.h>
 #include <linux/types.h>
 
-#define KASAN_SHADOW_SCALE_SHIFT 3
+#define KASAN_SHADOW_SCALE_SHIFT CONFIG_KASAN_SHADOW_SCALE_SHIFT
 
 /*
  * Compiler uses shadow offset assuming that addresses start
diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index f1fea506e20f..c300274e205a 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -1121,6 +1121,8 @@ void __init setup_arch(char **cmdline_p)
 
 	kasan_init();
 
+	kasan_init_sw_tags();
+
 	/*
 	 * Sync back kernel address range.
 	 *
-- 
2.47.1

