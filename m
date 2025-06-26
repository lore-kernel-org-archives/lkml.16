Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13022951BD
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 09:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750930466; cv=none; b=tqGIhhkkPSXS6raMMn+MdpYD5REtwAH1JnwJixK1P66zTyNTtlWJ4IRSG8SF5Qmj//Th/Qr7GPayUtDIJ1vKg74oQfwjphM7mG1Y1vpE1j5LvwAXf6zyhmMqu9M5PcDznJgH1PsqSj6KpCdwrv1TTUH7zVSR1FhddwMNoj+jSiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750930466; c=relaxed/simple;
	bh=H/yx7nPzP76TAlzmC3FWo7JFHzEZKFIksKif6BUcz8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mvb5XnLtwinV/W9yotels9NQCKaQ3/ecjO0fAtCH1vuQOO2G9rGZEsDH8dNbGasSqj4ipJna7rLsh9dM63snckk5Fz/187Nqfiq+a9Xsb+x/hK5n07WaYKq3wT7JuOKNDVm0qH2v7/o73sWGExmANB7MO2JqtV9YZpRWOjwZzWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=Rb+DO2DP; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="Rb+DO2DP"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-451dbe494d6so7742145e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 02:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750930463; x=1751535263; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=54yRkloeTOXwJZtYTXvyBltimxLORdzQsrxNGOdvL4Y=;
        b=Rb+DO2DPE62pxVVXEdYYT4NrN7ttozsN+WcuQvtPvnA0dyrDm12/ltOI8mpdpZSW9K
         2vSxqtoEv5rOVVeJVhS0oOuf/P9FQcxfeoxKLnHpQK7I/0fdLJ37AUWDwDNxTfp+tNce
         QloABJp91bkXNGDn0YpLCCtU6mqP99IKE7BwmNJHCGMuY5IfQkmpGNJkLR112ct0MvxZ
         47bJzwiq6/Ri3P4ju7lkzATdyqHzGuDFTAhP5f1UDjJko6vwA7c4RCnooQabvqQzerpJ
         CBW/aioZyA2dOGZNIsWUI+C5LctKqPgpYAVLJsaF2S8pAoNwrkYsv6IwriBtBnNbQ2jO
         LCjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750930463; x=1751535263;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=54yRkloeTOXwJZtYTXvyBltimxLORdzQsrxNGOdvL4Y=;
        b=EFmKbqX+1yotzSg7/F/gh2qDuNDj8nSmiHrUHrHgiX+TUzUkrsz6oZ5DL60jJ29Rxp
         IqQKqqZma/9jvJh6vf5cwJ2E75qYVSoaXQqsw9eXfyR8hSCB/BLIUFYzNi15Crn9Agql
         rjggW0/MsJRbkkUJmDMEAhsbESO2jBJUkSjyc9/6Ze2uUSi7M+uzs+TWHO8qAGzgdpDE
         ofPTEB0emVNNxPdwX+7eKle+rUlyUjcLRosIf9wQuwomOdFTc9uA1RHHnz2okdo2gxlW
         cymfZkmc4f2bNLw0wxo4GgfhFYwetTNf+RB1vQDzUfg5zagfUaiMISb3gaQNka1/KL3t
         g4zg==
X-Forwarded-Encrypted: i=1; AJvYcCURlu88YwYd0Fi+FmLuNJ//xeJJKZgkUjM65Hgwa7HOCAJMUwMZ3dd8rjX7Tx/9UBg5DLIrkgyNhJEUFxQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGMv34wwU2iQRU624Hu+e7rqWmvVzl7MixQrEBu8BZQQrzPh6W
	vOIq+AvKhLuihFusG9XS4xXXrHS+z2DC/c5hD1F39Nb50EZFdMDaBajLi+S3o/myCFY=
X-Gm-Gg: ASbGncuf0lLX+LDatyfmCR5nNvBlDytmQhqrphtFTsWbvkTmlTUp1rTZSznUhflep8+
	+g8b03KAWQqnBWjIzWLPYNC0JmVGbP6LqljxDbluDpn/7/54jvoIULbSLZ1H+DTspTLeUQk7hQN
	uMNYJG2vFaxILUzwYd6goORJQ1v8LIVFb5PWjXBSpi+XqRM6qT0bHVn6yYiULnkEFeMd2aNhfdB
	eDlo3Q2RWfrfvVYLrj8SHqLRYCXJ9g2osLt20/jHATNCbvyoe3c9dKifNegMrmL6J5TgXptJuHX
	MXTwrH/UY+TrGOjBjCmWgY/K8/wDsl/8ZykxoHK9hm94ppPlLoBTlb/ZMUyi
X-Google-Smtp-Source: AGHT+IE7SPMJdXg6Uib8sBAANFP0uaWykfjpxucbRqhrErUMyjsBzbnn2KGBiDxo71YCebyhHfo6RA==
X-Received: by 2002:a05:600c:8b6d:b0:442:e109:3027 with SMTP id 5b1f17b1804b1-45381ae5182mr57051005e9.24.1750930463049;
        Thu, 26 Jun 2025 02:34:23 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::5485])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e80f26ebsm6897038f8f.51.2025.06.26.02.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 02:34:22 -0700 (PDT)
Date: Thu, 26 Jun 2025 11:34:21 +0200
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
Message-ID: <20250626-0186dfe9df28f9bb72a91426@orel>
References: <20250625-p8700-pause-v4-0-6c7dd7f85756@htecgroup.com>
 <20250625-p8700-pause-v4-6-6c7dd7f85756@htecgroup.com>
 <20250626-a1aca9887bbf5410741e17c4@orel>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626-a1aca9887bbf5410741e17c4@orel>

On Thu, Jun 26, 2025 at 11:21:10AM +0200, Andrew Jones wrote:
> On Wed, Jun 25, 2025 at 04:21:01PM +0200, Aleksa Paunovic via B4 Relay wrote:
> > From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> > 
> > Use the hwprobe syscall to decide which PAUSE instruction to execute in
> > userspace code.
> > 
> > Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> > ---
> >  tools/arch/riscv/include/asm/vdso/processor.h | 27 +++++++++++++++++----------
> >  1 file changed, 17 insertions(+), 10 deletions(-)
> > 
> > diff --git a/tools/arch/riscv/include/asm/vdso/processor.h b/tools/arch/riscv/include/asm/vdso/processor.h
> > index 662aca03984817f9c69186658b19e9dad9e4771c..027219a486b7b93814888190f8224af29498707c 100644
> > --- a/tools/arch/riscv/include/asm/vdso/processor.h
> > +++ b/tools/arch/riscv/include/asm/vdso/processor.h
> > @@ -4,26 +4,33 @@
> >  
> >  #ifndef __ASSEMBLY__
> >  
> > +#include <asm/hwprobe.h>
> > +#include <sys/hwprobe.h>
> > +#include <asm/vendor/mips.h>
> >  #include <asm-generic/barrier.h>
> >  
> >  static inline void cpu_relax(void)
> >  {
> > +	struct riscv_hwprobe pair;
> > +	bool has_mipspause;
> >  #ifdef __riscv_muldiv
> >  	int dummy;
> >  	/* In lieu of a halt instruction, induce a long-latency stall. */
> >  	__asm__ __volatile__ ("div %0, %0, zero" : "=r" (dummy));
> >  #endif
> >  
> > -#ifdef CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE
> > -	/*
> > -	 * Reduce instruction retirement.
> > -	 * This assumes the PC changes.
> > -	 */
> > -	__asm__ __volatile__ ("pause");
> > -#else
> > -	/* Encoding of the pause instruction */
> > -	__asm__ __volatile__ (".4byte 0x100000F");
> > -#endif
> > +	pair.key = RISCV_HWPROBE_KEY_VENDOR_EXT_MIPS_0;
> > +	__riscv_hwprobe(&pair, 1, 0, NULL, 0);
> > +	has_mipspause = pair.value & RISCV_HWPROBE_VENDOR_EXT_XMIPSEXECTL;
> > +
> > +	if (has_mipspause) {
> > +		/* Encoding of the mips pause instruction */
> > +		__asm__ __volatile__(".4byte 0x00501013");
> > +	} else {
> > +		/* Encoding of the pause instruction */
> > +		__asm__ __volatile__(".4byte 0x100000F");
> > +	}
> > +
> 
> cpu_relax() is used in places where we cannot afford the overhead nor call
> arbitrary functions which may take locks, etc. We've even had trouble
> using a static key here in the past since this is inlined and it bloated
> the size too much. You'll need to use ALTERNATIVE().

Oh, I see now that the next patch is handling the kernel cpu_relax with
ALTERNATIVE and this was just the tools cpu_relax. We don't want to make
a syscall inside cpu_relax though either, since it gets called in loops.
It'd be better to just call the standard pause (0x100000F) even if it
does nothing. Or maybe there's some define that can be added/used to
select the correct instruction?

Thanks,
drew
