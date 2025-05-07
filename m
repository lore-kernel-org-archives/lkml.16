Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C7E1DF725
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 08:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746607825; cv=none; b=JjMXeLNQzogzHZKg7+5sSwO5ljkww/7Zq/8vf4xRgoGmmjz5NtKRNN1HWU43dYabQCavZU3sbdTYlqjU3SPGnwd9xCK6M7OCReKmgP3Xn0+wewtBwK7n+qXKSiWfCoFbvTwzhntKjeHG0G10is18WEmjEgiSvdPhfu9pjO03x6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746607825; c=relaxed/simple;
	bh=znBzwJgCxMrjrkS6WgxU2DDxxCKxdfTT2Sk/Vd0O4eE=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HqtvxoNEc8/FDJlz5AVU5J6V1cAXdZf/nJyFhBNR/C+l3pR0r1Sv2Nu/Aj6jtlfQTdA3nWh+veMJSfNfnjGc5NoO7ieN+WpevXAmkGE6IJHvCLO5OWennm4jk2DPlfNTmCm0SHt0VibPk7XiG4um0REwnrX6x4UAgRjyhzUtyw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kHiO7BSG; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kHiO7BSG"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54addb5a139so7612797e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 01:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746607821; x=1747212621; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=szt8zrU5ISU7Wrt9ayx138rlmOzqL4VJTqO1VgP5waA=;
        b=kHiO7BSGbK9P1QO9rN79tT94iuTkL6mEGZ29i4XykVc4W+QeENMlD5Z3WN8Z5J3DpZ
         iF/rJ/eLFI8DPzcn14vQXbbV/5XxdJkBT0IQdEA0YNSTlfn/hNKtk7v4msVr8Gyh41HA
         il2N/kDqk+SCXYT5ajKFMqaN+ngSYqvPepe+1aWoM0L3AsQe0lx4OR3OiM4k2DD9MjQs
         edii0luWHat4G9WY9Thxpb3i96kxG0qqdIL8ffZpEeQfTb4ZG9pmGz2iq0jUyjo0wO4F
         q1esKGhyvWOO7rWUSB4ZP6OXGbOyAP5r+zCBHex0IU7HZcKbK39vnAgS3XYNGdFXXodb
         NiDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746607821; x=1747212621;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=szt8zrU5ISU7Wrt9ayx138rlmOzqL4VJTqO1VgP5waA=;
        b=MFVd2y4acmhMuwRVYVd5xFKTALBoBShrwdOR/6/ObEshcrsvoZI3aDgo8t4CZC5foS
         84WZsiOH6esHvpPoQAH1gZ5uwmiO/CIL2XxjSqFFD7Mm5jV/G3FykZ60JS0FBureTPNW
         ZT9lCG/zV42llC5Wh1HzFFKccXb5WVIDgbk7tUYR2jol9a3wpzd/FZpX2tHCXoLVR3kp
         Evi1KAb3CJkz2RIabNOzssvACr/X7zDfEMlC8A7WWUmhOoJHKZsXgQh/JduYZmFBBVix
         znMl0eOoteagu4JJooEww/CgfZ6BHi3KnkTDY+Q2QBq+szDKFF8+LjYe4ZtSTpm8G2CW
         1A+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXeveqxquVtWHYluHKT/K48rQqDZ88Lpt6/O/CVIIC7sqQ2KF5TH5bxr4vXJ3OgxegLEwcQWH//uoA3bOI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyow/Cn03glAQc3NTtV6jWIsGNDVkEshdQuc2sammqwcmneiFwn
	luW69k2RdqlZNplYydNYL8yvLKZcKOMYqfr2XhNtzngttcfED6D8
X-Gm-Gg: ASbGncsLpPivOvutKmwc2YVjE0PcQ6u5PhaaJnqVwB66eg5cFDncy8Fb2hbvDOUJfIg
	4ojLzrObSkLpEKSgWQ12AHuUpNK5YIsmtUgCHP/ithkVOUy1nka5xP5My8+MXv4gGHMN1wQ7ReM
	AgTWjEPb6kRhkfJ4LxpvQ9ZnR5jODjifP30ibHKJnxjVs7OaYlb7tLSoNJJG+H2/mSfHt6zFt46
	XFr9x48/wY4TnAUJqFThsD/YA31IPmKBazvh9YswhbRN8s6NeTJzOGv6OR0Hcj1cLcv0Pzu+DAJ
	hNmKBJTuvJj6+CJbeNI+S+L4mHMtLqvZAQ5vpiOPEfZSZu9ijKZKWbY37KshvuOauyS1
X-Google-Smtp-Source: AGHT+IFJFUCzqFWs8tp1FtSwkv4ZHIQfleZuq+KgAMoLgVaS2vfIaFRDuhr/+8PW20xw4eiL+ef99A==
X-Received: by 2002:a05:6512:1591:b0:549:4e79:dd5f with SMTP id 2adb3069b0e04-54fb9625c8dmr818555e87.37.1746607821116;
        Wed, 07 May 2025 01:50:21 -0700 (PDT)
Received: from pc636 (host-95-203-26-253.mobileonline.telia.com. [95.203.26.253])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94f6996sm2244706e87.236.2025.05.07.01.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 01:50:20 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Wed, 7 May 2025 10:50:18 +0200
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Yosry Ahmed <yosry.ahmed@linux.dev>,
	Vitaly Wool <vitaly.wool@konsulko.se>, linux-mm@kvack.org,
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
	Nhat Pham <nphamcs@gmail.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Minchan Kim <minchan@kernel.org>, Igor Belousov <igor.b@beldev.am>,
	Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH] mm/zblock: use vmalloc for page allocations
Message-ID: <aBseynlpPBIIvlPY@pc636>
References: <20250502080156.1672957-1-vitaly.wool@konsulko.se>
 <aBoK7f7rtfbPFGap@google.com>
 <m2dmxnhtvxano6lye7lr3saiobn4ygpln55xntlstfo4zwws5g@qpq7aagx3xwq>
 <b42gpp5qsa4j22ai2v4rwwkjhvfbcbf3lcnjoccz7xeidae5c7@ot2ocric3qzs>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b42gpp5qsa4j22ai2v4rwwkjhvfbcbf3lcnjoccz7xeidae5c7@ot2ocric3qzs>

On Wed, May 07, 2025 at 03:08:08PM +0900, Sergey Senozhatsky wrote:
> On (25/05/07 14:57), Sergey Senozhatsky wrote:
> > On (25/05/06 13:13), Yosry Ahmed wrote:
> > > If we can use vmalloc for zblock, then we can probably also use vmalloc
> > > in zsmalloc and get rid of the chaining logic completely. This would
> > > make zsmalloc simpler and closer to zblock in that regard.
> > > 
> > > Sergey, WDYT?
> > 
> > This sounds interesting.  We might get rid of lots of memcpy()
> > in object read/write paths, and so on.  I don't know if 0-order
> > chaining was the only option for zsmalloc, or just happened to
> > be the first one.
> 
> I assume we might have problems with zspage release path.  vfree()
> should break .swap_slot_free_notify, as far as I can see.
> .swap_slot_free_notify is called under swap-cluster spin-lock,
> so if we free the last object in the zspage we cannot immediately
> free that zspage, because vfree() might_sleep().
> 
you can use vfree_atomic(), it can be collected in any atomic but
no in NMI.

--
Uladzislau Rezki
