Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0784323D2A5
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 12:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750336190; cv=none; b=US+4Kv3rik307bdHvT4gCzYhlWOME8I7vvvMgO1IkacESGAFcOfYIbOcdpjMXdEWPP5Tw6UcCfupbTGevfYyXD9yRoY0JJtneHj2Nhs9obmO3BaZxGWwUUgtPo0X0Onu7az6ovM05l5XAZbzbg4G5ioJ5Mkkz83QzNbCmrs4cok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750336190; c=relaxed/simple;
	bh=Y5AoiQjnP+Pg5HshQ3oV3CZeG5wcMCWauCxx5g6vV38=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bYecUHZV4C3isOV01Csw/l6m4/5beHJOkM05mMv3vQwcGgRAx3jRvJsnJUqOBZ1B83cfRFLcyVnjvbiSt6f2v6lL4o67eVQi4I+a/gssXGrRC+j4xRZZWKCHQ4HQYfwqUvUEEuKsOxmzxKbnYBafnX5siah9bGpm2wotZdKfaRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 423E1106F;
	Thu, 19 Jun 2025 05:29:28 -0700 (PDT)
Received: from [10.57.84.221] (unknown [10.57.84.221])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C432B3F66E;
	Thu, 19 Jun 2025 05:29:46 -0700 (PDT)
Message-ID: <29624f1e-de4f-492d-b54c-bb99f58b582f@arm.com>
Date: Thu, 19 Jun 2025 13:29:45 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [mm?] KASAN: slab-use-after-free Read in
 do_sync_mmap_readahead
Content-Language: en-GB
To: Will Deacon <will@kernel.org>
Cc: Jan Kara <jack@suse.cz>, akpm@linux-foundation.org, david@redhat.com,
 jgg@ziepe.ca, jhubbard@nvidia.com, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, peterx@redhat.com, syzkaller-bugs@googlegroups.com
References: <6852b77e.a70a0220.79d0a.0214.GAE@google.com>
 <hi6tsbuplmf6jcr44tqu6mdhtyebyqgsfif7okhnrzkcowpo4d@agoyrl4ozyth>
 <a06ab040-8ed7-4afa-9bbb-dd95b18e3b04@arm.com>
 <20250619122157.GB21372@willie-the-truck>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250619122157.GB21372@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/06/2025 13:21, Will Deacon wrote:
> On Thu, Jun 19, 2025 at 11:57:05AM +0100, Ryan Roberts wrote:
>> On 19/06/2025 10:52, Jan Kara wrote:
>>> Hi,
>>>
>>> On Wed 18-06-25 05:56:30, syzbot wrote:
>>>> Hello,
>>>>
>>>> syzbot found the following issue on:
>>>>
>>>> HEAD commit:    bc6e0ba6c9ba Add linux-next specific files for 20250613
>>>> git tree:       linux-next
>>>> console+strace: https://syzkaller.appspot.com/x/log.txt?x=108c710c580000
>>>> kernel config:  https://syzkaller.appspot.com/x/.config?x=2f7a2e4d17ed458f
>>>> dashboard link: https://syzkaller.appspot.com/bug?extid=8e4be574cb8c40140a2a
>>>> compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
>>>> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=148c710c580000
>>>> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=179025d4580000
>>>>
>>>> Downloadable assets:
>>>> disk image: https://storage.googleapis.com/syzbot-assets/2430bb0465cc/disk-bc6e0ba6.raw.xz
>>>> vmlinux: https://storage.googleapis.com/syzbot-assets/436a39deef0a/vmlinux-bc6e0ba6.xz
>>>> kernel image: https://storage.googleapis.com/syzbot-assets/e314ca5b1eb3/bzImage-bc6e0ba6.xz
>>>>
>>>> The issue was bisected to:
>>>>
>>>> commit 3b61a3f08949297815b2c77ae2696f54cd339419
>>>> Author: Ryan Roberts <ryan.roberts@arm.com>
>>>> Date:   Mon Jun 9 09:27:27 2025 +0000
>>>>
>>>>     mm/filemap: allow arch to request folio size for exec memory
>>>
>>> Indeed. The crash is in:
>>>
>>> 	fpin = maybe_unlock_mmap_for_io(vmf, fpin);
>>> 	if (vm_flags & VM_EXEC) {
>>> 		/*
>>> 		 * Allow arch to request a preferred minimum folio order for
>>> 		 * executable memory. This can often be beneficial to
>>> 		 * performance if (e.g.) arm64 can contpte-map the folio.
>>> 		 * Executable memory rarely benefits from readahead, due to its
>>> 		 * random access nature, so set async_size to 0.
>>> 		 *
>>> 		 * Limit to the boundaries of the VMA to avoid reading in any
>>> 		 * pad that might exist between sections, which would be a waste
>>> 		 * of memory.
>>> 		 */
>>> 		struct vm_area_struct *vma = vmf->vma;
>>> 		unsigned long start = vma->vm_pgoff;
>>> 				^^^^ here
>>> which is not surprising because we've unlocked mmap_sem (or vma lock) just
>>> above this if and thus vma could have been released before we got here. The
>>> easiest fix is to move maybe_unlock_mmap_for_io() below this if. There's
>>> nothing in there that would be problematic with the locks still held.
>>
>> Thanks for the quick analysis, Jan! Ouch...
>>
>> This is still in mm-unstable I believe, so I'll send a fix-up patch to Andrew to
>> move the unlock as you suggest.
>>
>> By the way, I don't think I was included on the original report; Is there a way
>> I can sign up to be included on patched I authored in future?
> 
> Your address looks like it's on To:
> 
> https://lore.kernel.org/r/6852b77e.a70a0220.79d0a.0214.GAE@google.com
> 
> but maybe you redirect syzbot reports to the SP^H^HIMPORTANT folder?

Hmm... Another email fail from me I guess. I don't have any rule that I'm aware
of and I don't see it in any of the folders that I do redirect to, nor in the
trash. Anyway, it's almost certainly my error. Thanks for pointing it out.

> 
> Will

