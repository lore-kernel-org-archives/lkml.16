Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9322186E2D
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 22:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743979431; cv=none; b=tjjc91HLQuLYVttHdzkhsFpJOrDvIF9Zs14qvyP5yIKw0GPcAFXIKJosrslZ/8FF38Qn8nMnSJc+hJNmTGUtdJRZfcn+1edrN9xp/k0YEj4seKVKBsVD2G9Mv7ea8VS5Wjf4FKjp9qeI1Zwov+bSLjQnWR1mW8ZsjC7IfzRMTN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743979431; c=relaxed/simple;
	bh=PPnslXylEhTtIqcZP1zA7VjxCnH22TgyFdaY9P/3FW8=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=mzvRMQPTQGGwIZuTGPDw8f2gGlXNIGWgToHl6PnU1EV4I86d1N5QrUGzsQViotYs7G7h9ShrKU60cIiPofIjgRsweA0rEbpyUN7jnhMySQdRayLNgAem4lnEJ2VC6UjyLKYIV7kSz8VlOjNTZyCz5ZvzaXaPWMajNuSIUdxk02Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=wuPMvxVC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="wuPMvxVC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0044AC4CEE3;
	Sun,  6 Apr 2025 22:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1743979431;
	bh=PPnslXylEhTtIqcZP1zA7VjxCnH22TgyFdaY9P/3FW8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=wuPMvxVCE8+4aiqtGExDnopvHAcsq6uBA8+PJ8FwpBrL+wivAF84r8joG6Pjyaz5+
	 q10idyUKzG83mIdwq69Ww9afBWPyfglXGwhLXi//rJALgNHz2b/v0TjRSVNH/gJ83j
	 B2LIp3iygXgBNHkRv5lx6JxN5sqeM31Gs38ANEAM=
Date: Sun, 6 Apr 2025 15:43:50 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Pedro Falcato
 <pfalcato@suse.de>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6.15] mm/vma: add give_up_on_oom option on modify/merge,
 use in uffd release
Message-Id: <20250406154350.c548ca25ef60b41fc86d5942@linux-foundation.org>
In-Reply-To: <20250321100937.46634-1-lorenzo.stoakes@oracle.com>
References: <20250321100937.46634-1-lorenzo.stoakes@oracle.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 21 Mar 2025 10:09:37 +0000 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:

> Currently, if a VMA merge fails due to an OOM condition arising on commit
> merge or a failure to duplicate anon_vma's, we report this so the caller
> can handle it.
> 
> However there are cases where the caller is only ostensibly trying a
> merge, and doesn't mind if it fails due to this condition.
> 
> Since we do not want to introduce an implicit assumption that we only
> actually modify VMAs after OOM conditions might arise, add a 'give up on
> oom' option and make an explicit contract that, should this flag be set, we
> absolutely will not modify any VMAs should OOM arise and just bail out.
> 
> Since it'd be very unusual for a user to try to vma_modify() with this flag
> set but be specifying a range within a VMA which ends up being split (which
> can fail due to rlimit issues, not only OOM), we add a debug warning for
> this condition.
> 
> The motivating reason for this is uffd release - syzkaller (and Pedro
> Falcato's VERY astute analysis) found a way in which an injected fault on
> allocation, triggering an OOM condition on commit merge, would result in
> uffd code becoming confused and treating an error value as if it were a VMA
> pointer.
> 
> To avoid this, we make use of this new VMG flag to ensure that this never
> occurs, utilising the fact that, should we be clearing entire VMAs, we do
> not wish an OOM event to be reported to us.
> 
> Many thanks to Pedro Falcato for his excellent analysis and Jann Horn for
> his insightful and intelligent analysis of the situation, both of whom were
> instrumental in this fix.
> 
> Reported-by: syzbot+20ed41006cf9d842c2b5@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/all/67dc67f0.050a0220.25ae54.001e.GAE@google.com/
> Fixes: 47b16d0462a4 ("mm: abort vma_modify() on merge out of memory failure")

I've added a cc:stable to this.

