Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EBB31ADC69
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 17:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738431763; cv=none; b=TYrk4UB8Q5bPydoUEq2RxUdz3hBOKdfU43tzCpzVJiPc1CMQu1k/KQHyosfLz+BcBnNqODWIyTsL6flobbqKFXaYEw/od8WE4orBFSks9IhUh5zKtyjPT3jj9w+8X1TqrTdrvdYcMi7CUAv+QnNnRiKvla9/bbIyS7ybsrIYbME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738431763; c=relaxed/simple;
	bh=k/+ZxOEWiVevXve2lTawBGxkVGBjYWvB09mK8pCJ8Ao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uUf3NvmmgjCHv93omxqSKP4HVF0uQJPR67sR/wraH3g9JavsV+6n3V2HYo6xmCqCs7RjRqwn92XmznGuKp6z6wqqFhOHGYx9JXJGqm/rcZSN8S8FVjHnNpxe4hbRAjFUjNzmSdf+hzvJw+gK0dUOra2m6QKuRMq7Rf6t6YNPE+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gCjPs72U; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gCjPs72U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738431758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=U+Cvxdil9FSRRnY1aPniEAAVDp4QhwhxZqsCBBkWUiE=;
	b=gCjPs72Uhe3TlKxY6Q3T35Hdgr4Ea/9iqLVw6dWolFWA1NX8Eb8eiWBMfR2pq9HgotpNAU
	rtdSl3gC4FOS0wHgYXjN64DUbtEOdGPnGaGeug7Xfa6U7YiIOp2yoQwL91Ycl3Atm10Kpg
	jcI1LwdAPiMueUnKaTA5rSRyTtOYXjQ=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-392-71nFFKxZOyahblyBDUFmsA-1; Sat,
 01 Feb 2025 12:42:35 -0500
X-MC-Unique: 71nFFKxZOyahblyBDUFmsA-1
X-Mimecast-MFC-AGG-ID: 71nFFKxZOyahblyBDUFmsA
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DDFC619560A1;
	Sat,  1 Feb 2025 17:42:33 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.224.16])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 346FB19560A3;
	Sat,  1 Feb 2025 17:42:30 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Sat,  1 Feb 2025 18:42:07 +0100 (CET)
Date: Sat, 1 Feb 2025 18:42:04 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: ebiederm@xmission.com, brauner@kernel.org, akpm@linux-foundation.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 6/6] pid: drop irq disablement around pidmap_lock
Message-ID: <20250201174203.GA26042@redhat.com>
References: <20250201163106.28912-1-mjguzik@gmail.com>
 <20250201163106.28912-7-mjguzik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250201163106.28912-7-mjguzik@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

I'll try to review on Monday, but I see nothing obviously wrong after
a very quick glance. Although I am not sure 4/6 is really useful, but
I won't argue.

However, shouldn't this patch also remove the comment which explains
the possible lock inversion? Above put_pid(),

	/*
	 * Note: disable interrupts while the pidmap_lock is held as an
	 * interrupt might come in and do read_lock(&tasklist_lock).
	 *
	 * If we don't disable interrupts there is a nasty deadlock between
	 * detach_pid()->free_pid() and another cpu that does
	 * spin_lock(&pidmap_lock) followed by an interrupt routine that does
	 * read_lock(&tasklist_lock);
	 *
	 * After we clean up the tasklist_lock and know there are no
	 * irq handlers that take it we can leave the interrupts enabled.
	 * For now it is easier to be safe than to prove it can't happen.
	 */

Oleg.

On 02/01, Mateusz Guzik wrote:
>
> It no longer serves any purpose now that the tasklist_lock ->
> pidmap_lock ordering got eliminated.
> 
> Signed-off-by: Mateusz Guzik <mjguzik@gmail.com>
> ---
>  kernel/pid.c | 23 +++++++++++------------
>  1 file changed, 11 insertions(+), 12 deletions(-)
> 
> diff --git a/kernel/pid.c b/kernel/pid.c
> index 73625f28c166..900193de4232 100644
> --- a/kernel/pid.c
> +++ b/kernel/pid.c
> @@ -115,11 +115,10 @@ static void delayed_put_pid(struct rcu_head *rhp)
>  void free_pid(struct pid *pid)
>  {
>  	int i;
> -	unsigned long flags;
>  
>  	lockdep_assert_not_held(&tasklist_lock);
>  
> -	spin_lock_irqsave(&pidmap_lock, flags);
> +	spin_lock(&pidmap_lock);
>  	for (i = 0; i <= pid->level; i++) {
>  		struct upid *upid = pid->numbers + i;
>  		struct pid_namespace *ns = upid->ns;
> @@ -142,7 +141,7 @@ void free_pid(struct pid *pid)
>  		idr_remove(&ns->idr, upid->nr);
>  	}
>  	pidfs_remove_pid(pid);
> -	spin_unlock_irqrestore(&pidmap_lock, flags);
> +	spin_unlock(&pidmap_lock);
>  
>  	call_rcu(&pid->rcu, delayed_put_pid);
>  }
> @@ -210,7 +209,7 @@ struct pid *alloc_pid(struct pid_namespace *ns, pid_t *set_tid,
>  		}
>  
>  		idr_preload(GFP_KERNEL);
> -		spin_lock_irq(&pidmap_lock);
> +		spin_lock(&pidmap_lock);
>  
>  		if (tid) {
>  			nr = idr_alloc(&tmp->idr, NULL, tid,
> @@ -237,7 +236,7 @@ struct pid *alloc_pid(struct pid_namespace *ns, pid_t *set_tid,
>  			nr = idr_alloc_cyclic(&tmp->idr, NULL, pid_min,
>  					      pid_max, GFP_ATOMIC);
>  		}
> -		spin_unlock_irq(&pidmap_lock);
> +		spin_unlock(&pidmap_lock);
>  		idr_preload_end();
>  
>  		if (nr < 0) {
> @@ -271,7 +270,7 @@ struct pid *alloc_pid(struct pid_namespace *ns, pid_t *set_tid,
>  
>  	upid = pid->numbers + ns->level;
>  	idr_preload(GFP_KERNEL);
> -	spin_lock_irq(&pidmap_lock);
> +	spin_lock(&pidmap_lock);
>  	if (!(ns->pid_allocated & PIDNS_ADDING))
>  		goto out_unlock;
>  	pidfs_add_pid(pid);
> @@ -280,18 +279,18 @@ struct pid *alloc_pid(struct pid_namespace *ns, pid_t *set_tid,
>  		idr_replace(&upid->ns->idr, pid, upid->nr);
>  		upid->ns->pid_allocated++;
>  	}
> -	spin_unlock_irq(&pidmap_lock);
> +	spin_unlock(&pidmap_lock);
>  	idr_preload_end();
>  
>  	return pid;
>  
>  out_unlock:
> -	spin_unlock_irq(&pidmap_lock);
> +	spin_unlock(&pidmap_lock);
>  	idr_preload_end();
>  	put_pid_ns(ns);
>  
>  out_free:
> -	spin_lock_irq(&pidmap_lock);
> +	spin_lock(&pidmap_lock);
>  	while (++i <= ns->level) {
>  		upid = pid->numbers + i;
>  		idr_remove(&upid->ns->idr, upid->nr);
> @@ -301,7 +300,7 @@ struct pid *alloc_pid(struct pid_namespace *ns, pid_t *set_tid,
>  	if (ns->pid_allocated == PIDNS_ADDING)
>  		idr_set_cursor(&ns->idr, 0);
>  
> -	spin_unlock_irq(&pidmap_lock);
> +	spin_unlock(&pidmap_lock);
>  
>  	kmem_cache_free(ns->pid_cachep, pid);
>  	return ERR_PTR(retval);
> @@ -309,9 +308,9 @@ struct pid *alloc_pid(struct pid_namespace *ns, pid_t *set_tid,
>  
>  void disable_pid_allocation(struct pid_namespace *ns)
>  {
> -	spin_lock_irq(&pidmap_lock);
> +	spin_lock(&pidmap_lock);
>  	ns->pid_allocated &= ~PIDNS_ADDING;
> -	spin_unlock_irq(&pidmap_lock);
> +	spin_unlock(&pidmap_lock);
>  }
>  
>  struct pid *find_pid_ns(int nr, struct pid_namespace *ns)
> -- 
> 2.43.0
> 

