Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7821A7262
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 15:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749915354; cv=none; b=gDFRA5bNKmmbIlRaMHn8IaN80hOCLBSqolbg0A99keyxhGY5LqGUuGNOjcyoZ25UagDtJMJoH8Rf30Q9Q3lp6PRZFuTGzjZUyZn6pkUs2MGwmwhIdcfoemJ7vhR33sGALsowmbs56FsRqaTkROo5p+dkMFRX2PptGlDklY6TeqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749915354; c=relaxed/simple;
	bh=YOwFReqhltsy4LHvdkwQ650tT/NzemA3b/z2LaAL8RY=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VGB30lsOE6bDgVau9GHXCxSde/MDeewuf3+KWHWTVdRziXOL8GgXMUQj3kR1pfZDvvnqn+wIb3dI6ydMYHu3FL0O6WpMO9UrRtBuQB3teV6EOZ9Cxe5g+fhdY17flRqIvk3COYI9VTA+H+MJXP0tpYYO9gsjX1rvpnEPSZRaxxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IwlBFe8e; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IwlBFe8e"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54b09cb06b0so3502054e87.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 08:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749915350; x=1750520150; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=21CiR4XNO29g+j3jUgvLM4rd1CxnhnosKhv5aVJJKQs=;
        b=IwlBFe8edaWAAyOdFSB+LmISE+Rhp0oXhxDPyf1zteVXIWxa7lqg4QrDT6n+ppXLTb
         TecKocV0dvZ/L9a1fESRTYOqsdhHs8jy1Mc4gyTK7i60M+qC/+iZlCrM6SbHb+y5HLoP
         Q2Rp9bp/ov3p7gz8W3YT4xAOR9eRUGXhwK1JOEJNqqvvxIZ62sHP2zq+1+aA5QnmdUzx
         gExRgd8mhv2jJANcMGdiUg+o9rgq+HKNr6lRG7E2LveO9+JabSQ32tpjNgwhZqY38z/0
         69lQr+0M0Gu+tobOcvhN9+7SlOKVO/M+fJjwUO7WJewExa1pGVtLt03nrdnjZa6gD3+U
         TfwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749915350; x=1750520150;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=21CiR4XNO29g+j3jUgvLM4rd1CxnhnosKhv5aVJJKQs=;
        b=so0zUxJY0ZLPvcUlKkIIewjC67jLa11bSsKY0iiF4gTofbnlcIFl3StJl3lh6W4wS6
         BhaWVTlvbzfZIOxXu3cFjrhpVWElFUI4MfnjmBJ8stucPb9xRR/9Un0lFH/fZVqP4eZ8
         07JWWskP6pXI9BL9bBKiUBsq2QyPRgQg8BKfUA3Z5BX3zSsEAMZFPI9r9Rda7l3kmChH
         BiiiCgYrmawl1WPjJiIyrnvAT264v3yU8w50ZBekgUG037WPMgLs+JaWo8QCv7AGIn+4
         mZB1BkUUeB/HBPM5oTsJtw1/Gxxm72Q5xkZ/cW5quYeFYkXDZY023tG/bqQnieMrfFy9
         c4CQ==
X-Forwarded-Encrypted: i=1; AJvYcCXR3rOpqSaPWGWu8pE8KJ6DIz3jOD2SzW7y9BxkJMXlr+yiu21/8LX5bnwB1u0Dfl1vzLtYX3Gea5ylQKA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuWfKRbJ+/vy3EKO3CL8r5Wb61NZsm3gPtHzfGBwThlb1XNa3a
	c2NKo03UaKYSu/ae8f7i/Q8xNTizjqfXdGQhHaz8GJHhJa1rLjAh+BWz
X-Gm-Gg: ASbGncvI4/WtgKmNwqIchAXj2sILN1WIempHjZWgZkT/VNYsD4lNK/0ckO3W5Bu5uzn
	rjVvR7OQleUzfh7WF18S8CovrX7fPoKCMMkw18mTS7kjPKgVlgS3nrkfShS4OfMZdkAJumThwXV
	BiA3IGzFopcslUveQzt9sXhR6/UQ+z+KqEme1iMbdzQ31602PJpUGzn2Vxs1wbxjEPpNi9i9EUm
	9LjYDWXbDLXuze7rD2w6kOdwQWMPt4KGrwl2r1F7EMU6d1yHmOrPIJecyV9dMsSz3wD+mSNZq9l
	7rGydLm3qzs50IoeUjwnrPEsFn+h
X-Google-Smtp-Source: AGHT+IHFBaeLcVckKVW7IHweItTPqSsXeF13zuZ3KJFAYsmL34PaHP5pZrggwwKzPhPo3La6tmqrIQ==
X-Received: by 2002:a05:6512:3e23:b0:553:2190:fef8 with SMTP id 2adb3069b0e04-553b6e6d5f2mr686271e87.7.1749915350032;
        Sat, 14 Jun 2025 08:35:50 -0700 (PDT)
Received: from pc636 ([2001:9b1:d5a0:a500::800])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1aa020sm870851e87.101.2025.06.14.08.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 08:35:48 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Sat, 14 Jun 2025 17:35:47 +0200
To: Dev Jain <dev.jain@arm.com>
Cc: Uladzislau Rezki <urezki@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	LKML <linux-kernel@vger.kernel.org>, Baoquan He <bhe@redhat.com>,
	Christoph Hellwig <hch@infradead.org>,
	Oleksiy Avramchenko <oleksiy.avramchenko@sony.com>,
	Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [PATCH 2/4] lib/test_vmalloc.c: Allow built-in execution
Message-ID: <aE2W0xX1W4xxhHqc@pc636>
References: <20250417161216.88318-1-urezki@gmail.com>
 <20250417161216.88318-2-urezki@gmail.com>
 <6c6f1cfa-7f1b-4133-ae2a-c6b1ef2d82e8@arm.com>
 <aEwzcsDM2PPsx1h-@pc636>
 <b28374e1-a387-4a2c-8986-02cd5081a8ab@arm.com>
 <aEw3pSVJxyCkhnTd@pc636>
 <0a7dd23f-9f6f-46b5-8ef0-b09ea1b3ccd7@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0a7dd23f-9f6f-46b5-8ef0-b09ea1b3ccd7@arm.com>

On Sat, Jun 14, 2025 at 03:57:26PM +0530, Dev Jain wrote:
> 
> On 13/06/25 8:07 pm, Uladzislau Rezki wrote:
> > On Fri, Jun 13, 2025 at 07:53:37PM +0530, Dev Jain wrote:
> > > On 13/06/25 7:49 pm, Uladzislau Rezki wrote:
> > > > Hello, Dev!
> > > > 
> > > > > On 17/04/25 9:42 pm, Uladzislau Rezki (Sony) wrote:
> > > > > > This patch removes the dependency on module loading ("m")
> > > > > > for the vmalloc test suite, enabling it to be built directly
> > > > > > into the kernel, so both ("=m") and ("=y") are supported.
> > > > > > 
> > > > > > Motivation:
> > > > > > - Faster debugging/testing of vmalloc code;
> > > > > > - It allows to configure the test via kernel-boot parameters.
> > > > > > 
> > > > > > Configuration example:
> > > > > >      test_vmalloc.nr_threads=64
> > > > > >      test_vmalloc.run_test_mask=7
> > > > > >      test_vmalloc.sequential_test_order=1
> > > > > > 
> > > > > > Signed-off-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
> > > > > > ---
> > > > > >     lib/Kconfig.debug  | 3 +--
> > > > > >     lib/test_vmalloc.c | 5 +++--
> > > > > >     2 files changed, 4 insertions(+), 4 deletions(-)
> > > > > > 
> > > > > > diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> > > > > > index f9051ab610d54..166b9d830a85a 100644
> > > > > > --- a/lib/Kconfig.debug
> > > > > > +++ b/lib/Kconfig.debug
> > > > > > @@ -2574,8 +2574,7 @@ config TEST_BITOPS
> > > > > >     config TEST_VMALLOC
> > > > > >     	tristate "Test module for stress/performance analysis of vmalloc allocator"
> > > > > >     	default n
> > > > > > -       depends on MMU
> > > > > > -	depends on m
> > > > > > +	depends on MMU
> > > > > >     	help
> > > > > >     	  This builds the "test_vmalloc" module that should be used for
> > > > > >     	  stress and performance analysis. So, any new change for vmalloc
> > > > > > diff --git a/lib/test_vmalloc.c b/lib/test_vmalloc.c
> > > > > > index 4ab23e5e772d0..6d65ef725d42c 100644
> > > > > > --- a/lib/test_vmalloc.c
> > > > > > +++ b/lib/test_vmalloc.c
> > > > > > @@ -591,10 +591,11 @@ static void do_concurrent_test(void)
> > > > > >     	kvfree(tdriver);
> > > > > >     }
> > > > > > -static int vmalloc_test_init(void)
> > > > > > +static int __init vmalloc_test_init(void)
> > > > > >     {
> > > > > >     	do_concurrent_test();
> > > > > > -	return -EAGAIN; /* Fail will directly unload the module */
> > > > > > +	/* Fail will directly unload the module */
> > > > > > +	return IS_BUILTIN(CONFIG_TEST_VMALLOC) ? 0:-EAGAIN;
> > > > > >     }
> > > > > >     module_init(vmalloc_test_init)
> > > > > Hi Uladzislau,
> > > > > 
> > > > > Post this patch I am seeing the following problem: while booting the kernel, this test is
> > > > > executed and a particular testcase triggers a warning splat from the kernel, then the boot
> > > > > gets stuck for 3-4 seconds, then proceeds. I am not an expert on modules so I don't know
> > > > > what happened but I am guessing that when the test fails, the delay is due to module
> > > > > unloading time...do you suggest a solution? I reverted your patch and then proceeded with
> > > > > my work, so apologies for not having the dmesg log, if you need it I'll replicate, although
> > > > > there is some subtest which has consistently been spitting out a warning on my Apple M3 Linux
> > > > > VM and I have been just ignoring it for long : )
> > > > > 
> > > > This is because CONFIG_TEST_VMALLOC=y is built-in in your case.
> > > Actually, I have a usecase for test_vmalloc :) I wanted to test my
> > > patches through the test, but the problem is that the moment it fails,
> > > it gets unloaded and then I cannot use the test at runtime. Currently it
> > > is set to =m in my .config.
> > > 
> > Ah. It is unloaded itself when tests are done. Do not use the
> > test_vmalloc.ko directly. Instead use test_vmalloc.sh script.
> > 
> > It is located here: ./tools/testing/selftests/mm/test_vmalloc.sh
> > 
> > Example: sudo ./test_vmalloc.sh nr_threads=HOW-MANY-CPU-YOU-have(digit) run_test_mask=7
> 
> This is what I have been doing. Before your patch, I was able to run the test multiple
> times, even in case of failure. After the patch, it fails at boot time and unloads.
> 
If it is set as "m" it will not run during boot, because it will be
compiled as a kernel module. Unless your system during a boot process
loads all modules. But even then you can trigger the test how many
times you want.

It must be set as "y" in your system. Then yes, it executes only once
during the boot. If you want to execute it many times set it as "m".

Could you please do below:

urezki@pc638:~/data/raid0/coding/linux.git$ cat .config | grep VMALLOC
# CONFIG_DEBUG_PERF_USE_VMALLOC is not set
CONFIG_HAVE_ARCH_HUGE_VMALLOC=y
CONFIG_VIDEOBUF2_VMALLOC=m
CONFIG_HAVE_ARCH_KASAN_VMALLOC=y
CONFIG_TEST_VMALLOC=y
urezki@pc638:~/data/raid0/coding/linux.git$

--
Uladzislau Rezki
