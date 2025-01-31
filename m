Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A8415F330;
	Fri, 31 Jan 2025 13:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738329896; cv=none; b=jSAW2GvMNN+mSjG8JperlKNNFFL4yXygThhI0zqiNaboEQ+70E5W8sUOnc9+9EcyTkvPeaVIaR2FG3h9p9/E9tx936l1jAyvk/PAtgSZ9yVDCNcrmP/Bba+EVQANrVVCuL0kOT4+vUcFP20HkW7k2k++i/FO3gJDqFXzVw5qIdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738329896; c=relaxed/simple;
	bh=CTkeOGbuxbE//jeVznsLacPanDLT8HrnTbbZBnopIxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tOZWPfJ5qDSAZbPUzste34mOQqHmOQxPF/Sm6UPg/OAUEbikZRvKdhsBkyn2MgCAYJcXDRQVIXjwB/mCSwbyhuzveVHoKHG0yPcsm+o65EweqzGLUS3KFPfB4MVOyH7NR6HyIulSxVrX5flIbFioibawDnZrkzZRNjKb+ek8OGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pKA0Oyuo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pKA0Oyuo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34B3DC4CED1;
	Fri, 31 Jan 2025 13:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738329895;
	bh=CTkeOGbuxbE//jeVznsLacPanDLT8HrnTbbZBnopIxg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pKA0OyuoOhtuuCac0kThBl0XROcpoFsvhGaqLmAA4tsmy67Zj8FaId4aSjrmvo4km
	 4YvZugVm/qJYopue0aGVOtLy0f276KlOcimNrymDsGJNAbWl10YwPjN5RPwaUEbnXD
	 f43GVFGTXdD0+ETOsw4loS6VqneibsWzqHMomakpnH4fjPZ9aLiyvF3iburKQLwwjp
	 /3mOQtHnzM0IV8BEBN02+J136vU4XiqSzR5OJPP4hzkL9fKiIaZE2xzTxIeVLJAb3c
	 Mtdn4rLUaYGI0+DR7cYfFX/S2+TgkvAi79LpgJQdEzkVqO5ogZ7Ttny2KoE3ZCL5Sh
	 3D1znPjnL7fBQ==
Date: Fri, 31 Jan 2025 14:24:50 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Fiona Behrens <me@kloenk.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rust: io: move offset_valid and io_addr(_assert) to
 IoRaw
Message-ID: <Z5zPIim8VutswOGC@pollux>
References: <20250128-rust-io-offset-v2-1-222de7c96a34@kloenk.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250128-rust-io-offset-v2-1-222de7c96a34@kloenk.dev>

On Tue, Jan 28, 2025 at 01:46:00PM +0100, Fiona Behrens wrote:
> Move the helper functions `offset_valid`, `io_addr` and
> `io_addr_asset` from `Io` to `IoRaw`. This allows `IoRaw` to be reused
> if other abstractions with different write/read functions are
> needed (e.g. `writeb` vs `iowrite` vs `outb`).
> 
> Signed-off-by: Fiona Behrens <me@kloenk.dev>
> ---
> Changes in v2:
> - make the io_addr functions private again
> - reword the invariant description
> - use the invariant (unchecked_add)
> - Link to v1: https://lore.kernel.org/r/20250122-rust-io-offset-v1-1-914725ab55ed@kloenk.dev
> ---
>  rust/kernel/io.rs | 99 +++++++++++++++++++++++++++++++++++--------------------
>  1 file changed, 64 insertions(+), 35 deletions(-)
> 
> diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
> index d4a73e52e3ee68f7b558749ed0108acde92ae5fe..c4dd8289705eacc93e285f4e25fb6262f605328c 100644
> --- a/rust/kernel/io.rs
> +++ b/rust/kernel/io.rs
> @@ -15,6 +15,11 @@
>  /// Instead, the bus specific MMIO implementation must convert this raw representation into an `Io`
>  /// instance providing the actual memory accessors. Only by the conversion into an `Io` structure
>  /// any guarantees are given.
> +///
> +/// # Invariant

As mentioned in v1, please put the addition of the invariant and the subsequent
switch to unchecked_add() into a separate patch.

Also note that unchecked_math is not stable before 1.79, but the minimum
supported version is 1.78 currently, hence you see Clippy complain.

So, I think we'd need to enable unchecked_math in order to use this, not sure
that's worth though. Plus, I'm not sure this makes the Clippy lint warning go
away by itself.

> +///
> +/// - `maxsize` is larger or equal to `SIZE`.
> +/// - `addr + maxsize` is always smaller then [`usize::MAX`] so that it fits in virtual memory.

My reply to this line from v1 was more meant as a question, because I wasn't
entirely sure if you want to say that this does never overflow, or if you want
to say that this must be within the bounds of some address space. Sorry for the
confusion.

I think this should be limited to saying that `addr + maxsize` does not overflow
and leave the rest to the `Io` type.

Please also note that you can't assume that `usize::MAX` is always equivalent to
the size of the virtual address space.

>  pub struct IoRaw<const SIZE: usize = 0> {
>      addr: usize,
>      maxsize: usize,
> @@ -23,24 +28,76 @@ pub struct IoRaw<const SIZE: usize = 0> {
>  impl<const SIZE: usize> IoRaw<SIZE> {
>      /// Returns a new `IoRaw` instance on success, an error otherwise.
>      pub fn new(addr: usize, maxsize: usize) -> Result<Self> {
> -        if maxsize < SIZE {
> +        if maxsize < SIZE || addr.checked_add(maxsize).is_none() {
>              return Err(EINVAL);
>          }
>  
> +        // INVARIANT: `maxsize` is at least `SIZE`, `addr + maxsize` is not wrapping.
>          Ok(Self { addr, maxsize })
>      }
>  
>      /// Returns the base address of the MMIO region.
>      #[inline]
> -    pub fn addr(&self) -> usize {
> +    pub const fn addr(&self) -> usize {
>          self.addr
>      }
>  
>      /// Returns the maximum size of the MMIO region.
>      #[inline]
> -    pub fn maxsize(&self) -> usize {
> +    pub const fn maxsize(&self) -> usize {
>          self.maxsize
>      }
> +
> +    /// Check if the offset plus the size of the type `U` fits in the bounds of `size`.
> +    /// Also checks if the offset is aligned with the type size.

I think it's good to add documentation even if not required. Please do so in a
separate patch though.

> +    #[inline]
> +    const fn offset_valid<U>(offset: usize, size: usize) -> bool {
> +        let type_size = core::mem::size_of::<U>();
> +        if let Some(end) = offset.checked_add(type_size) {
> +            end <= size && offset % type_size == 0
> +        } else {
> +            false
> +        }
> +    }
> +
> +    /// Check if the offset (plus the type size) is out of bounds.
> +    ///
> +    /// Runtime checked version of [`io_addr_assert`].
> +    ///
> +    /// See [`offset_valid`] for the performed offset check.
> +    ///
> +    /// # Errors
> +    ///
> +    /// Returns [`EINVAL`] if the type does not fit into [`IoRaw`] at the given offset.
> +    ///
> +    /// [`offset_valid`]: Self::offset_valid
> +    /// [`io_addr_assert`]: Self::io_addr_assert
> +    #[inline]
> +    fn io_addr<U>(&self, offset: usize) -> Result<usize> {
> +        if !Self::offset_valid::<U>(offset, self.maxsize()) {
> +            return Err(EINVAL);
> +        }
> +
> +        // SAFETY: by the invariant of `IoRaw` this cannot overflow.
> +        Ok(unsafe { self.addr().unchecked_add(offset) })
> +    }
> +
> +    /// Check at build time if the offset (plus the type size) is out of bounds.
> +    ///
> +    /// Compiletime checked version of [`io_addr`].
> +    ///
> +    /// See [`offset_valid`] for the performed offset check.
> +    ///
> +    ///
> +    /// [`offset_valid`]: Self::offset_valid
> +    /// [`io_addr`]: Self::io_addr
> +    #[inline]
> +    const fn io_addr_assert<U>(&self, offset: usize) -> usize {
> +        build_assert!(Self::offset_valid::<U>(offset, SIZE));
> +
> +        // SAFETY: by the invariant of `IoRaw` this cannot overflow.
> +        unsafe { self.addr().unchecked_add(offset) }
> +    }
>  }
>  
>  /// IO-mapped memory, starting at the base address @addr and spanning @maxlen bytes.
> @@ -116,7 +173,7 @@ macro_rules! define_read {
>          $(#[$attr])*
>          #[inline]
>          pub fn $name(&self, offset: usize) -> $type_name {
> -            let addr = self.io_addr_assert::<$type_name>(offset);
> +            let addr = self.0.io_addr_assert::<$type_name>(offset);
>  
>              // SAFETY: By the type invariant `addr` is a valid address for MMIO operations.
>              unsafe { bindings::$name(addr as _) }
> @@ -128,7 +185,7 @@ pub fn $name(&self, offset: usize) -> $type_name {
>          /// out of bounds.
>          $(#[$attr])*
>          pub fn $try_name(&self, offset: usize) -> Result<$type_name> {
> -            let addr = self.io_addr::<$type_name>(offset)?;
> +            let addr = self.0.io_addr::<$type_name>(offset)?;
>  
>              // SAFETY: By the type invariant `addr` is a valid address for MMIO operations.
>              Ok(unsafe { bindings::$name(addr as _) })
> @@ -145,7 +202,7 @@ macro_rules! define_write {
>          $(#[$attr])*
>          #[inline]
>          pub fn $name(&self, value: $type_name, offset: usize) {
> -            let addr = self.io_addr_assert::<$type_name>(offset);
> +            let addr = self.0.io_addr_assert::<$type_name>(offset);
>  
>              // SAFETY: By the type invariant `addr` is a valid address for MMIO operations.
>              unsafe { bindings::$name(value, addr as _, ) }
> @@ -157,7 +214,7 @@ pub fn $name(&self, value: $type_name, offset: usize) {
>          /// out of bounds.
>          $(#[$attr])*
>          pub fn $try_name(&self, value: $type_name, offset: usize) -> Result {
> -            let addr = self.io_addr::<$type_name>(offset)?;
> +            let addr = self.0.io_addr::<$type_name>(offset)?;
>  
>              // SAFETY: By the type invariant `addr` is a valid address for MMIO operations.
>              unsafe { bindings::$name(value, addr as _) }
> @@ -190,34 +247,6 @@ pub fn maxsize(&self) -> usize {
>          self.0.maxsize()
>      }
>  
> -    #[inline]
> -    const fn offset_valid<U>(offset: usize, size: usize) -> bool {
> -        let type_size = core::mem::size_of::<U>();
> -        if let Some(end) = offset.checked_add(type_size) {
> -            end <= size && offset % type_size == 0
> -        } else {
> -            false
> -        }
> -    }
> -
> -    #[inline]
> -    fn io_addr<U>(&self, offset: usize) -> Result<usize> {
> -        if !Self::offset_valid::<U>(offset, self.maxsize()) {
> -            return Err(EINVAL);
> -        }
> -
> -        // Probably no need to check, since the safety requirements of `Self::new` guarantee that
> -        // this can't overflow.
> -        self.addr().checked_add(offset).ok_or(EINVAL)
> -    }
> -
> -    #[inline]
> -    fn io_addr_assert<U>(&self, offset: usize) -> usize {
> -        build_assert!(Self::offset_valid::<U>(offset, SIZE));
> -
> -        self.addr() + offset
> -    }
> -
>      define_read!(readb, try_readb, u8);
>      define_read!(readw, try_readw, u16);
>      define_read!(readl, try_readl, u32);
> 
> ---
> base-commit: 01b3cb620815fc3feb90ee117d9445a5b608a9f7
> change-id: 20250122-rust-io-offset-7b39b11e84ac
> 
> Best regards,
> -- 
> Fiona Behrens <me@kloenk.dev>
> 
