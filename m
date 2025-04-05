Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B741991DD
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 09:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743843633; cv=none; b=LTqthsX2ddWemwM1t/5QCGPTb25pFz0XNAoL2SfpqVpNo//PMajMTkLmyQRhvXqUiLgGkCRu+agvT9gYo5DhjS5nAWnBEINki1VyDRqI+FmeHpUeEIXGGXW7s3DnQltFcFTmw56AV47BtRkRc3omtkTqXHDo7jiIJmlbi0YshhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743843633; c=relaxed/simple;
	bh=7kv95dNYS32/zpDOmSMdisTpeAMQ2Sf7NYS51PE41XA=;
	h=Message-ID:Date:MIME-Version:Cc:From:To:Subject:Content-Type; b=g6ZfJTGfeWtdEzesCSI9uKvQ8J6pmhyAymcy6aljZd2TO8N7olMJNkaBEkPznLT6j+qtuN/0PVS0I86oUOjZZCcJsjXhVB3MVN6FNA4pQiwn3iEZ2NOQkrR+xIsg42LqTBdV+ntCoiqTaI9Sv3XFM3fkxFp6wfLLI0sYH2/vMx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [192.168.0.2] (ip5f5af06b.dynamic.kabel-deutschland.de [95.90.240.107])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 8425961E64799;
	Sat, 05 Apr 2025 11:00:17 +0200 (CEST)
Message-ID: <eb3c109f-550f-44ce-b0a1-3837aef1d02a@molgen.mpg.de>
Date: Sat, 5 Apr 2025 11:00:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
Cc: regressions@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
From: Paul Menzel <pmenzel@molgen.mpg.de>
To: Uros Bizjak <ubizjak@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Subject: =?UTF-8?B?V0FSTklORzogbW9kcG9zdDogRVhQT1JUIHN5bWJvbCAi4oCmIiBbdm1s?=
 =?UTF-8?Q?inux=5D_version_generation_failed=2C_symbol_will_not_be_versioned?=
 =?UTF-8?B?Li8i4oCmIiBb4oCmXSBoYXMgbm8gQ1JDIQ==?=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

#regzbot introduced: 6a367577153acd9b432a5340fb10891eeb7e10f1


Dear Linux folks,


If I didn’t screw up `git bisect`, then commit 6a367577153a (percpu/x86: 
enable strict percpu checks via named AS qualifiers) [1] causes the 
build warnings below:

     $ make olddefconfig && make -j128
     […]
     WARNING: modpost: EXPORT symbol "xen_vcpu_id" [vmlinux] version 
generation failed, symbol will not be versioned.
     Is "xen_vcpu_id" prototyped in <asm/asm-prototypes.h>?
     WARNING: modpost: EXPORT symbol "irq_stat" [vmlinux] version 
generation failed, symbol will not be versioned.
     Is "irq_stat" prototyped in <asm/asm-prototypes.h>?
     […]
     WARNING: modpost: EXPORT symbol "__irq_regs" [vmlinux] version 
generation failed, symbol will not be versioned.
     Is "__irq_regs" prototyped in <asm/asm-prototypes.h>?
     WARNING: modpost: EXPORT symbol "radix_tree_preloads" [vmlinux] 
version generation failed, symbol will not be versioned.
     Is "radix_tree_preloads" prototyped in <asm/asm-prototypes.h>?
     WARNING: modpost: "pcpu_hot" 
[arch/x86/events/intel/intel-uncore.ko] has no CRC!
     WARNING: modpost: "numa_node" 
[arch/x86/events/intel/intel-uncore.ko] has no CRC!
     […]


Kind regards,

Paul


[1]: 
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=6a367577153acd9b432a5340fb10891eeb7e10f1
[2]: https://bugzilla.kernel.org/show_bug.cgi?id=219966
