Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF79722FE08
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 15:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745679798; cv=none; b=t8qsgicvsbXBoNLbvH7W/dy9ihY4+uiQXk6tRclKYSA8A+essrraKGmgveg8Subq+5tF3zxymTY4Hv6figlr+RUWoAY6p0j4vBiL8rxMfkcjfG4Zq9U6QgoNUAtZRQGD+TASXoJttZeXYLj16lrvsK8gqQVc6ozZVysgGp9EjmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745679798; c=relaxed/simple;
	bh=Vm8is0fZMA8KIAs1cGn6dnzN77suefz/64PXNNt+6pE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=omRSDlQ1OErMSn/W/mWC9oneZYYB6KQGm+tzHiAGjDyIZDkUuUDuD5YljVa6hZB6GXy/1rvjsQlMTc7FfGUg8HYnmBsATLykOvUanHkoLWjskChzBKXWWBKZU9wbT4yfabOu7rpdjuib4M+59BB54YdoizE8BO+9DpHVtcvtc70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bgBoFfuu; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bgBoFfuu"
Date: Sat, 26 Apr 2025 11:03:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745679792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nfBFNtrkXGpwEI1f8qxFcLLJ+djj3QoJA6M531zvfsg=;
	b=bgBoFfuucV1MYv23Sx+JWqkW37ke3hwsYGwVnAywb7CCGdvWPBhkaOVe6kU9Ji/OrgPuZc
	uGvUevBF2m4UPwGcFH4UmpGEcBGhSzOevfJ8QF+0V3v4p1nWfsLhK3c3f92fA3PXHCWFkM
	HbfMBFjpPoVmBYELvhEhkq2coWXPCgY=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: I Hsin Cheng <richard120310@gmail.com>
Cc: syzbot+549710bad9c798e25b15@syzkaller.appspotmail.com, 
	bfoster@redhat.com, linux-bcachefs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	davem@davemloft.net, herbert@gondor.apana.org.au, linux-crypto@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] bcachefs: Fix unit-value within btree_bounce_alloc()
Message-ID: <c32cu4mrdeln3kovzgehwjccfx2qpfh7evsgiug6ckshfux76q@ms6mab54ivy5>
References: <000000000000736bd406151001d7@google.com>
 <20250423163718.194316-1-richard120310@gmail.com>
 <ur4a24w2wb3euh3ej7ybeqnvmqyhzmqp2wwsjtilh6mfetv45l@qlxs3vggfq5h>
 <aAu-Heqb3malYkjI@vaxr-BM6660-BM6360>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAu-Heqb3malYkjI@vaxr-BM6660-BM6360>
X-Migadu-Flow: FLOW_OUT

On Sat, Apr 26, 2025 at 12:53:49AM +0800, I Hsin Cheng wrote:
> On Wed, Apr 23, 2025 at 12:45:20PM -0400, Kent Overstreet wrote:
> > On Thu, Apr 24, 2025 at 12:37:18AM +0800, I Hsin Cheng wrote:
> > > Use "kvzalloc()" instead of "kvmalloc()" in btree_bounce_alloc() to
> > > prevent uninit-value issue.
> > > 
> > > Reported-by: syzbot+549710bad9c798e25b15@syzkaller.appspotmail.com
> > > Closes: https://syzkaller.appspot.com/bug?extid=549710bad9c798e25b15
> > > Fixes: cb6fc943b650 ("bcachefs: kill kvpmalloc()")
> > > Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
> > > ---
> > > syzbot reported an uninit-value issue. [1]
> > > 
> > > Though the uninit value was detected in the context of crc32_body(), the
> > > memory was actually allocated in "btree_bounce_alloc()". Use
> > > "kvzalloc()" to allocate the memory can solve the issue, and I've tested
> > > against syzbot. [2]
> > > 
> > > If there're any further tests needed to be performed, please let me
> > > know. I'll be more than happy to assist you with that, thanks !
> > 
> > See Documentation/filesystems/bcachefs/SubmittingPatches.
> >
> 
> Sure ! Thanks for the info.
> 
> > And this isn't the correct fix - the correct fix is already in Linus's
> > tree.
> 
> Ahh ok, may I ask for the commit hash or title so I can learn from it ?

9c3a2c9b471a bcachefs: Disable asm memcpys when kmsan enabled
