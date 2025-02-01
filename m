Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A190557C93;
	Sat,  1 Feb 2025 20:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738441137; cv=none; b=Oxjr9effwESZe4bTi6yuJ2FoE5d3MS1IFFA62n/voeQOGwMdH1rvqhILjvXzpkemXHKtE3oyhgshtvrzsh0LEYCL6SWj14r94Hep1iIrX5Flf472acc+CTe5eeEXrNuKEYJ68ymw9xjcWFM9JYMIHR0gEJGttOzjdLGvh6SYdGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738441137; c=relaxed/simple;
	bh=jQ2C1OnHFQeRr8iuhNwG7Wmt3VisSFpx7/8o7DxopKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kaqnh7IvphBhbi1flX4ThKMawspQl4wxanYW0sXjQMBRReTWzGlf+j9lJksLike+Ft3j8YVe6ShWEHJBKnVo1cfnEXFt8x9vtZjf/kXB3OTuoI+b3yPDCSBIB+9xtKY7hyZ0XeYONQk1y/JT+Qc3UoRgthnjjfL65OvUlWhaxps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WKqrgy52; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WKqrgy52"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74416C4CED3;
	Sat,  1 Feb 2025 20:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738441137;
	bh=jQ2C1OnHFQeRr8iuhNwG7Wmt3VisSFpx7/8o7DxopKY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WKqrgy52ia10F++gj8edPZZjc0GU7lSu8Xq9LSuevEhacrji8MQTlW5/wLaiu2mYp
	 kO7iNBvJofq1JxswWkfU+2gZ0uDvxJG5XPYZX0gRkCcHzCKLO599XAWR2B1f2wqy7q
	 d7/GJzOsaqOC9aOXZ5OI4Hx1dWo5yqM/dbDUUZT02JfIyhPRwQSlXBtxdEhk2pXcuU
	 dDQ4UL/QvipFMsG3OJc82tbVUXIgubSWdSxZU0DWYwPCn4gjzGtvKl9Y6u9ced+TLG
	 rqw/2HA5UTGgOjTSBN4QPNL1mfzuIGA4lewahXLu3xIGHszENswz4gWS3ii/EFzEiy
	 AWVkkalGviN5Q==
Date: Sat, 1 Feb 2025 21:18:51 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: alloc: satisfy `aligned_alloc` requirements
Message-ID: <Z56Bq94kPaN9UX5H@cassiopeiae>
References: <20250201-aligned-alloc-v1-1-c99a73f3cbd4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250201-aligned-alloc-v1-1-c99a73f3cbd4@gmail.com>

Hi Tamir,

On Sat, Feb 01, 2025 at 01:58:10PM -0500, Tamir Duberstein wrote:
> The implementation added in commit dd09538fb409 ("rust: alloc: implement
> `Cmalloc` in module allocator_test") did not honor the documented
> requirements of `aligned_alloc`. These requirements may not be enforced
> on all system, but they are on macOS. Ensure that alignment is at least
> `sizeof(void *)` and round size up to the nearest multiple of that
> value.

Good catch!

> 
> Fixes: dd09538fb409 ("rust: alloc: implement `Cmalloc` in module allocator_test")
> 
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
>  rust/kernel/alloc/allocator_test.rs | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/rust/kernel/alloc/allocator_test.rs b/rust/kernel/alloc/allocator_test.rs
> index e3240d16040b..f360fc2e20f2 100644
> --- a/rust/kernel/alloc/allocator_test.rs
> +++ b/rust/kernel/alloc/allocator_test.rs
> @@ -62,9 +62,22 @@ unsafe fn realloc(
>              ));
>          }
>  
> +        // According to `man aligned_alloc`:
> +        //
> +        // aligned_alloc() returns a NULL pointer and sets errno to EINVAL if size is not an
> +        // integral multiple of alignment, or if alignment is not a power of 2 at least as large as
> +        // sizeof(void *).
> +        let alignment = layout.align();
> +        let minimum_alignment = core::mem::size_of::<*const crate::ffi::c_void>();
> +        let (alignment, size) = if alignment < minimum_alignment {
> +            (minimum_alignment, layout.size().div_ceil(minimum_alignment) * minimum_alignment)
> +        } else {
> +            (alignment, layout.size())
> +        };
> +

I think I prefer this to be slightly more compact:

   let min_align = core::mem::size_of::<*const crate::ffi::c_void>();
   let (align, size) = if layout.align() < min_align {
       (min_align, layout.size().div_ceil(min_align) * min_align)
   } else {
       (layout.align(), layout.size())
   };
