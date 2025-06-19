Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E8A2512F1
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 12:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750335723; cv=none; b=Za6amsXjG7qgy9hPSB0jb6UN45PrCMTUblXmRsVisZWPdNhrS/rHp5EYWnyGFW0DG2eq69SqBiezkcLzrwxSCdtlzMWQ2M1W/oE34EYLrXYu43XvTpIir1BXHXYpBJwc4MQHo+pq1KHDvwCPDrG0yiDKZGP+fKc+vtzNfD+qiec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750335723; c=relaxed/simple;
	bh=YU9PziL6sKtAJV06z6HBVVgyA+xe68a86IbQ2iDAsjM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aWD7k0HzRkxyLlsp3MgWTT+ZpuikXVdEhudWNXwNx69w8VyKpdnRx8/P6QISTDMljJlmzZ8+sFG+CmDuqvrlKvuREG+742o0HsVHpYKRt8+gfAzrFY/Bh7id+FuBkpbzxvPDy1lE93pk5KwsyaM0g2wMPdQXULWb0xEffpsSA+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EIe/f6Os; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EIe/f6Os"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74DF3C4CEEA;
	Thu, 19 Jun 2025 12:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750335723;
	bh=YU9PziL6sKtAJV06z6HBVVgyA+xe68a86IbQ2iDAsjM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EIe/f6OsXYWbZI/E7VnkwFaf5GrCk89htmhqPYScEI00FWzqqAasHtXNheoV3f4f1
	 SDhjXOX53sjDDnmVGGOoZkmSkcPFm3YLq8t+VFWGP0KR4c7SNY9HuAYguHe1jPxHfH
	 8lFtjypVcZSkmUg9LAoyhFR446Deeb1fOSbMttGq/cVsjIzkETOkvyI7H8xIqty+oj
	 aeeK1eMe9cTXGRkVW/Cd7vMLQv5+NTOV4iW356jonxJZ1Z6dRRwFaUTNEc6AjBFk9H
	 BcVtGNIMp+nYt4IpgY0OcVzTW3cPYyLcb7/dvQtjYQdsEYx81gw8JQY9gHeAZ6nFqa
	 jzMIqp0gaF9mw==
Date: Thu, 19 Jun 2025 13:21:58 +0100
From: Will Deacon <will@kernel.org>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Jan Kara <jack@suse.cz>, akpm@linux-foundation.org, david@redhat.com,
	jgg@ziepe.ca, jhubbard@nvidia.com, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, peterx@redhat.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [mm?] KASAN: slab-use-after-free Read in
 do_sync_mmap_readahead
Message-ID: <20250619122157.GB21372@willie-the-truck>
References: <6852b77e.a70a0220.79d0a.0214.GAE@google.com>
 <hi6tsbuplmf6jcr44tqu6mdhtyebyqgsfif7okhnrzkcowpo4d@agoyrl4ozyth>
 <a06ab040-8ed7-4afa-9bbb-dd95b18e3b04@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a06ab040-8ed7-4afa-9bbb-dd95b18e3b04@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu, Jun 19, 2025 at 11:57:05AM +0100, Ryan Roberts wrote:
> On 19/06/2025 10:52, Jan Kara wrote:
> > Hi,
> > 
> > On Wed 18-06-25 05:56:30, syzbot wrote:
> >> Hello,
> >>
> >> syzbot found the following issue on:
> >>
> >> HEAD commit:    bc6e0ba6c9ba Add linux-next specific files for 20250613
> >> git tree:       linux-next
> >> console+strace: https://syzkaller.appspot.com/x/log.txt?x=108c710c580000
> >> kernel config:  https://syzkaller.appspot.com/x/.config?x=2f7a2e4d17ed458f
> >> dashboard link: https://syzkaller.appspot.com/bug?extid=8e4be574cb8c40140a2a
> >> compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
> >> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=148c710c580000
> >> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=179025d4580000
> >>
> >> Downloadable assets:
> >> disk image: https://storage.googleapis.com/syzbot-assets/2430bb0465cc/disk-bc6e0ba6.raw.xz
> >> vmlinux: https://storage.googleapis.com/syzbot-assets/436a39deef0a/vmlinux-bc6e0ba6.xz
> >> kernel image: https://storage.googleapis.com/syzbot-assets/e314ca5b1eb3/bzImage-bc6e0ba6.xz
> >>
> >> The issue was bisected to:
> >>
> >> commit 3b61a3f08949297815b2c77ae2696f54cd339419
> >> Author: Ryan Roberts <ryan.roberts@arm.com>
> >> Date:   Mon Jun 9 09:27:27 2025 +0000
> >>
> >>     mm/filemap: allow arch to request folio size for exec memory
> > 
> > Indeed. The crash is in:
> > 
> > 	fpin = maybe_unlock_mmap_for_io(vmf, fpin);
> > 	if (vm_flags & VM_EXEC) {
> > 		/*
> > 		 * Allow arch to request a preferred minimum folio order for
> > 		 * executable memory. This can often be beneficial to
> > 		 * performance if (e.g.) arm64 can contpte-map the folio.
> > 		 * Executable memory rarely benefits from readahead, due to its
> > 		 * random access nature, so set async_size to 0.
> > 		 *
> > 		 * Limit to the boundaries of the VMA to avoid reading in any
> > 		 * pad that might exist between sections, which would be a waste
> > 		 * of memory.
> > 		 */
> > 		struct vm_area_struct *vma = vmf->vma;
> > 		unsigned long start = vma->vm_pgoff;
> > 				^^^^ here
> > which is not surprising because we've unlocked mmap_sem (or vma lock) just
> > above this if and thus vma could have been released before we got here. The
> > easiest fix is to move maybe_unlock_mmap_for_io() below this if. There's
> > nothing in there that would be problematic with the locks still held.
> 
> Thanks for the quick analysis, Jan! Ouch...
> 
> This is still in mm-unstable I believe, so I'll send a fix-up patch to Andrew to
> move the unlock as you suggest.
> 
> By the way, I don't think I was included on the original report; Is there a way
> I can sign up to be included on patched I authored in future?

Your address looks like it's on To:

https://lore.kernel.org/r/6852b77e.a70a0220.79d0a.0214.GAE@google.com

but maybe you redirect syzbot reports to the SP^H^HIMPORTANT folder?

Will
