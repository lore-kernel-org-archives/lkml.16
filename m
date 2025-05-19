Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1494C92;
	Mon, 19 May 2025 10:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747651317; cv=none; b=O8hFs0tdXIOedVsZt52B4mfZH8GBZNrPCTAeRORUAVhI5Aytt8CGq9OLx4SsiDH+RkR33NPqgXE8lLMTKxiFVaZ7VhpaowpNx+s0hHB1XyLJgnMwhdAgiVYfYojg9e7tbN3E/9SGbHa6bPfJCXE+br89xablERNe/Gs9RDlOY3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747651317; c=relaxed/simple;
	bh=5HH3fJn0J5874h+/KfyOhyU9cdBBmd9yu2Ku3ft0c54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nkhICMMB0Rqvz55WOI4PKZIDQlJX/WpuYJ11W9tv1cOVS2vzWlMuh/fAci1Pj+cgB/NtdtvYXyQsBF8k6Uef00c2hcDEIUTq0b0dyxupS7mcbNiaUb5O2vY+MucaL1/fd0kkqb14qPGvrdI3REd8Ky/zjN562Nv4Vo7wYxEidD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uH4bXIiv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uH4bXIiv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2DAFC4CEF0;
	Mon, 19 May 2025 10:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747651316;
	bh=5HH3fJn0J5874h+/KfyOhyU9cdBBmd9yu2Ku3ft0c54=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uH4bXIiveosYxZbhc1l2Mv+zcN+EeuSPcuHXq6jEjamNvx8qX+Oa9m2/bdOaBWVUi
	 yvNnT/eKJ8KfP+49+Bh9Y4xoNbf3T0Okc+CrAsUNh410lStQZ/GthaPoe3mVF60r2m
	 A/PjsEw3jCFTzdw4W3d3K4PX3cphyydvkdyc6Q0HHPSvRASSQ9EeCNdthYFUe/0xd5
	 Mmp3sTnAd7IHY3TD8jHYJ2Qof2t2kRO1TTIYKRUQ9S4O9Utug9SqT1xr1dFcslyaCZ
	 ZDsPsDYM9bDQ1cRkySXe/teU5MzW4fHrYF/oR7ah8sjDdyuPCbUa9ToNsowXe/IE4n
	 VTvYqwO0o6Ttw==
Date: Mon, 19 May 2025 12:41:50 +0200
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
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 2/2] rust: platform: add irq accessors
Message-ID: <aCsK7s0qepzIiA-l@pollux>
References: <20250514-topics-tyr-request_irq-v3-0-d6fcc2591a88@collabora.com>
 <20250514-topics-tyr-request_irq-v3-2-d6fcc2591a88@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-topics-tyr-request_irq-v3-2-d6fcc2591a88@collabora.com>

On Wed, May 14, 2025 at 04:20:52PM -0300, Daniel Almeida wrote:
> These accessors can be used to retrieve an IRQ from a platform device by
> index or name. The IRQ can then be used to request the line using
> irq::request::Registration::register() and
> irq::request::ThreadedRegistration::register().
> 
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> ---
>  rust/kernel/platform.rs | 52 +++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 
> diff --git a/rust/kernel/platform.rs b/rust/kernel/platform.rs
> index 4917cb34e2fe8027d3d861e90de51de85f006735..1acaebf38d99d06f93fa13b0b356671ea77ed97a 100644
> --- a/rust/kernel/platform.rs
> +++ b/rust/kernel/platform.rs
> @@ -188,6 +188,58 @@ impl Device {
>      fn as_raw(&self) -> *mut bindings::platform_device {
>          self.0.get()
>      }
> +
> +    /// Returns an IRQ for the device by index.
> +    pub fn irq_by_index(&self, index: u32) -> Result<u32> {
> +        // SAFETY: `self.as_raw` returns a valid pointer to a `struct platform_device`.
> +        let res = unsafe { bindings::platform_get_irq(self.as_raw(), index) };
> +
> +        if res < 0 {
> +            return Err(Error::from_errno(res));
> +        }
> +
> +        Ok(res as u32)
> +    }
> +
> +    /// Same as [`Self::irq_by_index`] but does not print an error message if an IRQ
> +    /// cannot be obtained.
> +    pub fn optional_irq_by_index(&self, index: u32) -> Result<u32> {
> +        // SAFETY: `self.as_raw` returns a valid pointer to a `struct platform_device`.
> +        let res = unsafe { bindings::platform_get_irq_optional(self.as_raw(), index) };
> +
> +        if res < 0 {
> +            return Err(Error::from_errno(res));
> +        }
> +
> +        Ok(res as u32)
> +    }
> +
> +    /// Returns an IRQ for the device by name.
> +    pub fn irq_by_name(&self, name: &CStr) -> Result<u32> {
> +        // SAFETY: `self.as_raw` returns a valid pointer to a `struct platform_device`.
> +        let res = unsafe { bindings::platform_get_irq_byname(self.as_raw(), name.as_char_ptr()) };
> +
> +        if res < 0 {
> +            return Err(Error::from_errno(res));
> +        }
> +
> +        Ok(res as u32)
> +    }
> +
> +    /// Same as [`Self::irq_by_name`] but does not print an error message if an IRQ
> +    /// cannot be obtained.
> +    pub fn optional_irq_by_name(&self, name: &CStr) -> Result<u32> {
> +        // SAFETY: `self.as_raw` returns a valid pointer to a `struct platform_device`.
> +        let res = unsafe {
> +            bindings::platform_get_irq_byname_optional(self.as_raw(), name.as_char_ptr())
> +        };
> +
> +        if res < 0 {
> +            return Err(Error::from_errno(res));
> +        }
> +
> +        Ok(res as u32)
> +    }

I don't like the indirection of claiming a u32 representing the IRQ number from
a bus device and stuffing it into an irq::Registration.

It would be better we we'd make it impossible (or at least harder) for a driver
to pass the wrong number to irq::Registration.

I see two options:

  1) Make the platform::Device accessors themselves return an
     irq::Registration.

  2) Make the platform::Device accessors return some kind of transparent cookie,
     that drivers can't create themselves that can be fed into the
     irq::Registration.

My preference would be 1) if there's no major ergonomic issue with that.
