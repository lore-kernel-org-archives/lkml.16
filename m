Received: from 2.mo550.mail-out.ovh.net (2.mo550.mail-out.ovh.net [178.32.119.250])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C151BF37
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 22:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.32.119.250
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746053441; cv=none; b=muataBeu9QmlwYP86L45VMMBw08uH7masgQxC3EivOcZdRnxiG53c312HYLP1MyfibKsj6F09Qh66lW4wmlXA9+Uy8v4LGdvB7w5daO7rBSh8AqlVajY/aJD0BWfD1o/FRo3sVFqtGde7rUVYQlzM42qVhjD8FLBZ7XwVrzXMcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746053441; c=relaxed/simple;
	bh=DJOkI8RRTkcQYiwRlk6gpscGvGHJ0hzePQk2+QLs4Qw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U+cQ51r0X6oo3dWRnvgH4j38BHLuBD9atCTZoeVNg5Sfcqy98A+ex+RwqNStql9fQBkKMUwPKS0wH4lFXIAqQtO/WdFvv8Hg00xTc536kyGnIbj+4JXRW3QRLTsDp3mEhdnJvik5k29Q0TW2wFle6nn/06tRNa0iiQekL/9GFkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com; spf=pass smtp.mailfrom=3mdeb.com; dkim=pass (2048-bit key) header.d=3mdeb.com header.i=@3mdeb.com header.b=bmWpKgDX; arc=none smtp.client-ip=178.32.119.250
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=3mdeb.com header.i=@3mdeb.com header.b="bmWpKgDX"
Received: from director4.ghost.mail-out.ovh.net (unknown [10.109.176.170])
	by mo550.mail-out.ovh.net (Postfix) with ESMTP id 4Znshd3trMz1XpY
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 22:45:21 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-qblm5 (unknown [10.110.188.135])
	by director4.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 402571FDEE;
	Wed, 30 Apr 2025 22:45:21 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.103])
	by ghost-submission-5b5ff79f4f-qblm5 with ESMTPSA
	id IwamBQGoEmhmuQIAmzuhMg
	(envelope-from <sergii.dmytruk@3mdeb.com>); Wed, 30 Apr 2025 22:45:21 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-103G00578138a33-c66c-4bcf-8dca-08c187643215,
                    7FFE21389DDF989CCD6FB7268846A7FDE11993D7) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.181.178
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: linux-kernel@vger.kernel.org
Cc: trenchboot-devel@googlegroups.com
Subject: [RFC PATCH v2 7/9] x86/slmodule: Support AMD SKINIT
Date: Thu,  1 May 2025 01:44:49 +0300
Message-ID: <7a39e40036b795339244fac870bead7983f06aec.1746037489.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1746037489.git.sergii.dmytruk@3mdeb.com>
References: <cover.1746037489.git.sergii.dmytruk@3mdeb.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12105957275724133532
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieejleegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefuvghrghhiihcuffhmhihtrhhukhcuoehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhephfehfeehudeileeikeffgfffgfefuddtveelvedvhfffgfelvdfgtddutdehfeeinecukfhppeduvdejrddtrddtrddupddujeeirdduuddurddukedurddujeekpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheehtdgmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=+FaceXCqu/ICnaOIGecXj8d3JMkfkxWToutOnQ3DjqU=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1746053121; v=1;
 b=bmWpKgDXEybw6vS4cDcRwuOlciKyjxKn2yUjKSQT0/J8M0Hxx13rz9mugrBd1ruMHKF1Au70
 abUKB8uUq7d7iegeE6tGDArL54xhisd8H5OtlMF24cwpFuwVWgAQ/ZndqG6qAI1iznLS55RecIY
 12ezxAhtrFuy+Ff4x+wn2oNtL5rXCq66vQSwlFsXC5xnzkLfIKG+FEQ8kHZrWGf800UPxDGtTHx
 ze5Jh92geUf0dJIxS/7/drHx1PlpB4krTrdv++c8wqgV7QK8JXFN/GBWXa/mbVW2akyuR6Grfm8
 IMs7qc405DMyNPQ/UC53B6pp2SQERMaJ8L/M4wZRhQgwg==

From: Ross Philipson <ross.philipson@oracle.com>

Some of the changes are related to generalization: common macro for
resetting the platform. The rest are:
 - SKINIT-specific way of getting to SLRT
 - handling of TPM log which has TXT-specific header embedded as vendor
   data of a TCG-compliant one

Signed-off-by: Ross Philipson <ross.philipson@oracle.com>
Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
---
 arch/x86/kernel/slmodule.c | 161 ++++++++++++++++++++++++++++++-------
 1 file changed, 134 insertions(+), 27 deletions(-)

diff --git a/arch/x86/kernel/slmodule.c b/arch/x86/kernel/slmodule.c
index 64010bac038c..4d29c1628a90 100644
--- a/arch/x86/kernel/slmodule.c
+++ b/arch/x86/kernel/slmodule.c
@@ -18,12 +18,21 @@
 #include <linux/security.h>
 #include <linux/memblock.h>
 #include <linux/tpm.h>
+#include <asm/setup.h>
 #include <asm/segment.h>
 #include <asm/sections.h>
 #include <crypto/sha2.h>
 #include <linux/slr_table.h>
 #include <linux/slaunch.h>
 
+#define slaunch_reset(t, m, e)					\
+	do {							\
+		if (t)						\
+			slaunch_txt_reset((t), (m), (e));	\
+		else						\
+			slaunch_skinit_reset((m), (e));		\
+	} while (0)
+
 /*
  * The macro DECLARE_TXT_PUB_READ_U is used to read values from the TXT
  * public registers as unsigned values.
@@ -83,6 +92,7 @@ struct memfile {
 
 static struct memfile sl_evtlog = {"eventlog", NULL, 0};
 static void *txt_heap;
+static void *skinit_evtlog;
 static struct txt_heap_event_log_pointer2_1_element *evtlog21;
 static DEFINE_MUTEX(sl_evt_log_mutex);
 static struct tcg_efi_specid_event_head *efi_head;
@@ -239,12 +249,19 @@ static void slaunch_teardown_securityfs(void)
 			memunmap(txt_heap);
 			txt_heap = NULL;
 		}
+	} else if (slaunch_get_flags() & SL_FLAG_ARCH_SKINIT) {
+		if (skinit_evtlog) {
+			memunmap(skinit_evtlog);
+			skinit_evtlog = NULL;
+		}
+		sl_evtlog.addr = NULL;
+		sl_evtlog.size = 0;
 	}
 
 	securityfs_remove(slaunch_dir);
 }
 
-static void slaunch_intel_evtlog(void __iomem *txt)
+static void slaunch_txt_evtlog(void __iomem *txt)
 {
 	struct slr_entry_log_info *log_info;
 	struct txt_os_mle_data *params;
@@ -312,6 +329,88 @@ static void slaunch_intel_evtlog(void __iomem *txt)
 	efi_head = (struct tcg_efi_specid_event_head *)(sl_evtlog.addr + sizeof(struct tcg_pcr_event));
 }
 
+static void slaunch_skinit_evtlog(void)
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
+		data = (struct setup_data *)memremap(pa_data, sizeof(*data), MEMREMAP_WB);
+		if (!data)
+			slaunch_skinit_reset("Error failed to memremap setup data\n",
+					     SL_ERROR_MAP_SETUP_DATA);
+
+		if (data->type == SETUP_SECURE_LAUNCH) {
+			memunmap(data);
+			amd_info = (struct slr_entry_amd_info *)
+				memremap(pa_data - sizeof(struct slr_entry_hdr),
+					 sizeof(*amd_info), MEMREMAP_WB);
+			if (!amd_info)
+				slaunch_skinit_reset("Error failed to memremap AMD info\n",
+						     SL_ERROR_MAP_SETUP_DATA);
+			break;
+		}
+
+		pa_data = data->next;
+		memunmap(data);
+	}
+
+	if (!amd_info)
+		slaunch_skinit_reset("Error failed to find AMD info\n", SL_ERROR_MISSING_EVENT_LOG);
+
+	amd_info_temp = *amd_info;
+	memunmap(amd_info);
+
+	/* Get the SLRT and remap it */
+	slrt = memremap(amd_info_temp.slrt_base, amd_info_temp.slrt_size, MEMREMAP_WB);
+	if (!slrt)
+		slaunch_skinit_reset("Error failed to memremap SLR Table\n", SL_ERROR_SLRT_MAP);
+
+	log_info = slr_next_entry_by_tag(slrt, NULL, SLR_ENTRY_LOG_INFO);
+	if (!log_info)
+		slaunch_skinit_reset("Error failed to find event log info SLR Table\n",
+				     SL_ERROR_SLRT_MISSING_ENTRY);
+
+	/* Finally map the actual event log and find the proper offsets */
+	skinit_evtlog = memremap(log_info->addr, log_info->size, MEMREMAP_WB);
+	if (!skinit_evtlog)
+		slaunch_skinit_reset("Error failed to memremap TPM event log\n",
+				     SL_ERROR_EVENTLOG_MAP);
+
+	sl_evtlog.size = log_info->size;
+	sl_evtlog.addr = skinit_evtlog;
+
+	memunmap(slrt);
+
+	/*
+	 * See the comment for the following function concerning the
+	 * logic used here:
+	 * arch/x86/boot/compressed/sl_main.c:sl_find_event_log()
+	 */
+	if (!memcmp(skinit_evtlog + sizeof(struct tcg_pcr_event),
+		    TCG_SPECID_SIG, sizeof(TCG_SPECID_SIG))) {
+		evtlog21 = skinit_evtlog + sizeof(struct tcg_pcr_event)
+			+ TCG_EfiSpecIdEvent_SIZE(
+			  TPM2_HASH_COUNT(skinit_evtlog
+				+ sizeof(struct tcg_pcr_event)));
+	} else {
+		sl_evtlog.addr += sizeof(struct tcg_pcr_event)
+			+ TCG_PCClientSpecIDEventStruct_SIZE;
+		sl_evtlog.size -= sizeof(struct tcg_pcr_event)
+			+ TCG_PCClientSpecIDEventStruct_SIZE;
+	}
+
+	/* Save pointer to the EFI SpecID log header */
+	efi_head = (struct tcg_efi_specid_event_head *)(skinit_evtlog + sizeof(struct tcg_pcr_event));
+}
+
 static void slaunch_tpm2_extend_event(struct tpm_chip *tpm, void __iomem *txt,
 				      struct tcg_pcr_event2_head *event)
 {
@@ -331,8 +430,7 @@ static void slaunch_tpm2_extend_event(struct tpm_chip *tpm, void __iomem *txt,
 
 	digests = kzalloc(efi_head->num_algs * sizeof(*digests), GFP_KERNEL);
 	if (!digests)
-		slaunch_txt_reset(txt, "Failed to allocate array of digests\n",
-				  SL_ERROR_GENERIC);
+		slaunch_reset(txt, "Failed to allocate array of digests\n", SL_ERROR_GENERIC);
 
 	for (i = 0; i < event->count; i++) {
 		dptr = (u8 *)alg_id_field + sizeof(u16);
@@ -349,8 +447,7 @@ static void slaunch_tpm2_extend_event(struct tpm_chip *tpm, void __iomem *txt,
 	ret = tpm_pcr_extend(tpm, event->pcr_idx, digests);
 	if (ret) {
 		pr_err("Error extending TPM20 PCR, result: %d\n", ret);
-		slaunch_txt_reset(txt, "Failed to extend TPM20 PCR\n",
-				  SL_ERROR_TPM_EXTEND);
+		slaunch_reset(txt, "Failed to extend TPM20 PCR\n", SL_ERROR_TPM_EXTEND);
 	}
 
 	kfree(digests);
@@ -372,8 +469,8 @@ static void slaunch_tpm2_extend(struct tpm_chip *tpm, void __iomem *txt)
 	while ((void  *)event < sl_evtlog.addr + evtlog21->next_record_offset) {
 		size = __calc_tpm2_event_size(event, event_header, false);
 		if (!size)
-			slaunch_txt_reset(txt, "TPM20 invalid event in event log\n",
-					  SL_ERROR_TPM_INVALID_EVENT);
+			slaunch_reset(txt, "TPM20 invalid event in event log\n",
+				      SL_ERROR_TPM_INVALID_EVENT);
 
 		/*
 		 * Marker events indicate where the Secure Launch early stub
@@ -400,8 +497,8 @@ static void slaunch_tpm2_extend(struct tpm_chip *tpm, void __iomem *txt)
 	}
 
 	if (!start || !end)
-		slaunch_txt_reset(txt, "Missing start or end events for extending TPM20 PCRs\n",
-				  SL_ERROR_TPM_EXTEND);
+		slaunch_reset(txt, "Missing start or end events for extending TPM20 PCRs\n",
+			      SL_ERROR_TPM_EXTEND);
 }
 
 static void slaunch_tpm_extend(struct tpm_chip *tpm, void __iomem *txt)
@@ -442,8 +539,8 @@ static void slaunch_tpm_extend(struct tpm_chip *tpm, void __iomem *txt)
 			ret = tpm_pcr_extend(tpm, event->pcr_idx, &digest);
 			if (ret) {
 				pr_err("Error extending TPM12 PCR, result: %d\n", ret);
-				slaunch_txt_reset(txt, "Failed to extend TPM12 PCR\n",
-						  SL_ERROR_TPM_EXTEND);
+				slaunch_reset(txt, "Failed to extend TPM12 PCR\n",
+					      SL_ERROR_TPM_EXTEND);
 			}
 		}
 
@@ -452,8 +549,8 @@ static void slaunch_tpm_extend(struct tpm_chip *tpm, void __iomem *txt)
 	}
 
 	if (!start || !end)
-		slaunch_txt_reset(txt, "Missing start or end events for extending TPM12 PCRs\n",
-				  SL_ERROR_TPM_EXTEND);
+		slaunch_reset(txt, "Missing start or end events for extending TPM12 PCRs\n",
+			      SL_ERROR_TPM_EXTEND);
 }
 
 static void slaunch_pcr_extend(void __iomem *txt)
@@ -463,13 +560,11 @@ static void slaunch_pcr_extend(void __iomem *txt)
 
 	tpm = tpm_default_chip();
 	if (!tpm)
-		slaunch_txt_reset(txt, "Could not get default TPM chip\n",
-				  SL_ERROR_TPM_INIT);
+		slaunch_reset(txt, "Could not get default TPM chip\n", SL_ERROR_TPM_INIT);
 
 	rc = tpm_chip_set_locality(tpm, 2);
 	if (rc)
-		slaunch_txt_reset(txt, "Could not set TPM chip locality 2\n",
-				  SL_ERROR_TPM_INIT);
+		slaunch_reset(txt, "Could not set TPM chip locality 2\n", SL_ERROR_TPM_INIT);
 
 	if (evtlog21)
 		slaunch_tpm2_extend(tpm, txt);
@@ -482,19 +577,31 @@ static int __init slaunch_module_init(void)
 	void __iomem *txt;
 
 	/* Check to see if Secure Launch happened */
-	if ((slaunch_get_flags() & (SL_FLAG_ACTIVE|SL_FLAG_ARCH_TXT)) !=
-	    (SL_FLAG_ACTIVE | SL_FLAG_ARCH_TXT))
+	if (!(slaunch_get_flags() & SL_FLAG_ACTIVE))
 		return 0;
 
-	txt = ioremap(TXT_PRIV_CONFIG_REGS_BASE, TXT_NR_CONFIG_PAGES *
-		      PAGE_SIZE);
-	if (!txt)
-		panic("Error ioremap of TXT priv registers\n");
+	if (slaunch_get_flags() & SL_FLAG_ARCH_TXT) {
+		txt = ioremap(TXT_PRIV_CONFIG_REGS_BASE, TXT_NR_CONFIG_PAGES *
+			      PAGE_SIZE);
+		if (!txt)
+			panic("Error ioremap of TXT priv registers\n");
+
+		slaunch_txt_evtlog(txt);
+
+		slaunch_pcr_extend(txt);
+
+		iounmap(txt);
+
+		pr_info("TXT Secure Launch module setup\n");
+	} else if (slaunch_get_flags() & SL_FLAG_ARCH_SKINIT) {
+		slaunch_skinit_evtlog();
+
+		slaunch_pcr_extend(NULL);
+
+		pr_info("SKINIT Secure Launch module setup\n");
+	} else
+		panic("Secure Launch unknown architecture\n");
 
-	/* Only Intel TXT is supported at this point */
-	slaunch_intel_evtlog(txt);
-	slaunch_pcr_extend(txt);
-	iounmap(txt);
 
 	return slaunch_expose_securityfs();
 }
-- 
2.49.0

