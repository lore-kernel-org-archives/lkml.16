Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD661D9A79
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 14:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743776229; cv=none; b=PZXQRS5BHKKwpH85ZaQCMWJmEPtp2NTi7rsv0z8x8qHQlmyS4CzTq5EdnBjSX5PzZAkS1nRot1cfskcsPQc/SkRjkMFKzA0ljmTHWA9AA+/GS7bobqPaFf8s+FNcDOecTl/kwyFmCpbSd/cKHrURT51ToZLHyEM5gtxt9IfzhP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743776229; c=relaxed/simple;
	bh=4ZxnAQDZKgHlf5WUC28RDe4KX204Bx/RCcHMFdGAd7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y4vLKNwVZvwxvfcykWH6wwCloCpoMWHw/EVherzM3AllYO4L3qrfW7KuveKbSJ0tjEKJm1TP1QLMlhwBNjQpLvkNSXVW+IZXJQfQgRQ8r2sZBmp4g7t67r+K2OQ6vPmD4VBFiW5gdG0RQ6THpege8HTrxvjqGZHeaJV8CqlhfLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IMXfR+n0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IMXfR+n0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743776227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QtQp47GVJhMX+QGz/uQPo1sGLKCjYZ/sLlP7wiUMWa0=;
	b=IMXfR+n0cz2s+dqIOGAp9UeNnZHPeM2WTyC7BwEkY9ByJrlS/004q5SF5MoADU5l+jS0f3
	kVCJta3WN9KcESKXASJoSYTx8QGVXsZeoA9sMX29tXEEdX3wNCXrQgl5Uop53U+8biLcS+
	FDwnzqkyCgW+ROyWqTxQd07CmCIlLS8=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-553-Y_K7vSSAP5isnBobcNZDKA-1; Fri,
 04 Apr 2025 10:17:04 -0400
X-MC-Unique: Y_K7vSSAP5isnBobcNZDKA-1
X-Mimecast-MFC-AGG-ID: Y_K7vSSAP5isnBobcNZDKA_1743776223
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4AB3C1955BC9;
	Fri,  4 Apr 2025 14:17:03 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.224.144])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 55E601828AB4;
	Fri,  4 Apr 2025 14:16:59 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Fri,  4 Apr 2025 16:16:28 +0200 (CEST)
Date: Fri, 4 Apr 2025 16:16:24 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Breno Leitao <leitao@debian.org>
Cc: Mateusz Guzik <mjguzik@gmail.com>, akpm@linux-foundation.org,
	brauner@kernel.org, linux-kernel@vger.kernel.org,
	joel.granados@kernel.org, kernel-team@meta.com
Subject: Re: [PATCH] exit: skip IRQ disabled warning during power off
Message-ID: <20250404141623.GD3720@redhat.com>
References: <20250403-exit-v1-1-8e9266bfc4b7@debian.org>
 <CAGudoHG9LWyv7-ZoO_v3W62gXCYQoYujXRQhW7SbMENeydWj=Q@mail.gmail.com>
 <Z+/V5AzsSqY9ALqL@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z+/V5AzsSqY9ALqL@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On 04/04, Breno Leitao wrote:
>
> 	[  254.474273] reboot: Power down
> 	[  254.479332] ------------[ cut here ]------------
> 	[  254.479934] WARNING: CPU: 0 PID: 1 at kernel/exit.c:881 do_exit (kernel/exit.c:881)
                                       ^^^^^^
confused... so it seems that the init task does
sys_reboot(LINUX_REBOOT_CMD_POWER_OFF) and exits?

But if the init task exits for any reason it should trigger

	if (unlikely(is_global_init(tsk)))
		panic("Attempted to kill init! exitcode=0x%08x\n"

below?

OK, it can be multi-threaded, but still this look like we have more
problems than just WARN_ON(irqs_disabled()).

> When pid=1 is being killed, then synchronize_group_exit() will be called
> with irq enabled (as shown by the warning above),

Hmm. synchronize_group_exit() is called right after WARN_ON(irqs_disabled())
you observe, WARN_ON() won't enable irqs?

Oleg.

