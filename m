Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DD71DF723
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 10:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749723607; cv=none; b=pdrw6hyupnOpmYwKY+cZu1ZxOYo59M2gyuRFANTRD2eabODZBZW2B0YRCbPt0lTtG9iopeRtGVp4cIwq0fg/VZq2nn6jima/GUTyeG/KLXRTKBagHvj2ZEry0bQFDvjJvQdh/V81GL9wd5kE1ZNQnoLn3dQHGHgBNz1iewgCWng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749723607; c=relaxed/simple;
	bh=M1HdI1UdW1uPTXNF/CbwATRvKWr0TJNW0GHxVpwYmEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R8hdmX453Bz2AhyeP9rrYEXYrQke4u+7onETuy4YqZhDvozv7O4I+UOs2rbmvVjxSuW2xwEeGLxLr3rAVeL2ZmBtCzUkKSiEsq6dsrVHkTN6jURuJJWzTl8zOy+XM0C6ncCouBBMg5ZqiCoMwlJKtZQOf/nM2xa5ZwfCF3ooZw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=OHifcYbm; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=TZXEjjGq; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=OHifcYbm; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=TZXEjjGq; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="OHifcYbm";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="TZXEjjGq";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="OHifcYbm";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="TZXEjjGq"
Received: from localhost (unknown [10.100.12.32])
	by smtp-out2.suse.de (Postfix) with ESMTP id 5410C1F78E;
	Thu, 12 Jun 2025 10:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1749723604; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uMbqOq33x3vOJ68EATwmEk6cpgBWsvmpKngMdwH5CO0=;
	b=OHifcYbm0bLg2w+WykvPSR9/xw6unhorPdiyUHwzmx1wn3JzITSLQgFVv8CJFJ/S2oScjP
	rUkpArApgGmaOJW0ZyOQUbMdG60IsIO3XHWzI71UxfYA57d0I2HM2Hl0C2inlWKiDQBbRJ
	hqHMiJSwgYHCCdE642kwDM8hkAidYfQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1749723604;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uMbqOq33x3vOJ68EATwmEk6cpgBWsvmpKngMdwH5CO0=;
	b=TZXEjjGqFo78YvVUZ6WXaMpGHKfR5HyuvP2DA2RrscuL2EeKeYKjD6SwZ5FzXu8ClweqQb
	Ca8DsGHbboXyltBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1749723604; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uMbqOq33x3vOJ68EATwmEk6cpgBWsvmpKngMdwH5CO0=;
	b=OHifcYbm0bLg2w+WykvPSR9/xw6unhorPdiyUHwzmx1wn3JzITSLQgFVv8CJFJ/S2oScjP
	rUkpArApgGmaOJW0ZyOQUbMdG60IsIO3XHWzI71UxfYA57d0I2HM2Hl0C2inlWKiDQBbRJ
	hqHMiJSwgYHCCdE642kwDM8hkAidYfQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1749723604;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uMbqOq33x3vOJ68EATwmEk6cpgBWsvmpKngMdwH5CO0=;
	b=TZXEjjGqFo78YvVUZ6WXaMpGHKfR5HyuvP2DA2RrscuL2EeKeYKjD6SwZ5FzXu8ClweqQb
	Ca8DsGHbboXyltBw==
Date: Thu, 12 Jun 2025 12:20:04 +0200
From: Jiri Bohac <jbohac@suse.cz>
To: Baoquan He <bhe@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
	Dave Young <dyoung@redhat.com>, kexec@lists.infradead.org,
	akpm@linux-foundation.org
Cc: Philipp Rudo <prudo@redhat.com>, Donald Dutile <ddutile@redhat.com>,
	Pingfan Liu <piliu@redhat.com>, Tao Liu <ltao@redhat.com>,
	linux-kernel@vger.kernel.org,
	David Hildenbrand <dhildenb@redhat.com>,
	Michal Hocko <mhocko@suse.cz>
Subject: [PATCH v5 5/5] x86: implement crashkernel cma reservation
Message-ID: <aEqp1LD2og4QeBw9@dwarf.suse.cz>
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
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[localhost:helo,dwarf.suse.cz:mid]
X-Spam-Level: 

Implement the crashkernel CMA reservation for x86:
- enable parsing of the cma suffix by parse_crashkernel()
- reserve memory with reserve_crashkernel_cma()
- add the CMA-reserved ranges to the e820 map for the crash kernel
- exclude the CMA-reserved ranges from vmcore

Signed-off-by: Jiri Bohac <jbohac@suse.cz>
---
 arch/x86/kernel/crash.c | 26 ++++++++++++++++++++++----
 arch/x86/kernel/setup.c |  5 +++--
 2 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kernel/crash.c b/arch/x86/kernel/crash.c
index 0be61c45400c..670aa9b8b0f8 100644
--- a/arch/x86/kernel/crash.c
+++ b/arch/x86/kernel/crash.c
@@ -163,10 +163,10 @@ static struct crash_mem *fill_up_crash_elf_data(void)
 		return NULL;
 
 	/*
-	 * Exclusion of crash region and/or crashk_low_res may cause
-	 * another range split. So add extra two slots here.
+	 * Exclusion of crash region, crashk_low_res and/or crashk_cma_ranges
+	 * may cause range splits. So add extra slots here.
 	 */
-	nr_ranges += 2;
+	nr_ranges += 2 + crashk_cma_cnt;
 	cmem = vzalloc(struct_size(cmem, ranges, nr_ranges));
 	if (!cmem)
 		return NULL;
@@ -184,6 +184,7 @@ static struct crash_mem *fill_up_crash_elf_data(void)
 static int elf_header_exclude_ranges(struct crash_mem *cmem)
 {
 	int ret = 0;
+	int i;
 
 	/* Exclude the low 1M because it is always reserved */
 	ret = crash_exclude_mem_range(cmem, 0, SZ_1M - 1);
@@ -198,8 +199,17 @@ static int elf_header_exclude_ranges(struct crash_mem *cmem)
 	if (crashk_low_res.end)
 		ret = crash_exclude_mem_range(cmem, crashk_low_res.start,
 					      crashk_low_res.end);
+	if (ret)
+		return ret;
 
-	return ret;
+	for (i = 0; i < crashk_cma_cnt; ++i) {
+		ret = crash_exclude_mem_range(cmem, crashk_cma_ranges[i].start,
+					      crashk_cma_ranges[i].end);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
 }
 
 static int prepare_elf64_ram_headers_callback(struct resource *res, void *arg)
@@ -352,6 +362,14 @@ int crash_setup_memmap_entries(struct kimage *image, struct boot_params *params)
 		add_e820_entry(params, &ei);
 	}
 
+	for (i = 0; i < crashk_cma_cnt; ++i) {
+		ei.addr = crashk_cma_ranges[i].start;
+		ei.size = crashk_cma_ranges[i].end -
+			  crashk_cma_ranges[i].start + 1;
+		ei.type = E820_TYPE_RAM;
+		add_e820_entry(params, &ei);
+	}
+
 out:
 	vfree(cmem);
 	return ret;
diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index 870b06571b2e..dcbeba344825 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -573,7 +573,7 @@ static void __init memblock_x86_reserve_range_setup_data(void)
 
 static void __init arch_reserve_crashkernel(void)
 {
-	unsigned long long crash_base, crash_size, low_size = 0;
+	unsigned long long crash_base, crash_size, low_size = 0, cma_size = 0;
 	bool high = false;
 	int ret;
 
@@ -582,7 +582,7 @@ static void __init arch_reserve_crashkernel(void)
 
 	ret = parse_crashkernel(boot_command_line, memblock_phys_mem_size(),
 				&crash_size, &crash_base,
-				&low_size, NULL, &high);
+				&low_size, &cma_size, &high);
 	if (ret)
 		return;
 
@@ -592,6 +592,7 @@ static void __init arch_reserve_crashkernel(void)
 	}
 
 	reserve_crashkernel_generic(crash_size, crash_base, low_size, high);
+	reserve_crashkernel_cma(cma_size);
 }
 
 static struct resource standard_io_resources[] = {


-- 
Jiri Bohac <jbohac@suse.cz>
SUSE Labs, Prague, Czechia


