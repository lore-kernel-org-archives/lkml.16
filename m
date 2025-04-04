Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549E2194A59
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 12:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743770303; cv=none; b=dVDwkoP6CSeJNyw7O9mE+2DGfSK3IttiCf0cmj0stq3rKIJWBRRQUE00VtgWobGu7/VtxOKwySkF48AUBmFI8jUxMFS6lR/DY61KS3FIst1I/+Rqg5eGuL/KHLhQZ/Hv+knknRZGXHob9mMr8w1RhRMPy/li1jJ7fbmrKWR9aDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743770303; c=relaxed/simple;
	bh=RcMTWnmgUYFYD6VF2EaLBPiPWi7gChWHpBqLg+WBsDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IrJ0AJ/aTwGCrBNMBR8bmImlhU+qcxfxd+ZHEfNmPT3UzLtQ/9nPrGREGllsumeQ+W/pLEzmNBirI1l+3Hnens078M/hqvz57zbsMeX+a0zlTHLduY5eHH4hxF9i6x88DjlMtTaY6OVrEVXj/J5+hZ3RDAv1yELG5cBzErjF0fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F/+AP8wq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F/+AP8wq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743770299;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vJaPaLyX59V82xrNu9MClw/rdrscnEivzyc3CCiExGE=;
	b=F/+AP8wqkq08W22jJUmITR9S20Xr0YpDbNin+dUKFO/E/xSwAkXtgZ+T48/r+0BKto8cs0
	aMcNgwdH0xItZpThmC7LPoebqV+IcxIt18dB9Pq2WHisguD1fw4X5Xdo71Q4FObZDvGmIq
	Xhh60pXjtox9E3TFXN0j6C9fTUNSneQ=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-161-2cAwC4iSPuq49jUPtuNGyA-1; Fri,
 04 Apr 2025 08:38:18 -0400
X-MC-Unique: 2cAwC4iSPuq49jUPtuNGyA-1
X-Mimecast-MFC-AGG-ID: 2cAwC4iSPuq49jUPtuNGyA_1743770297
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F14E71956089;
	Fri,  4 Apr 2025 12:38:16 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.224.144])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 053553003777;
	Fri,  4 Apr 2025 12:38:13 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Fri,  4 Apr 2025 14:37:42 +0200 (CEST)
Date: Fri, 4 Apr 2025 14:37:38 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jeff Layton <jlayton@kernel.org>,
	Lennart Poettering <lennart@poettering.net>,
	Daan De Meyer <daan.j.demeyer@gmail.com>,
	Mike Yuan <me@yhndnzj.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 3/4] pidfd: improve uapi when task isn't found
Message-ID: <20250404123737.GC3720@redhat.com>
References: <20250403-work-pidfd-fixes-v1-0-a123b6ed6716@kernel.org>
 <20250403-work-pidfd-fixes-v1-3-a123b6ed6716@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403-work-pidfd-fixes-v1-3-a123b6ed6716@kernel.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On 04/03, Christian Brauner wrote:
>
> We currently report EINVAL whenever a struct pid has no tasked attached
> anymore thereby conflating two concepts:
>
> (1) The task has already been reaped.
> (2) The caller requested a pidfd for a thread-group leader but the pid
>     actually references a struct pid that isn't used as a thread-group
>     leader.
>
> This is causing issues for non-threaded workloads as in [1].
>
> This patch tries to allow userspace to distinguish between (1) and (2).
> This is racy of course but that shouldn't matter.
>
> Link: https://github.com/systemd/systemd/pull/36982 [1]
> Signed-off-by: Christian Brauner <brauner@kernel.org>

For this series:

Reviewed-by: Oleg Nesterov <oleg@redhat.com>


But I have a couple of cosmetic nits...

>  int pidfd_prepare(struct pid *pid, unsigned int flags, struct file **ret)
>  {
> -	bool thread = flags & PIDFD_THREAD;
> +	int err = 0;
>
> -	if (!pid_has_task(pid, thread ? PIDTYPE_PID : PIDTYPE_TGID))
> -		return -EINVAL;
> +	if (!(flags & PIDFD_THREAD)) {
> +		/*
> +		 * If this is struct pid isn't used as a thread-group
> +		 * leader pid but the caller requested to create a
> +		 * thread-group leader pidfd then report ENOENT to the
> +		 * caller as a hint.
> +		 */
> +		if (!pid_has_task(pid, PIDTYPE_TGID))
> +			err = -ENOENT;
> +	}
> +
> +	/*
> +	 * If this wasn't a thread-group leader struct pid or the task
> +	 * got reaped in the meantime report -ESRCH to userspace.
> +	 *
> +	 * This is racy of course. This could've not been a thread-group
> +	 * leader struct pid and we set ENOENT above but in the meantime
> +	 * the task got reaped. Or there was a multi-threaded-exec by a
> +	 * subthread and we were a thread-group leader but now got
> +	 * killed.

The comment about the multi-threaded-exec looks a bit misleading to me.
If this pid is a group-leader-pid and we race with de_thread() which does

		exchange_tids(tsk, leader);
		transfer_pid(leader, tsk, PIDTYPE_TGID);

nothing "bad" can happen, both pid_has_task(PIDTYPE_PID) or
pid_has_task(PIDTYPE_TGID) can't return NULL during (or after) this
transition.

hlists_swap_heads_rcu() or hlist_replace_rcu() can't make
hlist_head->first == NULL during this transition...

Or I misunderstood the comment?

And... the code looks a bit overcomplicated to me, why not simply

	int pidfd_prepare(struct pid *pid, unsigned int flags, struct file **ret)
	{
		if (!pid_has_task(pid, PIDTYPE_PID))
			return -ESRCH;

		if (!(flags & PIDFD_THREAD) && !pid_has_task(pid, PIDTYPE_TGID))
			return -ENOENT;

		return __pidfd_prepare(pid, flags, ret);
	}

? Of course, the comments should stay.

But again, this is cosmetic/subjective, please do what you like more.

Oleg.

