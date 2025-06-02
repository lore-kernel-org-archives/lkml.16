Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC887485;
	Mon,  2 Jun 2025 12:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748867179; cv=none; b=EIFsE4yVD3YgnUCr5vc6o0I0xz+AdPd7H0k3Fr1JMaapoZJ9TLpYArZ+CWpwKNtT3lJPim2A35oheFwKeVELk82KFiksJA/QbO+KVd8ArJQXX323Uw0VabAGl4kPWwSQ18nmsqbY8nOKinM4HK/OpieT8G5qN201Otd2nb3LGU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748867179; c=relaxed/simple;
	bh=pGav0rV/4DOUeGB4H+ahrH4gCJmO5uEhsOKx1aE0EmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W15GFh1G5SqLNNhNxJ9wgZI7eJ/ce7BGPsca8l9CVdDlIPxSXXO8biRav7h7dhCyKqNINu2q3iBdNGL5biQXO+NMlaf7Gg8fqIUkmtQsBVieVS2Ma3tos+rk6IPglYONfMh1NaE0Y6yFIcOfczi3OaCbE5v9Ye5/eqJMnaW6SwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qxjHyms0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qxjHyms0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 027E9C4CEEB;
	Mon,  2 Jun 2025 12:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748867178;
	bh=pGav0rV/4DOUeGB4H+ahrH4gCJmO5uEhsOKx1aE0EmE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qxjHyms02HjbpPTnGWZmqPqj+KZ/H1XdJ1NYNG9XS0FeIlay0EBDS/PLxYFMVRGuH
	 S+7p1YqfJWknZdMnu2Td8xPx83dfa8SHf8G3sbAUBzuNSFEda7QDF8dOx1fNV/riLh
	 JOuLYdLUrSsjhDhA0C9EKzqtgKFYox3J4kBIesPZwmnoOOQ5gb18yvnZyr/FMETj5N
	 Kz2EV3nl1s3gMZnLm6UoygG3u42IfoVBWRY0lTH7P+IGy87/ALjBjlRFSOXyuJFPna
	 JevSrOgnIB/vTQN9wAlY6CrFAffxKMjqm+yDdHenBqjrMn7XybM64UjNNC3FvVDTml
	 4v6OBQp0S88tA==
Date: Mon, 2 Jun 2025 14:26:11 +0200
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
	John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 15/20] gpu: nova-core: firmware: add ucode descriptor
 used by FWSEC-FRTS
Message-ID: <aD2YY_zpo01rYkgN@pollux>
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-15-05dfd4f39479@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521-nova-frts-v4-15-05dfd4f39479@nvidia.com>

On Wed, May 21, 2025 at 03:45:10PM +0900, Alexandre Courbot wrote:
> FWSEC-FRTS is the first firmware we need to run on the GSP falcon in
> order to initiate the GSP boot process. Introduce the structure that
> describes it.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/firmware.rs | 43 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
> index 4b8a38358a4f6da2a4d57f8db50ea9e788c3e4b5..f675fb225607c3efd943393086123b7aeafd7d4f 100644
> --- a/drivers/gpu/nova-core/firmware.rs
> +++ b/drivers/gpu/nova-core/firmware.rs
> @@ -41,6 +41,49 @@ pub(crate) fn new(dev: &device::Device, chipset: Chipset, ver: &str) -> Result<F
>      }
>  }
>  
> +/// Structure used to describe some firmwares, notably FWSEC-FRTS.
> +#[repr(C)]
> +#[derive(Debug, Clone)]
> +pub(crate) struct FalconUCodeDescV3 {
> +    /// Header defined by `NV_BIT_FALCON_UCODE_DESC_HEADER_VDESC*` in OpenRM.
> +    ///
> +    /// Bits `31:16` contain the size of the header, after which the actual ucode data starts.

The field is private; this information is much more needed in Self::size().

> +    hdr: u32,
> +    /// Stored size of the ucode after the header.
> +    stored_size: u32,
> +    /// Offset in `DMEM` at which the signature is expected to be found.
> +    pub(crate) pkc_data_offset: u32,
> +    /// Offset after the code segment at which the app headers are located.
> +    pub(crate) interface_offset: u32,
> +    /// Base address at which to load the code segment into `IMEM`.
> +    pub(crate) imem_phys_base: u32,
> +    /// Size in bytes of the code to copy into `IMEM`.
> +    pub(crate) imem_load_size: u32,
> +    /// Virtual `IMEM` address (i.e. `tag`) at which the code should start.
> +    pub(crate) imem_virt_base: u32,
> +    /// Base address at which to load the data segment into `DMEM`.
> +    pub(crate) dmem_phys_base: u32,
> +    /// Size in bytes of the data to copy into `DMEM`.
> +    pub(crate) dmem_load_size: u32,
> +    /// Mask of the falcon engines on which this firmware can run.
> +    pub(crate) engine_id_mask: u16,
> +    /// ID of the ucode used to infer a fuse register to validate the signature.
> +    pub(crate) ucode_id: u8,
> +    /// Number of signatures in this firmware.
> +    pub(crate) signature_count: u8,
> +    /// Versions of the signatures, used to infer a valid signature to use.
> +    pub(crate) signature_versions: u16,
> +    _reserved: u16,
> +}
> +
> +// To be removed once that code is used.
> +#[expect(dead_code)]
> +impl FalconUCodeDescV3 {

    const HDR_SIZE_SHIFT: u32 = 16;
    const HDR_SIZE_MASK: u32 = 0xffff0000;

> +    pub(crate) fn size(&self) -> usize {
> +        ((self.hdr & 0xffff0000) >> 16) as usize

	((self.hdr & HDR_SIZE_MASK) >> Self::HDR_SIZE_SHIFT)

In this case it may look a bit pointless, but I think it would make sense to
establish to store consts for shifts and masks in general, such that one can get
an easy overview of the layout of the structure.
