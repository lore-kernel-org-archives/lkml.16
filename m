Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4A72063FD;
	Thu, 15 May 2025 15:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747324452; cv=none; b=EIFWddbjz4+bO1XaJ0oE5n4gcoOOgfXziLcckwQCb6K1YoGwrC4o4WKQwTSBNu0x3xItN1Gj9p5a4VHT1CKy303H9z3aSIg4AHRPf+PAFusHFn3mzYti6g4xHfR69nVbc5ZUB+wda7lACvOVtVht/OHStr7ndGK932Qprxc4HyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747324452; c=relaxed/simple;
	bh=8hI1qe2hxBqeFh6uUNoLq9a1bdmjOHivnrCUFrEcMfk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c+aVsqWH94KZ0QthBoTqWNMTfGQxV5gK58EXVZYGkD6J4/kI1X16K/DFCQmDmQHW7kjKe/tiBhD5PeHyvTv7lrPYSFyRTyz7PC/IcJJAr7vJqEhhVo7JJc+2Bavh36CGDOGQgbb1Bz8Lj4YmwQSDDH1XOcchA/rvwnjdMKRCEKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NI/+t4av; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NI/+t4av"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34634C4CEE7;
	Thu, 15 May 2025 15:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747324452;
	bh=8hI1qe2hxBqeFh6uUNoLq9a1bdmjOHivnrCUFrEcMfk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NI/+t4avubeyf6S8afXk7WaFKgpu0T6ypfHSXP5Bcybt9fxwj4W03EoflMXiazQ1y
	 6vbGyGKHMLLwBf6TmlOvpGG0i90iXt7CzgRq5oCL5390/Tiycr9oZZDTlBTDkZELcq
	 BgIBFMQPMJg6riN6O7153Q46oEsS1IxR8qrLoH24B1Yg7A3x08v5Cok85aZHZk1Eon
	 Xec5HZL91WbakSVH8/gUztdWY0TuioT1QTJNKcAxI3NoVbI8S0hO+aCA6Kld+piLMv
	 lV2jHzzqO9hSZFUTPIwR4K/40+AOIubP3Cs4k3+X6KQ50yJ6Tmj+cWbYDVliKNW6/t
	 q6UG4ZGzAUf4g==
Date: Thu, 15 May 2025 17:53:57 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Ying Huang <huang.ying.caritas@gmail.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Fiona Behrens <me@kloenk.dev>
Subject: Re: [PATCH v8 1/3] rust: io: add resource abstraction
Message-ID: <aCYOFbVn8LcOpWPf@pollux>
References: <20250509-topics-tyr-platform_iomem-v8-0-e9f1725a40da@collabora.com>
 <20250509-topics-tyr-platform_iomem-v8-1-e9f1725a40da@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509-topics-tyr-platform_iomem-v8-1-e9f1725a40da@collabora.com>

On Fri, May 09, 2025 at 05:29:46PM -0300, Daniel Almeida wrote:
> +#[cfg(CONFIG_HAS_IOPORT)]
> +/// Returns a reference to the global `ioport_resource` variable.
> +pub fn ioport_resource() -> &'static Resource {
> +    // SAFETY: `bindings::ioport_resoure` has global lifetime and is of type Resource.
> +    unsafe { Resource::from_ptr(core::ptr::addr_of_mut!(bindings::ioport_resource)) }

Should be possible to use `&raw mut`.

> +}
> +
> +#[cfg(CONFIG_HAS_IOMEM)]
> +/// Returns a reference to the global `iomem_resource` variable.
> +pub fn iomem_resource() -> &'static Resource {
> +    // SAFETY: `bindings::iomem_resoure` has global lifetime and is of type Resource.
> +    unsafe { Resource::from_ptr(core::ptr::addr_of_mut!(bindings::iomem_resource)) }

Same here.

> +/// A resource abstraction.
> +///
> +/// # Invariants
> +///
> +/// `Resource` is a transparent wrapper around a valid `bindings::resource`.
> +#[repr(transparent)]
> +pub struct Resource(Opaque<bindings::resource>);
> +
> +impl Resource {
> +    /// Creates a reference to a [`Resource`] from a valid pointer.
> +    ///
> +    /// # Safety
> +    ///
> +    /// The caller must ensure that for the duration of 'a, the pointer will
> +    /// point at a valid `bindings::resource`
> +    ///
> +    /// The caller must also ensure that the `Resource` is only accessed via the
> +    /// returned reference for the duration of 'a.
> +    pub(crate) const unsafe fn from_ptr<'a>(ptr: *mut bindings::resource) -> &'a Self {

Throughout the tree, functions with this signature are usually called as_ref().
