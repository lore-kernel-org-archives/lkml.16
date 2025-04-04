Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA787DF5C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 15:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743780708; cv=none; b=B18L8aIaUxdcta3ldGrYfLLBvWVLRk6cNepRdzYYAw9nibyy61vCRZ3l0IPfEtqPt2IVwhhKEdihT+6EFXiovOruET7Qc6yKNvGIYk2cUhbYt31KK5UpU7JwySTbFDpfz3Vbwfq4+IQH0DJw09qo2HwBgJ2pgRe+qx1zDVuIGNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743780708; c=relaxed/simple;
	bh=YjOPky1TTo3HvVSYzd7RGTHbZCLJ9vxvrTi5naZ8/h8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AJbKfM6pXLO4Eixek4Lz3VDg2O+3zvNFYw4iWImArLnRxUcT4jt16io1J4kdeXKzcOTtulJBfa6A3wYA7PuMZcYcYVZVkFD48rQd1iKicWPkFa+GY6u38XARGgdEtXfSQ2WH+9dI0nanZwh+rL94E+6+SpfIV8XFagyS53503OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VU3oVx0l; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VU3oVx0l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743780705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UQS5GEWXkE1a98PWN3ui8BdvvxM1bZVi0zRxnx5Ftgs=;
	b=VU3oVx0lh1MOnJMMTGBUyFnuvyWX29XfCmBAybgBDvID1G40r4u5uB3qZlQOpQE8qPMhUt
	szLoWQeTVI/W77kHl4H6DopAa0T9oe6sYre62+tMUYAHEmlxV96NYzA23GVnPJLeye9E7W
	ghKwId0MkfwiohC+J3oMgk1r8vwnjEw=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-672-v28c5QgsOXuHFLqK-a9xWw-1; Fri,
 04 Apr 2025 11:31:44 -0400
X-MC-Unique: v28c5QgsOXuHFLqK-a9xWw-1
X-Mimecast-MFC-AGG-ID: v28c5QgsOXuHFLqK-a9xWw_1743780703
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id ABEC719560B6;
	Fri,  4 Apr 2025 15:31:42 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.224.144])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id E480A1801752;
	Fri,  4 Apr 2025 15:31:39 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Fri,  4 Apr 2025 17:31:07 +0200 (CEST)
Date: Fri, 4 Apr 2025 17:31:04 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Breno Leitao <leitao@debian.org>
Cc: Mateusz Guzik <mjguzik@gmail.com>, akpm@linux-foundation.org,
	brauner@kernel.org, linux-kernel@vger.kernel.org,
	joel.granados@kernel.org, kernel-team@meta.com
Subject: Re: [PATCH] exit: skip IRQ disabled warning during power off
Message-ID: <20250404153103.GG3720@redhat.com>
References: <20250403-exit-v1-1-8e9266bfc4b7@debian.org>
 <CAGudoHG9LWyv7-ZoO_v3W62gXCYQoYujXRQhW7SbMENeydWj=Q@mail.gmail.com>
 <Z+/V5AzsSqY9ALqL@gmail.com>
 <20250404141623.GD3720@redhat.com>
 <Z+/3XO5Dh9mKiaE5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z+/3XO5Dh9mKiaE5@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On 04/04, Breno Leitao wrote:
>
> On Fri, Apr 04, 2025 at 04:16:24PM +0200, Oleg Nesterov wrote:
> > On 04/04, Breno Leitao wrote:
> > >
> > > 	[  254.474273] reboot: Power down
> > > 	[  254.479332] ------------[ cut here ]------------
> > > 	[  254.479934] WARNING: CPU: 0 PID: 1 at kernel/exit.c:881 do_exit (kernel/exit.c:881)
> >                                        ^^^^^^
> > confused... so it seems that the init task does
> > sys_reboot(LINUX_REBOOT_CMD_POWER_OFF) and exits?
> >
> > But if the init task exits for any reason it should trigger
> >
> > 	if (unlikely(is_global_init(tsk)))
> > 		panic("Attempted to kill init! exitcode=0x%08x\n"
>
> That is showing up later

OK, and this proves that we have more problems than just this WARN_ON().

Again, this is not my area, most probably I am wrong, but it seems to me
that do_exit() simply should not be called.

> We are discussing it on the other thread.
...
> Let's move this discussion to that thread, please.

Which thread? I wasn't cc'ed...

Oleg.

