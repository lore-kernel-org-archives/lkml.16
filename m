Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52752264A89;
	Wed, 23 Apr 2025 17:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745429667; cv=none; b=p6hYkbvFH2b0UsKjmx3BnGw4FxNe0wsb9MFz9HSMrVzix9sCRrGUUxStKmAIFAZO66Tz/44M2F7JrDu601pHrqfQoRqDST33drWBHANyZaJI/ZTDoiAlxiFoVG2Q30IOywihGMGgQXeUunFcAiq1Cjhez0DaXsTon83F5jw+K50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745429667; c=relaxed/simple;
	bh=Zr6iOwl3KondNWgHHqph7xfxUqf3RaAlNDDW6+RnluM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cobcdkbng5aotRjY4xasYXskBPl8LPg1ExiKRIE7feq0s5ZWqtsoEZ7hAvx8knl5jx5+m4nBwGjhrlxKkG0Br7v32AXhm4FDeunHa09+W2SWFBBF/433uCO7h5XAm7ZLNVzehOMgUDNXuUo8nqLuf9UtpRidhFRuHCKRamITGC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JtSuS+5X; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JtSuS+5X"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-736bfa487c3so38500b3a.1;
        Wed, 23 Apr 2025 10:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745429665; x=1746034465; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iAqT2AAa5E9qQu8020HsAWm1fcmWO5dGwf8N8XgUQ9M=;
        b=JtSuS+5X84V5LPMiT7+Y8srAfUaPkM+A23mG1XkBNJVGMYV4PQaEj9JYr6vGHMTBDV
         ailjSgZPxTmCj7Jhkme/tL3YLGM3svCKwoaIvjWF6Lu7GKFkzpT197vRMwUGAbZdZjVC
         WrtHII8v8ibZq18BxKdsFnoLA7WXLutufKcjA6DZU0Ql6pQu3Xu2sX7QHmi+DKgQ7zUN
         MIY73vHZPi0Q/G+B52rT0KojnykZORS7AtbPCp3gVYYHBTM9YTcVT30EDjNS/DFnPVLQ
         GODFaDnHCrEye5W86Lqx8ynxERHipiGn0U5z7aKU2bqd2YfE7mQYGMV9Dc+8CSsvb63+
         GyDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745429665; x=1746034465;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iAqT2AAa5E9qQu8020HsAWm1fcmWO5dGwf8N8XgUQ9M=;
        b=g43UGhV16mLxH3+roNW465+yvJFTBFMgcXN0sLwQMIeTL+6/0KmPLMTSltizhMAZXB
         OkARJpuepyhIDtlG0WTJkx8TMdAc1uFM63i1oLJhXgo41/df8rF2Ychpxo6hnNB480Jk
         rO3uGvcTOLfvLqWoWaANpJ0/7KPY5Vb3T38CrLR7s26Vxb7BaM/kTr9mKMTCEmiEQWEn
         ImIKeTFNn+jHNA4du0hDfYMZF4botuveZS7zdV2ZwemNtfnILQwsuHfZXytRZlKGowCZ
         FCr31sVyfJduZm/MTcBmEouEd/XgFloRAYwxC5lIEd4W2zjKMKrvZhl3F7RoZDl/382I
         S7zw==
X-Forwarded-Encrypted: i=1; AJvYcCWUZgvxNdGrKuD1//Yxki3hpZqDLA4/MmAht4n4ACBM5SgkUX2Cu/7wh2L5E2cWDCN7QnEcRkBuHyw34zCuy1M=@vger.kernel.org, AJvYcCXIvqtswqhpoduNRLC2FY24Qu03nCPnw9gJF2gPtF2tC4I2/m1vKrgqG3HVS/XPdT8cdUczk4z9Wvgye18=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjERR50F90DXqqGn6Wy6n1rlBpUkRk7ZZr6jj16qLAMsz6S0Nj
	pxOrFSjkGnqsjHhscdzaUW1zIXMVwuwaC0L0v6oEUa/XgI6e1yIg
X-Gm-Gg: ASbGncv3gG0cvYGVl1P1GdrfXHXrxwIvgyaR3AzLV7AEB6rJXoO1TuM8CUGLwTJXsNK
	xKM15nIlzIslHQTIFLIUbovpS6yOxzBTrwbh0MXYPvUWosH/uvVU9uFQUxyp7NCl9MCAnGqYRE7
	HljwGU51N5PeNaePXHDN2GkpeWtzvLOUvA2yoccA711aKA58Zo+JY3sQoTBWm7rwjlFbbbO/zxa
	iXxjlTDo1g+C/KUTvwkyna1FvqC72jsRYhtefO6be3k0U/S9VtpyPqfodeYdn2oM5HWHqT4JAFj
	tHYMgjcImCO4CQbUmzwMuP2+xCykEXWSE64uTfGn
X-Google-Smtp-Source: AGHT+IFZRKVbYMdEJDZsTjF7k7PnKuLvU0dXGI0Pep9HUFTWhs9qrQ9sU7QSA0qYkbABLUQdPYBL9A==
X-Received: by 2002:a05:6a00:3910:b0:739:4a93:a5db with SMTP id d2e1a72fcca58-73dc15dce11mr26254032b3a.22.1745429665498;
        Wed, 23 Apr 2025 10:34:25 -0700 (PDT)
Received: from localhost ([216.228.127.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e079a75efsm3433227b3a.58.2025.04.23.10.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 10:34:24 -0700 (PDT)
Date: Wed, 23 Apr 2025 13:34:22 -0400
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
Message-ID: <aAkkngAzL5Roh_3p@yury>
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

On Wed, Apr 23, 2025 at 01:11:24PM -0400, Yury Norov wrote:
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

Sorry, hit 'send' preliminary.

> > Yeah, and it's not just "flushing of caches", it's making CPU1's memory
> > operations on the object pointed by "mut ref" observable to CPU2. If
> > CPU1 and CPU2 sync with the a lock, then lock guarantees that, 

The problem here is that the object pointed by the 'mut ref' is the
rust class Bitmap. The class itself allocates an array, which is used
as an actual storage. The Rust class and C array will likely not share
cache lines.

The pointer is returned from a C call bitmap_zalloc(), so I don't
think it's possible for Rust compiler to realize that the number
stored in Bitmap is a pointer to data of certain size, and that it
should be flushed at "mut ref" put... That's why I guessed a global
flush.

Yeah, would be great to understand how this all works.

As a side question: in regular C spinlocks, can you point me to the
place where the caches get flushed when a lock moves from CPU1 to
CPU2? I spent some time looking at the code, but found nothing myself.
Or this implemented in a different way?

Thanks,
Yury
