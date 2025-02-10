Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68EDB25A2A8
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 18:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739212813; cv=none; b=Bq0tLjwSUSkQENDba0jejiKtvfxPC2unHNo6GxnYdcONpsEEF2WDgy0pRIyKWGDMD1sqw1yzioGmopzumZvSVEp9BQ87cq4KAq3K3RnHCANN9gdmiSrersOX0qKqBPQxtBkjYfMxVM5ar1fAHih+xlgfoGYdDFNDTT/ZQHHiex8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739212813; c=relaxed/simple;
	bh=2yYuNM1YTmnSsn1F2bIIYLKQ3xz/hapXWsnnxWgQWL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rEdWBcsOwyS237RGcrXNrWsniWjqlkeGDrstM5hoDSRXMXY8Uzq7tgexfkUZmlfIlU3sIAmXqQwvgwNuXEC9UYWGdhcyf/MTuMHWcbVbZSdui5vNPDH6XX9Q0upXDCofwqLsCWv4ARb7l04qDEXlnKxI5bKZF7P9kPS52ZKaAiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uvEA0Zz8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ItKVL2sb; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uvEA0Zz8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ItKVL2sb; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uvEA0Zz8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ItKVL2sb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uvEA0Zz8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ItKVL2sb"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 839872115B;
	Mon, 10 Feb 2025 18:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739212809; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z8eYSpepY8YjZg8SCKQmC3dIrcsgT/TVzJjXlabji/U=;
	b=uvEA0Zz8qz0omIOBwYQ2BVmYXXRaPGkbocvA7DblRQHo+1+1A2Cm/x08l2s76LbfcIKWvU
	I+0zm7a/l5UHtREYFD02rIQH/m06k65ydJuK81OxI2dUYGtjt8qaLkxyHMOSwb9/9YAZTk
	oUQ7xMnup1lsNyRXUW+MhhJ8LsNQnto=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739212809;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z8eYSpepY8YjZg8SCKQmC3dIrcsgT/TVzJjXlabji/U=;
	b=ItKVL2sbwewxplSSQj4PyQullyaDeTSfSi3MP0NqpQ/5LMln3TH1ClAAERCNbSzsTCOWH1
	3/UPcEclpmK64ACw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739212809; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z8eYSpepY8YjZg8SCKQmC3dIrcsgT/TVzJjXlabji/U=;
	b=uvEA0Zz8qz0omIOBwYQ2BVmYXXRaPGkbocvA7DblRQHo+1+1A2Cm/x08l2s76LbfcIKWvU
	I+0zm7a/l5UHtREYFD02rIQH/m06k65ydJuK81OxI2dUYGtjt8qaLkxyHMOSwb9/9YAZTk
	oUQ7xMnup1lsNyRXUW+MhhJ8LsNQnto=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739212809;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z8eYSpepY8YjZg8SCKQmC3dIrcsgT/TVzJjXlabji/U=;
	b=ItKVL2sbwewxplSSQj4PyQullyaDeTSfSi3MP0NqpQ/5LMln3TH1ClAAERCNbSzsTCOWH1
	3/UPcEclpmK64ACw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 005A213707;
	Mon, 10 Feb 2025 18:40:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ogCFOAhIqmf6dAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Mon, 10 Feb 2025 18:40:08 +0000
Date: Mon, 10 Feb 2025 19:39:59 +0100
From: Oscar Salvador <osalvador@suse.de>
To: Frank van der Linden <fvdl@google.com>
Cc: akpm@linux-foundation.org, muchun.song@linux.dev, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, yuzhao@google.com,
	usamaarif642@gmail.com, joao.m.martins@oracle.com,
	roman.gushchin@linux.dev
Subject: Re: [PATCH v3 00/28] hugetlb/CMA improvements for large systems
Message-ID: <Z6pH_9X-kFhwPz2-@localhost.localdomain>
References: <20250206185109.1210657-1-fvdl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206185109.1210657-1-fvdl@google.com>
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_TLS_ALL(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,linux.dev,kvack.org,vger.kernel.org,google.com,gmail.com,oracle.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 

On Thu, Feb 06, 2025 at 06:50:40PM +0000, Frank van der Linden wrote:
> v3:
> * Fix SPDX comment include file format.
> * Add new hugetlb_cma.* files to MAINTAINERS
> * Document new ranges/ subdir in CMA debugfs.
> * Fix powerpc compilation for config without HAVE_BOOTMEM_INFO_NODE
> * Fix various other nits found by kernel test robot.
> * Use a PFN value of -1 to indicate a non-mirrored mapping
>   in sparse-vmemmap.c, not 0.
> * Fix incorrect if() statement that got mangled in cma.c
> 
> v2:
> * Add missing CMA debugfs code.
> * Minor cleanups in hugetlb_cma changes.
> * Move hugetlb_cma code to its own file to further clean
>   things up.
> 
> On large systems, we observed some issues with hugetlb and CMA:
> 
> 1) When specifying a large number of hugetlb boot pages (hugepages=
>    on the commandline), the kernel may run out of memory before it
>    even gets to HVO. For example, if you have a 3072G system, and
>    want to use 3024 1G hugetlb pages for VMs, that should leave
>    you plenty of space for the hypervisor, provided you have the
>    hugetlb vmemmap optimization (HVO) enabled. However, since
>    the vmemmap pages are always allocated first, and then later
>    in boot freed, you will actually run yourself out of memory
>    before you can do HVO. This means not getting all the hugetlb
>    pages you want, and worse, failure to boot if there is an
>    allocation failure in the system from which it can't recover.
> 
> 2) There is a system setup where you might want to use hugetlb_cma
>    with a large value (say, again, 3024 out of 3072G like above),
>    and then lower that if system usage allows it, to make room
>    for non-hugetlb processes. For this, a variation of the problem
>    above applies: the kernel runs out of unmovable space to allocate
>    from before you finish boot, since your CMA area takes up all
>    the space.
> 
> 3) CMA wants to use one big contiguous area for allocations. Which
>    fails if you have the aforementioned 3T system with a gap in the
>    middle of physical memory (like the < 40bits BIOS DMA area seen on
>    some AMD systems). You then won't be able to set up a CMA area for
>    one of the NUMA nodes, leading to loss of half of your hugetlb
>    CMA area.
> 
> 4) Under the scenario mentioned in 2), when trying to grow the
>    number of hugetlb pages after dropping it for a while, new
>    CMA allocations may fail occasionally. This is not unexpected,
>    some transient references on pages may prevent cma_alloc
>    from succeeding under memory pressure. However, the hugetlb
>    code then falls back to a normal contiguous alloc, which may
>    end up succeeding. This is not always desired behavior. If
>    you have a large CMA area, then the kernel has a restricted
>    amount of memory it can do unmovable allocations from (a well
>    known issue). A normal contiguous alloc may eat further in to
>    this space.

Hi Frank,

While I plan to keep reviewing the series, I think it would make sense
to split this patchset into two smaller ones.
The way I see it, we are trying to deal with two different problems and their
solutions.

1) pre-hvo at boot time
2) multi-range support of CMA (only used for hugetlb)

I did not go through the entire patchset yet, so I ignore whether the
respective patches to tackle these two problems are really dependent on
each other, but I think that would be very interesting to consider a
patchset per solution if that is not the case.

IMHO, it would ease review quite a lot.


-- 
Oscar Salvador
SUSE Labs
