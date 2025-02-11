Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA451E231F
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 18:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739298056; cv=none; b=Bh2A3H8L4goQQav5LzwJEy8kiuqfas+jVnD81ncl56Z1Ck97Y/DTdZCUR0wlw6JWL5zXNBunmT2pGlby5kcRJGUCd5UEHF3xT8RI3Zl/rk86zfRnnr8NjJ+fXNaK0eVOq5KYDN8O6+B3DqKzrpiJZ/IkI2Ba2z52u1r0ZFYxSOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739298056; c=relaxed/simple;
	bh=BwSdJG1qEJ5lEgTCCL0KL5wh2iaU3ANvXOSfLUO/pcg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DsuNVRpjyMzu0LOE0Wf0KKITj7pDn6qP/69Cq195IWin6WRmETiH8AX77ri0x4npSFKdxV0LQYaAYGGG5Dkr0omn6UnqUVXdsSCxP0zzsy2KoHX0QRLGagEW2UkrZmf3B5dlk4vw+fxX5ojb8CBXr8wGf+NBeDODt4A0EGF/2X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q40V6VAR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q40V6VAR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 092C3C4CEDD;
	Tue, 11 Feb 2025 18:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739298056;
	bh=BwSdJG1qEJ5lEgTCCL0KL5wh2iaU3ANvXOSfLUO/pcg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q40V6VARP9HS+qSSiQamUqzvCGGtIFWRf+E9o8RKRgYt8LVDpKJl/ZLDAPvMGzOVD
	 zbT8n6ARq6iGZaQwIAh8rOuRkZuwCM43OIDur2tqv5pyhD6DF/GGJgLZA8Ii/qB7l4
	 041zMtvgMJgBQ2yNCxnZOYcYPJbQUG0SDnORDtPtxCBOPVDSfqWLYLmzpFE10XXjgr
	 p9XMri0TsSkX3fluWvycmbh609jern9FMQRo3/F8cOJWIeWwF3YFXqM3eWY20LQmIW
	 0yYCAqpkrvOuhXe03mt5Pf95HOPQEAgh/4ITBT2HMv7R753tRvReIjVr3gg9cx6eNf
	 p8rGQNGMqjJtQ==
From: SeongJae Park <sj@kernel.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: SeongJae Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <howlett@gmail.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	"Lai, Yi" <yi1.lai@linux.intel.com>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH mm-unstable] mm/madvise: handle MADV_{HWPOISON,SOFT_OFFLINE} from madvise_unlock()
Date: Tue, 11 Feb 2025 10:20:53 -0800
Message-Id: <20250211182053.3639-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <2f448f7b-1da7-4099-aa9e-0179d47fde40@lucifer.local>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 11 Feb 2025 10:51:41 +0000 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:

> +cc Naresh, Arnd for another reports/discussion of the same issue [0] while
> lore/lei is broken.
> 
> Hi,
> 
> Lore breaking means I missed this :) thankfully you cc'd me (_this_ is why I am
> so adament about people following get_maintainer.pl procedure btw) so I was able
> to now notice + reply :)
> 
> This is totally my bad for missing this on review, so mea culpa.

No worry, your reviews are always very helpful!

> 
> [0]:https://lwn.net/ml/linux-mm/CA+G9fYt5QwJ4_F8fJj7jx9_0Le9kOVSeG38ox9qnKqwsrDdvHQ@mail.gmail.com/
> 
> On Mon, Feb 10, 2025 at 10:32:01PM -0800, SeongJae Park wrote:
> > madvise_lock() does nothing for MADV_HWPOSION and MADV_SOFT_OFFLINE
> > behavior, but madvise_unlock() does mmap_lock unlocking regardless of
> > the behavior.
[...]
> >  mm/madvise.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/mm/madvise.c b/mm/madvise.c
> > index b5ef8e03d8b0..b8969457f3ef 100644
> > --- a/mm/madvise.c
> > +++ b/mm/madvise.c
> > @@ -1577,7 +1577,6 @@ int madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
> >
> >  static int madvise_lock(struct mm_struct *mm, int behavior)
> >  {
> > -
> >  #ifdef CONFIG_MEMORY_FAILURE
> >  	if (behavior == MADV_HWPOISON || behavior == MADV_SOFT_OFFLINE)
> >  		return 0;
> > @@ -1595,6 +1594,11 @@ static int madvise_lock(struct mm_struct *mm, int behavior)
> >
> >  static void madvise_unlock(struct mm_struct *mm, int behavior)
> >  {
> > +#ifdef CONFIG_MEMORY_FAILURE
> > +	if (behavior == MADV_HWPOISON || behavior == MADV_SOFT_OFFLINE)
> > +		return;
> > +#endif
> 
> I agree this fixes the issue but this is horrible. let's abstract this please
> rather than doing the same crap that already existed, only now twice.

I agree abstracting this is a better idea.

> 
> > +
> >  	if (madvise_need_mmap_write(behavior))
> >  		mmap_write_unlock(mm);
> >  	else
> >
> > base-commit: 8bf30f9d23eb5040d37e6e712789cee8e71e1577
> > --
> > 2.39.5
> 
> I attach a fix-patch concept for something I think that'd be nicer, do with
> it what thy wilt! :P sorry I don't mean to be 'one of those' maintainers
> who copy/pastes code + demands somebody do it (by no means do I do so), but
> since this is so small I feel it's kind of quicker for me to do it this
> way.
> 
> Obviously take it or leave it/adapt it/etc. This is compile-tested only...

I further ran the repro program and confirmed this fixes the issue :)

> 
> ----8<----
> From 9fce3e47bf0fff2a2291be66002af346cdbca665 Mon Sep 17 00:00:00 2001
> From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Date: Tue, 11 Feb 2025 10:44:26 +0000
> Subject: [PATCH] mm/madvise: fix madvise_[un]lock() issue
> 
> We are asymmetric in our locking/unlocking in the case of memory failure
> madvise() behaviour options, correct this and abstract the memory failure
> check.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Reviewed-by: SeongJae Park <sj@kernel.org>
Tested-by: SeongJae Park <sj@kernel.org>


Thanks,
SJ

[...]
