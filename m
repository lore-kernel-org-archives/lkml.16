Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5CD2DFA4E;
	Mon, 14 Apr 2025 21:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744665592; cv=none; b=qTkS2WHhRB+WXZwPvD4An8asIwhq/c8yi5CXo+6BvgjMCL8fMUUO5K3jzVIji+VvHTh28iYQuUFmY2AjFVQUe4ba9+h9d+M8brPSm3DnftTrqVEdh6BYsURjO+kQBJeq/6A9edVIBQXasvgTpb1+9OWiRGEX6yuXxey79ukRJNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744665592; c=relaxed/simple;
	bh=H93VNNIXfbQLimUNFSJa77wmOJ7vkVnE/zIgwACvebQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JvMJgjiibXl7UOa779bvmms+kSnScDU5n4XDSpHzwrwCz5e30WT9mKyyfWNLjQXfdr+b5fHupN6+rXApxJeAidoZ6yPixNx9Wfmt55oXq/BDPXq2r9hBQcTfSqMIfk7ouYUO5f0uaZfZKbrfqpS+qcwQVabYFR0vGzSeLJeJLpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TpDtmXx3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TpDtmXx3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB9FDC4CEE2;
	Mon, 14 Apr 2025 21:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744665592;
	bh=H93VNNIXfbQLimUNFSJa77wmOJ7vkVnE/zIgwACvebQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TpDtmXx379/yjgEyW6s4SjU5AVRj4ESJXMaGDUI8xeQOxIK0tRVEDoRDFiADj7sVk
	 eAt2FmNvU657mJVfBBft+s3UXMbSnh98u2vyOpSRgUnGckjGboabfVb9J6I0YwaYQB
	 pCmoJG21uaE1j3zvqK01z/QG7L/gJlcEIlcwKt29HhGDNtjYoQrgrkvhJW9GjVkp/8
	 Qt0D8oVOaHnhChBd1wRR2d50ngS4mdmZqjpCYijL6Lk6XbyHfj9ijT4H1dKlTOecgI
	 BgIzzwFMerrdUZP5nMPl0faMp4/NB3dU3ll15P+F4JB8ucpWo1By/1BBEmCdDBmbtT
	 V2C6Vs1P7nDRA==
Date: Mon, 14 Apr 2025 23:19:46 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: rust-for-linux@vger.kernel.org, abdiel.janulgue@gmail.com,
	daniel.almeida@collabora.com, robin.murphy@arm.com,
	a.hindborg@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	benno.lossin@proton.me, aliceryhl@google.com, tmgross@umich.edu,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] rust: helpers: Add dma_alloc_attrs() and
 dma_free_attrs()
Message-ID: <Z_178hskzPrEbDXe@cassiopeiae>
References: <20250412000507.157000-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250412000507.157000-1-fujita.tomonori@gmail.com>

On Sat, Apr 12, 2025 at 09:05:06AM +0900, FUJITA Tomonori wrote:
> Add dma_alloc_attrs() and dma_free_attrs() helpers to fix a build
> error when CONFIG_HAS_DMA is not enabled.
> 
> Note that when CONFIG_HAS_DMA is enabled, dma_alloc_attrs() and
> dma_free_attrs() are included in both bindings_generated.rs and
> bindings_helpers_generated.rs. The former takes precedence so behavior
> remains unchanged in that case.
> 
> This fixes the following build error on UML:
> 
> error[E0425]: cannot find function `dma_alloc_attrs` in crate `bindings`
>      --> rust/kernel/dma.rs:171:23
>       |
> 171   |               bindings::dma_alloc_attrs(
>       |                         ^^^^^^^^^^^^^^^ help: a function with a similar name exists: `dma_alloc_pages`
>       |
>      ::: /home/fujita/build/um/rust/bindings/bindings_generated.rs:44568:5
>       |
> 44568 | /     pub fn dma_alloc_pages(
> 44569 | |         dev: *mut device,
> 44570 | |         size: usize,
> 44571 | |         dma_handle: *mut dma_addr_t,
> 44572 | |         dir: dma_data_direction,
> 44573 | |         gfp: gfp_t,
> 44574 | |     ) -> *mut page;
>       | |___________________- similarly named function `dma_alloc_pages` defined here
> 
> error[E0425]: cannot find function `dma_free_attrs` in crate `bindings`
>      --> rust/kernel/dma.rs:293:23
>       |
> 293   |               bindings::dma_free_attrs(
>       |                         ^^^^^^^^^^^^^^ help: a function with a similar name exists: `dma_free_pages`
>       |
>      ::: /home/fujita/build/um/rust/bindings/bindings_generated.rs:44577:5
>       |
> 44577 | /     pub fn dma_free_pages(
> 44578 | |         dev: *mut device,
> 44579 | |         size: usize,
> 44580 | |         page: *mut page,
> 44581 | |         dma_handle: dma_addr_t,
> 44582 | |         dir: dma_data_direction,
> 44583 | |     );
>       | |______- similarly named function `dma_free_pages` defined here
> 
> Fixes: ad2907b4e308 ("rust: add dma coherent allocator abstraction")
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Acked-by: Danilo Krummrich <dakr@kernel.org>
