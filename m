Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7307A1A8F84
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 17:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750093300; cv=none; b=VZdF6gFOM0kCeGasDj1kJ+AG7LWDHUu93gQbp2LQCJEFEgBjxWTbXutZ6UjnCk+UrzT7iqQn6q1KibREmaHiLcHrs4PSyROWZLk2NNsttCA97Ix0pyEbApaYGeefkcUK/gaxHBXlZhjAyOtsWc6+tIe17VkKtUyRxk5g+/jnV4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750093300; c=relaxed/simple;
	bh=2R5hhSR2JrKRL9xcNzglja182QRDhCp1/OAp1nwgtSE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mt0LqeAK1zF5NvA1QE73ChAUTw3m+tNDO8gwBnRG/O17HjVYX/No+RW4/Ws/HShZoeczZwkK3+uBa6NUoXSuQv4Jy9ZmCAoreb5bH+/90FFsa4Bx9+zuPsb9vkLXVs5G/EnBV9semAgEX94ORztRpXQlsojdas/GT3cr9Y9Y5dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jUiJ6HmV; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jUiJ6HmV"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2351227b098so38707755ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 10:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750093298; x=1750698098; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=47DyzFv4fcCp7ww62M69bAjXyvOnMMx4UoBOVHFnQXg=;
        b=jUiJ6HmVw2tGk0QluXra9q/k+vURj2eNwwPa3a+xc7rqnwDxq1JmQkaVbkcO1StvFB
         17uC0JkG/krmO7miS1tYCkojq1GssQuDDihmBu4dSC5Iw+U7JzHF+Fg7d+ZMpYkDwKcg
         XezdV52TV7WOU/Q1phz99TChAtgYoH2LCEb0g3vEEtJUqw0nyxoc0PC8my/v3ASRmham
         NG3FPx5RwfgjBh65EmiX1qnoRgJNK1N5LW7yL/1qZZW4YBwnLpKhlR6pII8iCLP+tlXg
         R1ofIxGuo62DG/OiVr8+heOlaRszRr680JDw/FzBwS9LzUMjTQKQKTIp25DBKHLsxLJ6
         UohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750093298; x=1750698098;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=47DyzFv4fcCp7ww62M69bAjXyvOnMMx4UoBOVHFnQXg=;
        b=thy6LsyxB3N6MCNepMNpn0x++w/obPWAt5Ae4xQFJhgTAGg/0MAjrOobM20D6ymZGw
         nYGE0KR6IfLS1/1ISk69C16WvRhk6WzsBA4vdM5p4qRU0W+7osIvB11ASBpUtICqEX6K
         nr+5wntcaSDkPGrqn20YSTFReK3FIhZaKPK/4VW89GfCLXNe+k7Q0rjm2jRknIfB7iT4
         6pquQhwv88g/RhOmKt0PYXXwbMwWkkVYCBvbJTjQwomKxWyAjpgS3V8BaW0dtoZCPEJL
         ewsEhofPh/1gMYffzHGGtBXf7/nG2kFJiYkOH4/QNPrEEvJRtrZnSC38WDsEC8KAXlPR
         feHA==
X-Gm-Message-State: AOJu0YySPx7p5DqgebM6mlaHwGnk6p6n5adQ/r62N/EBMZEridxXvO7U
	y0HxbP6j56kl84XOcQbMxYWlwgVvW/6TZq+1ORHE16AqaIjzBsQoZz3RcPgK4g==
X-Gm-Gg: ASbGncvYHb1hUqcwkDxyYKw3f2lalmCziKADOM2jTeachiIEmUzS8zkNECmznhmOt5m
	zAvlGYdzsQ/F7Pxj38WPMwxeADyIhmUkm3pVsEy13bRIWmGRLqWxhz8meJMBfeph8egnhNPc/F2
	TpbMH4NV4nd9DI4Js1QBP6xaBufVswzvEMgKCwKl+2TtGCWYpUZNbojYIqVxgYmjJvgihaLOnxz
	t+34XyEs+VlULrGq8V/rgKlyB/Ei+kCNALYX8C4/4Zs0bm/s26TJJPlsfg8nVV/wSK1tX52Q1Pw
	+eVuqk38YijmBrwUzqfeqannkVo1nLBIr5WJirWM9k3wl5bNOk7n+9QxfCAsPstRyxuryF7oYo4
	=
X-Google-Smtp-Source: AGHT+IEM8pg4Q4rV9Ut+5BkZqKcl9l75mge10sxMku62If25A8UZ38jrZXIYlnxIZV1/JSIpPg1ZBA==
X-Received: by 2002:a17:902:e5cf:b0:234:cc7c:d2e8 with SMTP id d9443c01a7336-2366b3c3897mr141751885ad.37.1750093297624;
        Mon, 16 Jun 2025 10:01:37 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de78181sm64090085ad.122.2025.06.16.10.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 10:01:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 16 Jun 2025 10:01:36 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: Linux 6.16-rc2
Message-ID: <4563080c-d0a4-4dea-a746-51370fd5da42@roeck-us.net>
References: <CAHk-=wjoSZFTv3kWKpcHoWJG723TS5KxfStvB40mYYjqVspgFw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wjoSZFTv3kWKpcHoWJG723TS5KxfStvB40mYYjqVspgFw@mail.gmail.com>

On Sun, Jun 15, 2025 at 02:06:11PM -0700, Linus Torvalds wrote:
> Pretty quiet week, with a pretty small rc2 as a result. That's not
> uncommon, and things tend to pick up at rc3, but this is admittedly
> even smaller than usual.
> 
> It may be that people are taking a breather after a fairly sizable
> merge window, but it might also be seasonal, with Europe starting to
> see summer vacations... We'll see how this goes.
> 
> The diffstat looks somewhat unusual, with a lot of one-liners with
> both ARC and pincontrol having (presumably independently) ended up
> doing some unrelated trivial cleanups.
> 
> But even that is probably noticeable only because everything else is
> pretty small. That "everything else" is mostly network drivers (and
> bluetooth) and bcachefs, with some rust infrastructure and core
> networking changes thrown in.
> 
> And, as always, just random smaller stuff all over. Shortlog appended
> for people who like to see the details.
> 

Build results:
	total: 159 pass: 159 fail: 0
Qemu test results:
	total: 636 pass: 631 fail: 5
Failed tests:
	arm:supermicro-x11spi-bmc:aspeed_g5_defconfig:mtd32,0,6,1:net=nic:aspeed-bmc-supermicro-x11spi:sqf
	arm:ast2600-evb:aspeed_g5_defconfig:mtd64,0,6,1:net=nic:aspeed-ast2600-evb:ext2
	arm:fuji-bmc:aspeed_g5_defconfig:mem1G:mtd128,0,8,1:net=nic:aspeed-bmc-facebook-fuji:f2fs
	arm:g220a-bmc:aspeed_g5_defconfig:mtd32,0,12,2:net=nic:aspeed-bmc-bytedance-g220a:sqf
	arm:qcom-dc-scm-v1-bmc:aspeed_g5_defconfig:mtd64,0,12,2:net=nic:aspeed-bmc-qcom-dc-scm-v1:ext2
Unit test results:
	pass: 595297 fail: 1
Failed unit tests:
	x86_64:q35:iov_kunit_extract_pages_xarray
	x86_64:q35:iov_iter

Pretty much the same as last week. A revert for the mtd problem has been
submitted [1], so the arm test failures should hopefully be resolved soon.

There is also a compiler version dependent build failure seen when building
xtensa:allmodconfig.

tensa-linux-ld: drivers/clocksource/timer-tegra186.o: in function `tegra186_timer_remove':
timer-tegra186.c:(.text+0x350): undefined reference to `__udivdi3'

Some compiler versions don't translate
	(((u64)wdt->base.timeout * USEC_PER_SEC) / 5)
into a simple multiplication by (USEC_PER_SEC/5) but take the code
literally and multiply first, then divide. I have seen this with gcc 13.3
and 13.4. It is not seen with gcc 14.3 (which is why I missed it last week).
I submitted a fix [2].

The iov unit test failure is:

     # iov_kunit_extract_pages_xarray: ASSERTION FAILED at lib/tests/kunit_iov_iter.c:63
     Expected got == npages, but
         got == 1 (0x1)
         npages == 256 (0x100)
     # iov_kunit_extract_pages_xarray: pass:0 fail:1 skip:0 total:1
     not ok 12 iov_kunit_extract_pages_xarray
 # iov_iter: pass:11 fail:1 skip:0 total:12
 # Totals: pass:11 fail:1 skip:0 total:12
 not ok 26 iov_iter

This is not new; it is seen sometimes if PREEMPT_RT is enabled. The problem
is that alloc_pages_bulk() may return 1 if it can not allocate all pages,
and I guess that PREEMPT_RT randomly triggers that situation.

Guenter

---
[1] https://patchwork-proxy.ozlabs.org/project/linux-mtd/patch/20250613180722.1268159-1-miquel.raynal@bootlin.com/
[2] https://lore.kernel.org/lkml/20250614175556.922159-1-linux@roeck-us.net/
