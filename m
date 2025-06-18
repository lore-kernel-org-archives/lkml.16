Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4C41E0E14;
	Wed, 18 Jun 2025 09:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750239526; cv=none; b=Fk3tQHK0mhVe7F1qNGCjJEIi7kr3dmtMsoPW6jGWDIT3dtLVm+U5NcmZi7vfvIHIzg0jJjX/gl/IN/K2/69WIWIN7FgiRATSQ/MezASiLA0ObzEbn2JoxrnRy4SzMwrBX2H2WV06ZV9YDNXsLnoabom+DVIF9y/+exBtu8gUg2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750239526; c=relaxed/simple;
	bh=Dk4yynuLUZzdLhb5FVHjc9U3LZysX6xe3JJlSsT39M8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A5jbpp/8DWqOLDJe3HGPkYHEJJrhH/RSAtMLIi5x8MfKEbI/9750wfXspPNXvKwwzANDTPX7f6jYwENRJVhUilslStECNEQI6fLjEGSEIxLqCe7OLKHknwAqbUBtkeRFY9OfwG7yMPKI+xwaSVFtwUkiXmHeUN6Zs1Uyi0hxCCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nDAMDTLM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nDAMDTLM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AA3AC4CEE7;
	Wed, 18 Jun 2025 09:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750239526;
	bh=Dk4yynuLUZzdLhb5FVHjc9U3LZysX6xe3JJlSsT39M8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nDAMDTLM1J0youlb6K3un6RIsegAIe71aAVZKYlZNqCocGSR1R4PGVdnOydOBOIsi
	 EaVptVlHCw/gjGeceazkbSOUt01S2EhCdYXpBsw78uvD1o0CVJnVf15FhCbqRpdKVN
	 4+JeXwh/gKjy88xTZZVaKQSj1PTL2COk76mN+pYDnRCc7+pIyQuNf8qGW9ZWYfdVm0
	 +UclJJlLzHN3EAfbl6leKnMXLxYz3I/cgnylMcgqGnkhcWk7K26SYeKj4fWNM2zoyl
	 6+Szq0KbGRb8q6pIKRaO+P6UzhwFFv03vuj1NlnwL+fU8LIUMFFv6K1MoFNlo/cXm+
	 nMOFBPg4llGtQ==
Date: Wed, 18 Jun 2025 11:38:40 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>, dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: types: add Opaque::from_raw
Message-ID: <aFKJILuksX90AJHc@pollux>
References: <20250617-opaque-from-raw-v1-1-a2e99efa3ba2@google.com>
 <aFFzi88miMbCZ0yQ@pollux>
 <aFJx2IqLfCjWsbVv@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFJx2IqLfCjWsbVv@google.com>

On Wed, Jun 18, 2025 at 07:59:20AM +0000, Alice Ryhl wrote:
> On Tue, Jun 17, 2025 at 03:54:19PM +0200, Danilo Krummrich wrote:
> > On Tue, Jun 17, 2025 at 01:36:47PM +0000, Alice Ryhl wrote:
> > > Since commit b20fbbc08a36 ("rust: check type of `$ptr` in
> > > `container_of!`") we have enforced that the field pointer passed to
> > > container_of! must match the declared field. This caused mismatches when
> > > using a pointer to bindings::x for fields of type Opaque<bindings::x>.
> > > 
> > > This situation encourages the user to simply pass field.cast() to the
> > > container_of! macro, but this is not great because you might
> > > accidentally pass a *mut bindings::y when the field type is
> > > Opaque<bindings::x>, which would be wrong.
> > > 
> > > To help catch this kind of mistake, add a new Opaque::from_raw that
> > > wraps a raw pointer in Opaque without changing the inner type.
> > 
> > The patch does more than that, it also adds a hint to container_of!() and fixes
> > up two occurences. I feel like we should split it up.
> 
> I think they go together pretty naturally, but I can split it if you
> insist.

Nah, it's also fine for me to keep it as is, but in that case we should also
mention the other changes in the commit message.

> > > +    /// The opposite operation of [`Opaque::raw_get`].
> > > +    pub const fn from_raw(this: *const T) -> *const Self {
> > 
> > Do we want to name this from_raw()? Usually from_raw() methods return either
> > Self or &'a Self.
> > 
> > Maybe something like cast_from() and rename raw_get() to cast_into()? I think
> > the latter may be confusing anyways, since it sounds like it would do somthing
> > with reference counting.
> 
> The name raw_get() mirrors the stdlib function UnsafeCell::raw_get().
> The stdlib uses this naming because in Rust the word "get" normally has
> nothing to do with reference counting - outside of the kernel, we use
> "clone" for incrementing refcounts and nobody would ever call it "get".

Yeah, I'm aware. The main reason I proposed cast_into() is that it would fit
much better with the newly introduced cast_from() (in case we go with that
name).

I'm happy with other proposals too, I just think that from_raw() would be a bit
inconsistent with how we use this name otherwise.

> That said, it may still be worth to rename the method. Thoughts?

I think it'd be good if it aligns naming wise with its counter part added in
this patch and I don't see this happening with raw_get(). :-)
