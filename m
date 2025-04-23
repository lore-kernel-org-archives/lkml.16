Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E839E33F9;
	Wed, 23 Apr 2025 17:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745428286; cv=none; b=aDBtnV55UlTFjYRxrm70OeG8qfbw/EsviPuUlTJDjiJlz2WbqaXFsWi82OrTZ2MmmjwKrQTyhpVz18U/BIn3nyvuNdlMAopsLljPEbvpjw8Lfykz/pV6JYKkyHEZEC41tjw4LRcB1V6uy5qyb5dZ+76qOUWcmTRhyoChU7NoyWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745428286; c=relaxed/simple;
	bh=VPSNIsrVtVvb+Z0HPJ9c+8YF3WuGmiYCXd6OpsmU9SE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fmioME3kAaqp7tX3fTiVnRzgzuZDLE996nF5d5SFijuAax8D/qNgfYW3+XtIFodtFbz8yrzdypcgpGNcg0XfHYj0erBWsNr6X/w48J/kX7EJ5AQCEjEW75nUM2ksP4RXLjzDPi+fbjOyQS+DoBaZNaVTiTrm+oAfOKHS53B9h9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MW8XfP+R; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MW8XfP+R"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-af59c920d32so15368a12.0;
        Wed, 23 Apr 2025 10:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745428284; x=1746033084; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7NGzf0sBJgI4CBjmqIxURhs+Jg8zyaDDzk3h+fbV2ZI=;
        b=MW8XfP+RSx8Cait7EqlMkG0ygvdkOWHiodFEeTPjE18Ogo1ESPgIwJEX7y85b0dCwo
         yOkdtzRrTEPjMSRNBEtiREtST4sHp4OLzBltRX+6yvKJxoV475q+vBGT+9IRmADaMmTM
         5PzoEQjFpNzsOKFfCj8Tc3nGfwUYMzGaYukAPF08mzwNOTxbz00rHfx65I4f4iD/PA2W
         /pXWm9w3q2sDK3pzyEriEiUW6ERMEe9OqNlMOL7RyporYLilI2wGAzzu1hrjtIfO3BG3
         UU5rqZMA+lRc6SDE/N7SZTP0JNJDPAsrGdeWSStlJ9OnxU08bzZ+UFsa2guN5YgJGRdY
         /viQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745428284; x=1746033084;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7NGzf0sBJgI4CBjmqIxURhs+Jg8zyaDDzk3h+fbV2ZI=;
        b=eG5tC+MJWAu2/vPiGRYtvOJ6QvzvvmZRBraMxE57uyoAEOOtCXIACHNXIwwZRhuIlP
         y1sUZCs/ypQlzUYLWoGi8nyw7SZxBEG8xW/W3CIjxLgfv4MOIWRbEVfM/MUqEp9zhSrV
         9F0RYZvLEd68vEugTirm2+FiQ9qzadtZrDDZBTRRiO5NTVeLOZcxp8LxrB5D7Obmqp5b
         TRdhDae6dpU3Te4jHfXtQm7Ak71CRiaHRghXOYDOQvGog1LYQaDd97qSCf+i+Pgb5SJY
         n4liyQa0ZXA/be1OQdDUbxawbiYGZnL7qkFlS7CXyt6qjGnukPJAiHclsFmyE8Jj4ix6
         Rn1w==
X-Forwarded-Encrypted: i=1; AJvYcCWTzEzNGbvE0OgF1+qoS5cNgBU/ANSOhT0TiCsAyJv90I/P3Oao22LppQTl1RAivTWAJPlgTHGMnXNN3oU=@vger.kernel.org, AJvYcCXPACdDI1DBcXQqwro+kCS0/d//yCy/cKEWpDJ+nu8DPRdRsFb2/1EFiwsKyTEuMDN617gpBLqr2pSzz8lhLSk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlqHqy4FK5c7u9bT5RNZI81XmZCpsz1cBn870eHCcOEgBqFBN9
	i5FbSJyE/WCLXpWWqvfAZn/ssxYveYkDFbww/1dxg3pKB1VosPYj
X-Gm-Gg: ASbGncsgewAt301Y8RHXeF6RnEMwJajUBohDcGrwTxQTM9bAl6+nHr9ot1lPIj8uekk
	qIN1DwRh9R10g3vxJr0xekIjpXul5PdBuf6JbD3WOo0AKGiOd7vsI9PAIA8cptgoxy+WGJ8zZIM
	JgSKbY8BS5ypov2qlqi2ryfe5xjMtF+TFpNLO5PvRujTRG0BieKuu9EVoZl5LLDseWfunjU8enP
	MNJfwljzhA9Z5cdxZtDsB6aLlDhP5mewiJTy6EmpbGOsVSatgUJtMmFoUDB2wbIggeodV/Gp8BZ
	9lVrIdRTAozDNnp06EADeKbHzA4py434ySGkvRNL
X-Google-Smtp-Source: AGHT+IHMWmY9+gK8c618FUN9E8FcY+Iq3UZOXDOwQwudJTsNRBGremZgzfJyr/f0ecXNdIk3hQsayQ==
X-Received: by 2002:a17:90b:4b4a:b0:2ff:6e72:b8e9 with SMTP id 98e67ed59e1d1-3087bbbbd74mr28006293a91.25.1745428283950;
        Wed, 23 Apr 2025 10:11:23 -0700 (PDT)
Received: from localhost ([216.228.127.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309d3472785sm2496241a91.0.2025.04.23.10.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 10:11:23 -0700 (PDT)
Date: Wed, 23 Apr 2025 13:11:21 -0400
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
Message-ID: <aAkfOe5ZDUgIawyU@yury>
References: <20250423134344.3888205-2-bqe@google.com>
 <aAkKoQQH0t9KtIxD@yury>
 <CAH5fLggFUM=eJR2u06QsLMxXP+cJwm881ip+rze_sM=tXpA9og@mail.gmail.com>
 <aAkVu8Uf3J8F25fY@Mac.home>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aAkVu8Uf3J8F25fY@Mac.home>

On Wed, Apr 23, 2025 at 09:30:51AM -0700, Boqun Feng wrote:
> On Wed, Apr 23, 2025 at 06:19:18PM +0200, Alice Ryhl wrote:
> > On Wed, Apr 23, 2025 at 5:43 PM Yury Norov <yury.norov@gmail.com> wrote:
> > >
> > > I received it twice - with timestamps 1:36 and 1:43. Assuming they are
> > > identical, and ignoring the former.
> > >
> > > On Wed, Apr 23, 2025 at 01:43:32PM +0000, Burak Emir wrote:
> > > > This series adds a Rust bitmap API for porting the approach from
> > > > commit 15d9da3f818c ("binder: use bitmap for faster descriptor lookup")
> > > > to Rust. The functionality in dbitmap.h makes use of bitmap and bitops.
> > > >
> > > > The Rust bitmap API provides a safe abstraction to underlying bitmap
> > > > and bitops operations. For now, only includes method necessary for
> > > > dbitmap.h, more can be added later. We perform bounds checks for
> > > > hardening, violations are programmer errors that result in panics.
> > > >
> > > > We include set_bit_atomic and clear_bit_atomic operations. One has
> > > > to avoid races with non-atomic operations, which is ensure by the
> > > > Rust type system: either callers have shared references &bitmap in
> > > > which case the mutations are atomic operations. Or there is a
> > > > exclusive reference &mut bitmap, in which case there is no concurrent
> > > > access.
> > >
> > > It's not about shared references only. One can take a mutable
> > > reference, and still may have a race:
> > >
> > > CPU1                            CPU2
> > >
> > > take mut ref
> > > bitmap.set() // non-atomic
> > > put mut ref
> > >                                 take mut ref
> > >                                 bitmap.test() // read as 0
> > > data propagated to memory
> > >                                 bitmap.test() // read as 1
> > >
> > > To make this scenario impossible, either put or take mut ref
> > > should imply global cache flush, because bitmap array is not
> > > an internal data for the Bitmap class (only the pointer is).
> > >
> > > I already asked you to point me to the specification that states that
> > > taking mutable reference implies flushing all the caches to the point
> > > of coherency, but you didn't share it. And I doubt that compiler does
> > > it, for the performance considerations.
> > 
> > The flushing of caches and so on *is* implied. It doesn't happen every
> > time you take a mutable reference, but for you to be able to take a
> > mut ref on CPU2 after releasing it on CPU1, there must be a flush
> > somewhere in between.
> > 
> 
> Yeah, and it's not just "flushing of caches", it's making CPU1's memory
> operations on the object pointed by "mut ref" observable to CPU2. If
> CPU1 and CPU2 sync with the a lock, then lock guarantees that, and if
> CPU1 and CPU2 sync with a store-release+load-acquire, the
> RELEASE-ACQUIRE ordering guarantees that as well.

Not sure what you mean. Atomic set_bit() and clear() bit are often
implemented in asm, and there's no acquire-release semantic.
