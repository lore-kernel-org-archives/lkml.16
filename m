Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D1F1553A3
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 10:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749465129; cv=none; b=H7oiviR+puHb203yhfFaZQMewjCqwufqG46f/2+1y4+NmVmlz9sTnYbLTLvPbmkQVoAXItuH0p+6rxonN0m6YAPUViQgfL+XG0/LA+I/WqRbzLpCYyII+OGOAlDnNdQg8SHcnpX099+eYLdDc/rYEMzxcwsq2X83u6hHQN2ysKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749465129; c=relaxed/simple;
	bh=3HGUM9zngmkRNt6x6zgIJoHW7cOqsWbxlpfiFs5uDuA=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=qM8Yf5EE9ml04qdvYI3X85JPuR6+JIKoYtux8eK1XXeiCVuUN7oMfISxvjw6847xvnzzjvIuz6OBg4q81MqLKMWLsVCGpgf7HbjDBl0oOIDsLt3kC6XeRtjRgAcX3yP/5sYjk0h5xeJb+D8vpK/skF4ndOgZ/LvMrBcmq2N3Mg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=neon.tech; spf=pass smtp.mailfrom=neon.tech; dkim=pass (1024-bit key) header.d=neon.tech header.i=@neon.tech header.b=r08Zu5xT; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=neon.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neon.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=neon.tech header.i=@neon.tech header.b="r08Zu5xT"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-60789b450ceso4445955a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 03:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neon.tech; s=google; t=1749465126; x=1750069926; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vOh1kmN1BpJUB3fkO2pyW4zC5QemAdxkKxwT4QLR+CM=;
        b=r08Zu5xT26H6vX9y6SImYtgs2oVo7h5X94KINn+doN40aOZBNLmx7l4xzlqBWvRyNY
         0sd6oMJi8ujQAqdEllnCDmlQvYtmv6PI6i684DL0SZ75fnIQhZc++pcd8jZoN+K6BU8F
         QOJhuLCMwWUiIgq1To07AdY7Nbl7yjYQGibXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749465126; x=1750069926;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vOh1kmN1BpJUB3fkO2pyW4zC5QemAdxkKxwT4QLR+CM=;
        b=sXM21uuCavPGzCUAENeiXlQozVoxeU3vBpFGUq9+9SAO8FS0rs1phG4p88cSXJ8Ioc
         Jq94gqZWMFiVRSsy+g3gEaOPxePd44pya3+YXrDYNLvUrmH84zLLhMXUhJAuyUUzWj1R
         JaFRZwnIEivdoJZei4sSdrFbqJb7cPpMk2x2YZ6p8FGSsHAtnCq/rGxIWnldJK6evDWk
         tElMlgjzS1SDnCTG/2qimbWiEfgrN6DllDSlt23pspjdr7pdLLLu2kJOi+js7fn7AEZj
         KodXis1amkODbwpkICKKli5pz5gb4mkHTCEcIVTuujPcYe/woaF/jv0lx00Ah0oBMVhE
         9CWw==
X-Gm-Message-State: AOJu0YwtHCXmlIwvxfG+uUa9NT4sbRqevBgsYZO7xQ/b1k9Ok8UDRavZ
	7KVPiCfIu2xHvUIlaKy4mRJGR39F+0aXJDokLU2Qul1QXJXRT1nEBOc24SXnE899FUOSNRLOUpu
	Zsu4rJTo8eQ==
X-Gm-Gg: ASbGnctmTXzwfWWMD6as5qVq5YS0qoc9GL2WV5xJhj8nYfqATQUj4oYUPSLtW1CNtD8
	tPx+GPyV2eeNepRccO3OaSxerMAPtPEBo8bPbtuVlRM9EGC20JdjKds1OhxfXGb9Nk6H0RywLkI
	ckZo7pCbq81iJv4426KAXtN1rFNO+uJpbRXiIRciVDQxiJ+4JVabxleemtYI0srWxr1QlrR1brQ
	pyujmDJ69hFAD1yfXFNZ4DTxCMspvabWhi0QuNY5IF1XZVS7kPygqmbXnkq6/L5DebL2jbMx6uB
	iwAl7lP4ZDvFMg168hCQDpZ75NKMYF1NY/nFe5curFFAATDKySKOIBg=
X-Google-Smtp-Source: AGHT+IETLIUhGfaSESn8EKtmg8Vs25bOw1qtrO9ao2zSDcQl0Ezv0B68l58mWF6bgDn4au63vE3mbA==
X-Received: by 2002:a05:6402:2694:b0:607:1ee1:1ea2 with SMTP id 4fb4d7f45d1cf-6077489733amr11327963a12.30.1749465125944;
        Mon, 09 Jun 2025 03:32:05 -0700 (PDT)
Received: from [192.168.86.142] ([84.65.228.220])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-607783c0620sm4592766a12.49.2025.06.09.03.32.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 03:32:04 -0700 (PDT)
Message-ID: <0ce5e150-19e0-457f-bec3-ee031c0be7e7@neon.tech>
Date: Mon, 9 Jun 2025 11:32:02 +0100
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
Subject: [PATCH v2 0/2] x86/mm: Improve alloc handling of phys_*_init()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi (again) folks,

See changelog + more context below.

tl;dr:

* Currently alloc_low_page() uses GFP_ATOMIC after boot, which may fail
* Those failures aren't currently handled by phys_pud_init() and similar
  functions.
* Those failures can happen during memory hotplug

So:

1. Add handling for those allocation failures
2. Use GFP_KERNEL instead of GFP_ATOMIC

Previous version here, if you missed it:
https://lore.kernel.org/all/9f4c0972-a123-4cc3-89f2-ed3490371e65@neon.tech/

=== Changelog ===

v2:
- Switch from special-casing zero values to ERR_PTR()
- Add patch to move from GFP_ATOMIC -> GFP_KERNEL
- Move commentary out of the patch message and into this cover letter

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
see the difference after a few days); as of 2025-06-09, we haven't yet
rolled that out.


Em Sharnoff (2):
  x86/mm: Handle alloc failure in phys_*_init()
  x86/mm: Use GFP_KERNEL for alloc_low_pages() after boot

 arch/x86/mm/init.c    |  8 +++++--
 arch/x86/mm/init_64.c | 54 +++++++++++++++++++++++++++++++++++++++----
 2 files changed, 56 insertions(+), 6 deletions(-)


base-commit: 82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3
-- 
2.39.5

