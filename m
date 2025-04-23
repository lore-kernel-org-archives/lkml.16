Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D67E1F237A;
	Wed, 23 Apr 2025 19:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745437513; cv=none; b=N4i1Hv12ATo+rUn1deE/otWBQX5wfC973Y/gU8SSFJF+2A881xt8wQ0xkRb5W+3n0eOtrqgYSS0NwxQllCLHKFfcLCXmzxnGZ7vk2yI0VZ6uEfJwS7AIMnb3yq/lGRWZgbCf2gOPRi2UkpZQtapBoMkhBy8PwGDRdfQtRpwkwQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745437513; c=relaxed/simple;
	bh=H+Lq2Mx/SRv0QfkvdAxWWlLC7jcGfMMedrAflwEIFS4=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MggQmfvp+4VFiZXTkJ4NUUcuovoze4j3U+UBc5glxux+xJfZhrF+/1InIGsLSYWps1bO0WqRDn1EtBa90IOMS3cSMAiFe4Z7vX3ocMQEakgX5YyN/u/gb3rhNEKOEAQIcWVIpr+1ewUqjjE0AflipM5BzdrHLVZLo2hbhlUk+jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TrPjQT2l; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TrPjQT2l"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6ecfc7ed0c1so2433306d6.3;
        Wed, 23 Apr 2025 12:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745437510; x=1746042310; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:feedback-id:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pN3niEIDfhc6lyRRmNO3dTWouiVBYHh9JaQcbDzND8Q=;
        b=TrPjQT2lfLo7x1Sm2nAnzYjEhnkykKqAQBCnonKAU4p8P7RmqWIrk6RLA/owX8TvQ+
         XtKcmKj5DT3/ipzvcTHkeX5gLq4bzuLNP8NHvx2PYdx5RzimCJUXqh7te+VP36NMh4KX
         0GoPJf4DD+5dWCpjw2b/lf0mskYackPf/4GhGnD+e2I6vsDUnPvT+a1p38L0R80MvWKo
         h6Z/UIEdrCMyBkgTOcGzoXVa1xAtzZAX+oak+3jxZ4p1fLZngzU9Bm+VPIgZkzJQEORK
         MVUEDwLceOAi0RmhsikM4xYYxPoWGv1mZFwauCVSjnyJ4JOfWetATZgkV6TFvb/jW6Us
         3x7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745437510; x=1746042310;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:feedback-id:message-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pN3niEIDfhc6lyRRmNO3dTWouiVBYHh9JaQcbDzND8Q=;
        b=TbMnfonAWhZZzcWZ+usLtUlfNvUyb+BPF+x/iHCVgYWB7AEvtjx3WArW6pUEPyzjx9
         k+bWYVfV99mHQ0h5VlCeOIt+u1V96vEXVtFpoQojz8+ulh3ghCyFFkwkZRNNkBogtQgE
         v5nhEddJySO3ffgeRTZO8C0fOHm+9xUoyISMU2VE/5q7MDpi+IM7iVcrpPd8UJ5gIh21
         gX6iCm2Njtw0vcdyztaTsltOjR88wZHL95MM+JPbg0O+y+p8ayC8UK7w/xckKXTqn0bL
         HGbI9mRBGWGoEM8Q04SqiXQIfxPi7YuZG7jM0+gHDs/yQb0bLeJ4YK2t2hE5XJouCF4m
         CMeA==
X-Forwarded-Encrypted: i=1; AJvYcCUlpAu/BwlW0RTqqq8g3SLJxgXAS2xhqadPNAmZApfFbXByMFukbI0yn479KaiTIYG8T1L3DNrw+PL85Xg=@vger.kernel.org, AJvYcCVPtQbTrXENAq+9bzafGIiZgd9oiW/RyFeRFxKifeOYeGxxqLNgqqkUxCBQuQAze5MCxfN02btoZSWj37TcHQ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVTrGOUJ/ACMH2ugz8qAuQiAaMKxxKBm6w5PCCe2IURLXQaadq
	810LGz2ScSA0dW0TXAU+H5J8w7qxR1RIlA0AKyuOlrvumwE5aNdact9Weg==
X-Gm-Gg: ASbGncsubEQAmHXiv9JKPWLe+PVUaAEc+xPWamh+EBT0IgOhIi7E0TMf/wBBon7MsS2
	FowjcmHGrMyu4sTZ2Zb0Mn0FmtlpW32txHmBOXFjHvIxsemHM7Xst1ASN0LzJ2cyKYo+odfHo0z
	nywLx37tkBueyjulLhouU6DvHD09XY0hk6sVfyQInflwXtuA2I8YnF7i0u6+Esx5R8P7fUk4yms
	w9Zdiiv3op8BNka48Zpt8fHrBBmS3yoYde3qm5iqCCjfMow8a5IzkpXUhOLev9EA2uvLD66VKHC
	MW/qRwV6/WpG7ovkOylr1Ft1bKMVsOTN5wbhsPwG5x7IEkXn1EWasiSKexTWARoI4PZLg5hwc0s
	CEQsA9RkhNqBKsrCzj3jrnZgCueW2CQUL0V9DvwgGPQ==
X-Google-Smtp-Source: AGHT+IFdZBtKLoubWQwYRLCComZ9+Mo07NO/mxJZRXdBoZ71t7nZ49m4gj1t8iCXtDW28XTo8npWUw==
X-Received: by 2002:a05:6214:260e:b0:6ed:cea:f636 with SMTP id 6a1803df08f44-6f4bfc26fa2mr60036d6.26.1745437510230;
        Wed, 23 Apr 2025 12:45:10 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2b0f499sm74207336d6.38.2025.04.23.12.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 12:45:09 -0700 (PDT)
Message-ID: <68094345.d40a0220.1c7d6a.d84e@mx.google.com>
X-Google-Original-Message-ID: <aAlDQ-HFSCFuanTo@winterfell.>
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfauth.phl.internal (Postfix) with ESMTP id 3C0691200066;
	Wed, 23 Apr 2025 15:45:09 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Wed, 23 Apr 2025 15:45:09 -0400
X-ME-Sender: <xms:RUMJaLopnWZeMfrhIYa6zka45BPI9foBJCZg3MD-G4p2ZjPZy1loDQ>
    <xme:RUMJaFr81e8rr3IOFYB0XnM6NV4webbv7ouxfYNBE1zAKRtAn953RT_dr31GKK6vl
    i2kRKcs6wORbNh6lw>
X-ME-Received: <xmr:RUMJaIOmLQUoQt1E8g9pkIm-eSjcpzy0rsS2B8JUDaledU4RvUeMyecJVxkOEQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeejgeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    vdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpeehudfgudffffetuedtvdehueevledvhfel
    leeivedtgeeuhfegueevieduffeivdenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgr
    lhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppe
    hgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepudehpdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopeihuhhrhidrnhhorhhovhesghhmrghilh
    drtghomhdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgt
    phhtthhopegsqhgvsehgohhoghhlvgdrtghomhdprhgtphhtthhopehlihhnuhigsehrrg
    hsmhhushhvihhllhgvmhhovghsrdgukhdprhgtphhtthhopehvihhrvghshhdrkhhumhgr
    rheslhhinhgrrhhordhorhhgpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtphht
    thhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegpgh
    hhsehprhhothhonhhmrghilhdrtghomh
X-ME-Proxy: <xmx:RUMJaO4DsZfw4LNgtJcZaMy-4DOxTb9n_qmYjJMmO6LW76k07-p_mQ>
    <xmx:RUMJaK5Ekt9a7c3redyVx1UfKvkXQa-O9Hz8RQbF7t9NbVN9w6Hh3A>
    <xmx:RUMJaGguSlCWnQenAfophgalEj0jq4eJKbB-VlV1czLtPBv46_hSBQ>
    <xmx:RUMJaM7DxD_feLBcmkis0OualapoxVygWYQLF8poQIFS7DKq-2GYWg>
    <xmx:RUMJaJI_Sx104XKlwePnEbnUqIFCwFwSrKoYfR3VBnju2S4vX3AMrRo3>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Apr 2025 15:45:08 -0400 (EDT)
Date: Wed, 23 Apr 2025 12:45:07 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Burak Emir <bqe@google.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/5] rust: adds Bitmap API, ID pool and bindings
References: <20250423134344.3888205-2-bqe@google.com>
 <aAkKoQQH0t9KtIxD@yury>
 <CAH5fLggFUM=eJR2u06QsLMxXP+cJwm881ip+rze_sM=tXpA9og@mail.gmail.com>
 <aAkVu8Uf3J8F25fY@Mac.home>
 <aAkfOe5ZDUgIawyU@yury>
 <aAkkngAzL5Roh_3p@yury>
 <680928d5.050a0220.2b8494.c4d2@mx.google.com>
 <aAkq0kQl5WFaW0xM@yury>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAkq0kQl5WFaW0xM@yury>

On Wed, Apr 23, 2025 at 02:00:50PM -0400, Yury Norov wrote:
[...]
> > > > > Yeah, and it's not just "flushing of caches", it's making CPU1's memory
> > > > > operations on the object pointed by "mut ref" observable to CPU2. If
> > > > > CPU1 and CPU2 sync with the a lock, then lock guarantees that, 
> > > 
> > > The problem here is that the object pointed by the 'mut ref' is the
> > > rust class Bitmap. The class itself allocates an array, which is used
> > > as an actual storage. The Rust class and C array will likely not share
> > > cache lines.
> > > 
> > > The pointer is returned from a C call bitmap_zalloc(), so I don't
> > > think it's possible for Rust compiler to realize that the number
> > > stored in Bitmap is a pointer to data of certain size, and that it
> > > should be flushed at "mut ref" put... That's why I guessed a global
> > > flush.
> > > 
> > 
> > You don't do the flush in the C code either, right? You would rely on
> > some existing synchronization between threads to make sure CPU2 observes
> > the memory effect of CPU1 (if that's what you want).
> > 
> > > Yeah, would be great to understand how this all works.
> > > 
> > > As a side question: in regular C spinlocks, can you point me to the
> > > place where the caches get flushed when a lock moves from CPU1 to
> > > CPU2? I spent some time looking at the code, but found nothing myself.
> > > Or this implemented in a different way?
> > 
> > Oh I see, the simple answer would be "the fact that cache flushing is
> > done is implied", now let's take a simple example:
> > 
> > 	CPU 1			CPU 2
> > 	=====			=====
> > 	spin_lock();
> > 	x = 1;
> > 	spin_unlock();
> > 
> > 				spin_lock();
> > 				r1 = x;		// r1 == 1
> > 				spin_unlock();
> > 
> > that is, if CPU 2 gets the lock later than CPU 1, r1 is guaranteed to be
> > 1, right? Now let's open the box, with a trivial spinlock implementation:
> > 
> > 	CPU 1			CPU 2
> > 	=====			=====
> > 	spin_lock();
> > 	x = 1;
> > 	spin_unlock():
> > 	  smp_store_release(lock, 0);
> > 
> > 				spin_lock():
> > 				  while (cmpxchg_acquire(lock, 0, 1) != 0) { }
> > 				  
> > 				r1 = x;		// r1 == 1
> > 				spin_unlock();
> > 
> > now, for CPU2 to acquire the lock, the cmpxchg_acquire() has to succeed,
> > that means a few things:
> > 
> > 1. 	CPU2 observes the lock value to be 0, i.e CPU2 observes the
> > 	store of CPU1 on the lock.
> > 
> > 2.	Since the smp_store_release() on CPU1, and the cmpxchg_acquire()
> > 	on CPU2, it's guaranteed that CPU2 has observed the memory
> > 	effect before the smp_store_release() on CPU1. And this is the
> > 	"implied" part. In the real hardware cache protocal, what the
> > 	smp_store_release() does is basically "flush/invalidate the
> > 	cache and issue the store", therefore since CPU2 observes the
> > 	store part of the smp_store_release(), it's implied that the
> > 	cache flush/invalidate is observed by CPU2 already. Of course
> > 	the actual hardware cache protocal is more complicated, but this
> > 	is the gist of it.
> > 
> > Based on 1 & 2, normally a programer won't need to reason about where
> > the cache flush is actually issued, but rather the synchronization built
> > vi the shared variables (in this case, it's the "lock").
> > 
> > Hope this could help.
> 
> Yeah, that helped a lot. Thank you!
> 
> So, if this Rust mutable reference is implemented similarly to a
> regular spinlock, I've no more questions.
> 

Just to be clear, a mutable reference in Rust is just a pointer (with
special compiler treatment for checking and optimzation), so mutable
reference is not "implemented similarly to a regular spinlock", it's
rather that: if you have a shared data, and you want to get a mutable
reference, you will have to use some synchronization, and maybe 90% case
that's a lock.

So here, what Burak did in Bitmap was defining those non-atomic
functions as requiring mutable references, and if we also get the Sync
and Send part, right. A real user would 90% use a lock to access a
mutable reference to `Bitmap`.

Makes sense?

Regards,
Boqun

> Thanks again for the explanation.
