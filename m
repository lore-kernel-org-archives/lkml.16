Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D2323536F
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 16:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738860969; cv=none; b=jwcY9grmwyrOashulwvYyWxw6lIx1ze7YBNIWBjoCH3P5Sx+86GtsvI0cLnGiANwk+H1K1llVzWoWdwpTPZDvsekCq9+afk0eudabQMJQdbWGfyRy3EjhgTvlhII0BanbJO5v4hRcmOU7zOXHVyzt/3SwS+V1rUFpp1xsr5IbGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738860969; c=relaxed/simple;
	bh=nRi9kdS8EsQG90TCmLnFALcOEZ/59Y2EQ5JMu4ZEatw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=haHTyRMm71beu6cua5xy8w2im4cY04qB/u0fo/m5eJU5IcMMLJFXwm/uu5JeEYW8H1e3kjLncS4Q5bgoR9T21gZ3i4nLk2nSTBfSAyQ6pArUZCfCCcP6P8nJV7l4o/LX7PjMnfOIs+X0B/00un7WTUQp07d46yYOJqydA/8Lp8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CfuBVgS4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CfuBVgS4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738860966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gU80E8PV5a3vu2ip9PK9xHtZXsnxVCi/FTxDWOZyx3E=;
	b=CfuBVgS4mq6AxrPmp1PTsb+9aRnhXlDpihRssmMb+OmHrfqD+76vXK+6cy8l3jJgX1ww2n
	QiiLZnjaJJwSyAWKvsZBMorZsyZb+Y60GYgeN6SpdV1ufJKkLD7D09xmdzCSNiRi0M9By+
	CgD+0uTDKmnegp7HSBw33OnDjY9QspY=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-146-0MEF2YimMoKBRT07KNiYfw-1; Thu,
 06 Feb 2025 11:56:02 -0500
X-MC-Unique: 0MEF2YimMoKBRT07KNiYfw-1
X-Mimecast-MFC-AGG-ID: 0MEF2YimMoKBRT07KNiYfw
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1B2F219560B1;
	Thu,  6 Feb 2025 16:56:00 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.44.34.53])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 8099A1955BD4;
	Thu,  6 Feb 2025 16:55:56 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Thu,  6 Feb 2025 17:55:33 +0100 (CET)
Date: Thu, 6 Feb 2025 17:55:28 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Mateusz Guzik <mjguzik@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] exit: change the release_task() paths to call
 flush_sigqueue() lockless
Message-ID: <20250206165527.GD5209@redhat.com>
References: <20250206152244.GA14609@redhat.com>
 <20250206152314.GA14620@redhat.com>
 <Z6Ti-AoQC6EQzPWO@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6Ti-AoQC6EQzPWO@localhost.localdomain>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On 02/06, Frederic Weisbecker wrote:
>
> > TODO:
> > 	- we can probably shift posix_cpu_timers_exit() as well
>
> Hmm, can't a timer be concurrently deleted between __exit_signal() set
> tsk->sighand = NULL and release sighand lock, and the actual call to
> posix_cpu_timer_exit() ? And then posix_cpu_timer_exit() calls timerqueue_del()
> on a node that don't exist anymore?

Can't answer right now, I will think about it when/if I will actually try to
make this change ;) This "TODO" note just tries to explain what else we could
try to do, and "probably" means that I am not sure yet. I can remove this spam
from the changelog, but I'd prefer to keep it as a reminder, at least for myself.

> Reviewed-by: Frederic Weisbecker <frederic@kernel.org>

Thanks Frederic!

Oleg.

