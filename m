Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5276422DFB6;
	Thu,  6 Feb 2025 12:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738845249; cv=none; b=NPy75wMWUAadg9v1Vn2DmPWBPhnf4/LhQabSIYQTB+a0hbJu6w7cWhIp4KS9CklzPyQtreP/LSJ/c+82mDuayuMrHEOXFIgl10fFmUHJgI+3ASPvWNRytQFzvJ3Om2JKv8hbZ2tU2Z+Pjxm0wmHKyCwCXrur4rgq69ADYb5TRH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738845249; c=relaxed/simple;
	bh=iP6uEE2NuIu1okf3cTTOdZPZeEcJyixn11aUnCN/HsY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=meNeeDngG9C0N01AzWT/73iveAmXQkCeOVslP+mySVTtljk4UZ6Y6qWAvIqD7QkYRoFNW2DkCBPa7W1vhkkOOxQupWKKO2VWxYqJszYLzuyw4MrIj7sfJOkT0N9HrA3y9G2x83B1IC/xFDMd/QKtvxkNxoiMxEPcPucXm+1FW/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nw7nIHXQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nw7nIHXQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 176DEC4CEDD;
	Thu,  6 Feb 2025 12:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738845249;
	bh=iP6uEE2NuIu1okf3cTTOdZPZeEcJyixn11aUnCN/HsY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=nw7nIHXQGWhOLJDEy7cVPzjtkt4ierGrs0Fc+9jOVnYW+kV3WeNN0yGf5VYrS1ZaR
	 N+BPCYmSEuk4arHX1iY1wOe3mGyHkiq4F2ojBELvmwNaiNObkcAf98/VmZZERTOsUh
	 7UraquLkhSex6vm5+XN+MMMPIo6QsD1IlfiJSdrdlQ6MuZeyCSAa1TW8anuhULbpZe
	 mr6nOmISHbmmFqZArPNqL1+0QzOf3G4KmDpz/WWbBmBhN1LUXJ1fZMCrzZnDkxiwDn
	 JYoYIjjXE5Eyjtkm2zF79wxz2D4x3CCof2/CvhDyphArZxkO/XaW7EOcB8SA/IV7y7
	 oANWEyLKcle3A==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,  "Gary Guo"
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno
 Lossin" <benno.lossin@proton.me>,  "Alice Ryhl" <aliceryhl@google.com>,
  "Trevor Gross" <tmgross@umich.edu>,  "Joel Becker" <jlbec@evilplan.org>,
  "Christoph Hellwig" <hch@lst.de>,  <rust-for-linux@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/4] rust: configfs: introduce rust support for configfs
In-Reply-To: <20250131-configfs-v1-3-87947611401c@kernel.org> (Andreas
	Hindborg's message of "Fri, 31 Jan 2025 14:30:10 +0100")
References: <20250131-configfs-v1-0-87947611401c@kernel.org>
	<FijxTIEbb0y1Jixm3hfLCa_c6H_bIbjFuvH1DLUJq3Klt8WrT18vA4PSRRCLP3OX0zfesGc4WNrerjO1Ih5i4A==@protonmail.internalid>
	<20250131-configfs-v1-3-87947611401c@kernel.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 06 Feb 2025 13:33:55 +0100
Message-ID: <87a5azjlqk.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Andreas Hindborg" <a.hindborg@kernel.org> writes:

> This patch adds a rust API for configfs, thus allowing rust modules to use
> configfs for configuration. The implementation is a shim on top of the C
> configfs implementation allowing safe use of the C infrastructure from
> rust.
>
> The patch enables the `const_mut_refs` feature on compilers before rustc
> 1.83. The feature was stabilized in rustc 1.83 and is not required to be
> explicitly enabled on later versions.
>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>
> ---

[...]

> +    /// # Safety
> +    ///
> +    /// If `this` does not represent the root group of a `configfs` subsystem,
> +    /// `this` must be a pointer to a `bindings::config_group` embedded in a
> +    /// `Group<PAR>`.
> +    ///
> +    /// Otherwise, `this` must be a pointer to a `bindings::config_group` that
> +    /// is embedded in a `bindings::configfs_subsystem` that is embedded in a
> +    /// `Subsystem<PAR>`.
> +    ///
> +    /// `item` must point to a `bindings::config_item` within a
> +    /// `bindings::config_group` within a `Group<CHLD>`.
> +    unsafe extern "C" fn drop_item(
> +        this: *mut bindings::config_group,
> +        item: *mut bindings::config_item,
> +    ) {
> +        // SAFETY: By function safety requirements of this function, this call
> +        // is safe.
> +        let parent_data = unsafe { get_group_data(this) };
> +
> +        // SAFETY: By function safety requirements, `item` is embedded in a
> +        // `config_group`.
> +        let c_child_group_ptr =
> +            unsafe { kernel::container_of!(item, bindings::config_group, cg_item) };
> +        // SAFETY: By function safety requirements, `c_child_group_ptr` is
> +        // embedded within a `Group<CHLD>`.
> +        let r_child_group_ptr = unsafe { Group::<CHLD>::container_of(c_child_group_ptr) };
> +
> +        if PAR::HAS_DROP_ITEM {
> +            PAR::drop_item(
> +                parent_data,
> +                // SAFETY: We called `into_foreign` to produce `r_child_group_ptr` in
> +                // `make_group`. There are not other borrows of this pointer in existence.
> +                unsafe { PCPTR::borrow(r_child_group_ptr.cast_mut()) },
> +            );
> +        }
> +
> +        // SAFETY: By C API contract, `configfs` is not going to touch `item`
> +        // again.
> +        unsafe { bindings::config_item_put(item) };

This turned out to be wrong. We _do_ have to let go of a refcount here,
but we are not allowed to free the item.

> +
> +        // SAFETY: We called `into_foreign` on `r_chilc_group_ptr` in
> +        // `make_group`.
> +        let pin_child: PCPTR = unsafe { PCPTR::from_foreign(r_child_group_ptr.cast_mut()) };
> +        drop(pin_child);

So this is wrong and will cause UAF. We have to wait for a call to
ct_item_ops.release and do the cleanup there. I will address this in the
next version. Removing directories is likely to cause trouble with this
patch.


Best regards,
Andreas Hindborg



