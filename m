Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C9621C9F1
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487496; cv=none; b=IJTsscU8GKd8voCBr7lJgFF8xwF2l7caznwjXVuH8GEzbpaE8Qa+6wkAfthuUQ74fAIX2XDRUTSrzwlQaKdICjrxTKOrQ0kGa31E2ANXuYLQaRJJpyM1XLRlHH4/sStyZN5paIKBTdhjcLEk4dW+t51a0ZTcXnK+0NDpecFkaGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487496; c=relaxed/simple;
	bh=FuJlduOQyXCFyeF3mH4fN6Q/13fmq7kiMrRfBbJMj7o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UIcpzVDbIrVklrvWfzlN/a8tVcUlF78pjBj18iHorHpnyY4MzFiCZhgj6c/xM2De/tBOt//0n7XsRcf9ClYsnpgdJ+W/kSdTUiKECVjC1y6hgxUyAIB4mI75fNUW93d7iaWQ/ef/IHGXo8ZhJPHsTtR8BQfl4vccckjuJHz0kKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W/zvold2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W/zvold2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26349C4CEE3;
	Thu, 24 Apr 2025 09:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745487495;
	bh=FuJlduOQyXCFyeF3mH4fN6Q/13fmq7kiMrRfBbJMj7o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W/zvold2hOQtPOLzBYH20bFl1T+MtgX/UQe2LtCH++T+9ar262StTYb9OL/3PR4GA
	 0dMsr72npxUQh59NwP0HEFMVW8nMsspoXbo78HnrIGTN9ZfrG00KdfL2bmFJM9Bzj1
	 TVDzaEMwijMcKNY337b7KjPbVcEqOMCxeyvcJwCnONrgIorpY2Q/qT0S8PxnYUAMr6
	 sr51RYfc8KK4rUyurniWI1bbWrt9do+s/SqDCS8pOPE6y5g8Xr4odnPRQ7iFgugjiv
	 AKqhN2kok21jQxiwS/zW3ULDWi5zLHu7Ivfy9///lL6P3vHegqZCAu0J5BlzFgod/y
	 KSSKEE3UrRMtw==
Date: Thu, 24 Apr 2025 11:38:08 +0200
From: Christian Brauner <brauner@kernel.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>, linux-kernel@vger.kernel.org, 
	mrpre@163.com, mkoutny@suse.com, 
	syzbot+adcaa842b762a1762e7d@syzkaller.appspotmail.com, syzbot+fab52e3459fa2f95df57@syzkaller.appspotmail.com, 
	syzbot+0718f65353d72efaac1e@syzkaller.appspotmail.com, Andrew Morton <akpm@linux-foundation.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Suren Baghdasaryan <surenb@google.com>, Wei Yang <richard.weiyang@gmail.com>, 
	David Hildenbrand <david@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>, 
	Mateusz Guzik <mjguzik@gmail.com>, Joel Granados <joel.granados@kernel.org>, 
	Jens Axboe <axboe@kernel.dk>, Wei Liu <wei.liu@kernel.org>, 
	Frederic Weisbecker <frederic@kernel.org>
Subject: Re: [PATCH v1] pid: annotate data-races around pid_ns->pid_allocated
Message-ID: <20250424-marsch-radio-fb7bf6484c05@brauner>
References: <20250423115542.7081-1-jiayuan.chen@linux.dev>
 <20250423135101.GA28646@redhat.com>
 <25a402bb9ddfecba22b5b24684d950494fc7410d@linux.dev>
 <20250423163818.GB28646@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250423163818.GB28646@redhat.com>

On Wed, Apr 23, 2025 at 06:38:18PM +0200, Oleg Nesterov wrote:
> On 04/23, Jiayuan Chen wrote:
> >
> > April 23, 2025 at 21:51, "Oleg Nesterov" <oleg@redhat.com> wrote:
> >
> >
> >
> > >
> > > On 04/23, Jiayuan Chen wrote:
> > >
> > > >
> > > > Suppress syzbot reports by annotating these accesses using
> > > >
> > > >  READ_ONCE() / WRITE_ONCE().
> > > >
> > >
> > > ...
> > >
> > > >
> > > > --- a/kernel/pid.c
> > > >
> > > >  +++ b/kernel/pid.c
> > > >
> > > >  @@ -122,7 +122,8 @@ void free_pid(struct pid *pid)
> > > >
> > > >  for (i = 0; i <= pid->level; i++) {
> > > >
> > > >  struct upid *upid = pid->numbers + i;
> > > >
> > > >  struct pid_namespace *ns = upid->ns;
> > > >
> > > >  - switch (--ns->pid_allocated) {
> > > >
> > > >  + WRITE_ONCE(ns->pid_allocated, READ_ONCE(ns->pid_allocated) - 1);
> > > >
> > > >  + switch (READ_ONCE(ns->pid_allocated)) {
> > > >
> > >
> > > I keep forgetting how kcsan works, but we don't need
> > >
> > > READ_ONCE(ns->pid_allocated) under pidmap_lock?
> > >
> > > Same for other functions which read/modify ->pid_allocated with
> > >
> > > this lock held.
> > >
> > > Oleg.
> > >
> >
> > However, not all places that read/write pid_allocated are locked,
> > for example:
> > https://web.git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/kernel/pid_namespace.c#n271
> > https://web.git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/kernel/fork.c#n2602
> >
> > So, in fact, the pidmap_lock is not effective. And if we were to add locks
> > to all these places, it would be too heavy.
> 
> It seems you misunderstood me. I didn't argue with the lockless READ_ONCE()s
> outside of pidmap_lock.

Agreed. We should only add those annotations where they're really
needed (someone once taught me ;).
