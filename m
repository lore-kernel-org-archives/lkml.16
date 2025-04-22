Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270C81096F;
	Tue, 22 Apr 2025 11:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745321796; cv=none; b=omlVoPj/sdpRQ/9EgMn94mrh17cFYY3HygucYq8uavT+aKbMk7S5gTZ0sV+J/8mGnGASU75IpoiCDlxeUH5dufcCdgPsyb+dpY2mIms4a+9VgJzkKt591VA8ixWGxzhzKZ88tjRpsa0UmF5+8n9SqqwIT/dn8v7sZ2w5bbNFcdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745321796; c=relaxed/simple;
	bh=OFp61Brk73190htdAxSLAvDHCTjmWH2uMYVj61vQuOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p0yoy54gZm1JL/4GfXvvtaXdDelrdenS1A/7Afhus0QjZvMA+O/ioTIDSgq8EhXNvAQygw4/rT8+IUXbcZVfHNspxKD+c2edcHAYIDFdIEJVy+SGzdpdBWyD9qV+C85dule6e/4+pFTTJsVT8/oE15FUlWu8A946SbiDMOTcWb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FAfcjjF4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FAfcjjF4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D65B9C4CEE9;
	Tue, 22 Apr 2025 11:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745321795;
	bh=OFp61Brk73190htdAxSLAvDHCTjmWH2uMYVj61vQuOA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FAfcjjF4SXULbg1huHByX8jRpJl7IYpofDy1hhJBvBTc5e3kFIPiYe/MjeS1xx2+L
	 Ev2cOfnFyYtPANDH8+v/oHUcEd5+UdPWmPZ5wcLZGIkBixWndagBPRd2gaG8SmtL3q
	 H7I1iyN0MRXHiDNB+3H2TLUYvoOFz1vt7nH5OWR6Pw1l1A6+6SPA9aWjoehArIsn9A
	 VFhyJPv3o0+pxbUjZlJgcfoUM9NYEUnGSWXX10IJsvlJbBuqC2PvfEXUiLPwd3LwJF
	 3xY+UOB4Z2ji0SNZk1IY4MDyzITzaCgXphC6RskwRuP4D8CXmxm18rBwej2TTrDOMA
	 i6lRCx9vGMcQQ==
Date: Tue, 22 Apr 2025 13:36:28 +0200
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
Subject: Re: [PATCH 08/16] gpu: nova-core: wait for GFW_BOOT completion
Message-ID: <aAd_PBVB5S5pHeP0@cassiopeiae>
References: <20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com>
 <20250420-nova-frts-v1-8-ecd1cca23963@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250420-nova-frts-v1-8-ecd1cca23963@nvidia.com>

On Sun, Apr 20, 2025 at 09:19:40PM +0900, Alexandre Courbot wrote:
> Upon reset, the GPU executes the GFW_BOOT firmware in order to
> initialize its base parameters such as clocks. The driver must ensure
> that this step is completed before using the hardware.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/devinit.rs   | 40 ++++++++++++++++++++++++++++++++++++++
>  drivers/gpu/nova-core/driver.rs    |  2 +-
>  drivers/gpu/nova-core/gpu.rs       |  5 +++++
>  drivers/gpu/nova-core/nova_core.rs |  1 +
>  drivers/gpu/nova-core/regs.rs      | 11 +++++++++++
>  5 files changed, 58 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/nova-core/devinit.rs b/drivers/gpu/nova-core/devinit.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..ee5685aff845aa97d6b0fbe9528df9a7ba274b2c
> --- /dev/null
> +++ b/drivers/gpu/nova-core/devinit.rs
> @@ -0,0 +1,40 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Methods for device initialization.
> +
> +use kernel::bindings;
> +use kernel::devres::Devres;
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
> +pub(crate) fn wait_gfw_boot_completion(bar: &Devres<Bar0>) -> Result<()> {
> +    let mut timeout = 2000;
> +
> +    loop {
> +        let gfw_booted = with_bar!(
> +            bar,
> +            |b| regs::Pgc6AonSecureScratchGroup05PrivLevelMask::read(b)
> +                .read_protection_level0_enabled()
> +                && (regs::Pgc6AonSecureScratchGroup05::read(b).value() & 0xff) == 0xff
> +        )?;
> +
> +        if gfw_booted {
> +            return Ok(());
> +        }
> +
> +        if timeout == 0 {
> +            return Err(ETIMEDOUT);
> +        }
> +        timeout -= 1;
> +
> +        // SAFETY: msleep should be safe to call with any parameter.
> +        unsafe { bindings::msleep(2) };

I assume this goes away with [1]? Can we please add a corresponding TODO? Also,
do you mind preparing the follow-up patches for cases like this (there's also
the transmute one), such that we can apply them, once the dependencies did land
and such that we can verify that they suit our needs?

[1] https://lore.kernel.org/lkml/20250220070611.214262-8-fujita.tomonori@gmail.com/

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
>  pub(crate) type Bar0 = pci::Bar<BAR0_SIZE>;
>  
>  kernel::pci_device_table!(
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index 866c5992b9eb27735975bb4948e522bc01fadaa2..1f7799692a0ab042f2540e01414f5ca347ae9ecc 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -2,6 +2,7 @@
>  
>  use kernel::{device, devres::Devres, error::code::*, pci, prelude::*};
>  
> +use crate::devinit;
>  use crate::driver::Bar0;
>  use crate::firmware::Firmware;
>  use crate::regs;
> @@ -168,6 +169,10 @@ pub(crate) fn new(
>              spec.revision
>          );
>  
> +        // We must wait for GFW_BOOT completion before doing any significant setup on the GPU.
> +        devinit::wait_gfw_boot_completion(&bar)
> +            .inspect_err(|_| pr_err!("GFW boot did not complete"))?;
> +
>          Ok(pin_init!(Self { spec, bar, fw }))
>      }
>  }
> diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
> index 0eecd612e34efc046dad852e6239de6ffa5fdd62..878161e060f54da7738c656f6098936a62dcaa93 100644
> --- a/drivers/gpu/nova-core/nova_core.rs
> +++ b/drivers/gpu/nova-core/nova_core.rs
> @@ -20,6 +20,7 @@ macro_rules! with_bar {
>      }
>  }
>  
> +mod devinit;
>  mod driver;
>  mod firmware;
>  mod gpu;
> diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
> index e315a3011660df7f18c0a3e0582b5845545b36e2..fd7096f0ddd4af90114dd1119d9715d2cd3aa2ac 100644
> --- a/drivers/gpu/nova-core/regs.rs
> +++ b/drivers/gpu/nova-core/regs.rs
> @@ -13,3 +13,14 @@
>      7:4     major_rev => as u8, "major revision of the chip";
>      28:20   chipset => try_into Chipset, "chipset model"
>  );
> +
> +/* GC6 */
> +
> +register!(Pgc6AonSecureScratchGroup05PrivLevelMask@0x00118128;
> +    0:0     read_protection_level0_enabled => as_bit bool
> +);
> +
> +/* TODO: This is an array of registers. */
> +register!(Pgc6AonSecureScratchGroup05@0x00118234;
> +    31:0    value => as u32
> +);

Please also document new register definitions.
