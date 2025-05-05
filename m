Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3DC192D6B
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 14:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746454103; cv=none; b=ErJwGptTWw4qngiD9h9IAgUKwFj6Yugxdonc/bshkdwwNXiIECjevGFlEQkst3Ptmyu12EoxQKn1Mzgbsgv8sCjcJDmeIdglQlO8P4cfy4ciR2gv7DN19FSIy1JYVY9YAlbTZ/D2PQMWNmd4IdC/8JncrReDtBZHK96KVuj4I4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746454103; c=relaxed/simple;
	bh=WVLUBgPTA4tf6st+3TFtwtbv1XdaJq07Pu6I4twsmL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=swdSoul9SLKGJMtnqD15uqMljCylFahnlcb6nQvzCko0lurCYAAyQuz0/D3C6/znvAYRqcuKSXY2P+TeZ7weaiA7XfxXfAJkVwg20afNU8M7E9AfFItdQZN4bpVgeho/IgviSReqdNB6O6PD3ggWiXTPLPQXRfRCwfdnxFyLjoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=elcP5Ahh; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="elcP5Ahh"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7c597760323so470014685a.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 07:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1746454099; x=1747058899; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bnGazODhLi7rd2UydKCGPq4ZtmoQ/tiR6adwupAH7Gc=;
        b=elcP5AhhNzFizaAatihbXrbsxuu+YuVMjzA2G90uzICHujyN/amIpQvff4vikufAaW
         Vy0bn75cHBRWRmE08x+45yBPgOhbfgomUlTOsnOffxG+D9NKouVYxkzRMLfGc7iSUkTu
         /PXFxcGhNXjP3psTvdMocTQscVkpGjZoNov6i0EdApA9+DfAeCcJo8jJ2IKiweGraDSC
         1bAyTnN1rrc+otKORuLjKKCz1ZAHrx35BBIEEtGL5rCc1M9U03kKmYi4maP8rvgTXEVp
         z/NImy/I5SvKVp4f3a/5iCTIW7ysJrqiReMT5fj0pHjZLMsdz7BkFmC3mAqgyjDSd7cJ
         P+iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746454099; x=1747058899;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bnGazODhLi7rd2UydKCGPq4ZtmoQ/tiR6adwupAH7Gc=;
        b=J1pe3N5eVfqHiu0YJuF1lHw22cYfZahsiGg6BwT2a1gckbtbosC+lPbADT+124rXyV
         iW4rrcwT2D8vFv6PRBtE/G5QZM7sAXRW3naIaxWozAmmkXIu5Wl2e7xP/Bzf96pBvgvd
         ZE1AwOiq6t/dyvpgs9S/JZNBvYJ0f75JsMwVaOV+EZSw6FVnkf6e9yOhkdhKFnt/zQTr
         jpYM2ApLlS2jD3JdGkONMDJF2Ieq/w1AZ/hBHXEFSU5KITnX1yAFzqdNgBQibfBsus9B
         6706C5juH9r5a0b856ZpjCt4Vv7ThvpXDITIXeGw4QZcKbmsKfRoao3Rys+I/sEMW9B4
         9cbQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0/cr7ML21CBFQy2+pw6XFkVjwst3sRi4OQUptKSOAbjg9intfRlI1PAMtuYeKG+UAs6C1vagD0Ypqa+g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzir7h2GZ3/RpwuhBB4wEgfFtM2CjtgV/Or/b9dCL2Y7E5w23gw
	3oFuZC9aqyRhrkOljRZApsEcEsprq4G0bsZkSwWpGRmPhindLNk5ILHJYMRhfqc=
X-Gm-Gg: ASbGncvx1cTszUqWh/bsq7XDae2ZS0IwdNIdiZOccaVtWYlK7lK+TpSBjkJhjso+Z+K
	EdL/lqRZHjp0/d/qKdC0kY9qst4gQP6TiCMWXSFkmKJSsc5C8rOEnuOK3u1SirbcEVADhN1W9WM
	t08gLk9AXvLPSIDb4aA3005AqDifmSLELxxI2tMBH/keq/8N5+l9sDDJUXH1IBOhta0sgh3xdYy
	mzyiYmY6u6NmIeI0GNeIhgUFBkifwAb5wB641nspJo4Tvag7j2CLKhgzlt4a6rWQVU0bx0i9zUV
	lgNq87CenIq4mCP7hRRsRmrfbt3uVByuhCD+A3w=
X-Google-Smtp-Source: AGHT+IHeGZrdp1BmAYeZy/2G2GcLxeZitgpMyMEE5I2+I6lyL3IzjrQUsSibdVhgFaIpP4YAkxLcgQ==
X-Received: by 2002:a05:620a:2550:b0:7c5:4c6d:7f95 with SMTP id af79cd13be357-7cadfed81ffmr1174704785a.48.1746454094270;
        Mon, 05 May 2025 07:08:14 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7cad23c3ebdsm567930685a.40.2025.05.05.07.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 07:08:13 -0700 (PDT)
Date: Mon, 5 May 2025 10:08:12 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: Igor Belousov <igor.b@beldev.am>, linux-mm@kvack.org,
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
	Nhat Pham <nphamcs@gmail.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Yosry Ahmed <yosry.ahmed@linux.dev>,
	Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH] mm/zblock: use vmalloc for page allocations
Message-ID: <20250505140812.GA30814@cmpxchg.org>
References: <20250502080156.1672957-1-vitaly.wool@konsulko.se>
 <fddf0457275576c890d16921465cf473@beldev.am>
 <83CB359A-955E-48B6-B0D9-DD4F2E1146D4@konsulko.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <83CB359A-955E-48B6-B0D9-DD4F2E1146D4@konsulko.se>

On Sat, May 03, 2025 at 08:46:07PM +0200, Vitaly Wool wrote:
> 
> 
> > On May 2, 2025, at 10:07 AM, Igor Belousov <igor.b@beldev.am> wrote:
> > 
> > On 2025-05-02 12:01, Vitaly Wool wrote:
> >> From: Igor Belousov <igor.b@beldev.am>
> >> Use vmalloc for page allocations for zblock blocks to avoid extra
> >> pressure on the memmory subsystem with multiple higher order
> >> allocations.
> >> While at it, introduce a module parameter to opportunistically
> >> allocate pages of lower orders via try_page_alloc() for faster
> >> allocations whenever possible.
> >> Since vmalloc works fine with non-power of 2 numbers of pages,
> >> rewrite the block size tables to use that opportunity.
> >> Signed-off-by: Igor Belousov <igor.b@beldev.am>
> >> Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.se>
> >> ---
> >> Tests run on qemu-arm64 (8 CPUs, 1.5G RAM, 4K pages):
> >> 1. zblock
> >> 43205.38user
> >> 7320.53system
> >> 2:12:04elapsed
> >> zswpin 346127
> >> zswpout 1642438
> >> 2. zsmalloc
> >> 47194.61user
> >> 7978.48system
> >> 2:25:03elapsed
> >> zswpin 448031
> >> zswpout 1810485
> >> So zblock gives a nearly 10% advantage.
> >> Please note that zsmalloc *crashes* on 16K page tests so I couldn't
> >> compare performance in that case.
> > 
> > Right, and it looks like this:
> > 
> > [  762.499278]  bug_handler+0x0/0xa8
> > [  762.499433]  die_kernel_fault+0x1c4/0x36c
> > [  762.499616]  fault_from_pkey+0x0/0x98
> > [  762.499784]  do_translation_fault+0x3c/0x94
> > [  762.499969]  do_mem_abort+0x44/0x94
> > [  762.500140]  el1_abort+0x40/0x64
> > [  762.500306]  el1h_64_sync_handler+0xa4/0x120
> > [  762.500502]  el1h_64_sync+0x6c/0x70
> > [  762.500718]  __pi_memcpy_generic+0x1e4/0x22c (P)
> > [  762.500931]  zs_zpool_obj_write+0x10/0x1c
> > [  762.501117]  zpool_obj_write+0x18/0x24
> > [  762.501305]  zswap_store+0x490/0x7c4
> > [  762.501474]  swap_writepage+0x260/0x448
> > [  762.501654]  pageout+0x148/0x340
> > [  762.501816]  shrink_folio_list+0xa7c/0xf34
> > [  762.502008]  shrink_lruvec+0x6fc/0xbd0
> > [  762.502189]  shrink_node+0x52c/0x960
> > [  762.502359]  balance_pgdat+0x344/0x738
> > [  762.502537]  kswapd+0x210/0x37c
> > [  762.502691]  kthread+0x12c/0x204
> > [  762.502920]  ret_from_fork+0x10/0x20
> 
> In fact we don’t know if zsmalloc is actually supposed to work with
> 16K pages. That’s the question to Sergey and Minchan. If it is
> indeed supposed to handle 16K pages, I would suggest that you
> submitted a full report with reproduction steps and/or provided a
> fix if possible.

I've been using zsmalloc with 16k pages just fine for ~a year,
currently running it on 6.14.2-asahi. This machine sees a lot of
memory pressure, too.

Could this be a more recent regression, maybe in the new obj_write()?
