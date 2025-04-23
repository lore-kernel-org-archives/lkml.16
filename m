Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9329528B517;
	Wed, 23 Apr 2025 17:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745429457; cv=none; b=kiGRIguSssYMV5MlYjIRaGIGi/ASrSPyQBLM8Uj4ehIpHIsU+EofKGrwlEmBEXysVuY9h/7/OOdwt3cBaLSe+Xhks0Tr/Zw4ovA28TwQZwZs3uXiYNqHGLd4jt2BcOmvHpDZjH+UExp4ozM7FIcciQ2SbkN8UulGolagBkMHzW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745429457; c=relaxed/simple;
	bh=bmhVFhgSxioKeHLmxhgtiawMLd+NqGdIDGQBcqicbwU=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i1bbREC+RreiQ/zRjfdaLFIIDeAo9Il6E/XLY+/FMPfu6Lgpwz1loi4OBOWGsL+yJ7l9RqH4xEaFaS0pMAjyD0iTzaJt2lWUkSNqlO+vsvrTexH9TLh1HDQk0hMlib39JgyOCjHnjJLToKiOuTwK4ytJJHW+8xmctM5ZcULuyT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bUlLCeAS; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bUlLCeAS"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7c5e39d1e0eso8186085a.1;
        Wed, 23 Apr 2025 10:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745429454; x=1746034254; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:feedback-id
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=R39yIZ1bSmu3ErC7i6kpiW+k4H62zePFVSNMlXK7ixU=;
        b=bUlLCeASnTuGThw2X36PZixVWrj04kkb0Xi5eSq2t6UhfeVzecT7d2XCDGPLr3ZP+9
         zFtJKJqQsEGysYOc7N8lN0AkqYTrJSpxeUoE/y1JvnGz7K9SuqKedgS++3Hb4sDuWZny
         aNQsRTZSExsRVYGmeq98chNdzVk2xmWXfRtvDvOajFnkS3YTmP9b/EnUGqJpr4y8VFCO
         dQX143zh70quKgoyfz7hafpl1xXG918IS1AVwvCx3pB0f+SrB8240lRLCwXU4m2Uqv21
         2zCOnvZVMKHZbCOsEOMpCIQPV5Rhq4M5JjNDjK65pDryxCt2chCDM/zR3mIVgv/ogpSY
         6lcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745429454; x=1746034254;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:feedback-id
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R39yIZ1bSmu3ErC7i6kpiW+k4H62zePFVSNMlXK7ixU=;
        b=CCheBRM7Y1pDUx4ffLKNwqZgejQNvy9PycC7fG/qtSc9W4KgReRQqrFcb9PervB2Zc
         7TqGSvjBsp+cphgh+o7U0AJONzS+F1Hhwk2oWRHG3enTVFhVUQdqvRWHEttNBjyk1tzA
         PfVkzIYYJRXPx910GM6Q4sjKvYQgsMZ0HHR/77RYF9KEaZ2Mc3brARcpzMVA91rbPBYl
         HR2hmGmX5aC0FSaJuYSjCXIgB//7QMmKIwOoOvYjnDMXqdT35snzrQ+ZK/1rtW7Jy7S2
         nnXAa5Hk40nlgCAXeJ/oxAvZoG5R5qm8ZkMNWmyEARIRMN5c2ZMpwT/ST8JmgVk/12Jl
         ga/w==
X-Forwarded-Encrypted: i=1; AJvYcCVYmU+74F3XSKkcTE3OvcrS0UO4BVp3uEosSLqHzRsYHx/SrNQBlZqdmf3kioi6RxGgc/gFy+DMVR//feUBXG8=@vger.kernel.org, AJvYcCWvbKgxn1rqV38IqjBzljjt/sid0BFCvpo/Z/NPl6m/AM2kCEFN91pE/OCsO+yqkc4J7nhY4fp028AUvpE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQNMg7TSyjqtZ7KxBwt886i4XO0OJaL1UP143OLx0lRqNpi3mN
	vSF1Ad1o+UYZRTG8q9Tl1oZDvKixYCSP/lD1kbq2Ew7BIgJgZzl8
X-Gm-Gg: ASbGnct3nMQV+UyfQBPni4zLaT4+3CKkhugSpqGoDqc2qMUjqQu0JYeFtNPwxzfGVuL
	W+wkhK2BMXniQveLJibPLLdxYWRI5kVIuW3AytcUm1tS78l7dKhy/6XZBi7bTTuslX0UpTmp28b
	K060oO2plf+LSUkVPbn95sx5rZeEruM8A7vThnpwQye4LDBxdSknwHo0+YpKCh3Evf6IXWJdp5X
	DIdma6FOPzh53JMj0gQx68XCJ2l4P5IUmqWEu1HIcArug/OnHaiTfokxWdh7dhnM4a274aGTfjO
	sDO40cjKuQahgQOFG8jjozpWNxaCyuyP+X87HhaZXEHyG6GIkJ34Zjkrmxz1nxZhejBbMwd0omS
	/YwW5LZWVPDhaOjoLIVrdLm5Y+X+UV7Zvlm9nKj5lRg==
X-Google-Smtp-Source: AGHT+IEjLdDoRzzRsKY3pJrAiZUA7Nmq06oh+/0O8w7YixzG3zr8GAJYvcSuHq6uuD9rhqwTOmlQag==
X-Received: by 2002:a05:620a:40ca:b0:7c5:50dd:5071 with SMTP id af79cd13be357-7c927f99fa0mr2814655985a.22.1745429454134;
        Wed, 23 Apr 2025 10:30:54 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925a8d2bfsm706767485a.28.2025.04.23.10.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 10:30:53 -0700 (PDT)
Message-ID: <680923cd.050a0220.2b2efe.cb68@mx.google.com>
X-Google-Original-Message-ID: <aAkjy-5h2N8ukDFu@winterfell.>
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 1CFF11200080;
	Wed, 23 Apr 2025 13:30:53 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Wed, 23 Apr 2025 13:30:53 -0400
X-ME-Sender: <xms:zSMJaJvnPnyaP7euCdTy8gaWGlWVP7tiraH6lFyyrFLVpbgi5ukohQ>
    <xme:zSMJaCf7t5-u3q4Ca89Q4kJQYgVmtFqNXX7i0woEORnJLo1QjYiakNL7UoXwgeEMj
    mKC1meRnLxN2uQvtQ>
X-ME-Received: <xmr:zSMJaMxRT55mKME5hv2NA5AbmROBs6pHIWiKiexWRScKYDTDBmDY-rwNSQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeejvddtucetufdoteggodetrf
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
X-ME-Proxy: <xmx:zSMJaAOINkBW9OxwHIK3PcRmaVXaV1z_CSCNBnZyflsjGReifU363w>
    <xmx:zSMJaJ9fco4KomQL7oEnEZFSibmNeXQsnfIK_leaDOyqgOFPsLwbhQ>
    <xmx:zSMJaAUtFvJlyeQjTdCxdkxOVlwdjZm0YqkN-urGp_ecJSAs8_Ewww>
    <xmx:zSMJaKc6HUl4O9GEvkQLDPuDiGU3nknYD_bEJAIha2rbzLQ9zjdZmA>
    <xmx:zSMJaPfPyFAcCnFBxr3PRuyS0tuRpiV9WSa7B8RrGF1ObtiEFMoua8yo>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Apr 2025 13:30:52 -0400 (EDT)
Date: Wed, 23 Apr 2025 10:30:51 -0700
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
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aAkfOe5ZDUgIawyU@yury>

On Wed, Apr 23, 2025 at 01:11:21PM -0400, Yury Norov wrote:
> On Wed, Apr 23, 2025 at 09:30:51AM -0700, Boqun Feng wrote:
> > On Wed, Apr 23, 2025 at 06:19:18PM +0200, Alice Ryhl wrote:
> > > On Wed, Apr 23, 2025 at 5:43 PM Yury Norov <yury.norov@gmail.com> wrote:
> > > >
> > > > I received it twice - with timestamps 1:36 and 1:43. Assuming they are
> > > > identical, and ignoring the former.
> > > >
> > > > On Wed, Apr 23, 2025 at 01:43:32PM +0000, Burak Emir wrote:
> > > > > This series adds a Rust bitmap API for porting the approach from
> > > > > commit 15d9da3f818c ("binder: use bitmap for faster descriptor lookup")
> > > > > to Rust. The functionality in dbitmap.h makes use of bitmap and bitops.
> > > > >
> > > > > The Rust bitmap API provides a safe abstraction to underlying bitmap
> > > > > and bitops operations. For now, only includes method necessary for
> > > > > dbitmap.h, more can be added later. We perform bounds checks for
> > > > > hardening, violations are programmer errors that result in panics.
> > > > >
> > > > > We include set_bit_atomic and clear_bit_atomic operations. One has
> > > > > to avoid races with non-atomic operations, which is ensure by the
> > > > > Rust type system: either callers have shared references &bitmap in
> > > > > which case the mutations are atomic operations. Or there is a
> > > > > exclusive reference &mut bitmap, in which case there is no concurrent
> > > > > access.
> > > >
> > > > It's not about shared references only. One can take a mutable
> > > > reference, and still may have a race:
> > > >
> > > > CPU1                            CPU2
> > > >
> > > > take mut ref
> > > > bitmap.set() // non-atomic
> > > > put mut ref
> > > >                                 take mut ref
> > > >                                 bitmap.test() // read as 0
> > > > data propagated to memory
> > > >                                 bitmap.test() // read as 1
> > > >
> > > > To make this scenario impossible, either put or take mut ref
> > > > should imply global cache flush, because bitmap array is not
> > > > an internal data for the Bitmap class (only the pointer is).
> > > >
> > > > I already asked you to point me to the specification that states that
> > > > taking mutable reference implies flushing all the caches to the point
> > > > of coherency, but you didn't share it. And I doubt that compiler does
> > > > it, for the performance considerations.
> > > 
> > > The flushing of caches and so on *is* implied. It doesn't happen every
> > > time you take a mutable reference, but for you to be able to take a
> > > mut ref on CPU2 after releasing it on CPU1, there must be a flush
> > > somewhere in between.
> > > 
> > 
> > Yeah, and it's not just "flushing of caches", it's making CPU1's memory
> > operations on the object pointed by "mut ref" observable to CPU2. If
> > CPU1 and CPU2 sync with the a lock, then lock guarantees that, and if
> > CPU1 and CPU2 sync with a store-release+load-acquire, the
> > RELEASE-ACQUIRE ordering guarantees that as well.
> 
> Not sure what you mean. Atomic set_bit() and clear() bit are often
> implemented in asm, and there's no acquire-release semantic.
> 

Well, that's because they are already atomic, therefore no need to
synchronize. Plus if you were to use set_bit() and test_bit() in your
example above, the test_bit() on CPU2 could reads 0, right? I.e. it's
a total different scenario. That is, if you don't synchronize the
operations between two CPUs, you don't get a guarantee of the
observation ordering.

Back the the non-atomic version, taking a very simple example in C,
considering you have:

	struct foo {
		spinlock_t lock;
		long *bitmap;
	}

if you only use non-atomic version i.e. __set_bit() and
__test_bit(), you will need to use lock to synchronize them:

	CPU1			CPU2
	====			====
	spin_lock(&foo->lock);
	__set_bit(foo->bitmap, ...);
	spin_unlock(&foo->lock);
				spin_lock(&foo->lock);
				__test_bit(foo->bitmap, ...);
				// ^ read as 1, because of the lock
				// synchronizes these operations.
				spin_unlock(&foo->lock);

Now if we move to Rust, we will have:

	type Foo = SpinLock<Bitmap>;

and
	CPU1			CPU2
	====
	let foo: &Foo = ...;

	let bitmap: Guard<Bitmap> = foo.lock();

	bitmap.set_bit(); // Guard impls DerefMut

	// lock dropped
				let foo: &Foo = ...;

				let bitmap: Guard<Bitmap> = foo.lock();

				bitmap.test_bit(); // read as 1, same
						   // because of the
						   // lock
						   // synchronization.

So there is nothing different between Rust and C code in this case,
except because in the Rust API, we define that Bitmap::set_bit() and
Bitmap::test_bit() have to take a mutable references, therefore the lock
or some other synchronization has to exist to provide the `&mut Bitmap`,
otherwise you cannot call these functions.

Regards,
Boqun
