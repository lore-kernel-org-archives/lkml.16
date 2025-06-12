Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25568199938
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 10:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749723403; cv=none; b=XG9bgPjqJ9qJVdmXGHvpn8d4d1DmJuUoZ+ISAX/4MpAIHgQkwKz6YFRvkFx2FbloR1gdDzucXMYFg3Ls3HU8AHvw8QZPTyDWXlf7krt7HwC+5A1pZI0qW+lKHkXKkp6W+j43Efws3pfnoLGAotNKEvTMNueRGqXQ4toUnE2GA3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749723403; c=relaxed/simple;
	bh=3z1Gxms1hsCWaQfv2zZ0YvYdmuinnztXbscw4X76L6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IsWKWQGY01xSm+/PPNTXbs2sm5zAEUqLq2b1RvQoCx3XS6JO7mcrzNrLb5K3qGeAdfeaMsZDjy21CaYJDec8cl3rtXEOh+u7S1yvILezifA7ccEq3jbt8CTllUkPMCvtDy63QDgDLSBWY/lIVM2wxQcddJ5sLbCEIxuMOcCyUeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=k6p/ALhF; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=6dZSZLY2; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=k6p/ALhF; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=6dZSZLY2; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="k6p/ALhF";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="6dZSZLY2";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="k6p/ALhF";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="6dZSZLY2"
Received: from localhost (unknown [10.100.12.32])
	by smtp-out1.suse.de (Postfix) with ESMTP id 1FCB321990;
	Thu, 12 Jun 2025 10:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1749723399; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t0I69Q6okrmyzWr4g4aPQMY2okpT3dU9pMhNsbKY4CQ=;
	b=k6p/ALhF5HRPSo+BcrFp3uGnBwVOQK7ikDwiJCs9fJ6QLnPgPGwsIGgJOCygS1WHUtzSsn
	HbcEUdE26M3PQ3h+J5bo+9gF1BAJ+4np9zpgpLYkajpQ/xfesYeDeIH+UUzF1Dq5qmcVIL
	gNdiWmw234+hB0LDhI6NoZes9fKapmA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1749723399;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t0I69Q6okrmyzWr4g4aPQMY2okpT3dU9pMhNsbKY4CQ=;
	b=6dZSZLY2h3uqjIRKqk+K6mMc//YiUkR8WcZADFOETmuSblqTy7TT4X3EuAjxrxpMhtKkCs
	GyUdnKVG37ywPGCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1749723399; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t0I69Q6okrmyzWr4g4aPQMY2okpT3dU9pMhNsbKY4CQ=;
	b=k6p/ALhF5HRPSo+BcrFp3uGnBwVOQK7ikDwiJCs9fJ6QLnPgPGwsIGgJOCygS1WHUtzSsn
	HbcEUdE26M3PQ3h+J5bo+9gF1BAJ+4np9zpgpLYkajpQ/xfesYeDeIH+UUzF1Dq5qmcVIL
	gNdiWmw234+hB0LDhI6NoZes9fKapmA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1749723399;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t0I69Q6okrmyzWr4g4aPQMY2okpT3dU9pMhNsbKY4CQ=;
	b=6dZSZLY2h3uqjIRKqk+K6mMc//YiUkR8WcZADFOETmuSblqTy7TT4X3EuAjxrxpMhtKkCs
	GyUdnKVG37ywPGCQ==
Date: Thu, 12 Jun 2025 12:16:39 +0200
From: Jiri Bohac <jbohac@suse.cz>
To: Baoquan He <bhe@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
	Dave Young <dyoung@redhat.com>, kexec@lists.infradead.org,
	akpm@linux-foundation.org
Cc: Philipp Rudo <prudo@redhat.com>, Donald Dutile <ddutile@redhat.com>,
	Pingfan Liu <piliu@redhat.com>, Tao Liu <ltao@redhat.com>,
	linux-kernel@vger.kernel.org,
	David Hildenbrand <dhildenb@redhat.com>,
	Michal Hocko <mhocko@suse.cz>
Subject: [PATCH v5 2/5] kdump: implement reserve_crashkernel_cma
Message-ID: <aEqpBwOy_ekm0gw9@dwarf.suse.cz>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[dwarf.suse.cz:mid,localhost:helo]
X-Spam-Level: 

reserve_crashkernel_cma() reserves CMA ranges for the
crash kernel. If allocating the requested size fails,
try to reserve in smaller blocks.

Store the reserved ranges in the crashk_cma_ranges array
and the number of ranges in crashk_cma_cnt.

Signed-off-by: Jiri Bohac <jbohac@suse.cz>

---
Changes since v3:
- make reserve_crashkernel_cma() return early when cma_size == 0
  to avoid printing out the 0 cma-allocated size

---
 include/linux/crash_reserve.h | 12 ++++++++
 kernel/crash_reserve.c        | 52 +++++++++++++++++++++++++++++++++++
 2 files changed, 64 insertions(+)

diff --git a/include/linux/crash_reserve.h b/include/linux/crash_reserve.h
index e784aaff2f5a..7b44b41d0a20 100644
--- a/include/linux/crash_reserve.h
+++ b/include/linux/crash_reserve.h
@@ -13,12 +13,24 @@
  */
 extern struct resource crashk_res;
 extern struct resource crashk_low_res;
+extern struct range crashk_cma_ranges[];
+#if defined(CONFIG_CMA) && defined(CONFIG_ARCH_HAS_GENERIC_CRASHKERNEL_RESERVATION)
+#define CRASHKERNEL_CMA
+#define CRASHKERNEL_CMA_RANGES_MAX 4
+extern int crashk_cma_cnt;
+#else
+#define crashk_cma_cnt 0
+#define CRASHKERNEL_CMA_RANGES_MAX 0
+#endif
+
 
 int __init parse_crashkernel(char *cmdline, unsigned long long system_ram,
 		unsigned long long *crash_size, unsigned long long *crash_base,
 		unsigned long long *low_size, unsigned long long *cma_size,
 		bool *high);
 
+void __init reserve_crashkernel_cma(unsigned long long cma_size);
+
 #ifdef CONFIG_ARCH_HAS_GENERIC_CRASHKERNEL_RESERVATION
 #ifndef DEFAULT_CRASH_KERNEL_LOW_SIZE
 #define DEFAULT_CRASH_KERNEL_LOW_SIZE	(128UL << 20)
diff --git a/kernel/crash_reserve.c b/kernel/crash_reserve.c
index a8861f3f64fe..ae32ea707678 100644
--- a/kernel/crash_reserve.c
+++ b/kernel/crash_reserve.c
@@ -14,6 +14,8 @@
 #include <linux/cpuhotplug.h>
 #include <linux/memblock.h>
 #include <linux/kmemleak.h>
+#include <linux/cma.h>
+#include <linux/crash_reserve.h>
 
 #include <asm/page.h>
 #include <asm/sections.h>
@@ -469,6 +471,56 @@ void __init reserve_crashkernel_generic(unsigned long long crash_size,
 #endif
 }
 
+struct range crashk_cma_ranges[CRASHKERNEL_CMA_RANGES_MAX];
+#ifdef CRASHKERNEL_CMA
+int crashk_cma_cnt;
+void __init reserve_crashkernel_cma(unsigned long long cma_size)
+{
+	unsigned long long request_size = roundup(cma_size, PAGE_SIZE);
+	unsigned long long reserved_size = 0;
+
+	if (!cma_size)
+		return;
+
+	while (cma_size > reserved_size &&
+	       crashk_cma_cnt < CRASHKERNEL_CMA_RANGES_MAX) {
+
+		struct cma *res;
+
+		if (cma_declare_contiguous(0, request_size, 0, 0, 0, false,
+				       "crashkernel", &res)) {
+			/* reservation failed, try half-sized blocks */
+			if (request_size <= PAGE_SIZE)
+				break;
+
+			request_size = roundup(request_size / 2, PAGE_SIZE);
+			continue;
+		}
+
+		crashk_cma_ranges[crashk_cma_cnt].start = cma_get_base(res);
+		crashk_cma_ranges[crashk_cma_cnt].end =
+			crashk_cma_ranges[crashk_cma_cnt].start +
+			cma_get_size(res) - 1;
+		++crashk_cma_cnt;
+		reserved_size += request_size;
+	}
+
+	if (cma_size > reserved_size)
+		pr_warn("crashkernel CMA reservation failed: %lld MB requested, %lld MB reserved in %d ranges\n",
+			cma_size >> 20, reserved_size >> 20, crashk_cma_cnt);
+	else
+		pr_info("crashkernel CMA reserved: %lld MB in %d ranges\n",
+			reserved_size >> 20, crashk_cma_cnt);
+}
+
+#else /* CRASHKERNEL_CMA */
+void __init reserve_crashkernel_cma(unsigned long long cma_size)
+{
+	if (cma_size)
+		pr_warn("crashkernel CMA reservation not supported\n");
+}
+#endif
+
 #ifndef HAVE_ARCH_ADD_CRASH_RES_TO_IOMEM_EARLY
 static __init int insert_crashkernel_resources(void)
 {

-- 
Jiri Bohac <jbohac@suse.cz>
SUSE Labs, Prague, Czechia


