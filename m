Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D0C20E6F9
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 20:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748636830; cv=none; b=dj67lwJmq+nkZ7gMMy9vpARwlck9iLJyVXOxEC8mhhoOth9QJp6AGbABGy4QC+dQzl91eOGxUfCVloiycthOUXkOctk5eSeigEe6BAp2rI5bBBqGlne5HqA4ZEFIgN7OC1kjy7obunhiy58S+pztsTGqzxhGtAetMPIqiRJYRQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748636830; c=relaxed/simple;
	bh=3z1Gxms1hsCWaQfv2zZ0YvYdmuinnztXbscw4X76L6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tUR5J17PNnXrwPwI52AT78PUKaj8lm6CfGvhQtdI6AOxa1l4X4cbHxO5xzoaa9yYaYz/ngVQ3/e2rgP0g9KYgH4RmpuiHDxBFirRgxDp8Wyt2/FmaAJ3vJ0UE875JeKk5mV0ak9dSbd8h7F+EcnujD+Sk9QoQmFFzZqb1AUWbSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=JApzMjrz; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=YP9y+KOg; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=JApzMjrz; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=YP9y+KOg; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="JApzMjrz";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="YP9y+KOg";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="JApzMjrz";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="YP9y+KOg"
Received: from localhost (unknown [10.100.12.32])
	by smtp-out2.suse.de (Postfix) with ESMTP id 5E1141F45A;
	Fri, 30 May 2025 20:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1748636827; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t0I69Q6okrmyzWr4g4aPQMY2okpT3dU9pMhNsbKY4CQ=;
	b=JApzMjrzlQJ1gm6pBn2ay0DWLyXGYx64HjFpmd6tCyrNwDycKJ+GEEyK5Fp5SW/LoY7U/t
	nXL1UNKlDtzE0+In1FCP6m8pU9YbL6tPLn60aSxIMmeOWQBR1R/PtFOR2wVG3YGXgz6GLC
	IFVYg5xMCWEjGRx+OlWgnLlV3F+BzX8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1748636827;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t0I69Q6okrmyzWr4g4aPQMY2okpT3dU9pMhNsbKY4CQ=;
	b=YP9y+KOgjXTN+jwl60CXU7jg3LQX9V98148U8yNSYgd3e7mrXP1OhpJbZCTGshWKJvbSU/
	Nv2cw80tlFRQfpBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1748636827; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t0I69Q6okrmyzWr4g4aPQMY2okpT3dU9pMhNsbKY4CQ=;
	b=JApzMjrzlQJ1gm6pBn2ay0DWLyXGYx64HjFpmd6tCyrNwDycKJ+GEEyK5Fp5SW/LoY7U/t
	nXL1UNKlDtzE0+In1FCP6m8pU9YbL6tPLn60aSxIMmeOWQBR1R/PtFOR2wVG3YGXgz6GLC
	IFVYg5xMCWEjGRx+OlWgnLlV3F+BzX8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1748636827;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t0I69Q6okrmyzWr4g4aPQMY2okpT3dU9pMhNsbKY4CQ=;
	b=YP9y+KOgjXTN+jwl60CXU7jg3LQX9V98148U8yNSYgd3e7mrXP1OhpJbZCTGshWKJvbSU/
	Nv2cw80tlFRQfpBQ==
Date: Fri, 30 May 2025 22:27:07 +0200
From: Jiri Bohac <jbohac@suse.cz>
To: Baoquan He <bhe@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
	Dave Young <dyoung@redhat.com>, kexec@lists.infradead.org
Cc: Philipp Rudo <prudo@redhat.com>, Donald Dutile <ddutile@redhat.com>,
	Pingfan Liu <piliu@redhat.com>, Tao Liu <ltao@redhat.com>,
	linux-kernel@vger.kernel.org,
	David Hildenbrand <dhildenb@redhat.com>,
	Michal Hocko <mhocko@suse.cz>
Subject: [PATCH v4 2/5] kdump: implement reserve_crashkernel_cma
Message-ID: <aDoUm0BuD5zjBF4F@dwarf.suse.cz>
References: <aDoT08LfXUEkS9E4@dwarf.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDoT08LfXUEkS9E4@dwarf.suse.cz>
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_ZERO(0.00)[0];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	URIBL_BLOCKED(0.00)[localhost:helo,suse.cz:email,dwarf.suse.cz:mid];
	TO_DN_SOME(0.00)[]
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

