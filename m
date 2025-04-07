Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BA6227EBF
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 08:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.149.199.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744015440; cv=none; b=C4ahYH9DqbBzXMOxjn7JY9O6VbWtYtNZKWCJaL3nT1Mr8kZRqm3tRUkVnAIEB0nErQK4OaDtSoB86LZeYbI55Jb5FmKWbZ92qYxioTway8hj4exswqbNmyIWCNo5pQM/UMpxZZObcY+BzEIQG8BTbyyhTt9HLRyZR1vRr8fugzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744015440; c=relaxed/simple;
	bh=RmKUxhGCaDfPpJywicPWios8UDu9ibXEEKvZ9YOdG2I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=iri0mhbKlK3m1Yhgj9Oi9eE/0z96TOdgIeTG9BwcT4VsRmKtYZ1WOFYl4kVLIsothrk9iKXcaxWaigbuBTCHIE+iDW2qKWEz3WI9VbCmzWhhQewRGYDhG6v6a4zAP27w5zXeIeYv7CEZT1grJZ+2c05Vu8r+fzmg1vmwsHQ92nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru; spf=pass smtp.mailfrom=ispras.ru; dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b=WWFWpwHc; arc=none smtp.client-ip=83.149.199.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ispras.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b="WWFWpwHc"
Received: from localhost (unknown [10.10.165.5])
	by mail.ispras.ru (Postfix) with ESMTPSA id E09E740755D8;
	Mon,  7 Apr 2025 08:43:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru E09E740755D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1744015429;
	bh=bVvnde9LYGm8pmSZbYF4pWYxMC89ikwIShwOp7lq0S4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=WWFWpwHcIfZjYXczFXwFVnIkCCTE5pxdgCH5GTgRq4R1bN19BTwm5vjkOd+iW5HhI
	 2/WVv2WX5LMKTygmUk8Jz9ryyW/XW9QZ+DsOK5Vah4+76C0eC7CgCg828jBGfJMpyN
	 7EM/7/YaGxH+MaXzz/pdKaPlabhEb5IOl5qlv28U=
Date: Mon, 7 Apr 2025 11:43:48 +0300
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: David Hildenbrand <david@redhat.com>, peterx@redhat.com
Cc: mawupeng <mawupeng1@huawei.com>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, x86@kernel.org, xrivendell7@gmail.com, wang1315768607@163.com, 
	fleischermarius@gmail.com, dave.hansen@linux.intel.com, luto@kernel.org, 
	peterz@infradead.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	hpa@zytor.com, akpm@linux-foundation.org
Subject: Re: [PATCH v1] x86/mm/pat: fix VM_PAT handling when fork() fails in
 copy_page_range()
Message-ID: <yph6s75zq4lpkrito7gzralkayxtibz4zxizzfjw43i73yldzv@o6lwk3rzvihy>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <262aa19c-59fe-420a-aeae-0b1866a3e36b@redhat.com>

Hi, David, Peter

Sorry for reviving an old thread. I've tried to keep the context as-is.
Here is an original link in the archives:
https://lore.kernel.org/lkml/20241029210331.1339581-1-david@redhat.com/T/#u

Please see below.

On 07.11.24 10:08, David Hildenbrand wrote
> On 07.11.24 09:43, mawupeng wrote:
> > On 2024/10/31 17:47, David Hildenbrand wrote:
> >> On 30.10.24 22:32, Peter Xu wrote:
> >>> On Tue, Oct 29, 2024 at 10:03:31PM +0100, David Hildenbrand wrote:
> >>>> If track_pfn_copy() fails, we already added the dst VMA to the maple
> >>>> tree. As fork() fails, we'll cleanup the maple tree, and stumble over
> >>>> the dst VMA for which we neither performed any reservation nor copied
> >>>> any page tables.
> >>>>
> >>>> Consequently untrack_pfn() will see VM_PAT and try obtaining the
> >>>> PAT information from the page table -- which fails because the page
> >>>> table was not copied.
> >>>>
> >>>> The easiest fix would be to simply clear the VM_PAT flag of the dst VMA
> >>>> if track_pfn_copy() fails. However, the whole thing is about "simply"
> >>>> clearing the VM_PAT flag is shaky as well: if we passed track_pfn_copy()
> >>>> and performed a reservation, but copying the page tables fails, we'll
> >>>> simply clear the VM_PAT flag, not properly undoing the reservation ...
> >>>> which is also wrong.
> >>>
> >>> David,
> >>>
> >>
> >> Hi Peter,
> >>
> >>> Sorry to not have chance yet reply to your other email..
> >>>
> >>> The only concern I have with the current fix to fork() is.. we started to
> >>> have device drivers providing fault() on PFNMAPs as vfio-pci does, then I
> >>> think it means we could potentially start to hit the same issue even
> >>> without fork(), but as long as the 1st pgtable entry of the PFNMAP range is
> >>> not mapped when the process with VM_PAT vma exit()s, or munmap() the vma.
> >>
> >> As these drivers are not using remap_pfn_range, there is no way they could currently get VM_PAT set.
> >>
> >> So what you describe is independent of the current state we are fixing here, and this fix should sort out the issues with current VM_PAT handling.
> >>
> >> It indeed is an interesting question how to handle reservations when *not* using remap_pfn_range() to cover the whole area.
> >>
> >> remap_pfn_range() handles VM_PAT automatically because it can do it: it knows that the whole range will map consecutive PFNs with the same protection, and we expect not parts of the range suddenly getting unmapped (and any driver that does that is buggy).
> >>
> >> This behavior is, however, not guaranteed to be the case when remap_pfn_range() is *not* called on the whole range.
> >>
> >> For that case (i.e., vfio-pci) I still wonder if the driver shouldn't do the reservation and leave VM_PAT alone.
> >>
> >> In the driver, we'd do the reservation once and not worry about fork() etc ... and we'd undo the reservation once the last relevant VM_PFNMAP VMA is gone or the driver let's go of the device. I assume there are already mechanisms in place to deal with that to some degree, because the driver cannot go away while any VMA still has the VM_PFNMAP mapping -- otherwise something would be seriously messed up.
> >>
> >> Long story short: let's look into not using VM_PAT for that use case.
> >>
> >> Looking at the VM_PAT issues we had over time, not making it more complicated sounds like a very reasonable thing to me :)
> > 
> > Hi David,
> > 
> > The VM_PAT reservation do seems complicated. It can trigger the same warning in get_pat_info if remap_p4d_range fails:
> > 
> > remap_pfn_range
> >    remap_pfn_range_notrack
> >      remap_pfn_range_internal
> >        remap_p4d_range	// page allocation can failed here
> >      zap_page_range_single
> >        unmap_single_vma
> >          untrack_pfn
> >            get_pat_info
> >              WARN_ON_ONCE(1);
> > 
> > Any idea on this problem?
> 
> In remap_pfn_range(), if remap_pfn_range_notrack() fails, we call 
> untrack_pfn(), to undo the tracking.
> 
> The problem is that zap_page_range_single() shouldn't do that 
> untrack_pfn() call.
> 
> That should be fixed by Peter's patch:
> 
> https://lore.kernel.org/all/20240712144244.3090089-1-peterx@redhat.com/T/#u


The fix seemingly has not been applied so the issue in question still
persists. There is a long thread on that patch without an explicit
conclusion. Did the patch cause any problems or its status changed?


Thanks for your time!


> 
> -- 
> Cheers,
> 
> David / dhildenb
> 
