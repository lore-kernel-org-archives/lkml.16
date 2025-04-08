Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03ECA1A9B32
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 19:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744142142; cv=none; b=eaadvnhR87UoTn4dnbPPnMdlHx1UIJ6eRrUqrpVTUdOvKYh7I1/P0B7nnmiuNXzC5lytQrR9ZOMbljCnSzQWOwiRhEM661busMBqKB2bcHrWINANxMduHz9ddaYdEYJLOVqGx/Yc+MW5XgtHPoEGQ2e4+g5sdsIu7vcSfhU4SWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744142142; c=relaxed/simple;
	bh=Ep7SBzyi87s2EY9PMHTzt9VEUHp3qzNZnRx75O3khwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KVN9al3W43YK+IqJwpzrEtH+zKnGng0Mk+HXeNvUje5E2g0i84MVoXnKFd8yJiwJwaaFs6OKv5DCXOfa7qrFCZeNnCKou41HcxgzYBeE04oNA4Bsl1o6/qCZfNXzYcFUsInoX4Hhb7Gj33QalfI2mRF9zb+62sXyt5XFJoGmr0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=j3m1zxoG; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="j3m1zxoG"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6e8f43c1fa0so72017146d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 12:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1744142138; x=1744746938; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AjMXD7eMjhWYUiwH80i0DmUWomvU04d23CxkIBTomHk=;
        b=j3m1zxoGYThqPjc67LrppmRtZrGX/Ld83bF0dh8GROW4//wOiCclM355KaGsX0imJG
         4VDA+yVzmdmV56cNLqkJlqAfsFOOlXdBgxOOG81zMyj2iFh4iojiyregVsAxm9Wiu9Wi
         3Y75HIi7HlypDXEzpJMLAJBUBtnlGNn5jjDV++H7fYggSs4Uh+qo5eiR+A0ShGxq6don
         yBVhdMvV7T4oZIviWTgalQoEtLV6HWJW0POyFcgAFz6jdXB2D1MmumSvrGoQqBbgmWD3
         IAP6JOkn05YpXCL/Pxth02ZBz+oYbFlciInkFbvMeznz4uofkstLoBG11r47as8ab9n8
         PKHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744142138; x=1744746938;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AjMXD7eMjhWYUiwH80i0DmUWomvU04d23CxkIBTomHk=;
        b=o5xkAhP+kLv7+ILPHA3T9f4evX0PnkNz95Y+jQABEVyUERv+rtc088sNQ+kiUtSWAY
         rM8txzylab9s7bVQibwOW4Nh7Z13aMvgeQY+xaAlaw14YpbtmOhGlEFrzCZ26aglCsvT
         CnCbab4HB/qjPuT3pn3uBPhkbLgBdr076WUlbCMjMgqdu6TI7Ttck+pX5lKiMV7LQfIi
         9/Np4VoSdbpKRombbh1MNNHkpc208b4lzlKQ4ZwBeAFQ18dgzBScgeOVmCNybV01ySyc
         9xpEXoNrYj5u4Rz8TK3ixUNRj9DZhpoWmsICBV7UM+6xS8dCHXbmW1Fi1omGZhIQh8oB
         dfTA==
X-Forwarded-Encrypted: i=1; AJvYcCXQDYOTz9TZShKLF8At4pL8+D6tXKO7Rex7VqL7BNBWGoUsZvjjSmPH61P6zmxuFiMq7XeudwwN0/qAEtA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvS772/d5hU1qNVtY+thB3NdJXRntp1ay1OqtFNoAYZmG4E6vt
	C8bgIxTM+UW2oBl+F/s20fkoJqIVlEYk/6sj0PlwMaKAyH3m7hwX2dEl1i7KvIY=
X-Gm-Gg: ASbGncuFz3daZxqDLdXnEIuSGTqBfVde7Jj18uutcykG4CWZFci4Wm0cUR2FAFVFWhp
	4sJrD2oqXykcrvATbcuabtLCHnM6pIQAfRD58FnlW9RUDrAZhu9lx7OpSuVQd4KDza+RqZMLwWK
	u7hhHsDlEI9lLNOtkR4VB4p8NF5v+K1bBc20ZgrgLOjGFowojrfHhQVrt2cECAxewIhTgYmCJrx
	6UUbbnYQPEoM+4mIR9R5lGkcmohMqySCtPuRaeeBfM7CvZgfEVQq+pvTroLe5iI0AHf5wnwImmK
	T0RcmVG08dSZK81oVd1s6CFVQYJGZlh6LOcUBQAL8ak=
X-Google-Smtp-Source: AGHT+IFXT6XjTsrwFY6nkkzwYOcWwoMzRGktgFlUchpbN+1L1qo0bP6hwFz8NH9p84XFI0PIdBp3EA==
X-Received: by 2002:a05:6214:2404:b0:6d8:99cf:d2e3 with SMTP id 6a1803df08f44-6f0dbbb1c3fmr8925006d6.22.1744142137740;
        Tue, 08 Apr 2025 12:55:37 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6ef0f137942sm77808716d6.83.2025.04.08.12.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 12:55:37 -0700 (PDT)
Date: Tue, 8 Apr 2025 15:55:33 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Igor Belousov <igor.b@beldev.am>
Cc: Nhat Pham <nphamcs@gmail.com>, vitaly.wool@konsulko.se,
	linux-mm@kvack.org, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org, Shakeel Butt <shakeel.butt@linux.dev>,
	Yosry Ahmed <yosryahmed@google.com>
Subject: Re: [PATCH v2] mm: add zblock allocator
Message-ID: <20250408195533.GA99052@cmpxchg.org>
References: <1743810988579.7.125720@webmail-backend-production-7b88b644bb-5mmj8>
 <0dbbbe9d17ed489d4a7dbe12026fc6fd@beldev.am>
 <f8063d3fa7e148fecdda82e40b36e10a@beldev.am>
 <CAKEwX=NMjfC1bKTVsB+C7eq3y=O0x3v8MW7KxUfhpg6UUr23rw@mail.gmail.com>
 <f023ba8341f9b44610cc4ac00cf0ee33@beldev.am>
 <CAKEwX=MXD9EB242WkB50ZBmZgV-CwrAHp=_oE+e=7yHDfrMHtg@mail.gmail.com>
 <3f013184c80e254585b56c5f16b7e778@beldev.am>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3f013184c80e254585b56c5f16b7e778@beldev.am>

On Tue, Apr 08, 2025 at 01:20:11PM +0400, Igor Belousov wrote:
> >> >> Now what's funny is that when I tried to compare how 32 threaded build
> >> >> would behave on a 8-core VM I couldn't do it because it OOMs with
> >> >> zsmalloc as zswap backend. With zblock it doesn't, though, and the
> >> >> results are:
> >> >> real    12m14.012s
> >> >> user    39m37.777s
> >> >> sys     14m6.923s
> >> >> Zswap:            440148 kB
> >> >> Zswapped:         924452 kB
> >> >> zswpin 594812
> >> >> zswpout 2802454
> >> >> zswpwb 10878
> >>
> >> It's LZ4 for all the test runs.
> > 
> > Can you try zstd and let me know how it goes :)
> 
> Sure. zstd/8 cores/make -j32:
> 
> zsmalloc:
> real	7m36.413s
> user	38m0.481s
> sys	7m19.108s
> Zswap:            211028 kB
> Zswapped:         925904 kB
> zswpin 397851
> zswpout 1625707
> zswpwb 5126
> 
> zblock:
> real	7m55.009s
> user	39m23.147s
> sys	7m44.004s
> Zswap:            253068 kB
> Zswapped:         919956 kB
> zswpin 456843
> zswpout 2058963
> zswpwb 3921

So zstd results in nearly double the compression ratio, which in turn
cuts total execution time *almost in half*.

The numbers speak for themselves. Compression efficiency >>> allocator
speed, because compression efficiency ultimately drives the continuous
*rate* at which allocations need to occur. You're trying to optimize a
constant coefficient at the expense of a higher-order one, which is a
losing proposition.

This is a general NAK from me on any new allocators that cannot match
or outdo zsmalloc storage density in common scenarios. I'm sorry, but
I really don't see any reason to do this.

We also should probably make zstd the zswap default.
