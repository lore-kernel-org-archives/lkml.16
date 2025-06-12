Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B0822423F
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 10:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749723205; cv=none; b=lL96vbwN4sQICadA2sYi/UiEpBb0t63wvZrGLk0gh3HjEfwhP/ltmq6qa4uB5Urccpf+6NXndonE0Hc/yKZYgHhKzjFCpAJaXJgVKJiQCY0fhJvKazsHcHtoLE/INgsGXf4osYAudToqSrz2xfedlRzPfl30Mn0vsi1BBRQ3imE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749723205; c=relaxed/simple;
	bh=8kxhZGBbItn7x9p6TcW2nt+AMJowocw09GOLimPRAz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pec1T5tXgacLPVJ5o7x8aq+sJNj3KfSN9iVsP5Aka+IeQZU6x1neHrtC84fGqHftGGv+NyvfxlaFgDRq9/u9Oe4P5apAymjqrGn5k9hFNV5mgalemTMBXZkjipbHaqVpEJlabHmar6c6F51OndV1g2QiTrqHQxDhNNGsqHRreFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=2Y6DZcm8; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=URkGF5IL; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=2Y6DZcm8; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=URkGF5IL; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="2Y6DZcm8";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="URkGF5IL";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="2Y6DZcm8";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="URkGF5IL"
Received: from localhost (unknown [10.100.12.32])
	by smtp-out1.suse.de (Postfix) with ESMTP id 78A55216E9;
	Thu, 12 Jun 2025 10:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1749723201; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=g24iCuBgnf69Wxs7HVa4iyoKJrN0liDJWTVQxQRyNuA=;
	b=2Y6DZcm8/U+xngQNmUWpPVd7eh7VLf+NrHtV1/7FJuP45xGX4NRutsNjRL9y2RhjSPmsQJ
	JAlsvtWUHtrFV26HkqCFGcXXNm5AivabxfgtBTSFVvn+WgxidJ4EBpH2DrYAWfIgrlKmiX
	ew0JzZTEkVO5KyjcJCfHAsqo9/lu8AE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1749723201;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=g24iCuBgnf69Wxs7HVa4iyoKJrN0liDJWTVQxQRyNuA=;
	b=URkGF5ILWOQE4FfIQSCjFfskrwwQvF6AlrkkUwDzPkNw7vXnDMrwZbqyyB8VVeMFFG4z8y
	9T0SEDhOaHwvLRDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1749723201; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=g24iCuBgnf69Wxs7HVa4iyoKJrN0liDJWTVQxQRyNuA=;
	b=2Y6DZcm8/U+xngQNmUWpPVd7eh7VLf+NrHtV1/7FJuP45xGX4NRutsNjRL9y2RhjSPmsQJ
	JAlsvtWUHtrFV26HkqCFGcXXNm5AivabxfgtBTSFVvn+WgxidJ4EBpH2DrYAWfIgrlKmiX
	ew0JzZTEkVO5KyjcJCfHAsqo9/lu8AE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1749723201;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=g24iCuBgnf69Wxs7HVa4iyoKJrN0liDJWTVQxQRyNuA=;
	b=URkGF5ILWOQE4FfIQSCjFfskrwwQvF6AlrkkUwDzPkNw7vXnDMrwZbqyyB8VVeMFFG4z8y
	9T0SEDhOaHwvLRDg==
Date: Thu, 12 Jun 2025 12:13:21 +0200
From: Jiri Bohac <jbohac@suse.cz>
To: Baoquan He <bhe@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
	Dave Young <dyoung@redhat.com>, kexec@lists.infradead.org,
	akpm@linux-foundation.org
Cc: Philipp Rudo <prudo@redhat.com>, Donald Dutile <ddutile@redhat.com>,
	Pingfan Liu <piliu@redhat.com>, Tao Liu <ltao@redhat.com>,
	linux-kernel@vger.kernel.org,
	David Hildenbrand <dhildenb@redhat.com>,
	Michal Hocko <mhocko@suse.cz>
Subject: [PATCH v5 1/5] Add a new optional ",cma" suffix to the crashkernel=
 command line option
Message-ID: <aEqoQckgoTQNULnh@dwarf.suse.cz>
References: <aEqnxxfLZMllMC8I@dwarf.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEqnxxfLZMllMC8I@dwarf.suse.cz>
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.991];
	MIME_GOOD(-0.10)[text/plain];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	ARC_NA(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dwarf.suse.cz:mid,localhost:helo]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -4.30

Add a new cma_size parameter to parse_crashkernel().
When not NULL, call __parse_crashkernel to parse the CMA
reservation size from "crashkernel=size,cma" and store it
in cma_size.

Set cma_size to NULL in all calls to parse_crashkernel().

Signed-off-by: Jiri Bohac <jbohac@suse.cz>
---
 arch/arm/kernel/setup.c              |  2 +-
 arch/arm64/mm/init.c                 |  2 +-
 arch/loongarch/kernel/setup.c        |  2 +-
 arch/mips/kernel/setup.c             |  2 +-
 arch/powerpc/kernel/fadump.c         |  2 +-
 arch/powerpc/kexec/core.c            |  2 +-
 arch/powerpc/mm/nohash/kaslr_booke.c |  2 +-
 arch/riscv/mm/init.c                 |  2 +-
 arch/s390/kernel/setup.c             |  2 +-
 arch/sh/kernel/machine_kexec.c       |  2 +-
 arch/x86/kernel/setup.c              |  2 +-
 include/linux/crash_reserve.h        |  3 ++-
 kernel/crash_reserve.c               | 16 ++++++++++++++--
 13 files changed, 27 insertions(+), 14 deletions(-)

diff --git a/arch/arm/kernel/setup.c b/arch/arm/kernel/setup.c
index a41c93988d2c..0bfd66c7ada0 100644
--- a/arch/arm/kernel/setup.c
+++ b/arch/arm/kernel/setup.c
@@ -1004,7 +1004,7 @@ static void __init reserve_crashkernel(void)
 	total_mem = get_total_mem();
 	ret = parse_crashkernel(boot_command_line, total_mem,
 				&crash_size, &crash_base,
-				NULL, NULL);
+				NULL, NULL, NULL);
 	/* invalid value specified or crashkernel=0 */
 	if (ret || !crash_size)
 		return;
diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index 0c8c35dd645e..ea84a61ed508 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -106,7 +106,7 @@ static void __init arch_reserve_crashkernel(void)
 
 	ret = parse_crashkernel(boot_command_line, memblock_phys_mem_size(),
 				&crash_size, &crash_base,
-				&low_size, &high);
+				&low_size, NULL, &high);
 	if (ret)
 		return;
 
diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.c
index b99fbb388fe0..22b27cd447a1 100644
--- a/arch/loongarch/kernel/setup.c
+++ b/arch/loongarch/kernel/setup.c
@@ -265,7 +265,7 @@ static void __init arch_reserve_crashkernel(void)
 		return;
 
 	ret = parse_crashkernel(boot_command_line, memblock_phys_mem_size(),
-				&crash_size, &crash_base, &low_size, &high);
+				&crash_size, &crash_base, &low_size, NULL, &high);
 	if (ret)
 		return;
 
diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index fbfe0771317e..11b9b6b63e19 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -458,7 +458,7 @@ static void __init mips_parse_crashkernel(void)
 	total_mem = memblock_phys_mem_size();
 	ret = parse_crashkernel(boot_command_line, total_mem,
 				&crash_size, &crash_base,
-				NULL, NULL);
+				NULL, NULL, NULL);
 	if (ret != 0 || crash_size <= 0)
 		return;
 
diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 8ca49e40c473..28cab25d5b33 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -333,7 +333,7 @@ static __init u64 fadump_calculate_reserve_size(void)
 	 * memory at a predefined offset.
 	 */
 	ret = parse_crashkernel(boot_command_line, memblock_phys_mem_size(),
-				&size, &base, NULL, NULL);
+				&size, &base, NULL, NULL, NULL);
 	if (ret == 0 && size > 0) {
 		unsigned long max_size;
 
diff --git a/arch/powerpc/kexec/core.c b/arch/powerpc/kexec/core.c
index 00e9c267b912..d1a2d755381c 100644
--- a/arch/powerpc/kexec/core.c
+++ b/arch/powerpc/kexec/core.c
@@ -110,7 +110,7 @@ void __init arch_reserve_crashkernel(void)
 
 	/* use common parsing */
 	ret = parse_crashkernel(boot_command_line, total_mem_sz, &crash_size,
-				&crash_base, NULL, NULL);
+				&crash_base, NULL, NULL, NULL);
 
 	if (ret)
 		return;
diff --git a/arch/powerpc/mm/nohash/kaslr_booke.c b/arch/powerpc/mm/nohash/kaslr_booke.c
index 5c8d1bb98b3e..5e4897daaaea 100644
--- a/arch/powerpc/mm/nohash/kaslr_booke.c
+++ b/arch/powerpc/mm/nohash/kaslr_booke.c
@@ -178,7 +178,7 @@ static void __init get_crash_kernel(void *fdt, unsigned long size)
 	int ret;
 
 	ret = parse_crashkernel(boot_command_line, size, &crash_size,
-				&crash_base, NULL, NULL);
+				&crash_base, NULL, NULL, NULL);
 	if (ret != 0 || crash_size == 0)
 		return;
 	if (crash_base == 0)
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index ab475ec6ca42..3f272aff2cf1 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1402,7 +1402,7 @@ static void __init arch_reserve_crashkernel(void)
 
 	ret = parse_crashkernel(boot_command_line, memblock_phys_mem_size(),
 				&crash_size, &crash_base,
-				&low_size, &high);
+				&low_size, NULL, &high);
 	if (ret)
 		return;
 
diff --git a/arch/s390/kernel/setup.c b/arch/s390/kernel/setup.c
index f244c5560e7f..b99aeb0db2ee 100644
--- a/arch/s390/kernel/setup.c
+++ b/arch/s390/kernel/setup.c
@@ -605,7 +605,7 @@ static void __init reserve_crashkernel(void)
 	int rc;
 
 	rc = parse_crashkernel(boot_command_line, ident_map_size,
-			       &crash_size, &crash_base, NULL, NULL);
+			       &crash_size, &crash_base, NULL, NULL, NULL);
 
 	crash_base = ALIGN(crash_base, KEXEC_CRASH_MEM_ALIGN);
 	crash_size = ALIGN(crash_size, KEXEC_CRASH_MEM_ALIGN);
diff --git a/arch/sh/kernel/machine_kexec.c b/arch/sh/kernel/machine_kexec.c
index 8321b31d2e19..37073ca1e0ad 100644
--- a/arch/sh/kernel/machine_kexec.c
+++ b/arch/sh/kernel/machine_kexec.c
@@ -146,7 +146,7 @@ void __init reserve_crashkernel(void)
 		return;
 
 	ret = parse_crashkernel(boot_command_line, memblock_phys_mem_size(),
-			&crash_size, &crash_base, NULL, NULL);
+			&crash_size, &crash_base, NULL, NULL, NULL);
 	if (ret == 0 && crash_size > 0) {
 		crashk_res.start = crash_base;
 		crashk_res.end = crash_base + crash_size - 1;
diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index 7d9ed79a93c0..870b06571b2e 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -582,7 +582,7 @@ static void __init arch_reserve_crashkernel(void)
 
 	ret = parse_crashkernel(boot_command_line, memblock_phys_mem_size(),
 				&crash_size, &crash_base,
-				&low_size, &high);
+				&low_size, NULL, &high);
 	if (ret)
 		return;
 
diff --git a/include/linux/crash_reserve.h b/include/linux/crash_reserve.h
index 1fe7e7d1b214..e784aaff2f5a 100644
--- a/include/linux/crash_reserve.h
+++ b/include/linux/crash_reserve.h
@@ -16,7 +16,8 @@ extern struct resource crashk_low_res;
 
 int __init parse_crashkernel(char *cmdline, unsigned long long system_ram,
 		unsigned long long *crash_size, unsigned long long *crash_base,
-		unsigned long long *low_size, bool *high);
+		unsigned long long *low_size, unsigned long long *cma_size,
+		bool *high);
 
 #ifdef CONFIG_ARCH_HAS_GENERIC_CRASHKERNEL_RESERVATION
 #ifndef DEFAULT_CRASH_KERNEL_LOW_SIZE
diff --git a/kernel/crash_reserve.c b/kernel/crash_reserve.c
index aff7c0fdbefa..a8861f3f64fe 100644
--- a/kernel/crash_reserve.c
+++ b/kernel/crash_reserve.c
@@ -172,17 +172,19 @@ static int __init parse_crashkernel_simple(char *cmdline,
 
 #define SUFFIX_HIGH 0
 #define SUFFIX_LOW  1
-#define SUFFIX_NULL 2
+#define SUFFIX_CMA  2
+#define SUFFIX_NULL 3
 static __initdata char *suffix_tbl[] = {
 	[SUFFIX_HIGH] = ",high",
 	[SUFFIX_LOW]  = ",low",
+	[SUFFIX_CMA]  = ",cma",
 	[SUFFIX_NULL] = NULL,
 };
 
 /*
  * That function parses "suffix"  crashkernel command lines like
  *
- *	crashkernel=size,[high|low]
+ *	crashkernel=size,[high|low|cma]
  *
  * It returns 0 on success and -EINVAL on failure.
  */
@@ -298,9 +300,11 @@ int __init parse_crashkernel(char *cmdline,
 			     unsigned long long *crash_size,
 			     unsigned long long *crash_base,
 			     unsigned long long *low_size,
+			     unsigned long long *cma_size,
 			     bool *high)
 {
 	int ret;
+	unsigned long long __always_unused cma_base;
 
 	/* crashkernel=X[@offset] */
 	ret = __parse_crashkernel(cmdline, system_ram, crash_size,
@@ -331,6 +335,14 @@ int __init parse_crashkernel(char *cmdline,
 
 		*high = true;
 	}
+
+	/*
+	 * optional CMA reservation
+	 * cma_base is ignored
+	 */
+	if (cma_size)
+		__parse_crashkernel(cmdline, 0, cma_size,
+			&cma_base, suffix_tbl[SUFFIX_CMA]);
 #endif
 	if (!*crash_size)
 		ret = -EINVAL;

-- 
Jiri Bohac <jbohac@suse.cz>
SUSE Labs, Prague, Czechia

