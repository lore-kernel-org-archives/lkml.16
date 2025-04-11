Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259A8280A46
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744349922; cv=none; b=IUa4+PmWnuQJoqg6I+5G0AxBuJS9PADI+sg4DiW5L6gQk4QXSkqQYwxjtdMrJ1WMWSveeHtypae5n+F0wYv/mhA3YVB2p3oeJkKOihsPHc4f4bvI0X2r6hS5kEk2uCOj6xekbHSCgLtLVMxGCBGK1KULXfhg0vQyOAI9d5W2AxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744349922; c=relaxed/simple;
	bh=5KFhWgz6yhJro1JD1riOZuS3u/1QDcignJaWcDZ2hxE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IheaMF7t7kO/2IMflVQba3+qXU02Ua1Vu9ZsyzuHMcznZWx/6ws7GYOru8uGVmiv77PtvFN9sUQJ/p6u3JD6nLLI6NJ8MO5c9zwlCmrl81xelWR7yD6fJx9BPK6mVji92uGMIx4RemHW6OojeXmV/uq4Lm/1kpY/4iDLOtuHCpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Nmi4TEPT; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Nmi4TEPT"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2264e5b2b7cso14731635ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 22:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744349920; x=1744954720; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZI11LMBEjiEIqA0HumHiypztcAsK57x8QNsaft7FaF0=;
        b=Nmi4TEPTwFwJQlXxF4Xplc/gokYq4kAd7aycJfG8a+nisTfvZQsvQoa0GonL97uaM3
         ik/WvVi094vwpZP6+Or0FVvY4izOchRvdVntb3G1A2XnL/rPtSvtBMfzrBTbYIY634kZ
         n3Zh+a5UALW18NL1nMptReMLLi0mRS4KTA2zFBWCLMaxtoeSuSqn6rC7mZblGODXLtRD
         DrFI0qAJfC7fkKCIz5zjOYYnXhBSJWwkvFDD0aUlSpeQuDRi6irMkmp0Rb+QVkRXTNEk
         usMFJgud3OV8XFsl/c+yz+6svt8DAGuSnQvwGhK4LzDaSMoQUQuChfjMPgBFGnqbnAVm
         FyKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744349920; x=1744954720;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZI11LMBEjiEIqA0HumHiypztcAsK57x8QNsaft7FaF0=;
        b=lI+xW9sauXrP+BI/MfNvNupahi64Rt3MTGG9+Vo5y8JIytvmIdClwJ39QAiIALJST3
         ZDbMP9jD8nM2Fa/KPzkXTdJw9S+bmvfNoD1TrJHNc/LzvC8NywORPd8E6W5zlLd+4S4i
         4Jqns7XMk5lpT6fhaljAieIOtfFqRxe/ZtzTfWMckeoiXJ/ZRsSGfOLZ7BASrjSf8AnC
         /ymdw8Gd42MnfbdhuSNYskdKYfqZUXp87o/YgOIO4Zk0FMB6wLEccMdiVzF8ibID+LZY
         dkySxuwNL8hC7vpHjwPvTJd+yKwk+hjczR25ACyjAnat4yiEHFQj435kOr8odoD1LNAb
         EHPA==
X-Gm-Message-State: AOJu0YwjE92rNlnFGpDjkK1UxeUFWzxXB4siHivjMfnVZ8QcmXcEBOkc
	BYPtPBCP01tLw1N8ea5EI0PZYSUdaBUYYLXFHxPSXxuu32eUcWPAY5nrnTpPamKQovr6YFD60V6
	h6+zDB8MebDl9peksE1WItzdkSlnM/8CNXDrgIKB0NzTccTHYeOnCHQ1U0To1jleEAFMqLNeCRP
	UiaIGFl0ryTKPQ0H5fZzFZoUna+LqZlGj9MIA51z9mkq7RXmCsafM9FGoN3Y7KDQ==
X-Google-Smtp-Source: AGHT+IGL9bShyIuFbehpqVS3P2jU3hH2DH9GD61wHNRFxBW3gbczYn8weYxBH/KHuEP/3fwm9Znlao4IefNW9iwc
X-Received: from plbbf5.prod.google.com ([2002:a17:902:b905:b0:223:52c5:17f6])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:2a86:b0:224:e33:8896 with SMTP id d9443c01a7336-22bea4934a1mr25148505ad.11.1744349920329;
 Thu, 10 Apr 2025 22:38:40 -0700 (PDT)
Date: Thu, 10 Apr 2025 22:37:42 -0700
In-Reply-To: <20250411053745.1817356-1-changyuanl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250411053745.1817356-1-changyuanl@google.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250411053745.1817356-12-changyuanl@google.com>
Subject: [PATCH v6 11/14] x86: add KHO support
From: Changyuan Lyu <changyuanl@google.com>
To: linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org, anthony.yznaga@oracle.com, arnd@arndb.de, 
	ashish.kalra@amd.com, benh@kernel.crashing.org, bp@alien8.de, 
	catalin.marinas@arm.com, corbet@lwn.net, dave.hansen@linux.intel.com, 
	devicetree@vger.kernel.org, dwmw2@infradead.org, ebiederm@xmission.com, 
	graf@amazon.com, hpa@zytor.com, jgowans@amazon.com, kexec@lists.infradead.org, 
	krzk@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, luto@kernel.org, 
	mark.rutland@arm.com, mingo@redhat.com, pasha.tatashin@soleen.com, 
	pbonzini@redhat.com, peterz@infradead.org, ptyadav@amazon.de, robh@kernel.org, 
	rostedt@goodmis.org, rppt@kernel.org, saravanak@google.com, 
	skinsburskii@linux.microsoft.com, tglx@linutronix.de, thomas.lendacky@amd.com, 
	will@kernel.org, x86@kernel.org, Changyuan Lyu <changyuanl@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Alexander Graf <graf@amazon.com>

We now have all bits in place to support KHO kexecs. This patch adds
awareness of KHO in the kexec file as well as boot path for x86 and
adds the respective kconfig option to the architecture so that it can
use KHO successfully.

In addition, it enlightens it decompression code with KHO so that its
KASLR location finder only considers memory regions that are not already
occupied by KHO memory.

Signed-off-by: Alexander Graf <graf@amazon.com>
Co-developed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Co-developed-by: Changyuan Lyu <changyuanl@google.com>
Signed-off-by: Changyuan Lyu <changyuanl@google.com>
---
 arch/x86/Kconfig                       |  3 ++
 arch/x86/boot/compressed/kaslr.c       | 52 +++++++++++++++++++++++++-
 arch/x86/include/asm/setup.h           |  4 ++
 arch/x86/include/uapi/asm/setup_data.h | 13 ++++++-
 arch/x86/kernel/e820.c                 | 18 +++++++++
 arch/x86/kernel/kexec-bzimage64.c      | 36 ++++++++++++++++++
 arch/x86/kernel/setup.c                | 25 +++++++++++++
 arch/x86/realmode/init.c               |  2 +
 8 files changed, 151 insertions(+), 2 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 4b9f378e05f6b..ae82a42ff70e7 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2029,6 +2029,9 @@ config ARCH_SUPPORTS_KEXEC_BZIMAGE_VERIFY_SIG
 config ARCH_SUPPORTS_KEXEC_JUMP
 	def_bool y
 
+config ARCH_SUPPORTS_KEXEC_HANDOVER
+	def_bool y
+
 config ARCH_SUPPORTS_CRASH_DUMP
 	def_bool X86_64 || (X86_32 && HIGHMEM)
 
diff --git a/arch/x86/boot/compressed/kaslr.c b/arch/x86/boot/compressed/kaslr.c
index f03d59ea6e40f..ff11688810162 100644
--- a/arch/x86/boot/compressed/kaslr.c
+++ b/arch/x86/boot/compressed/kaslr.c
@@ -760,6 +760,55 @@ static void process_e820_entries(unsigned long minimum,
 	}
 }
 
+/*
+ * If KHO is active, only process its scratch areas to ensure we are not
+ * stepping onto preserved memory.
+ */
+#ifdef CONFIG_KEXEC_HANDOVER
+static bool process_kho_entries(unsigned long minimum, unsigned long image_size)
+{
+	struct kho_scratch *kho_scratch;
+	struct setup_data *ptr;
+	int i, nr_areas = 0;
+
+	ptr = (struct setup_data *)(unsigned long)boot_params_ptr->hdr.setup_data;
+	while (ptr) {
+		if (ptr->type == SETUP_KEXEC_KHO) {
+			struct kho_data *kho = (struct kho_data *)ptr->data;
+
+			kho_scratch = (void *)kho->scratch_addr;
+			nr_areas = kho->scratch_size / sizeof(*kho_scratch);
+
+			break;
+		}
+
+		ptr = (struct setup_data *)(unsigned long)ptr->next;
+	}
+
+	if (!nr_areas)
+		return false;
+
+	for (i = 0; i < nr_areas; i++) {
+		struct kho_scratch *area = &kho_scratch[i];
+		struct mem_vector region = {
+			.start = area->addr,
+			.size = area->size,
+		};
+
+		if (process_mem_region(&region, minimum, image_size))
+			break;
+	}
+
+	return true;
+}
+#else
+static inline bool process_kho_entries(unsigned long minimum,
+				       unsigned long image_size)
+{
+	return false;
+}
+#endif
+
 static unsigned long find_random_phys_addr(unsigned long minimum,
 					   unsigned long image_size)
 {
@@ -775,7 +824,8 @@ static unsigned long find_random_phys_addr(unsigned long minimum,
 		return 0;
 	}
 
-	if (!process_efi_entries(minimum, image_size))
+	if (!process_kho_entries(minimum, image_size) &&
+	    !process_efi_entries(minimum, image_size))
 		process_e820_entries(minimum, image_size);
 
 	phys_addr = slots_fetch_random();
diff --git a/arch/x86/include/asm/setup.h b/arch/x86/include/asm/setup.h
index ad9212df0ec0c..906ab5e6d25fe 100644
--- a/arch/x86/include/asm/setup.h
+++ b/arch/x86/include/asm/setup.h
@@ -67,6 +67,10 @@ extern void x86_ce4100_early_setup(void);
 static inline void x86_ce4100_early_setup(void) { }
 #endif
 
+#ifdef CONFIG_KEXEC_HANDOVER
+#include <linux/kexec_handover.h>
+#endif
+
 #ifndef _SETUP
 
 #include <asm/espfix.h>
diff --git a/arch/x86/include/uapi/asm/setup_data.h b/arch/x86/include/uapi/asm/setup_data.h
index 50c45ead4e7c9..2671c4e1b3a0b 100644
--- a/arch/x86/include/uapi/asm/setup_data.h
+++ b/arch/x86/include/uapi/asm/setup_data.h
@@ -13,7 +13,8 @@
 #define SETUP_CC_BLOB			7
 #define SETUP_IMA			8
 #define SETUP_RNG_SEED			9
-#define SETUP_ENUM_MAX			SETUP_RNG_SEED
+#define SETUP_KEXEC_KHO			10
+#define SETUP_ENUM_MAX			SETUP_KEXEC_KHO
 
 #define SETUP_INDIRECT			(1<<31)
 #define SETUP_TYPE_MAX			(SETUP_ENUM_MAX | SETUP_INDIRECT)
@@ -78,6 +79,16 @@ struct ima_setup_data {
 	__u64 size;
 } __attribute__((packed));
 
+/*
+ * Locations of kexec handover metadata
+ */
+struct kho_data {
+	__u64 fdt_addr;
+	__u64 fdt_size;
+	__u64 scratch_addr;
+	__u64 scratch_size;
+} __attribute__((packed));
+
 #endif /* __ASSEMBLER__ */
 
 #endif /* _UAPI_ASM_X86_SETUP_DATA_H */
diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
index 57120f0749cc3..c314212a5ecd5 100644
--- a/arch/x86/kernel/e820.c
+++ b/arch/x86/kernel/e820.c
@@ -1300,6 +1300,24 @@ void __init e820__memblock_setup(void)
 		memblock_add(entry->addr, entry->size);
 	}
 
+	/*
+	 * At this point with KHO we only allocate from scratch memory.
+	 * At the same time, we configure memblock to only allow
+	 * allocations from memory below ISA_END_ADDRESS which is not
+	 * a natural scratch region, because Linux ignores memory below
+	 * ISA_END_ADDRESS at runtime. Beside very few (if any) early
+	 * allocations, we must allocate real-mode trapoline below
+	 * ISA_END_ADDRESS.
+	 *
+	 * To make sure that we can actually perform allocations during
+	 * this phase, let's mark memory below ISA_END_ADDRESS as scratch
+	 * so we can allocate from there in a scratch-only world.
+	 *
+	 * After real mode trampoline is allocated, we clear scratch
+	 * marking from the memory below ISA_END_ADDRESS
+	 */
+	memblock_mark_kho_scratch(0, ISA_END_ADDRESS);
+
 	/* Throw away partial pages: */
 	memblock_trim_memory(PAGE_SIZE);
 
diff --git a/arch/x86/kernel/kexec-bzimage64.c b/arch/x86/kernel/kexec-bzimage64.c
index 68530fad05f74..518635cc0876c 100644
--- a/arch/x86/kernel/kexec-bzimage64.c
+++ b/arch/x86/kernel/kexec-bzimage64.c
@@ -233,6 +233,31 @@ setup_ima_state(const struct kimage *image, struct boot_params *params,
 #endif /* CONFIG_IMA_KEXEC */
 }
 
+static void setup_kho(const struct kimage *image, struct boot_params *params,
+		      unsigned long params_load_addr,
+		      unsigned int setup_data_offset)
+{
+#ifdef CONFIG_KEXEC_HANDOVER
+	struct setup_data *sd = (void *)params + setup_data_offset;
+	struct kho_data *kho = (void *)sd + sizeof(*sd);
+
+	sd->type = SETUP_KEXEC_KHO;
+	sd->len = sizeof(struct kho_data);
+
+	/* Only add if we have all KHO images in place */
+	if (!image->kho.fdt || !image->kho.scratch)
+		return;
+
+	/* Add setup data */
+	kho->fdt_addr = image->kho.fdt;
+	kho->fdt_size = PAGE_SIZE;
+	kho->scratch_addr = image->kho.scratch->mem;
+	kho->scratch_size = image->kho.scratch->bufsz;
+	sd->next = params->hdr.setup_data;
+	params->hdr.setup_data = params_load_addr + setup_data_offset;
+#endif /* CONFIG_KEXEC_HANDOVER */
+}
+
 static int
 setup_boot_parameters(struct kimage *image, struct boot_params *params,
 		      unsigned long params_load_addr,
@@ -312,6 +337,13 @@ setup_boot_parameters(struct kimage *image, struct boot_params *params,
 				     sizeof(struct ima_setup_data);
 	}
 
+	if (IS_ENABLED(CONFIG_KEXEC_HANDOVER)) {
+		/* Setup space to store preservation metadata */
+		setup_kho(image, params, params_load_addr, setup_data_offset);
+		setup_data_offset += sizeof(struct setup_data) +
+				     sizeof(struct kho_data);
+	}
+
 	/* Setup RNG seed */
 	setup_rng_seed(params, params_load_addr, setup_data_offset);
 
@@ -479,6 +511,10 @@ static void *bzImage64_load(struct kimage *image, char *kernel,
 		kbuf.bufsz += sizeof(struct setup_data) +
 			      sizeof(struct ima_setup_data);
 
+	if (IS_ENABLED(CONFIG_KEXEC_HANDOVER))
+		kbuf.bufsz += sizeof(struct setup_data) +
+			      sizeof(struct kho_data);
+
 	params = kzalloc(kbuf.bufsz, GFP_KERNEL);
 	if (!params)
 		return ERR_PTR(-ENOMEM);
diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index 766176c4f5ee8..496dae89cf95d 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -451,6 +451,28 @@ int __init ima_get_kexec_buffer(void **addr, size_t *size)
 }
 #endif
 
+static void __init add_kho(u64 phys_addr, u32 data_len)
+{
+#ifdef CONFIG_KEXEC_HANDOVER
+	struct kho_data *kho;
+	u64 addr = phys_addr + sizeof(struct setup_data);
+	u64 size = data_len - sizeof(struct setup_data);
+
+	kho = early_memremap(addr, size);
+	if (!kho) {
+		pr_warn("setup: failed to memremap kho data (0x%llx, 0x%llx)\n",
+			addr, size);
+		return;
+	}
+
+	kho_populate(kho->fdt_addr, kho->fdt_size, kho->scratch_addr, kho->scratch_size);
+
+	early_memunmap(kho, size);
+#else
+	pr_warn("Passed KHO data, but CONFIG_KEXEC_HANDOVER not set. Ignoring.\n");
+#endif
+}
+
 static void __init parse_setup_data(void)
 {
 	struct setup_data *data;
@@ -479,6 +501,9 @@ static void __init parse_setup_data(void)
 		case SETUP_IMA:
 			add_early_ima_buffer(pa_data);
 			break;
+		case SETUP_KEXEC_KHO:
+			add_kho(pa_data, data_len);
+			break;
 		case SETUP_RNG_SEED:
 			data = early_memremap(pa_data, data_len);
 			add_bootloader_randomness(data->data, data->len);
diff --git a/arch/x86/realmode/init.c b/arch/x86/realmode/init.c
index f9bc444a3064d..9b9f4534086d2 100644
--- a/arch/x86/realmode/init.c
+++ b/arch/x86/realmode/init.c
@@ -65,6 +65,8 @@ void __init reserve_real_mode(void)
 	 * setup_arch().
 	 */
 	memblock_reserve(0, SZ_1M);
+
+	memblock_clear_kho_scratch(0, SZ_1M);
 }
 
 static void __init sme_sev_setup_real_mode(struct trampoline_header *th)
-- 
2.49.0.604.gff1f9ca942-goog

