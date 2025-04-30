Received: from 2.mo576.mail-out.ovh.net (2.mo576.mail-out.ovh.net [178.33.251.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC86434545
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 23:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.33.251.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746055315; cv=none; b=cStPejN2A8CM+lxs+ibVMNMOKI+wKWMyHq8iXaQ3MszQh5qlLM7aPU/Ogn0KTyGI/I5Na+Z93xqunidEt26OXSsWG34p9UrpaRpcgQrgJkZAKEN7LTperFRabrCAqEzwSKz9sRhb7qYuSzAtiCZufhtp0OLgHmxgA5dUbZqV18g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746055315; c=relaxed/simple;
	bh=7CMA7RQv42Zqv1YDnKbPDDgiEuaw242d7v3FQGNIArA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SHIPbRbBMdKYOGlhXEBRYaNKzlp/RY60OG1uXRL90kwYtz1yvnM5gK3SYIYgLBeQxyZgPq4F5q23tFOUsZHQ7c+ZFDGcVLwt7kQsVFbrWq7CEg8FIgv04W9kCxUSZVS6q9yuE/r6xmMPFSwpuzqT2KrzbWlhuJWH5tpzsRWSoHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com; spf=pass smtp.mailfrom=3mdeb.com; dkim=pass (2048-bit key) header.d=3mdeb.com header.i=@3mdeb.com header.b=K/Tok666; arc=none smtp.client-ip=178.33.251.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=3mdeb.com header.i=@3mdeb.com header.b="K/Tok666"
Received: from director11.ghost.mail-out.ovh.net (unknown [10.109.140.5])
	by mo576.mail-out.ovh.net (Postfix) with ESMTP id 4ZnshX30gBz28fv
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 22:45:16 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-gdlqt (unknown [10.108.42.247])
	by director11.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 005E41FE1E;
	Wed, 30 Apr 2025 22:45:15 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.99])
	by ghost-submission-5b5ff79f4f-gdlqt with ESMTPSA
	id 5B2dK/unEmgf1gUAvKMIYg
	(envelope-from <sergii.dmytruk@3mdeb.com>); Wed, 30 Apr 2025 22:45:15 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-99G00380ccad58-b8e3-486b-ab22-202da9e6f1c2,
                    7FFE21389DDF989CCD6FB7268846A7FDE11993D7) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.181.178
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: linux-kernel@vger.kernel.org
Cc: trenchboot-devel@googlegroups.com
Subject: [RFC PATCH v2 5/9] x86: Implement AMD support for Secure Launch
Date: Thu,  1 May 2025 01:44:47 +0300
Message-ID: <c96d45af6ff5cd0c22226c7d4fd41a9648ec2ed0.1746037489.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1746037489.git.sergii.dmytruk@3mdeb.com>
References: <cover.1746037489.git.sergii.dmytruk@3mdeb.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12104549898934531228
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieejleefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepufgvrhhgihhiucffmhihthhruhhkuceoshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeeuudffjedvgfffteegieekteevueetkeefheeileehteetvdefkeffuedtteeiheenucffohhmrghinhepthhruhhsthgvuggtohhmphhuthhinhhgghhrohhuphdrohhrghdpihhnthgvlhdrtghomhdpshhlpghsthhusgdrshgsnecukfhppeduvdejrddtrddtrddupddujeeirdduuddurddukedurddujeekpdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehjeeimgdpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=7FdRX2xO8psSzkl6ncytLqbuwudEsRaU/fwzhTME+rI=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1746053116; v=1;
 b=K/Tok666ur4LAIS+Ko1MzWZuFdogJwhTXI+iGBcLPeSMObuFnbpKXXznoKHQXvN80cbTI6hM
 DrerN0Y9uGkohblWOE6Bkzxf7WcaWJ6Vlcs8L46I+yTqD5yTsmCeY4wc+680qHOr9DMW/uyFqEa
 wHn+6Lmq0ShdO3ma14ou4z1MgSKyi1bcjGYCNVhLSsXAjbX/ttWasZZKQ+R9aT6/od+AP/Mv9aO
 xTo5354EsjSQPQhvKSfBN0YEOup4kTsxHXiLOK+nZ1zU1e6G3C8IV/3YNBFq8uZmlzZOch0UcBh
 y+JDHR+tCRTRBlr0Km9MJf1ZGAzLLZpx3muGC4BzqOIpQ==

From: Michał Żygowski <michal.zygowski@3mdeb.com>

AMD SKINIT uses the same entry point as Intel TXT (sl_stub_entry). It
follows similar, but simpler path than TXT; there is no TXT heap and
APs are started by a standard INIT/SIPI/SIPI sequence.

Contrary to the TXT, SKINIT does not use code provided by a CPU vendor.
Instead it requires an intermediate loader (SKL), whose task is to set
up memory protection and set a proper CPU context before handling
control over to the kernel.

In order to simplify adding new entries and to minimize the number of
differences between AMD and Intel, the event logs have actually two
headers, both for TPM 1.2 and 2.0.

For TPM 1.2 this is TCG_PCClientSpecIDEventStruct [1] with Intel's own
TXT-specific header embedded inside its 'vendorInfo' field. The offset
to this field is added to the base address on AMD path, making the code
for adding new events the same for both vendors.

TPM 2.0 in TXT uses HEAP_EVENT_LOG_POINTER_ELEMENT2_1 structure, which
is normally constructed on the TXT stack [2]. For AMD, this structure is
put inside TCG_EfiSpecIdEvent [3], also in 'vendorInfo' field. The
actual offset to this field depends on the number of hash algorithms
supported by the event log.

Other changes:
 - update common code to handle reset on AMD as well
 - reserve memory region occupied by SKL (called SLB) and event log

[1] https://www.trustedcomputinggroup.org/wp-content/uploads/TCG_PCClientImplementation_1-21_1_00.pdf
[2] http://www.intel.com/content/dam/www/public/us/en/documents/guides/intel-txt-software-development-guide.pdf
[3] https://trustedcomputinggroup.org/wp-content/uploads/TCG_PCClientSpecPlat_TPM_2p0_1p04_pub.pdf

Signed-off-by: Michał Żygowski <michal.zygowski@3mdeb.com>
Signed-off-by: Krystian Hebel <krystian.hebel@3mdeb.com>
Signed-off-by: Ross Philipson <ross.philipson@oracle.com>
Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
---
 arch/x86/Kconfig                       |   9 +-
 arch/x86/boot/compressed/sl_main.c     | 271 ++++++++++++++++++++-----
 arch/x86/boot/compressed/sl_stub.S     |  41 +++-
 arch/x86/include/uapi/asm/setup_data.h |   3 +-
 arch/x86/kernel/slaunch.c              |  99 ++++++++-
 5 files changed, 347 insertions(+), 76 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index badde1e9742e..d521838c77db 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2006,11 +2006,12 @@ config SECURE_LAUNCH
 	depends on X86_64 && X86_X2APIC && TCG_TIS && TCG_CRB && CRYPTO_LIB_SHA1 && CRYPTO_LIB_SHA256
 	help
 	   The Secure Launch feature allows a kernel to be loaded
-	   directly through an Intel TXT measured launch. Intel TXT
+	   directly through a dynamic launch. Intel TXT or AMD SKINIT
 	   establishes a Dynamic Root of Trust for Measurement (DRTM)
-	   where the CPU measures the kernel image. This feature then
-	   continues the measurement chain over kernel configuration
-	   information and init images.
+	   where the CPU or a Dynamic Configuration Environment (DCE)
+	   measures the kernel image. This feature then continues the
+	   measurement chain over kernel configuration information and
+	   init images.
 
 source "kernel/Kconfig.hz"
 
diff --git a/arch/x86/boot/compressed/sl_main.c b/arch/x86/boot/compressed/sl_main.c
index 5e0fd0d7bd72..f0bb40b608be 100644
--- a/arch/x86/boot/compressed/sl_main.c
+++ b/arch/x86/boot/compressed/sl_main.c
@@ -13,6 +13,7 @@
 #include <asm/msr.h>
 #include <asm/mtrr.h>
 #include <asm/processor-flags.h>
+#include <asm/svm.h>
 #include <asm/asm-offsets.h>
 #include <asm/bootparam.h>
 #include <asm/bootparam_utils.h>
@@ -26,6 +27,14 @@
 #define SL_TPM_LOG		1
 #define SL_TPM2_LOG		2
 
+#define sl_reset(e)					\
+	do {						\
+		if (sl_cpu_type == SL_CPU_INTEL)	\
+			sl_txt_reset(e);		\
+		else					\
+			sl_skinit_reset();		\
+	} while (0)
+
 static void *evtlog_base;
 static u32 evtlog_size;
 static struct txt_heap_event_log_pointer2_1_element *log21_elem;
@@ -69,6 +78,14 @@ static void __noreturn sl_txt_reset(u64 error)
 	unreachable();
 }
 
+static void __noreturn sl_skinit_reset(void)
+{
+	/* AMD does not have a reset mechanism or an error register */
+	asm volatile ("ud2");
+
+	unreachable();
+}
+
 static u64 sl_rdmsr(u32 reg)
 {
 	u64 lo, hi;
@@ -78,25 +95,41 @@ static u64 sl_rdmsr(u32 reg)
 	return (hi << 32) | lo;
 }
 
-static struct slr_table *sl_locate_and_validate_slrt(void)
+static struct slr_table *sl_locate_and_validate_slrt(struct boot_params *bp)
 {
 	struct txt_os_mle_data *os_mle_data;
+	struct slr_entry_amd_info *amd_info;
+	struct setup_data *data;
 	struct slr_table *slrt;
 	void *txt_heap;
 
-	txt_heap = (void *)sl_txt_read(TXT_CR_HEAP_BASE);
-	os_mle_data = txt_os_mle_data_start(txt_heap);
-
-	if (!os_mle_data->slrt)
-		sl_txt_reset(SL_ERROR_INVALID_SLRT);
+	if (sl_cpu_type & SL_CPU_AMD) {
+		slrt = NULL;
+		data = (struct setup_data *)bp->hdr.setup_data;
+		while (data) {
+			if (data->type == SETUP_SECURE_LAUNCH) {
+				amd_info =
+					(struct slr_entry_amd_info *)((u8 *)data -
+								      sizeof(struct slr_entry_hdr));
+				slrt = (struct slr_table *)amd_info->slrt_base;
+				break;
+			}
+			data = (struct setup_data *)data->next;
+		}
 
-	slrt = (struct slr_table *)os_mle_data->slrt;
+		if (!slrt || slrt->magic != SLR_TABLE_MAGIC ||
+		    slrt->architecture != SLR_AMD_SKINIT)
+			sl_skinit_reset();
+	} else {
+		txt_heap = (void *)sl_txt_read(TXT_CR_HEAP_BASE);
+		os_mle_data = txt_os_mle_data_start(txt_heap);
 
-	if (slrt->magic != SLR_TABLE_MAGIC)
-		sl_txt_reset(SL_ERROR_INVALID_SLRT);
+		slrt = (struct slr_table *)os_mle_data->slrt;
 
-	if (slrt->architecture != SLR_INTEL_TXT)
-		sl_txt_reset(SL_ERROR_INVALID_SLRT);
+		if (!slrt || slrt->magic != SLR_TABLE_MAGIC ||
+		    slrt->architecture != SLR_INTEL_TXT)
+			sl_txt_reset(SL_ERROR_INVALID_SLRT);
+	}
 
 	return slrt;
 }
@@ -177,6 +210,26 @@ static void sl_txt_validate_msrs(struct txt_os_mle_data *os_mle_data)
 		sl_txt_reset(SL_ERROR_MSR_INV_MISC_EN);
 }
 
+/*
+ * In order to simplify adding new entries and to minimize the number of
+ * differences between AMD and Intel, the event logs have actually two headers,
+ * both for TPM 1.2 and 2.0.
+ *
+ * For TPM 1.2 this is TCG_PCClientSpecIDEventStruct [1] with Intel's own
+ * TXT-specific header embedded inside its 'vendorInfo' field. The offset to
+ * this field is added to the base address in AMD path, making the code for
+ * adding new events the same for both vendors.
+ *
+ * TPM 2.0 in TXT uses HEAP_EVENT_LOG_POINTER_ELEMENT2_1 structure, which is
+ * normally constructed on the TXT stack [2]. For AMD, this structure is put
+ * inside TCG_EfiSpecIdEvent [3], also in 'vendorInfo' field. The actual offset
+ * to this field depends on number of hash algorithms supported by the event
+ * log.
+ *
+ * [1] https://www.trustedcomputinggroup.org/wp-content/uploads/TCG_PCClientImplementation_1-21_1_00.pdf
+ * [2] http://www.intel.com/content/dam/www/public/us/en/documents/guides/intel-txt-software-development-guide.pdf
+ * [3] https://trustedcomputinggroup.org/wp-content/uploads/TCG_PCClientSpecPlat_TPM_2p0_1p04_pub.pdf
+ */
 static void sl_find_drtm_event_log(struct slr_table *slrt)
 {
 	struct txt_os_sinit_data *os_sinit_data;
@@ -185,11 +238,31 @@ static void sl_find_drtm_event_log(struct slr_table *slrt)
 
 	log_info = slr_next_entry_by_tag(slrt, NULL, SLR_ENTRY_LOG_INFO);
 	if (!log_info)
-		sl_txt_reset(SL_ERROR_SLRT_MISSING_ENTRY);
+		sl_reset(SL_ERROR_SLRT_MISSING_ENTRY);
 
 	evtlog_base = (void *)log_info->addr;
 	evtlog_size = log_info->size;
 
+	if (sl_cpu_type == SL_CPU_AMD) {
+		/* Check if it is TPM 2.0 event log */
+		if (!memcmp(evtlog_base + sizeof(struct tcg_pcr_event),
+			    TCG_SPECID_SIG, sizeof(TCG_SPECID_SIG))) {
+			log21_elem = evtlog_base + sizeof(struct tcg_pcr_event)
+				+ TCG_EfiSpecIdEvent_SIZE(
+				  TPM2_HASH_COUNT(evtlog_base
+					+ sizeof(struct tcg_pcr_event)));
+			tpm_log_ver = SL_TPM2_LOG;
+		} else {
+			evtlog_base += sizeof(struct tcg_pcr_event)
+				+ TCG_PCClientSpecIDEventStruct_SIZE;
+			evtlog_size -= sizeof(struct tcg_pcr_event)
+				+ TCG_PCClientSpecIDEventStruct_SIZE;
+		}
+
+		return;
+	}
+
+	/* Else it is Intel and TXT */
 	txt_heap = (void *)sl_txt_read(TXT_CR_HEAP_BASE);
 
 	/*
@@ -213,7 +286,23 @@ static void sl_find_drtm_event_log(struct slr_table *slrt)
 		tpm_log_ver = SL_TPM2_LOG;
 }
 
-static void sl_validate_event_log_buffer(void)
+static bool sl_check_buffer_kernel_overlap(void *buffer_base, void *buffer_end,
+					   void *kernel_base, void *kernel_end,
+					   bool allow_inside)
+{
+	if (buffer_base >= kernel_end && buffer_end > kernel_end)
+		return false; /* above */
+
+	if (buffer_end <= kernel_base && buffer_base < kernel_base)
+		return false; /* below */
+
+	if (allow_inside && buffer_end <= kernel_end && buffer_base >= kernel_base)
+		return false; /* inside */
+
+	return true;
+}
+
+static void sl_txt_validate_event_log_buffer(void)
 {
 	struct txt_os_sinit_data *os_sinit_data;
 	void *txt_heap, *txt_end;
@@ -235,11 +324,9 @@ static void sl_validate_event_log_buffer(void)
 	 * This check is to ensure the event log buffer does not overlap with
 	 * the MLE image.
 	 */
-	if (evtlog_base >= mle_end && evtlog_end > mle_end)
-		goto pmr_check; /* above */
-
-	if (evtlog_end <= mle_base && evtlog_base < mle_base)
-		goto pmr_check; /* below */
+	if (!sl_check_buffer_kernel_overlap(evtlog_base, evtlog_end,
+					    mle_base, mle_end, false))
+		goto pmr_check;
 
 	sl_txt_reset(SL_ERROR_MLE_BUFFER_OVERLAP);
 
@@ -254,6 +341,38 @@ static void sl_validate_event_log_buffer(void)
 	sl_check_pmr_coverage(evtlog_base, evtlog_size, true);
 }
 
+static void sl_skinit_validate_buffers(struct slr_table *slrt, void *bootparams)
+{
+	void *evtlog_end, *kernel_start, *kernel_end;
+	struct slr_entry_dl_info *dl_info;
+
+	/* On AMD, all the buffers should be below 4Gb */
+	if ((u64)(evtlog_base + evtlog_size) > UINT_MAX)
+		sl_skinit_reset();
+
+	evtlog_end = evtlog_base + evtlog_size;
+
+	dl_info = slr_next_entry_by_tag(slrt, NULL, SLR_ENTRY_DL_INFO);
+	if (!dl_info)
+		sl_skinit_reset();
+
+	kernel_start = (void *)dl_info->dlme_base;
+	kernel_end = (void *)(dl_info->dlme_base + dl_info->dlme_size);
+
+	/*
+	 * This check is to ensure the event log buffer and the bootparams do
+	 * overlap with the kernel image. Note on an EFI stub boot, the bootparams
+	 * will be fully inside the kernel image.
+	 */
+	if (sl_check_buffer_kernel_overlap(bootparams, bootparams + PAGE_SIZE,
+					   kernel_start, kernel_end, true))
+		sl_skinit_reset();
+
+	if (sl_check_buffer_kernel_overlap(evtlog_base, evtlog_end,
+					   kernel_start, kernel_end, false))
+		sl_skinit_reset();
+}
+
 static void sl_find_event_log_algorithms(void)
 {
 	struct tcg_efi_specid_event_head *efi_head =
@@ -261,17 +380,17 @@ static void sl_find_event_log_algorithms(void)
 	u32 i;
 
 	if (efi_head->num_algs == 0)
-		sl_txt_reset(SL_ERROR_TPM_INVALID_ALGS);
+		sl_reset(SL_ERROR_TPM_INVALID_ALGS);
 
 	tpm_algs = &efi_head->digest_sizes[0];
 	tpm_num_algs = efi_head->num_algs;
 
 	for (i = 0; i < tpm_num_algs; i++) {
 		if (tpm_algs[i].digest_size > TPM_MAX_DIGEST_SIZE)
-			sl_txt_reset(SL_ERROR_TPM_INVALID_ALGS);
+			sl_reset(SL_ERROR_TPM_INVALID_ALGS);
 		/* Alg ID 0 is invalid and maps to TPM_ALG_ERROR */
 		if (tpm_algs[i].alg_id == TPM_ALG_ERROR)
-			sl_txt_reset(SL_ERROR_TPM_INVALID_ALGS);
+			sl_reset(SL_ERROR_TPM_INVALID_ALGS);
 	}
 }
 
@@ -301,7 +420,7 @@ static void sl_tpm_log_event(u32 pcr, u32 event_type,
 	total_size = sizeof(*pcr_event) + event_size;
 
 	if (tpm_log_event(evtlog_base, evtlog_size, total_size, pcr_event))
-		sl_txt_reset(SL_ERROR_TPM_LOGGING_FAILED);
+		sl_reset(SL_ERROR_TPM_LOGGING_FAILED);
 }
 
 static void sl_tpm2_log_event(u32 pcr, u32 event_type,
@@ -360,7 +479,7 @@ static void sl_tpm2_log_event(u32 pcr, u32 event_type,
 	total_size += sizeof(*event) + event_size;
 
 	if (tpm2_log_event(log21_elem, evtlog_base, evtlog_size, total_size, &event_buf[0]))
-		sl_txt_reset(SL_ERROR_TPM_LOGGING_FAILED);
+		sl_reset(SL_ERROR_TPM_LOGGING_FAILED);
 }
 
 static void sl_tpm_extend_evtlog(u32 pcr, u32 type,
@@ -385,6 +504,13 @@ static struct setup_data *sl_handle_setup_data(struct setup_data *curr,
 
 	next = (struct setup_data *)(unsigned long)curr->next;
 
+	/*
+	 * If this is the Secure Launch setup_data, it is the AMD info in the
+	 * SLR table which is measured separately, skip it.
+	 */
+	if (curr->type == SETUP_SECURE_LAUNCH)
+		return next;
+
 	/* SETUP_INDIRECT instances have to be handled differently */
 	if (curr->type == SETUP_INDIRECT) {
 		ind = (struct setup_indirect *)((u8 *)curr + offsetof(struct setup_data, data));
@@ -427,30 +553,54 @@ static void sl_extend_slrt(struct slr_policy_entry *entry)
 	struct slr_table *slrt = (struct slr_table *)entry->entity;
 	struct slr_entry_intel_info *intel_info;
 	struct slr_entry_intel_info intel_tmp;
+	struct slr_entry_amd_info *amd_info;
+	struct slr_entry_amd_info amd_tmp;
 
 	/*
 	 * In revision one of the SLRT, the only table that needs to be
-	 * measured is the Intel info table. Everything else is meta-data,
-	 * addresses and sizes. Note the size of what to measure is not set.
-	 * The flag SLR_POLICY_IMPLICIT_SIZE leaves it to the measuring code
-	 * to sort out.
+	 * measured is the platform-specific info table. Everything else is
+	 * meta-data, addresses and sizes. Note the size of what to measure is
+	 * not set. The flag SLR_POLICY_IMPLICIT_SIZE leaves it to the measuring
+	 * code to sort out.
 	 */
 	if (slrt->revision == 1) {
-		intel_info = slr_next_entry_by_tag(slrt, NULL, SLR_ENTRY_INTEL_INFO);
-		if (!intel_info)
-			sl_txt_reset(SL_ERROR_SLRT_MISSING_ENTRY);
+		if (sl_cpu_type == SL_CPU_INTEL) {
+			intel_info =
+				slr_next_entry_by_tag(slrt, NULL,
+						      SLR_ENTRY_INTEL_INFO);
+			if (!intel_info)
+				sl_txt_reset(SL_ERROR_SLRT_MISSING_ENTRY);
 
-		/*
-		 * Make a temp copy and zero out address fields since they should
-		 * not be measured.
-		 */
-		intel_tmp = *intel_info;
-		intel_tmp.boot_params_addr = 0;
-		intel_tmp.txt_heap = 0;
+			/*
+			 * Make a temp copy and zero out address fields since they should
+			 * not be measured.
+			 */
+			intel_tmp = *intel_info;
+			intel_tmp.boot_params_addr = 0;
+			intel_tmp.txt_heap = 0;
+
+			sl_tpm_extend_evtlog(entry->pcr, TXT_EVTYPE_SLAUNCH,
+					     (void *)&intel_tmp, sizeof(*intel_info),
+					     entry->evt_info);
+		} else if (sl_cpu_type == SL_CPU_AMD) {
+			amd_info = slr_next_entry_by_tag(slrt, NULL,
+							 SLR_ENTRY_AMD_INFO);
+			if (!amd_info)
+				sl_skinit_reset();
 
-		sl_tpm_extend_evtlog(entry->pcr, TXT_EVTYPE_SLAUNCH,
-				     (void *)&intel_tmp, sizeof(*intel_info),
-				     entry->evt_info);
+			/*
+			 * Make a temp copy and zero out address fields since
+			 * they should not be measured.
+			 */
+			amd_tmp = *amd_info;
+			amd_tmp.next = 0;
+			amd_tmp.boot_params_addr = 0;
+			amd_tmp.slrt_base = 0;
+
+			sl_tpm_extend_evtlog(entry->pcr, TXT_EVTYPE_SLAUNCH,
+					     (void *)&amd_tmp, sizeof(amd_tmp),
+					     entry->evt_info);
+		}
 	}
 }
 
@@ -480,7 +630,7 @@ static void sl_process_extend_policy(struct slr_table *slrt)
 
 	policy = slr_next_entry_by_tag(slrt, NULL, SLR_ENTRY_ENTRY_POLICY);
 	if (!policy)
-		sl_txt_reset(SL_ERROR_SLRT_MISSING_ENTRY);
+		sl_reset(SL_ERROR_SLRT_MISSING_ENTRY);
 
 	for (i = 0; i < policy->nr_entries; i++) {
 		switch (policy->policy_entries[i].entity_type) {
@@ -545,20 +695,29 @@ asmlinkage __visible void sl_main(void *bootparams)
 	bp->hdr.loadflags &= ~SLAUNCH_FLAG;
 
 	/*
-	 * Currently only Intel TXT is supported for Secure Launch. Testing
+	 * Intel TXT and AMD SKINIT are supported for Secure Launch. Testing
 	 * this value also indicates that the kernel was booted successfully
-	 * through the Secure Launch entry point and is in SMX mode.
+	 * through the Secure Launch entry point and is in SMX or SKINIT mode.
 	 */
-	if (!(sl_cpu_type & SL_CPU_INTEL))
+	if (!(sl_cpu_type & (SL_CPU_INTEL | SL_CPU_AMD)))
 		return;
 
-	slrt = sl_locate_and_validate_slrt();
+	slrt = sl_locate_and_validate_slrt(bp);
 
 	/* Locate the TPM event log. */
 	sl_find_drtm_event_log(slrt);
 
-	/* Validate the location of the event log buffer before using it */
-	sl_validate_event_log_buffer();
+	/*
+	 * On a TXT launch, validate the logging buffer for overlaps with the
+	 * MLE and proper PMR coverage before using it. On an SKINIT launch,
+	 * the boot params have to be used here to find the base and extent of
+	 * the launched kernel. These values can then be used to make sure the
+	 * boot params and logging buffer do not overlap the kernel.
+	 */
+	if (sl_cpu_type & SL_CPU_INTEL)
+		sl_txt_validate_event_log_buffer();
+	else
+		sl_skinit_validate_buffers(slrt, bootparams);
 
 	/*
 	 * Find the TPM hash algorithms used by the ACM and recorded in the
@@ -585,13 +744,15 @@ asmlinkage __visible void sl_main(void *bootparams)
 
 	sl_tpm_extend_evtlog(17, TXT_EVTYPE_SLAUNCH_END, NULL, 0, "");
 
-	/* No PMR check is needed, the TXT heap is covered by the DPR */
-	txt_heap = (void *)sl_txt_read(TXT_CR_HEAP_BASE);
-	os_mle_data = txt_os_mle_data_start(txt_heap);
+	if (sl_cpu_type & SL_CPU_INTEL) {
+		/* No PMR check is needed, the TXT heap is covered by the DPR */
+		txt_heap = (void *)sl_txt_read(TXT_CR_HEAP_BASE);
+		os_mle_data = txt_os_mle_data_start(txt_heap);
 
-	/*
-	 * Now that the OS-MLE data is measured, ensure the MTRR and
-	 * misc enable MSRs are what we expect.
-	 */
-	sl_txt_validate_msrs(os_mle_data);
+		/*
+		 * Now that the OS-MLE data is measured, ensure the MTRR and
+		 * misc enable MSRs are what we expect.
+		 */
+		sl_txt_validate_msrs(os_mle_data);
+	}
 }
diff --git a/arch/x86/boot/compressed/sl_stub.S b/arch/x86/boot/compressed/sl_stub.S
index 6c0f0b2a062d..7a6492bf04e4 100644
--- a/arch/x86/boot/compressed/sl_stub.S
+++ b/arch/x86/boot/compressed/sl_stub.S
@@ -23,6 +23,9 @@
 /* CPUID: leaf 1, ECX, SMX feature bit */
 #define X86_FEATURE_BIT_SMX	(1 << 6)
 
+/* CPUID: leaf 0x80000001, ECX, SKINIT feature bit */
+#define X86_FEATURE_BIT_SKINIT	(1 << 12)
+
 #define IDT_VECTOR_LO_BITS	0
 #define IDT_VECTOR_HI_BITS	6
 
@@ -71,7 +74,11 @@ SYM_FUNC_START(sl_stub_entry)
 	 * On entry, %ebx has the entry abs offset to sl_stub_entry. The rva()
 	 * macro is used to generate relative references using %ebx as a base, as
 	 * to avoid absolute relocations, which would require fixups at runtime.
-	 * Only %cs and %ds segments are known good.
+	 * Only %cs and %ds segments are known good. On Intel, the ACM guarantees
+	 * this while on AMD the SKL (Secure Kernel Loader) likewise does.
+	 *
+	 * In addition, on Intel %ecx holds the MLE page directory pointer
+	 * table and on AMD %edx holds the physical base address of the SKL.
 	 */
 
 	/* Load GDT, set segment regs and lret to __SL32_CS */
@@ -98,6 +105,12 @@ SYM_FUNC_START(sl_stub_entry)
 	lret
 
 .Lsl_cs:
+	/*
+	 * For AMD, save SKL base before the CPUID instruction overwrites it.
+	 * Performs cast from u32 to 64b void* for simpler use later.
+	 */
+	movl	%edx, rva(sl_skl_base)(%ebx)
+
 	/* Save our base pointer reg and page table for MLE */
 	pushl	%ebx
 	pushl	%ecx
@@ -106,7 +119,7 @@ SYM_FUNC_START(sl_stub_entry)
 	movl	$1, %eax
 	cpuid
 	testl	$(X86_FEATURE_BIT_SMX), %ecx
-	jz	.Ldo_unknown_cpu
+	jz	.Ldo_amd /* maybe AMD/SKINIT? */
 
 	popl	%ecx
 	popl	%ebx
@@ -189,9 +202,21 @@ SYM_FUNC_START(sl_stub_entry)
 
 	jmp	.Lcpu_setup_done
 
-.Ldo_unknown_cpu:
-	/* Non-Intel CPUs are not yet supported */
-	ud2
+.Ldo_amd:
+	/* See if SKINIT feature is supported. */
+	movl	$0x80000001, %eax
+	cpuid
+	testl	$(X86_FEATURE_BIT_SKINIT), %ecx
+	jz	.Ldo_unknown_cpu
+
+	popl	%ecx
+	/* Base pointer reg saved in Intel check */
+	popl	%ebx
+
+	/* Know it is AMD */
+	movl	$(SL_CPU_AMD), rva(sl_cpu_type)(%ebx)
+
+	/* On AMD %esi is set up by the SKL, just go on */
 
 .Lcpu_setup_done:
 	/*
@@ -201,6 +226,10 @@ SYM_FUNC_START(sl_stub_entry)
 
 	/* Done, jump to normal 32b pm entry */
 	jmp	startup_32
+
+.Ldo_unknown_cpu:
+	/* Neither Intel nor AMD */
+	ud2
 SYM_FUNC_END(sl_stub_entry)
 
 SYM_FUNC_START(sl_find_mle_base)
@@ -722,6 +751,8 @@ SYM_DATA(sl_cpu_type, .long 0x00000000)
 
 SYM_DATA(sl_mle_start, .long 0x00000000)
 
+SYM_DATA(sl_skl_base, .quad 0x0000000000000000)
+
 SYM_DATA_LOCAL(sl_txt_spin_lock, .long 0x00000000)
 
 SYM_DATA_LOCAL(sl_txt_stack_index, .long 0x00000000)
diff --git a/arch/x86/include/uapi/asm/setup_data.h b/arch/x86/include/uapi/asm/setup_data.h
index 50c45ead4e7c..6f376c050c76 100644
--- a/arch/x86/include/uapi/asm/setup_data.h
+++ b/arch/x86/include/uapi/asm/setup_data.h
@@ -13,7 +13,8 @@
 #define SETUP_CC_BLOB			7
 #define SETUP_IMA			8
 #define SETUP_RNG_SEED			9
-#define SETUP_ENUM_MAX			SETUP_RNG_SEED
+#define SETUP_SECURE_LAUNCH		10
+#define SETUP_ENUM_MAX			SETUP_SECURE_LAUNCH
 
 #define SETUP_INDIRECT			(1<<31)
 #define SETUP_TYPE_MAX			(SETUP_ENUM_MAX | SETUP_INDIRECT)
diff --git a/arch/x86/kernel/slaunch.c b/arch/x86/kernel/slaunch.c
index d81433a9b699..3a031043d2f1 100644
--- a/arch/x86/kernel/slaunch.c
+++ b/arch/x86/kernel/slaunch.c
@@ -93,6 +93,20 @@ void __noreturn slaunch_txt_reset(void __iomem *txt,
 	unreachable();
 }
 
+/*
+ * SKINIT has no sticky register to set an error code or a DRTM reset
+ * facility. The best that can be done is to trace an error and trigger
+ * a system reset using the undefined instruction.
+ */
+void __noreturn slaunch_skinit_reset(const char *msg, u64 error)
+{
+	pr_err("%s - error: 0x%llx", msg, error);
+
+	asm volatile ("ud2");
+
+	unreachable();
+}
+
 /*
  * The TXT heap is too big to map all at once with early_ioremap
  * so it is done a table at a time.
@@ -217,7 +231,7 @@ static void __init slaunch_verify_pmrs(void __iomem *txt)
 		slaunch_txt_reset(txt, errmsg, err);
 }
 
-static void __init slaunch_txt_reserve_range(u64 base, u64 size)
+static void __init slaunch_reserve_range(u64 base, u64 size)
 {
 	int type;
 
@@ -255,15 +269,15 @@ static void __init slaunch_txt_reserve(void __iomem *txt)
 
 	base = TXT_PRIV_CONFIG_REGS_BASE;
 	size = TXT_PUB_CONFIG_REGS_BASE - TXT_PRIV_CONFIG_REGS_BASE;
-	slaunch_txt_reserve_range(base, size);
+	slaunch_reserve_range(base, size);
 
 	memcpy_fromio(&heap_base, txt + TXT_CR_HEAP_BASE, sizeof(heap_base));
 	memcpy_fromio(&heap_size, txt + TXT_CR_HEAP_SIZE, sizeof(heap_size));
-	slaunch_txt_reserve_range(heap_base, heap_size);
+	slaunch_reserve_range(heap_base, heap_size);
 
 	memcpy_fromio(&base, txt + TXT_CR_SINIT_BASE, sizeof(base));
 	memcpy_fromio(&size, txt + TXT_CR_SINIT_SIZE, sizeof(size));
-	slaunch_txt_reserve_range(base, size);
+	slaunch_reserve_range(base, size);
 
 	field_offset = offsetof(struct txt_sinit_mle_data,
 				sinit_vtd_dmar_table_size);
@@ -288,14 +302,14 @@ static void __init slaunch_txt_reserve(void __iomem *txt)
 	for (i = 0; i < mdrnum; i++, mdr++) {
 		/* Spec says some entries can have length 0, ignore them */
 		if (mdr->type > 0 && mdr->length > 0)
-			slaunch_txt_reserve_range(mdr->address, mdr->length);
+			slaunch_reserve_range(mdr->address, mdr->length);
 	}
 
 	txt_early_put_heap_table(mdrs, mdroffset + mdrslen - 8);
 
 nomdr:
-	slaunch_txt_reserve_range(ap_wake_info.ap_wake_block,
-				  ap_wake_info.ap_wake_block_size);
+	slaunch_reserve_range(ap_wake_info.ap_wake_block,
+			      ap_wake_info.ap_wake_block_size);
 
 	/*
 	 * Earlier checks ensured that the event log was properly situated
@@ -304,16 +318,16 @@ static void __init slaunch_txt_reserve(void __iomem *txt)
 	 * already reserved.
 	 */
 	if (evtlog_addr < heap_base || evtlog_addr > (heap_base + heap_size))
-		slaunch_txt_reserve_range(evtlog_addr, evtlog_size);
+		slaunch_reserve_range(evtlog_addr, evtlog_size);
 
 	for (i = 0; i < e820_table->nr_entries; i++) {
 		base = e820_table->entries[i].addr;
 		size = e820_table->entries[i].size;
 		if (base >= vtd_pmr_lo_size && base < 0x100000000ULL)
-			slaunch_txt_reserve_range(base, size);
+			slaunch_reserve_range(base, size);
 		else if (base < vtd_pmr_lo_size && base + size > vtd_pmr_lo_size)
-			slaunch_txt_reserve_range(vtd_pmr_lo_size,
-						  base + size - vtd_pmr_lo_size);
+			slaunch_reserve_range(vtd_pmr_lo_size,
+					      base + size - vtd_pmr_lo_size);
 	}
 }
 
@@ -514,6 +528,67 @@ static void __init slaunch_setup_txt(void)
 	pr_info("Intel TXT setup complete\n");
 }
 
+static void slaunch_skinit_prepare(void)
+{
+	struct slr_entry_amd_info amd_info_temp;
+	struct slr_entry_amd_info *amd_info;
+	struct slr_entry_log_info *log_info;
+	struct setup_data *data;
+	struct slr_table *slrt;
+	u64 pa_data;
+
+	pa_data = (u64)boot_params.hdr.setup_data;
+	amd_info = NULL;
+
+	while (pa_data) {
+		data = (struct setup_data *)early_memremap(pa_data, sizeof(*data));
+		if (!data)
+			slaunch_skinit_reset("Error failed to early_memremap setup data\n",
+					     SL_ERROR_MAP_SETUP_DATA);
+
+		if (data->type == SETUP_SECURE_LAUNCH) {
+			early_memunmap(data, sizeof(*data));
+			amd_info = (struct slr_entry_amd_info *)
+				early_memremap(pa_data - sizeof(struct slr_entry_hdr),
+					       sizeof(*amd_info));
+			if (!amd_info)
+				slaunch_skinit_reset("Error failed to early_memremap AMD info\n",
+						     SL_ERROR_MAP_SETUP_DATA);
+			break;
+		}
+
+		pa_data = data->next;
+		early_memunmap(data, sizeof(*data));
+	}
+
+	if (!amd_info)
+		slaunch_skinit_reset("Error failed to find AMD info\n",
+				     SL_ERROR_MISSING_EVENT_LOG);
+
+	amd_info_temp = *amd_info;
+	early_memunmap(amd_info, sizeof(*amd_info));
+
+	slaunch_reserve_range(amd_info_temp.slrt_base, amd_info_temp.slrt_size);
+
+	/* Get the SLRT and remap it */
+	slrt = early_memremap(amd_info_temp.slrt_base, amd_info_temp.slrt_size);
+	if (!slrt)
+		slaunch_skinit_reset("Error failed to early_memremap SLR Table\n",
+				     SL_ERROR_SLRT_MAP);
+
+	log_info = slr_next_entry_by_tag(slrt, NULL, SLR_ENTRY_LOG_INFO);
+	if (!log_info)
+		slaunch_skinit_reset("Error failed to find event log info SLR Table\n",
+				     SL_ERROR_SLRT_MISSING_ENTRY);
+
+	slaunch_reserve_range(log_info->addr, log_info->size);
+
+	early_memunmap(slrt, amd_info_temp.slrt_size);
+
+	if (amd_info_temp.psp_version == 2 || amd_info_temp.psp_version == 3)
+		sl_flags |= SL_FLAG_SKINIT_PSP;
+}
+
 /*
  * AMD SKINIT specific late stub setup and validation called from within
  * x86 specific setup_arch().
@@ -530,6 +605,8 @@ static void __init slaunch_setup_skinit(void)
 	if (!(val & (1 << SVM_VM_CR_INIT_REDIRECTION)))
 		return;
 
+	slaunch_skinit_prepare();
+
 	/* Set flags on BSP so subsequent code knows it was a SKINIT launch */
 	sl_flags |= (SL_FLAG_ACTIVE|SL_FLAG_ARCH_SKINIT);
 	pr_info("AMD SKINIT setup complete\n");
-- 
2.49.0

