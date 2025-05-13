Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77291AD3E0;
	Tue, 13 May 2025 14:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747147851; cv=none; b=Ym7wEGnvNyRKN2KrlAaoCby43FXW8U4OR1WqY/cLA450gpaGHFL1G6hXsj5jZU7Y/TS5WsZzlwUslJ/0ojnIk1YwcNFntWLQVCuxHYlOJmICvfz/qt3k9Ur7i5TNTS4KxkxaSqtlN7W7ODC2CpONfepGerEzoPMAIJiVMx4zE3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747147851; c=relaxed/simple;
	bh=P0yYrCIcx+PDwB9Lm4fz/iNcnTAiCqq+e79+nMbOLq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jpSwkFuRgfaGNzq/sD+oor+UvarPdYLy7c0GPcaYU0MVaoLWAaXI1/PzhfqmM5q5pKrj+HN5Q0p6ny3+u+5aMCqL695V7mu3snUd9KfgLkRAucJbfpqX1pNqXkf2BhbR+EkaAy1A44sNWe10wV+iSm8CO4u0E7DklJOqzQuRVnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s4hhYmnM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s4hhYmnM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84AAFC4CEE4;
	Tue, 13 May 2025 14:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747147850;
	bh=P0yYrCIcx+PDwB9Lm4fz/iNcnTAiCqq+e79+nMbOLq0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s4hhYmnMkgCWhLxei+8Im/qiK+MQYg6mKhl5PS2aQQEscXeywewtbJvpSVLj4R0AM
	 trPAIQM6fK9Isiju+k23VZfxrSfYmoj99pSHLWNaloR5GXdn0UMQ8Scg4ZGcilQrud
	 0Qhq7YnrjgeWXkxzSFlgZ/P862iwELBMt5savjgD/KV2DFkdwWBPE2GUSClsHCgMmV
	 vRCCOpQzliTZOP1h4HTdGeHFqSB60CUy5P13cVx3jty5P/q7XiDOhhDjuyCFvho9wb
	 p5/ckzKaxsVtPgXy8A3J93gAu5pct2VOmNdoMUwPMRdmpyHUlmf9bc80mnwHKd5RlS
	 BvAwESHTBAK3w==
Date: Tue, 13 May 2025 16:50:43 +0200
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
Subject: Re: [PATCH v3 12/19] gpu: nova-core: add helper function to wait on
 condition
Message-ID: <aCNcQ835i40UUW--@pollux>
References: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
 <20250507-nova-frts-v3-12-fcb02749754d@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507-nova-frts-v3-12-fcb02749754d@nvidia.com>

On Wed, May 07, 2025 at 10:52:39PM +0900, Alexandre Courbot wrote:
> While programming the hardware, we frequently need to busy-wait until
> a condition (like a given bit of a register to switch value) happens.
> 
> Add a basic `wait_on` helper function to wait on such conditions
> expressed as a closure, with a timeout argument.
> 
> This is temporary as we will switch to `read_poll_timeout` [1] once it
> is available.
> 
> [1] https://lore.kernel.org/lkml/20250220070611.214262-8-fujita.tomonori@gmail.com/
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/util.rs | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/drivers/gpu/nova-core/util.rs b/drivers/gpu/nova-core/util.rs
> index 332a64cfc6a9d7d787fbdc228887c0be53a97160..afb525228431a2645afe7bb34988e9537757b1d7 100644
> --- a/drivers/gpu/nova-core/util.rs
> +++ b/drivers/gpu/nova-core/util.rs
> @@ -1,5 +1,10 @@
>  // SPDX-License-Identifier: GPL-2.0
>  
> +use core::time::Duration;
> +
> +use kernel::prelude::*;
> +use kernel::time::Ktime;
> +
>  pub(crate) const fn to_lowercase_bytes<const N: usize>(s: &str) -> [u8; N] {
>      let src = s.as_bytes();
>      let mut dst = [0; N];
> @@ -19,3 +24,28 @@ pub(crate) const fn const_bytes_to_str(bytes: &[u8]) -> &str {
>          Err(_) => kernel::build_error!("Bytes are not valid UTF-8."),
>      }
>  }
> +
> +/// Wait until `cond` is true or `timeout` elapsed.
> +///
> +/// When `cond` evaluates to `Some`, its return value is returned.
> +///
> +/// `Err(ETIMEDOUT)` is returned if `timeout` has been reached without `cond` evaluating to
> +/// `Some`.
> +///
> +/// TODO: replace with `read_poll_timeout` once it is available.
> +/// (https://lore.kernel.org/lkml/20250220070611.214262-8-fujita.tomonori@gmail.com/)
> +#[expect(dead_code)]
> +pub(crate) fn wait_on<R, F: Fn() -> Option<R>>(timeout: Duration, cond: F) -> Result<R> {
> +    let start_time = Ktime::ktime_get();
> +
> +    loop {
> +        if let Some(ret) = cond() {
> +            return Ok(ret);
> +        }
> +
> +        let cur_time = Ktime::ktime_get();
> +        if (cur_time - start_time).to_ns() > timeout.as_nanos() as i64 {
> +            return Err(ETIMEDOUT);
> +        }
> +    }
> +}

NIT: Can't you use this for wait_gfw_boot_completion() too?
