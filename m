Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2221825EF94;
	Wed, 30 Apr 2025 16:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746030533; cv=none; b=NAy6kV4b7g2KgG8dD98krShO4n1bX9PaAprVO2gJrb/vhfB8QdkC1Xn19F6mdZjaztlByEoQjmwOJ4ktc9v2QRncrv+EY6K/eLNLoWmKDi2KYz+KDkCxA1YqqGBvQ9Ivs1jL6qJVuqraH7SvmATbzRsEg+B9Nm1K2lPRhmxA5aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746030533; c=relaxed/simple;
	bh=zJEsZfclfJJ9q0TudxX4nxNPBJ0S4XZP6V2/NTGY5KE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dS80yynd563MK4CX6mcfSMaq2jj+rL3qTohI+2xZOHoSEEXjNaHa6RQ/wmcXF1t2oRv1/3/jQUQU7uFkh3DqbilV/MA4cclsduVbnmpgZfv+kyBX80MMeS9sLVxrrgRP8uIMuXO7/R3v75BLJGByJe0o8rvGiK+X0OBQNlZOtUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BvibGgjO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BvibGgjO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93FA3C4CEE7;
	Wed, 30 Apr 2025 16:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746030532;
	bh=zJEsZfclfJJ9q0TudxX4nxNPBJ0S4XZP6V2/NTGY5KE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BvibGgjOSo1zrEUEOotIhNjZhw2pJyhzeOqbbclg7/6NyPAfTGtmSxMGSYdcWg3Ne
	 qftoVAypH+NI1P94i2gwwxwCbQdK6n62fAiRUUbR9RTSA6/uJZdTR1IdnBGBEXpgHw
	 QYL1BuzY2uazHPZFA/MMZWeJLzO8t1gjPUgY3KIuBLK7oj+ssANh7HBO8RIZDCbQnN
	 b8f0gn0zg/wE06KPVp0RWpfhBMKW0USdr+LZXoQpeG9VS4eBDL5jZRY6n5PS0j3+oR
	 C/KfrsnkFJEHWBhCFJZsY6KQKrzt2OqcCJTa2iKR8Jd+cq8K5iWIYN5aPCkXdSfbsf
	 K0MdhuHR8JJiA==
Date: Wed, 30 Apr 2025 18:28:48 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 6/7] rust: alloc: add Vec::remove
Message-ID: <aBJPwKeJy1ixtwg2@pollux>
References: <20250429-vec-methods-v4-0-dad4436ff82d@google.com>
 <20250429-vec-methods-v4-6-dad4436ff82d@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429-vec-methods-v4-6-dad4436ff82d@google.com>

On Tue, Apr 29, 2025 at 02:44:26PM +0000, Alice Ryhl wrote:
> This is needed by Rust Binder in the range allocator, and by upcoming
> GPU drivers during firmware initialization.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/kernel/alloc/kvec.rs | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
> index 357f5a37c7b1d15b709a10c162292841eed0e376..0682108951675cbee05faa130e5a9ce72fc343ba 100644
> --- a/rust/kernel/alloc/kvec.rs
> +++ b/rust/kernel/alloc/kvec.rs
> @@ -386,6 +386,42 @@ pub fn pop(&mut self) -> Option<T> {
>          Some(unsafe { removed.read() })
>      }
>  
> +    /// Removes the element at the given index.
> +    ///
> +    /// # Panics
> +    ///
> +    /// Panics if the index is out of bounds.

Let's check for the index and return an error instead. I know we also can't
prevent OOB index access panics for e.g. slices, but here we can control it.
