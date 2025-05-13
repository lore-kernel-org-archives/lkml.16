Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D531E883A;
	Tue, 13 May 2025 14:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747145260; cv=none; b=RinO5qL/QwQQpXgSSpYmushBuw1MeMXhOIOOeyuVqBM1SpsXkBLz4s3ukpjiwk2YSWcbx0S99cClS3aC6XxzfzWyql8oWKHiahoFiyzW+bTtziQyA2H1cdYgIdIJ+SS0fHQhIKZXqK3JoFTtUz9xXVe9orUeM+echR0NHptmUd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747145260; c=relaxed/simple;
	bh=XQ0PtISiJMgGCU3R2QWS6wlTIRUGPytrW2EX30D6e7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V/b/VSwZbEoPAgUXQrVF114XCWDEMmUTsA20/XGrfO9A0RRU+XzRuNeD4rQpHVbA7jpwE7vEiaCIXtOuslSnk/4pBSSh+8NPX5F9/AzEdwE6pZRXHXYHbAHBVyBqPGGAoi0LgzUue8eu1jo3DSSRa1tLVHCmEGzftiPGYiEfKAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JcimUHHe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JcimUHHe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96748C4CEE4;
	Tue, 13 May 2025 14:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747145259;
	bh=XQ0PtISiJMgGCU3R2QWS6wlTIRUGPytrW2EX30D6e7g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JcimUHHeGhjNh5Mvyn/0+mHwha12SUXq/bzqXiYCaJvDlyuvWqt5KhUbpdrbCcH1/
	 cT4Ehy28S5fCuVFxcz3E5GAB1gT6MgG9pHEoCq1C3akgfeedYk/M6HimsJy//j/8Wf
	 428iF63D62aPQNlw/15ArDhPmQThH3Pfq57e6BMIh8CUSsxcZGE+8PeUErxlA5xgZk
	 iG6c3C5A8FoCUWOOuzOxJztvCcwyUxWp7D3DM+1n1blv+9tbr3fgJrR5PxzEVAk72I
	 1Ayo4c+kYTMQP/ARFFCd0lrwBktjRgmvTRTQtNDvYHmQ2lREVnC2PuY4Q1AjZIOzxp
	 98STD1WVLgZ1Q==
Date: Tue, 13 May 2025 16:07:31 +0200
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
Subject: Re: [PATCH v3 09/19] gpu: nova-core: wait for GFW_BOOT completion
Message-ID: <aCNSI1iwvK8w51oJ@pollux>
References: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
 <20250507-nova-frts-v3-9-fcb02749754d@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507-nova-frts-v3-9-fcb02749754d@nvidia.com>

On Wed, May 07, 2025 at 10:52:36PM +0900, Alexandre Courbot wrote:
> Upon reset, the GPU executes the GFW_BOOT firmware in order to
> initialize its base parameters such as clocks. The driver must ensure
> that this step is completed before using the hardware.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/devinit.rs   | 38 ++++++++++++++++++++++++++++++++++++++
>  drivers/gpu/nova-core/driver.rs    |  2 +-
>  drivers/gpu/nova-core/gpu.rs       |  5 +++++
>  drivers/gpu/nova-core/nova_core.rs |  1 +
>  drivers/gpu/nova-core/regs.rs      | 11 +++++++++++
>  5 files changed, 56 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/nova-core/devinit.rs b/drivers/gpu/nova-core/devinit.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..5be2e0344fb651e5e53c9223aefeb5b2d95b8de1
> --- /dev/null
> +++ b/drivers/gpu/nova-core/devinit.rs
> @@ -0,0 +1,38 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Methods for device initialization.
> +
> +use kernel::bindings;
> +use kernel::prelude::*;
> +
> +use crate::driver::Bar0;
> +use crate::regs;
> +
> +/// Wait for devinit FW completion.
> +///
> +/// Upon reset, the GPU runs some firmware code to setup its core parameters. Most of the GPU is
> +/// considered unusable until this step is completed, so it must be waited on very early during
> +/// driver initialization.
> +pub(crate) fn wait_gfw_boot_completion(bar: &Bar0) -> Result<()> {
> +    let mut timeout = 2000;
> +
> +    loop {
> +        let gfw_booted = regs::NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_PRIV_LEVEL_MASK::read(bar)
> +            .read_protection_level0()
> +            && (regs::NV_PGC6_AON_SECURE_SCRATCH_GROUP_05::read(bar).value() & 0xff) == 0xff;

What does it mean when the first 8 bits are set? Why don't we have a mask and
value to compare for that?

> +
> +        if gfw_booted {
> +            return Ok(());
> +        }
> +
> +        if timeout == 0 {
> +            return Err(ETIMEDOUT);
> +        }
> +        timeout -= 1;

NIT: This means the timeout is ~4s; can we start with timeout == 4000 and decrement
with the number of ms passed to msleep()?

Anyways, this should go away with read_poll_timeout() anyways.

> +
> +        // TODO: use `read_poll_timeout` once it is available.
> +        // (https://lore.kernel.org/lkml/20250220070611.214262-8-fujita.tomonori@gmail.com/)
> +        // SAFETY: msleep should be safe to call with any parameter.
> +        unsafe { bindings::msleep(2) };
> +    }
> +}
> diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
> index a08fb6599267a960f0e07b6efd0e3b6cdc296aa4..752ba4b0fcfe8d835d366570bb2f807840a196da 100644
> --- a/drivers/gpu/nova-core/driver.rs
> +++ b/drivers/gpu/nova-core/driver.rs
> @@ -10,7 +10,7 @@ pub(crate) struct NovaCore {
>      pub(crate) gpu: Gpu,
>  }
>  
> -const BAR0_SIZE: usize = 8;
> +const BAR0_SIZE: usize = 0x1000000;

This means that we'll fail probing the card if BAR0 is not at least 16MiB.
AFAIK, that should be fine. However, can you make this a separate patch please?
