Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC8022068D
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 12:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739191460; cv=none; b=uOSfhJy7LHN4ybbINUDrCc83y7FFgSJgyC5lFVuSFkmvHXa2bbT9hSeoO9LRZmwu2zOYMS9oRUjHpA5YQD6GCiAnyVAb5q/XuCHz0dpDBdBG7VD1oHluYirBQhN3xZdEjK6NFzZNYpq0xjldH87HY56B4+X0OycxhctTnlc2il0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739191460; c=relaxed/simple;
	bh=mANVFHxWCJ776gc2u1+WWQrudhEnyXLYKgpAYd6oINM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tr3O4lKRGivSulB6W/ci1aiMMfvmqBZDsU15wbd3SjWQkByJc0vxT4Fcz+FmPlIy9lHYYE8SbaClhAQkgszG6fdTtcdltxtydlpm3Jrf/gx88hP6TDYtAj6XL1rW5QfTZujKRRj01jqfBu7lipx4NGM29yAhFZvTPuN7ngG/c6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EAZ36+Y5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EAZ36+Y5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739191458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wgfiPQIv5/8AasTDk1SSI4A81+6rIbhJTTfC+jpz/Os=;
	b=EAZ36+Y5YL0T9RNYPSgMnhCXqKqIHRzXVxl53ulVxq8m8s8/OH6wibRli071PgEvzRU+F+
	pSGR+LMkJEHPLryswJNCMm0EsYfsOimcIPA9EHYG3dU2X/mBNWtI5axZQhC9QbM1Ab9PxW
	3Bmbv4kSVpZCiG4ZEBskZYfJjdk1p6k=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-687-Sv9hUTHdMCqiMsS5eOYDIA-1; Mon,
 10 Feb 2025 07:44:15 -0500
X-MC-Unique: Sv9hUTHdMCqiMsS5eOYDIA-1
X-Mimecast-MFC-AGG-ID: Sv9hUTHdMCqiMsS5eOYDIA
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7F92E1800982;
	Mon, 10 Feb 2025 12:44:13 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.224.113])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 1968019560A3;
	Mon, 10 Feb 2025 12:44:08 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Mon, 10 Feb 2025 13:43:46 +0100 (CET)
Date: Mon, 10 Feb 2025 13:43:41 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Michal Hocko <mhocko@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, linux-mm@kvack.org
Subject: Re: [PATCH 1/6 v2] task_work: Provide means to check if a work is
 queued
Message-ID: <20250210124340.GD32480@redhat.com>
References: <20250209223005.11519-1-frederic@kernel.org>
 <20250209223005.11519-2-frederic@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209223005.11519-2-frederic@kernel.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

On 02/09, Frederic Weisbecker wrote:
>
> @@ -56,6 +56,8 @@ int task_work_add(struct task_struct *task, struct callback_head *work,
>  {
>  	struct callback_head *head;
>
> +	work->next = TASK_WORK_DEQUEUED;

Do we really need to do this at the start of task_work_add() ?

If the caller didn't do init_task_work() before and task_work_add()
returns -EINVAL we probably do not care?

Reviewed-by: Oleg Nesterov <oleg@redhat.com>

