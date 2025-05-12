Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB8C1EB3D;
	Mon, 12 May 2025 12:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747052471; cv=none; b=uBrE3zcAZUVKkqJagsmlrOXvTNgCVpFibd1EE7PRz9mGG2637AViNUT6Iedz4JMxE3nm3f5jNQG4K6g8EUf0ZHqLTo2Ke8cr4bO7hJ7BOmBxv5kcRJWd9+pB+XDszJR/+To2DM+Wev014/xI/Ekf1aBvnLVT45kTsdoLJzHU/jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747052471; c=relaxed/simple;
	bh=r9EvKnkwEDwuOeYtha9PV10qvg/TE5FG4b32K9dntgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OgvtoVsfuK3Ik5VfJVLA9RTgug+n279jPpjbiKLPBFok00c+qYLibtHJQZUpg6nUZzLr0w9gEfd7yWnqqj4pDQNnZjdiHPxdowyrEqbgi7QUe9f1cWuyjqljdsj4XcMzb2DFLoQpWuW7gjfJdeiyQ1XkcCG5/lFo6dOE38wqfwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rxXzC8uB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rxXzC8uB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EE6BC4CEED;
	Mon, 12 May 2025 12:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747052470;
	bh=r9EvKnkwEDwuOeYtha9PV10qvg/TE5FG4b32K9dntgE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rxXzC8uBSbv3g1GtNPO57XYhGsAnKaqIekoYLx4iU7htDkd9iHjs+4KLMlZFl8dGU
	 CTHhLvPspQA9qdd10Vh6QZKR/I57bTr0KtaIJTuRFj6LpTx+YxYlEZABnE7VgDLBxm
	 rF7c/WBZ8caUiw177slO8UxrRfe0e54DjMuEXLKr3uuqGgtMf7e/a842mTB9F+S4nU
	 VGQfS2qtS4BjmFL8AQdBm8kruxyilkTeYgCwWhd0oQfF8joaYo8IFv5bcsb3QUIvNU
	 HR2NsSWQ8coG+TuCd1TYSKdVTAVjGRjE96d1quLevWA7MBP/jR0xKC+Be35tjCYmgS
	 HYadkYjUqJOMQ==
Date: Mon, 12 May 2025 14:21:03 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Asahi Lina <lina@asahilina.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>
Subject: Re: [PATCH 2/4] rust: drm: gem: Refactor
 IntoGEMObject::from_gem_obj() to as_ref()
Message-ID: <aCHnr9GbOAL2P8hV@pollux>
References: <20250501183717.2058109-1-lyude@redhat.com>
 <20250501183717.2058109-3-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250501183717.2058109-3-lyude@redhat.com>

On Thu, May 01, 2025 at 02:33:17PM -0400, Lyude Paul wrote:
> diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
> index df8f9fdae5c22..f70531889c21f 100644
> --- a/rust/kernel/drm/gem/mod.rs
> +++ b/rust/kernel/drm/gem/mod.rs
> @@ -45,8 +45,12 @@ pub trait IntoGEMObject: Sized + super::private::Sealed {
>      #[allow(clippy::wrong_self_convention)]
>      fn into_gem_obj(&self) -> &Opaque<bindings::drm_gem_object>;
>  
> -    /// Converts a pointer to a `struct drm_gem_object` into a pointer to `Self`.
> -    fn from_gem_obj(obj: *mut bindings::drm_gem_object) -> *mut Self;
> +    /// Converts a pointer to a `struct drm_gem_object` into a reference to `Self`.
> +    ///
> +    /// # Safety
> +    ///
> +    /// `self_ptr` must be a valid pointer to `Self`.

Is this really a requirement? I think this should just be "`ptr` must point to
a `struct drm_gem_object` represented through `Self`". How exactly the
implementer does the conversion depends on Self, no?

> @@ -144,11 +147,25 @@ fn lookup_handle(
>      ) -> Result<ARef<Self>> {
>          // SAFETY: The arguments are all valid per the type invariants.
>          let ptr = unsafe { bindings::drm_gem_object_lookup(file.as_raw().cast(), handle) };
> -        let ptr = <Self as IntoGEMObject>::from_gem_obj(ptr);
> -        let ptr = NonNull::new(ptr).ok_or(ENOENT)?;
>  
> -        // SAFETY: We take ownership of the reference of `drm_gem_object_lookup()`.
> -        Ok(unsafe { ARef::from_raw(ptr) })
> +        // SAFETY:
> +        // - A `drm::Driver` can only have a single `File` implementation.
> +        // - `file` uses the same `drm::Driver` as `Self`.
> +        // - Therefore, we're guaranteed that `ptr` must be a gem object embedded within `Self`.
> +        // - And we check if the pointer is null befoe calling as_ref(), ensuring that `ptr` is a
> +        //   valid pointer to an initialized `Self`.
> +        // XXX: The expect lint here is to workaround
> +        // https://github.com/rust-lang/rust-clippy/issues/13024
> +        #[expect(clippy::undocumented_unsafe_blocks)]
> +        let obj = (!ptr.is_null())
> +            .then(|| unsafe { Self::as_ref(ptr) })
> +            .ok_or(ENOENT)?;

Maybe simply go for

	if ptr.is_null() {
	   return Err(ENOENT);
	}

which should be much easier to parse for kernel developers just starting to look
at Rust code anyways.
