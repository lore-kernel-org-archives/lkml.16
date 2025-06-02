Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB171D516F;
	Mon,  2 Jun 2025 09:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748856296; cv=none; b=Z8nley0aEOyNzRenfSmxyI/fdjJ9nA8U269nryMoIdfheTPL+fdGkAuFKwBnU4c38c+VWlwqhHxUBB+d4hskjciTTmF+NX0fwphcDbG1M2IIeR+WCYaptl0Q4FuSyRHr7U6roiyyQD30yFtAGGQHW8Ul1Pgo5jwTeM3Tyn1Oc3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748856296; c=relaxed/simple;
	bh=pB9o3mAUoyvT5CVnSzncN9qg5DAlvKCqyW+SS6Gxx7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mqFI+7xCUfBxAf6ujwJ7GlrN1EWVnMqesfeCxcs4P0EOYQKUQmMATy93VNIABcFZmuG5enHf041Q+B1reUtQJQZnCa0kFEL0Ej+8moyGNAHeaUB8EZ0vZGwJUDyVPS9gdzOUdK6MgN+9Mhgp6o08uDdirmYgjNlvUi3mw2CXO0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EWFJ9l0X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EWFJ9l0X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D555C4CEEB;
	Mon,  2 Jun 2025 09:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748856295;
	bh=pB9o3mAUoyvT5CVnSzncN9qg5DAlvKCqyW+SS6Gxx7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EWFJ9l0XBuYZXCwwDCVdn2r/zt59KQQtfVHJorW8CPXrkNOr9soZr6cwqraVhafyL
	 hH3KpyKmM3O+8gwm4dJ4auEFeEHPt5dJ8noMfgtzdfX7giuH++JET02DBAHU/GvGAV
	 j9XIKr5o4t+xcFa2d6LBmR21N/OmEVD2gMXzoRo+WGYL2Gp/tbPGejnz/XR3h/8rn3
	 W3h2RUWgTMbHt8+wGIyv56m1nCY6zYcGaHkAM9XYf7OlU/NBh8z34k/mVj/K5t9reB
	 z+dD4iIBvPY1DFlwo71AxLc48vHmSzEAW9qNVfnqFw6/TS5XkOttgUI3DV6aOk/4q+
	 kqxtLlYXZU5YQ==
Date: Mon, 2 Jun 2025 11:24:47 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 01/20] rust: dma: expose the count and size of
 CoherentAllocation
Message-ID: <aD1t34em7jd7vFek@pollux>
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-1-05dfd4f39479@nvidia.com>
 <aC3KbKeEVlHggi5l@Mac.home>
 <DA2FX8C1HZ59.13SM6DQ1JVFQ5@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DA2FX8C1HZ59.13SM6DQ1JVFQ5@nvidia.com>

On Thu, May 22, 2025 at 02:29:35PM +0900, Alexandre Courbot wrote:
> On Wed May 21, 2025 at 9:43 PM JST, Boqun Feng wrote:
> > On Wed, May 21, 2025 at 03:44:56PM +0900, Alexandre Courbot wrote:
> >> These properties are very useful to have and should be accessible.
> >> 
> >> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> >> ---
> >>  rust/kernel/dma.rs | 18 ++++++++++++++++++
> >>  1 file changed, 18 insertions(+)
> >> 
> >> diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
> >> index 605e01e35715667f93297fd9ec49d8e7032e0910..2a60eefa47dfc1f836c30ee342e26c6ff3e9b13a 100644
> >> --- a/rust/kernel/dma.rs
> >> +++ b/rust/kernel/dma.rs
> >> @@ -129,6 +129,10 @@ pub mod attrs {
> >>  //
> >>  // Hence, find a way to revoke the device resources of a `CoherentAllocation`, but not the
> >>  // entire `CoherentAllocation` including the allocated memory itself.
> >> +//
> >> +// # Invariants
> >> +//
> >> +// The size in bytes of the allocation is equal to `size_of::<T> * count()`.

As you propose below.

"... and does fit into a `usize`"

You then need an '// INVARIANT' comment where we actually ensure this, i.e. in
Self::alloc_attrs().

> >>  pub struct CoherentAllocation<T: AsBytes + FromBytes> {
> >>      dev: ARef<Device>,
> >>      dma_handle: bindings::dma_addr_t,
> >> @@ -201,6 +205,20 @@ pub fn alloc_coherent(
> >>          CoherentAllocation::alloc_attrs(dev, count, gfp_flags, Attrs(0))
> >>      }
> >>  
> >> +    /// Returns the number of elements `T` in this allocation.
> >> +    ///
> >> +    /// Note that this is not the size of the allocation in bytes, which is provided by
> >> +    /// [`Self::size`].
> >> +    pub fn count(&self) -> usize {
> >> +        self.count
> >> +    }
> >> +
> >> +    /// Returns the size in bytes of this allocation.
> >> +    pub fn size(&self) -> usize {
> >> +        // As per the invariants of `CoherentAllocation`.

"The type invariant of `Self` guarantees that [...]" or similar.

> >> +        self.count * core::mem::size_of::<T>()
> >
> > I think we need a comment or even an invariant saying this multiply
> > cannot overflow.
> 
> I'll add the following invariant:
> 
>     `size_of::<T> * count` fits into a `usize`.
> 
> and refer to it here. Does it work?
