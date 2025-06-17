Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B382DFF1B;
	Tue, 17 Jun 2025 16:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750178001; cv=none; b=nZHnaFczDx+eFc/j3FGefDxWjti48ALEOQp+xl4xMyUffMhG5qSo61tYYKvwYHCLZ1auUM/ZHVi5oHPsuapwqtI8MULlYtm8e+iZC/WYpUF/QQ80fw7tVdWg1ew5ll0vKcldAWBebBcUD3cfuXVV/wBGq6F1Jb73wulcfOk1maU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750178001; c=relaxed/simple;
	bh=D4zqKCNVSdpYD1YROivJ0iKR8RbuS0zFHwcD2L/OpL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=boNCLcwkK9+rnRqj0jADF+4+JFaO9woIEJYHHo4tT9chUWfqvVu8g/89Zs6qrRsyHh2YRFZO6Hfjjnxf2a2MPTHbf8E0izqqvBAIP3+0tM/PZR8eYSd4zhu5nY2ejqrnAMCwqUJYghrygOY/g38uHVV8pGGxngRDe+gu/MbbK+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LIz1PzBz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LIz1PzBz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83A29C4CEF1;
	Tue, 17 Jun 2025 16:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750178001;
	bh=D4zqKCNVSdpYD1YROivJ0iKR8RbuS0zFHwcD2L/OpL8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LIz1PzBzebeAd+/tDjDgnCiSkeGDg6nio65KqXEjJABtem5BBu8bfq0AvAOS2l0DN
	 fR/rsmoZ/ISn4BjDo+mcPMHMHZGbyocq8EN55SX3iSr7s423IG11i4ZNxxRIrEaiAH
	 8MMtVraOED3V6dWoyeX4V8EqlpsUSZ37dRAIg+KZgTZqCMjPtXQ8N0uNjJKT48MVo7
	 xW+x3ej9sPA0uf3ophgULjaQcAf0fXoozVvbzxjawegrmJQrmwx8b3gPNkJmn0s/3A
	 h5KySjhvIOh0nSUboQjAacLT/uHjrlMkVdmMmCaB2vA+KAiEJ1LM8EERhK4yEII7X4
	 oPeT2BXLdI1jQ==
Date: Tue, 17 Jun 2025 18:33:13 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Benno Lossin <lossin@kernel.org>,
	John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH v5 15/23] gpu: nova-core: add falcon register definitions
 and base code
Message-ID: <aFGYyXS21tZFdldX@pollux>
References: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
 <20250612-nova-frts-v5-15-14ba7eaf166b@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612-nova-frts-v5-15-14ba7eaf166b@nvidia.com>

On Thu, Jun 12, 2025 at 11:01:43PM +0900, Alexandre Courbot wrote:
> +    /// Perform a DMA write according to `load_offsets` from `dma_handle` into the falcon's
> +    /// `target_mem`.
> +    ///
> +    /// `sec` is set if the loaded firmware is expected to run in secure mode.
> +    fn dma_wr(
> +        &self,
> +        bar: &Bar0,
> +        dma_handle: bindings::dma_addr_t,

I think we should pass &F from dma_load() rather than the raw handle.

<snip>

> +fn select_core_ga102<E: FalconEngine>(bar: &Bar0) -> Result {
> +    let bcr_ctrl = regs::NV_PRISCV_RISCV_BCR_CTRL::read(bar, E::BASE);
> +    if bcr_ctrl.core_select() != PeregrineCoreSelect::Falcon {
> +        regs::NV_PRISCV_RISCV_BCR_CTRL::default()
> +            .set_core_select(PeregrineCoreSelect::Falcon)
> +            .write(bar, E::BASE);
> +
> +        util::wait_on(Duration::from_millis(10), || {

As agreed, can you please add a brief comment to justify the timeout?

> +            let r = regs::NV_PRISCV_RISCV_BCR_CTRL::read(bar, E::BASE);
> +            if r.valid() {
> +                Some(())
> +            } else {
> +                None
> +            }
> +        })?;
> +    }
> +
> +    Ok(())
> +}
> +
> +fn signature_reg_fuse_version_ga102(
> +    dev: &device::Device,
> +    bar: &Bar0,
> +    engine_id_mask: u16,
> +    ucode_id: u8,
> +) -> Result<u32> {
> +    // The ucode fuse versions are contained in the FUSE_OPT_FPF_<ENGINE>_UCODE<X>_VERSION
> +    // registers, which are an array. Our register definition macros do not allow us to manage them
> +    // properly, so we need to hardcode their addresses for now.

Sounds like a TODO?

> +
> +    // Each engine has 16 ucode version registers numbered from 1 to 16.
> +    if ucode_id == 0 || ucode_id > 16 {
> +        dev_err!(dev, "invalid ucode id {:#x}", ucode_id);
> +        return Err(EINVAL);
> +    }
> +
> +    // Base address of the FUSE registers array corresponding to the engine.
> +    let reg_fuse_base = if engine_id_mask & 0x0001 != 0 {
> +        regs::NV_FUSE_OPT_FPF_SEC2_UCODE1_VERSION::OFFSET
> +    } else if engine_id_mask & 0x0004 != 0 {
> +        regs::NV_FUSE_OPT_FPF_NVDEC_UCODE1_VERSION::OFFSET
> +    } else if engine_id_mask & 0x0400 != 0 {
> +        regs::NV_FUSE_OPT_FPF_GSP_UCODE1_VERSION::OFFSET
> +    } else {
> +        dev_err!(dev, "unexpected engine_id_mask {:#x}", engine_id_mask);
> +        return Err(EINVAL);
> +    };
> +
> +    // Read `reg_fuse_base[ucode_id - 1]`.
> +    let reg_fuse_version =
> +        bar.read32(reg_fuse_base + ((ucode_id - 1) as usize * core::mem::size_of::<u32>()));
> +
> +    Ok(fls_u32(reg_fuse_version))
> +}
> +
> +fn program_brom_ga102<E: FalconEngine>(bar: &Bar0, params: &FalconBromParams) -> Result {
> +    regs::NV_PFALCON2_FALCON_BROM_PARAADDR::default()
> +        .set_value(params.pkc_data_offset)
> +        .write(bar, E::BASE);
> +    regs::NV_PFALCON2_FALCON_BROM_ENGIDMASK::default()
> +        .set_value(params.engine_id_mask as u32)
> +        .write(bar, E::BASE);
> +    regs::NV_PFALCON2_FALCON_BROM_CURR_UCODE_ID::default()
> +        .set_ucode_id(params.ucode_id)
> +        .write(bar, E::BASE);
> +    regs::NV_PFALCON2_FALCON_MOD_SEL::default()
> +        .set_algo(FalconModSelAlgo::Rsa3k)
> +        .write(bar, E::BASE);
> +
> +    Ok(())
> +}
> +
> +pub(super) struct Ga102<E: FalconEngine>(PhantomData<E>);
> +
> +impl<E: FalconEngine> Ga102<E> {
> +    pub(super) fn new() -> Self {
> +        Self(PhantomData)
> +    }
> +}
> +
> +impl<E: FalconEngine> FalconHal<E> for Ga102<E> {
> +    fn select_core(&self, _falcon: &Falcon<E>, bar: &Bar0) -> Result {
> +        select_core_ga102::<E>(bar)
> +    }
> +
> +    fn signature_reg_fuse_version(
> +        &self,
> +        falcon: &Falcon<E>,
> +        bar: &Bar0,
> +        engine_id_mask: u16,
> +        ucode_id: u8,
> +    ) -> Result<u32> {
> +        signature_reg_fuse_version_ga102(&falcon.dev, bar, engine_id_mask, ucode_id)
> +    }
> +
> +    fn program_brom(&self, _falcon: &Falcon<E>, bar: &Bar0, params: &FalconBromParams) -> Result {
> +        program_brom_ga102::<E>(bar, params)
> +    }

Why are those two separate functions?
