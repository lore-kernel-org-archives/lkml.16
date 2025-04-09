Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5814926AA96
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 15:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744213932; cv=none; b=Mj6gEgE5LsWXAmw3HuooYWj9f2Zb7Vmjk1Cm7X20RIYYir+LWdkocsOnV/3HEXk4/JhrCdpBTS3weOVEQ0Wh3Srlb6ZWom6gbk2Cp8bco3rpFao1Wlt4/wJZVu7beeteo8hmzten5yFqSOwbQBZQA7ff8TdT0GCFS6uu4TOfTKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744213932; c=relaxed/simple;
	bh=tLLTz7hDmIxg2zVDjOhyRH3s2MEVGMXH2ddl1AzN+kQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dMmxnfFjRTfyAkQWW9pmRufyZSdvEUE6XqfAnST6BHUdzQh2UhH96CPjj8mzhqXkL7ObN4ueVtFj8I98wtq5NYzf9VR6R6oJHtywQxlkWQa4tCatM8Z2i/OeIMvdDA7QS51rGQspqtJ4JhURMTO2Xh+m2+kay7M+yDfi9E5p7B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MOB2u/GB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MOB2u/GB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A5F5C4CEE3;
	Wed,  9 Apr 2025 15:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744213931;
	bh=tLLTz7hDmIxg2zVDjOhyRH3s2MEVGMXH2ddl1AzN+kQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MOB2u/GB6ZTUPw14DQTZvNNvnZCV2wUCLXhKOw/eqp9SPQ3/zjnOu3yzpCpWQXXX0
	 LPyYLK1jLOFWDQsCqVKnaBSSTG3tRxPhhJXXiScyDpCD033uf6yoxSJu3FVs2mOIhN
	 iaZ5L5iKVZy5qJM9ptspfK0UBTEXSWZAm6jLYnlo8Y7XO1SkuGI7kWk0jtMfXusK3g
	 0I6ED+RMH29uPJTVl1qo8ftxRk3Z5eoa+OdDp9TreDTwAdZQrx8hHHMWu2zDTwuvDJ
	 /hP8cx6teMmidGpe8eQexzy5LsY56+JagzN6Cwi9rip3f7fvYILsgGcWgHZffb993F
	 6aSPAKz5+d/3A==
Date: Wed, 9 Apr 2025 08:52:07 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: "Dmitry V. Levin" <ldv@strace.io>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Arnd Bergmann <arnd@arndb.de>, strace-devel@lists.strace.io,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v7 2/6] syscall.h: add syscall_set_arguments()
Message-ID: <20250409155207.GA1506425@ax162>
References: <20250303111910.GA24170@strace.io>
 <20250303112009.GC24170@strace.io>
 <20250408213131.GA2872426@ax162>
 <20250408223611.GA26876@strace.io>
 <20250409003803.GA2876360@ax162>
 <20250409064017.GA30836@strace.io>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409064017.GA30836@strace.io>

On Wed, Apr 09, 2025 at 09:40:18AM +0300, Dmitry V. Levin wrote:
> On Tue, Apr 08, 2025 at 05:38:03PM -0700, Nathan Chancellor wrote:
> > diff --git a/arch/riscv/include/asm/syscall.h b/arch/riscv/include/asm/syscall.h
> > index a5281cdf2b10..34313387f977 100644
> > --- a/arch/riscv/include/asm/syscall.h
> > +++ b/arch/riscv/include/asm/syscall.h
> > @@ -69,8 +69,11 @@ static inline void syscall_get_arguments(struct task_struct *task,
> >  					 unsigned long *args)
> >  {
> >  	args[0] = regs->orig_a0;
> > -	args++;
> > -	memcpy(args, &regs->a1, 5 * sizeof(args[0]));
> > +	args[1] = regs->a1;
> > +	args[2] = regs->a2;
> > +	args[3] = regs->a3;
> > +	args[4] = regs->a4;
> > +	args[5] = regs->a5;
> >  }
> >  
> >  static inline void syscall_set_arguments(struct task_struct *task,
> > @@ -78,8 +81,11 @@ static inline void syscall_set_arguments(struct task_struct *task,
> >  					 const unsigned long *args)
> >  {
> >  	regs->orig_a0 = args[0];
> > -	args++;
> > -	memcpy(&regs->a1, args, 5 * sizeof(regs->a1));
> > +	regs->a1 = args[1];
> > +	regs->a2 = args[2];
> > +	regs->a3 = args[3];
> > +	regs->a4 = args[4];
> > +	regs->a5 = args[5];
> >  }
> >  
> >  static inline int syscall_get_arch(struct task_struct *task)
> 
> Looks good, thanks.  How do we proceed from this point?

I can send a standalone patch for syscall_get_arguments() since that is
an issue present before your series then Andrew could fold in the same
change for syscall_set_arguments() into your change that introduces it
so there is no bisect problem?

Cheers,
Nathan
