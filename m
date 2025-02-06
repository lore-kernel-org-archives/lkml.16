Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE495225A52;
	Thu,  6 Feb 2025 21:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738878991; cv=none; b=gOcq6qZLkc/MCgCk/zLF0CH/qNW+XwDavKcB58le/GpIWbZoy3Bg2gr9k9S5QPx/bpJWZekdFsu+dBEJRKbMRB5v4mcjTP03O/WrakOEHHGwqKrLEaEuLObLiF000z+tMqcs8Dp4RHp8EsSZqkIcCbYpPtd271f0HYl0sExnqDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738878991; c=relaxed/simple;
	bh=QLEA8ohyIX8hj6vGPgsirNp6XqzX1i1bIJAJO4b/5I8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cs+rPncPyyXFvdYSyUwhm7wJlyu7qw85kkjzALOVOt8f0w1zXEG3D+ss4mw1X/Mg7zoa82YDYUzpBIDvE0oOcprFbdtmfbBt3tlKeN2PT2mXtnhC1Xon5GZC+6st1ksSNYZUB0fuxHBpUuDGfBlwC970+32V/P44nbXKJQoI50I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UXr4Ygby; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UXr4Ygby"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E09F2C4CEDD;
	Thu,  6 Feb 2025 21:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738878991;
	bh=QLEA8ohyIX8hj6vGPgsirNp6XqzX1i1bIJAJO4b/5I8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UXr4Ygby3tsCgsNjJPbjqbEOpLA2kV6LXwGMCw/GMwalPFlcz8Ta8BSyFIsJnDjoD
	 SwZk/pWwGHWoHiDMII80f1+4wD/3gz2rzOS0ZIDoy4dLHN4cQoDG8xAx9Ksqk2MOJ4
	 S1Fwfgwcudf56JxNp8o8eUkQZRZuKoxObGqTaQrpLvQM8HldT6ImvLOff23xvE+B7Z
	 HSUmgAn+z9pWMSbpTy+5c8M8dZ5lW4dlcL6m9DDq+vERYLX8z9yjqPQUlq2zfW87y+
	 FTdBrk6Lwl0Jgr6DHUNnZF3d4C380Gc0AevwraBvI85MfSFNCoI1o7QaHpOFU/pHmh
	 0uFrvuIk4ghpQ==
Date: Thu, 6 Feb 2025 22:56:26 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] rust: allocator_test: use `posix_memalign`
Message-ID: <Z6UwCtaO-qVYEN2Z@cassiopeiae>
References: <20250206-aligned-alloc-v3-1-0cbc0ab0306d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206-aligned-alloc-v3-1-0cbc0ab0306d@gmail.com>

On Thu, Feb 06, 2025 at 03:49:00PM -0500, Tamir Duberstein wrote:
> The implementation added in commit dd09538fb409 ("rust: alloc: implement
> `Cmalloc` in module allocator_test") used `aligned_malloc` which has
> implementation-defined requirements of its `alignment` parameter.
> 
> The macOS implementation of `aligned_alloc` appears to be based on
> `posix_memalign` and inherits the stricter requirements of that
> function, causing test failures on macOS.
> 
> Replace `aligned_alloc` with `posix_memalign` and comply with its
> requirements. This ensures uniform behavior across systems.
> 
> Fixes: dd09538fb409 ("rust: alloc: implement `Cmalloc` in module allocator_test")
> 
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Let's wait for clarification before moving on. :)

> ---
> I've intentionally not picked up Danilo's Acked-by from v2 because the
> approach has changed quite a bit.
> ---
> Changes in v3:
> - Replace `aligned_malloc` with `posix_memalign` for portability.
> - Link to v2: https://lore.kernel.org/r/20250202-aligned-alloc-v2-1-5af0b5fdd46f@gmail.com
> 
> Changes in v2:
> - Shorten some variable names. (Danilo Krummrich)
> - Replace shadowing alignment variable with a second call to
>   Layout::align. (Danilo Krummrich)
> - Link to v1: https://lore.kernel.org/r/20250201-aligned-alloc-v1-1-c99a73f3cbd4@gmail.com
> ---
>  rust/kernel/alloc/allocator_test.rs | 27 +++++++++++++++++++++++----
>  1 file changed, 23 insertions(+), 4 deletions(-)
> 
> diff --git a/rust/kernel/alloc/allocator_test.rs b/rust/kernel/alloc/allocator_test.rs
> index e3240d16040b..0aa68d955b39 100644
> --- a/rust/kernel/alloc/allocator_test.rs
> +++ b/rust/kernel/alloc/allocator_test.rs
> @@ -23,8 +23,19 @@
>  pub type KVmalloc = Kmalloc;
>  
>  extern "C" {
> -    #[link_name = "aligned_alloc"]
> -    fn libc_aligned_alloc(align: usize, size: usize) -> *mut crate::ffi::c_void;
> +    // NB: `posix_memalign` is intentionally used instead of `aligned_malloc`.
> +    //
> +    // ISO C (ISO/IEC 9899:2011) defines `aligned_malloc`:
> +    //
> +    // > The value of alignment shall be a valid alignment supported by the implementation [...].
> +    //
> +    // POSIX.1-2001 (IEEE 1003.1-2001) defines `posix_memalign`:
> +    //
> +    // > The value of alignment shall be a power of two multiple of sizeof (void *).
> +    //
> +    // `posix_memalign` is more portable than (but otherwise identical to) `aligned_malloc`.
> +    #[link_name = "posix_memalign"]
> +    fn libc_posix_memalign(align: usize, size: usize) -> *mut crate::ffi::c_void;

I don't think this can work. posix_memalign() is defined as follows.

int posix_memalign(void **memptr, size_t alignment, size_t size)

Besides that, I don't think switching to posix_memalign() is desirable, it only
seems to make the code more complicated.
