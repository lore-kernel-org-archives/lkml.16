Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519A72F4337;
	Thu, 12 Jun 2025 16:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749745218; cv=none; b=gYXj1zE3D+zxvFajwxrQELih6eIjakZIkJga35TP1AlrpPtQmPTx/z/zEQh9zL+GA3gLA28hFk+XZ1bXPcqk8+AqbC8NxSkNH4GICZnysMJw+pI7byiylqI4UrImf3Y4rnejIJ8ZoTnRvOWwrIF6eQMfm357Ka2SFGeKYgqgWs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749745218; c=relaxed/simple;
	bh=Exbz9bEFkUebfba+VJlIAq8RWt6MqPSbghPlez9tlrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JYW1xA2nCvawqWmcVz5WLA1H5XCqd8cyzYrAa1tYL5UKwokHmKqs2EG0uyCQqBlcTQi+oa/Bs7FsioSomJQCm+/PsVbivFNl6tD82Eagaf8uwS8fKzCpkC31ztgA96cwOxKGo/jpWQGnSrpA/dg8GShn9ZogU/ac9P0aDlJjJRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tHkLtVUU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tHkLtVUU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1098C4CEEE;
	Thu, 12 Jun 2025 16:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749745215;
	bh=Exbz9bEFkUebfba+VJlIAq8RWt6MqPSbghPlez9tlrk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tHkLtVUUXDvGPsKDVj59OX6bUq18Jv8y7VFQ03dNLTxRQBIKPamF485hsi9kbCKHT
	 +wdJsbLDw7RhcH845So/upy4bnCpUIkBEiZOVUpS0lT25pZmqhULv29W9XFWYBiAnx
	 M9T4DG36Mo0BnceqDwNP9Nox3ekWo4sQHUbT1i+H6uQTh4vZvSyLcE6chmpDENi474
	 PoHsGf9R6rccME0lQ7nZG7TDgcacT89+M8OoDYoh0KO1SDTED6/izxE/bixrdBi2G/
	 GiQ/I2482ByHNdRdMHURwJxAKorFfx/h7kN2QUyBi+fZFlAe495Ry8QsB0k3hLcclW
	 /PVafb4VbpWyw==
Date: Thu, 12 Jun 2025 18:20:10 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Benno Lossin <lossin@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org,
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] rust: revocable: support fallible PinInit types
Message-ID: <aEr-OnKiL5MKzur2@cassiopeiae>
References: <20250612145145.12143-1-dakr@kernel.org>
 <20250612145145.12143-2-dakr@kernel.org>
 <DAKO8MMSCUE4.1WVR6SBADGP8W@kernel.org>
 <aEr5FNDaueo5SG5R@cassiopeiae>
 <DAKOUVS4YP4L.3I6FD9JKN02EU@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DAKOUVS4YP4L.3I6FD9JKN02EU@kernel.org>

On Thu, Jun 12, 2025 at 06:17:40PM +0200, Benno Lossin wrote:
> On Thu Jun 12, 2025 at 5:58 PM CEST, Danilo Krummrich wrote:
> > On Thu, Jun 12, 2025 at 05:48:36PM +0200, Benno Lossin wrote:
> >> On Thu Jun 12, 2025 at 4:51 PM CEST, Danilo Krummrich wrote:
> >> > diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
> >> > index fa1fd70efa27..41b8fe374af6 100644
> >> > --- a/rust/kernel/revocable.rs
> >> > +++ b/rust/kernel/revocable.rs
> >> > @@ -82,8 +82,11 @@ unsafe impl<T: Sync + Send> Sync for Revocable<T> {}
> >> >  
> >> >  impl<T> Revocable<T> {
> >> >      /// Creates a new revocable instance of the given data.
> >> > -    pub fn new(data: impl PinInit<T>) -> impl PinInit<Self> {
> >> > -        pin_init!(Self {
> >> > +    pub fn new<E>(data: impl PinInit<T, E>) -> impl PinInit<Self, Error>
> >> > +    where
> >> > +        Error: From<E>,
> >> 
> >> I don't think we need this bound as you don't use it in the function
> >> body.
> >
> > I think it's needed by try_pin_init!() below, no?
> >
> > Without it I get the compilation error in [1].
> >
> >> > +    {
> >> > +        try_pin_init!(Self {
> >> >              is_available: AtomicBool::new(true),
> >> >              data <- Opaque::pin_init(data),
> >> >          })
> 
> Does it work with this?
> 
>     try_pin_init!(Self {
>         is_available: AtomicBool::new(true),
>         data <- Opaque::pin_init(data),
>     }? E)

Yes, it does -- thanks!
