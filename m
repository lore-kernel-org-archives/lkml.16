Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51F026B2A9
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 10:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750934982; cv=none; b=ulNAAD8JS823hRzQmrxgzZ9Bot8NxhUN0yJ0Ax17sq2E2kQtxQefi/FoS8elKwClOUji+JLvJ2r9vZ8i0hcHs1f2sD49blxEezmV3PIyuDCOjHyFwaDDLLxX8CUQ8sWWAPPh7svDuAk0nvPFkm0ez0atmzXa7n84Na2UXTrEewI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750934982; c=relaxed/simple;
	bh=rBGBxF+i3sBjEDYBJzXyfsL97dNuu5H4YUuYuuclALQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rA+q9CVvjKO+/oHYczuj4bUgk70NsFZUoKPoQT6bESveNmHCYmKqXpim1W0rqW340Y3ht6lPW+VFj8nQQJ+cFh6QtUXYRDXWYMHzm64xfAdoSkC7AQJHcezC36tSW5+qkBXW7VtkE0O2eILPSt+NtR6qJ/L3D87Ao7SgSCt3WN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=g/qC2zeH; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="g/qC2zeH"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a5123c1533so431326f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 03:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750934979; x=1751539779; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1a0bjQkrE0lXOwbpfOZiZMnL8XuL0L+bDp2YasyQuLw=;
        b=g/qC2zeH57dA3Ddn2gBt06KrRw5rhOs/KrOwGt5DINU95mZqhr06obNUacy9cV+p5A
         DkE92d60c4gDQGnhO+CGFGzW53ioXrpTr6HnuWHdi4UnDFQzAKvPk0RjSdQqw+aVgITa
         ZyT0LT1n1amgAVYFYuv0b5fl+3xIBz5Vqf91wD14ojgXD3qyOORIJWH90WtMnkvqjnfZ
         wc1p1Q/dh+qGKr3a+ESg5QBXmrD5IyQCqt3j3cRZVWEL90bZBuFvn0Nb2fxaHTsQKIH6
         NSmUD9PQEZEOzzzi3WV6KhXNQKKwUtt7V70JJilpBtA2xLL4p+iboVRooAhwo9nJZDoa
         LVrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750934979; x=1751539779;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1a0bjQkrE0lXOwbpfOZiZMnL8XuL0L+bDp2YasyQuLw=;
        b=jkFTQX5oXE12c9vdzvlhg+OpQBGQX9PCRsJTYZ2zqh/J+tvLb+HUDUVFooVmNHqE8d
         gXJPLhbeEg70CPDWMD/y45hD6HiCBBsJLp924XwzGD4iz91reFe+4sP/Y6NGIJApJhaL
         c7BY7W4j1TurV8x3/m4ForioECiFKiOkwE9r9rKf5vHX8RlyBjDHQ41Fqz1SH1rF+M/e
         HfJCslu4HN83CXRDPfkf3jLypaimhdx6MKaVcX77+2MQo32LTjQ5JJcGHgokDSr/y/1e
         7F692/tIZpkm3phnrAap+g9m7vr81R2dGGUOYxr+YY8aiAeZhR/9uiyGL89iUddZLqMd
         NaJw==
X-Forwarded-Encrypted: i=1; AJvYcCXX4AVvzHjdzg/1aQhyCNN4MIpq9wHqMGpXJG6rHGEeRHCAm67xLIVhm34iuf6Z7zgKIibWZn2ODiNOvlw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfsSULEQUSbtuhflcSxfZiHxWfSKOmmIRB5d4yewtlX0Za4oKp
	AK4HZncWiA8JIMsmMnci+yw04rPT01dOJpehxe4mpyxd4AkOqxWwzj31wvyCv6leneo=
X-Gm-Gg: ASbGncviQyTgcYDM1q6pEu1Inuxgz+Hhk1fHgyvbMJRoywipt3FS4cPsx9WstTuua1I
	+WdYiNgii8abSvggHQe/E7BM95H/KkT35YMIXhntNWqkHgWo/XDsM5lFWNGTHs15n4CuKRwCwfT
	IHKqpiTMEcEBGqQQtj5psxiLCJ7OjN6PgBktxV9c9fxO4G6Ou7xDGxtdD5kFNdyuF9EPtpTvgJT
	WmL/TzCOs3wJTwff81a3euP4Q3ZSddtysgvAo2WBnU/J1SeAwWjl4hT1jXCBe68StA+JzX1ULbj
	MuautFD+UVrsLvbUy5/zaeW2pY5tlOa8bf4T4G5SwhLQ5DpNebTF98QBletQ
X-Google-Smtp-Source: AGHT+IHq/vFRkJj/oJMZi+3J+q9S/bpmTny3iypeXTqCnR6Swc4ofLBoKTbFvUTAYU6DIEK0HRcCDQ==
X-Received: by 2002:a5d:64e1:0:b0:3a6:d92d:9f7c with SMTP id ffacd0b85a97d-3a6ed5e9c5bmr5333270f8f.9.1750934978974;
        Thu, 26 Jun 2025 03:49:38 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::5485])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6f3a79377sm1808780f8f.20.2025.06.26.03.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 03:49:38 -0700 (PDT)
Date: Thu, 26 Jun 2025 12:49:37 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Jonathan Corbet <corbet@lwn.net>, Palmer Dabbelt <palmer@sifive.com>, 
	Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Subject: Re: [PATCH v4 6/7] riscv: Add tools support for xmipsexectl
Message-ID: <20250626-af013235ad8d22421b2fe5b1@orel>
References: <20250625-p8700-pause-v4-0-6c7dd7f85756@htecgroup.com>
 <20250625-p8700-pause-v4-6-6c7dd7f85756@htecgroup.com>
 <20250626-a1aca9887bbf5410741e17c4@orel>
 <20250626-0186dfe9df28f9bb72a91426@orel>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626-0186dfe9df28f9bb72a91426@orel>

On Thu, Jun 26, 2025 at 11:34:21AM +0200, Andrew Jones wrote:
> On Thu, Jun 26, 2025 at 11:21:10AM +0200, Andrew Jones wrote:
> > On Wed, Jun 25, 2025 at 04:21:01PM +0200, Aleksa Paunovic via B4 Relay wrote:
> > > From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> > > 
> > > Use the hwprobe syscall to decide which PAUSE instruction to execute in
> > > userspace code.
> > > 
> > > Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> > > ---
> > >  tools/arch/riscv/include/asm/vdso/processor.h | 27 +++++++++++++++++----------
> > >  1 file changed, 17 insertions(+), 10 deletions(-)
> > > 
> > > diff --git a/tools/arch/riscv/include/asm/vdso/processor.h b/tools/arch/riscv/include/asm/vdso/processor.h
> > > index 662aca03984817f9c69186658b19e9dad9e4771c..027219a486b7b93814888190f8224af29498707c 100644
> > > --- a/tools/arch/riscv/include/asm/vdso/processor.h
> > > +++ b/tools/arch/riscv/include/asm/vdso/processor.h
> > > @@ -4,26 +4,33 @@
> > >  
> > >  #ifndef __ASSEMBLY__
> > >  
> > > +#include <asm/hwprobe.h>
> > > +#include <sys/hwprobe.h>
> > > +#include <asm/vendor/mips.h>
> > >  #include <asm-generic/barrier.h>
> > >  
> > >  static inline void cpu_relax(void)
> > >  {
> > > +	struct riscv_hwprobe pair;
> > > +	bool has_mipspause;
> > >  #ifdef __riscv_muldiv
> > >  	int dummy;
> > >  	/* In lieu of a halt instruction, induce a long-latency stall. */
> > >  	__asm__ __volatile__ ("div %0, %0, zero" : "=r" (dummy));
> > >  #endif
> > >  
> > > -#ifdef CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE
> > > -	/*
> > > -	 * Reduce instruction retirement.
> > > -	 * This assumes the PC changes.
> > > -	 */
> > > -	__asm__ __volatile__ ("pause");
> > > -#else
> > > -	/* Encoding of the pause instruction */
> > > -	__asm__ __volatile__ (".4byte 0x100000F");
> > > -#endif
> > > +	pair.key = RISCV_HWPROBE_KEY_VENDOR_EXT_MIPS_0;
> > > +	__riscv_hwprobe(&pair, 1, 0, NULL, 0);
> > > +	has_mipspause = pair.value & RISCV_HWPROBE_VENDOR_EXT_XMIPSEXECTL;
> > > +
> > > +	if (has_mipspause) {
> > > +		/* Encoding of the mips pause instruction */
> > > +		__asm__ __volatile__(".4byte 0x00501013");
> > > +	} else {
> > > +		/* Encoding of the pause instruction */
> > > +		__asm__ __volatile__(".4byte 0x100000F");
> > > +	}
> > > +
> > 
> > cpu_relax() is used in places where we cannot afford the overhead nor call
> > arbitrary functions which may take locks, etc. We've even had trouble
> > using a static key here in the past since this is inlined and it bloated
> > the size too much. You'll need to use ALTERNATIVE().
> 
> Oh, I see now that the next patch is handling the kernel cpu_relax with
> ALTERNATIVE and this was just the tools cpu_relax. We don't want to make
> a syscall inside cpu_relax though either, since it gets called in loops.

(Another follow up to myself...)

I guess with the vdso cached result it should only be a handful of
instructions, but it still seems odd to embed a call in cpu_relax.

Thanks,
drew

> It'd be better to just call the standard pause (0x100000F) even if it
> does nothing. Or maybe there's some define that can be added/used to
> select the correct instruction?
> 
> Thanks,
> drew
