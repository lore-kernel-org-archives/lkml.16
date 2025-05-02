Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8402F15A848;
	Fri,  2 May 2025 14:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746194856; cv=none; b=sM5CI7vt0xIaW6JgHFnDIOdm6kCEdg49wL6ve2MKyzHPNG1Gc2PPZOhXYpmGMAzacMCcoNg8ndHGc5i1XGFuuLVl03LUF/izjcrmi10PSqq8vKH8wM0SxewrJzTQI6yAWHMpff0fyPLZIVIcLS7rMsT36OvKejj2QlPXQVIQgNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746194856; c=relaxed/simple;
	bh=d7e/BxF8TUjSA3tEyDtY7crUEk0g5PG6PGzTvVanYqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qbCXAfUojCVeFWlYk4rtadn94ipix5JUnQbZwyOmyeE/Pkgu++dKZgS3qxTg+ibq31DgZNrc3Q1bOMDAz1sTSvdbisjeL/rtB2RFz6+N9/G08T10BgPi8b7i1ij7ufW27NVvEFhMeUR3HQTDZBaVbaYg3+gannge9Euv+i2vJjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Z/LC/4L2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Z/LC/4L2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D52EC4CEE4;
	Fri,  2 May 2025 14:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746194855;
	bh=d7e/BxF8TUjSA3tEyDtY7crUEk0g5PG6PGzTvVanYqU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z/LC/4L2Eru4VYZ0NiiqWiYuLOtJPX5P/ekk31UfSch8CdE0wFxXZiCJAErSCE+sE
	 PKzO560NlLDxapjUfzHZqxX+nHwA0Gd7pa5XWneWNhau8ZLCHxhbHyguSnIUf4mJAB
	 OfqTLur3oUO2RzjLNcmN9hcpMgdXqqb0JgqUj7L8=
Date: Fri, 2 May 2025 16:07:33 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/7] rust: alloc: add Vec::push_within_capacity
Message-ID: <2025050215-affluent-repair-3bb2@gregkh>
References: <20250502-vec-methods-v5-0-06d20ad9366f@google.com>
 <20250502-vec-methods-v5-3-06d20ad9366f@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502-vec-methods-v5-3-06d20ad9366f@google.com>

On Fri, May 02, 2025 at 01:19:31PM +0000, Alice Ryhl wrote:
> This introduces a new method called `push_within_capacity` for appending
> to a vector without attempting to allocate if the capacity is full. Rust
> Binder will use this in various places to safely push to a vector while
> holding a spinlock.
> 
> The implementation is moved to a push_within_capacity_unchecked method.
> This is preferred over having push() call push_within_capacity()
> followed by an unwrap_unchecked() for simpler unsafe.
> 
> Panics in the kernel are best avoided when possible, so an error is
> returned if the vector does not have sufficient capacity. An error type
> is used rather than just returning Result<(),T> to make it more
> convenient for callers (i.e. they can use ? or unwrap).
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/kernel/alloc/kvec.rs        | 46 ++++++++++++++++++++++++++++++++++++----
>  rust/kernel/alloc/kvec/errors.rs | 23 ++++++++++++++++++++
>  2 files changed, 65 insertions(+), 4 deletions(-)
> 
> diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
> index ebca0cfd31c67f3ce13c4825d7039e34bb54f4d4..e9bf4c97a5a78fc9b54751b57f15a33c716c607b 100644
> --- a/rust/kernel/alloc/kvec.rs
> +++ b/rust/kernel/alloc/kvec.rs
> @@ -21,6 +21,9 @@
>      slice::SliceIndex,
>  };
>  
> +mod errors;
> +pub use self::errors::PushError;
> +
>  /// Create a [`KVec`] containing the arguments.
>  ///
>  /// New memory is allocated with `GFP_KERNEL`.
> @@ -307,17 +310,52 @@ pub fn spare_capacity_mut(&mut self) -> &mut [MaybeUninit<T>] {
>      /// ```
>      pub fn push(&mut self, v: T, flags: Flags) -> Result<(), AllocError> {
>          self.reserve(1, flags)?;
> +        // SAFETY: The call to `reserve` was successful, so the capacity is at least one greater
> +        // than the length.
> +        unsafe { self.push_within_capacity_unchecked(v) };
> +        Ok(())
> +    }
>  
> +    /// Appends an element to the back of the [`Vec`] instance without reallocating.
> +    ///
> +    /// Fails if the vector does not have capacity for the new element.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// let mut v = KVec::with_capacity(10, GFP_KERNEL)?;
> +    /// for i in 0..10 {
> +    ///     v.push_within_capacity(i)?;
> +    /// }
> +    ///
> +    /// assert!(v.push_within_capacity(10).is_err());
> +    /// # Ok::<(), Error>(())
> +    /// ```
> +    pub fn push_within_capacity(&mut self, v: T) -> Result<(), PushError<T>> {
> +        if self.len() < self.capacity() {
> +            // SAFETY: The length is less than the capacity.
> +            unsafe { self.push_within_capacity_unchecked(v) };
> +            Ok(())
> +        } else {
> +            Err(PushError(v))
> +        }
> +    }
> +
> +    /// Appends an element to the back of the [`Vec`] instance without reallocating.
> +    ///
> +    /// # Safety
> +    ///
> +    /// The length must be less than the capacity.
> +    pub unsafe fn push_within_capacity_unchecked(&mut self, v: T) {

Why does this have to be public?  Does binder need to call this instead
of just push_within_capacity()?

thanks,

greg k-h
