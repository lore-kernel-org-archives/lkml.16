Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C8421638A;
	Tue,  4 Feb 2025 17:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738690491; cv=none; b=jNeOFguVb/M0Rxm/+TYyfOJhylkuZHnJW0TKBDW6WkK9v4hIeynW7bsSQ6eSAaV2awIZgKfO+bFOkC9QiXzqcz1kJu0hA1GgMalX6GfBIoNuSlfH25eikdjbVQqExicStAdhcSlTxIgEr9ll2eEkpk1FeaNwTdARVZrLXEWPcRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738690491; c=relaxed/simple;
	bh=LrFP/S58o6ICJkrRaOG0zWteTvtIiSjG9jGn/c23LW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TJTLdR2gYRTC4GWVFLm4zUktZX/pTELUxZu3QIUDU35C95bAaJl9CZzAJxL8ubF1lEHs6V4lZi/2J7cD18mq/AL3SYKTkTQY5JQdgA0JofGoUkJ4vDrHAJDZAuquoXJNq0UHSDR0lfz7aGcUmSdXCwqXJp4dl4VCkBhCFYsfxIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ie/fh6xi; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ie/fh6xi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738690489; x=1770226489;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LrFP/S58o6ICJkrRaOG0zWteTvtIiSjG9jGn/c23LW4=;
  b=Ie/fh6xiqA66AZcYQ4Y6orvCz4F+I7OgQtmMq3hkvXhFg0wI6qGc1M0l
   16382plnKRpFu35/2VUtIw8fLA0L0AO4pOfxriHivoBuXqooHcjtcYlzU
   PrgKOqI0VL9F/WYaqj8pGDZo2vNjQHTazzFSjhwmWx5ST7uCaqYnYvR2S
   isXiBe4usojrGFk2FQ0xAMTsmwRthgr5JSGN4sFcurUYZe0yiTNErIbeR
   qfwabJrGAwTf3HF1clPTzspGTBHGA2gBiDT5F8gx/FIeSDi3hjnnLF5Pi
   vWQB8qNxEMS7npas28kV5fDS5kS1n31hvv7hQA/YNkDgZn+2KBqqC6M0S
   Q==;
X-CSE-ConnectionGUID: evVFWeqPRvyAL/ae7HZXjw==
X-CSE-MsgGUID: kSExue3dQvi6+3DisJMjlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38930326"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="38930326"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 09:34:49 -0800
X-CSE-ConnectionGUID: hsBgrPAEQzS1k8EGLwQyaA==
X-CSE-MsgGUID: MO+fRiNSTeubDAn41XyOaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="147866143"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO wieczorr-mobl1.intel.com) ([10.245.244.61])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 09:34:37 -0800
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
Subject: [PATCH 01/15] kasan: Allocation enhancement for dense tag-based mode
Date: Tue,  4 Feb 2025 18:33:42 +0100
Message-ID: <808cc6516f47d5f5e811d2c237983767952f3743.1738686764.git.maciej.wieczor-retman@intel.com>
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

Tag-based KASAN (on arm64) works by generating a random 8-bit tag and
putting it in both the top byte of the pointer (that points to the
allocated memory) and into all bytes of shadow memory that correspond to
the chunk of allocated regular memory. Each byte of shadow memory covers
a 16 byte chunk of allocated memory - a value called KASAN granularity.
This means that out-of-bounds memory accesses that happen inside the 16
bytes can't be caught.

The dense mode offers reducing the tag width from 8 to 4 bits and
storing two tags in one byte of shadow memory - one in the upper 4 bits
of the byte and one in the lower 4. This way one byte of shadow memory
can cover 32 bytes of allocated memory while still keeping the "16 bytes
per one tag" granularity. The lower 4 bits of each shadow byte map bytes
of memory with offsets 0-15 and the upper 4 bits map offsets 16-31.

Example:
The example below shows how the shadow memory looks like after
allocating 48 bytes of memory in both normal tag-based mode and the
dense mode. The contents of shadow memory are overlaid onto address
offsets that they relate to in the allocated kernel memory. Each cell
|    | symbolizes one byte of shadow memory.

= The regular tag based mode:
- Randomly generated 8-bit tag equals 0xAB.
- 0xFE is the tag that symbolizes unallocated memory.

Shadow memory contents:           |  0xAB  |  0xAB  |  0xAB  |  0xFE  |
Shadow memory address offsets:    0        1        2        3        4
Allocated memory address offsets: 0        16       32       48       64

= The dense tag based mode:
- Randomly generated 4-bit tag equals 0xC.
- 0xE is the tag that symbolizes unallocated memory.

Shadow memory contents:           |0xC 0xC |0xC 0xE |0xE 0xE |0xE 0xE |
Shadow memory address offsets:    0        1        2        3        4
Allocated memory address offsets: 0        32       64       96       128

Add a new config option and defines that can override the standard
system of one tag per one shadow byte.

Add alternative version of the kasan_poison() that deals with tags not
being aligned to byte size in shadow memory.

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
 include/linux/kasan.h | 18 ++++++++++++++++++
 lib/Kconfig.kasan     | 21 +++++++++++++++++++++
 mm/kasan/kasan.h      |  4 +---
 mm/kasan/shadow.c     | 33 ++++++++++++++++++++++++++++++---
 4 files changed, 70 insertions(+), 6 deletions(-)

diff --git a/include/linux/kasan.h b/include/linux/kasan.h
index 03b440658817..ea0f5acd875b 100644
--- a/include/linux/kasan.h
+++ b/include/linux/kasan.h
@@ -35,6 +35,24 @@ typedef unsigned int __bitwise kasan_vmalloc_flags_t;
 
 /* Software KASAN implementations use shadow memory. */
 
+#ifdef CONFIG_KASAN_SW_TAGS_DENSE
+#define KASAN_GRANULE_SHIFT	(KASAN_SHADOW_SCALE_SHIFT - 1)
+#define KASAN_SHADOW_SCALE_SIZE	(1UL << KASAN_SHADOW_SCALE_SHIFT)
+static inline u8 kasan_dense_tag(u8 tag)
+{
+	return (tag << KASAN_TAG_WIDTH | tag);
+}
+#else
+#define KASAN_GRANULE_SHIFT	KASAN_SHADOW_SCALE_SHIFT
+#define KASAN_SHADOW_SCALE_SIZE	(1UL << KASAN_GRANULE_SHIFT)
+static inline u8 kasan_dense_tag(u8 tag)
+{
+	return tag;
+}
+#endif
+
+#define KASAN_GRANULE_SIZE	(1UL << KASAN_GRANULE_SHIFT)
+
 #ifdef CONFIG_KASAN_SW_TAGS
 /* This matches KASAN_TAG_INVALID. */
 #define KASAN_SHADOW_INIT 0xFE
diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
index 98016e137b7f..d08b4e9bf477 100644
--- a/lib/Kconfig.kasan
+++ b/lib/Kconfig.kasan
@@ -19,6 +19,13 @@ config ARCH_DISABLE_KASAN_INLINE
 	  Disables both inline and stack instrumentation. Selected by
 	  architectures that do not support these instrumentation types.
 
+config ARCH_HAS_KASAN_SW_TAGS_DENSE
+	bool
+	help
+	  Enables option to compile tag-based KASAN with densely packed tags -
+	  two 4-bit tags per one byte of shadow memory. Set on architectures
+	  that have 4-bit tag macros.
+
 config CC_HAS_KASAN_GENERIC
 	def_bool $(cc-option, -fsanitize=kernel-address)
 
@@ -223,4 +230,18 @@ config KASAN_EXTRA_INFO
 	  boot parameter, it will add 8 * stack_ring_size bytes of additional
 	  memory consumption.
 
+config KASAN_SW_TAGS_DENSE
+	bool "Two 4-bit tags in one shadow memory byte"
+	depends on KASAN_SW_TAGS
+	depends on ARCH_HAS_KASAN_SW_TAGS_DENSE
+	help
+	  Enables packing two tags into one shadow byte to half the memory usage
+	  compared to normal tag-based mode.
+
+	  After setting this option, tag width macro is set to 4 and size macros
+	  are adjusted based on used KASAN_SHADOW_SCALE_SHIFT.
+
+	  ARCH_HAS_KASAN_SW_TAGS_DENSE is needed for this option since the
+	  special tag macros need to be properly set for 4-bit wide tags.
+
 endif # KASAN
diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
index 72da5ddcceaa..0e04c5e2c405 100644
--- a/mm/kasan/kasan.h
+++ b/mm/kasan/kasan.h
@@ -128,9 +128,7 @@ static inline bool kasan_requires_meta(void)
 
 #endif /* CONFIG_KASAN_GENERIC */
 
-#if defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)
-#define KASAN_GRANULE_SIZE	(1UL << KASAN_SHADOW_SCALE_SHIFT)
-#else
+#ifdef CONFIG_KASAN_HW_TAGS
 #include <asm/mte-kasan.h>
 #define KASAN_GRANULE_SIZE	MTE_GRANULE_SIZE
 #endif
diff --git a/mm/kasan/shadow.c b/mm/kasan/shadow.c
index d6210ca48dda..368503f54b87 100644
--- a/mm/kasan/shadow.c
+++ b/mm/kasan/shadow.c
@@ -123,7 +123,8 @@ EXPORT_SYMBOL(__hwasan_memcpy);
 
 void kasan_poison(const void *addr, size_t size, u8 value, bool init)
 {
-	void *shadow_start, *shadow_end;
+	u8 *shadow_start, *shadow_end, *shadow_start_aligned, *shadow_end_aligned, tag;
+	u64 addr64, addr_start_aligned, addr_end_aligned;
 
 	if (!kasan_arch_is_ready())
 		return;
@@ -134,16 +135,42 @@ void kasan_poison(const void *addr, size_t size, u8 value, bool init)
 	 * addresses to this function.
 	 */
 	addr = kasan_reset_tag(addr);
+	addr64 = (u64)addr;
 
-	if (WARN_ON((unsigned long)addr & KASAN_GRANULE_MASK))
+	if (WARN_ON(addr64 & KASAN_GRANULE_MASK))
 		return;
 	if (WARN_ON(size & KASAN_GRANULE_MASK))
 		return;
 
 	shadow_start = kasan_mem_to_shadow(addr);
 	shadow_end = kasan_mem_to_shadow(addr + size);
+	addr_start_aligned = round_up(addr64, KASAN_SHADOW_SCALE_SIZE);
+	addr_end_aligned = round_down(addr64 + size, KASAN_SHADOW_SCALE_SIZE);
+	shadow_start_aligned = kasan_mem_to_shadow((void *)addr_start_aligned);
+	shadow_end_aligned = kasan_mem_to_shadow((void *)addr_end_aligned);
+
+	/* If size is empty just return. */
+	if (!size)
+		return;
 
-	__memset(shadow_start, value, shadow_end - shadow_start);
+	/* Memset the first unaligned tag in shadow memory. */
+	if (addr64 % KASAN_SHADOW_SCALE_SIZE) {
+		tag = *shadow_start & KASAN_TAG_MASK;
+		tag |= value << KASAN_TAG_WIDTH;
+		*shadow_start = tag;
+	}
+
+	/* Memset the middle aligned part in shadow memory. */
+	tag = kasan_dense_tag(value);
+	__memset(shadow_start_aligned, tag, shadow_end_aligned - shadow_start_aligned);
+
+	/* Memset the last unaligned tag in shadow memory. */
+	if ((addr64 + size) % KASAN_SHADOW_SCALE_SIZE) {
+		tag = KASAN_TAG_MASK << KASAN_TAG_WIDTH;
+		tag &= *shadow_end;
+		tag |= value;
+		*shadow_end = tag;
+	}
 }
 EXPORT_SYMBOL_GPL(kasan_poison);
 
-- 
2.47.1

