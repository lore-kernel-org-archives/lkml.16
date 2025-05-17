Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6AB4201033;
	Sat, 17 May 2025 13:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747489355; cv=none; b=uxnEVRJ+ZMRnv9u+Bhur04z52LQN8WqGFF92cr1tjolgLUVBrjm9fahxit8Xny5He4fAD571CSNg/cloM6CXSKNyoqXjN2qiRr9m8VmeIuorj3wOWmSWLqdZR3AAXU0WQu+/8RJnLq+kfl4vfU9djSJvcrWXas+8l1vifPf/miw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747489355; c=relaxed/simple;
	bh=j1Kb9hcseywwUx0ewjkQBkbUnvUmTcu2zfHSS9Y8Tzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eUeQL1U3DDTUtmft2EnGpqIlQY0qeb8A3/GmcahQDwtgjqDGpRvi1Pdn4w9vRvPJg8sLCtfV9s6NIuBGvoeG4Bp0cBgGIfCXHS0wRaxu2JSEiNK5ipwBwgjjJ1cLJk1x4RS8uvB3KH8ARzs7Cn8vKnOOc7l4F43RYShOYzkZ4FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RGIyOagA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RGIyOagA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52D60C4CEE9;
	Sat, 17 May 2025 13:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747489355;
	bh=j1Kb9hcseywwUx0ewjkQBkbUnvUmTcu2zfHSS9Y8Tzs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RGIyOagASOnLC9s3DKpddxDF5gNRwWJZDRRoGyXYHpAhHyA7Amr/fpwlA4TBuFlhB
	 K924TpNGK4uEuCbxw88azPpAAipxHY1sDf/hZBt8J6Fdhr5A8HI+8+GFh641f/1S6z
	 mEfDKRWrrfx0/K75qBerSBGafOMd0ybpfzGclrh8KB+jsrhpTwGtKvoZ16zvRX67ug
	 WLtOcbwQ45WLNgNFM6wwoG1af2QYb2mhK1wBPjJMOCdH40VdKcJAtbqezxNkbgnT6c
	 VI8/8RZVllr+CsybnNTyZaJTIaW18DPQFzkdXIs1S9xwBDkBnYYhF3V+XC5RjsrmJ0
	 tQMLuCFt9qFNA==
Date: Sat, 17 May 2025 15:42:29 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lee Jones <lee@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Gerald =?iso-8859-1?Q?Wisb=F6ck?= <gerald.wisboeck@feather.ink>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] rust: miscdevice: add additional data to
 MiscDeviceRegistration
Message-ID: <aCiSRZjOETsD8MhX@pollux>
References: <20250517-b4-rust_miscdevice_registrationdata-v3-0-cdb33e228d37@gmail.com>
 <20250517-b4-rust_miscdevice_registrationdata-v3-1-cdb33e228d37@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517-b4-rust_miscdevice_registrationdata-v3-1-cdb33e228d37@gmail.com>

On Sat, May 17, 2025 at 01:33:49PM +0200, Christian Schrefl wrote:
> +pub struct MiscDeviceRegistration<T: MiscDevice> {
>      #[pin]
>      inner: Opaque<bindings::miscdevice>,
> +    #[pin]
> +    data: UnsafePinned<T::RegistrationData>,
>      _t: PhantomData<T>,
>  }

I recommend not to store data within a Registration type itself.

I know that this is designed with the focus on using misc device directly from
the module scope; and in this context it works great.

However, it becomes quite suboptimal when used from a driver scope. For
instance, if the misc device is registered within a platform driver's probe()
function.

I know this probably isn't supported yet. At least, I assume it isn't supported
"officially", given that the abstraction does not provide an option to set a
parent device. Yet I think we should consider it.

The reason this is suboptimal is that, from the callbacks of a misc device we
may want to access device resources from the platform device.

Since device resources have to be protected with Devres, we'd need to access
them with Revocable::try_access_with() for instance.

However, it would be much better if we had proof that the parent device of the
misc device (i.e. the platform device) is bound (i.e. provide a &Device<Bound>)
and hence are able to access device resources directly.

The only way to prove this, is to prove that the misc device registration is
guaranteed to be removed when the parent device (i.e. the platform driver) is
unbound.

And this we can only prove if we wrap MiscDeviceRegistration itself in a
Devres; we don't want MiscDeviceRegistration to out-live the driver it was
registered by anyways, so that's a free optimization.

If the data above is stored directly in the MiscDeviceRegistration however it
means that we can only access it through a Devres<MiscDeviceRegistration>, which
would be annoying.

To be fair, storing data in MiscDeviceRegistration is not the main issue of why
this is suboptimal in driver, but it adds to the problem.

In general, the design of MiscDeviceRegistration is a bit suboptimal to be used
within drivers. For drivers it works much better when the Registration type
really *only* represents the state of a thing being registered, such that we can
guard it with Devres *without* any downsides or additional complexity. One
example for that would be the drm::driver::Registration [1].

If we want misc device to work optimally with drivers as well, we need to split
things in two types: `misc::Device`:

	struct Device<T: MiscDevice> {
	   #[pin]
	   misc: Opaque<bindings::miscdevice>,
	   #[pin]
	   data: UnsafePinned<T::RegistrationData>,
	   _t: PhantomData<T>,
	}

and `misc::Registration`:

	struct Registration(ARef<misc::Device>);


and make the `misc::Device` own the data, not the `misc::Registration`.

This way we can wrap misc::Registration into a Devres, with all guarantees it
gives us and an no downsides.

I'm not saying that I want to block this patch, especially given that using the
misc device abstraction doesn't seem to be supported to be used from drivers,
but please understand that the design of the misc device abstraction, while it
works fine for the module scope, really is sub-optimal for the use within
drivers and hence should be re-worked.

Can we please either do the re-work right away or add a proper TODO?

[1] https://gitlab.freedesktop.org/drm/nova/-/blob/nova-next/rust/kernel/drm/driver.rs?ref_type=heads#L121
