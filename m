Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3AFB19E992;
	Sat, 28 Jun 2025 12:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751113265; cv=none; b=kEMY0Ls7JSwFaJP/+bdMlmwXRKs1XJoWGxPrnYuAoFRi0wdY9pqfu5gD8gAdReAOGv4ExdLpkNKMQV4aIxOLM+SmWMBtAf9MlkCntN5wv3rPwszN3rwavboDMDiaFG+dkk9Q65PtIxXHbwhOXbIZmL+409wWZhdLKuqV73J9cIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751113265; c=relaxed/simple;
	bh=0PMfZgVrVOhGJzluE63L4B+hXTDSgAsn2owIh7LlYxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y8vO/pkXNxWliyqxyNlMofV34LrA4zfHenRA8FoV4J4DxIhH5ctbzkDE1O26Vmq0GaZ6i8yxw3NzDXxvA/POHxyyQpCJrFP87ehoM9/rfNX6H47PaUV0BLxPy92qhs1KkdhkhVtrNvUatDhDnCXujJe1AVHgxQ26j0pCsRNWoNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j2FN0Yrl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j2FN0Yrl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C89F1C4CEEA;
	Sat, 28 Jun 2025 12:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751113265;
	bh=0PMfZgVrVOhGJzluE63L4B+hXTDSgAsn2owIh7LlYxc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j2FN0YrlWAytnO47v/Wig6KgbAnFZBd2spjfO84QK+78w05me/rXOETn9GWD7X4Uj
	 yoN/R32FkflU77pPuLlvjBGoPTfFu8tylqbGNqxegg7OuqXqjwPMD8uCy1YEYJa+ge
	 C+83c7r7OupaxW4/rouaOzkLsJ8xGROAvD/MOXNXCYt1K2Uiq3ec/CWZoZQ9RcYPee
	 e8iB27VxqzgfkLn8D3ZthXrQyoZ6vGVMqEJJKyNue/I7dCURKZEFmc3X1y3brjd95Y
	 /A2ufsq8CXAOrHFQikdS42ITHwwqU/qtd/kVqxs3YLD4jA5k94G+a+3gvhp5ZgeX8r
	 X/m7XeQNFj/FQ==
Date: Sat, 28 Jun 2025 14:21:01 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org, Uladzislau Rezki <urezki@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v8 3/4] rust: add support for NUMA ids in allocations
Message-ID: <aF_eLTlirxl-1jPP@pollux>
References: <20250628102315.2542656-1-vitaly.wool@konsulko.se>
 <20250628102611.2542910-1-vitaly.wool@konsulko.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250628102611.2542910-1-vitaly.wool@konsulko.se>

On Sat, Jun 28, 2025 at 12:26:11PM +0200, Vitaly Wool wrote:
> +/// Non Uniform Memory Access (NUMA) node identifier
> +#[derive(Clone, Copy, PartialEq)]
> +pub struct NumaNode(i32);
> +
> +impl NumaNode {
> +    /// create a new NUMA node identifer (non-negative integer)
> +    /// returns EINVAL if a negative id is specified
> +    pub fn new(node: i32) -> Result<Self> {
> +        if node < 0 {
> +            return Err(EINVAL);
> +        }

Should we also check for MAX_NUMNODES?

> +        Ok(Self(node))
> +    }
> +}

<snip>

> +    /// Re-allocate an existing memory allocation to satisfy the requested `layout` and
> +    /// optionally a specific NUMA node request to allocate the memory for.

It's not an Option anymore, so we may want to drop 'optionally'. Also please
leave an empty line here.

> +    /// Systems employing a Non Uniform Memory Access (NUMA) architecture contain
> +    /// collections of hardware resources including processors, memory, and I/O buses,
> +    /// that comprise what is commonly known as a NUMA node.
> +    /// `nid` stands for NUMA id, i. e. NUMA node identifier, which is a non-negative
> +    /// integer if a node needs to be specified, or NUMA_NO_NODE if the caller doesn't care.

Please also explain what happens when the NumaNode changes between calls to
realloc_node().

Does it have to remain the same NumaNode? Do we need a safety requirement for
that?

(Btw. no need to send a new version right away, leave a few days for people to
catch up and comment on this one or the other patches before resending.)

>      ///
>      /// If the requested size is zero, `realloc` behaves equivalent to `free`.
>      ///
> @@ -191,13 +246,29 @@ fn alloc(layout: Layout, flags: Flags) -> Result<NonNull<[u8]>, AllocError> {
>      ///   and old size, i.e. `ret_ptr[0..min(layout.size(), old_layout.size())] ==
>      ///   p[0..min(layout.size(), old_layout.size())]`.
>      /// - when the return value is `Err(AllocError)`, then `ptr` is still valid.
> -    unsafe fn realloc(
> +    unsafe fn realloc_node(
>          ptr: Option<NonNull<u8>>,
>          layout: Layout,
>          old_layout: Layout,
>          flags: Flags,
> +        nid: NumaNode,
>      ) -> Result<NonNull<[u8]>, AllocError>;
