Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7EC02798E3;
	Wed, 23 Apr 2025 14:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745419144; cv=none; b=VQurEuDklB8v60yFsuBLHceut3V7LawMSAClCcT6uMWsCtEo863jBEvjU9p/bq6dHytA6j9/t+jDIf8sKRYP8lg4sWji9u9uvz92BeoyAFN0lvHfncwEilmu8cmcO0YXk/lkYXIXqrtoJU9WJVQWi6t4hGLlmUV7CSX5bqLLKY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745419144; c=relaxed/simple;
	bh=5mju1pziZp67y68q2bVfFblg4yUURMiUzwJ1qLOGAAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DlbmvwicbpkbdUj5nQOasd3xH2E1vv5sw9deh1rae7NoTyZMQ7eTcgkPwUkPWtzDU4MFfKuaV6GnAgkpKasmOH5Nop/QBLUg9YJH/ttIEo4n2KTBcP83dYmDKtaLppyrO2xIC77krwlwnZZFObD/lgmA8g2rnvn13y5F5UqHSnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gp49xHL9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gp49xHL9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 723F5C4CEE2;
	Wed, 23 Apr 2025 14:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745419144;
	bh=5mju1pziZp67y68q2bVfFblg4yUURMiUzwJ1qLOGAAQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gp49xHL9i6k64DwA3VAaVH67p543v1XE+2BM7HDAKXnXb0C0xqQxEiADVmufAIsPe
	 U50ZXU4fcvcG2mha3N3YVzMZ7BBoFZXdNkErmRY8q0cekI3icOfBK12wAG018C6HsC
	 Zi1KixTSLX2uNZdNL8WmE9jC/QltZrJyi383g7OB0eWtiqaTx0+VWf1vP+Xxtkf6T6
	 Glln++PTVH/nmD8WZOhTjVBW++eDhbpC0aHJfRWoUWsZv0xadl6V4w4mMf+05QloMQ
	 Vt9ohND/A93C0g2BMaoRGLhmnPg5zLlUACWgVR6o17dKLlVxvva/qE+lpg6BKRwKrM
	 yfJGInUEcG7Ew==
Date: Wed, 23 Apr 2025 16:38:56 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Lyude Paul <lyude@redhat.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	dri-devel@lists.freedesktop.org, Asahi Lina <lina@asahilina.net>
Subject: Re: [PATCH v2 2/2] rust: drm: Add GPUVM abstraction
Message-ID: <aAj7gAzFVRX3dN7L@pollux>
References: <20250422-gpuvm-v2-0-44d4fc25e411@collabora.com>
 <20250422-gpuvm-v2-2-44d4fc25e411@collabora.com>
 <aAgHGuzCZzh7YPz2@cassiopeiae>
 <DBB3E8CE-19AA-437D-AF54-BF23763B254F@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DBB3E8CE-19AA-437D-AF54-BF23763B254F@collabora.com>

On Wed, Apr 23, 2025 at 10:29:01AM -0300, Daniel Almeida wrote:
> Hi Danilo,
> 
> FYI, most of this patch still retains the original code from the Asahi project,
> 
> > On 22 Apr 2025, at 18:16, Danilo Krummrich <dakr@kernel.org> wrote:
> > 
> > (Not a full review, but some things that took my attention from a brief look.)
> > 
> > On Tue, Apr 22, 2025 at 01:41:53PM -0300, Daniel Almeida wrote:
> 
> > 
> >> +        &mut self,
> >> +        gpuvm: &mut UpdatingGpuVm<'_, T>,
> >> +        gpuva: Pin<KBox<GpuVa<T>>>,
> >> +        gpuvmbo: &ARef<GpuVmBo<T>>,
> >> +    ) -> Result<(), Pin<KBox<GpuVa<T>>>> {
> >> +        // SAFETY: We are handing off the GpuVa ownership and it will not be moved.
> >> +        let p = KBox::leak(unsafe { Pin::into_inner_unchecked(gpuva) });
> >> +        // SAFETY: These C functions are called with the correct invariants
> >> +        unsafe {
> >> +            bindings::drm_gpuva_init_from_op(&mut p.gpuva, &mut self.0);
> >> +            if bindings::drm_gpuva_insert(gpuvm.0.gpuvm() as *mut _, &mut p.gpuva) != 0 {
> >> +                // EEXIST, return the GpuVa to the caller as an error
> >> +                return Err(Pin::new_unchecked(KBox::from_raw(p)));
> >> +            };
> > 
> > How do you ensure that the VM lock is held when there's a list of operations?
> 
> Are you saying that this will not work for async binds, or that it’s already broken in sync binds too?

I think here it's fine since sm_map() is implemented for LockedGpuVm, and that
seems to be the only place where you hand out a reference to an OpMap. But this
falls apart once we give out sets of operations, e.g. as list.

Even though, your patch doesn't do that yet, that's where we're heading to
eventually. Hence, the initial design must consider those things, otherwise
we only end up with something upstream that needs to be rewritten.

> 
> Perhaps we can get rid of this `UpdatingGpuVm` type and pass `LockedGpuVm` instead?

At a first glance I didn't get what's the difference between the two anyways.
But I don't think it's really related to the problem above, is it?

> 
> > 
> >> +            // SAFETY: This takes a new reference to the gpuvmbo.
> >> +            bindings::drm_gpuva_link(&mut p.gpuva, &gpuvmbo.bo as *const _ as *mut _);
> > 
> > How do you ensure that the dma_resv lock is held?
> 
> Right, I totally missed that.
> 
> > 
> >> +        }
> >> +        Ok(())
> >> +    }
> >> +}

<snip>

> >> +// SAFETY: DRM GpuVmBo objects are always reference counted and the get/put functions
> >> +// satisfy the requirements.
> >> +unsafe impl<T: DriverGpuVm> AlwaysRefCounted for GpuVmBo<T> {
> >> +    fn inc_ref(&self) {
> >> +        // SAFETY: The drm_gpuvm_get function satisfies the requirements for inc_ref().
> >> +        unsafe { bindings::drm_gpuvm_bo_get(&self.bo as *const _ as *mut _) };
> >> +    }
> >> +
> >> +    unsafe fn dec_ref(mut obj: NonNull<Self>) {
> >> +        // SAFETY: drm_gpuvm_bo_put() requires holding the gpuva lock, which is
> >> +        // the dma_resv lock by default.
> >> +        // The drm_gpuvm_put function satisfies the requirements for dec_ref().
> >> +        // (We do not support custom locks yet.)
> >> +        unsafe {
> >> +            let resv = (*obj.as_mut().bo.obj).resv;
> >> +            bindings::dma_resv_lock(resv, core::ptr::null_mut());
> >> +            bindings::drm_gpuvm_bo_put(&mut obj.as_mut().bo);
> >> +            bindings::dma_resv_unlock(resv);
> > 
> > What if the resv_lock is held already? Please also make sure to put multiple
> > unsafe calls each in a separate unsafe block.
> 
> By whom?

The lock might be held already by the driver or by TTM when things are called
from TTM callbacks.

This is why GPUVM never takes locks by itself, but asserts that the correct lock
is held.

I think we really want to get proof by the driver by providing lock guard
references.

> See my comment about “[..] a new type for GEM objects which are known to be locked"
> below.

<snip>

> >> +
> >> +    /// Obtains the [`GpuVmBo`] object that connects `obj` to this VM.
> >> +    ///
> >> +    /// This connection is unique, so an instane of [`GpuVmBo`] will be
> >> +    /// allocated for `obj` once, and that instance will be returned from that
> >> +    /// point forward.
> >> +    pub fn obtain_bo(&mut self, obj: &DriverObject<T>) -> Result<ARef<GpuVmBo<T>>> {
> >> +        // SAFETY: LockedGpuVm implies the right locks are held.
> > 
> > No, this must be locked by the dma-resv or the GEM gpuva lock, not by the
> > GPUVM lock that protects the interval tree.
> 
> By “GEM gpuva lock” you’re referring to the custom lock which we
> currently do not support, right?

Yes.

> This series currently rely on manual calls to dma_resv_{lock,unlock}, I wonder
> if we should ditch that in favor of something written in Rust directly. This
> would let us introduce a new type for GEM objects which are known to have
> `resv` locked. WDYT?

Not all functions that require the dma-resv lock to be held are called with a
GEM object parameter, it could also be a struct drm_gpuvm_bo, struct drm_gpuva
or struct drm_gpuvm, since they all carry GEM object pointers.

For reference, you can look for "_held" in drivers/gpu/drm/drm_gpuvm.c.
