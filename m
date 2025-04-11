Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3B82367B7
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 13:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744379732; cv=none; b=jl6VjpxiVNke/1Mm4FQmupqs03FtZGGNZqMAgLYmc69RoFbD9wNNh+eisVR495dK/MaUZay7ewBNGDbjtrpXboiB+McK/75fO93gYBARei7tkl8NgUHJuT6FPgUhHXb0MQzmLzp27OPmhOp3RPvIUoBHzb6rjUYgIDspvrRZe7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744379732; c=relaxed/simple;
	bh=tvYsWN1Ccz9X5YB0seXvg96UOPF0B6mWBhsZMMZHyT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YZY4fYo9Q74KRKCvuJnSUbZj/vfx7May5QjaFo5S3wcjhopKIFI5zBWsyZGEHoq8IRjvOYfCtapRDX1nmt3DGLvioGgQfvGfI7qfMsnASaFKYDEvVSJ9fD5OJ799qNZsj7iKVJYnSrHdc3W9hlnonUzUS+MWL/2y55lWoqRabzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GZLwHnRC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GZLwHnRC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744379729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KAQndSrC2ld3R5xSxtSooLszqBAKBxmB0lRGSpURGww=;
	b=GZLwHnRCQ3sJRps/+/GC82Ra0PSG+xF5AClJxjgfwusaO7mlhixzaDJJsr/+UM84CtIEjV
	yRhIGcwc6ndq0aFXmHWnyNxI5KnEe2UuS9tmgBVHxVhhHUiTIbaZGcO94pqEvdVjzzrudM
	aYRj6mBHUFn+36C0dboyr6mXb53d3Yk=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-408-RULT92WCP5aUWSV-5m2ewg-1; Fri,
 11 Apr 2025 09:55:27 -0400
X-MC-Unique: RULT92WCP5aUWSV-5m2ewg-1
X-Mimecast-MFC-AGG-ID: RULT92WCP5aUWSV-5m2ewg_1744379726
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A77CA19560B1;
	Fri, 11 Apr 2025 13:55:25 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.224.222])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 5E7B31828AAA;
	Fri, 11 Apr 2025 13:55:22 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Fri, 11 Apr 2025 15:54:50 +0200 (CEST)
Date: Fri, 11 Apr 2025 15:54:45 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jeff Layton <jlayton@kernel.org>,
	Lennart Poettering <lennart@poettering.net>,
	Daan De Meyer <daan.j.demeyer@gmail.com>,
	Mike Yuan <me@yhndnzj.com>, linux-kernel@vger.kernel.org,
	Peter Ziljstra <peterz@infradead.org>
Subject: Re: [PATCH v2 2/2] pidfs: ensure consistent ENOENT/ESRCH reporting
Message-ID: <20250411135445.GF5322@redhat.com>
References: <20250411-work-pidfs-enoent-v2-0-60b2d3bb545f@kernel.org>
 <20250411-work-pidfs-enoent-v2-2-60b2d3bb545f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411-work-pidfs-enoent-v2-2-60b2d3bb545f@kernel.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

For both patches:

Reviewed-by: Oleg Nesterov <oleg@redhat.com>

a minor nit below...

On 04/11, Christian Brauner wrote:
>
>  int pidfd_prepare(struct pid *pid, unsigned int flags, struct file **ret)
>  {
> -	int err = 0;
> -
> -	if (!(flags & PIDFD_THREAD)) {
> +	scoped_guard(spinlock_irq, &pid->wait_pidfd.lock) {
> +		/*
> +		 * If this wasn't a thread-group leader struct pid or
> +		 * the task already been reaped report ESRCH to
> +		 * userspace.
> +		 */
> +		if (!pid_has_task(pid, PIDTYPE_PID))
> +			return -ESRCH;

The "If this wasn't a thread-group leader struct pid" part of the
comment looks a bit confusing to me, as if pid_has_task(PIDTYPE_PID)
should return false in this case.

OTOH, perhaps it makes sense to explain scoped_guard(wait_pidfd.lock)?
Something like "see unhash_process -> wake_up_all(), detach_pid(TGID)
isn't possible if pid_has_task(PID) succeeds".

Oleg.

