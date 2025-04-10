Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167F51552FA
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 01:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744248947; cv=none; b=KkTZj63H61LIv7tZ5R8L6dw/bqnrauNbXk3woSMWLKCT0W5dfdr2roFFI82oNcj4jURMI1Mc+aUIHzSk/I77lDxrt69nYvREa2v5Mjb5RdPRa0F+SgE0sR7/plf4PFiWkZuhl2NUxhJMgm4oLwzAx3mj/1pajzbRtWgZeQ9xnzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744248947; c=relaxed/simple;
	bh=gJQ/xLSsBODqTv4/61LdDhIB2aaBKqztk3WxLzAdnpQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R4BlbVTJoDcUbk/+1GkC/tZfyw6ZmuSk9noINzdFcgGov9cjImfTXsH68Gx8lBXhlVRTCYqdi4AiPxmWILum/GX49/SwVcoD/02j1KT6dDm6e1eDDQg4nWvtxLwk8OB5HWkH5zUy0ZrdgVEFeemnr+vTtt9EkCntSeRQs4ZLbYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GqF3i1ks; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GqF3i1ks"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744248943;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LQq/AGYird8n+QflAcqYVwORfWdz6Tg7zG4VPHNUkGg=;
	b=GqF3i1ksXyYow3UcZsd4cRGHzFHN7W0Ss54rIPgUjCUIfuZXavLhm14ZmWdTeKCaJA0hQk
	eqvnLT0WTm38fM4bvZLdqQ7XPL+Cd8LW284OZqyotB+lpTs1DCnY7Uu+HXcFQBXSZojm9Y
	6MnfCsbZltRVff/jW8519/yZc3xlC1k=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-247-HhiUO-QBNFSddbeWUBAY1A-1; Wed, 09 Apr 2025 21:35:42 -0400
X-MC-Unique: HhiUO-QBNFSddbeWUBAY1A-1
X-Mimecast-MFC-AGG-ID: HhiUO-QBNFSddbeWUBAY1A_1744248941
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2265a09dbfcso4317425ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 18:35:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744248938; x=1744853738;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LQq/AGYird8n+QflAcqYVwORfWdz6Tg7zG4VPHNUkGg=;
        b=hdAROUi4kRS8Th4lMHEIkTVNFl3NKnbQqVw2aweGZQhCxeelgZk9sXa3n0htNdrjFp
         GGHMjSZvNq8XsJlBH43gcbs+7FLNhnOsAuc/X7o6TQEODD/wZbGlBZGltqC0bm234FQb
         UNgkNTcL9pcqDtV2sA5hSHuCQXSmsC1IQ1fpegTE4aBZgKanagfR+6UX3g0jAfXU3apO
         2gDIeufY5rVY2sC/MMsODABae0eJ0KnuInej4BBQPKMb9OSzQMDPDRgzEgO+G0tz+kn2
         iWiGVBLFTagdiL+dVSKbQEAwuA6h3/BZ7KVDFxe1D2UI6Wjm+bU8XVxpM6GQsG6OSzpP
         KoCg==
X-Forwarded-Encrypted: i=1; AJvYcCWF2KcQNi0pakIqxtb0YkfXAjetLMhpabvdbNYJJsL94qVhfdzN7C6dUhLMPyilXjYANp5qykmXkqyLiOU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6Qiclh+SJS2Qalu4cKYCZJghtbuo4MviE7tX8kTHlNTk+5wnR
	BrBm8uGSqkQySZAcT3Ot/EGxAxOrQnnOqHpHg2jtnFK8m2lu4yobBHnQxTJxHr3vhkCmAR+Gs2u
	j81guXjf+byZuqngVX8jqZmf5yqinc7wAh3sTZhm4zCqhljASFVPgAEt73wyiUw==
X-Gm-Gg: ASbGncsnDGtvmmITG99/nO5TzHzNpm9JTYMp3lZDuMKx13ykBaA6Ow1biqm9SUHNvqR
	t2hQ8KdLzdcIAjhRxK5SlcQaIUcEH2jAjhoz7bAx0dfEIGxYghkn3ejeVme63a3q3+oNzjheM5X
	uQ0BQowXqCYdZoZBL2xd72joYPMJGzyuKhcNRAeJvBPRBzNsco2+SIH/q6fGSj4ArNq5EmRhzEG
	cZhunsxlCC63E0BC89RSYC7QS7pMWBx4j808+yf5IWSVdCTjRL+ChAjZXmYtenYMXvrPA1HlWRZ
	MLcKTM2yStAJ
X-Received: by 2002:a17:903:3c66:b0:224:2717:7993 with SMTP id d9443c01a7336-22be03eed46mr6536445ad.45.1744248937892;
        Wed, 09 Apr 2025 18:35:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE48xkXbJ3ddoa4RUelSRbPUEXIDRCVVccmLIqWEreo3B9J9VV9Q8/ehUwgG+Ws+aQCiL4Pbw==
X-Received: by 2002:a17:903:3c66:b0:224:2717:7993 with SMTP id d9443c01a7336-22be03eed46mr6536135ad.45.1744248937537;
        Wed, 09 Apr 2025 18:35:37 -0700 (PDT)
Received: from [192.168.68.55] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccac49sm19006615ad.217.2025.04.09.18.35.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 18:35:36 -0700 (PDT)
Message-ID: <0f89dd7e-937b-4575-855b-561ff6e932e5@redhat.com>
Date: Thu, 10 Apr 2025 11:35:30 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REPORT] Softlockups on PowerNV with upstream
To: Aditya Gupta <adityag@linux.ibm.com>, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Danilo Krummrich <dakr@kernel.org>, David Hildenbrand <david@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Oscar Salvador <osalvador@suse.de>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Sourabh Jain <sourabhjain@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Gavin Shan <gshan@redhat.com>, Gavin Shan <shan.gavin@gmail.com>
References: <20250409180344.477916-1-adityag@linux.ibm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250409180344.477916-1-adityag@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Aditya,

On 4/10/25 4:03 AM, Aditya Gupta wrote:
> 
> While booting current upstream kernel, I consistently get "softlockups", on IBM PowerNV system.
> 
> I have tested it only on PowerNV systems. But some architectures/platforms also
> might have it. PSeries systems don't have this issue though.
> 
> Bisect points to the following commit:
> 
>      commit 61659efdb35ce6c6ac7639342098f3c4548b794b
>      Author: Gavin Shan <gshan@redhat.com>
>      Date:   Wed Mar 12 09:30:43 2025 +1000
> 
>          drivers/base/memory: improve add_boot_memory_block()
> 
>          Patch series "drivers/base/memory: Two cleanups", v3.
> 
>          Two cleanups to drivers/base/memory.
> 
> 
>          This patch (of 2)L
> 
>          It's unnecessary to count the present sections for the specified block
>          since the block will be added if any section in the block is present.
>          Besides, for_each_present_section_nr() can be reused as Andrew Morton
>          suggested.
> 
>          Improve by using for_each_present_section_nr() and dropping the
>          unnecessary @section_count.
> 
>          No functional changes intended.
> 
>          ...
> 
> Pasted the console log, bisect log, and the kernel config, below.
> 

I don't see how 61659efdb35ce ("drivers/base/memory: improve add_boot_memory_block()")
causes any logical changes. Could you help to revert it on top of v6.15.rc1 to confirm
the RCU stall and softlockup issue is still existing?

At present, I don't have access to a Power10 machine, but I will check around.

> Thanks,
> - Aditya G
> 
> Console log
> -----------
> 
>      [    2.783371] smp: Brought up 4 nodes, 256 CPUs
>      [    2.783475] numa: Node 0 CPUs: 0-63
>      [    2.783537] numa: Node 2 CPUs: 64-127
>      [    2.783591] numa: Node 4 CPUs: 128-191
>      [    2.783653] numa: Node 6 CPUs: 192-255
>      [    2.804945] Memory: 735777792K/738197504K available (17536K kernel code, 5760K rwdata, 15232K rodata, 6528K init, 2517K bss, 1369664K reserved, 0K cma-reserved)

The NUMA node number leaps by one. It seems the machine has 800GB memory if I'm correct.

>      [    2.892969] devtmpfs: initialized
>      [   24.057853] watchdog: BUG: soft lockup - CPU#248 stuck for 22s! [swapper/248:1]
>      [   24.057861] Modules linked in:
>      [   24.057872] CPU: 248 UID: 0 PID: 1 Comm: swapper/248 Not tainted 6.15.0-rc1-next-20250408 #1 VOLUNTARY
>      [   24.057879] Hardware name: 9105-22A POWER10 (raw) 0x800200 opal:v7.1-107-gfda75d121942 PowerNV
>      [   24.057883] NIP:  c00000000209218c LR: c000000002092204 CTR: 0000000000000000
>      [   24.057886] REGS: c00040000418fa30 TRAP: 0900   Not tainted  (6.15.0-rc1-next-20250408)
>      [   24.057891] MSR:  9000000002009033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 28000428  XER: 00000000
>      [   24.057904] CFAR: 0000000000000000 IRQMASK: 0
>      [   24.057904] GPR00: c000000002092204 c00040000418fcd0 c000000001b08100 0000000000000040
>      [   24.057904] GPR04: 0000000000013e00 c000c03ffebabb00 0000000000c03fff c000400fff587f80
>      [   24.057904] GPR08: 0000000000000000 00000000001196f7 0000000000000000 0000000028000428
>      [   24.057904] GPR12: 0000000000000000 c000000002e80000 c00000000001007c 0000000000000000
>      [   24.057904] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>      [   24.057904] GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>      [   24.057904] GPR24: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>      [   24.057904] GPR28: c000000002df7f70 0000000000013dc0 c0000000011dd898 0000000008000000
>      [   24.057948] NIP [c00000000209218c] memory_dev_init+0x114/0x1e0
>      [   24.057963] LR [c000000002092204] memory_dev_init+0x18c/0x1e0
>      [   24.057968] Call Trace:
>      [   24.057970] [c00040000418fcd0] [c000000002092204] memory_dev_init+0x18c/0x1e0 (unreliable)
>      [   24.057976] [c00040000418fd50] [c000000002091348] driver_init+0x78/0xa4
>      [   24.057981] [c00040000418fd70] [c0000000020063ac] kernel_init_freeable+0x22c/0x370
>      [   24.057989] [c00040000418fde0] [c0000000000100a8] kernel_init+0x34/0x25c
>      [   24.057996] [c00040000418fe50] [c00000000000cd94] ret_from_kernel_user_thread+0x14/0x1c
>      [   24.058004] --- interrupt: 0 at 0x0
>      [   24.058010] Code: 7fa9eb78 e8aa0000 2fa50000 60000000 60420000 7c29f840 792aaac2 40800034 419e0030 794a1f24 7d45502a 2c2a0000 <41820020> 79282c28 7cea4214 2c270000
>      ...
>      [   62.952729] rcu: INFO: rcu_sched self-detected stall on CPU
>      [   62.952782] rcu:     248-....: (5999 ticks this GP) idle=5884/1/0x4000000000000002 softirq=81/81 fqs=1997
>      [   62.952965] rcu:     (t=6000 jiffies g=-1015 q=1 ncpus=256)
>      [   62.953050] CPU: 248 UID: 0 PID: 1 Comm: swapper/248 Tainted: G             L      6.15.0-rc1-next-20250408 #1 VOLUNTARY
>      [   62.953055] Tainted: [L]=SOFTLOCKUP
>      [   62.953057] Hardware name: 9105-22A POWER10 (raw) 0x800200 opal:v7.1-107-gfda75d121942 PowerNV
>      [   62.953059] NIP:  c000000002092180 LR: c000000002092204 CTR: 0000000000000000
>      [   62.953062] REGS: c00040000418fa30 TRAP: 0900   Tainted: G             L       (6.15.0-rc1-next-20250408)
>      [   62.953065] MSR:  9000000002009033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 88000428  XER: 00000000
>      [   62.953076] CFAR: 0000000000000000 IRQMASK: 0
>      [   62.953076] GPR00: c000000002092204 c00040000418fcd0 c000000001b08100 0000000000000040
>      [   62.953076] GPR04: 0000000000035940 c000c03ffebabb00 0000000000c03fff c000400fff587f80
>      [   62.953076] GPR08: 0000000000000000 00000000002c390b 0000000000000587 0000000028000428
>      [   62.953076] GPR12: 0000000000000000 c000000002e80000 c00000000001007c 0000000000000000
>      [   62.953076] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>      [   62.953076] GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>      [   62.953076] GPR24: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>      [   62.953076] GPR28: c000000002df7f70 0000000000035900 c0000000011dd898 0000000008000000
>      [   62.953117] NIP [c000000002092180] memory_dev_init+0x108/0x1e0
>      [   62.953121] LR [c000000002092204] memory_dev_init+0x18c/0x1e0
>      [   62.953125] Call Trace:
>      [   62.953126] [c00040000418fcd0] [c000000002092204] memory_dev_init+0x18c/0x1e0 (unreliable)
>      [   62.953131] [c00040000418fd50] [c000000002091348] driver_init+0x78/0xa4
>      [   62.953135] [c00040000418fd70] [c0000000020063ac] kernel_init_freeable+0x22c/0x370
>      [   62.953141] [c00040000418fde0] [c0000000000100a8] kernel_init+0x34/0x25c
>      [   62.953146] [c00040000418fe50] [c00000000000cd94] ret_from_kernel_user_thread+0x14/0x1c
>      [   62.953152] --- interrupt: 0 at 0x0
>      [   62.953155] Code: 4181ffe8 3d22012f 3949fe68 7fa9eb78 e8aa0000 2fa50000 60000000 60420000 7c29f840 792aaac2 40800034 419e0030 <794a1f24> 7d45502a 2c2a0000 41820020
> 
> Bisect Log
> ----------
> 
>      git bisect start
>      # status: waiting for both good and bad commits
>      # good: [38fec10eb60d687e30c8c6b5420d86e8149f7557] Linux 6.14
>      git bisect good 38fec10eb60d687e30c8c6b5420d86e8149f7557
>      # status: waiting for bad commit, 1 good commit known
>      # bad: [7702d0130dc002bab2c3571ddb6ff68f82d99aea] Add linux-next specific files for 20250408
>      git bisect bad 7702d0130dc002bab2c3571ddb6ff68f82d99aea
>      # good: [390513642ee6763c7ada07f0a1470474986e6c1c] io_uring: always do atomic put from iowq
>      git bisect good 390513642ee6763c7ada07f0a1470474986e6c1c
>      # bad: [eb0ece16027f8223d5dc9aaf90124f70577bd22a] Merge tag 'mm-stable-2025-03-30-16-52' of git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
>      git bisect bad eb0ece16027f8223d5dc9aaf90124f70577bd22a
>      # good: [7d06015d936c861160803e020f68f413b5c3cd9d] Merge tag 'pci-v6.15-changes' of git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci
>      git bisect good 7d06015d936c861160803e020f68f413b5c3cd9d
>      # good: [fa593d0f969dcfa41d390822fdf1a0ab48cd882c] Merge tag 'bpf-next-6.15' of git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next
>      git bisect good fa593d0f969dcfa41d390822fdf1a0ab48cd882c
>      # good: [f64a72bc767f6e9ddb18fdacaeb99708c4810ada] Merge tag 'v6.15rc-part1-ksmbd-server-fixes' of git://git.samba.org/ksmbd
>      git bisect good f64a72bc767f6e9ddb18fdacaeb99708c4810ada
>      # good: [a14efee04796dd3f614eaf5348ca1ac099c21349] mm/page_alloc: clarify should_claim_block() commentary
>      git bisect good a14efee04796dd3f614eaf5348ca1ac099c21349
>      # good: [f0e11a997ab438ce91a7dc9a6dd64c0c4a6af112] mm/vmalloc: refactor __vmalloc_node_range_noprof()
>      git bisect good f0e11a997ab438ce91a7dc9a6dd64c0c4a6af112
>      # bad: [735b3f7e773bd09d459537562754debd1f8e816b] selftests/mm: uffd-unit-tests support for hugepages > 2M
>      git bisect bad 735b3f7e773bd09d459537562754debd1f8e816b
>      # bad: [d2734f044f84833b2c9ec1b71b542d299d35202b] mm: memory-failure: enhance comments for return value of memory_failure()
>      git bisect bad d2734f044f84833b2c9ec1b71b542d299d35202b
>      # bad: [61659efdb35ce6c6ac7639342098f3c4548b794b] drivers/base/memory: improve add_boot_memory_block()
>      git bisect bad 61659efdb35ce6c6ac7639342098f3c4548b794b
>      # good: [58729c04cf1092b87aeef0bf0998c9e2e4771133] mm/huge_memory: add buddy allocator like (non-uniform) folio_split()
>      git bisect good 58729c04cf1092b87aeef0bf0998c9e2e4771133
>      # good: [80a5c494c89f73907ed659a9233a70253774cdae] selftests/mm: add tests for folio_split(), buddy allocator like split
>      git bisect good 80a5c494c89f73907ed659a9233a70253774cdae
>      # good: [d53c78fffe7ad364397c693522ceb4d152c2aacd] mm/shmem: use xas_try_split() in shmem_split_large_entry()
>      git bisect good d53c78fffe7ad364397c693522ceb4d152c2aacd
>      # good: [c637c61c9ed0203d9a1f2ba21fb7a49ddca3ef8f] mm/damon/sysfs-schemes: avoid Wformat-security warning on damon_sysfs_access_pattern_add_range_dir()
>      git bisect good c637c61c9ed0203d9a1f2ba21fb7a49ddca3ef8f
>      # first bad commit: [61659efdb35ce6c6ac7639342098f3c4548b794b] drivers/base/memory: improve add_boot_memory_block()
> 
> To Reproduce the issue
> ----------------------
> 
> Build the upstream kernel and boot on a PowerNV Power10 hardware
> 
> Kernel config
> -------------
> 
> This should occur with any default configs you may have, or can use the following:
> 
> https://gist.github.com/adi-g15-ibm/6eb03cea2c6202e5eb017abd3819a491
> 
> CC list
> -------
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Sourabh Jain <sourabhjain@linux.ibm.com>
> Cc: linux-kernel@vger.kernel.org
> To: linux-mm@kvack.org
> 

