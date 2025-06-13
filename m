Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A9272608
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 20:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749845357; cv=none; b=EWieXSp7Q4ZjmAL7joMpykKEO1eh5RL4EZ4vYm1uze+glfi1sntGblJl9zqGNvFPkLGjBsOBz79Ny2AYJqiQePSxHCuVBzaCEelAL0y+wD+wpGWDU1JhHs7UyemuZmWTO7FuBZKyPK3krTlUFpXUdZBgP6LbrF8XLiOdfDKKLzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749845357; c=relaxed/simple;
	bh=X3wMNVDqJLcjMpIJN0mrVccSkZw+irZtGZ/JUjosUJA=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=uWad4rGLOjDPY/lG6tmMFUlwh8tMkaYKSU951bNIlyRPFF+4dYnujzIRAOE3cUTDvv5s8SWrrwZsnsS0NUlyuLYl13CcBtHzcRn3m5cbng7NQ+D+8ru1EYxizYpxaNZB/D49FDI27BIkOg/WSI+49B14SjwifDs1xqpElZKFHBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=neon.tech; spf=pass smtp.mailfrom=neon.tech; dkim=pass (1024-bit key) header.d=neon.tech header.i=@neon.tech header.b=sZSrwzqM; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=neon.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neon.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=neon.tech header.i=@neon.tech header.b="sZSrwzqM"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ade33027bcfso401483666b.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 13:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neon.tech; s=google; t=1749845353; x=1750450153; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gCpIWwgyZWGIT23MiDMROhpJW16wYGCjBFfwJbBCLWw=;
        b=sZSrwzqMeOo0vubpDuTAMV8jlqK7nS+2rMHBSp4aKEeK1tydzfa4Vb9gK+VlNKXbl7
         /tGy/nlR+QHpV7hPYWJXJUd15IKvVCdgy41aWkdmp4M2GnYFo9Njit/4mKqOPvr5abQp
         WcKxYpI/2AnfPUmt1Kr9ie87j05DdbTJK+KnQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749845353; x=1750450153;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gCpIWwgyZWGIT23MiDMROhpJW16wYGCjBFfwJbBCLWw=;
        b=XvI+G7yS4GIO1GGeE6HAfe1Kp7+dW3hI5D+sckd+LgkAI+8obZLzPHd8Box1HqcUWq
         VIuwb7mMv2gI9Q5TRi4iza8YlS+KpucWSHgvnSJzjss0Gnno6pOktm7IYPLO94LntVmy
         K8Z/936w6s9Oc/cHHt+cd7FjLVeVo/WgcmpoJgGUy7GMWAG7Hwni+dBp8EsALiqaq0OW
         9i9X4SokEss3kppZSoxy0onoBUYfItJC5PFnU9XqCBh4SOMww0Ht51wDF2Rw7XY1QbTE
         0aCX8HgL9fNtgxZIZxo97boCIFnRC3IIhB+VR9Ii++B6toq5Li+pex/A1JP68l33je+D
         tNYw==
X-Gm-Message-State: AOJu0YzZnq67gAA50f9uqxFgiLZ1O9dKdSt3l6LnVAnlYZ56Gx0YUp4P
	Dy042ehcIyKrGviWHJK2PcPQfsZGImOAlcSnFYMIzYzRSmKAaJnPmnh41ghZzADA/sZB2JIWvkT
	S4tZqjEf7CQ==
X-Gm-Gg: ASbGncvxGhNlV4o253k2T0L5wsZJSAuK2LRYBXXTs1LKCHPiTgH721MJtdNNnXEsPrC
	lMLRuEjN3VvjXLhW2miX1cpzm5QXC/HCjqJ1JdOL/3ZPRbPA/S0M/DZNdofoYjr/KsPfdSj2I4E
	EKlHvQjVbelRM0BE93gF1CAhoVFTlDJpC7rXIiFPmyP5baMYTcClMEEznpy7HRN+SAvXE0cKCJC
	AuJGierbAnHxSYJ6GxIhGeluGPEHJoFYJeKLW45yCia8spILfC65lPq6gthHYFQZKoT04i84zYi
	1nbS++quBfmH5lzUGO0bhtr8yqi3I0907ZM8zaTU+Dk21crqv8LIQwZGGm29yQzaNA==
X-Google-Smtp-Source: AGHT+IE+XRj0f2OO1NFtrwcgPSLWKh7S336TPPjKee4hHKgf48OA+OTMOlwDebfKglfKDN7oIV5sWw==
X-Received: by 2002:a17:907:1ca2:b0:add:ede0:b9c4 with SMTP id a640c23a62f3a-adfad450a2amr44900866b.42.1749845353230;
        Fri, 13 Jun 2025 13:09:13 -0700 (PDT)
Received: from [192.168.86.142] ([84.65.228.220])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec815353fsm179674466b.36.2025.06.13.13.09.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 13:09:12 -0700 (PDT)
Message-ID: <7d0d307d-71eb-4913-8023-bccc7a8a4a3d@neon.tech>
Date: Fri, 13 Jun 2025 21:09:11 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-kernel@vger.kernel.org, x86@kernel.org, linux-mm@kvack.org
Cc: Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski
 <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 Oleg Vasilev <oleg@neon.tech>, Arthur Petukhovsky <arthur@neon.tech>,
 Stefan Radig <stefan@neon.tech>, Misha Sakhnov <misha@neon.tech>
From: Em Sharnoff <sharnoff@neon.tech>
Subject: [PATCH v4 0/4] x86/mm: Improve alloc handling of phys_*_init()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi folks,

See changelog + more context below.

tl;dr:

* Currently alloc_low_page() uses GFP_ATOMIC after boot, which may fail
* Those failures aren't currently handled by phys_pud_init() and similar
  functions.
* Those failures can happen during memory hotplug

So:

1. Add handling for those allocation failures (patches 1-3)
2. Use GFP_KERNEL instead of GFP_ATOMIC (patch 4)

Previous version here:
https://lore.kernel.org/all/a31e3b89-5040-4426-9ce8-d674b8554aa1@neon.tech/

=== Changelog ===

v2:
- Switch from special-casing zero values to ERR_PTR()
- Add patch to move from GFP_ATOMIC -> GFP_KERNEL
- Move commentary out of the patch message and into this cover letter
v3:
- Fix -Wint-conversion issues
v4:
- new patch: move 'paddr_last' usage into phys_{pud,pmd}_init() so the
  return from those functions is no longer needed.
- new patch: make phys_*_init() and their callers return int

I'm not sure if patch 2/4 ("Allow error returns ...") should be separate
from patch 3/4 ("Handle alloc failure ..."), but it's easy enough to
combine them if need be.

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
see the difference after a few days); as of 2025-06-13, we haven't yet
rolled that out.


Em Sharnoff (4):
  x86/mm: Update mapped addresses in phys_{pmd,pud}_init()
  x86/mm: Allow error returns from phys_*_init()
  x86/mm: Handle alloc failure in phys_*_init()
  x86/mm: Use GFP_KERNEL for alloc_low_pages() after boot

 arch/x86/include/asm/pgtable.h |   3 +-
 arch/x86/mm/init.c             |  29 ++++++---
 arch/x86/mm/init_32.c          |   6 +-
 arch/x86/mm/init_64.c          | 116 ++++++++++++++++++++++-----------
 arch/x86/mm/mem_encrypt_amd.c  |   8 ++-
 arch/x86/mm/mm_internal.h      |  13 ++--
 6 files changed, 113 insertions(+), 62 deletions(-)


base-commit: 82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3
-- 
2.39.5
