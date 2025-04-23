Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157C92857F7
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 16:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745426357; cv=none; b=OtykpO4TIjrE/NNvcD2EjF9UZOrgMkhDmALT0eH/UsQIga3tWGGcBZoAQTEkia4o5luz02OVtLbDkwKbIQ87ztcCb6hv6rqDD3/7Sud2rqH4VYnhZVc/s7ODAiT/lH1PUudxjis7E2Vg5ZGbfXYg2URFj1xWbCRWF1ccpMTm+TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745426357; c=relaxed/simple;
	bh=plmt37+NJ9KDS+Gc+PCjuyICW4nUcTa4M2d1BD5kTGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lRGXApZwBuP9aszMyMdzVO0Caln8E4tCkGlnfdvwGRRTRToe4qcdnFYYFK5Q1Os+KS+2UE1GwyI4KMcnLEMwQ93XVk/u371cmAAiVvHUkkY0ZHcbTUDy+zem5JGiaPOSXEbHSluvz14UU6pc8xpSB0DmwD7i8Kz3+xwl+54G3X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Jyzq3IKa; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Jyzq3IKa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745426354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LfhBWdt9nBVM628Ucv7Xknt7CQOazsruA1q4SLG/onw=;
	b=Jyzq3IKaddhrXt5Im8uek1a6RO7ghcTIu6hAQjabwPXoNyjhq4fGBDFQY6bxUvm7c/d/Kk
	xfQ+k24vwbZx1/zfnObUFa/5umCqGcToGFcCOLNmpUBPYLFnjbONLlNoCsvP8jR26SNBdt
	fBbtQyEiZM90EXykAvtTAbmOtw53wpc=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-220-FA-zOvbcNzy3DuiVYJWt9Q-1; Wed,
 23 Apr 2025 12:39:09 -0400
X-MC-Unique: FA-zOvbcNzy3DuiVYJWt9Q-1
X-Mimecast-MFC-AGG-ID: FA-zOvbcNzy3DuiVYJWt9Q_1745426346
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1FFCA1800877;
	Wed, 23 Apr 2025 16:39:06 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.224.39])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id AD9D6180045B;
	Wed, 23 Apr 2025 16:38:58 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Wed, 23 Apr 2025 18:38:27 +0200 (CEST)
Date: Wed, 23 Apr 2025 18:38:18 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: linux-kernel@vger.kernel.org, mrpre@163.com, mkoutny@suse.com,
	syzbot+adcaa842b762a1762e7d@syzkaller.appspotmail.com,
	syzbot+fab52e3459fa2f95df57@syzkaller.appspotmail.com,
	syzbot+0718f65353d72efaac1e@syzkaller.appspotmail.com,
	Andrew Morton <akpm@linux-foundation.org>,
	Christian Brauner <brauner@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Wei Yang <richard.weiyang@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Mateusz Guzik <mjguzik@gmail.com>,
	Joel Granados <joel.granados@kernel.org>,
	Jens Axboe <axboe@kernel.dk>, Wei Liu <wei.liu@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>
Subject: Re: [PATCH v1] pid: annotate data-races around pid_ns->pid_allocated
Message-ID: <20250423163818.GB28646@redhat.com>
References: <20250423115542.7081-1-jiayuan.chen@linux.dev>
 <20250423135101.GA28646@redhat.com>
 <25a402bb9ddfecba22b5b24684d950494fc7410d@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <25a402bb9ddfecba22b5b24684d950494fc7410d@linux.dev>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On 04/23, Jiayuan Chen wrote:
>
> April 23, 2025 at 21:51, "Oleg Nesterov" <oleg@redhat.com> wrote:
>
>
>
> >
> > On 04/23, Jiayuan Chen wrote:
> >
> > >
> > > Suppress syzbot reports by annotating these accesses using
> > >
> > >  READ_ONCE() / WRITE_ONCE().
> > >
> >
> > ...
> >
> > >
> > > --- a/kernel/pid.c
> > >
> > >  +++ b/kernel/pid.c
> > >
> > >  @@ -122,7 +122,8 @@ void free_pid(struct pid *pid)
> > >
> > >  for (i = 0; i <= pid->level; i++) {
> > >
> > >  struct upid *upid = pid->numbers + i;
> > >
> > >  struct pid_namespace *ns = upid->ns;
> > >
> > >  - switch (--ns->pid_allocated) {
> > >
> > >  + WRITE_ONCE(ns->pid_allocated, READ_ONCE(ns->pid_allocated) - 1);
> > >
> > >  + switch (READ_ONCE(ns->pid_allocated)) {
> > >
> >
> > I keep forgetting how kcsan works, but we don't need
> >
> > READ_ONCE(ns->pid_allocated) under pidmap_lock?
> >
> > Same for other functions which read/modify ->pid_allocated with
> >
> > this lock held.
> >
> > Oleg.
> >
>
> However, not all places that read/write pid_allocated are locked,
> for example:
> https://web.git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/kernel/pid_namespace.c#n271
> https://web.git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/kernel/fork.c#n2602
>
> So, in fact, the pidmap_lock is not effective. And if we were to add locks
> to all these places, it would be too heavy.

It seems you misunderstood me. I didn't argue with the lockless READ_ONCE()s
outside of pidmap_lock.

Oleg.

