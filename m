Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F6C220689;
	Tue, 29 Apr 2025 15:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745940610; cv=none; b=stnCasp5bYsh0PitDYJfgU9EIZ7+m9/oHJSRm4YUU4Q5ZERZd1hMHvj6c6Hr4QA/FmHSVIfDS5mc1nViVZxEuGTjzsc/7+guxSAcT5DcyPVMaNSAiQ2OsDSugR1ImkRRUqAGHDS6Uqkzh5aAXNDwsyhhrM/joBXCvdBdcSdzeaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745940610; c=relaxed/simple;
	bh=1gAxZsLYT0B/a+8HVLv1AyOIvhLrMv/i/lc2Dhynh1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NK9Aa2FB80Gx1mltWUOaTuV7iP3YVHvdlQRLkABfoxrovDs602aN3Ybm+Xq3I97dvMfCK4UdxZsPsNVZcNrwMmnQ0D3urAW0Y0oSFNxsiFAd0saP64DJ7JV/FIHvJVCbUOF8wBCG7+C50UGZDzSh8BsYAtnVsjcDHVyqPbrnUTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=kQTTifOs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kQTTifOs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B3DAC4CEE3;
	Tue, 29 Apr 2025 15:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745940609;
	bh=1gAxZsLYT0B/a+8HVLv1AyOIvhLrMv/i/lc2Dhynh1k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kQTTifOsH5l/F4Wwq7ZgaBx+eV2r4QLHzIxHfmNMalfqtC/c/Ul/v8x2CmSf8Ds3l
	 ZtM2n+zNqoakkcLpLmK+Ns7JZUwNysqJnA/eGQDoAJHznqNSwsApoPmDx9mPdnRWfo
	 lCBvxssNktqae2PeCqRPzX21hT3KCr0QWC0yh/OA=
Date: Tue, 29 Apr 2025 17:30:06 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 7/7] rust: alloc: add Vec::insert_within_capacity
Message-ID: <2025042925-kindly-squash-fa6f@gregkh>
References: <20250429-vec-methods-v4-0-dad4436ff82d@google.com>
 <20250429-vec-methods-v4-7-dad4436ff82d@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429-vec-methods-v4-7-dad4436ff82d@google.com>

On Tue, Apr 29, 2025 at 02:44:27PM +0000, Alice Ryhl wrote:
> This adds a variant of Vec::insert that does not allocate memory. This
> makes it safe to use this function while holding a spinlock. Rust Binder
> uses it for the range allocator fast path.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/kernel/alloc/kvec.rs | 39 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
> index 0682108951675cbee05faa130e5a9ce72fc343ba..998afdcde47bec94b2c9d990ba3afbb3488ea99e 100644
> --- a/rust/kernel/alloc/kvec.rs
> +++ b/rust/kernel/alloc/kvec.rs
> @@ -355,6 +355,45 @@ pub unsafe fn push_within_capacity_unchecked(&mut self, v: T) {
>          unsafe { self.inc_len(1) };
>      }
>  
> +    /// Inserts an element at the given index in the [`Vec`] instance.
> +    ///
> +    /// Fails if the vector does not have capacity for the new element. Panics if the index is out
> +    /// of bounds.

Why panic and why not just return an error instead?

thanks,

greg k-h
