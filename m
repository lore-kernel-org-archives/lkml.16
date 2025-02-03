Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4699020A5E3
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 18:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738608588; cv=none; b=blfMLZX2mtwYCX4jiTRYMlIXnaccNEwpmf2LSPsd3nzvhD0IHXDXolQxyaObKjJQcbDV/FBcU0Fp7eQjO/geaCxGGXA1JWQOeqSqZ7vBueCFHLo1YC2VMB2waYEZd0d3Op9Ktc/fc1u2NEeJH2QLDDUGNdCUjV52nczPVm3eddw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738608588; c=relaxed/simple;
	bh=d6hYo8oJLEsrDufjRmELuaP0GkcHq7XcJXDOEypAhpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kjuTEAcDoGGeH13GX0Q4Zkus/srAMa6CG4GPT3nZ5NR/R9VflqcqAnPmB3xLtfTlLiKW6sao8Hz36/uIbeUb4LUSeKrRHuJ8+mFedZjw6ex+qt6Aiu3y+0wRKfoXX4B5j/s7PgffQiT0AvDPhYJg9cdKwFnyqCyrPr1K+2WjEsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DWeOuU4F; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DWeOuU4F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738608584;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2O+cK3WutyAvi+DzyeiUHk8E59evi0QhMjNOpeuGYos=;
	b=DWeOuU4FBtP3Cho21YikDUF5WUFyCbiltI1ErEnTcJwdH5/g2nO6E/zRU1pa0MNd2O/pud
	GqPv/DwRLw58eXUPSGWeDFhldUAgvQlAybFvj4vDrGoU/sTtVUmP40xndqjRBDhDtDqtEx
	M4seA/+5yBNlvRwDHQFi3Krxlizphjc=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-634-a840UdVKOzupfVM_af1Y2A-1; Mon,
 03 Feb 2025 13:49:40 -0500
X-MC-Unique: a840UdVKOzupfVM_af1Y2A-1
X-Mimecast-MFC-AGG-ID: a840UdVKOzupfVM_af1Y2A
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 96B9519560AA;
	Mon,  3 Feb 2025 18:49:38 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.224.72])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id E26B519560A3;
	Mon,  3 Feb 2025 18:49:35 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Mon,  3 Feb 2025 19:49:12 +0100 (CET)
Date: Mon, 3 Feb 2025 19:49:08 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: ebiederm@xmission.com, brauner@kernel.org, akpm@linux-foundation.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/6] pid: perform free_pid() calls outside of
 tasklist_lock
Message-ID: <20250203184908.GD1003@redhat.com>
References: <20250201163106.28912-1-mjguzik@gmail.com>
 <20250201163106.28912-6-mjguzik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250201163106.28912-6-mjguzik@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

To avoid the confusion, my question and a note are absolutely offtopic.

On 02/01, Mateusz Guzik wrote:
>
> @@ -1085,6 +1085,7 @@ SYSCALL_DEFINE2(setpgid, pid_t, pid, pid_t, pgid)
>  {
>  	struct task_struct *p;
>  	struct task_struct *group_leader = current->group_leader;
> +	struct pid *pids[PIDTYPE_MAX] = { 0 };

Could you remind me why

	struct pid *pids[PIDTYPE_MAX] = {};

is not right? I seem to knew it some time before, but can't recall...

And just for the record, a note for myself. I need to recheck, but it seems
that the comment above flush_sigqueue(&tsk->pending) in __exit_signal() is
obsolete, so with some minimal changes we can move more work outside of
tasklist.

Oleg.

