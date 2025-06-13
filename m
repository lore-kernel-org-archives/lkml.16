Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F250E2E11DA
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 14:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749824377; cv=none; b=dwU5GQbRl6VaELxhal5oktJe6EL3SPXdjCCpoFhDcs0CbsD1KXI8yxwC5z9p/8QiNGTaqdnANKL3WiFaDckPgPuavQ6MK2src3SdaJkk02223V5dmnWaIJixmETsa30/KrvUCqVPx4LLduWxEHSxNdSbrNGgHvcxTG1J/Ps0GQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749824377; c=relaxed/simple;
	bh=UwHkwFpQAXuEx9ZUwL1gDFTlsXnFVD+FiId8x5R6RpM=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DpCDWyEj4SU0dtURpUgRSspm5hxfA1JmB2ceQCwo4JM+z3uyeiRosa+EWF1aVRuLRWSfqVW9vDVdCFPWyOCROCfYN72z19pTYeGtNk1YD/oopElCJdkO9OuPDVY2xVOIQzQSxQJco5CI6bmrvZzFTZi/7SD4Qa1daIrEhlBjf0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PgLbn6Ts; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PgLbn6Ts"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3105ef2a071so22110731fa.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 07:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749824374; x=1750429174; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gv8I1GvTHth13eKfrZUg5M6EkOo2RTJ8/9XLE5ScqU0=;
        b=PgLbn6TsLkMIhRuX/860JZuaeWjFZYoL+v4iODoYUpFtiDzC8ierBUsFgCC8JbfMeh
         lJWaIBGsdeNobR/yJMmoRU6M7IOUL2+InFY2yVEgiFyO190EiLG2A5OdNNrIb4Vr3I3c
         nfr8KhSbEAInZwIIqLqYBK17A041zPBY/INrI3OtJckwc5btmXvOErAPVkQ3dHbFza+b
         8F1vLM+6Jh3CMbWygUD1Z2OQkMrskp96HK3tav5h4pjWRvdIMWD3YB5jisME6KrwBmPL
         qlpe5ZnbzMEfLNfXScr7kRcwkv89BvT2tHoB4G5AIOV9n/Hh3H0p/ZL3WzJK1OWuaORV
         ocMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749824374; x=1750429174;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gv8I1GvTHth13eKfrZUg5M6EkOo2RTJ8/9XLE5ScqU0=;
        b=TpNJxd+d2bHc7/ivhqhHZo5GM/mxK/sBvhv8pMEkzUulJIr/12Cs4ard33GAnXZJdU
         CNtO8m74io5JsF687b9AhTOY/Dw2//Er02bw69ccAjEmj6FJRHZIPdHntPCQ2VSDLLi0
         GAG6u07jZTkQasXJyqBTXQh6h5dJnOfVmhlscLmADis7U5uJIZ6TK5pUETViyWt5auKy
         LpxlYt+J63+6RtUKn1Ay16A+TW08IIPPjTPvipg2SK/QnjMLcYfAlqAj7NSeC3VkmWdx
         q9zkloc+YBWCgIE/lUp2yxxuDGKAiI5LfBSQ389Mx45bzhQYyG4orKSqBvgsZ/DfhuCb
         0BCg==
X-Forwarded-Encrypted: i=1; AJvYcCWgimpuwpazgbmlEVqKbGrpLQIyismvpt+are5QWprnJlsodmW4Xr5dBy3Is4a6gob2yJJhjGkxEbvvxko=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIuAw+eDKXTeiAXqRUXW+Q2KSf+EAdbYvDZtMKv1hE98LYiaEw
	pgWwA98YtfpS5pcqFVrifnjbYBA0vNrnqZO/Z8z5dZ6t2BsgrUr8DnIU
X-Gm-Gg: ASbGnctSlDu5IA2R/ZOe553dl3aGF3lo5KfljzAvq5o/KuNr23oqHOe404NG/38vYWm
	vLU9BtUgWMkdIrc5mb4V/mJb2b6EqaZUSYiLmx5vFcKdJWlhUp2+46cvh3ZQkUpxynWajWqWxtx
	F1OCnt/czSMiDRHcjYvGhpVjyuf2VXGtUT+vUSV0sXQIsoi21zl9RdY2iEW0LtUM2vhDAda0Zpr
	8NVDKuT2n0ezmG/BYaXo5OKc01WU3pWS3/L3JA1uOeS/QK+2aRiGruAi4caT3rtkgavHc3KP83d
	VUxj5YHPoiFBBZA0WhyfiN6fMfGDAAJYI1iu3IBN9Wz97L0QI7hn1Nc0LJpH2cNl3Kq6PhCqslg
	jykptXdj8DwI=
X-Google-Smtp-Source: AGHT+IG7goMirBRQmDPAqY7PXhhkJ6tXRdtqjscRKWJowWlCVBZ/NcrvEhvkOqwn6Mfkf9bRzm1M7w==
X-Received: by 2002:a05:651c:1503:b0:32a:666e:9f14 with SMTP id 38308e7fff4ca-32b3eb185a4mr9327241fa.19.1749824373735;
        Fri, 13 Jun 2025 07:19:33 -0700 (PDT)
Received: from pc636 (host-95-203-1-180.mobileonline.telia.com. [95.203.1.180])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b33170a5esm5606011fa.71.2025.06.13.07.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 07:19:33 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Fri, 13 Jun 2025 16:19:30 +0200
To: Dev Jain <dev.jain@arm.com>
Cc: "Uladzislau Rezki (Sony)" <urezki@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	LKML <linux-kernel@vger.kernel.org>, Baoquan He <bhe@redhat.com>,
	Christoph Hellwig <hch@infradead.org>,
	Oleksiy Avramchenko <oleksiy.avramchenko@sony.com>,
	Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [PATCH 2/4] lib/test_vmalloc.c: Allow built-in execution
Message-ID: <aEwzcsDM2PPsx1h-@pc636>
References: <20250417161216.88318-1-urezki@gmail.com>
 <20250417161216.88318-2-urezki@gmail.com>
 <6c6f1cfa-7f1b-4133-ae2a-c6b1ef2d82e8@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6c6f1cfa-7f1b-4133-ae2a-c6b1ef2d82e8@arm.com>

Hello, Dev!

> 
> On 17/04/25 9:42 pm, Uladzislau Rezki (Sony) wrote:
> > This patch removes the dependency on module loading ("m")
> > for the vmalloc test suite, enabling it to be built directly
> > into the kernel, so both ("=m") and ("=y") are supported.
> > 
> > Motivation:
> > - Faster debugging/testing of vmalloc code;
> > - It allows to configure the test via kernel-boot parameters.
> > 
> > Configuration example:
> >    test_vmalloc.nr_threads=64
> >    test_vmalloc.run_test_mask=7
> >    test_vmalloc.sequential_test_order=1
> > 
> > Signed-off-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
> > ---
> >   lib/Kconfig.debug  | 3 +--
> >   lib/test_vmalloc.c | 5 +++--
> >   2 files changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> > index f9051ab610d54..166b9d830a85a 100644
> > --- a/lib/Kconfig.debug
> > +++ b/lib/Kconfig.debug
> > @@ -2574,8 +2574,7 @@ config TEST_BITOPS
> >   config TEST_VMALLOC
> >   	tristate "Test module for stress/performance analysis of vmalloc allocator"
> >   	default n
> > -       depends on MMU
> > -	depends on m
> > +	depends on MMU
> >   	help
> >   	  This builds the "test_vmalloc" module that should be used for
> >   	  stress and performance analysis. So, any new change for vmalloc
> > diff --git a/lib/test_vmalloc.c b/lib/test_vmalloc.c
> > index 4ab23e5e772d0..6d65ef725d42c 100644
> > --- a/lib/test_vmalloc.c
> > +++ b/lib/test_vmalloc.c
> > @@ -591,10 +591,11 @@ static void do_concurrent_test(void)
> >   	kvfree(tdriver);
> >   }
> > -static int vmalloc_test_init(void)
> > +static int __init vmalloc_test_init(void)
> >   {
> >   	do_concurrent_test();
> > -	return -EAGAIN; /* Fail will directly unload the module */
> > +	/* Fail will directly unload the module */
> > +	return IS_BUILTIN(CONFIG_TEST_VMALLOC) ? 0:-EAGAIN;
> >   }
> >   module_init(vmalloc_test_init)
> 
> Hi Uladzislau,
> 
> Post this patch I am seeing the following problem: while booting the kernel, this test is
> executed and a particular testcase triggers a warning splat from the kernel, then the boot
> gets stuck for 3-4 seconds, then proceeds. I am not an expert on modules so I don't know
> what happened but I am guessing that when the test fails, the delay is due to module
> unloading time...do you suggest a solution? I reverted your patch and then proceeded with
> my work, so apologies for not having the dmesg log, if you need it I'll replicate, although
> there is some subtest which has consistently been spitting out a warning on my Apple M3 Linux
> VM and I have been just ignoring it for long : )
> 
This is because CONFIG_TEST_VMALLOC=y is built-in in your case.
Therefore the tests are triggered including the ones which generates
kernel warnings, which is expectable. It takes some time to execute,
therefore you see a delay.

By default the CONFIG_TEST_VMALLOC is not set. This is just for
debugging purpose. Please unset it in your kernel configuration.
It is located under:

Kernel Hacking
  Kernel Testing and Coverage
    Runtime Testing
       Test Module for stress/performance analysis of vmalloc allocator

--
Uladzislau Rezki
