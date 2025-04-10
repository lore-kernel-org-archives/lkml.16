Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFF41C174A
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 14:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744293908; cv=none; b=QjPL30XeyGEhMZvSyBGhAjzDej9Yn/OFW455WUWqXmGP6PPVYtJOSWUl/eMKlAtl08ZOLPJBFwm8ilNBCAQdIcjXtyA8/r1bEjf0P6H9GQmfO1DpInEuXIUANwtXuFz6QlDiTnqc7D7+I/pbr2cbi2xt3CNoN0nPhEyysO/gxYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744293908; c=relaxed/simple;
	bh=CnS2wbMMvP8BEycfQLoHnUik/B+c8egOMyHqz7ykxn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g/wI0PfAt7T14c3O+CVQ9GtMgGVFb0fAxlrKa+NYbSc9tOmKwD5bRE/2f/+2tCyJxlTWYNSB8RIyWosJd0FATLa6hiZ+6i71dg2tDQ2P0jgTMsMXXx5gMH6OB7SYWvyRDOH7a7cVQ9IYR5n0mZlXZWPrK7iaRg23gEKZOsAlblE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NDq0+EIz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NDq0+EIz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744293905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RsDQWTi2kQhu4s44bLJq1hHm6XUCRBgm1wmvO56Uxos=;
	b=NDq0+EIzVQxOIxC6e1STbS58Uqt9/3FKW6J0eJSGu3gAsGRyLTIMbVDoj13/bvMUi7Ah5Q
	0+AIgAuwxcr9KoZO1tgTfqxqjz1Ku+LDF/9jT1ATLAG4HyOG6QABHiGWGq7Y7Pi6qdHaF2
	FZnatda9NSlWCOC+bFkMbOqUwQLJskE=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-665-wMlA-w90P2GQarsq0k7C1g-1; Thu,
 10 Apr 2025 10:05:00 -0400
X-MC-Unique: wMlA-w90P2GQarsq0k7C1g-1
X-Mimecast-MFC-AGG-ID: wMlA-w90P2GQarsq0k7C1g_1744293892
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 286E21955DC6;
	Thu, 10 Apr 2025 14:04:51 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.224.222])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 50EFB180174E;
	Thu, 10 Apr 2025 14:04:44 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Thu, 10 Apr 2025 16:04:15 +0200 (CEST)
Date: Thu, 10 Apr 2025 16:04:08 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	Andy Lutomirski <luto@amacapital.net>, Dave Hansen <dave@sr71.net>,
	Brian Gerst <brgerst@gmail.com>, Borislav Petkov <bp@alien8.de>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Chang S . Bae" <chang.seok.bae@intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Fenghua Yu <fenghua.yu@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Uros Bizjak <ubizjak@gmail.com>
Subject: Re: [PATCH 4/8] x86/fpu: Remove the thread::fpu pointer
Message-ID: <20250410140407.GC15280@redhat.com>
References: <20250409211127.3544993-1-mingo@kernel.org>
 <20250409211127.3544993-5-mingo@kernel.org>
 <20250410073948.GT9833@noisy.programming.kicks-ass.net>
 <Z_eZMN4PcOwFnskB@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_eZMN4PcOwFnskB@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On 04/10, Ingo Molnar wrote:
>
> * Peter Zijlstra <peterz@infradead.org> wrote:
>
> > On Wed, Apr 09, 2025 at 11:11:23PM +0200, Ingo Molnar wrote:
> >
> > > -#define x86_task_fpu(task) ((task)->thread.fpu)
> > > +#define x86_task_fpu(task)	((struct fpu *)((void *)(task) + sizeof(*(task))))
> >
> > Doesn't our FPU state need to be cacheline aligned?
>
> Yeah, and we do have a check for that:
>
> +       BUILD_BUG_ON(sizeof(*dst) % SMP_CACHE_BYTES != 0);
>
> And task_struct is allocated cache-aligned, which means when we do this
> in fpu_clone():
>
> +       struct fpu *dst_fpu = (void *)dst + sizeof(*dst);
>
> the FPU pointer is guaranteed to be cacheline aligned as well.
>
> 'dst' in that context is the new task_struct.
>
> BTW., Oleg suggested in a previous discussion for us to replace the
> task->thread.fpu pointer with a build-time calculation - but I'm still
> not sure it's a good idea.

To be honest, I forgot everything we discussed before ;)

But I have found this email,
https://lore.kernel.org/all/20240616105550.GA18292@redhat.com/
Perhaps

	#define X86_TASK_SIZE	\
		ALIGN(sizeof(struct task_struct), __alignof__(union fpregs_state))

and
	#define x86_task_fpu(task)	\
		((struct fpu *)((void *)(task) + X86_TASK_SIZE))

plus a bit more similar changes make more sense than
__attribute__ ((aligned (64))) for struct task_struct?

OK, even if yes, we can do this later on top of this series.

I'll try to read it tomorrow.

Oleg.

