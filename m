Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D5A28E5EF;
	Tue, 22 Apr 2025 14:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745333194; cv=none; b=Np8iaMhsnZ+v1PFE6nuv4QJ2FnkyYhyzA/jLQgiMkMiNxjqmHgcVgvAKozStoTVwRNxnRK1r4BL2lXYkfccNwFoXkcfv1nwKmKrHuc41MzmB9N1l7zdhvzCxlxJoys+iqhOIMIcTbXET2XoALY/69l5subcC7GdoINpvZ8inkD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745333194; c=relaxed/simple;
	bh=JgGqmEvB2i0l21vTcFZrdqY+M7OFwFjriQNygbR07Vo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TAtBghVuAhTi9MEChERbhQbtI4sdqroUB7QsNhFWIpYW7n58K+9koW7NUtvksEYUr+FG3Wle2mlY+91LMrZOeY92iCYxZNLgr0pz3h8zyK99YnzRH2FOHKqIEtLwFQ9AuSOn+8GNEMK7Qjw/5AZ7lh9pFv13a/BboFjOrMQl5Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pdO2A0wN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pdO2A0wN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32060C4CEE9;
	Tue, 22 Apr 2025 14:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745333193;
	bh=JgGqmEvB2i0l21vTcFZrdqY+M7OFwFjriQNygbR07Vo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pdO2A0wN1ZV8jA9qx0DrlTiJxaOVS4zcZW4dGeGCosQ19JsMt7rtnaEjwiKCgeS7i
	 vZ2eW3ddFv0JWSH+RZahh3K6EFnlEpQbzI8FJFrAXoLM9Bb86WuUUBGi2w+EpA6zkY
	 QhVcXfdEz6r7kuzVWIqxmA6ECVrjGpWs7PpkS1tblZRgd2BMjM9IkfeJFcZS/ZyFd+
	 n8TlTi4qGz8cuGZWZpIh204QCPbKlf91YWxvaNixQcDjQs6ytwI24ic/qhJFLvmHBm
	 RxVgBc1efGnlG8ZFaM43Ad+E9ITsOcws6ErqccMuctgqdh/vUqvZqUb3ULL04347mM
	 FCaZiVsM+Ex7w==
Date: Tue, 22 Apr 2025 16:46:26 +0200
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
Subject: Re: [PATCH 12/16] gpu: nova-core: firmware: add ucode descriptor
 used by FWSEC-FRTS
Message-ID: <aAerwsnx5VRQr_bM@cassiopeiae>
References: <20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com>
 <20250420-nova-frts-v1-12-ecd1cca23963@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250420-nova-frts-v1-12-ecd1cca23963@nvidia.com>

On Sun, Apr 20, 2025 at 09:19:44PM +0900, Alexandre Courbot wrote:
> FWSEC-FRTS is the first firmware we need to run on the GSP falcon in
> order to initiate the GSP boot process. Introduce the structure that
> describes it.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/firmware.rs | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
> index 9bad7a86382af7917b3dce7bf3087d0002bd5971..4ef5ba934b9d255635aa9a902e1d3a732d6e5568 100644
> --- a/drivers/gpu/nova-core/firmware.rs
> +++ b/drivers/gpu/nova-core/firmware.rs
> @@ -43,6 +43,34 @@ pub(crate) fn new(
>      }
>  }
>  
> +/// Structure used to describe some firmwares, notable fwsec-frts.
> +#[allow(dead_code)]

Please use 'expect'.

> +#[repr(C)]
> +#[derive(Debug, Clone)]
> +pub(crate) struct FalconUCodeDescV3 {

Can we get some more documentation on the fields please? :)

> +    pub(crate) hdr: u32,
> +    pub(crate) stored_size: u32,
> +    pub(crate) pkc_data_offset: u32,
> +    pub(crate) interface_offset: u32,
> +    pub(crate) imem_phys_base: u32,
> +    pub(crate) imem_load_size: u32,
> +    pub(crate) imem_virt_base: u32,
> +    pub(crate) dmem_phys_base: u32,
> +    pub(crate) dmem_load_size: u32,
> +    pub(crate) engine_id_mask: u16,
> +    pub(crate) ucode_id: u8,
> +    pub(crate) signature_count: u8,
> +    pub(crate) signature_versions: u16,
> +    _reserved: u16,
> +}
> +
> +#[allow(dead_code)]
> +impl FalconUCodeDescV3 {
> +    pub(crate) fn size(&self) -> usize {
> +        ((self.hdr & 0xffff0000) >> 16) as usize

What's this magic number?

> +    }
> +}
> +
>  pub(crate) struct ModInfoBuilder<const N: usize>(firmware::ModInfoBuilder<N>);
>  
>  impl<const N: usize> ModInfoBuilder<N> {
> 
> -- 
> 2.49.0
> 
