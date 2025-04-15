Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8F21C9B9B
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 08:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744706918; cv=none; b=QhQ93wU+Cxvjuqf3OVF9cImu6yCpxSP7TXzd08SVa83UZ4SM9BDqoBiPRJGhdkxPCdoXojYFdqazV1+fBXqfcSb6VgOEiDyKTRr/eMgTqj4nfpcp8xRB9GXrc1ou0LwAjOcC1PtRoB6fMacZHPn6uMX7JSA/wsNOe9DVxpDym9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744706918; c=relaxed/simple;
	bh=YpGE9PeI6qljbIjagiXOfBb0zzsFMHdNh4gM5kYQc20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PZUfFse5oq6qusIHiZHq3wDkJN4G/BJbwitY+fWqSUmi7cN1P274lAvd2XSXkxdRHOMgzH89mV/I5jFKotbNEfv6PIR8OLbTkC3u6fpdno1Z/9zAA4yG9/BTDIOCJssLVHzHShlIdSKTT55/Y063SwwsGpwfPzZ95WI1ptqdLho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BViVzzqA; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BViVzzqA"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43ef83a6bfaso34415e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 01:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744706915; x=1745311715; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P2dLV0t9lDObm6obO+scd0gk1JmVp4YwTv7aMmXR6dQ=;
        b=BViVzzqAS+RwFsvXqalo32FHBj7Ze9d2F3a6pSssFPxP4M77hI33r3HxCH1PWKEKwt
         2cYZtkNcGmBk8x7gzn1nuugBvzwhpsudNmugKfKc7jmadl1E4v6vHa5BToq6A95OLMKU
         J1vk7NZWu6DW9DT92km1Xt/wzQGYFteE+QxQWDpMTI983t5IXFbjU/hbmD3z/L/J3t6G
         tzhqAGJzHEZMn8g6+W7DlXo1tw/aYqLppU33NR7au8b+N5AwhEhSadI32CjUqxiHWhVh
         Hl6dvlgwZ2yEh04FvU02o/NJxr5j7wvx6pYVVp7qfG8IDswB3mA1ltlmxXTMPYka94HF
         u9hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744706915; x=1745311715;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P2dLV0t9lDObm6obO+scd0gk1JmVp4YwTv7aMmXR6dQ=;
        b=JiGdfzBp9zlr52CGTlOEcebxAm/4lOI0zFQ11LEIkrvVqaGwntTaF5cbm2Loc1HYlP
         qhZuGiM1JKDjAGTpOqzMKS7fAI6d+aW5khA6nuuqoRCY+W3v3/Ed6OooUverIfar4nUm
         d/KBiDBrgxSqJa4z/5QIYbnLRHIVbPefyD2oBFHeSY2wW19yG5NP62jc1QNULf4x4yj8
         tejynsCVqAwRI8Wkg545Ovc7XcAWGiIfiqxZ2YoDyrXUoTsX6uSwRmISTScLcTyUNJc7
         dkLxVW5AzfstGC0duVWzipw9qJYgJ7a85dtuAWUHqFtEuFbBvVViMjXm8ZCdsFfEvwTO
         Y/RA==
X-Gm-Message-State: AOJu0Yz15HkLKsE0dhyhfcavrOY9bTAwI+sUW8QcWkcHzOWCZo4JuD5U
	LdUVAZUmXoJmnnO9lZ5t5FG+n2hzzNKGsHr2AXZ4n2e8t/fcp18BP23mzmoQSw==
X-Gm-Gg: ASbGnctFLA7vzopqRU61mL90AKr0OjcBycikqd0GHdYzFg73s5l9N+6OPcObynUhcBL
	S5FSiMD9G44p6gP1s04JHaAx0FD4TSoB1yLtqnREE5tbORIt2Gue5DF6Su+/AhN36gzDkIpSpnS
	g2mW+Jpxq3iEFk84oBR4Xk11cth7V23EEzs3IS5ua9r4ZEDMqDIZVY6qQqLvgDensQNxTNkG7YQ
	uhMCWLk8DRO3ZCxYb4hBJd8UeLi0sysGlyRw0E1zUIg9uv4XZK3e9qshWFEAXWXvmeCDS0SiibH
	TNj291/OucRywyv1mRpccLXv/7euFzbMWtAAQKfLll29Cm/xgWyTXbcE0NF/NoUl/DZ3n46c51m
	YMd8=
X-Google-Smtp-Source: AGHT+IEw3FcKaMzh8DzK+uNK+g/Fol/Pa9NIHCybAcjdx76dEeQ3Is9Gamr39YCVdPE+Fgj9TkcRtA==
X-Received: by 2002:a05:600c:4247:b0:43d:169e:4d75 with SMTP id 5b1f17b1804b1-44039657a6bmr408175e9.1.1744706914774;
        Tue, 15 Apr 2025 01:48:34 -0700 (PDT)
Received: from google.com (202.88.205.35.bc.googleusercontent.com. [35.205.88.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43cb43sm13614636f8f.65.2025.04.15.01.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 01:48:34 -0700 (PDT)
Date: Tue, 15 Apr 2025 08:48:30 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
	linux-hardening@vger.kernel.org, kees@kernel.org, elver@google.com,
	andreyknvl@gmail.com, ryabinin.a.a@gmail.com
Subject: Re: [PATCH] lib/test_ubsan.c: Fix panic from test_ubsan_out_of_bounds
Message-ID: <Z_4dXk0RlyXYuzYt@google.com>
References: <20250414213648.2660150-1-smostafa@google.com>
 <20250414170414.74f1c4e3542b1f10c8b24d90@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414170414.74f1c4e3542b1f10c8b24d90@linux-foundation.org>

On Mon, Apr 14, 2025 at 05:04:14PM -0700, Andrew Morton wrote:
> On Mon, 14 Apr 2025 21:36:48 +0000 Mostafa Saleh <smostafa@google.com> wrote:
> 
> > Running lib_ubsan.ko on arm64 (without CONFIG_UBSAN_TRAP) panics the
> > kernel
> > 
> > [   31.616546] Kernel panic - not syncing: stack-protector: Kernel stack is corrupted in: test_ubsan_out_of_bounds+0x158/0x158 [test_ubsan]
> > [   31.646817] CPU: 3 UID: 0 PID: 179 Comm: insmod Not tainted 6.15.0-rc2 #1 PREEMPT
> > [   31.648153] Hardware name: linux,dummy-virt (DT)
> > [   31.648970] Call trace:
> > [   31.649345]  show_stack+0x18/0x24 (C)
> > [   31.650960]  dump_stack_lvl+0x40/0x84
> > [   31.651559]  dump_stack+0x18/0x24
> > [   31.652264]  panic+0x138/0x3b4
> > [   31.652812]  __ktime_get_real_seconds+0x0/0x10
> > [   31.653540]  test_ubsan_load_invalid_value+0x0/0xa8 [test_ubsan]
> > [   31.654388]  init_module+0x24/0xff4 [test_ubsan]
> > [   31.655077]  do_one_initcall+0xd4/0x280
> > [   31.655680]  do_init_module+0x58/0x2b4
> > 
> > That happens because the test corrupts other data in the stack:
> > 400:   d5384108        mrs     x8, sp_el0
> > 404:   f9426d08        ldr     x8, [x8, #1240]
> > 408:   f85f83a9        ldur    x9, [x29, #-8]
> > 40c:   eb09011f        cmp     x8, x9
> > 410:   54000301        b.ne    470 <test_ubsan_out_of_bounds+0x154>  // b.any
> > 
> > As there is no guarantee the compiler will order the local variables
> > as declared in the module:
> 
> argh.
> 
> > 	volatile char above[4] = { }; /* Protect surrounding memory. */
> > 	volatile int arr[4];
> > 	volatile char below[4] = { }; /* Protect surrounding memory. */
> > 
> > So, instead of writing out-of-bound, we can read out-of-bound which
> > still triggers UBSAN but doesn't corrupt the stack.
> 
> Would it be better to put the above three items into a struct, so we
> specify the layout?

Yes, that also should work, but I ran into a panic because of another
problem, where the padding before and after the arr is 4 bytes, but
the index is "5", which is 8 bytes out of bound.
As we can only use 4/-1 as out of bounds.
That should also work:

diff --git a/lib/test_ubsan.c b/lib/test_ubsan.c
index 8772e5edaa4f..4533e9cb52e6 100644
--- a/lib/test_ubsan.c
+++ b/lib/test_ubsan.c
@@ -77,18 +77,18 @@ static void test_ubsan_shift_out_of_bounds(void)
 
 static void test_ubsan_out_of_bounds(void)
 {
-	volatile int i = 4, j = 5, k = -1;
-	volatile char above[4] = { }; /* Protect surrounding memory. */
-	volatile int arr[4];
-	volatile char below[4] = { }; /* Protect surrounding memory. */
-
-	above[0] = below[0];
+	volatile int i = 4, j = 4, k = -1;
+	struct {
+		volatile char above[4]; /* Protect surrounding memory. */
+		volatile int arr[4];
+		volatile char below[4]; /* Protect surrounding memory. */
+	} data;
 
 	UBSAN_TEST(CONFIG_UBSAN_BOUNDS, "above");
-	arr[j] = i;
+	data.arr[j] = i;
 
 	UBSAN_TEST(CONFIG_UBSAN_BOUNDS, "below");
-	arr[k] = i;
+	data.arr[k] = i;
 }
 
 enum ubsan_test_enum {

---

I can send v2 with this approach if it's better.

Thanks,
Mostafa

> 
> > --- a/lib/test_ubsan.c
> > +++ b/lib/test_ubsan.c
> > @@ -77,18 +77,15 @@ static void test_ubsan_shift_out_of_bounds(void)
> >  
> >  static void test_ubsan_out_of_bounds(void)
> >  {
> > -	volatile int i = 4, j = 5, k = -1;
> > -	volatile char above[4] = { }; /* Protect surrounding memory. */
> > +	volatile int j = 5, k = -1;
> > +	volatile int scratch[4] = { };
> >  	volatile int arr[4];
> > -	volatile char below[4] = { }; /* Protect surrounding memory. */
> > -
> > -	above[0] = below[0];
> >  
> >  	UBSAN_TEST(CONFIG_UBSAN_BOUNDS, "above");
> > -	arr[j] = i;
> > +	scratch[1] = arr[j];
> >  
> >  	UBSAN_TEST(CONFIG_UBSAN_BOUNDS, "below");
> > -	arr[k] = i;
> > +	scratch[2] = arr[k];
> >  }
> 
