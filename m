Received: from 17.mo582.mail-out.ovh.net (17.mo582.mail-out.ovh.net [46.105.36.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8371DC9B0
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 23:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.105.36.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746054236; cv=none; b=CJkuW0rlfFSImpbqdZMuN4E6OXPttwhLUUhAc9VCOlOUIgidhp3TqToO4vlQbWLRMHs9P+6h8qJmzCLYuwiPFKQ0Pa3hZCyn1X41U8NzRoqX6YFLgtLrmRpwCMwA9VjConwaLuRB9kLzVuq/OppcFjM/uXcskozMJQfX3WVsPO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746054236; c=relaxed/simple;
	bh=A3qyNpgIhJdTErPTMjoTewRqqr5w/st8rXbErG+JDbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=foNuvfqW7oc9JjQM2tDH0TKhwuBTl3UQAYec/isC5uNC21QfzyyolK1Dt6Gcjb7eFS2i3p08ojiE0RGyACkOyDChUuQG6pXiubrz1XnVxpH11+mhCUpRFxWo4ESGeApp2gbXukbwVvMEb5b/K3vcGka72Y1Q1qBGdF8VOYvB7dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com; spf=pass smtp.mailfrom=3mdeb.com; dkim=pass (2048-bit key) header.d=3mdeb.com header.i=@3mdeb.com header.b=J1TK5DX5; arc=none smtp.client-ip=46.105.36.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=3mdeb.com header.i=@3mdeb.com header.b="J1TK5DX5"
Received: from director1.ghost.mail-out.ovh.net (unknown [10.109.148.106])
	by mo582.mail-out.ovh.net (Postfix) with ESMTP id 4ZnshR51P8z1PG0
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 22:45:11 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-bt6hd (unknown [10.110.188.136])
	by director1.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 5CFD11FD61;
	Wed, 30 Apr 2025 22:45:11 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.108])
	by ghost-submission-5b5ff79f4f-bt6hd with ESMTPSA
	id ejsPCvenEmgevisAyP1w0w
	(envelope-from <sergii.dmytruk@3mdeb.com>); Wed, 30 Apr 2025 22:45:11 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-108S002c0a7c6fa-a18a-4bd0-a5dd-c1144deb985f,
                    7FFE21389DDF989CCD6FB7268846A7FDE11993D7) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.181.178
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: linux-kernel@vger.kernel.org
Cc: trenchboot-devel@googlegroups.com
Subject: [RFC PATCH v2 3/9] x86: Secure Launch main header file AMD support
Date: Thu,  1 May 2025 01:44:45 +0300
Message-ID: <f856478803635d0b1efbd95e66c43b9c3808e4fc.1746037489.git.sergii.dmytruk@3mdeb.com>
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
X-Ovh-Tracer-Id: 12103142526215632028
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieejleefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepufgvrhhgihhiucffmhihthhruhhkuceoshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeegkeffieeitdevkefhudegffevieeggfelgedvgeehffdtteehfeeuleeiudekvdenucfkphepuddvjedrtddrtddruddpudejiedrudduuddrudekuddrudejkedpfeejrdehledrudegvddruddtkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehkedvmgdpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=Z/g7dNV0WLxS81SLsZO/TkyYRGI2634tQDHJNCpmxUQ=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1746053111; v=1;
 b=J1TK5DX5XE/LXIqW2zKDsmvlbknl5B+qS0GVjKmmesCUcdSe1h61t3x7b5zEQlUvDKDmxywu
 TTgDFjaNBiJmJP8gVlDw5b8PZabbhAhMBo3Tguj/cgYabkD2vOnUA/Oo31ifVNqC0h3si+ae8jw
 1vaA5t32nAc1ydg0MLLbqLOzINKYchqmrk1S8GWzWhBNnj6HZHxohKPQxL7jfOY3QnAQB9WPdrz
 yezwbvu7feW027dFDzKZfJNwFfVJXLNKVbZvyvpJ1aCgC8By3dpN51zA4PX/xElTEOc26WBCMTj
 fPQ0UYU9ofsjtG4NI8SSfSW0Jl2sMANiOkvZ6NBX1Z5MA==

From: Ross Philipson <ross.philipson@oracle.com>

Add additional Secure Launch definitions and declarations for AMD/SKINIT
support.

Use a single implementation of slaunch_is_txt_launch(),
slaunch_get_flags() returns to 0 if Secure Launch support isn't enabled.

Signed-off-by: Ross Philipson <ross.philipson@oracle.com>
Signed-off-by: Michał Żygowski <michal.zygowski@3mdeb.com>
Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
---
 include/linux/slaunch.h | 81 +++++++++++++++++++++++++++++++++++------
 1 file changed, 70 insertions(+), 11 deletions(-)

diff --git a/include/linux/slaunch.h b/include/linux/slaunch.h
index ae67314c2aad..ec7e0d736a03 100644
--- a/include/linux/slaunch.h
+++ b/include/linux/slaunch.h
@@ -14,11 +14,14 @@
  */
 #define SL_FLAG_ACTIVE		0x00000001
 #define SL_FLAG_ARCH_TXT	0x00000002
+#define SL_FLAG_ARCH_SKINIT	0x00000004
+#define SL_FLAG_SKINIT_PSP	0x00000008
 
 /*
  * Secure Launch CPU Type
  */
 #define SL_CPU_INTEL	1
+#define SL_CPU_AMD	2
 
 #define __SL32_CS	0x0008
 #define __SL32_DS	0x0010
@@ -146,6 +149,8 @@
 #define SL_ERROR_INVALID_SLRT		0xc0008022
 #define SL_ERROR_SLRT_MISSING_ENTRY	0xc0008023
 #define SL_ERROR_SLRT_MAP		0xc0008024
+#define SL_ERROR_MISSING_EVENT_LOG	0xc0008025
+#define SL_ERROR_MAP_SETUP_DATA		0xc0008026
 
 /*
  * Secure Launch Defined Limits
@@ -325,9 +330,25 @@ struct smx_rlp_mle_join {
 	u32 rlp_entry_point; /* phys addr */
 } __packed;
 
+/* The TCG original Spec ID structure defined for TPM 1.2 */
+#define TCG_SPECID_SIG00 "Spec ID Event00"
+
+struct tpm_tcg_specid_event_head {
+	char signature[16];
+	u32  platform_class;
+	u8   spec_ver_minor;
+	u8   spec_ver_major;
+	u8   errata;
+	u8   uintn_size;	/* reserved (must be 0) for 1.21 */
+	u8   vendor_info_size;
+	/* vendor_info[]; */
+} __packed;
+
 /*
- * TPM event log structures defined in both the TXT specification and
- * the TCG documentation.
+ * TPM event log structures defined by the TXT specification derived
+ * from the TCG documentation. For TXT this is setup as the conainter
+ * header. On AMD this header is embedded in to vendor information
+ * after the TCG spec ID header.
  */
 #define TPM_EVTLOG_SIGNATURE "TXT Event Container"
 
@@ -344,6 +365,25 @@ struct tpm_event_log_header {
 	/* PCREvents[] */
 } __packed;
 
+/* TPM Event Log Size Macros */
+#define TCG_PCClientSpecIDEventStruct_SIZE			\
+		(sizeof(struct tpm_tcg_specid_event_head))
+#define TCG_EfiSpecIdEvent_SIZE(n) \
+		((n) * sizeof(struct tcg_efi_specid_event_algs)	\
+		 + sizeof(struct tcg_efi_specid_event_head)	\
+		 + sizeof(u8) /* vendorInfoSize */)
+#define TPM2_HASH_COUNT(base) (*((u32 *)(base)			\
+		+ (offsetof(struct tcg_efi_specid_event_head, num_algs) >> 2)))
+
+/* AMD Specific Structures and Definitions */
+struct sl_header {
+	u16 skl_entry_point;
+	u16 length;
+	u8 reserved[62];
+	u16 skl_info_offset;
+	u16 bootloader_data_offset;
+} __packed;
+
 /*
  * Functions to extract data from the Intel TXT Heap Memory. The layout
  * of the heap is as follows:
@@ -512,16 +552,14 @@ void slaunch_fixup_jump_vector(void);
 u32 slaunch_get_flags(void);
 struct sl_ap_wake_info *slaunch_get_ap_wake_info(void);
 struct acpi_table_header *slaunch_get_dmar_table(struct acpi_table_header *dmar);
+void slaunch_cpu_setup_skinit(void);
+void __noreturn slaunch_skinit_reset(const char *msg, u64 error);
 void __noreturn slaunch_txt_reset(void __iomem *txt,
 					 const char *msg, u64 error);
 void slaunch_finalize(int do_sexit);
-
-static inline bool slaunch_is_txt_launch(void)
-{
-	u32 mask = SL_FLAG_ACTIVE | SL_FLAG_ARCH_TXT;
-
-	return (slaunch_get_flags() & mask) == mask;
-}
+bool slaunch_psp_tmr_release(void);
+void slaunch_psp_setup(void);
+void slaunch_psp_finalize(void);
 
 #else
 
@@ -529,6 +567,10 @@ static inline void slaunch_setup_txt(void)
 {
 }
 
+static inline void slaunch_cpu_setup_skinit(void)
+{
+}
+
 static inline void slaunch_fixup_jump_vector(void)
 {
 }
@@ -545,14 +587,31 @@ static inline struct acpi_table_header *slaunch_get_dmar_table(struct acpi_table
 
 static inline void slaunch_finalize(int do_sexit)
 {
+	(void)do_sexit;
 }
 
+#endif /* !IS_ENABLED(CONFIG_SECURE_LAUNCH) */
+
 static inline bool slaunch_is_txt_launch(void)
 {
-	return false;
+	u32 mask = SL_FLAG_ACTIVE | SL_FLAG_ARCH_TXT;
+
+	return (slaunch_get_flags() & mask) == mask;
 }
 
-#endif /* !IS_ENABLED(CONFIG_SECURE_LAUNCH) */
+static inline bool slaunch_is_skinit_launch(void)
+{
+	u32 mask = SL_FLAG_ACTIVE | SL_FLAG_ARCH_SKINIT;
+
+	return (slaunch_get_flags() & mask) == mask;
+}
+
+static inline bool slaunch_is_skinit_psp(void)
+{
+	u32 mask = SL_FLAG_ACTIVE | SL_FLAG_ARCH_SKINIT | SL_FLAG_SKINIT_PSP;
+
+	return (slaunch_get_flags() & mask) == mask;
+}
 
 #endif /* !__ASSEMBLY */
 
-- 
2.49.0

