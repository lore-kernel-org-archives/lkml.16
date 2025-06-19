Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B1435963
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 12:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750337219; cv=none; b=PafdQB/xWkyYYUbvrp1RwEcO06OYu2RaVpNcRcrE8gmHETBDbaJCG+MbYF5x2NokwXFkqL3mjoLQtZ3QxUcpnJzAwfYTvtJIu7HV1PC4Shaq1qrnooXMI81T5qtA4apZlVHABXskEkj5uzeTIfuIouI66ZPW1xnETjVdztbpMps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750337219; c=relaxed/simple;
	bh=8l1q+TBAI9HhwE2BKGaRYlrGQW21nfpsy+w1kz5Ns8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uehVVPi3IKofYOma9NCN6cOBZ5UE8Rrxtnmjx8KweJtZqPlH1C76+cZyJ9Y0hSHaSIeRuFSlQZCWZelvxKV4hqfDRFu1hS71nIr80IchxqHu/8DUq/ORdP51EfufNLgymgvOfWf74MZi0mRnPvViGekYwgczsaerxnNqlBJN9mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=Z3lXv73K; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=5FlSBCrg; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=Z3lXv73K; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=5FlSBCrg; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="Z3lXv73K";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="5FlSBCrg";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="Z3lXv73K";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="5FlSBCrg"
Received: from localhost (unknown [10.100.12.32])
	by smtp-out1.suse.de (Postfix) with ESMTP id 2E9CA211C6;
	Thu, 19 Jun 2025 12:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1750337216; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5+fM4MttKE3A03nChZO9COV7itbt2Km8YxBW6g7esUo=;
	b=Z3lXv73KiWY95pdfmh0Pfoybb2uI7JQ/GOM/KUE+4HCpm8wNwpLgJVMr1jyxA1mQ0kYTdq
	qo5CPob2oAwOuLqoPwuED71JRJlAKPh3UsqRt2Z2LXvQsvTlhOw5o4axHBOq6Iet9J7Zqz
	llCXE56uDd/TA5E44rbeitRFwFNHgKg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1750337216;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5+fM4MttKE3A03nChZO9COV7itbt2Km8YxBW6g7esUo=;
	b=5FlSBCrgaDGDUb9oa6w9IwyKfAfRQrd/oRtVGPljTKwpZAGsn5pONnUfbtqkNDE6Q1xbJR
	wBFaHrGrQ5zF6cBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1750337216; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5+fM4MttKE3A03nChZO9COV7itbt2Km8YxBW6g7esUo=;
	b=Z3lXv73KiWY95pdfmh0Pfoybb2uI7JQ/GOM/KUE+4HCpm8wNwpLgJVMr1jyxA1mQ0kYTdq
	qo5CPob2oAwOuLqoPwuED71JRJlAKPh3UsqRt2Z2LXvQsvTlhOw5o4axHBOq6Iet9J7Zqz
	llCXE56uDd/TA5E44rbeitRFwFNHgKg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1750337216;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5+fM4MttKE3A03nChZO9COV7itbt2Km8YxBW6g7esUo=;
	b=5FlSBCrgaDGDUb9oa6w9IwyKfAfRQrd/oRtVGPljTKwpZAGsn5pONnUfbtqkNDE6Q1xbJR
	wBFaHrGrQ5zF6cBQ==
Date: Thu, 19 Jun 2025 14:46:56 +0200
From: Jiri Bohac <jbohac@suse.cz>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>, Baoquan He <bhe@redhat.com>,
	Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
	kexec@lists.infradead.org, Philipp Rudo <prudo@redhat.com>,
	Donald Dutile <ddutile@redhat.com>, Pingfan Liu <piliu@redhat.com>,
	Tao Liu <ltao@redhat.com>, linux-kernel@vger.kernel.org,
	David Hildenbrand <dhildenb@redhat.com>,
	Michal Hocko <mhocko@suse.cz>
Subject: Re: [PATCH v5 4/5] kdump: wait for DMA to finish when using CMA
Message-ID: <aFQGwKGwGb69M9VS@dwarf.suse.cz>
References: <aEqnxxfLZMllMC8I@dwarf.suse.cz>
 <aEqpgDIBndZ5LXSo@dwarf.suse.cz>
 <20250612164735.76a1ea9a156cd254331ffdc4@linux-foundation.org>
 <925cdfc4-7878-4572-9a4d-9b99d149a652@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <925cdfc4-7878-4572-9a4d-9b99d149a652@redhat.com>
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	ARC_NA(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[localhost:helo]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -4.30

On Fri, Jun 13, 2025 at 11:19:11AM +0200, David Hildenbrand wrote:
> > It's sad to add a 10s delay for something which some systems will never
> > do.  I wonder if there's some simple hack we can add.  Like having a
> > global flag which gets set the first time someone pins a CMA page
> 
> We would likely have to do that for any GUP on such a page (FOLL_GET |
> FOLL_PIN), both from gup-fast and gup-slow.
> 
> Should work, but IMHO can be optimized later, on top of this series.

The 10 s was David's suggestion during the discussion of v2 of
this patchset. We already had a discussion about both the length
of the delay and whether to make it configurable [1] 

We agreed it was best to start with a longer fixed delay to be on the
safe side.

If the CMA reservation becomes popular and anybody complains
about the delay, then we can trivially make this configurable or
think of other improvements.

[1] https://lore.kernel.org/lkml/a1a5af90-bc8a-448a-81fa-485624d592f3@redhat.com/

-- 
Jiri Bohac <jbohac@suse.cz>
SUSE Labs, Prague, Czechia

