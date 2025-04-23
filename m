Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7152857C3;
	Wed, 23 Apr 2025 18:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745431256; cv=none; b=JCmxP8OpPHc2xZaqAPzS0PCZb2xq1RsMz3DsYOHugsEZ2+HM1Q4fEgGm7IryBLGcUOs41qgqBx0GMZkGJX+zlJmryVfEZ3ZQ+KbThyl9IMZVeZyKoNCykQb3k1+RRsAtclgXk5xQdGKHPmVZGWkP3kjfgT77xMNpVco1ldcMGs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745431256; c=relaxed/simple;
	bh=ymexwNvJ1/EAinG/zi1NtDKwBKuHLKjeKvgbmvFz2Gc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RTsf5Gtqk6foIlawog0Ls3+0KS11tD+GRnyP1/c6fpCMZ9PRbkyWHQ/8/q8qpEWd2Qc5YjKd3jVXLXe/JsK2Du+KxSOK48GYWMpW/vggliU7eCaSFSBUUD4fTD+gTffp77cDhUokfLe+L+3AlMiA+VwZKabcBpmQkEDDG5NyaYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xez8iLjQ; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xez8iLjQ"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-ae727e87c26so42157a12.0;
        Wed, 23 Apr 2025 11:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745431254; x=1746036054; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MLj0AEIP5k5BWoEmE/2OL2Yiflz2gSexDM70Wk9dzEs=;
        b=Xez8iLjQLRCbPccv0ByMZE2CA6dnIxdEOgxP23TZqpD/eeCZUmaRxwLP7JK4ki3Lkn
         rC169UbGb24E3tNy8r77WxxQgHXh7wkPOrB0UpWldKsT+RNASDvBhS9OYtrWjt3GDj+z
         VDetTKhhoPdKgpyYs7cW1atBloX0nYg3n6QiBld1pO7tL/UXBOQPPqUODCwEebAJ0c0I
         oi8IUKTa74Rs+STb8hfU6bbfTmRFCxG0roxNUCe8Y3wZoMtyODhMgaA87lGAW+H2FC3a
         qptuieEoYs8f+4nbCHb/iujQErHiyP4fKz/itM9xfDtR7SYrNRqEOZy3clHQ9fv1V7Yy
         QMUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745431254; x=1746036054;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MLj0AEIP5k5BWoEmE/2OL2Yiflz2gSexDM70Wk9dzEs=;
        b=lPjDivJub+Z77kOA3Jfs6Cjbu5C3YW3ALAslwLhIElQLxBeGxB59g/O3O1l4gEPCRr
         KopLSo0sGJBO+ssFUtXIZjbylwhmfPBjdLKXU/J6Sdk9gRbPssYGO6bpU9zDxBwejY+N
         JsjITB5BAcwkPUOWBvTmZgAU/xF5NGtnk6D2BeuYsSf8gN3k9B2krueD6yaxBJpeauJj
         wIb+39h4cckcoBGRiJKdHNG4ztW4hWlJKQq/fBMqmv7TCeIhLlqPYMJVeFCGoqjmNO+f
         wFTbIGZi7ApBT6sR2bVYMQNneTSQ8M+lbYFTqXPy6l3apbMhyZjvQTATlxxkdtdzwjAk
         2VhA==
X-Forwarded-Encrypted: i=1; AJvYcCU+ACVdZHttg5IWekOW/dXXh1OE6II63RJzBca800LK/o+guGdiq2GvWYaAfwrXSGGVIkXHznUM76n9z+sj6tY=@vger.kernel.org, AJvYcCUGGMBKNym1iTLxEmKXmVa3n5PhOcckIs5aemzPj8z7lNMmK13InR/qo5e93VAgoTeJ0rR4bcRmEf9tYxQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAO2q0xKawDgRNIpFWeDrjp0X+oRt+DbX3bStFerQh7zTYnmIi
	IhjzdOGtMAPHVLgW7XHADdIRMYU3KAE7ySDMeLT9rp+abmstlzsa
X-Gm-Gg: ASbGncv90o2cjO5hhwVLiO2JFghup8XYpH9PNePRkQnMX7lh3n5qJy8xPRxJv+opwyS
	BiIYMFeo8Gjpru9gITwz+y7/SnSuj+Dxhacw/UuXJ78ldcemDZaPfzeJG5GZUU9twgIP+pJEfpQ
	fACH03JbSjHtrzpTK2foptS+wStZuqySeg3a4ylySU3pJdL4Y4GwJ+9cHUxI8uZeB3PpcyWbrGy
	btt2Ex5ZIWTWY6Wbu7Krn1ZCpuxDsYs4ySElgaqTzEFIerfMELvXy5Nn8VHu1SKEPKhD2j0C0Zf
	RtUh536MWyV9LGVLXiP61J8mVt59wr8wRFI65+Y+
X-Google-Smtp-Source: AGHT+IHne5acboLuvanhFQL98mmgnliemT4z2ybbzLQqONo8VXb37P9fRV4939IghiKNvKqM3y+5Og==
X-Received: by 2002:a17:90b:3c92:b0:2fe:68a5:d84b with SMTP id 98e67ed59e1d1-309ec759774mr113963a91.1.1745431253607;
        Wed, 23 Apr 2025 11:00:53 -0700 (PDT)
Received: from localhost ([216.228.127.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309dfa0d74dsm1959115a91.20.2025.04.23.11.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 11:00:52 -0700 (PDT)
Date: Wed, 23 Apr 2025 14:00:50 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Boqun Feng <boqun.feng@gmail.com>
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
Message-ID: <aAkq0kQl5WFaW0xM@yury>
References: <20250423134344.3888205-2-bqe@google.com>
 <aAkKoQQH0t9KtIxD@yury>
 <CAH5fLggFUM=eJR2u06QsLMxXP+cJwm881ip+rze_sM=tXpA9og@mail.gmail.com>
 <aAkVu8Uf3J8F25fY@Mac.home>
 <aAkfOe5ZDUgIawyU@yury>
 <aAkkngAzL5Roh_3p@yury>
 <680928d5.050a0220.2b8494.c4d2@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <680928d5.050a0220.2b8494.c4d2@mx.google.com>

On Wed, Apr 23, 2025 at 10:52:19AM -0700, Boqun Feng wrote:
> On Wed, Apr 23, 2025 at 01:34:22PM -0400, Yury Norov wrote:
> > On Wed, Apr 23, 2025 at 01:11:24PM -0400, Yury Norov wrote:
> > > On Wed, Apr 23, 2025 at 09:30:51AM -0700, Boqun Feng wrote:
> > > > On Wed, Apr 23, 2025 at 06:19:18PM +0200, Alice Ryhl wrote:
> > > > > On Wed, Apr 23, 2025 at 5:43 PM Yury Norov <yury.norov@gmail.com> wrote:
> > > > > >
> > > > > > I received it twice - with timestamps 1:36 and 1:43. Assuming they are
> > > > > > identical, and ignoring the former.
> > > > > >
> > > > > > On Wed, Apr 23, 2025 at 01:43:32PM +0000, Burak Emir wrote:
> > > > > > > This series adds a Rust bitmap API for porting the approach from
> > > > > > > commit 15d9da3f818c ("binder: use bitmap for faster descriptor lookup")
> > > > > > > to Rust. The functionality in dbitmap.h makes use of bitmap and bitops.
> > > > > > >
> > > > > > > The Rust bitmap API provides a safe abstraction to underlying bitmap
> > > > > > > and bitops operations. For now, only includes method necessary for
> > > > > > > dbitmap.h, more can be added later. We perform bounds checks for
> > > > > > > hardening, violations are programmer errors that result in panics.
> > > > > > >
> > > > > > > We include set_bit_atomic and clear_bit_atomic operations. One has
> > > > > > > to avoid races with non-atomic operations, which is ensure by the
> > > > > > > Rust type system: either callers have shared references &bitmap in
> > > > > > > which case the mutations are atomic operations. Or there is a
> > > > > > > exclusive reference &mut bitmap, in which case there is no concurrent
> > > > > > > access.
> > > > > >
> > > > > > It's not about shared references only. One can take a mutable
> > > > > > reference, and still may have a race:
> > > > > >
> > > > > > CPU1                            CPU2
> > > > > >
> > > > > > take mut ref
> > > > > > bitmap.set() // non-atomic
> > > > > > put mut ref
> > > > > >                                 take mut ref
> > > > > >                                 bitmap.test() // read as 0
> > > > > > data propagated to memory
> > > > > >                                 bitmap.test() // read as 1
> > > > > >
> > > > > > To make this scenario impossible, either put or take mut ref
> > > > > > should imply global cache flush, because bitmap array is not
> > > > > > an internal data for the Bitmap class (only the pointer is).
> > > > > >
> > > > > > I already asked you to point me to the specification that states that
> > > > > > taking mutable reference implies flushing all the caches to the point
> > > > > > of coherency, but you didn't share it. And I doubt that compiler does
> > > > > > it, for the performance considerations.
> > > > > 
> > > > > The flushing of caches and so on *is* implied. It doesn't happen every
> > > > > time you take a mutable reference, but for you to be able to take a
> > > > > mut ref on CPU2 after releasing it on CPU1, there must be a flush
> > > > > somewhere in between.
> > > > > 
> > > > 
> > > > Yeah, and it's not just "flushing of caches", it's making CPU1's memory
> > > > operations on the object pointed by "mut ref" observable to CPU2. If
> > > > CPU1 and CPU2 sync with the a lock, then lock guarantees that, and if
> > > > CPU1 and CPU2 sync with a store-release+load-acquire, the
> > > > RELEASE-ACQUIRE ordering guarantees that as well.
> > > 
> > > Not sure what you mean. Atomic set_bit() and clear() bit are often
> > > implemented in asm, and there's no acquire-release semantic.
> > 
> > Sorry, hit 'send' preliminary.
> > 
> > > > Yeah, and it's not just "flushing of caches", it's making CPU1's memory
> > > > operations on the object pointed by "mut ref" observable to CPU2. If
> > > > CPU1 and CPU2 sync with the a lock, then lock guarantees that, 
> > 
> > The problem here is that the object pointed by the 'mut ref' is the
> > rust class Bitmap. The class itself allocates an array, which is used
> > as an actual storage. The Rust class and C array will likely not share
> > cache lines.
> > 
> > The pointer is returned from a C call bitmap_zalloc(), so I don't
> > think it's possible for Rust compiler to realize that the number
> > stored in Bitmap is a pointer to data of certain size, and that it
> > should be flushed at "mut ref" put... That's why I guessed a global
> > flush.
> > 
> 
> You don't do the flush in the C code either, right? You would rely on
> some existing synchronization between threads to make sure CPU2 observes
> the memory effect of CPU1 (if that's what you want).
> 
> > Yeah, would be great to understand how this all works.
> > 
> > As a side question: in regular C spinlocks, can you point me to the
> > place where the caches get flushed when a lock moves from CPU1 to
> > CPU2? I spent some time looking at the code, but found nothing myself.
> > Or this implemented in a different way?
> 
> Oh I see, the simple answer would be "the fact that cache flushing is
> done is implied", now let's take a simple example:
> 
> 	CPU 1			CPU 2
> 	=====			=====
> 	spin_lock();
> 	x = 1;
> 	spin_unlock();
> 
> 				spin_lock();
> 				r1 = x;		// r1 == 1
> 				spin_unlock();
> 
> that is, if CPU 2 gets the lock later than CPU 1, r1 is guaranteed to be
> 1, right? Now let's open the box, with a trivial spinlock implementation:
> 
> 	CPU 1			CPU 2
> 	=====			=====
> 	spin_lock();
> 	x = 1;
> 	spin_unlock():
> 	  smp_store_release(lock, 0);
> 
> 				spin_lock():
> 				  while (cmpxchg_acquire(lock, 0, 1) != 0) { }
> 				  
> 				r1 = x;		// r1 == 1
> 				spin_unlock();
> 
> now, for CPU2 to acquire the lock, the cmpxchg_acquire() has to succeed,
> that means a few things:
> 
> 1. 	CPU2 observes the lock value to be 0, i.e CPU2 observes the
> 	store of CPU1 on the lock.
> 
> 2.	Since the smp_store_release() on CPU1, and the cmpxchg_acquire()
> 	on CPU2, it's guaranteed that CPU2 has observed the memory
> 	effect before the smp_store_release() on CPU1. And this is the
> 	"implied" part. In the real hardware cache protocal, what the
> 	smp_store_release() does is basically "flush/invalidate the
> 	cache and issue the store", therefore since CPU2 observes the
> 	store part of the smp_store_release(), it's implied that the
> 	cache flush/invalidate is observed by CPU2 already. Of course
> 	the actual hardware cache protocal is more complicated, but this
> 	is the gist of it.
> 
> Based on 1 & 2, normally a programer won't need to reason about where
> the cache flush is actually issued, but rather the synchronization built
> vi the shared variables (in this case, it's the "lock").
> 
> Hope this could help.

Yeah, that helped a lot. Thank you!

So, if this Rust mutable reference is implemented similarly to a
regular spinlock, I've no more questions.

Thanks again for the explanation.
