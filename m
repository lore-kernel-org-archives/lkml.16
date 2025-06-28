Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94D012EBE7;
	Sat, 28 Jun 2025 19:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751140601; cv=none; b=uNaMa09vh2ImeR7/kz4ycXzf+eyETW8TsUhsaT0HYUGvWhr0vifuA7ZwfGWnv68tqMxVP0oETR/eQ2Hnw2OpunsDxgN9BVZbef1kXrtFv6q2TbrhrVBBipCZsKpr2H4+77A6H5ZRnhIw6orvqWJKM2SwdKlcByP8bJXLnAg4joQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751140601; c=relaxed/simple;
	bh=7EFuR7v62rmp+Nsd6GA8/D69P/09BRwxpEiGB7Qdkw8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gqa1EmR9uJ4PbL76rpsiPSEtTJOYEENnQiD5U6AifSNfqH+sHxy6n31zHPQOmo5YOQuJygWQoOiW7K2bDnmS5FGe45N68P71QxtwZo/MyLrc4DnrZGgiTyQRS6OSHjcYdcp3NKcJNEK2MS9Qbk9swxTML/7t/o8L14iTbD0fgMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=Xmh1+0NA; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="Xmh1+0NA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CfoIUO+Ef1k+kJgQ4jHgv30hIZLDnCERC1vBwIInGrE=; b=Xmh1+0NAWBIu8Ir8rvjJXALRus
	epDhg+o1Weqt8Ih+4e5zJSZmQvOevt6/XYDWhGh2mgbYNFNSEfMlup6QnsfpXp466Rpsis76xYAjJ
	gg86EpOWYVT1TYTbsRPszwB9jRCAOAZ7B3VkIvJh7KinGjCLAts3vgEiqKLslWNavpb079GVorf7f
	ftt3JERE6+tTcN6z9voxwJQSbPbsjHWadSbUS2uJMK+oJQPvWZ4Hhr2TA4DkvfPG0YX2a4qfiJrLv
	X1cm1/w5ToFu2DjTjd0JdrTTrwm7HiicGcIELkzt6BG1vhofPaXVS6aTn9MK/F89ITMj1LephYGUF
	uOxoAjrQ==;
Received: from [189.7.87.79] (helo=[192.168.0.7])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uVbeW-009qOr-NM; Sat, 28 Jun 2025 21:55:57 +0200
Message-ID: <f0ad78da-d4ba-44ec-beda-4f8c616053f8@igalia.com>
Date: Sat, 28 Jun 2025 16:55:44 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Introduce Tyr
To: Daniel Almeida <daniel.almeida@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Daniel Stone <daniels@collabora.com>,
 Rob Herring <robh@kernel.org>, Alice Ryhl <alice.ryhl@google.com>,
 Beata Michalska <beata.michalska@arm.com>,
 Carsten Haitzler <carsten.haitzler@foss.arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Ashley Smith <ashley.smith@collabora.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, kernel@collabora.com
References: <20250627-tyr-v1-1-cb5f4c6ced46@collabora.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20250627-tyr-v1-1-cb5f4c6ced46@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Daniel,

On 27/06/25 19:34, Daniel Almeida wrote:

[...]

> diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..2443620e10620585eae3d57978e64d2169a1b2d1
> --- /dev/null
> +++ b/drivers/gpu/drm/tyr/driver.rs
> @@ -0,0 +1,188 @@
> +// SPDX-License-Identifier: GPL-2.0 or MIT
> +
> +use core::pin::Pin;
> +
> +use kernel::bits::bit_u32;
> +use kernel::c_str;
> +use kernel::clk::Clk;
> +use kernel::device::Core;
> +use kernel::devres::Devres;
> +use kernel::drm;
> +use kernel::drm::ioctl;
> +use kernel::io;
> +use kernel::io::mem::IoMem;
> +use kernel::new_mutex;
> +use kernel::of;
> +use kernel::platform;
> +use kernel::prelude::*;
> +use kernel::regulator;
> +use kernel::regulator::Regulator;
> +use kernel::sync::Arc;
> +use kernel::sync::Mutex;
> +use kernel::time;
> +use kernel::types::ARef;
> +
> +use crate::file::File;
> +use crate::gem::TyrObject;
> +use crate::gpu;
> +use crate::gpu::GpuInfo;
> +use crate::regs;
> +
> +/// Convienence type alias for the DRM device type for this driver
> +pub(crate) type TyrDevice = drm::device::Device<TyrDriver>;
> +
> +#[pin_data(PinnedDrop)]
> +pub(crate) struct TyrDriver {
> +    device: ARef<TyrDevice>,
> +}
> +
> +#[pin_data]
> +pub(crate) struct TyrData {
> +    pub(crate) pdev: ARef<platform::Device>,
> +
> +    #[pin]
> +    clks: Mutex<Clocks>,
> +
> +    #[pin]
> +    regulators: Mutex<Regulators>,
> +
> +    // Some inforation on the GPU. This is mainly queried by userspace (mesa).

s/inforation/information

> +    pub(crate) gpu_info: GpuInfo,
> +}
> +
> +unsafe impl Send for TyrData {}
> +unsafe impl Sync for TyrData {}
> +
> +fn issue_soft_reset(iomem: &Devres<IoMem<0>>) -> Result<()> {
> +    let irq_enable_cmd = 1 | bit_u32(8);

To enhance readability, consider using a regmap similar to
panthor_regs.h. This would help avoid 'magic numbers' and make the
code's intent much clearer.

> +    regs::GPU_CMD.write(iomem, irq_enable_cmd)?;
> +
> +    let op = || regs::GPU_INT_RAWSTAT.read(iomem);
> +    let cond = |raw_stat: &u32| -> bool { (*raw_stat >> 8) & 1 == 1 };
> +    let res = io::poll::read_poll_timeout(
> +        op,
> +        cond,
> +        time::Delta::from_millis(100),
> +        Some(time::Delta::from_micros(20000)),
> +    );
> +
> +    if let Err(e) = res {
> +        pr_err!("GPU reset failed with errno {}\n", e.to_errno());
> +        pr_err!(
> +            "GPU_INT_RAWSTAT is {}\n",
> +            regs::GPU_INT_RAWSTAT.read(iomem)?
> +        );
> +    }
> +
> +    Ok(())
> +}
> +
> +kernel::of_device_table!(
> +    OF_TABLE,
> +    MODULE_OF_TABLE,
> +    <TyrDriver as platform::Driver>::IdInfo,
> +    [
> +        (of::DeviceId::new(c_str!("rockchip,rk3588-mali")), ()),
> +        (of::DeviceId::new(c_str!("arm,mali-valhall-csf")), ())
> +    ]
> +);
> +
> +impl platform::Driver for TyrDriver {
> +    type IdInfo = ();
> +    const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>> = Some(&OF_TABLE);
> +
> +    fn probe(
> +        pdev: &platform::Device<Core>,
> +        _info: Option<&Self::IdInfo>,
> +    ) -> Result<Pin<KBox<Self>>> {
> +        dev_dbg!(pdev.as_ref(), "Probed Tyr\n");
> +
> +        let core_clk = Clk::get(pdev.as_ref(), Some(c_str!("core")))?;
> +        let stacks_clk = Clk::get(pdev.as_ref(), Some(c_str!("stacks")))?;

Shouldn't it be OptionalClk::get? From the DT schema for "arm,mali-
valhall-csf", I see that "stacks" and "coregroups" are optional.

> +        let coregroup_clk = Clk::get(pdev.as_ref(), Some(c_str!("coregroup")))?;

Same.

Best Regards,
- Maíra

