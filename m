Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB56313D503;
	Sat,  5 Jul 2025 17:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751736279; cv=none; b=mjqgRU+xA6lIFWLVT9q5tMWorvwUNodkUW+cbMqW+/4Oq0Co02Qz282ZMC3RPl6MpuN94TAbdxQJwtodDCDtQeguFYpseD5zKzGTkN9I8Miu7PGx8OwJmakWQ7veY3WnLqTGZjaezrQ7ahPsW4x+O5mBppRU651PrM0Y48lfQbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751736279; c=relaxed/simple;
	bh=5TOCL6biYGPzAyjVTAkgnGGeHxX24Ot5ravR5cHQKys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rB4KJCO2y8afdSQZC3VAoZfjruptkO6N0tME+Esd+9UV0Dh1kSiW302rs7ExIjw5WD5X4EU0v1PM7oxXWRjJiNlINV2cYRYhHfIWwVusfqnuT1DjpT8HYahWIzbu+Bk3JlMne1spXYflMZ6TFtImVrCePvvMnH4yYmitUor/+EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RCeZYhrc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RCeZYhrc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 562C7C4CEE7;
	Sat,  5 Jul 2025 17:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751736276;
	bh=5TOCL6biYGPzAyjVTAkgnGGeHxX24Ot5ravR5cHQKys=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RCeZYhrcwQPkVy6Jf5zMNey3Vnv3dRWpw/Nqkwfbxh/Y1zi3+fo4F6yZOCdhUj7kn
	 /SqRhrOXa/rWPcoRIza+OaFEupzajCGUEd8tSxCYn7sPkmYOUVV/hsOXdpRjF7Vp75
	 vGRswn16c0+kFxTiwlrKjMKsQ6t9kDKQDoP8f011w+T/h5AL2fj3Iy3SGOJnL5pJFS
	 HoL+GIZ2r6VON3uanmroZaaUANGiFTeaMcd7+Z+qUbmJjFmyJzYrWhLMPQWosAsUmE
	 8jA60vsdW9VMEwGTVJLf8F+WDCITWAw11k4rroz9iIz08YcC24hNYUlT+FcBWHqgii
	 eIbpM2v9m4rCg==
Date: Sat, 5 Jul 2025 19:24:29 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
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
	Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v12 2/3] rust: io: mem: add a generic iomem abstraction
Message-ID: <aGlfzdUjvSkdFhNz@cassiopeiae>
References: <20250704-topics-tyr-platform_iomem-v12-0-1d3d4bd8207d@collabora.com>
 <20250704-topics-tyr-platform_iomem-v12-2-1d3d4bd8207d@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704-topics-tyr-platform_iomem-v12-2-1d3d4bd8207d@collabora.com>

On Fri, Jul 04, 2025 at 01:25:27PM -0300, Daniel Almeida wrote:

This looks good now, one comment below.

> +    /// Creates a new `IoMem` instance from a previously acquired [`IoRequest`].
> +    pub fn new<'a>(io_request: IoRequest<'a>) -> Result<impl PinInit<Devres<Self>, Error> + 'a> {
> +        let io = Self::ioremap(io_request.resource)?;
> +        let devres = Devres::new(io_request.device, io);
> +
> +        Ok(devres)
> +    }

This method should not return `Result<impl PinInit<Devres<Self>, Error> + 'a>`,
but just `impl PinInit<Devres<Self>, Error> + 'a`.

Here's the full diff of the changes needed. :)

diff --git a/rust/kernel/io/mem.rs b/rust/kernel/io/mem.rs
index b047b9a73ae5..cb0805ef0860 100644
--- a/rust/kernel/io/mem.rs
+++ b/rust/kernel/io/mem.rs
@@ -60,7 +60,7 @@ pub(crate) unsafe fn new(device: &'a Device<Bound>, resource: &'a Resource) -> S
     ///       //
     ///       // No runtime checks will apply when reading and writing.
     ///       let request = pdev.request_io_by_index(0).ok_or(ENODEV)?;
-    ///       let iomem = request.iomap_sized::<42>()?;
+    ///       let iomem = request.iomap_sized::<42>();
     ///       let iomem = KBox::pin_init(iomem, GFP_KERNEL)?;
     ///
     ///       let io = iomem.access(pdev.as_ref())?;
@@ -74,9 +74,7 @@ pub(crate) unsafe fn new(device: &'a Device<Bound>, resource: &'a Resource) -> S
     ///     }
     /// }
     /// ```
-    pub fn iomap_sized<const SIZE: usize>(
-        self,
-    ) -> Result<impl PinInit<Devres<IoMem<SIZE>>, Error> + 'a> {
+    pub fn iomap_sized<const SIZE: usize>(self) -> impl PinInit<Devres<IoMem<SIZE>>, Error> + 'a {
         IoMem::new(self)
     }

@@ -88,7 +86,7 @@ pub fn iomap_sized<const SIZE: usize>(
     /// C API.
     pub fn iomap_exclusive_sized<const SIZE: usize>(
         self,
-    ) -> Result<impl PinInit<Devres<ExclusiveIoMem<SIZE>>, Error> + 'a> {
+    ) -> impl PinInit<Devres<ExclusiveIoMem<SIZE>>, Error> + 'a {
         ExclusiveIoMem::new(self)
     }

@@ -122,7 +120,7 @@ pub fn iomap_exclusive_sized<const SIZE: usize>(
     ///       // family of functions should be used, leading to runtime checks on every
     ///       // access.
     ///       let request = pdev.request_io_by_index(0).ok_or(ENODEV)?;
-    ///       let iomem = request.iomap()?;
+    ///       let iomem = request.iomap();
     ///       let iomem = KBox::pin_init(iomem, GFP_KERNEL)?;
     ///
     ///       let io = iomem.access(pdev.as_ref())?;
@@ -135,13 +133,13 @@ pub fn iomap_exclusive_sized<const SIZE: usize>(
     ///     }
     /// }
     /// ```
-    pub fn iomap(self) -> Result<impl PinInit<Devres<IoMem<0>>, Error> + 'a> {
+    pub fn iomap(self) -> impl PinInit<Devres<IoMem<0>>, Error> + 'a {
         Self::iomap_sized::<0>(self)
     }

     /// Same as [`Self::iomap`] but with exclusive access to the underlying
     /// region.
-    pub fn iomap_exclusive(self) -> Result<impl PinInit<Devres<ExclusiveIoMem<0>>, Error> + 'a> {
+    pub fn iomap_exclusive(self) -> impl PinInit<Devres<ExclusiveIoMem<0>>, Error> + 'a {
         Self::iomap_exclusive_sized::<0>(self)
     }
 }
@@ -185,11 +183,11 @@ fn ioremap(resource: &Resource) -> Result<Self> {
     }

     /// Creates a new `ExclusiveIoMem` instance from a previously acquired [`IoRequest`].
-    pub fn new<'a>(io_request: IoRequest<'a>) -> Result<impl PinInit<Devres<Self>, Error> + 'a> {
-        let iomem = Self::ioremap(io_request.resource)?;
-        let devres = Devres::new(io_request.device, iomem);
+    pub fn new<'a>(io_request: IoRequest<'a>) -> impl PinInit<Devres<Self>, Error> + 'a {
+        let dev = io_request.device;
+        let res = io_request.resource;

-        Ok(devres)
+        Devres::new(dev, Self::ioremap(res))
     }
 }

@@ -249,11 +247,11 @@ fn ioremap(resource: &Resource) -> Result<Self> {
     }

     /// Creates a new `IoMem` instance from a previously acquired [`IoRequest`].
-    pub fn new<'a>(io_request: IoRequest<'a>) -> Result<impl PinInit<Devres<Self>, Error> + 'a> {
-        let io = Self::ioremap(io_request.resource)?;
-        let devres = Devres::new(io_request.device, io);
+    pub fn new<'a>(io_request: IoRequest<'a>) -> impl PinInit<Devres<Self>, Error> + 'a {
+        let dev = io_request.device;
+        let res = io_request.resource;

-        Ok(devres)
+        Devres::new(dev, Self::ioremap(res))
     }
 }
