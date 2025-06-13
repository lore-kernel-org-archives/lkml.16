Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C9D19CD0B
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 14:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749825452; cv=none; b=GGhrVAjC0pQUeKS0iOok0g2JTRTPJKVTHaDix5xSsYaBDyLvJ2VKHTeWBeSP8Ylsf6jmi7FpnTmT+hY8lxglx+a4K86uT1qo3zPBV//W4F31+yUU57GkK5HX8b9+1mxzWoc6TGLtPJ9U1i13p30WCunlRxOqnYYS967xny2zpmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749825452; c=relaxed/simple;
	bh=GGp5oTkCawHPYu9y+6WhaB28PMLpZFjkdQGEZNHaIfw=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mh2HesoRgafU9POMvBrdb7ATpHD3p28EROLvgfr2FjYEYyaXWorBmDJnrAYjP19s7AOfbdy3Ut590yTOdOtSkUHzfdcsNKTINmysY2JjCty3BfKV0ofvzehp8MwkExCXDQU4Q1E3OAYBKkEHacv+hUOd/W7srow+S+vns6XiuIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IJtP0KAW; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IJtP0KAW"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-553331c3dc7so1733545e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 07:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749825448; x=1750430248; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Uu1G+SQJ1DuRMAhemAW/AQY62352EzXJpJcvthzSRL4=;
        b=IJtP0KAWJygzDKEyY5nNyWUTJFDnuQ2Uzbd+WfB/XsyxUfK9UFS67R/ha5V2O5KQwE
         GrOLWc0Uonw+okcPsWt53ok80RJ5ZONux6Zs+LuBFmOvum2N+QUfN1vVMEsHvkgCXXq/
         hBzrNka9+10nt79d7sM4aNn+FL+5MTOeJ2Ri5Wp3X+yppQIwnWB63yBJVRLM+9awCwPm
         9zWSkyY3uQLs2wT86X1ByPE/beHZcrI84m/TnBzzliCuU0ySldxTU6p0U3pWzP7+r8Cu
         XgW4NRMPMNW/zr+Skj+lzIVN43KbNHE/mQqUlGefH7T/2G8B3ixH1c6apzXDEknnGAaX
         pd3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749825448; x=1750430248;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uu1G+SQJ1DuRMAhemAW/AQY62352EzXJpJcvthzSRL4=;
        b=MAxH/xt7++k0hJ8dPutIEMLcuGYYTA38orlJY2aylMJZxFhQtb4hOieN/6O3r33ud6
         FZZvmRrVTRfD71gBQ/93d+0fcUjUwry4+OecS4uDd0wpBrHEuVdzUsyfmC5DgE3YFCZ3
         9l8DDHWJx0VSpJSKICJGFSOHcL/VYpGTmal9u/UB+Pwgd3lhOkth1bMOFJHIk5j8/0KR
         Zj+vHGf62EcV2kq29TBhFZnGTnE9OIASflxbftVapeE8sEu+Gm8CVCj0d6tXJMtk8jjM
         FL8uOpvLX/1E6GA9te+2Lzv0atyklJDzDbmTENPlKYrWs6BVSHSCVhiV9lxgWBNCTcpP
         b1qg==
X-Forwarded-Encrypted: i=1; AJvYcCWD02BUKqi3/99WlrnoGoOZreQNfJaMP90jg06WfVZ4gDgdQ70lo9h6nQPAfcYwTSYWF5jKzzWvfJKlRuA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcQyOjxOPli5L69TzbxmUEQwDcFFvnHxUX03up+aQGdJAHJ+ko
	2riET+6hIVV2jWOvxyFNA6ELQ8tkfMtFnX2rZ0/wHLbAYCasXsYKR0JJ
X-Gm-Gg: ASbGnctJLysdJUeJik77+Inl5PThl5grnWq9dgZ+1eGfdPjTNnXA1bGXwoY5gPvx9Y2
	Oca078fquFUmWY7R24/sh5lMDXO5UDmitKgeSwHJ2VyXlyOE8rSG4Cj/RNM6m7szoj8I95YFv07
	dwcQUjQAiC2kO+e4lgp7ENtdbcIGA5jY9Jb/HV12S6tBBaDVNcmhmzyF+5m7d+vrtvBAxL67UkO
	Evy7/fMtMiA/JjIXruTD2OFhRvMbJhQ3M9fXP3GzhUansAokTDJ7fP08I4W/St27GK7S2nCzb23
	wpUi4ZwVlnmxoCZPVk6CfelV9oFFjv/PBkzHmkx/rGWpwrz+H4aa2U9RFCojDiVV8d907vYlhei
	WouMLGUN1TZE=
X-Google-Smtp-Source: AGHT+IEkIk0dEKOFUeh/GwDHrOZIugerDoRoGntqT8Wj6lNCazDx8i2ckdOJyKKNFIegb4Z8x+/ylA==
X-Received: by 2002:a05:6512:3990:b0:553:277b:17b5 with SMTP id 2adb3069b0e04-553af95f8bbmr811633e87.30.1749825448276;
        Fri, 13 Jun 2025 07:37:28 -0700 (PDT)
Received: from pc636 (host-95-203-1-180.mobileonline.telia.com. [95.203.1.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1d7278sm469682e87.175.2025.06.13.07.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 07:37:27 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Fri, 13 Jun 2025 16:37:25 +0200
To: Dev Jain <dev.jain@arm.com>
Cc: Uladzislau Rezki <urezki@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	LKML <linux-kernel@vger.kernel.org>, Baoquan He <bhe@redhat.com>,
	Christoph Hellwig <hch@infradead.org>,
	Oleksiy Avramchenko <oleksiy.avramchenko@sony.com>,
	Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [PATCH 2/4] lib/test_vmalloc.c: Allow built-in execution
Message-ID: <aEw3pSVJxyCkhnTd@pc636>
References: <20250417161216.88318-1-urezki@gmail.com>
 <20250417161216.88318-2-urezki@gmail.com>
 <6c6f1cfa-7f1b-4133-ae2a-c6b1ef2d82e8@arm.com>
 <aEwzcsDM2PPsx1h-@pc636>
 <b28374e1-a387-4a2c-8986-02cd5081a8ab@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b28374e1-a387-4a2c-8986-02cd5081a8ab@arm.com>

On Fri, Jun 13, 2025 at 07:53:37PM +0530, Dev Jain wrote:
> 
> On 13/06/25 7:49 pm, Uladzislau Rezki wrote:
> > Hello, Dev!
> > 
> > > On 17/04/25 9:42 pm, Uladzislau Rezki (Sony) wrote:
> > > > This patch removes the dependency on module loading ("m")
> > > > for the vmalloc test suite, enabling it to be built directly
> > > > into the kernel, so both ("=m") and ("=y") are supported.
> > > > 
> > > > Motivation:
> > > > - Faster debugging/testing of vmalloc code;
> > > > - It allows to configure the test via kernel-boot parameters.
> > > > 
> > > > Configuration example:
> > > >     test_vmalloc.nr_threads=64
> > > >     test_vmalloc.run_test_mask=7
> > > >     test_vmalloc.sequential_test_order=1
> > > > 
> > > > Signed-off-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
> > > > ---
> > > >    lib/Kconfig.debug  | 3 +--
> > > >    lib/test_vmalloc.c | 5 +++--
> > > >    2 files changed, 4 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> > > > index f9051ab610d54..166b9d830a85a 100644
> > > > --- a/lib/Kconfig.debug
> > > > +++ b/lib/Kconfig.debug
> > > > @@ -2574,8 +2574,7 @@ config TEST_BITOPS
> > > >    config TEST_VMALLOC
> > > >    	tristate "Test module for stress/performance analysis of vmalloc allocator"
> > > >    	default n
> > > > -       depends on MMU
> > > > -	depends on m
> > > > +	depends on MMU
> > > >    	help
> > > >    	  This builds the "test_vmalloc" module that should be used for
> > > >    	  stress and performance analysis. So, any new change for vmalloc
> > > > diff --git a/lib/test_vmalloc.c b/lib/test_vmalloc.c
> > > > index 4ab23e5e772d0..6d65ef725d42c 100644
> > > > --- a/lib/test_vmalloc.c
> > > > +++ b/lib/test_vmalloc.c
> > > > @@ -591,10 +591,11 @@ static void do_concurrent_test(void)
> > > >    	kvfree(tdriver);
> > > >    }
> > > > -static int vmalloc_test_init(void)
> > > > +static int __init vmalloc_test_init(void)
> > > >    {
> > > >    	do_concurrent_test();
> > > > -	return -EAGAIN; /* Fail will directly unload the module */
> > > > +	/* Fail will directly unload the module */
> > > > +	return IS_BUILTIN(CONFIG_TEST_VMALLOC) ? 0:-EAGAIN;
> > > >    }
> > > >    module_init(vmalloc_test_init)
> > > Hi Uladzislau,
> > > 
> > > Post this patch I am seeing the following problem: while booting the kernel, this test is
> > > executed and a particular testcase triggers a warning splat from the kernel, then the boot
> > > gets stuck for 3-4 seconds, then proceeds. I am not an expert on modules so I don't know
> > > what happened but I am guessing that when the test fails, the delay is due to module
> > > unloading time...do you suggest a solution? I reverted your patch and then proceeded with
> > > my work, so apologies for not having the dmesg log, if you need it I'll replicate, although
> > > there is some subtest which has consistently been spitting out a warning on my Apple M3 Linux
> > > VM and I have been just ignoring it for long : )
> > > 
> > This is because CONFIG_TEST_VMALLOC=y is built-in in your case.
> 
> Actually, I have a usecase for test_vmalloc :) I wanted to test my
> patches through the test, but the problem is that the moment it fails,
> it gets unloaded and then I cannot use the test at runtime. Currently it
> is set to =m in my .config.
> 
Ah. It is unloaded itself when tests are done. Do not use the
test_vmalloc.ko directly. Instead use test_vmalloc.sh script.

It is located here: ./tools/testing/selftests/mm/test_vmalloc.sh

Example: sudo ./test_vmalloc.sh nr_threads=HOW-MANY-CPU-YOU-have(digit) run_test_mask=7

--
Uladzislau Rezki
