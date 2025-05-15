Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1D261FCE;
	Thu, 15 May 2025 16:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747326242; cv=none; b=lMLWsQIhMIp6O2tim4OlMrq1ZBDiIv6r32JuSU+5B4ftS1ySWpyGYUQvMBUI8uWzsH0yVIIwvS0sdrGaSl/MG7jntbp3gaAN6K7hgkl4+wND1wuxBp+XoTaKrRPb65InindKYj1xs2J+NK0Nw9PApAJuwxMBfWQbeQEi/dXfbjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747326242; c=relaxed/simple;
	bh=xaJeKpXzMkCVEJ82tQivYy7KG4dkYjUuJxcUxvweYGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UFRyrSB17VxmTJZuTreq8VQ89hxQ7S9YowkEILlRXCzisdLBzt4qbcCX3OLlXltHka4Y6M/nDV3PD2prvlubD8f19fZds2hp2FlQUcvnCwiJXeOQkuPMiXdjggwUQKDPbp2PTPu37TRhbUES8j8aoAqRmJRxp568X5USdWIKmjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cSXM1Xx0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cSXM1Xx0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A34A1C4CEEB;
	Thu, 15 May 2025 16:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747326242;
	bh=xaJeKpXzMkCVEJ82tQivYy7KG4dkYjUuJxcUxvweYGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cSXM1Xx0CD6ZH+s0d0tP2nkzQCfULH7eu5NR8FRZc9Pfpf2cFXtHOUWZr020BEjp6
	 qCSCAVaCP7EN9fhn0X1lkFiLizocnFcsBZ/djsViCVqC7L1jLkoDAaVsLbkbHp31ve
	 yTtqLNW5q9l6eCHag78wXFYqv0PlyxR6c/9qjJqoExb4AvNDpIYwTV/kRcVZ2YygAF
	 qjVxw2yipkVkLPhGuraT6SL5tZn/0l+oV2nt6/nt18dtfDK2KAQqoAXLK3YImB+3Ea
	 idjN/ZiIdJUSQx/vsZE8Wgo6y/F0rA38N5uNMjuribxT63l0coLvjK30/5MI9NMons
	 g7RkwKFw7FmtQ==
Date: Thu, 15 May 2025 18:23:55 +0200
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
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v8 3/3] rust: platform: allow ioremap of platform
 resources
Message-ID: <aCYVG-VVdJXYnSTt@pollux>
References: <20250509-topics-tyr-platform_iomem-v8-0-e9f1725a40da@collabora.com>
 <20250509-topics-tyr-platform_iomem-v8-3-e9f1725a40da@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509-topics-tyr-platform_iomem-v8-3-e9f1725a40da@collabora.com>

On Fri, May 09, 2025 at 05:29:48PM -0300, Daniel Almeida wrote:
> +impl Device<device::Core> {
> +    /// Maps a platform resource through ioremap() where the size is known at
> +    /// compile time.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```no_run
> +    /// # use kernel::{bindings, c_str, platform};
> +    /// # use kernel::device::Core;
> +    ///
> +    ///
> +    /// fn probe(pdev: &mut platform::Device<Core>, /* ... */) -> Result<()> {

Should be &platform::Device<Core> (i.e. not mutable). You should also be able to
just use `Result` as return type. Though, it would probably be better to use the
real probe() function here, i.e.

	# struct Driver;

	impl platform::Driver for SampleDriver {
	   # type IdInfo = ();
	   # const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>> = None;

	   fn probe(
	      pdev: &platform::Device<Core>,
	      info: Option<&Self::IdInfo>,
	   ) -> Result<Pin<KBox<Self>>> {
	      ...
	   }
	}

> +    ///     let offset = 0; // Some offset.
> +    ///
> +    ///     // If the size is known at compile time, use `ioremap_resource_sized`.
> +    ///     // No runtime checks will apply when reading and writing.
> +    ///     let resource = pdev.resource(0).ok_or(ENODEV)?;
> +    ///     let iomem = pdev.ioremap_resource_sized::<42>(&resource)?;
> +    ///
> +    ///     // Read and write a 32-bit value at `offset`. Calling `try_access()` on
> +    ///     // the `Devres` makes sure that the resource is still valid.
> +    ///     let data = iomem.try_access().ok_or(ENODEV)?.read32_relaxed(offset);
> +    ///
> +    ///     iomem.try_access().ok_or(ENODEV)?.write32_relaxed(data, offset);

Since this won't land for v6.16, can you please use Devres::access() [1]
instead? I.e.

	let iomem = pdev.ioremap_resource_sized::<42>(&resource)?;
	let io = Devres::access(pdev.as_ref())?;

	let data = io.read32_relaxed(offset);
	io.write32_relaxed(data, offset);

Devres::access() is in nova-next and lands in v6.16.

[1] https://gitlab.freedesktop.org/drm/nova/-/commit/f301cb978c068faa8fcd630be2cb317a2d0ec063

> +    ///
> +    ///     # Ok::<(), Error>(())
> +    /// }
> +    /// ```
> +    pub fn ioremap_resource_sized<const SIZE: usize>(
> +        &self,
> +        resource: &Resource,
> +    ) -> Result<Devres<IoMem<SIZE>>> {
> +        IoMem::new(resource, self.as_ref())
> +    }
> +
> +    /// Same as [`Self::ioremap_resource_sized`] but with exclusive access to the
> +    /// underlying region.
> +    pub fn ioremap_resource_exclusive_sized<const SIZE: usize>(
> +        &self,
> +        resource: &Resource,
> +    ) -> Result<Devres<ExclusiveIoMem<SIZE>>> {
> +        ExclusiveIoMem::new(resource, self.as_ref())
> +    }
> +
> +    /// Maps a platform resource through ioremap().
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```no_run
> +    /// # use kernel::{bindings, c_str, platform};
> +    /// # use kernel::device::Core;
> +    ///
> +    /// fn probe(pdev: &mut platform::Device<Core>, /* ... */) -> Result<()> {
> +    ///     let offset = 0; // Some offset.
> +    ///
> +    ///     // Unlike `ioremap_resource_sized`, here the size of the memory region
> +    ///     // is not known at compile time, so only the `try_read*` and `try_write*`
> +    ///     // family of functions should be used, leading to runtime checks on every
> +    ///     // access.
> +    ///     let resource = pdev.resource(0).ok_or(ENODEV)?;
> +    ///     let iomem = pdev.ioremap_resource(&resource)?;
> +    ///
> +    ///     let data = iomem.try_access().ok_or(ENODEV)?.try_read32_relaxed(offset)?;
> +    ///
> +    ///     iomem.try_access().ok_or(ENODEV)?.try_write32_relaxed(data, offset)?;
> +    ///
> +    ///     # Ok::<(), Error>(())
> +    /// }

Same as above.

> +    /// ```
> +    pub fn ioremap_resource(&self, resource: &Resource) -> Result<Devres<IoMem<0>>> {
> +        self.ioremap_resource_sized::<0>(resource)
> +    }
> +
> +    /// Same as [`Self::ioremap_resource`] but with exclusive access to the underlying
> +    /// region.
> +    pub fn ioremap_resource_exclusive(
> +        &self,
> +        resource: &Resource,
> +    ) -> Result<Devres<ExclusiveIoMem<0>>> {
> +        self.ioremap_resource_exclusive_sized::<0>(resource)
> +    }
> +
> +    /// Returns the resource at `index`, if any.
> +    pub fn resource(&self, index: u32) -> Option<&Resource> {
> +        // SAFETY: `self.as_raw()` returns a valid pointer to a `struct platform_device`.
> +        let resource = unsafe {
> +            bindings::platform_get_resource(self.as_raw(), bindings::IORESOURCE_MEM, index)
> +        };
> +
> +        if resource.is_null() {
> +            return None;
> +        }
> +
> +        // SAFETY: `resource` is a valid pointer to a `struct resource` as
> +        // returned by `platform_get_resource`.
> +        Some(unsafe { Resource::from_ptr(resource) })
> +    }
> +
> +    /// Returns the resource with a given `name`, if any.
> +    pub fn resource_by_name(&self, name: &CStr) -> Option<&Resource> {

This method should be a separate patch, no? Also, I think this one can go into
the `impl<Ctx: device::DeviceContext> Device<Ctx>` block, since it should be
valid to call from any device context.
