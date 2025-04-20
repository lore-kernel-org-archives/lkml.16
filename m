Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EEC020C484;
	Sun, 20 Apr 2025 18:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745172362; cv=none; b=CxZRXwupfwqTXtG6PyHr9iBU3qj3uy9ahc8TX+3PdK8soFzbcC4pov6/pyWHvELZW3hr77hTfAwcQnBooAiWstJHWJZ1B3vKdssYYxQK5N7+sOQXnmha9ch1K7wfzbyrc7A+5+oYBkkzih45t90c6/Bys/jgd1sfr5dUt5Q4Dro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745172362; c=relaxed/simple;
	bh=i/a+qaxrXzEQmJjFpcZqp1qsKxbCpTbLyvWajbzOam0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uyN9bpgt2/PvZko1I0BU2mATGtnfLckfhhB1Ghub+IOv6EadsomGe0ZGekngv4/1LxOu6so8NiZ+AF2QysHxm1Bq0Gu9gnmVw8IRmooEzc1yoVaSEbPsP/yz+6KGF5L2HPteV84tviFNwT35ZJQ+5jZBbRO/kW+ZwHFau1uxRBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eegicRsw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eegicRsw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D159C4CEE2;
	Sun, 20 Apr 2025 18:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745172361;
	bh=i/a+qaxrXzEQmJjFpcZqp1qsKxbCpTbLyvWajbzOam0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eegicRswV0vU1uC2l1FAnJAAg3GODmvVILM98mps6u2GmaXzOhp69dlj82LtCIyGC
	 cgaGbiSrY13BW33P7cERdKqNkFDQodvutoD6ymK3I5ZG2fT0Sn+lIZ+VtY2HcyjJ11
	 7jx2kugcjiEL9qGcU0DZpDn6JF6/QhhWWiUBjsmE7pUsJikIEsQG5oSkLM+fNjU8W+
	 Eojc5iJSq9jGI8dXwP8ED761x6W8MykigvtxBqTerILGxxBVTe7CviU2xTRVOVbBlu
	 g8Sl1LMVSWqdVN2AtjGT338BU4GX8C2aImESz7IjKQ6IJ6t9/iRK5dX6hbhmeBiwoI
	 BmfzpIuSzj5tg==
Date: Sun, 20 Apr 2025 20:05:56 +0200
From: Carlos Maiolino <cem@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, Hans.Holmberg@wdc.com, 
	oe-kbuild-all@lists.linux.dev, hch@lst.de, lukas@wunner.de, 
	angelogioacchino.delregno@collabora.com, Jonathan.Cameron@huawei.com
Subject: Re: [RFC PATCH] math.h: Account for 64-bit division on i386
Message-ID: <uqocnlxiig2a3iicx7vtzwjylpzrwiqunulusfsioiiklsty5v@fkbn3p4huna6>
References: <20250419115157.567249-1-cem@kernel.org>
 <81d49efc-1b81-48e1-b9ca-c3665d0cf73c@roeck-us.net>
 <1ZOS4oIpkUngfMohjitAH1MksBybgfMmt4U8dbbOFM65zu60-HYOcKu3gScfX7FAtZylkjpoDY0fPXGqozF3ug==@protonmail.internalid>
 <2bf6d797-d974-49bb-a234-a20378f5dda5@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2bf6d797-d974-49bb-a234-a20378f5dda5@roeck-us.net>

On Sun, Apr 20, 2025 at 10:42:18AM -0700, Guenter Roeck wrote:
> On Sun, Apr 20, 2025 at 08:40:27AM -0700, Guenter Roeck wrote:
> > On Sat, Apr 19, 2025 at 01:51:46PM +0200, cem@kernel.org wrote:
> > > From: Carlos Maiolino <cem@kernel.org>
> > >
> > > Building linux on i386 might fail if a 64bit type is passed to
> >
> > i386 actually builds. Its compiler is probably able to convert
> > the offending mult_frac() without helpers since the divisor is
> > a constant. I see the problem with openrisc and parisc, with
> > gcc 13.3.0.
> >
> > > mult_fract(). To prevent the failure, use do_div() for the division
> > > calculation instead of hardcoding a / b.
> > >
> > > Signed-off-by: Carlos Maiolino <cmaiolino@redhat.com>
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Closes: https://lore.kernel.org/oe-kbuild-all/202504181233.F7D9Atra-lkp@intel.com/
> > > ---
> > >
> > > I'm sending it as a RFC because I didn't to extensive testing on this
> > > patch, also I'm not sure if mult_frac() was intended to work on 32-bit
> > > only types. If that's the case, perhaps, a new mult_frac64() might be a
> > > better idea?!
> > >
> > >  include/linux/math.h | 19 ++++++++++---------
> > >  1 file changed, 10 insertions(+), 9 deletions(-)
> > >
> > > diff --git a/include/linux/math.h b/include/linux/math.h
> > > index 0198c92cbe3e..05ea853b75b4 100644
> > > --- a/include/linux/math.h
> > > +++ b/include/linux/math.h
> > > @@ -133,15 +133,16 @@ __STRUCT_FRACT(u32)
> > >  #undef __STRUCT_FRACT
> > >
> > >  /* Calculate "x * n / d" without unnecessary overflow or loss of precision. */
> > > -#define mult_frac(x, n, d)	\
> > > -({				\
> > > -	typeof(x) x_ = (x);	\
> > > -	typeof(n) n_ = (n);	\
> > > -	typeof(d) d_ = (d);	\
> > > -				\
> > > -	typeof(x_) q = x_ / d_;	\
> > > -	typeof(x_) r = x_ % d_;	\
> > > -	q * n_ + r * n_ / d_;	\
> > > +#define mult_frac(x, n, d)		\
> > > +({					\
> > > +	typeof(x) x_ = (x);		\
> > > +	typeof(n) n_ = (n);		\
> > > +	typeof(d) d_ = (d);		\
> > > +					\
> > > +	typeof(x_) r = do_div(x_, d_);	\
> > > +	r *= n_;			\
> > > +	do_div(r, d_);			\
> > > +	x_ * n_ + r;			\
> > >  })
> > >
> >
> > Unfortunately that doesn't work. I get build errors on parisc.
> >
> 
> Turns out the first parameter of do_div needs to be u64, not s64,
> at least on parisc.

Yup, that's true for x86 too, needs to be fixed once we decide which
path to take to fix it.

> 
> Guenter
> 
> > In file included from ./arch/parisc/include/generated/asm/div64.h:1,
> >                  from ./include/linux/math.h:6,
> >                  from ./include/linux/kernel.h:27,
> >                  from ./arch/parisc/include/asm/bug.h:5,
> >                  from ./include/linux/bug.h:5,
> >                  from ./include/linux/mmdebug.h:5,
> >                  from ./include/linux/mm.h:6,
> >                  from mm/page_alloc.c:19:
> > mm/page_alloc.c: In function 'boost_watermark':
> > ./include/asm-generic/div64.h:183:35: error: comparison of distinct pointer types lacks a cast [-Werror]
> >   183 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
> >       |                                   ^~
> > ./include/linux/math.h:142:24: note: in expansion of macro 'do_div'
> >   142 |         typeof(x_) r = do_div(x_, d_);  \
> >       |                        ^~~~~~
> > mm/page_alloc.c:2010:21: note: in expansion of macro 'mult_frac'
> >  2010 |         max_boost = mult_frac(zone->_watermark[WMARK_HIGH],
> >
> > That is just one example. It seems to affect all uses of
> > mult_frac().
> >
> > Guenter
