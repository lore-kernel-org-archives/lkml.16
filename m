Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB1329899B;
	Fri, 11 Apr 2025 09:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744365070; cv=none; b=QzakRo2dMLm3A8O8/lOcUhsooRJLzMGzuaUYcucIaGGz0so9G3DQ7S2NOuK/W+CzG7A6jHv/4nF5Z82OMp98RXZrzqG6MVUtISOoL8daESkndvjcufEE1Ubl37wd2fzfh9z6vE6ztz9GETE6eyuDyNcx3OtZHuY3i8lISCqOznQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744365070; c=relaxed/simple;
	bh=wvnOv5eAEw+Z3zqhOidw9lT9fYZueQvCHXPEEptv4JY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rO0Y487ANdPzeEgPYclClikkoEmr4KeJD4dsTSwwfgKLTlup8FdAKRhYfKp58fg9a8eoHMUPVPQTSedW5/YXXxfQJVGOWxQJKnrE9vL4o/sW1Y19fzrXsvB9SgJ1m+nycy2ea62R+uAO02lPS9G8x70Qv45ZysThgTp67UFiIvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FrOTsqMo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FrOTsqMo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D6E5C4CEE8;
	Fri, 11 Apr 2025 09:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744365069;
	bh=wvnOv5eAEw+Z3zqhOidw9lT9fYZueQvCHXPEEptv4JY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FrOTsqMoWVB0W7bYpwbgh3rg8QTVkfPBDvaMOVqo2yUZ8n5xATjjs1zIvtbTZmPbF
	 Z7rc+isvY5+p0nMaLsd54Yk043AjDX0VjvQN3Dt11S4XUxzv2oftyrzMXtG7LMHJQW
	 k1VVu3hRLyt+DXMqXw84Tjny2IewyajrdCQTsT4GGY3MZKsz3Qa4uYMh82SELDmL1w
	 bPkF9bc56cKGIt/HooHSDpKmiRUP0LlvGx5rXvUp9UQ8kwAjzOdc+5o334tZASaqTO
	 pqWTl6z7QXxgQYixjGLpnlVYb4DoH/4qK/zufS+w2/nyzz7oESniaL3xXrFSNIHC5j
	 rmxowx41BbIDg==
Date: Fri, 11 Apr 2025 11:51:03 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: rust-for-linux@vger.kernel.org, abdiel.janulgue@gmail.com,
	daniel.almeida@collabora.com, robin.murphy@arm.com,
	a.hindborg@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	benno.lossin@proton.me, aliceryhl@google.com, tmgross@umich.edu,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rust: helpers: Add dma_alloc_attrs() and
 dma_free_attrs()
Message-ID: <Z_jmBz6FBoYMMGyi@cassiopeiae>
References: <20250410234332.153242-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410234332.153242-1-fujita.tomonori@gmail.com>

On Fri, Apr 11, 2025 at 08:43:32AM +0900, FUJITA Tomonori wrote:
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

Please add the new file to the corresponding MAINTAINERS entry. Whith that,

	Acked-by: Danilo Krummrich <dakr@kernel.org>
