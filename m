Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C5EE248878
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 12:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745584897; cv=none; b=rqw0c8Y0xV7h09I17+7xd22qP8rhgpj6hAj75rbdtSFhsnZ/ZXxJd1eV3aUfCOhxr48sUlbfx0ZaSg9Wdtlq/RY8coU2zviE65C8uIaAdkKnNr6JljQVYTyzr5aXW7sog/gYkp/3nKz/ET+KXgDn0ShQWDM/KAxbfifIVio/ZZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745584897; c=relaxed/simple;
	bh=JtEtGcIkNYUr42wjER4Vj2deQTHfGnAnffM9GvZG4CA=;
	h=Message-ID:Date:MIME-Version:From:Cc:To:Subject:Content-Type; b=goK2tebyVGvomKPrpPN/R6ALHmr9vPoJB1MRWPWx0r+8hdglPLVQOVQNh2wN4fYIFDF1AEMuXKOPHjfvT8meYfsfq19ZbFN4ccjRvXwToUOdpW++iWKTzL9Xepdomrw0U5xNP7u88xUnUuN/pu7ytbkbH4SGxJDWKv5k7jRwsLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C7016106F;
	Fri, 25 Apr 2025 05:41:28 -0700 (PDT)
Received: from [10.57.90.155] (unknown [10.57.90.155])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 40D123F66E;
	Fri, 25 Apr 2025 05:41:33 -0700 (PDT)
Message-ID: <f93db308-4a0e-4806-9faf-98f890f5a5e6@arm.com>
Date: Fri, 25 Apr 2025 13:41:31 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
From: Ryan Roberts <ryan.roberts@arm.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
To: Kees Cook <kees@kernel.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Catalin Marinas <Catalin.Marinas@arm.com>
Subject: BUG: vdso changes expose elf mapping issue
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I'm hitting a nasty bug which is preventing VSCode from connecting to my arm64 
VM running v6.15-rc3. Bisection fingers Commit 0b3bc3354eb9 ("arm64: vdso: 
Switch to generic storage implementation") as the point where this started 
failing.

Debugging this, the root cause is due to ldconfig crashing with a segmentation 
fault (I have no idea why VSCode thinks it needs to run this...). The segfault 
happens because ldconfig's attempt to expand the program break fails because 
vvar/vdso are in the way. The above change expands vvar by 2 pages and this 
causes the problem.

But I don't think we can really blame this commit...

ldconfig is a statically linked, PIE executable. The kernel treats this as an 
interpreter and therefore does not map it into low memory but instead maps it 
into high memory using mmap() (mmap is top-down on arm64). Once it's mapped, 
vvar/vdso gets mapped and fills the hole right at the top that is left due to 
ldconfig's alignment requirements. Before the above change, there were 2 pages 
free between the end of the data segment and vvar; this was enough for ldconfig 
to get it's required memory with brk(). But after the change there is no space:

Before:
fffff7f20000-fffff7fde000 r-xp 00000000 fe:02 8110426                    /home/ubuntu/glibc-2.35/build/elf/ldconfig
fffff7fee000-fffff7ff5000 rw-p 000be000 fe:02 8110426                    /home/ubuntu/glibc-2.35/build/elf/ldconfig
fffff7ff5000-fffff7ffa000 rw-p 00000000 00:00 0 
fffff7ffc000-fffff7ffe000 r--p 00000000 00:00 0                          [vvar]
fffff7ffe000-fffff8000000 r-xp 00000000 00:00 0                          [vdso]
fffffffdf000-1000000000000 rw-p 00000000 00:00 0                         [stack]

After:
fffff7f20000-fffff7fde000 r-xp 00000000 fe:02 8110426                    /home/ubuntu/glibc-2.35/build/elf/ldconfig
fffff7fee000-fffff7ff5000 rw-p 000be000 fe:02 8110426                    /home/ubuntu/glibc-2.35/build/elf/ldconfig
fffff7ff5000-fffff7ffa000 rw-p 00000000 00:00 0 
fffff7ffa000-fffff7ffe000 r--p 00000000 00:00 0                          [vvar]
fffff7ffe000-fffff8000000 r-xp 00000000 00:00 0                          [vdso]
fffffffdf000-1000000000000 rw-p 00000000 00:00 0                         [stack]

Note that this issue only occurs with ASLR disabled. When ASLR is enabled, the 
brk region is setup in the low memory region that would normally be used by 
primary executable.

So the issue is that when ASLR is disabled, these statically linked, PIE 
programs are mapped with insufficient space to expand the break.

I think in an ideal world, the kernel would notice that this is not an 
interpreter and map it to low memory. But I guess we can't know that for the 
case where the interpreter is invoked directly (as apposed to being referenced 
in the .interp section of the invoked binary)?

Another option would be to always relocate the break to low memory (but without 
the random offset for the ASLR=off case). But it looks like there could be some 
compat issues there? I see CONFIG_COMPAT_BRK...

Or we could just ensure we enforce some dead space after the end of the program 
that nothing else is (initially) mapped into. I think this could be done by 
overallocating the initial MAP_FIXED_NOREPLACE mmap, then munmapping the hole 
after ARCH_SETUP_ADDITIONAL_PAGES(). But it's not really clear what the correct 
reservation size would be, and any mmaps the program does will start to fill 
that space.

I'm hoping someone has some suggestions...

Thanks,
Ryan

