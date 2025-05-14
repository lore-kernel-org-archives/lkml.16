Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDBE269CE4;
	Wed, 14 May 2025 09:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747216484; cv=none; b=a7N8s8/CpzE/KQn0YND+NNewqmhpr8FJeFuPjGyIbOCKu0V2LFz5bdW1UG/zaJ4PQUGi0Lyllwz02JCbDO7Mkzr9RqfhyijHDRs3jPx+znvSRXE0WZ2A49BlFMdsXF964nRCzckcCoAFaxHj8vcS5qitySDAZQmA8c+Iyj1P14g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747216484; c=relaxed/simple;
	bh=Q4i1YFY9BC6oY63LcLnbiox6aS6RopyQdTJcQYzHeO0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=SqFpkDcfwv09dDLFTfIuD1O7G0hyvCKPsmw2B6icyCi0qcNAyWWZCJAwb/Cqe85Ih8RbjAeUnAmlfiLo9zodcb8uAPTs+Eird6TJP53AevHuO3+YLTPKZRO+6TQLLNBQB6kga081mgBne6I3g5sOYmPcmohX8Mn/SihumY7IOZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BcMBFmdI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BcMBFmdI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC4DFC4CEE9;
	Wed, 14 May 2025 09:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747216484;
	bh=Q4i1YFY9BC6oY63LcLnbiox6aS6RopyQdTJcQYzHeO0=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=BcMBFmdISrvZvNb1vVC4v+ZJdxkEb+WywgMGtkavsjXwsP+YfzcRyk5vadYKGpjH3
	 9aska77FprvEx70Mxa9uPW8tryWt4cSmjeHc8kqbZEfmt3fCu1WCSnEUSRNAD2H1ek
	 mdY/MOd7sn2Fx31vTYE4mj5TUxlkAV2+7zNNeQosPKBR5aC0cV67ZHP5sjNHSJhDF/
	 rrr2pDU3R4CatP3X+9+DTj/WCbTHY6R/xYf3IJINUCwhCYgoDJcYdpGvxH4uq00Jnh
	 eFUzujg+7hdnsNMDZ/hntN+NPZWknF0YEgyfCWQpG+PemjZDc1Sb5O3eP1cCdLNsdZ
	 t4RorkmslpIBg==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 May 2025 11:54:39 +0200
Message-Id: <D9VSJTPCSNXV.1LCXKGKVDGP96@kernel.org>
Cc: "Matthew Maurer" <mmaurer@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Sami Tolvanen" <samitolvanen@google.com>, "Timur
 Tabi" <ttabi@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v5 4/4] rust: samples: Add debugfs sample
From: "Benno Lossin" <lossin@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250505-debugfs-rust-v5-0-3e93ce7bb76e@google.com>
 <20250505-debugfs-rust-v5-4-3e93ce7bb76e@google.com>
 <D9VPA1M45WBK.1TB4KOUXD24BD@kernel.org> <aCRdNJ2oq-REBotd@pollux>
In-Reply-To: <aCRdNJ2oq-REBotd@pollux>

On Wed May 14, 2025 at 11:07 AM CEST, Danilo Krummrich wrote:
> On Wed, May 14, 2025 at 09:20:49AM +0200, Benno Lossin wrote:
>> On Tue May 6, 2025 at 1:51 AM CEST, Matthew Maurer wrote:
>> > +impl kernel::Module for RustDebugFs {
>> > +    fn init(_this: &'static ThisModule) -> Result<Self> {
>> > +        // Create a debugfs directory in the root of the filesystem c=
alled "sample_debugfs".
>> > +        let debugfs =3D Dir::new(c_str!("sample_debugfs"));
>> > +
>> > +        {
>> > +            // Create a subdirectory, so "sample_debugfs/subdir" now =
exists.
>> > +            // We wrap it in `ManuallyDrop` so that the subdirectory =
is not automatically discarded
>> > +            // at the end of the scope - it will be cleaned up when `=
debugfs` is.
>> > +            let sub =3D ManuallyDrop::new(debugfs.subdir(c_str!("subd=
ir")));
>>=20
>> I dislike the direct usage of `ManuallyDrop`. To me the usage of
>> `ManuallyDrop` signifies that one has to opt out of `Drop` without the
>> support of the wrapped type. But in this case, `Dir` is sometimes
>> intended to not be dropped, so I'd rather have a `.keep()` function I
>> saw mentioned somewhere.
>
> I agree, if we really want to "officially" support to forget() (sub-)dire=
ctories
> and files in order to rely on the recursive cleanup of the "root" directo=
ry, it
> should be covered explicitly by the API. I.e. (sub-)directories and files=
 should
> have some kind of keep() and / or forget() method, to make it clear that =
this is
> supported and by design and won't lead to any leaks.
>
> Consequently, this would mean that we'd need something like your proposed=
 const
> generic on the Dir type, such that keep() / forget() cannot be called on =
the
> "root" directory.
>
> However, I really think we should keep the code as it is in this version =
and
> just don't provide an example that utilizes ManuallyDrop and forget().
>
> I don't see how the idea of "manually dropping" (sub-)directories and fil=
es
> provides any real value compared to just storing their instance in a driv=
er
> structure as long as they should stay alive, which is much more intuitive
> anyways.

Yeah that's whats normally done in Rust anyways. But I think that
lifetimes bite us in this case:

    let debugfs: Dir<'static> =3D Dir::new(cstr!("sample_debugfs"));

    let sub: Dir<'a> =3D debugfs.subdir(cstr!("subdir"));
    // lifetime `'a` starts in the line above and `sub` borrows `debugfs`

    /* code for creating the file etc */

    Ok(Self { _debugfs: debugfs, _sub: sub })
    // lifetime `'a` has to end in the line above, since debugfs is moved b=
ut `sub` still borrows from it!

This code won't compile, since we can't store the "root" dir in the same
struct that we want to store the subdir, because the subdir borrows from
the root dir.

Essentially this would require self-referential structs like the
`ouroboros` crate [1] from user-space Rust. We should rather have the
`.keep()` function in the API than use self-referential structs.

[1]: https://docs.rs/ouroboros/latest/ouroboros/attr.self_referencing.html

Another problem that only affects complicated debugfs structures is that
you would have to store all subdirs & files somewhere. If the structure
is dynamic and changes over the lifetime of the driver, then you'll need
a `Vec` or store the dirs in `Arc` or similar, leading to extra
allocations.

> It either just adds complexity to the API (due to the need to distingish =
between
> the "root" directory and sub-directories) or makes the API error prone by
> providing a *valid looking* option to users to leak the "root" directory.

I agree with this, I want that `ManuallyDrop` & `forget` are only used
rarely mostly for low-level operations.

---
Cheers,
Benno
