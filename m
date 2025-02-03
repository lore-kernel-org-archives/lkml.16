Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FED20A5F0
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 20:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738614255; cv=none; b=RV+S+1qZ0YLHh/xzeIdz8slLknvP7sV8KNQOytTaqhToBkL/R4psjj3heS0NVd9iVYC8BLKbETz6i70k54JIbD0wHYnVLDpiCK1J5D1Z08obY4l7RXW9ljPLlL8ngvZkGdIn71cTBqcqzxElRz7d+cFOkfoGY2uzICjee6sceVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738614255; c=relaxed/simple;
	bh=a2ksj9/C+3L3xg+sz4AczOZg+LmcsIVoba/i9EAoBjo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c+5S7PlAfEFmpyfxCsntb1KDbdGlRM4rXTMT50tqlkRlXFaqsrTZs8JXz1u7N3e5HfDbBVPzbPu0tqr2x3g14PEGqeniKn2rjYQWa/qWOkHJ0JaerVf12XxNxNhpO4qgH7KRo863OuP6WtSz7N2eX5L7ALDg85x3hgDtHyYf3iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org; spf=pass smtp.mailfrom=joelfernandes.org; dkim=pass (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b=u/38mhGG; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=joelfernandes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="u/38mhGG"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7be3f230436so434546685a.3
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 12:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google; t=1738614252; x=1739219052; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e6Xb4Vhua6DOVXVMhZhn9gco2hHVBBy0OximdWiyFao=;
        b=u/38mhGGHOqPxUvWDlE94P2EwUA85hQ3cCvre0FgNu11esh56Qfa0L6kpqW8mT4TiT
         yuUBVfpi+DkHwvZeyUCWk2khRV4gioJtGXKoigQDnLxdd5EBvBzyewtyZMyu9jTEs0kw
         6Iye1bBGxLHil5UJd567cun9rsSFrYZOxbGLs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738614252; x=1739219052;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e6Xb4Vhua6DOVXVMhZhn9gco2hHVBBy0OximdWiyFao=;
        b=SFhM0CacnTVoSBDYisRlt+oHzbRHuRoobW/SxTm/HWhgt1rkPygVhqYanognHS6cf8
         Sc3ulsVPqN8zPIZ+UiHoXPwhVyLzCD9hmoGDkGOWXEAa6f1XfepQFTOmv0mhx3XPMOVc
         2ysQAGPie0knYpgrXZoEySCGUOhwcLnO9xctBSni2YLoV52C9bcbJs9mV0Hd9saAdLcM
         Vu26bvu1rS/d2aURpMru5ttSIVJOEtX5OMtIR4jreGQg364gt55dvHdrZBeAK4Wde81P
         zSqxATbxq9cxAs0rCqQGy3UTKXhIvCFGmjKOyiJt7RVofiJWhzas47/OFdVnDoip08x/
         Nwfw==
X-Forwarded-Encrypted: i=1; AJvYcCWYCWZBkQXAnccZR61N5x4nk50XcVEYnX2TQOtjX9gZXNWk/ih8lWiUzVaQcROV/yraQ7xM/heZ+lqXxK8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbQxHNpKkUBg6zlxEMGsNOn+j3z2EcyHi0XkuX1JaWSD1yuSOd
	a/Nq0Guy6MHr6v9GhCU8ibpJNxL9EQNKp3jyeU/fQzfHaCwPyLl6Hwd2JkdIUIQ=
X-Gm-Gg: ASbGnct9HQG+WbbZrSt2K+MyzwCKcOP8ti9Sqxs1NIlBCcb0mG0TYEd7UUJx1MRWztF
	Hy2oWXlsnGai758pBkYI+Iu/q36KrVwa7PBD+xNx8rlQWhxMup8ipR/eEySKQ1j86C5LY5eVmiN
	xXNPoD97HSGpxWo3OTE7M4iVZozuj84V3CxXwiwCVKaRWctxoht+4NYb+89vTRmjy0w5BT5LX64
	oWMGFQh0Sgc3yTQuGzWRKPbiPfZn63uBzBjiUNQmn7mMbgthzAkcFXv2+t8xy0EI4IMOL5/fdxJ
	70/oYDdJmhyezk/TFmkbCL1/u2laKyFYAmZz+syxwzmIZxKeWkzDEkUh
X-Google-Smtp-Source: AGHT+IHJwBbQNy/YeELcPmOI7zX6eoLJ4YXXLZVqyVWNzadG1hUIGaAyCQNT7KDmH8wCurS/lwIGkg==
X-Received: by 2002:a05:620a:6228:b0:7c0:a2:e689 with SMTP id af79cd13be357-7c000a2e939mr2513414085a.31.1738614251706;
        Mon, 03 Feb 2025 12:24:11 -0800 (PST)
Received: from localhost (c-73-251-172-144.hsd1.va.comcast.net. [73.251.172.144])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a8bc769sm565424885a.23.2025.02.03.12.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 12:24:10 -0800 (PST)
Date: Mon, 3 Feb 2025 15:24:10 -0500
From: Joel Fernandes <joel@joelfernandes.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: airlied@gmail.com, simona@ffwll.ch, corbet@lwn.net,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, ajanulgu@redhat.com, lyude@redhat.com,
	pstanner@redhat.com, zhiw@nvidia.com, cjia@nvidia.com,
	jhubbard@nvidia.com, bskeggs@nvidia.com, acurrid@nvidia.com,
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org, joelagnelf@nvidia.com
Subject: Re: [PATCH 1/2] gpu: nova-core: add initial driver stub
Message-ID: <20250203202410.GA3936980@joelbox2>
References: <20250131220432.17717-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131220432.17717-1-dakr@kernel.org>

Hi Danilo,

On Fri, Jan 31, 2025 at 11:04:24PM +0100, Danilo Krummrich wrote:
> Add the initial nova-core driver stub.
> 
> nova-core is intended to serve as a common base for nova-drm (the
> corresponding DRM driver) and the vGPU manager VFIO driver, serving as a
> hard- and firmware abstraction layer for GSP-based NVIDIA GPUs.
> 
> The Nova project, including nova-core and nova-drm, in the long term,
> is intended to serve as the successor of Nouveau for all GSP-based GPUs.
> 
> The motivation for both, starting a successor project for Nouveau and
> doing so using the Rust programming language, is documented in detail
> through a previous post on the mailing list [1], an LWN article [2] and a
> talk from LPC '24.
> 
> In order to avoid the chicken and egg problem to require a user to
> upstream Rust abstractions, but at the same time require the Rust
> abstractions to implement the driver, nova-core kicks off as a driver
> stub and is subsequently developed upstream.
> 
> Link: https://lore.kernel.org/dri-devel/Zfsj0_tb-0-tNrJy@cassiopeiae/T/#u [1]
> Link: https://lwn.net/Articles/990736/ [2]
> Link: https://youtu.be/3Igmx28B3BQ?si=sBdSEer4tAPKGpOs [3]
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  MAINTAINERS                        |  10 ++
>  drivers/gpu/Makefile               |   1 +
[..]
> diff --git a/drivers/gpu/Makefile b/drivers/gpu/Makefile
> index 8997f0096545..36a54d456630 100644
> --- a/drivers/gpu/Makefile
> +++ b/drivers/gpu/Makefile
> @@ -5,3 +5,4 @@
>  obj-y			+= host1x/ drm/ vga/
>  obj-$(CONFIG_IMX_IPUV3_CORE)	+= ipu-v3/
>  obj-$(CONFIG_TRACE_GPU_MEM)		+= trace/
> +obj-$(CONFIG_NOVA_CORE)		+= nova-core/
> diff --git a/drivers/gpu/nova-core/Kconfig b/drivers/gpu/nova-core/Kconfig
> new file mode 100644
> index 000000000000..33ac937b244a
> --- /dev/null
> +++ b/drivers/gpu/nova-core/Kconfig
> @@ -0,0 +1,13 @@
> +config NOVA_CORE
> +	tristate "Nova Core GPU driver"
> +	depends on PCI
> +	depends on RUST
> +	depends on RUST_FW_LOADER_ABSTRACTIONS
> +	default n
> +	help
> +	  Choose this if you want to build the Nova Core driver for Nvidia
> +	  GSP-based GPUs.
> +
> +	  This driver is work in progress and may not be functional.
> +
> +	  If M is selected, the module will be called nova-core.
> diff --git a/drivers/gpu/nova-core/Makefile b/drivers/gpu/nova-core/Makefile
> new file mode 100644
> index 000000000000..2d78c50126e1
> --- /dev/null
> +++ b/drivers/gpu/nova-core/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +obj-$(CONFIG_NOVA_CORE) += nova_core.o
> diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
> new file mode 100644
> index 000000000000..2a2aa9b0630b
> --- /dev/null
> +++ b/drivers/gpu/nova-core/driver.rs
> @@ -0,0 +1,47 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +use kernel::{bindings, c_str, pci, prelude::*};
> +
> +use crate::gpu::Gpu;
> +
> +#[pin_data]
> +pub(crate) struct NovaCore {
> +    #[pin]
> +    pub(crate) gpu: Gpu,
> +}

I am curious what is the need for pinning here in the patch in its current
form, is it for future-proofing?

I looked through the sample PCI driver example you had posted and did not see
pinning there [1]. Thanks for the clarification.
[1] https://lore.kernel.org/all/20241219170425.12036-12-dakr@kernel.org/

> +
> +const BAR0_SIZE: usize = 8;
> +pub(crate) type Bar0 = pci::Bar<BAR0_SIZE>;
> +
> +kernel::pci_device_table!(
> +    PCI_TABLE,
> +    MODULE_PCI_TABLE,
> +    <NovaCore as pci::Driver>::IdInfo,
> +    [(
> +        pci::DeviceId::from_id(bindings::PCI_VENDOR_ID_NVIDIA, bindings::PCI_ANY_ID as _),

Does this mean it will match even non-GSP Nvidia devices?

> +        ()
> +    )]
> +);
> +
> +impl pci::Driver for NovaCore {
> +    type IdInfo = ();
> +    const ID_TABLE: pci::IdTable<Self::IdInfo> = &PCI_TABLE;
> +
> +    fn probe(pdev: &mut pci::Device, _info: &Self::IdInfo) -> Result<Pin<KBox<Self>>> {
> +        dev_dbg!(pdev.as_ref(), "Probe Nova Core GPU driver.\n");
> +
> +        pdev.enable_device_mem()?;
> +        pdev.set_master();
> +
> +        let bar = pdev.iomap_region_sized::<BAR0_SIZE>(0, c_str!("nova-core"))?;
> +
> +        let this = KBox::pin_init(
> +            try_pin_init!(Self {
> +                gpu <- Gpu::new(pdev, bar)?,
> +            }),
> +            GFP_KERNEL,
> +        )?;
> +
> +        Ok(this)
> +    }
> +}
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> new file mode 100644
> index 000000000000..cf62390e72eb
> --- /dev/null
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -0,0 +1,171 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +use kernel::{
> +    device, devres::Devres, error::code::*, firmware, fmt, pci, prelude::*, str::CString,
> +};
> +
> +use crate::driver::Bar0;
> +use core::fmt::Debug;
> +
> +/// Enum representation of the GPU chipset.
> +#[derive(Debug)]
> +pub(crate) enum Chipset {
> +    TU102 = 0x162,
> +    TU104 = 0x164,
> +    TU106 = 0x166,
> +    TU117 = 0x167,
> +    TU116 = 0x168,
> +    GA102 = 0x172,
> +    GA103 = 0x173,
> +    GA104 = 0x174,
> +    GA106 = 0x176,
> +    GA107 = 0x177,
> +    AD102 = 0x192,
> +    AD103 = 0x193,
> +    AD104 = 0x194,
> +    AD106 = 0x196,
> +    AD107 = 0x197,
> +}
> +
> +/// Enum representation of the GPU generation.
> +#[derive(Debug)]
> +pub(crate) enum CardType {
> +    /// Turing
> +    TU100 = 0x160,
> +    /// Ampere
> +    GA100 = 0x170,
> +    /// Ada Lovelace
> +    AD100 = 0x190,
> +}
> +
> +/// Structure holding the metadata of the GPU.
> +#[allow(dead_code)]
> +pub(crate) struct GpuSpec {
> +    /// Contents of the boot0 register.
> +    boot0: u64,
> +    card_type: CardType,
> +    chipset: Chipset,
> +    /// The revision of the chipset.
> +    chiprev: u8,
> +}
> +
> +/// Structure encapsulating the firmware blobs required for the GPU to operate.
> +#[allow(dead_code)]
> +pub(crate) struct Firmware {
> +    booter_load: firmware::Firmware,
> +    booter_unload: firmware::Firmware,
> +    gsp: firmware::Firmware,
> +}
> +
> +/// Structure holding the resources required to operate the GPU.
> +#[allow(dead_code)]
> +#[pin_data]
> +pub(crate) struct Gpu {
> +    spec: GpuSpec,
> +    /// MMIO mapping of PCI BAR 0
> +    bar: Devres<Bar0>,
> +    fw: Firmware,
> +}

Here, #[pin_data] is used on top of struct Gpu, but no #[pin] is used?

According to [1]
Place this macro on a struct definition and then #[pin] in front of the
attributes of each field you want to structurally pin.

[1]
https://rust.docs.kernel.org/macros/attr.pin_data.html

> +
> +// TODO replace with something like derive(FromPrimitive)
> +impl Chipset {
> +    fn from_u32(value: u32) -> Option<Chipset> {
> +        match value {
> +            0x162 => Some(Chipset::TU102),
> +            0x164 => Some(Chipset::TU104),
> +            0x166 => Some(Chipset::TU106),
> +            0x167 => Some(Chipset::TU117),
> +            0x168 => Some(Chipset::TU116),
> +            0x172 => Some(Chipset::GA102),
> +            0x173 => Some(Chipset::GA103),
> +            0x174 => Some(Chipset::GA104),
> +            0x176 => Some(Chipset::GA106),
> +            0x177 => Some(Chipset::GA107),
> +            0x192 => Some(Chipset::AD102),
> +            0x193 => Some(Chipset::AD103),
> +            0x194 => Some(Chipset::AD104),
> +            0x196 => Some(Chipset::AD106),
> +            0x197 => Some(Chipset::AD107),
> +            _ => None,
> +        }
> +    }
> +}
> +
> +// TODO replace with something like derive(FromPrimitive)
> +impl CardType {
> +    fn from_u32(value: u32) -> Option<CardType> {
> +        match value {
> +            0x160 => Some(CardType::TU100),
> +            0x170 => Some(CardType::GA100),
> +            0x190 => Some(CardType::AD100),
> +            _ => None,
> +        }
> +    }
> +}
> +
> +impl GpuSpec {
> +    fn new(bar: &Devres<Bar0>) -> Result<GpuSpec> {
> +        let bar = bar.try_access().ok_or(ENXIO)?;
> +        let boot0 = u64::from_le(bar.readq(0));
> +        let chip = ((boot0 & 0x1ff00000) >> 20) as u32;
> +
> +        if boot0 & 0x1f000000 == 0 {
> +            return Err(ENODEV);
> +        }
> +
> +        let Some(chipset) = Chipset::from_u32(chip) else {
> +            return Err(ENODEV);
> +        };
> +
> +        let Some(card_type) = CardType::from_u32(chip & 0x1f0) else {
> +            return Err(ENODEV);
> +        };

Can use ok_or() here as well?

let chipset = Chipset::from_u32(chip).ok_or(ENODEV)?;
let card_type = CardType::from_u32(chip & 0x1f0).ok_or(ENODEV)?;

Or does it not work for some reason?

thanks,

 - Joel


> +
> +        Ok(Self {
> +            boot0,
> +            card_type,
> +            chipset,
> +            chiprev: (boot0 & 0xff) as u8,
> +        })
> +    }
> +}
> +
> +impl Firmware {
> +    fn new(dev: &device::Device, spec: &GpuSpec, ver: &str) -> Result<Firmware> {
> +        let mut chip_name = CString::try_from_fmt(fmt!("{:?}", spec.chipset))?;
> +        chip_name.make_ascii_lowercase();
> +
> +        let fw_booter_load_path =
> +            CString::try_from_fmt(fmt!("nvidia/{}/gsp/booter_load-{}.bin", &*chip_name, ver))?;
> +        let fw_booter_unload_path =
> +            CString::try_from_fmt(fmt!("nvidia/{}/gsp/booter_unload-{}.bin", &*chip_name, ver))?;
> +        let fw_gsp_path =
> +            CString::try_from_fmt(fmt!("nvidia/{}/gsp/gsp-{}.bin", &*chip_name, ver))?;
> +
> +        let booter_load = firmware::Firmware::request(&fw_booter_load_path, dev)?;
> +        let booter_unload = firmware::Firmware::request(&fw_booter_unload_path, dev)?;
> +        let gsp = firmware::Firmware::request(&fw_gsp_path, dev)?;
> +
> +        Ok(Firmware {
> +            booter_load,
> +            booter_unload,
> +            gsp,
> +        })
> +    }
> +}
> +
> +impl Gpu {
> +    pub(crate) fn new(pdev: &pci::Device, bar: Devres<Bar0>) -> Result<impl PinInit<Self>> {
> +        let spec = GpuSpec::new(&bar)?;
> +        let fw = Firmware::new(pdev.as_ref(), &spec, "535.113.01")?;
> +
> +        dev_info!(
> +            pdev.as_ref(),
> +            "NVIDIA {:?} ({:#x})",
> +            spec.chipset,
> +            spec.boot0
> +        );
> +
> +        Ok(pin_init!(Self { spec, bar, fw }))
> +    }
> +}
> diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
> new file mode 100644
> index 000000000000..b130d9ca6a0f
> --- /dev/null
> +++ b/drivers/gpu/nova-core/nova_core.rs
> @@ -0,0 +1,14 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Nova Core GPU Driver
> +
> +mod driver;
> +mod gpu;
> +
> +kernel::module_pci_driver! {
> +    type: driver::NovaCore,
> +    name: "NovaCore",
> +    author: "Danilo Krummrich",
> +    description: "Nova Core GPU driver",
> +    license: "GPL v2",
> +}
> diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
> index 44c9ef1435a2..5df981920a94 100644
> --- a/drivers/video/Kconfig
> +++ b/drivers/video/Kconfig
> @@ -39,6 +39,7 @@ source "drivers/gpu/vga/Kconfig"
>  
>  source "drivers/gpu/host1x/Kconfig"
>  source "drivers/gpu/ipu-v3/Kconfig"
> +source "drivers/gpu/nova-core/Kconfig"
>  
>  source "drivers/gpu/drm/Kconfig"
>  
> 
> base-commit: 69b8923f5003664e3ffef102e73333edfa2abdcf
> -- 
> 2.48.1
> 
