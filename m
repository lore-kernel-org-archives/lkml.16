Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2377179A7
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 18:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739212630; cv=none; b=tbst8ia5O3OX0Xt09VYZkNXnbs02JW2gDCnc64mYE1gwLrwkA/m3NHW+9t92ZyVMoV+JANvnS6vqQ1drKUCgJKnDkws8jBcHT//Q/Hr2CKx4/0ki5C5yfkCDfGMNxDB33IMYo5O+pVEAhTY/2Ew8a4mI7LEhu5WyC+cvhPAKXww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739212630; c=relaxed/simple;
	bh=plrszGEhhOJeVjyC7n+aazHGZNIi5qc55aIExBaQAL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s+p5eSVtJ+4tEAF9D35EejpuxPtzawSLI5uV6zlAhQtW1+iO/Wd6RVqNcsaJU7QziaM+SFn7OUaSJd4OC5WQjp9nHjKw8XrzJiXb96wiVyO3z7nugv9cTRbMCvI2U1xQGUVrqq9txeI2+dSmAENKVFPcp7kFmoLxCQis5P8/25I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Lz/8RMCM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Lz/8RMCM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739212627;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PXcd8TMhIQd0dY517RowXz7dN5q0sny2C8JBNAV9EvA=;
	b=Lz/8RMCMY+2iXv2zZhUcE4ImacgpD4A9TbmopGDIphhxFtUBtGi6xBxpvoRf9eAMJ/+aSG
	iMke9xC2UcE8XBYQeVPcd3iDCEWx36l5dAWer19wGQBLk/hkhqzaz9/tsvbiBHdaWgfROl
	F5SBk/afrgHViTS4YvxCHWqOz0wU5kE=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-329-7KP284FwOC2iUJDr_7ciuA-1; Mon,
 10 Feb 2025 13:37:04 -0500
X-MC-Unique: 7KP284FwOC2iUJDr_7ciuA-1
X-Mimecast-MFC-AGG-ID: 7KP284FwOC2iUJDr_7ciuA
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CC37E19560B1;
	Mon, 10 Feb 2025 18:37:02 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.224.113])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id BFC961956094;
	Mon, 10 Feb 2025 18:36:57 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Mon, 10 Feb 2025 19:36:36 +0100 (CET)
Date: Mon, 10 Feb 2025 19:36:29 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>,
	Christian Brauner <brauner@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	David Howells <dhowells@redhat.com>,
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>,
	Mateusz Guzik <mjguzik@gmail.com>,
	Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>,
	Oliver Sang <oliver.sang@intel.com>,
	Swapnil Sapkal <swapnil.sapkal@amd.com>,
	WangYuli <wangyuli@uniontech.com>, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] pipe: change pipe_write() to never add a zero-sized
 buffer
Message-ID: <20250210183629.GJ32480@redhat.com>
References: <20250209150749.GA16999@redhat.com>
 <CAHk-=wgYC-iAp4dw_wN3DBWUB=NzkjT42Dpr46efpKBuF4Nxkg@mail.gmail.com>
 <20250209180214.GA23386@redhat.com>
 <CAHk-=whirZek1fZQ_gYGHZU71+UKDMa_MYWB5RzhP_owcjAopw@mail.gmail.com>
 <20250209184427.GA27435@redhat.com>
 <CAHk-=wihBAcJLiC9dxj1M8AKHpdvrRneNk3=s-Rt-Hv5ikqo4g@mail.gmail.com>
 <20250209191510.GB27435@redhat.com>
 <b050f92e-4117-4e93-8ec6-ec595fd8570a@amd.com>
 <20250210172200.GA16955@redhat.com>
 <CAHk-=wj8V1v6QmJ_8X6zznautRq29tXMYzxorOniFx4NtxRE1A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wj8V1v6QmJ_8X6zznautRq29tXMYzxorOniFx4NtxRE1A@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

On 02/10, Linus Torvalds wrote:
>
> On Mon, 10 Feb 2025 at 09:22, Oleg Nesterov <oleg@redhat.com> wrote:
> >
> > +               int avail = PAGE_SIZE - offset;
> >
> > -               if ((buf->flags & PIPE_BUF_FLAG_CAN_MERGE) &&
> > -                   offset + chars <= PAGE_SIZE) {
> > +               if (avail && (buf->flags & PIPE_BUF_FLAG_CAN_MERGE)) {
> >                         ret = pipe_buf_confirm(pipe, buf);
> >                         if (ret)
> >                                 goto out;
> >
> > +                       chars = min_t(ssize_t, chars, avail);
>
> If I read this correctly, this patch is horribly broken.
>
> You can't do partial writes. Pipes have one very core atomicity
> guarantee: from the man-pages:
>
>    PIPE_BUF
>        POSIX.1 says that writes of less than PIPE_BUF bytes must be
>        atomic:

Ah, I didn't know!

Thanks for your explanation and the quick NACK!

> Maybe we should add a comment somewhere about this.

Agreed. It would certainly help the ignorant readers like me ;)

So I guess that the "goto again" logic in sender/receiver in
tools/perf/bench/sched-messaging.c is currently pointless,
DATASIZE == 100 < PIPE_BUF.

Thanks.

Oleg.

