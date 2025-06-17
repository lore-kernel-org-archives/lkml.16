Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017802E92BE;
	Tue, 17 Jun 2025 13:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750168466; cv=none; b=VLd1Fu2pkp9KnJlOhjIOjKyUlLR7vqDM75krubVuaO/fK2Ol1jfECPXZC96p60RAebv0T4idh9aectCaIxAuZDXH7woFINFRAtmQ2q+HcUAx+trfT8R6fE0oL3nZ3VGNeBAON0/DJylgoEOw7hktMK9frpDXSWYY6mDz8KBZ8Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750168466; c=relaxed/simple;
	bh=0k2cvXqcvQ++6SyJaasJsgpYXhw/jpea2Kwx1uvjjR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S5xs3Z2gwimwUZ8EbvE5YnLIUNs+kD7Z2I+8gYKEI31FbyWvM4Q9lYvcrjrpxpxQWbYnW9bUc5PRumMtjnm3eoXxN2kUj3W26kvX4OXjDNSJdE5VDWD3uPitTYwpkQfgcN1krrWei7TGUtB6OTGFcPmxIOz0dLNxGwBLZ37QkQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tnWj9Uy2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tnWj9Uy2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C1C9C4CEE3;
	Tue, 17 Jun 2025 13:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750168465;
	bh=0k2cvXqcvQ++6SyJaasJsgpYXhw/jpea2Kwx1uvjjR4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tnWj9Uy2c7BCkpWha/u5uEkmT9SIqT2blzfoI0++eLbOOlF9K8/ENCbm14xbzK6Hp
	 P+imT5MRdqto5N7EKqoPey2PiJfxbqPYCn06GNnC7RvNU0O2WL3eFQFcbwWA+AHheJ
	 VtZmUFcF6PRX1htfkCNNYnuDuNqqFxNBDbVdJEKm2kV7IqavgTt1eCwSzds7yJLx49
	 ClwaApk4XLGc6lGRsFEbipSSflok8A2jb0Z6bstQV3hjllpB1OlTcxn4Ec1bFgZhKA
	 TUdOMw6wcOmpi82Qa1SMg/Hi3dgQ6p2PwFa6g4kwVSfvrwfyYwdzEgqtzIS2+/rskC
	 3bR5PRmt2Hcog==
Date: Tue, 17 Jun 2025 15:54:19 +0200
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
Message-ID: <aFFzi88miMbCZ0yQ@pollux>
References: <20250617-opaque-from-raw-v1-1-a2e99efa3ba2@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617-opaque-from-raw-v1-1-a2e99efa3ba2@google.com>

On Tue, Jun 17, 2025 at 01:36:47PM +0000, Alice Ryhl wrote:
> Since commit b20fbbc08a36 ("rust: check type of `$ptr` in
> `container_of!`") we have enforced that the field pointer passed to
> container_of! must match the declared field. This caused mismatches when
> using a pointer to bindings::x for fields of type Opaque<bindings::x>.
> 
> This situation encourages the user to simply pass field.cast() to the
> container_of! macro, but this is not great because you might
> accidentally pass a *mut bindings::y when the field type is
> Opaque<bindings::x>, which would be wrong.
> 
> To help catch this kind of mistake, add a new Opaque::from_raw that
> wraps a raw pointer in Opaque without changing the inner type.

The patch does more than that, it also adds a hint to container_of!() and fixes
up two occurences. I feel like we should split it up.

> +    /// The opposite operation of [`Opaque::raw_get`].
> +    pub const fn from_raw(this: *const T) -> *const Self {

Do we want to name this from_raw()? Usually from_raw() methods return either
Self or &'a Self.

Maybe something like cast_from() and rename raw_get() to cast_into()? I think
the latter may be confusing anyways, since it sounds like it would do somthing
with reference counting.

> +        this.cast()
> +    }
