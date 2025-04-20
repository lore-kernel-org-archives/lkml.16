Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231FC14286;
	Sun, 20 Apr 2025 18:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745172081; cv=none; b=mQk1xB0yuC2Lb7O8BahA5uzOTDKnRVAoqpVWPXlsSsdJ57W80pqUAqPsba2A+dp6PoeFoPAQJg21fKXFUK22Bkd25k9xjijhg6TBc4r6U65PHYijdYbgvXR+6FOYXuxRRLkYSLeX9CdQqaJsmMqRG13lCY6E7TTnMSWeZLtBqYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745172081; c=relaxed/simple;
	bh=XLO7NtZPaeDnBt7JzrDpb+rKz54Qxyabh0nurUp41Q0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QfJb6o1gyoeuT0bH9l6UyS0hL0N3yOV66RPqGfIukeKe4DEP4Q+s4GQjQ7zUNhj+ZJ2yLSBF+nZ7mAnD3vdb6A1Y6EN0jeWwFaU5r/zSGx6HV/fvlXwyOKa+o2E0Rg0XkekiNm3nf9nOgapq3nbcFpRI6K/44fGq/X40wPne5FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uApWUl/C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uApWUl/C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90459C4CEE2;
	Sun, 20 Apr 2025 18:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745172080;
	bh=XLO7NtZPaeDnBt7JzrDpb+rKz54Qxyabh0nurUp41Q0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uApWUl/CRqrrFMFVnDN/uD18tZhhcjWugbQyg5zpcXHSdqMdCttvzWoQmjmOVV0XH
	 jRExVlkEHhXuKsMYJg18DHXTDj3P+2yZ6NHZEOZDQpckzqy6N9iCjcIcbp1tY4SatH
	 E8PjcOpxWqVKqpgzefqtNkPTNUYiJMLXHjJai+DrgWmsB//ZXALmPRQnJcxu/0DPMX
	 T+fzErpp4lHbejiPBpfg2yMuvjJn3BCq1vEMvyZwVnM/DEsRvsXfVDPw4beDFfj4KF
	 EVUp24CRI18TpAclq7019hLMcrqR7R3ZfoBbv0R6VjO8Nm5JEUzBSK46B7NWDcp6Ty
	 SL8SVA+aAajYQ==
Date: Sun, 20 Apr 2025 20:01:15 +0200
From: Carlos Maiolino <cem@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, Hans.Holmberg@wdc.com, 
	oe-kbuild-all@lists.linux.dev, hch@lst.de, lukas@wunner.de, 
	angelogioacchino.delregno@collabora.com, Jonathan.Cameron@huawei.com
Subject: Re: [RFC PATCH] math.h: Account for 64-bit division on i386
Message-ID: <6qz2fm4o2zpteh5cs2xandvm2sq3c6rv244z7cagmdpkboday4@kjsan4fzqp3v>
References: <20250419115157.567249-1-cem@kernel.org>
 <AXxRwdy0shsxKS1AfJTrdc0xRddKqZbbL4sZuFhubZsJ3DFUVSot6DzlGNKNk0bJMxzojB8nt7106nUqIMoXSA==@protonmail.internalid>
 <81d49efc-1b81-48e1-b9ca-c3665d0cf73c@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81d49efc-1b81-48e1-b9ca-c3665d0cf73c@roeck-us.net>

On Sun, Apr 20, 2025 at 08:40:25AM -0700, Guenter Roeck wrote:
> On Sat, Apr 19, 2025 at 01:51:46PM +0200, cem@kernel.org wrote:
> > From: Carlos Maiolino <cem@kernel.org>
> >
> > Building linux on i386 might fail if a 64bit type is passed to
> 
> i386 actually builds. Its compiler is probably able to convert
> the offending mult_frac() without helpers since the divisor is
> a constant. I see the problem with openrisc and parisc, with
> gcc 13.3.0.

It does fail to build, that's how it got identified in the first place. I
managed to reproduce here according to the reproducer sent by the test robot.
I think it works if you don't enable build checks (in this case W=1) though.

I didn't try other architectures other than x86 though, thanks for the heads up.


> 
> > mult_fract(). To prevent the failure, use do_div() for the division
> > calculation instead of hardcoding a / b.
> >
> > Signed-off-by: Carlos Maiolino <cmaiolino@redhat.com>
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202504181233.F7D9Atra-lkp@intel.com/
> > ---
> >
> > I'm sending it as a RFC because I didn't to extensive testing on this
> > patch, also I'm not sure if mult_frac() was intended to work on 32-bit
> > only types. If that's the case, perhaps, a new mult_frac64() might be a
> > better idea?!
> >
> >  include/linux/math.h | 19 ++++++++++---------
> >  1 file changed, 10 insertions(+), 9 deletions(-)
> >
> > diff --git a/include/linux/math.h b/include/linux/math.h
> > index 0198c92cbe3e..05ea853b75b4 100644
> > --- a/include/linux/math.h
> > +++ b/include/linux/math.h
> > @@ -133,15 +133,16 @@ __STRUCT_FRACT(u32)
> >  #undef __STRUCT_FRACT
> >
> >  /* Calculate "x * n / d" without unnecessary overflow or loss of precision. */
> > -#define mult_frac(x, n, d)	\
> > -({				\
> > -	typeof(x) x_ = (x);	\
> > -	typeof(n) n_ = (n);	\
> > -	typeof(d) d_ = (d);	\
> > -				\
> > -	typeof(x_) q = x_ / d_;	\
> > -	typeof(x_) r = x_ % d_;	\
> > -	q * n_ + r * n_ / d_;	\
> > +#define mult_frac(x, n, d)		\
> > +({					\
> > +	typeof(x) x_ = (x);		\
> > +	typeof(n) n_ = (n);		\
> > +	typeof(d) d_ = (d);		\
> > +					\
> > +	typeof(x_) r = do_div(x_, d_);	\
> > +	r *= n_;			\
> > +	do_div(r, d_);			\
> > +	x_ * n_ + r;			\
> >  })
> >
> 
> Unfortunately that doesn't work. I get build errors on parisc.
> 
> In file included from ./arch/parisc/include/generated/asm/div64.h:1,
>                  from ./include/linux/math.h:6,
>                  from ./include/linux/kernel.h:27,
>                  from ./arch/parisc/include/asm/bug.h:5,
>                  from ./include/linux/bug.h:5,
>                  from ./include/linux/mmdebug.h:5,
>                  from ./include/linux/mm.h:6,
>                  from mm/page_alloc.c:19:
> mm/page_alloc.c: In function 'boost_watermark':
> ./include/asm-generic/div64.h:183:35: error: comparison of distinct pointer types lacks a cast [-Werror]
>   183 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
>       |                                   ^~
> ./include/linux/math.h:142:24: note: in expansion of macro 'do_div'
>   142 |         typeof(x_) r = do_div(x_, d_);  \
>       |                        ^~~~~~
> mm/page_alloc.c:2010:21: note: in expansion of macro 'mult_frac'
>  2010 |         max_boost = mult_frac(zone->_watermark[WMARK_HIGH],
> 
> That is just one example. It seems to affect all uses of
> mult_frac().
> 
> Guenter
