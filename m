Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D002857C4;
	Wed, 23 Apr 2025 17:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745428085; cv=none; b=jQS9G29qvI07BtbNSBv79cUdASsn6f1w3IU4iPuKcBifb4GTLD9pvOzRXHj7fooaG4ERVjmuo7oMVu2BIQtsE+2VmoJT0lWHba7sAqe6zj4SIAquUdGSkXILISkQ4KmZ/oHYcKfQIE5tnpRT/c+HeRo8qbtB1vNH0w0x67sdDUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745428085; c=relaxed/simple;
	bh=faNWnwKoeLaA2ABcfsygKSEnvEwF7jphC7igym4tapw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e2hPg5Gfn992iGbvlIGnV+OR9SZvzVD9jcl0mvogUl3k3NCMCWsB7oHgS4XJ6ntMTOCH1EIaP8mElUlOUSwVdXqFOzJFoVRMY10ODGdAeV0CXHVdCVEk1gsBwhXjtK3efZDE5r/HDBJlq8sawJV/6DnEjpCxLQxZotjkXjudNWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KSSkHA89; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KSSkHA89"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-30155bbbed9so108148a91.1;
        Wed, 23 Apr 2025 10:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745428083; x=1746032883; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xZvTiXawzSgHj7FI2kLZHKNyxWg1hv6pUgC8nbUE2kI=;
        b=KSSkHA89JPIgh56assoCAa5KHGiHkyJOm5maFIfLaxYu+LOWBgSgUtG4mBXgL4l+Lx
         AWO8Fv/kjcPJn1NqLS3AgzdwirMOfZmTPUdDTHje06ir65fuYm44FPiJgKd1BYAAzenu
         4Dq4Xb8QYOh4ti2j4VbfH+8sBVVESZFnhL4iRoalqwZhFaloTyyNrZpE2DcywCzUR2tp
         vUiOeapczYTjYH/FsMsv8VUfZh0wE+b3UjKmFL196VxADlhbraGb2at5r9LZoFqbus2m
         D0YkXmRj3S26yRgZ7ebQO1BnN9C02oNX0Jy8bG+J7sQcsk2MsejMI2DK+IKTlslABEwV
         6laQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745428083; x=1746032883;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xZvTiXawzSgHj7FI2kLZHKNyxWg1hv6pUgC8nbUE2kI=;
        b=va3bxxpTonTfpnm661Tx4wNH11Ws3h5/YJ4tLAIN2iIEuANLF6OjhOXQ4u1Ycjmeta
         h6m9S08eYPVk8mDnsdJnQirYfZlgDtm8P4OxksY2/NBBHBvkIlQm9SKRQkVenhATiWdu
         dJACOrbr3L8hPOx8ze4lsFeyi0m/Lm7lY6zOU85K1Sa9UbXoxdDKll3/pnQqi3mFJAVW
         wC+qECb2b4NOHOkMIl5Ik9tSnxDSMu2Uof9z+Fk60Ih90uO+YOJerg/HEn6EV4inl4mU
         pu6sntmNo6Fh4y7IUZ23hci4n5ZEHvL+ysm08xvpDs1DmLDzEyhmgptegOtTvRQWNc5s
         Lm9w==
X-Forwarded-Encrypted: i=1; AJvYcCVPfLxKEymFd7Zj5F0iJq+eQaQJPmgbIVoKrGbnPANBqPg7gjOR0OMQfGEFapNb4r3Eni8QElGlaU3Hq9PzguA=@vger.kernel.org, AJvYcCX7B3s8pF/earPDK30NtI9buG1Ys3af4JxYPr8sJLYBoBLr9RmGgkjI7hyrLRRYK0FJSeRfjGbTIDvCTi8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUTvhDSGPJEvtFQcHVoSigO3U784A8HD1K0fH4xDcf9vV4WiLX
	yrq0+9BEI/Y5iS2sAtghvVH5C+Vg/YQrhMFI9+csrI1vvIWLuywP
X-Gm-Gg: ASbGncu6rCM4Eb4qFwLzAPYUUEMPCa20MnFG81Zhynz3TvzBWdmhlJbKzdyty3j7bbH
	8ai8Q18r95JHa5rq5h8YGTcottpSehHo6t2z/eoY7l/QEXcKV4hKg6JGE9I3u4ALNBsAUYOlWGa
	zKQ/NsN5vjFC1XIW8gpSLiMxvTDXr94rWQKFKOB9nqJ1wbzok1PEibKuccHTgivTxIfEznOd0R3
	I5A5CCM5J5PwyZV46IyCVHlbG2qpxnhSsAKxe2Sdwn9p0Owc4HST988NP7QlH5caLrITsWZsZ86
	bfnFzvRKT3PudPTzTqnNZNVGKH+9qDANbsWPHGcm
X-Google-Smtp-Source: AGHT+IE9XANxAuRr5sxcraq4Cd8R9CtQ6OvmmnZ6j88xJckJY1fCT3SVw1prM7YKA3TgyacJlTMnog==
X-Received: by 2002:a17:90b:1cc5:b0:2fe:85f0:e115 with SMTP id 98e67ed59e1d1-3087bb9f463mr22874428a91.26.1745428082747;
        Wed, 23 Apr 2025 10:08:02 -0700 (PDT)
Received: from localhost ([216.228.127.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309dfa0ac5esm1898902a91.19.2025.04.23.10.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 10:08:02 -0700 (PDT)
Date: Wed, 23 Apr 2025 13:08:00 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Burak Emir <bqe@google.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/5] rust: adds Bitmap API, ID pool and bindings
Message-ID: <aAkecEetYCFsq9XJ@yury>
References: <20250423134344.3888205-2-bqe@google.com>
 <aAkKoQQH0t9KtIxD@yury>
 <CAH5fLggFUM=eJR2u06QsLMxXP+cJwm881ip+rze_sM=tXpA9og@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLggFUM=eJR2u06QsLMxXP+cJwm881ip+rze_sM=tXpA9og@mail.gmail.com>

On Wed, Apr 23, 2025 at 06:19:18PM +0200, Alice Ryhl wrote:
> On Wed, Apr 23, 2025 at 5:43 PM Yury Norov <yury.norov@gmail.com> wrote:
> >
> > I received it twice - with timestamps 1:36 and 1:43. Assuming they are
> > identical, and ignoring the former.
> >
> > On Wed, Apr 23, 2025 at 01:43:32PM +0000, Burak Emir wrote:
> > > This series adds a Rust bitmap API for porting the approach from
> > > commit 15d9da3f818c ("binder: use bitmap for faster descriptor lookup")
> > > to Rust. The functionality in dbitmap.h makes use of bitmap and bitops.
> > >
> > > The Rust bitmap API provides a safe abstraction to underlying bitmap
> > > and bitops operations. For now, only includes method necessary for
> > > dbitmap.h, more can be added later. We perform bounds checks for
> > > hardening, violations are programmer errors that result in panics.
> > >
> > > We include set_bit_atomic and clear_bit_atomic operations. One has
> > > to avoid races with non-atomic operations, which is ensure by the
> > > Rust type system: either callers have shared references &bitmap in
> > > which case the mutations are atomic operations. Or there is a
> > > exclusive reference &mut bitmap, in which case there is no concurrent
> > > access.
> >
> > It's not about shared references only. One can take a mutable
> > reference, and still may have a race:
> >
> > CPU1                            CPU2
> >
> > take mut ref
> > bitmap.set() // non-atomic
> > put mut ref
> >                                 take mut ref
> >                                 bitmap.test() // read as 0
> > data propagated to memory
> >                                 bitmap.test() // read as 1
> >
> > To make this scenario impossible, either put or take mut ref
> > should imply global cache flush, because bitmap array is not
> > an internal data for the Bitmap class (only the pointer is).
> >
> > I already asked you to point me to the specification that states that
> > taking mutable reference implies flushing all the caches to the point
> > of coherency, but you didn't share it. And I doubt that compiler does
> > it, for the performance considerations.
> 
> The flushing of caches and so on *is* implied. It doesn't happen every
> time you take a mutable reference, but for you to be able to take a
> mut ref on CPU2 after releasing it on CPU1, there must be a flush
> somewhere in between.

OK, that makes sense.
 
> I can try to find docs for it ...

Yes please, that would help a lot.
