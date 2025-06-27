Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280471DF271;
	Fri, 27 Jun 2025 18:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751048424; cv=none; b=mjs8NOsF2PkKwPVheXb+3imA3Stjg6oqhzodZdBS5UURXr15DNaVJ4iOoYPh3nG9Qz8gMjsmBb2Wgw+dg8+1VsmfdPzC5T5fFK2T+l9ilrR1Y2BRGN9VxvY1HgLZvl58ef7Ebt0tb8u5jBlxNvuBP1rzMn2kZU+0YZsdzalyuQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751048424; c=relaxed/simple;
	bh=As0yuel3TuJEOFeXO33HLu6S/jbTweiZGo7+qQleETU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rkomHrscvzNsaYcZml3dvWM6g9G4EiRGbpYjiESOnjhGllq/0rXbtX51yLXuapfqeso5AciWdXqg5IQrD+93bp/i7reDekLKXDrp2nQMtIPJdGJTor7tQyO02n06iUlZZavgbpZREs5SBztpYX0Epk84Ujfv6c2oTYlV7+QUGvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OqeMO1KZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OqeMO1KZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55234C4CEE3;
	Fri, 27 Jun 2025 18:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751048423;
	bh=As0yuel3TuJEOFeXO33HLu6S/jbTweiZGo7+qQleETU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OqeMO1KZx0PvtCVFQWVi24HCJtDrnTTsXAbX5W66GHe8lb+Uz1uGFH9mYbLrUxqVp
	 2aVMjJdPiJGx3F4rJSRfL4pMPMjluG10Gku7hsmodTwB1BSIDHyycV878naiuCNTAM
	 8sdu/bJ4Z8LaFvnu/lIJxGTds7xX78/DqwSr5Ja38F8SR5KATBIqDRAnVHf1sbHCK6
	 D7UscoFRsfgafkbbHT6CSpsaCaAiVReuebWlY9Z933DtxMVtH+J8ZUOOMTMZzOt/4P
	 mWMNbp1EMIeCUsJ6CG5izKjS24UhfPzw9o2JQ4IczWNnKz73j1Ck9+T40HFbGyGTsl
	 wWv54fwoqatBw==
Date: Fri, 27 Jun 2025 20:20:08 +0200
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
Subject: Re: [PATCH v10 2/4] rust: io: mem: add a generic iomem abstraction
Message-ID: <aF7g2CpVhMntW7-O@pollux>
References: <20250623-topics-tyr-platform_iomem-v10-0-ed860a562940@collabora.com>
 <20250623-topics-tyr-platform_iomem-v10-2-ed860a562940@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623-topics-tyr-platform_iomem-v10-2-ed860a562940@collabora.com>

On Mon, Jun 23, 2025 at 03:00:59PM -0300, Daniel Almeida wrote:
> Add a generic iomem abstraction to safely read and write ioremapped
> regions.
> 
> The reads and writes are done through IoRaw, and are thus checked either
> at compile-time, if the size of the region is known at that point, or at
> runtime otherwise.
> 
> Non-exclusive access to the underlying memory region is made possible to
> cater to cases where overlapped regions are unavoidable.
> 
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> ---
>  rust/helpers/io.c     |   5 ++
>  rust/kernel/io.rs     |   1 +
>  rust/kernel/io/mem.rs | 142 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 148 insertions(+)
> 
> diff --git a/rust/helpers/io.c b/rust/helpers/io.c
> index 404776cf6717c8570c7600a24712ce6e4623d3c6..c475913c69e647b1042e8e7d66b9148d892947a1 100644
> --- a/rust/helpers/io.c
> +++ b/rust/helpers/io.c
> @@ -8,6 +8,11 @@ void __iomem *rust_helper_ioremap(phys_addr_t offset, size_t size)
>  	return ioremap(offset, size);
>  }
>  
> +void __iomem *rust_helper_ioremap_np(phys_addr_t offset, size_t size)
> +{
> +	return ioremap_np(offset, size);
> +}
> +
>  void rust_helper_iounmap(void __iomem *addr)
>  {
>  	iounmap(addr);
> diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
> index 7b70d5b5477e57d6d0f24bcd26bd8b0071721bc0..b7fc759f8b5d3c3ac6f33f5a66e9f619c58b7405 100644
> --- a/rust/kernel/io.rs
> +++ b/rust/kernel/io.rs
> @@ -7,6 +7,7 @@
>  use crate::error::{code::EINVAL, Result};
>  use crate::{bindings, build_assert};
>  
> +pub mod mem;
>  pub mod resource;
>  
>  pub use resource::Resource;
> diff --git a/rust/kernel/io/mem.rs b/rust/kernel/io/mem.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..2bd9cf4c4f1a59f027999a6e9a203dc99ad6c003
> --- /dev/null
> +++ b/rust/kernel/io/mem.rs
> @@ -0,0 +1,142 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Generic memory-mapped IO.
> +
> +use core::ops::Deref;
> +
> +use crate::device::Bound;
> +use crate::device::Device;
> +use crate::devres::Devres;
> +use crate::io;
> +use crate::io::resource::Region;
> +use crate::io::resource::Resource;
> +use crate::io::Io;
> +use crate::io::IoRaw;
> +use crate::prelude::*;
> +
> +/// An exclusive memory-mapped IO region.
> +///
> +/// # Invariants
> +///
> +/// - [`ExclusiveIoMem`] has exclusive access to the underlying [`IoMem`].
> +pub struct ExclusiveIoMem<const SIZE: usize> {
> +    /// The region abstraction. This represents exclusive access to the
> +    /// range represented by the underlying `iomem`.
> +    ///
> +    /// It's placed first to ensure that the region is released before it is
> +    /// unmapped as a result of the drop order.

Isn't it more logical the other way around, i.e. first free the resource and
then release the resource guard?

Anyways, I don't think it matters too much, since drop() owns the object and
Devres guarantees that we can't race with another device trying to access the
resource.

Otherwise, I guess you could drop() the object and create a new one right away,
but that doesn't seem to be a problem either for any order?

> +    /// This field is needed for ownership of the region.
> +    _region: Region,
> +    /// The underlying `IoMem` instance.
> +    iomem: IoMem<SIZE>,
> +}
> +
> +impl<const SIZE: usize> ExclusiveIoMem<SIZE> {
> +    /// Creates a new `ExclusiveIoMem` instance.
> +    pub(crate) fn ioremap(resource: &Resource) -> Result<Self> {
> +        let iomem = IoMem::ioremap(resource)?;
> +
> +        let start = resource.start();
> +        let size = resource.size();
> +        let name = resource.name();
> +
> +        let region = resource
> +            .request_region(start, size, name, io::resource::flags::IORESOURCE_MEM)
> +            .ok_or(EBUSY)?;

Same here, why do the ioremap() first? I think it logically makes more sense to
first try and get the region.
