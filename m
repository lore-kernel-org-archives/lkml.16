Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F51521B8F6;
	Wed,  4 Jun 2025 22:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749075725; cv=none; b=eUVJovrLnYpzf+1HvIJOBPUbZGvAtY3i1mqzfZwAc0MQavnk53T8KmibUuyB1Ke2J2I0NsDCQqTBsxcxO9KPr5EER0KzDWIELYWKJgDiv35uDOIdFMQ2tkcXiUWEm/u08wXIL1iNu+TH3pYxbgLuHjFZkjfQcPBefQ3NCED1H8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749075725; c=relaxed/simple;
	bh=8TjFCS/fAg3ZcDtNDiYcyOY8DbhbVBmdojkwITkhdxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uy/yF/FRT0wKPWrg3JdRRTFS7ggUMrTLS4s1N1w9EIpDzLOFRxaKtVMDcbNEDWz66HIAply9Pp7PUiTZ7emKoAtloIipHzhPl/bHx7pT3M2DIRtlaPPMT2F7c2O5Yu6F7HMOCgliE7oaWC4C0tobvckSXClyQeFTmzLmvt2YlVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IRPiOuv3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IRPiOuv3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 159A7C4CEE4;
	Wed,  4 Jun 2025 22:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749075725;
	bh=8TjFCS/fAg3ZcDtNDiYcyOY8DbhbVBmdojkwITkhdxc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IRPiOuv331lPf9W4OBi15XFLN6Y1l2o0DenF3XNVk4g6hyBj7pwh2lbZn08p51W4W
	 pm7Y63HpYUFqC3fo13bJb/sMlJhvAhRaSCp0xzGTKHmsb9ry1iVfZ2v5ZBOJ6SxYfK
	 xF1b3yHjd8aQs0exwu4OokVlGHN6bAK0nUV8GukrNPbGRaqJO37Qz1hW24mf6BFxEG
	 tQBlPOkcOCmDICJwkyBhv4AL0970jqixSTPY7dnpYSaulH/r3n7nRSF9lM9srWSpsW
	 vGVcaQMlgZ15B0/LMWYeeBPo6rO4TnoIsMfw3fJaDHtq4+aNK1ug0LUZ4V4EkESZ1c
	 KAEa6Jy2nOh/A==
Date: Thu, 5 Jun 2025 00:21:58 +0200
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
Subject: Re: [PATCH v9 4/4] rust: platform: allow ioremap of platform
 resources
Message-ID: <aEDHBrIVNcMS7j9O@pollux>
References: <20250603-topics-tyr-platform_iomem-v9-0-a27e04157e3e@collabora.com>
 <20250603-topics-tyr-platform_iomem-v9-4-a27e04157e3e@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603-topics-tyr-platform_iomem-v9-4-a27e04157e3e@collabora.com>

On Tue, Jun 03, 2025 at 12:05:30PM -0300, Daniel Almeida wrote:
> The preceding patches added support for resources, and for a general
> IoMem abstraction, but thus far there is no way to access said IoMem
> from drivers, as its creation is unsafe and depends on a resource that
> must be acquired from some device first.
> 
> Now, allow the ioremap of platform resources themselves, thereby making
> the IoMem available to platform drivers.
> 
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> ---
>  rust/kernel/platform.rs | 123 +++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 121 insertions(+), 2 deletions(-)
> 
> diff --git a/rust/kernel/platform.rs b/rust/kernel/platform.rs
> index 427bc706f4349083b6bab81a02cb8ed803903590..57414fd0db296e412f45fbefd7707b338b37332a 100644
> --- a/rust/kernel/platform.rs
> +++ b/rust/kernel/platform.rs
> @@ -5,9 +5,14 @@
>  //! C header: [`include/linux/platform_device.h`](srctree/include/linux/platform_device.h)
>  
>  use crate::{
> -    bindings, container_of, device, driver,
> +    bindings, container_of, device,
> +    devres::Devres,
> +    driver,
>      error::{to_result, Result},
> -    io::resource::Resource,
> +    io::{
> +        mem::{ExclusiveIoMem, IoMem},
> +        resource::Resource,

I think we should add

	pub use resource::Resource;

into io.rs, such that we can refer to this as ::kernel::io::Resource.

> +    },
>      of,
>      prelude::*,
>      str::CStr,
> @@ -227,6 +232,120 @@ pub fn resource_by_name(&self, name: &CStr) -> Option<&Resource> {
>      }
>  }
>  
> +impl Device<device::Bound> {
> +    /// Maps a platform resource where the size is known at compile time.
> +    ///
> +    /// This uses the
> +    /// [`ioremap()`](https://docs.kernel.org/driver-api/device-io.html#getting-access-to-the-device)
> +    /// C API.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```no_run
> +    /// # use kernel::{bindings, c_str, platform, of, device::Core};
> +    /// # struct SampleDriver;
> +    ///
> +    /// impl platform::Driver for SampleDriver {
> +    ///    # type IdInfo = ();
> +    ///    # const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>> = None;
> +    ///
> +    ///    fn probe(
> +    ///       pdev: &platform::Device<Core>,
> +    ///       info: Option<&Self::IdInfo>,
> +    ///    ) -> Result<Pin<KBox<Self>>> {
> +    ///       let offset = 0; // Some offset.
> +    ///
> +    ///       // If the size is known at compile time, use [`Self::iomap_resource_sized`].
> +    ///       //
> +    ///       // No runtime checks will apply when reading and writing.
> +    ///       let resource = pdev.resource_by_index(0).ok_or(ENODEV)?;
> +    ///       let iomem = pdev.iomap_resource_sized::<42>(&resource)?;
> +    ///       let io = iomem.access(pdev.as_ref())?;
> +    ///
> +    ///       // Read and write a 32-bit value at `offset`. Calling `try_access()` on
> +    ///       // the `Devres` makes sure that the resource is still valid.
> +    ///       let data = io.read32_relaxed(offset);
> +    ///
> +    ///       iomem.try_access().ok_or(ENODEV)?.write32_relaxed(data, offset);

io.write32_relaxed(data, offset);

> +    ///
> +    ///       # let sample_driver = KBox::new(SampleDriver, GFP_KERNEL).map_err(|_| ENOMEM)?;

Why the map_err()? We have

	impl From<AllocError> for Error {
	    fn from(_: AllocError) -> Error {
	        code::ENOMEM
	    }
	}

so you shouldn't need that.

Also, please just write this as

	# Ok(KBox::new(SampleDriver, GFP_KERNEL)?.into())

> +    ///       # Ok(sample_driver.into())
> +    ///     }
> +    /// }
> +    /// ```
> +    pub fn iomap_resource_sized<const SIZE: usize>(
> +        &self,
> +        resource: &Resource,
> +    ) -> Result<Devres<IoMem<SIZE>>> {
> +        IoMem::new(resource, self.as_ref())
> +    }
> +
> +    /// Same as [`Self::iomap_resource_sized`] but with exclusive access to the
> +    /// underlying region.
> +    ///
> +    /// This uses the
> +    /// [`ioremap()`](https://docs.kernel.org/driver-api/device-io.html#getting-access-to-the-device)
> +    /// C API.
> +    pub fn iomap_resource_exclusive_sized<const SIZE: usize>(
> +        &self,
> +        resource: &Resource,
> +    ) -> Result<Devres<ExclusiveIoMem<SIZE>>> {
> +        ExclusiveIoMem::new(resource, self.as_ref())
> +    }
> +
> +    /// Maps a platform resource through iomap().
> +    ///
> +    /// This uses the
> +    /// [`ioremap()`](https://docs.kernel.org/driver-api/device-io.html#getting-access-to-the-device)
> +    /// C API.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```no_run
> +    /// # use kernel::{bindings, c_str, platform, of, device::Core};
> +    /// # struct SampleDriver;
> +    ///
> +    /// impl platform::Driver for SampleDriver {
> +    ///    # type IdInfo = ();
> +    ///    # const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>> = None;
> +    ///
> +    ///    fn probe(
> +    ///       pdev: &platform::Device<Core>,
> +    ///       info: Option<&Self::IdInfo>,
> +    ///    ) -> Result<Pin<KBox<Self>>> {
> +    ///       let offset = 0; // Some offset.
> +    ///
> +    ///       // Unlike [`Self::iomap_resource_sized`], here the size of the memory region
> +    ///       // is not known at compile time, so only the `try_read*` and `try_write*`
> +    ///       // family of functions should be used, leading to runtime checks on every
> +    ///       // access.
> +    ///       let resource = pdev.resource_by_index(0).ok_or(ENODEV)?;
> +    ///       let iomem = pdev.iomap_resource(&resource)?;
> +    ///       let io = iomem.access(pdev.as_ref())?;
> +    ///
> +    ///       let data = io.try_read32_relaxed(offset)?;
> +    ///
> +    ///       io.try_write32_relaxed(data, offset)?;
> +    ///
> +    ///       # let sample_driver = KBox::new(SampleDriver, GFP_KERNEL).map_err(|_| ENOMEM)?;

Same as above.

> +    ///       # Ok(sample_driver.into())
> +    ///     }
> +    /// }
> +    /// ```
> +    pub fn iomap_resource(&self, resource: &Resource) -> Result<Devres<IoMem<0>>> {
> +        self.iomap_resource_sized::<0>(resource)
> +    }
> +
> +    /// Same as [`Self::iomap_resource`] but with exclusive access to the underlying
> +    /// region.
> +    pub fn iomap_resource_exclusive(
> +        &self,
> +        resource: &Resource,
> +    ) -> Result<Devres<ExclusiveIoMem<0>>> {
> +        self.iomap_resource_exclusive_sized::<0>(resource)
> +    }
> +}
> +
>  // SAFETY: `Device` is a transparent wrapper of a type that doesn't depend on `Device`'s generic
>  // argument.
>  kernel::impl_device_context_deref!(unsafe { Device });
> 
> -- 
> 2.49.0
> 
