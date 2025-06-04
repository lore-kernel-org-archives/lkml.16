Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB4B320F
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 18:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749063571; cv=none; b=mHpLLqUtMCgNWYJs8v6JKn3+RLDMXteOaxuzzEiarRum2sM9gLh6qkIP/CKYXquk7+rephhWLvWSszCLEf2P5/iPFB3JUsnpnM1wrH6SGdB5kTt9uKgATRCwwBbBFzsuKzZBn8sRJIoBNigZIXZClbfV4mumeeIAAFA4jpvkSWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749063571; c=relaxed/simple;
	bh=OnuLuPC8HOVu0UKKHW6aPk3d0V97ZUFuKUG2ycpxDW0=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=ex7jFi3vVLBHdeIL//oOdPkN3zax9kiXZ/8mvFGYg0M5eDrF1FBUVsN6/w53/9HCJUHJzeSMKY5JR4b59N8BgMT2E3e7XmHeSRfwcMGyZFwyizVqiH5EjdLW8mIzGAxNIcP/7uOtafSkc2HKk2oqwkJC+/eweL23D7s44rqLQIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=neon.tech; spf=pass smtp.mailfrom=neon.tech; dkim=pass (1024-bit key) header.d=neon.tech header.i=@neon.tech header.b=hNxRaABa; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=neon.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neon.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=neon.tech header.i=@neon.tech header.b="hNxRaABa"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6020ff8d35dso515217a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 11:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neon.tech; s=google; t=1749063568; x=1749668368; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mbPxzU21pQPfeJMs7GIx2NLevJblWqGR9y+lEXFKe30=;
        b=hNxRaABaHhVLlvNgUHRQS7jeYULD3LhKqYEqA1KL1n7K8so/3Cnf1alxpRGqT+rDse
         FIXDNbTImHOrZvaa7grTFSMeZBgifEa0IW84qvZkqgPuDiBiQRx7lRuVh0rV60KJDOuW
         B6dAuJKjm4i+DY7uG+jQJCZOXp84U89Dtw4hw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749063568; x=1749668368;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mbPxzU21pQPfeJMs7GIx2NLevJblWqGR9y+lEXFKe30=;
        b=Bo4mPUQbockyFoUaRUJH1+uIit3w+Cd5RG9fTgGblGFDdjxPitK/awH3dwskVpesC6
         aPlvoUHHzWBR/1Kjf1nHYUkOj8c/a2tZudY4BEqr99n/6aakCiAQiJZ5L8DVddfxA2Dq
         E8CLuU4Av2FPIu7acJkDewE92VIxKpA+NpdEZpgK4Ymf6GebyGrV38Vnrq8ETHMatUph
         kDswYGYKOl2IXKS0Fh3d2tPbVt1T9xkNf7bZ0aEdXMBybVkjUd9RJoA98N9x5+L3LSOX
         +HG5Su8In+kWvmLWwBnwFJgntTtOIeGTz5mNnDAaQJwD5ADaFxuVeVS/32SMcsKnX0xn
         1CMA==
X-Gm-Message-State: AOJu0YytTzrGB3Ttg92auOsErkbhBK4NH9Hw8aR0nFaXu5jgc11pPMHT
	qwn0p9gtP5RfcZ64fEKYwh7FZaNCp2VLDUZkmVmKjQJUbLzEvVU8WO3l6pwx7AgAAHk6Fchz0Fb
	Rx3uHmGfbBg==
X-Gm-Gg: ASbGnctvyr0csQAhQGHgJoamtOK0k3mgya7EYLZfrqiFesXVPbWT5lF8/LnFWn/G3CM
	P5cDKePOuHTUcLdtrZtGHXkI5jkmW+EYeIe1+U1p3Fp5snuWXzk7OIv/zSslNY6CuNAoaQkxUyG
	X+bYWsfhD3qouCmhZec7IoYh5bapf8bCE37IoK2rxnVrSvQRFdlgLqoU4lfq2RjQqYp8fn4Aq7K
	MhkcIL1OFA3UWRe5TlmNOsPi+WdlKjLuNRTLi0PGOVOCd/2/mDkZa2rxi06JziSBa0wZDiut417
	kbErIMPbUCdbRcGcvZVqoLQBCkUki6cCfczwP4MId5JnxwvNEP4hkcg=
X-Google-Smtp-Source: AGHT+IEQeZeCMV1Xtu4bSCUf7oDNF/zCJS7/LznGabgtUBL2VZ1B89jxObEDiyV81YDvM9Ne5wnAzQ==
X-Received: by 2002:a05:6402:13c8:b0:602:53:cb06 with SMTP id 4fb4d7f45d1cf-60722a80206mr569998a12.17.1749063567520;
        Wed, 04 Jun 2025 11:59:27 -0700 (PDT)
Received: from [192.168.86.142] ([84.65.228.220])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60699731f06sm3326811a12.27.2025.06.04.11.59.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 11:59:27 -0700 (PDT)
Message-ID: <9f4c0972-a123-4cc3-89f2-ed3490371e65@neon.tech>
Date: Wed, 4 Jun 2025 19:59:25 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-kernel@vger.kernel.org, x86@kernel.org, linux-mm@kvack.org
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 Oleg Vasilev <oleg@neon.tech>, Arthur Petukhovsky <arthur@neon.tech>,
 Stefan Radig <stefan@neon.tech>, Misha Sakhnov <misha@neon.tech>
From: Em Sharnoff <sharnoff@neon.tech>
Subject: [PATCH] x86/mm: Handle alloc failure in phys_*_init()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

tl;dr:

* When setting up page table mappings for physical addresses after boot,
  alloc_low_page() uses GFP_ATOMIC, which is allowed to fail.
* This isn't currently handled, and results in a null pointer
  dereference when it occurs.
* This allocation failure can happen during memory hotplug.

To handle failure, change phys_pud_init() and similar functions to
return zero if allocation failed (either directly or transitively), and
convert that to -ENOMEM in arch_add_memory().

=== Background ===

We recently started observing these null pointer dereferences happening
in practice (albeit quite rarely), triggered by allocation failures
during virtio-mem hotplug.

We use virtio-mem quite heavily - adding/removing memory based on
resource usage of customer workloads across a fleet of VMs - so it's
somewhat expected that we have occasional allocation failures here, if
we run out of memory before hotplug takes place.

We started seeing this bug after upgrading from 6.6.64 to 6.12.26, but
there didn't appear to be relevant changes in the codepaths involved, so
we figured the upgrade was triggering a latent issue.

The possibility for this issue was also pointed out a while back:

> For alloc_low_pages(), I noticed the callers don’t check for allocation
> failure. I'm a little surprised that there haven't been reports of the
> allocation failing, because these operations could result in a lot more
> pages getting allocated way past boot, and failure causes a NULL
> pointer dereference.

https://lore.kernel.org/all/5aee7bcdf49b1c6b8ee902dd2abd9220169c694b.camel@intel.com/

For completeness, here's an example stack trace we saw (on 6.12.26):

  BUG: kernel NULL pointer dereference, address: 0000000000000000
  ....
  Call Trace:
   <TASK>
   phys_pud_init+0xa0/0x390
   phys_p4d_init+0x93/0x330
   __kernel_physical_mapping_init+0xa1/0x370
   kernel_physical_mapping_init+0xf/0x20
   init_memory_mapping+0x1fa/0x430
   arch_add_memory+0x2b/0x50
   add_memory_resource+0xe6/0x260
   add_memory_driver_managed+0x78/0xc0
   virtio_mem_add_memory+0x46/0xc0
   virtio_mem_sbm_plug_and_add_mb+0xa3/0x160
   virtio_mem_run_wq+0x1035/0x16c0
   process_one_work+0x17a/0x3c0
   worker_thread+0x2c5/0x3f0
   ? _raw_spin_unlock_irqrestore+0x9/0x30
   ? __pfx_worker_thread+0x10/0x10
   kthread+0xdc/0x110
   ? __pfx_kthread+0x10/0x10
   ret_from_fork+0x35/0x60
   ? __pfx_kthread+0x10/0x10
   ret_from_fork_asm+0x1a/0x30
   </TASK>

and the allocation failure preceding it:

  kworker/0:2: page allocation failure: order:0, mode:0x920(GFP_ATOMIC|__GFP_ZERO), nodemask=(null),cpuset=/,mems_allowed=0
  ...
  Call Trace:
   <TASK>
   dump_stack_lvl+0x5b/0x70
   dump_stack+0x10/0x20
   warn_alloc+0x103/0x180
   __alloc_pages_slowpath.constprop.0+0x738/0xf30
   __alloc_pages_noprof+0x1e9/0x340
   alloc_pages_mpol_noprof+0x47/0x100
   alloc_pages_noprof+0x4b/0x80
   get_free_pages_noprof+0xc/0x40
   alloc_low_pages+0xc2/0x150
   phys_pud_init+0x82/0x390
  ...

(everything from phys_pud_init and below was the same)

There's some additional context in a github issue we opened on our side:
https://github.com/neondatabase/autoscaling/issues/1391

=== Reproducing / Testing ===

I was able to partially reproduce the original issue we saw by
modifying phys_pud_init() to simulate alloc_low_page() returning null
after boot, and then doing memory hotplug to trigger the "failure".
Something roughly like:

  - pmd = alloc_low_page();
  + if (!after_bootmem)
  + 	pmd = alloc_low_page();
  + else
  + 	pmd = 0;

To test recovery, I also tried simulating just one alloc_low_page()
failure after boot. This change seemed to handle it at a basic level
(virito-mem hotplug succeeded with the right amount, after retrying),
but I didn't dig further.

We also plan to test this in our production environment (where we should
see the difference after a few days); as of 2025-06-04, we haven't yet
rolled that out.

=== Rationale ===

Note: This is the first time I'm looking at this code; please review
extra critically.

As far as I can tell:

1. phys_*_init() should not currently return zero
2. If phys_*_init() gives up partway through, subsequent retries will be
   able to continue from the progress so far.

So, it seems ok to give a zero return special meaning, and it seems like
this is something that can be gracefully handled with the code as it is.

Signed-off-by: Em Sharnoff <sharnoff@neon.tech>
---
 arch/x86/mm/init.c    |  6 +++++-
 arch/x86/mm/init_64.c | 50 +++++++++++++++++++++++++++++++++++++++----
 2 files changed, 51 insertions(+), 5 deletions(-)

diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
index bfa444a7dbb0..b90fe52a7d67 100644
--- a/arch/x86/mm/init.c
+++ b/arch/x86/mm/init.c
@@ -533,6 +533,7 @@ bool pfn_range_is_mapped(unsigned long start_pfn, unsigned long end_pfn)
  * Setup the direct mapping of the physical memory at PAGE_OFFSET.
  * This runs before bootmem is initialized and gets pages directly from
  * the physical memory. To access them they are temporarily mapped.
+ * Returns zero if allocation fails at any point.
  */
 unsigned long __ref init_memory_mapping(unsigned long start,
 					unsigned long end, pgprot_t prot)
@@ -547,10 +548,13 @@ unsigned long __ref init_memory_mapping(unsigned long start,
 	memset(mr, 0, sizeof(mr));
 	nr_range = split_mem_range(mr, 0, start, end);
 
-	for (i = 0; i < nr_range; i++)
+	for (i = 0; i < nr_range; i++) {
 		ret = kernel_physical_mapping_init(mr[i].start, mr[i].end,
 						   mr[i].page_size_mask,
 						   prot);
+		if (!ret)
+			return 0;
+	}
 
 	add_pfn_range_mapped(start >> PAGE_SHIFT, ret >> PAGE_SHIFT);
 
diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index 7c4f6f591f2b..1b0140b49371 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -502,7 +502,7 @@ phys_pte_init(pte_t *pte_page, unsigned long paddr, unsigned long paddr_end,
 /*
  * Create PMD level page table mapping for physical addresses. The virtual
  * and physical address have to be aligned at this level.
- * It returns the last physical address mapped.
+ * It returns the last physical address mapped, or zero if allocation failed.
  */
 static unsigned long __meminit
 phys_pmd_init(pmd_t *pmd_page, unsigned long paddr, unsigned long paddr_end,
@@ -572,7 +572,14 @@ phys_pmd_init(pmd_t *pmd_page, unsigned long paddr, unsigned long paddr_end,
 		}
 
 		pte = alloc_low_page();
+		if (!pte)
+			return 0;
 		paddr_last = phys_pte_init(pte, paddr, paddr_end, new_prot, init);
+		/*
+		 * phys_{ppmd,pud,p4d}_init return zero if allocation failed.
+		 * phys_pte_init makes no allocations, so should not return zero.
+		 */
+		BUG_ON(!paddr_last);
 
 		spin_lock(&init_mm.page_table_lock);
 		pmd_populate_kernel_init(&init_mm, pmd, pte, init);
@@ -586,7 +593,7 @@ phys_pmd_init(pmd_t *pmd_page, unsigned long paddr, unsigned long paddr_end,
  * Create PUD level page table mapping for physical addresses. The virtual
  * and physical address do not have to be aligned at this level. KASLR can
  * randomize virtual addresses up to this level.
- * It returns the last physical address mapped.
+ * It returns the last physical address mapped, or zero if allocation failed.
  */
 static unsigned long __meminit
 phys_pud_init(pud_t *pud_page, unsigned long paddr, unsigned long paddr_end,
@@ -623,6 +630,8 @@ phys_pud_init(pud_t *pud_page, unsigned long paddr, unsigned long paddr_end,
 							   paddr_end,
 							   page_size_mask,
 							   prot, init);
+				if (!paddr_last)
+					return 0;
 				continue;
 			}
 			/*
@@ -658,12 +667,22 @@ phys_pud_init(pud_t *pud_page, unsigned long paddr, unsigned long paddr_end,
 		}
 
 		pmd = alloc_low_page();
+		if (!pmd)
+			return 0;
 		paddr_last = phys_pmd_init(pmd, paddr, paddr_end,
 					   page_size_mask, prot, init);
 
+		/*
+		 * We might have !paddr_last if allocation failed, but we should still
+		 * update pud before bailing, so that subsequent retries can pick up on
+		 * progress (here and in phys_pmd_init) without leaking pmd.
+		 */
 		spin_lock(&init_mm.page_table_lock);
 		pud_populate_init(&init_mm, pud, pmd, init);
 		spin_unlock(&init_mm.page_table_lock);
+
+		if (!paddr_last)
+			return 0;
 	}
 
 	update_page_count(PG_LEVEL_1G, pages);
@@ -707,16 +726,26 @@ phys_p4d_init(p4d_t *p4d_page, unsigned long paddr, unsigned long paddr_end,
 			pud = pud_offset(p4d, 0);
 			paddr_last = phys_pud_init(pud, paddr, __pa(vaddr_end),
 					page_size_mask, prot, init);
+			if (!paddr_last)
+				return 0;
 			continue;
 		}
 
 		pud = alloc_low_page();
+		if (!pud)
+			return 0;
 		paddr_last = phys_pud_init(pud, paddr, __pa(vaddr_end),
 					   page_size_mask, prot, init);
 
 		spin_lock(&init_mm.page_table_lock);
 		p4d_populate_init(&init_mm, p4d, pud, init);
 		spin_unlock(&init_mm.page_table_lock);
+
+		/*
+		 * Bail only after updating p4d to keep progress from pud across retries.
+		 */
+		if (!paddr_last)
+			return 0;
 	}
 
 	return paddr_last;
@@ -748,10 +777,14 @@ __kernel_physical_mapping_init(unsigned long paddr_start,
 						   __pa(vaddr_end),
 						   page_size_mask,
 						   prot, init);
+			if (!paddr_last)
+				return 0;
 			continue;
 		}
 
 		p4d = alloc_low_page();
+		if (!p4d)
+			return 0;
 		paddr_last = phys_p4d_init(p4d, __pa(vaddr), __pa(vaddr_end),
 					   page_size_mask, prot, init);
 
@@ -763,6 +796,13 @@ __kernel_physical_mapping_init(unsigned long paddr_start,
 					  (pud_t *) p4d, init);
 
 		spin_unlock(&init_mm.page_table_lock);
+
+		/*
+		 * Bail only after updating pgd/p4d to keep progress from p4d across retries.
+		 */
+		if (!paddr_last)
+			return 0;
+
 		pgd_changed = true;
 	}
 
@@ -777,7 +817,8 @@ __kernel_physical_mapping_init(unsigned long paddr_start,
  * Create page table mapping for the physical memory for specific physical
  * addresses. Note that it can only be used to populate non-present entries.
  * The virtual and physical addresses have to be aligned on PMD level
- * down. It returns the last physical address mapped.
+ * down. It returns the last physical address mapped, or zero if allocation
+ * failed at any point.
  */
 unsigned long __meminit
 kernel_physical_mapping_init(unsigned long paddr_start,
@@ -981,7 +1022,8 @@ int arch_add_memory(int nid, u64 start, u64 size,
 	unsigned long start_pfn = start >> PAGE_SHIFT;
 	unsigned long nr_pages = size >> PAGE_SHIFT;
 
-	init_memory_mapping(start, start + size, params->pgprot);
+	if (!init_memory_mapping(start, start + size, params->pgprot))
+		return -ENOMEM;
 
 	return add_pages(nid, start_pfn, nr_pages, params);
 }
-- 
2.39.5
