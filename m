Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1A71993B9;
	Mon, 14 Apr 2025 16:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744646963; cv=none; b=oS0wYLPwIVIxGnTh7T+UkY5jpVM2saAPTrrME1UshqA+/KQwO32K98aSralRR7KE/KonZ3A+WGQ3iDVYML2ln/OnhaEqx+6UpaBbcLjabmDsLD4e48pKsTbYhV0KPr5JUXm1YcNRHgvevEpj+23iZnqjSk/bbQdvlDLi79dnYDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744646963; c=relaxed/simple;
	bh=Wu+iGoA5VQw9S9rnUscSyi0f1HVvgz1n3Iw5Dm90KtU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EqknfHGzXG3xfp8DdymDFnvyoxod7lHdjLWfy5VRs66PgHiKR7rs/rLG83L80AXJ4tnSHjnyhPZ+NvQEMZS+JD0DlD9Dyy0WIbX/xcKqF/HmDh7mvNBXTt53QFNkFAmaDxzcHomkWqJ6DpuWWPdVaRh3cVWHXaWMlQlmuPulRBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cy4uJE7x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cy4uJE7x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24FE7C4CEE2;
	Mon, 14 Apr 2025 16:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744646962;
	bh=Wu+iGoA5VQw9S9rnUscSyi0f1HVvgz1n3Iw5Dm90KtU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cy4uJE7xJCjiyViNEYO0Z8oK8OcF/1u0n/wp5KkWho0R17WVVX9+D/27It9szFAlT
	 AX+vXWFY5ogITt88D5yp1u609Hv1t0x1D4i6Ayqy9ETXdKFsIhT6Qgo1I6ic5tRx1e
	 5R+1pEShWilLxJG3zfnuy/NikFnUTkz4CkMrJ1jqIpJWuGPdswgoIdC2tvYI3bbQdE
	 tRDjZG2ipoaSOe27b8Rano/6WVJKJ88lxql4rPLbwXxaQ2fgidIQzGNHksyEXKyLtr
	 0mBVfSJ709CZacDqmgDEblKLH1U7mQjzjsAjeTtfm5CCzYvlCpoWf6NkNPigZQ7W+2
	 1wL4RVgtPghgQ==
Date: Mon, 14 Apr 2025 18:09:16 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Remo Senekowitsch <remo@buenzli.dev>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 3/5] rust: property: Add child accessor and iterator
Message-ID: <Z_0zLK7K3G7QK3gT@cassiopeiae>
References: <20250326171411.590681-1-remo@buenzli.dev>
 <20250414152630.1691179-1-remo@buenzli.dev>
 <20250414152630.1691179-4-remo@buenzli.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414152630.1691179-4-remo@buenzli.dev>

On Mon, Apr 14, 2025 at 05:26:28PM +0200, Remo Senekowitsch wrote:
>  impl Device {
> @@ -68,6 +68,16 @@ pub fn property_read<'fwnode, 'name, T: Property>(
>      ) -> PropertyGuard<'fwnode, 'name, T> {
>          self.fwnode().property_read(name)
>      }
> +
> +    /// Returns first matching named child node handle.
> +    pub fn get_child_by_name(&self, name: &CStr) -> Option<ARef<FwNode>> {
> +        self.fwnode().get_child_by_name(name)
> +    }
> +
> +    /// Returns an iterator over a node's children.
> +    pub fn children<'a>(&'a self) -> impl Iterator<Item = ARef<FwNode>> + 'a {
> +        self.fwnode().children()
> +    }
>  }

Since those functions are within the impl Device block, please move them to
device.rs.

>  
>  /// A reference-counted fwnode_handle.
> @@ -89,6 +99,22 @@ pub fn property_read<'fwnode, 'name, T: Property>(
>  pub struct FwNode(Opaque<bindings::fwnode_handle>);
>  
>  impl FwNode {
> +    /// # Safety
> +    ///
> +    /// Callers must ensure that the reference count was incremented at least
> +    /// once, and that they are properly relinquishing one increment. That is,
> +    /// if there is only one increment, callers must not use the underlying
> +    /// object anymore -- it is only safe to do so via the newly created
> +    /// [`ARef`].

Please compile multiple safety requirements into a list.

> +    unsafe fn from_raw(raw: *mut bindings::fwnode_handle) -> ARef<Self> {
> +        // SAFETY: As per the safety requirement, raw has an incremented
> +        // refcount which won't be decremented elsewhere. It also it not null.

Same here.

> +        // It is safe to cast from a `*mut fwnode_handle` to `*mut FwNode`,
> +        // because `FwNode` is  defined as a `#[repr(transparent)]` wrapper
> +        // around `fwnode_handle`.

This should be CAST: instead.

> +        unsafe { ARef::from_raw(ptr::NonNull::new_unchecked(raw.cast())) }
> +    }
> +
>      /// Obtain the raw `struct fwnode_handle *`.
>      pub(crate) fn as_raw(&self) -> *mut bindings::fwnode_handle {
>          self.0.get()
> @@ -243,6 +269,53 @@ fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
>  
>          FwNodeDisplayPath(self)
>      }
> +
> +    /// Returns first matching named child node handle.
> +    pub fn get_child_by_name(&self, name: &CStr) -> Option<ARef<Self>> {
> +        // SAFETY: `self` and `name` are valid.

I'd say that `&self` is valid by its type invariant.

> +        let child =
> +            unsafe { bindings::fwnode_get_named_child_node(self.as_raw(), name.as_char_ptr()) };
> +        if child.is_null() {
> +            return None;
> +        }
> +        // SAFETY: `fwnode_get_named_child_node` returns a pointer with refcount incremented.

Please cover all safety requirements from from_raw().

> +        Some(unsafe { Self::from_raw(child) })
> +    }
> +
> +    /// Returns an iterator over a node's children.
> +    pub fn children<'a>(&'a self) -> impl Iterator<Item = ARef<FwNode>> + 'a {
> +        let mut prev: Option<ARef<FwNode>> = None;
> +
> +        core::iter::from_fn(move || {
> +            let prev_ptr = match prev.take() {
> +                None => ptr::null_mut(),
> +                Some(prev) => {
> +                    // We will pass `prev` to `fwnode_get_next_child_node`,
> +                    // which decrements its refcount, so we use
> +                    // `ARef::into_raw` to avoid decrementing the refcount
> +                    // twice.
> +                    let prev = ARef::into_raw(prev);
> +                    prev.as_ptr().cast()
> +                }
> +            };
> +            // SAFETY: `self.as_raw()` is valid. `prev_ptr` may be null,
> +            // which is allowed and corresponds to getting the first child.
> +            // Otherwise, `prev_ptr` is valid, as it is the stored return
> +            // value from the previous invocation. `prev_ptr` has its refount
> +            // incremented and it won't be decremented anymore on the Rust
> +            // side. `fwnode_get_next_child_node` decrements the refcount of
> +            // `prev_ptr`, so the refcount is handled correctly.

Please also compile this into a list.

> +            let next = unsafe { bindings::fwnode_get_next_child_node(self.as_raw(), prev_ptr) };
> +            if next.is_null() {
> +                return None;
> +            }
> +            // SAFETY: `fwnode_get_next_child_node` returns a pointer with
> +            // refcount incremented.

You rather need to justify why the next you pass into from_raw() is valid.

> +            let next = unsafe { FwNode::from_raw(next) };
> +            prev = Some(next.clone());
> +            Some(next)
> +        })
> +    }
>  }
>  
>  // SAFETY: Instances of `FwNode` are always reference-counted.
> -- 
> 2.49.0
> 
