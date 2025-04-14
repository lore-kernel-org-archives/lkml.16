Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F6F1E522
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 12:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744633043; cv=none; b=Gw+4pjiBQKFcZAMStakhTjX4bq33l45D0UroY/wmG+wPB/Ffi6VQpjKVZHYabr7fSj3qfBYH8bzk8T6gv1pOOoXKkcvsk9GSytiYF/c5KdHK+yHCFMcWcVBcljFSqn/qUPkp73G6CNoZMAhefIaUKmNNoFD4RXZOP0hVY4byGvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744633043; c=relaxed/simple;
	bh=LA7rYhq0aENfhSyLCGmLF1Zm0+K8u+2aPNOyyLwXoe4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sAYstpEFTiCavPqgDedxC54ZdXkD/pCh46+rubsVD4D9dAUvxubMS3TpkXtzX0o0+RTvFsSvKHojNtYzYCiqdhZ0HdjoJ/HlJD5z5RwMH+kdxZyphbcozACkaxndmw78J1l1RrXz05C7WNsvVlaXCUHrqJEiFP3O6yhSxFef+CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=OFuQRMYV; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="OFuQRMYV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1744633040; x=1744892240;
	bh=e+bJrl7Va8w+pzlix7I2StDEZ9nW9bUvM6zm1TD802Y=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=OFuQRMYVmz2pC5THndvorFb/yPnGXffryCoxpx556uZ0lIughfB4KkH+i6Mt4FzNo
	 rMZJoVUsl4/uDFCiXH+8mA2dz2bVycIbXnFdKrJxMrLorM3YgpwgqrEpxbWicbnG1u
	 pBwGuQs/kGqfysRE0H7Ubr05yEYnH7XfuwJJClDUGx6yCGp47LxnDAJNMmX+xdjl1T
	 bJ4KC4p8iy6O5pjNVjCyxpI2xTuHXM6UMyTvVDQANiFpB77HznUYo1HFRvoOA6NJpZ
	 tsk9g/krHhOneTBq2jrJr3nexOzhwrtm7LEyMWQ46DblwGRliB8CN6d8Tvap3OKflx
	 FRPbKPe+1GfNg==
Date: Mon, 14 Apr 2025 12:17:15 +0000
To: Tamir Duberstein <tamird@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rust: check type of `$ptr` in `container_of!`
Message-ID: <D96CSLWM105M.9P395XQ2ZWR4@proton.me>
In-Reply-To: <20250412-b4-container-of-type-check-v2-1-f3cc9934c160@gmail.com>
References: <20250412-b4-container-of-type-check-v2-1-f3cc9934c160@gmail.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: cd1bd0febde8ddcbd42315da4be81f6d79ad3d29
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sat Apr 12, 2025 at 8:16 PM CEST, Tamir Duberstein wrote:
> Add a compile-time check that `*$ptr` is of the type of `$type->$($f)*`.
>
> Given the incorrect usage:
>
> ; diff --git a/rust/kernel/rbtree.rs b/rust/kernel/rbtree.rs
> ; index 8d978c896747..6a7089149878 100644
> ; --- a/rust/kernel/rbtree.rs
> ; +++ b/rust/kernel/rbtree.rs
> ; @@ -329,7 +329,7 @@ fn raw_entry(&mut self, key: &K) -> RawEntry<'_, K,=
 V> {
> ;          while !(*child_field_of_parent).is_null() {
> ;              let curr =3D *child_field_of_parent;
> ;              // SAFETY: All links fields we create are in a `Node<K, V>=
`.
> ; -            let node =3D unsafe { container_of!(curr, Node<K, V>, link=
s) };
> ; +            let node =3D unsafe { container_of!(curr, Node<K, V>, key)=
 };
> ;
> ;              // SAFETY: `node` is a non-null node so it is valid by the=
 type invariants.
> ;              match key.cmp(unsafe { &(*node).key }) {
>
> this patch produces the compilation error:
>
> ; error[E0308]: mismatched types
> ;    --> rust/kernel/lib.rs:206:26
> ;     |
> ; 206 |             [$field_ptr, field_ptr]; // typeof(`$ptr_to_field`) =
=3D=3D typeof(`$Container.$($fields)*`)
> ;     |                          ^^^^^^^^^ expected `*mut rb_node`, found=
 `*mut K`
> ;     |
> ;    ::: rust/kernel/rbtree.rs:270:6
> ;     |
> ; 270 | impl<K, V> RBTree<K, V>
> ;     |      - found this type parameter
> ; ...
> ; 332 |             let node =3D unsafe { container_of!(curr, Node<K, V>,=
 key) };
> ;     |                                 ---------------------------------=
--- in this macro invocation
> ;     |
> ;     =3D note: expected raw pointer `*mut bindings::rb_node`
> ;                found raw pointer `*mut K`
> ;     =3D note: this error originates in the macro `container_of` (in Nig=
htly builds, run with -Z macro-backtrace for more info)
> ;
> ; error: aborting due to 1 previous error
>
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Link: https://lore.kernel.org/all/CAH5fLgh6gmqGBhPMi2SKn7mCmMWfOSiS0WP5wB=
uGPYh9ZTAiww@mail.gmail.com/
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Reviewed-by: Benno Lossin <benno.lossin@proton.me>

> ---
> I also considered an implementation using a function, but the resulting
> compilation error was not as concise:

Thanks for checking :)

---
Cheers,
Benno


