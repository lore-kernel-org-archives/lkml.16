Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2821D23BCE3
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 10:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745575685; cv=none; b=ed6tx99iF9nzP38jCfXOGgLAM7ut6J2Schcbv+pf0A0/AXp+JgGKhliI69GaKjLCIG3ycxKZQcWwKF42Pvn0YhQhq8kfTUtgZfXjzyHMQPOR0WbiPQTfKU4JOxgL9b+U6nYQseqNVyYKL8MfuLYqiufLLpRYNy6d+VY2f9/0TP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745575685; c=relaxed/simple;
	bh=RbOCfUpnNaUeMgS18nPHmR6Rsmt7FCEuf9nQm74xq3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gegpp7ydvwQSYQeqzgvAoFvCBSpF3gagY7mk4aYu5AzXLLS1+w2/s3i7eL5HRRZTRJNL0/VNwjA1r+CZJXHSgLnPL7duiy8VhLvCF2/1ZKrtvrsXq5D/8sHaz8cX+pYEC7PF88sWO7slFba132HNyEpCNLPp0t/h95gyeqrISwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KYcECwT9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KYcECwT9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745575683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wCWDXuJuaWOovXQdKzwU0ohDqLv9bgc+JZP0GesYdB4=;
	b=KYcECwT9WGPudHzFwXegrZ7uCBn7wLm1LQ+EX5y3B+SsoKVLm7i6cYu0qIESL86iDDB/6g
	asCeVru+q4p6FJo6Wfou4Dvz7ejWPyQAZf+NxHLOFG/3i3Bm/enxLfS2Ep0weLa/SdtN++
	7DHbz6g5TSl71RRB2uDFZmgvI3jFG4M=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-381-YPOQJynNO4CzyAgpMYVfxw-1; Fri,
 25 Apr 2025 06:07:57 -0400
X-MC-Unique: YPOQJynNO4CzyAgpMYVfxw-1
X-Mimecast-MFC-AGG-ID: YPOQJynNO4CzyAgpMYVfxw_1745575675
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9CE8C180087A;
	Fri, 25 Apr 2025 10:07:54 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.226.93])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 79E5B1800352;
	Fri, 25 Apr 2025 10:07:47 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Fri, 25 Apr 2025 12:07:16 +0200 (CEST)
Date: Fri, 25 Apr 2025 12:07:07 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: linux-kernel@vger.kernel.org, mrpre@163.com, mkoutny@suse.com,
	syzbot+adcaa842b762a1762e7d@syzkaller.appspotmail.com,
	syzbot+fab52e3459fa2f95df57@syzkaller.appspotmail.com,
	syzbot+0718f65353d72efaac1e@syzkaller.appspotmail.com,
	Andrew Morton <akpm@linux-foundation.org>,
	Christian Brauner <brauner@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@Oracle.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Wei Yang <richard.weiyang@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Mateusz Guzik <mjguzik@gmail.com>,
	Joel Granados <joel.granados@kernel.org>,
	Bill O'Donnell <bodonnel@redhat.com>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>
Subject: Re: [PATCH v2] pid: annotate data-races around pid_ns->pid_allocated
Message-ID: <20250425100707.GA8093@redhat.com>
References: <20250425055824.6930-1-jiayuan.chen@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425055824.6930-1-jiayuan.chen@linux.dev>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On 04/25, Jiayuan Chen wrote:
>
> @@ -2584,7 +2584,7 @@ __latent_entropy struct task_struct *copy_process(
>  	rseq_fork(p, clone_flags);
>
>  	/* Don't start children in a dying pid namespace */
> -	if (unlikely(!(ns_of_pid(pid)->pid_allocated & PIDNS_ADDING))) {
> +	if (unlikely(!(data_race(ns_of_pid(pid)->pid_allocated & PIDNS_ADDING)))) {

Well. data_race() just hides the potential problem. READ_ONCE() makes more
sense imo, even if I think there are no real problems with the current code.

Either way,

> @@ -271,13 +271,13 @@ struct pid *alloc_pid(struct pid_namespace *ns, pid_t *set_tid,
>  	upid = pid->numbers + ns->level;
>  	idr_preload(GFP_KERNEL);
>  	spin_lock(&pidmap_lock);
> -	if (!(ns->pid_allocated & PIDNS_ADDING))
> +	if (!(data_race(ns->pid_allocated & PIDNS_ADDING)))

again, you do not need data_race() or READ_ONCE() if you read the
data protected by pidmap_lock. But you still need WRITE_ONCE() when
->pid_allocated is modified.

Oleg.

