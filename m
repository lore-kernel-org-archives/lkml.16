Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D4F23497B;
	Sat, 31 May 2025 10:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748687624; cv=none; b=ju9+EF0FjJIWrhecBHr7oGHMDwk/fWO0yWAaUmhdyiBpnn17tjEVHm8ptwlmisfSQ2q1XvzezECE1fdkhuBnIAfgid0LUc0Xk2/FoLvTcGXggxkNwaieYjdKgIQH9hDiJdSc9Nvxeko5nt7h2EDal2/aUSftg8h9SUpjjebwI2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748687624; c=relaxed/simple;
	bh=ULGIwiD4vDo7U1PKZxA32bG7xyqxYpPB3XqFFCKW09Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KEVMRa4M2iQSgbd8b8+fhhIicBW7KjSzdcmI+ymcmp4/zquIxnJf2WWc4ECy2cfpVRvtlSQT0ZfR1gXGr8MfOGjioJ+P8d4VtuI1f4ybT//cKg4yct6BIcYvi4YX1Hdv+DBdxAJWhgGLHQUVo1fSuH4BtJTbT81TNhEsDHWYVUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e9B/RQmo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e9B/RQmo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C709C4CEE3;
	Sat, 31 May 2025 10:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748687623;
	bh=ULGIwiD4vDo7U1PKZxA32bG7xyqxYpPB3XqFFCKW09Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e9B/RQmoUMh2eAUOoLIgYeY5wVp+9YYoAT1lM9sjFmY6Av5O8mB4kivJ4lGawgB+t
	 +5+y6qarQw8t3yCzxKAzoI71lnGvyYTtnrPJVhjAN/+oHBkG1qphXSH22QcUkSB3cW
	 N8eEteiMMMrPMO5XHTh4pYcQ8qqJs6zZyR0Bef0K1MmK2DP9xzcenGmR5iI/6ohYjM
	 9BDeanWYkarqr3xgw2H7oOqo+EtlDRHUyZuvgS+YtlkZneGhVzHMp6S4OnKhbeORH9
	 73SNPt+oV7gc2MoXfxwXhSYPrKvVIErATUtsqVwEex5bugrUkuFbg07Ev4/Rvg6WG7
	 bFRx7NU02cq5Q==
Date: Sat, 31 May 2025 12:33:37 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Benno Lossin <lossin@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org,
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	chrisi.schrefl@gmail.com, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] rust: miscdevice: properly support device drivers
Message-ID: <aDrbAWtDRPP80-xO@pollux>
References: <20250530142447.166524-1-dakr@kernel.org>
 <20250530142447.166524-6-dakr@kernel.org>
 <DA9RLBPS7QKE.3CGXHMYG1CDOU@kernel.org>
 <aDouYRU-xSjfgMzJ@pollux>
 <DAA6VHUTDC13.3FLLGNXYINO9I@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DAA6VHUTDC13.3FLLGNXYINO9I@kernel.org>

On Sat, May 31, 2025 at 10:05:28AM +0200, Benno Lossin wrote:
> On Sat May 31, 2025 at 12:17 AM CEST, Danilo Krummrich wrote:
> > On Fri, May 30, 2025 at 10:06:55PM +0200, Benno Lossin wrote:
> >> On Fri May 30, 2025 at 4:24 PM CEST, Danilo Krummrich wrote:
> >> > -impl<T: MiscDevice> MiscDeviceRegistration<T> {
> >> > -    /// Register a misc device.
> >> > -    pub fn register(
> >> > +impl<T: MiscDevice> RawDeviceRegistration<T> {
> >> > +    fn new<'a>(
> >> >          opts: MiscDeviceOptions,
> >> > -        data: impl PinInit<T::RegistrationData, Error>,
> >> > -    ) -> impl PinInit<Self, Error> {
> >> > +        parent: Option<&'a Device<Bound>>,
> >> > +        data: &'a T::RegistrationData,
> >> > +    ) -> impl PinInit<Self, Error> + 'a
> >> > +    where
> >> > +        T: 'a,
> >> > +    {
> >> >          try_pin_init!(Self {
> >> > -            data <- Opaque::pin_init(data),
> >> > +            // INVARIANT: `Self` is always embedded in a `MiscDeviceRegistration<T>`, hence `data`
> >> > +            // is guaranteed to be valid for the entire lifetime of `Self`.
> >> > +            data: NonNull::from(data),
> >> 
> >> Both the argument in the INVARIANT comment and way this works are a bit
> >> flawed.
> >
> > Why is the argument flawed? Let's say we go with your proposal below, what would
> > the safety requirement for RawDeviceRegistration::new and the invariant of
> > RawDeviceRegistration look like? Wouldn't it be the exact same argument?
> 
> So what I write below it not really true. But the argument relies on the
> fact that `data` is pointing to a value that will stay alive for the
> duration of the existence of `self`. That should be a safety requirement
> of `new` (even if we take a reference as an argument).

Ok, that's fair -- I'll add the safety requirement.

> >> Instead, I'd recommend directly taking the `NonNull` as a
> >> parameter. Yes the function will need to be `unsafe`, but the lifetime
> >> that you're creating below only lives for `'a`, but the object might
> >> live much longer. You might still be fine, but I'd just recommend
> >> staying in raw pointer land (or in this case `NonNull`).
