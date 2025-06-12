Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD8819C560;
	Thu, 12 Jun 2025 15:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749743898; cv=none; b=m6GSkto3rVtC99VNwMR3zcYk9eYqXcbG34is2JgNzpVXUzizShG0d6zBYZKOXoxu91I+UcwCEN4RY/iV6L4Q47wKYWXGjhl67lFxhTBarJXt3+2LvlMrU68icabjmyQZfL+TDAlntn8uDpAJONJ5S1BX64JhWJnmvJ1SRnaQv48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749743898; c=relaxed/simple;
	bh=3IAZTKAvkdkcSbUOqg4+LM8UboyEF8U42ivUmOGwMIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uq1cuQbM4eV1nAUY8x68kRXui9WNECb1uT2yBIPN9wg+hZs+w+3S3DiVAjxVcGZym3thOpYZCNk6w1Zttjgb+BgRMUaLcVrYWpzAYkl0/akPcBTnKAKf8qcZHy+Df/Wv5UjiPX5/4qn1Gro5UjeITDYJ16WtlILnHKPESbxvhqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BX0r+2DQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BX0r+2DQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DF13C4CEEB;
	Thu, 12 Jun 2025 15:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749743898;
	bh=3IAZTKAvkdkcSbUOqg4+LM8UboyEF8U42ivUmOGwMIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BX0r+2DQr+N3Qx9DAEWwGxBPBXarWDA6UYcqalR/4zMJ2fK2Hcnynhvb/6LjCf7ff
	 03KETxtP4oXIqKHuS4V32VBEFyS82ktYlUS4aTOa/hFyyErU5tA/cjjRUDxdTyXisz
	 V5X4kup4+chQt8PmxdLw/1JwYMqTBym2EUgoK1SYGAtNzuIDzwQ0xNcNmlYf3G7wIk
	 imCmeNX9jP6Tf4D1Qy/wEiexBQe1zaD2nnFT3hQp4OLqp6VFllKD8NQWYRULZmxWCo
	 eHS4AMvBSNm2RQtVf2IzCQnJzz2UR6o0hV41KEfAvVxNUUz8bB+839jMnsHt/B/mkI
	 wiRSWkhxf+SVg==
Date: Thu, 12 Jun 2025 17:58:12 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Benno Lossin <lossin@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org,
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] rust: revocable: support fallible PinInit types
Message-ID: <aEr5FNDaueo5SG5R@cassiopeiae>
References: <20250612145145.12143-1-dakr@kernel.org>
 <20250612145145.12143-2-dakr@kernel.org>
 <DAKO8MMSCUE4.1WVR6SBADGP8W@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DAKO8MMSCUE4.1WVR6SBADGP8W@kernel.org>

On Thu, Jun 12, 2025 at 05:48:36PM +0200, Benno Lossin wrote:
> On Thu Jun 12, 2025 at 4:51 PM CEST, Danilo Krummrich wrote:
> > diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
> > index fa1fd70efa27..41b8fe374af6 100644
> > --- a/rust/kernel/revocable.rs
> > +++ b/rust/kernel/revocable.rs
> > @@ -82,8 +82,11 @@ unsafe impl<T: Sync + Send> Sync for Revocable<T> {}
> >  
> >  impl<T> Revocable<T> {
> >      /// Creates a new revocable instance of the given data.
> > -    pub fn new(data: impl PinInit<T>) -> impl PinInit<Self> {
> > -        pin_init!(Self {
> > +    pub fn new<E>(data: impl PinInit<T, E>) -> impl PinInit<Self, Error>
> > +    where
> > +        Error: From<E>,
> 
> I don't think we need this bound as you don't use it in the function
> body.

I think it's needed by try_pin_init!() below, no?

Without it I get the compilation error in [1].

> > +    {
> > +        try_pin_init!(Self {
> >              is_available: AtomicBool::new(true),
> >              data <- Opaque::pin_init(data),
> >          })
> 

[1]

error[E0277]: `?` couldn't convert the error to `error::Error`
  --> rust/kernel/revocable.rs:87:9
   |
87 | /         try_pin_init!(Self {
88 | |             is_available: AtomicBool::new(true),
89 | |             data <- Opaque::pin_init(data),
90 | |         })
   | |          ^
   | |          |
   | |__________this can't be annotated with `?` because it has type `Result<_, E>`
   |            the trait `core::convert::From<E>` is not implemented for `error::Error`
   |
   = note: the question mark operation (`?`) implicitly performs a conversion on the error value using the `From` trait
   = note: required for `core::result::Result<revocable::Revocable<T>::new::__InitOk, error::Error>` to implement `core::ops::FromResidual<core::result::Result<core::convert::Infallible, E>>`
   = note: this error originates in the macro `$crate::__init_internal` which comes from the expansion of the macro `try_pin_init` (in Nightly builds, run with -Z macro-backtrace for more info)
help: consider introducing a `where` clause, but there might be an alternative better way to express this requirement
   |
83 | impl<T> Revocable<T> where error::Error: core::convert::From<E> {
   |                      ++++++++++++++++++++++++++++++++++++++++++

error[E0277]: the trait bound `impl PinInit<Revocable<T>, Error>: PinInit<Revocable<T>, E>` is not satisfied
  --> rust/kernel/revocable.rs:85:48
   |
85 |     pub fn new<E>(data: impl PinInit<T, E>) -> impl PinInit<Self, E>
   |                                                ^^^^^^^^^^^^^^^^^^^^^ the trait `pin_init::PinInit<revocable::Revocable<T>, E>` is not implemented for `impl pin_init::PinInit<revocable::Revocable<T>, error::Error>`
   |
   = help: the following other types implement trait `pin_init::PinInit<T, E>`:
             `core::result::Result<T, E>` implements `pin_init::PinInit<T, E>`
             `pin_init::ChainInit<I, F, T, E>` implements `pin_init::PinInit<T, E>`
             `pin_init::ChainPinInit<I, F, T, E>` implements `pin_init::PinInit<T, E>`
             `pin_init::__internal::AlwaysFail<T>` implements `pin_init::PinInit<T, ()>`
   = note: the full name for the type has been written to 'kernel.long-type-441004638990533407.txt'
   = note: consider using `--verbose` to print the full type name to the console
