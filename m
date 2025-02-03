Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CD41FFC69
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 12:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738586362; cv=none; b=C1i5wXzToUeQ3AilsAZx3epBlO0YMAbaxKpcAgcVJxNgXr7P8GKvHF7U95tOeR9st9u3y3C1rM78PPizLJPlwD52K+N1OgwkEOgU8wwXXB9Mw2aS0ygwAZ68H404fdYtYhZ1z7djRDMM1DEPW9yjZzAF53bJXSSvWALJb7Uw8lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738586362; c=relaxed/simple;
	bh=o197KETjepOGO3iN2zV5uVyNhPkDVMPbLP/GtaKNsB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AU1AGzldNAilxfdGAEjSdI7XGxFLqk+lZQx4U8qNh19k4eE6zIeUY5kWYNC2r6A/23k1fzrAr7Gc8cocirZr4zgxs35O+zckFkm8+8Oz0irDI/bCWtkATnclsW4/+EIvmJN/QkL1ganJ1gY04h/yT/CPbLe3Fc3yqUTVveZ/nfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CkRBIpF1; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CkRBIpF1"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2164b662090so83483815ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 04:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738586360; x=1739191160; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2k+Kz5fKQVWiXS0aik+0OS30foF5H1QAZ5rCJu/Bzeo=;
        b=CkRBIpF1hTqRRSEfvC5wJ7WcLa4bNHceez3AVEOpOyM3+9GuTSK2otFFtfsiC2mnO6
         4mppMBaH+rhLDMucSnJvgGVdZlYKclhkZtsllmJZHpCjRJS7JT7HZuoDq6JmjwwOBPpW
         YUyKa5OB30RF0ZBwCtlOyuD80yhfiil3+OqVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738586360; x=1739191160;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2k+Kz5fKQVWiXS0aik+0OS30foF5H1QAZ5rCJu/Bzeo=;
        b=TrFe1/cQ8AawdLPHKb+GLq5kh361mFaHElLFHH6Mrmgg/QT6/J1YoIRwGTrqVvvwCW
         /dH2HhiGbziMWn8YMpfQMDoBofOsj8wHCoM2BsPNRkLaSiIh6KI+lpJwZV/IPevAxvpI
         OqEVRKs6fXhtSgaMfprKl8YaJ148WIotGOaJVwAYpR4FJFaCh2lvIXWqhXgflgUS2FXD
         3M4uGmTNBfWRdrfA2lC1RslkhziAGlciO+dhyOSt5+jdazuDJc4SHiNIWcuwJetTwLMe
         QcTHh5KKREhLlXJWAJXiV77lEhCgzruCfcakRAVd96a+/oe+3+USMrQ128pmM22z8JFJ
         Jv8w==
X-Forwarded-Encrypted: i=1; AJvYcCWi7NiGzvQ6/FxNviRxV79gYh2qFqCnAAiqO14ceMbskaTS7m7fIDo27L+76UtGWPsszki5ZnHI8b4d8x0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwH+qD6hYjAByEGM98/PQlO6MHetiaONxnEsFUhcLs/tFaQU827
	qIHtX+s5eCIDGNWxMGPgXqIc0fmD7dAmt/9p2NAoV8TVb/R/GHfWGSss7LiSiw==
X-Gm-Gg: ASbGnctrH1sOQ+BenYkn9dg34ZZyLI1GgWhyTzA7+tebzyzEJdZxFgXmR+xlhTI+3nO
	DjwvWCU7COR8S5FJX82YYpQA/cDeUl0+BJjmXZ4KCy1FuxmMugWYLK5VqcyMX6O3FNjbXbUaEeO
	a1qowVsvWR4iD4d299wnsqLbGpmor6LNjGmXZ2q0QqafgK5f9ElsYGSSjOSUOkVprPraTQgoazA
	TqJ9TO5V0XE1hftRJAaO4L5EEjp5l1+ONlu35L7Ws/TuYnPe+FmgT4xv+DxZMFZkQ2PgYYM0HHS
	2Ec/YEs2sHdT24gCs6g=
X-Google-Smtp-Source: AGHT+IH53BmAw8JAIQ38k4OdngRGhoWr4a8BEzvXCGZCeBs0F891N/md7nrjKD8eIErTXuc4y0bTng==
X-Received: by 2002:a05:6a00:2183:b0:725:c8ea:b320 with SMTP id d2e1a72fcca58-72fd0c04c45mr27134735b3a.14.1738586359958;
        Mon, 03 Feb 2025 04:39:19 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:b77f:f2de:f99c:2d0e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69ba468sm8234757b3a.117.2025.02.03.04.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:39:19 -0800 (PST)
Date: Mon, 3 Feb 2025 21:39:14 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Hillf Danton <hdanton@sina.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCHv4 01/17] zram: switch to non-atomic entry locking
Message-ID: <kyqwtxgltcphcbpenzzyyhfqvmue62rjpluvj3y26fecgyv3h6@z5fgbemyk237>
References: <20250131090658.3386285-1-senozhatsky@chromium.org>
 <20250131114141.1870-1-hdanton@sina.com>
 <ckfp5umjjqr3vmfxwfvih4whptp2b6my6bpmji22t3um6ah23p@6cmjt5ah5zbb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ckfp5umjjqr3vmfxwfvih4whptp2b6my6bpmji22t3um6ah23p@6cmjt5ah5zbb>

On (25/02/03 12:21), Sergey Senozhatsky wrote:
> On (25/01/31 19:41), Hillf Danton wrote:
> > On Fri, 31 Jan 2025 18:06:00 +0900 Sergey Senozhatsky
> > > Concurrent modifications of meta table entries is now handled
> > > by per-entry spin-lock.  This has a number of shortcomings.
> > > 
> > > First, this imposes atomic requirements on compression backends.
> > > zram can call both zcomp_compress() and zcomp_decompress() under
> > > entry spin-lock, which implies that we can use only compression
> > > algorithms that don't schedule/sleep/wait during compression and
> > > decompression.  This, for instance, makes it impossible to use
> > > some of the ASYNC compression algorithms (H/W compression, etc.)
> > > implementations.
> > > 
> > > Second, this can potentially trigger watchdogs.  For example,
> > > entry re-compression with secondary algorithms is performed
> > > under entry spin-lock.  Given that we chain secondary
> > > compression algorithms and that some of them can be configured
> > > for best compression ratio (and worst compression speed) zram
> > > can stay under spin-lock for quite some time.
> > > 
> > > Do not use per-entry spin-locks and instead convert it to an
> > > atomic_t variable which open codes reader-writer type of lock.
> > > This permits preemption from slot_lock section, also reduces
> > > the sizeof() zram entry when lockdep is enabled.
> > > 
> > Nope, the price of cut in size will be paid by extra hours in debugging,
> > given nothing is free.
> 
> This has been a bit-spin-lock basically forever, until late last
> year when it was switched to a spinlock, for reasons unrelated
> to debugging (as far as I understand it).  See 9518e5bfaae19 (zram:
> Replace bit spinlocks with a spinlock_t).

Just want to clarify a little:

That "also reduces sizeof()" thing was added last minute (I think before
sending v4 out) and it was not an intention of this patch.  I just recalled
that sizeof() zram entry under lockdep was brought by linux-rt folks when
they discussed the patch that converter zram entry bit-spinlock into a
spinlock, and then I just put that line.

> > > -static void zram_slot_unlock(struct zram *zram, u32 index)
> > > +static void zram_slot_read_unlock(struct zram *zram, u32 index)
> > >  {
> > > -	spin_unlock(&zram->table[index].lock);
> > > +	atomic_dec(&zram->table[index].lock);
> > >  }
> > >  
> > Given no boundaries of locking section marked in addition to lockdep, 
> > this is another usual case of inventing lock in 2025.
> 
> So zram entry has been memory-saving driver, pretty much always, and not
> debug-ability driver, I'm afraid.

Before zram per-entry bit-spinlock there was a zram table rwlock, that
protected all zram meta table entries.  And before that there was a
per-zram device rwsem that synchronized all operation and protected
the entire zram meta table, so zram was fully preemptible back then.
Kind of interesting, that's what I want it to be now again.
