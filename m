Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3F21917C2;
	Tue, 13 May 2025 14:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747146352; cv=none; b=BiO4gZDFDTZTbq2PvT90RQV6aLhqLseTkc9YmI6xelJoDGbENcYIQTnWY/cYFzSJUhQQpHg/wbTfRTFfbj9VfpQgz/eR0+L89KaT873xDyBW9TG5h0aRRMy6+CJ9jdOeCGOEBz/53Vy36z8GI2x0JGBSBaRw6p0uoLDepk4Nc9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747146352; c=relaxed/simple;
	bh=f/Le7tmJc5Ccb4iwGKUDyWwXoo1NuwynBheX6ecLNac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qa19VPAJ93PRaIE4vn/m6ocNJgz676jd4Wpb3QxjBw3sRFLlWJpqf9aT29lCa8iFbItEJKbBYY4/EOPMn4I6Yf8MPj/GQ6ZB0iJdW0+nOwmrpTa53i2hJYRQxP1muvDte6DchwucqhVd5ilVgGE3iPIpzJkcJWlZ4gWShH4YhgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hOsoj3tz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hOsoj3tz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBB13C4CEE4;
	Tue, 13 May 2025 14:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747146351;
	bh=f/Le7tmJc5Ccb4iwGKUDyWwXoo1NuwynBheX6ecLNac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hOsoj3tzgVml26AM9iHPVkzD1ElRNI9eTvGrELc3FHlUEoQYIefKIC+qtGKgNzj4e
	 2LdDGHyeMSTKB2lMJ+/ZRYTBgaqMEZj3GcPtGdlyLRajGfqap95nO78IJeIJk8Wcu7
	 G53kyD/14uLrdbKM69v+LkHUt2hwQwFzeTa2E7swjyTNj3FLBEQP5ty8FVAIBV/Qtp
	 yArc4ZMHZIruHbKAoZR04txC5q4Jz8e8yDmLDB9b2RNggpVf5fZsEmgI7bEElvpJNC
	 OY9XYgjJodr5r9oh+2FBdratdEIIEm/Lo9XXMGxMTBKzDJC6wcT3jhL2kuOplnc9Ye
	 0d9LmAjDvaGhQ==
Date: Tue, 13 May 2025 16:25:43 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>,
	John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 10/19] gpu: nova-core: add DMA object struct
Message-ID: <aCNWZ4wX07nSOXSI@pollux>
References: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
 <20250507-nova-frts-v3-10-fcb02749754d@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507-nova-frts-v3-10-fcb02749754d@nvidia.com>

On Wed, May 07, 2025 at 10:52:37PM +0900, Alexandre Courbot wrote:
> Since we will need to allocate lots of distinct memory chunks to be
> shared between GPU and CPU, introduce a type dedicated to that. It is a
> light wrapper around CoherentAllocation.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/dma.rs       | 60 ++++++++++++++++++++++++++++++++++++++
>  drivers/gpu/nova-core/nova_core.rs |  1 +
>  2 files changed, 61 insertions(+)
> 
> diff --git a/drivers/gpu/nova-core/dma.rs b/drivers/gpu/nova-core/dma.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..9d90ae01d0044eaab4ddbc3eba216741d7a623ef
> --- /dev/null
> +++ b/drivers/gpu/nova-core/dma.rs
> @@ -0,0 +1,60 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Simple DMA object wrapper.
> +
> +// To be removed when all code is used.
> +#![expect(dead_code)]
> +
> +use core::ops::{Deref, DerefMut};
> +
> +use kernel::device;
> +use kernel::dma::CoherentAllocation;
> +use kernel::page::PAGE_SIZE;
> +use kernel::prelude::*;
> +
> +pub(crate) struct DmaObject {
> +    dma: CoherentAllocation<u8>,
> +}
> +
> +impl DmaObject {
> +    pub(crate) fn new(dev: &device::Device<device::Bound>, len: usize) -> Result<Self> {
> +        let len = core::alloc::Layout::from_size_align(len, PAGE_SIZE)
> +            .map_err(|_| EINVAL)?
> +            .pad_to_align()
> +            .size();
> +        let dma = CoherentAllocation::alloc_coherent(dev, len, GFP_KERNEL | __GFP_ZERO)?;
> +
> +        Ok(Self { dma })
> +    }
> +
> +    pub(crate) fn from_data(dev: &device::Device<device::Bound>, data: &[u8]) -> Result<Self> {
> +        Self::new(dev, data.len()).map(|mut dma_obj| {
> +            // SAFETY:
> +            // - The copied data fits within the size of the allocated object.
> +            // - We have just created this object and there is no other user at this stage.
> +            unsafe {
> +                core::ptr::copy_nonoverlapping(
> +                    data.as_ptr(),
> +                    dma_obj.dma.start_ptr_mut(),
> +                    data.len(),
> +                );
> +            }

This will be replaced with CoherentAllocation::write() I suppose? Please add a
corresponding TODO.
