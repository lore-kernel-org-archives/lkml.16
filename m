Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187B027A12D;
	Wed, 23 Apr 2025 17:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745430744; cv=none; b=OPivnuNWbcUsi2Uxe5bfylUYXXFNvJ3nkfqRDtFWgmbp30/JRhsX8OpKrL8n+BwzJiHgpSmFTM0KKDQiqjAMPmbXsjgh/LSDRxJIFnbLwOw3N2F46DItgIbEAVVayxX1ZFVGu/toYaSrPoIQ8Te9MGRWIwXKIQBRxG8sBDVQftk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745430744; c=relaxed/simple;
	bh=xbll+9ikj2n6Nx3upiow4uZFZ5p/VmN7j6Z8js8Wgt4=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qOLwVyEdmdD9frr6/YYfi5zIM1KtBf+PF+Xh1/CwtuOjTxn/6fy3Xf2AjV6lqEt07FjCBPmEgw/bDWooyCjV9v36jDpUV5hP4/w8poX7XxJlW49EtKBgNvF2o1izmeD1TsjNNL3mZVMG+RRPdDBLfqoACcRKovXPmt7OP8CAeXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=REOlSjtm; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="REOlSjtm"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7c59e7039eeso12491085a.2;
        Wed, 23 Apr 2025 10:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745430742; x=1746035542; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:feedback-id
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TV85JPDdHEvRPgffuJlIv/4wMZd4CBgWNookmXPkIpU=;
        b=REOlSjtmT36Th6/7puIzReIgY4ra4i7/kCiP6jhkdEggyDT/GS957ZRqT+A93LL7CT
         m2ma//k4FpZHhfVK9ugSNWYI3YrDEjS6no2QLvrhN2h358DewVf5U7iMkrDl5eNMhQX8
         vEJyhD6OnL712Up789cYP8M1ClXoa2tYpzTHyNwu6mlL5qu+/l2vwzgNzM+25ex032pB
         pmnUR+6qcmfDePkEjbCKwjw3dnIC/jPz0f7Gv/KGhpFN11as5/H6cY13hg/J6SQrz1TD
         30XksmHDDoFRr1hDekY/rulEd1NitHtDYeIYCc4TaUfEyzoGnpJ+K3s/zz0wYWsIQaqm
         hr+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745430742; x=1746035542;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:feedback-id
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TV85JPDdHEvRPgffuJlIv/4wMZd4CBgWNookmXPkIpU=;
        b=beUoGMQbYJGQZvd9f2QH2TtSX+MiTaq35fyvxh2hDcPVqOaVnJWGrV7WhfSAoBEHfy
         6qWOaiOcgnFUHXdlEwcWDpq+bCMjIs/WM7XoCoW09/QUhnyRvfwdhRSVjqh3vfDPeXqK
         PBOyRrBp3w68vrzGYo+sz2vSD030SWEmZ/zhs+YARtiFjndHCoA6fiPm6I60IDzAFeGf
         YlCnKeB0/qAy1xLWwuaSfXN/GGe0DvaY04a5uXh+a4sRYC2vmxTc680Rv7mNIJws/+Hl
         xBfnNDCVH+mFyvEv2s2OFAuP2rREKbXquq41D7r6WPaWvDMWyXjj+Fr6+gEXJVRRARy2
         WYYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKl8t2PAqcIuT7xGdJkv1e/pxKaSxSvsVGlYM+S/ZMfW+Js45j7xw02Udb4TahabW3Xb+uLXdfCMjgvDU=@vger.kernel.org, AJvYcCV8JJp7Z44aFNtIBGDq6YA5XAAkJxXDJrEJOZiwCvtEyS0Ip/j8fpSDB4FuC5DAa27hdbw1hw6N4dFTvYsWef8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb0eG7ZvGBWUkkj8/yCKJPvfyrLMH6g+M6QkZXp/nM3NYEy8tv
	CjmyICcjwSOIe/5jy/5WUzJ8VapQqpjEIEpAbuZnzb50WRj8Iw4p
X-Gm-Gg: ASbGnculS5AXVGxh8FnPcLGAwvIBQSxNwxhrQnfBZz9vKl7738ngzvTcoIzufoGK9+i
	0yihHtilrkrmgpHa7Bw7uSU5qCLCr6f9YcHiLnmF2/7FEr5Eis6gVuhD5E1qDFM8n9berqOYt6X
	JZLPM0kUYhnZ3QHG69oVAWyBfCELNN9/fJdGlX0scSfz7V/3ZYG4QCTH2r0tZQRraKGAe6eCJ3p
	Qd5UfBoi0ZirOvXgGa4F1OE8HtMidcafzRwrUcxObhfjB57TpwTy3X7z8U26Mg2xWV7zZ0YmAcx
	cDe0pJoQMg/chudr5+iHTvLyjP2gDg63BdKKyoB2Jj8YqqG74iDuqceRNiLc6lvAXMtxJxUig8+
	UeQR+EAzIgJRrZ9O8pRQsqDHXUuxT6Wg=
X-Google-Smtp-Source: AGHT+IEsReRCqCS3ZkNpXOVq54x+3dmltUu98rE5NXKfHKX8ub+u6Wh2IJ5JREYn3pT56+lWBSNN8Q==
X-Received: by 2002:a05:620a:4721:b0:7c5:6dc7:7e7c with SMTP id af79cd13be357-7c927fb19d9mr3402336785a.26.1745430741627;
        Wed, 23 Apr 2025 10:52:21 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925b4dd48sm706882685a.89.2025.04.23.10.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 10:52:21 -0700 (PDT)
Message-ID: <680928d5.050a0220.2b8494.c4d2@mx.google.com>
X-Google-Original-Message-ID: <aAko03K-TyGLMcsq@winterfell.>
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id CAF241200043;
	Wed, 23 Apr 2025 13:52:20 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Wed, 23 Apr 2025 13:52:20 -0400
X-ME-Sender: <xms:1CgJaN_F9Gj-p_fbMObCk7rDkByxIxahrq4d8MQvVZovIMvEGBNR3g>
    <xme:1CgJaBu2iK2uoKxD86GPMEc43H8UMRy1ypvpcSLBOEwTokz-p3C0kezCiyTmlpnm0
    UpHQKF2UoIlIucXbA>
X-ME-Received: <xmr:1CgJaLAjFvnXE6zup-2_UVh9Mzd1ERcYuZhG4P3P59-JVEgEZdfHhplT8dyM_Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeejvdegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddt
    tdejnecuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrg
    hilhdrtghomheqnecuggftrfgrthhtvghrnhepvefghfeuveekudetgfevudeuudejfeel
    tdfhgfehgeekkeeigfdukefhgfegleefnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhn
    rghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpe
    epghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopeduhedp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohephihurhihrdhnohhrohhvsehgmhgrih
    hlrdgtohhmpdhrtghpthhtoheprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhr
    tghpthhtohepsghqvgesghhoohhglhgvrdgtohhmpdhrtghpthhtoheplhhinhhugiesrh
    grshhmuhhsvhhilhhlvghmohgvshdrughkpdhrtghpthhtohepvhhirhgvshhhrdhkuhhm
    rghrsehlihhnrghrohdrohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopegrlhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhmpdhrtghp
    thhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtohepsghjohhrnhefpg
    hghhesphhrohhtohhnmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:1CgJaBe-oL2apwudnuJMs6dOjLVDPoJNiaMHepPD7W47dnOtIBSPJA>
    <xmx:1CgJaCNesZOZ6kF3MFiTgtnoJwU7xXHSpy3rIOXGfB5ibaiwY2OONQ>
    <xmx:1CgJaDkjQ-CGvL6WzzERfgtqmez5Ho_XjdPSE3qKIHX7cL-jANWHbA>
    <xmx:1CgJaMvGZCclF8BwExkeTMaxFdG3MxlWy5n06ivcM62BpOf2wdQ7YA>
    <xmx:1CgJaEvTV6YsLjznjcO5NBlrjb2vwADxoN4r6BkUwxrBb0D2MGQbkw2W>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Apr 2025 13:52:20 -0400 (EDT)
Date: Wed, 23 Apr 2025 10:52:19 -0700
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
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aAkkngAzL5Roh_3p@yury>

On Wed, Apr 23, 2025 at 01:34:22PM -0400, Yury Norov wrote:
> On Wed, Apr 23, 2025 at 01:11:24PM -0400, Yury Norov wrote:
> > On Wed, Apr 23, 2025 at 09:30:51AM -0700, Boqun Feng wrote:
> > > On Wed, Apr 23, 2025 at 06:19:18PM +0200, Alice Ryhl wrote:
> > > > On Wed, Apr 23, 2025 at 5:43 PM Yury Norov <yury.norov@gmail.com> wrote:
> > > > >
> > > > > I received it twice - with timestamps 1:36 and 1:43. Assuming they are
> > > > > identical, and ignoring the former.
> > > > >
> > > > > On Wed, Apr 23, 2025 at 01:43:32PM +0000, Burak Emir wrote:
> > > > > > This series adds a Rust bitmap API for porting the approach from
> > > > > > commit 15d9da3f818c ("binder: use bitmap for faster descriptor lookup")
> > > > > > to Rust. The functionality in dbitmap.h makes use of bitmap and bitops.
> > > > > >
> > > > > > The Rust bitmap API provides a safe abstraction to underlying bitmap
> > > > > > and bitops operations. For now, only includes method necessary for
> > > > > > dbitmap.h, more can be added later. We perform bounds checks for
> > > > > > hardening, violations are programmer errors that result in panics.
> > > > > >
> > > > > > We include set_bit_atomic and clear_bit_atomic operations. One has
> > > > > > to avoid races with non-atomic operations, which is ensure by the
> > > > > > Rust type system: either callers have shared references &bitmap in
> > > > > > which case the mutations are atomic operations. Or there is a
> > > > > > exclusive reference &mut bitmap, in which case there is no concurrent
> > > > > > access.
> > > > >
> > > > > It's not about shared references only. One can take a mutable
> > > > > reference, and still may have a race:
> > > > >
> > > > > CPU1                            CPU2
> > > > >
> > > > > take mut ref
> > > > > bitmap.set() // non-atomic
> > > > > put mut ref
> > > > >                                 take mut ref
> > > > >                                 bitmap.test() // read as 0
> > > > > data propagated to memory
> > > > >                                 bitmap.test() // read as 1
> > > > >
> > > > > To make this scenario impossible, either put or take mut ref
> > > > > should imply global cache flush, because bitmap array is not
> > > > > an internal data for the Bitmap class (only the pointer is).
> > > > >
> > > > > I already asked you to point me to the specification that states that
> > > > > taking mutable reference implies flushing all the caches to the point
> > > > > of coherency, but you didn't share it. And I doubt that compiler does
> > > > > it, for the performance considerations.
> > > > 
> > > > The flushing of caches and so on *is* implied. It doesn't happen every
> > > > time you take a mutable reference, but for you to be able to take a
> > > > mut ref on CPU2 after releasing it on CPU1, there must be a flush
> > > > somewhere in between.
> > > > 
> > > 
> > > Yeah, and it's not just "flushing of caches", it's making CPU1's memory
> > > operations on the object pointed by "mut ref" observable to CPU2. If
> > > CPU1 and CPU2 sync with the a lock, then lock guarantees that, and if
> > > CPU1 and CPU2 sync with a store-release+load-acquire, the
> > > RELEASE-ACQUIRE ordering guarantees that as well.
> > 
> > Not sure what you mean. Atomic set_bit() and clear() bit are often
> > implemented in asm, and there's no acquire-release semantic.
> 
> Sorry, hit 'send' preliminary.
> 
> > > Yeah, and it's not just "flushing of caches", it's making CPU1's memory
> > > operations on the object pointed by "mut ref" observable to CPU2. If
> > > CPU1 and CPU2 sync with the a lock, then lock guarantees that, 
> 
> The problem here is that the object pointed by the 'mut ref' is the
> rust class Bitmap. The class itself allocates an array, which is used
> as an actual storage. The Rust class and C array will likely not share
> cache lines.
> 
> The pointer is returned from a C call bitmap_zalloc(), so I don't
> think it's possible for Rust compiler to realize that the number
> stored in Bitmap is a pointer to data of certain size, and that it
> should be flushed at "mut ref" put... That's why I guessed a global
> flush.
> 

You don't do the flush in the C code either, right? You would rely on
some existing synchronization between threads to make sure CPU2 observes
the memory effect of CPU1 (if that's what you want).

> Yeah, would be great to understand how this all works.
> 
> As a side question: in regular C spinlocks, can you point me to the
> place where the caches get flushed when a lock moves from CPU1 to
> CPU2? I spent some time looking at the code, but found nothing myself.
> Or this implemented in a different way?

Oh I see, the simple answer would be "the fact that cache flushing is
done is implied", now let's take a simple example:

	CPU 1			CPU 2
	=====			=====
	spin_lock();
	x = 1;
	spin_unlock();

				spin_lock();
				r1 = x;		// r1 == 1
				spin_unlock();

that is, if CPU 2 gets the lock later than CPU 1, r1 is guaranteed to be
1, right? Now let's open the box, with a trivial spinlock implementation:

	CPU 1			CPU 2
	=====			=====
	spin_lock();
	x = 1;
	spin_unlock():
	  smp_store_release(lock, 0);

				spin_lock():
				  while (cmpxchg_acquire(lock, 0, 1) != 0) { }
				  
				r1 = x;		// r1 == 1
				spin_unlock();

now, for CPU2 to acquire the lock, the cmpxchg_acquire() has to succeed,
that means a few things:

1. 	CPU2 observes the lock value to be 0, i.e CPU2 observes the
	store of CPU1 on the lock.

2.	Since the smp_store_release() on CPU1, and the cmpxchg_acquire()
	on CPU2, it's guaranteed that CPU2 has observed the memory
	effect before the smp_store_release() on CPU1. And this is the
	"implied" part. In the real hardware cache protocal, what the
	smp_store_release() does is basically "flush/invalidate the
	cache and issue the store", therefore since CPU2 observes the
	store part of the smp_store_release(), it's implied that the
	cache flush/invalidate is observed by CPU2 already. Of course
	the actual hardware cache protocal is more complicated, but this
	is the gist of it.

Based on 1 & 2, normally a programer won't need to reason about where
the cache flush is actually issued, but rather the synchronization built
vi the shared variables (in this case, it's the "lock").

Hope this could help.

Regards,
Boqun


> 
> Thanks,
> Yury
