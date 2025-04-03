Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DAA24E003
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 12:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743683471; cv=none; b=kJHYadwEHZB0SpEf5uAWrn5ADl5suiSPej8wlD/VDYBjW+VeHPTWhlStjBqCeNNQbYKvGLcsNxP31ECvXTFrizB7UWvYL8BiduhtlR0C9I+VfMuTcFwFLVlPCQ2zEPcH+xlQOk6478CBVMCHEdrwYVKz0FrWEgdiyPJgPcEHoig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743683471; c=relaxed/simple;
	bh=iSUo5pKSTWFOjmR7BDdYf2T7egjMjm5IhmeEnM/9FKY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=gMgkna2JwR6SLk3PX+ONvY+qLsuxUUTsnztxjTrK/eT3J9ecgYu3oBYR2bAglqjDQ2/fJ4rrVRThvC7UnFtmqozhu7VM5kAI4ethc+mZ667RvBhtQ8mpqKy5ooN2IX7nNFZRt61yuPjS5vzYk7F4vv0qEO+wQFmop+ovM2eP7KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [192.168.0.224] (ip5f5ae856.dynamic.kabel-deutschland.de [95.90.232.86])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 4753361E6487C;
	Thu, 03 Apr 2025 14:30:22 +0200 (CEST)
Message-ID: <f8ab4b21-0afc-4956-a324-12c0c67bb5de@molgen.mpg.de>
Date: Thu, 3 Apr 2025 14:30:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: New warning `cryptd: no symbol version for this_cpu_off`
From: Paul Menzel <pmenzel@molgen.mpg.de>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, Uros Bizjak <ubizjak@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, regressions@lists.linux.dev,
 Brian Gerst <brgerst@gmail.com>, Nadav Amit <nadav.amit@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>
References: <81a25a60-de78-43fb-b56a-131151e1c035@molgen.mpg.de>
Content-Language: en-US
In-Reply-To: <81a25a60-de78-43fb-b56a-131151e1c035@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

#regzbot ^introduced: 6a367577153a

[To: +Uros, Cc: +Nadav, +Andrew]


Dear Linux folks,


Am 03.04.25 um 09:35 schrieb Paul Menzel:

> On the Intel Kaby Lake laptop Dell XPS 13 9360, updating from 
> 6.14.0-11270-g08733088b566 to 6.14.0-12456-gacc4d5ff0b61, Linux logs the 
> new warning below:
> 
>      cryptd: no symbol version for this_cpu_off
> 
> I haven’t bisected it, but could it be commit 06aa03056f90 (x86/smp: 
> Move this_cpu_off to percpu hot section). It says to have no functional 
> change though.

`git bisect` led to commit 6a367577153a (percpu/x86: enable strict 
percpu checks via named AS qualifiers).

     $ git bisect start
     $ git bisect good 08733088b566
     $ git bisect bad acc4d5ff0b61

Kind regards,

Paul


$ git bisect log
git bisect start
# status: waiting for both good and bad commits
# good: [08733088b566b58283f0f12fb73f5db6a9a9de30] Merge tag 
'rust-fixes-6.15-merge' of 
git://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux
git bisect good 08733088b566b58283f0f12fb73f5db6a9a9de30
# status: waiting for bad commit, 1 good commit known
# bad: [acc4d5ff0b61eb1715c498b6536c38c1feb7f3c1] Merge tag 
'net-6.15-rc0' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net
git bisect bad acc4d5ff0b61eb1715c498b6536c38c1feb7f3c1
# bad: [2cd5769fb0b78b8ef583ab4c0015c2c48d525dac] Merge tag 
'driver-core-6.15-rc1' of 
git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core
git bisect bad 2cd5769fb0b78b8ef583ab4c0015c2c48d525dac
# bad: [0e2f80afcfa699ce722c01afc9286a942bd57211] fs/dax: ensure all 
pages are idle prior to filesystem unmount
git bisect bad 0e2f80afcfa699ce722c01afc9286a942bd57211
# bad: [5b47c02967ab770aa7661c8863a21b2fd59e35ff] mm/hugetlb: convert 
cmdline parameters from setup to early
git bisect bad 5b47c02967ab770aa7661c8863a21b2fd59e35ff
# bad: [94ba17adaba0f651fdcf745c8891a88e2e028cfa] mm/damon: avoid 
applying DAMOS action to same entity multiple times
git bisect bad 94ba17adaba0f651fdcf745c8891a88e2e028cfa
# bad: [f495bd7e0d9bd00c9a76c49f792b532bbb0efd0a] mm/rmap: keep mapcount 
untouched for device-exclusive entries
git bisect bad f495bd7e0d9bd00c9a76c49f792b532bbb0efd0a
# bad: [9b2f764933eb5e3ac9ebba26e3341529219c4401] mm/huge_memory: allow 
split shmem large folio to any lower order
git bisect bad 9b2f764933eb5e3ac9ebba26e3341529219c4401
# bad: [1c81f1a699263aeae9aa1ac777058846c546e3c0] memcg: use 
OFP_PEAK_UNSET instead of -1
git bisect bad 1c81f1a699263aeae9aa1ac777058846c546e3c0
# good: [8a3c392388c6a6e0c8937a24712b630ec9ac7016] percpu: use 
TYPEOF_UNQUAL() in variable declarations
git bisect good 8a3c392388c6a6e0c8937a24712b630ec9ac7016
# good: [6cea5ae714ba47ea4807d15903baca9857a450e6] percpu: repurpose 
__percpu tag as a named address space qualifier
git bisect good 6cea5ae714ba47ea4807d15903baca9857a450e6
