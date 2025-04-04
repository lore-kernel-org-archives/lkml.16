Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B571813D531
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 19:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743793859; cv=none; b=lzBUpYoV5K2ctGkLBaAcff9cAR40P96iw5IU1j1jF0/DQMrii+oKlnMZV2KQeyDe62TXwSkTsPCZwE5Wnk3JjNKVLkgueloG003FsOCaj4gDv78oQ+S4/JftyQnp95PGij7CNEnHcfxnhYrV2I0+t1VB1ybDuo/pfdIQxJjY7AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743793859; c=relaxed/simple;
	bh=ZqlyhLTRVpFDojZlCA4NRLO1+HKUk63PF9oOuQJdM4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AlA9VxJ3FR3mIHI4+ZzWwxYKc7V4cSIhpS6ho9u1dfezLPMNEvvvgqJcMPbcmfDMdadAuKCSysyM1HgPwVfRccQZwPhMfdOy10/WvIwZODtLcOacy1CFg75o0R1mWa8k2jTZvRy/ZJ798vr5V+t2HDKSrcirRZhsYxMco2lXaYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WDwMi6bI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WDwMi6bI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C2B3C4CEDD;
	Fri,  4 Apr 2025 19:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743793859;
	bh=ZqlyhLTRVpFDojZlCA4NRLO1+HKUk63PF9oOuQJdM4Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WDwMi6bIJB3mjotzrTrnMGT06HF06x/qTNRq3VNdBrfk6FYm1x0weBj4Ta6KY34H9
	 UjvychAvJHf1FTLMs0lTHLovLzbHWFlVmPMoYmfsRMYAmej3Q/uAfdk9pZF2NBmGoi
	 mrkWKkaGyeTKpHUyKsdwkBJIEBShN4ac1ZDI1TuplwEPeCiw+Gi+R/aVUuC+uLkjo8
	 a4gOVSM+P/UkHoW7g9JkCP4vwwpQSpIgWPvfNegKqKExKXdc1qnpto40lJ1zTcG4dT
	 tNcvTdjRP/Mr9VDAoVrQ03eVOoxix19n95q9WhQqFevo+CgDwXvzL4SAEcG+TrTxnE
	 X5PfRV7+u0nfA==
Date: Fri, 4 Apr 2025 09:10:58 -1000
From: Tejun Heo <tj@kernel.org>
To: Andrea Righi <arighi@nvidia.com>
Cc: void@manifault.com, multics69@gmail.com, linux-kernel@vger.kernel.org,
	sched-ext@meta.com
Subject: Re: [PATCH 4/5] sched_ext: Drop "ops" from scx_ops_exit(),
 scx_ops_error() and friends
Message-ID: <Z_AuwsDt68U01rmL@slm.duckdns.org>
References: <20250403225026.838987-1-tj@kernel.org>
 <20250403225026.838987-5-tj@kernel.org>
 <Z--Kj36FTPoDrK2g@gpd3>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z--Kj36FTPoDrK2g@gpd3>

Hello, Andrea.

On Fri, Apr 04, 2025 at 09:30:23AM +0200, Andrea Righi wrote:
> > @@ -1043,18 +1043,17 @@ static struct kobject *scx_root_kobj;
> >  
> >  static void process_ddsp_deferred_locals(struct rq *rq);
> >  static void scx_bpf_kick_cpu(s32 cpu, u64 flags);
> > -static __printf(3, 4) void scx_ops_exit_kind(enum scx_exit_kind kind,
> > -					     s64 exit_code,
> > -					     const char *fmt, ...);
> > +static __printf(3, 4) void __scx_exit(enum scx_exit_kind kind, s64 exit_code,
> > +				      const char *fmt, ...);
> >  
> > -#define scx_ops_error_kind(err, fmt, args...)					\
> > -	scx_ops_exit_kind((err), 0, fmt, ##args)
> > +#define __scx_error(err, fmt, args...)						\
> > +	__scx_exit((err), 0, fmt, ##args)
> >  
> 
> Can we move scx_error() here, right after __scx_error(), for better
> readability?

The current order is:

  __scx_exit()
  __scx_error()
  scx_exit()
  scx_error()

If relocated as you suggested:

  __scx_exit()
  __scx_error()
  scx_error()
  scx_exit()

which probably isn't optimal. We can do:

  __scx_exit()
  scx_exit()
  __scx_error()
  scx_error()

Maybe that's a bit better. I don't know.

> > -#define scx_ops_exit(code, fmt, args...)					\
> > -	scx_ops_exit_kind(SCX_EXIT_UNREG_KERN, (code), fmt, ##args)
> > +#define scx_exit(code, fmt, args...)						\
> > +	__scx_exit(SCX_EXIT_UNREG_KERN, (code), fmt, ##args)
> >  
> > -#define scx_ops_error(fmt, args...)						\
> > -	scx_ops_error_kind(SCX_EXIT_ERROR, fmt, ##args)
> > +#define scx_error(fmt, args...)							\
> > +	__scx_error(SCX_EXIT_ERROR, fmt, ##args)
> 
> I've always found scx_exit_kind / exit_code a bit confusing, scx_exit_kind
> represents the reason of the exit, while exit_code is an additional code to
> describe the error.
> 
> Not necessarily for this patch set, but what do you think about renaming
> scx_exit_kind to scx_exit_reason and scx_exit_reason() to
> scx_exit_reason_str()?

Even if those are better names, the enum is exposed and used from the
schedulers and renaming it would need to go through compatibility process.
I'm not sure the gain here would be justified.

We basically have two levels of exit descriptors. We call the higher level
kind and lower level code. I think having two exit descriptors is going to
be a bit confusing no matter what we do and maybe we should have stuck to
one value. Anyways, here, I'm not sure the return would justify the cost.

Thanks.

-- 
tejun
