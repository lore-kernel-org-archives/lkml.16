Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch [79.135.106.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8447920110B;
	Wed, 18 Jun 2025 09:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750239260; cv=none; b=kVjn7UbFdQ685deqziVa5QBNJZ6CPMhdhpVeFGczR7AarRL5KhIU4BQqZ2Gc7ZJ2JdFoleH6fJo8sSb8I3AeHk8gRBKDPGu+9zrbrXYJ/2arERlFfFAOBAho5H3laGFle6vIPVvlGUdv5d3UtdzoJXs9X2lddXTweSpQUppaTv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750239260; c=relaxed/simple;
	bh=oTtc1ObCWJ5Rf4FdLubGqI0QjQIdQaMVE4bNw7nV1Z4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sp64nHC8U5Dum5cjgy4LmrZcn5UXyr8LdbOPgsAFOLXq97t3V6619NrQdMGkhLIEQ/6aF8SwXjRA1J+pqAB74qvXltepjUXXU0tq83L60OEDYJq64Ke3qn3eWIiG1jfJtVu4mohma4R/ckWH8dhopAnvLyDsgli14mq3jfnAkG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=REyQQUig; arc=none smtp.client-ip=79.135.106.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="REyQQUig"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1750239249; x=1750498449;
	bh=04FIQsMJHpGad0nMAfq6tToHsZZgyH/fBrj2gAyNaTE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=REyQQUig0wpwld4wytrDGt8P8TQhCbFL4/B8rZ9zr49cEF3f+2F56yX+ck8sNGTPY
	 ZLF4BH7+wzuXMy7fItK9VrIyBQSdIsaLUktXkXP9NXQjkAKmi0bHu2RXdc3AVWSbsf
	 yAlNgn0H9QPi7QzDjTq9Sw+TQvT+SOs2neby3aRWsiyvF54998oDuOtLE9RiQP1wCv
	 SEdugpm7ux/Mby5cj+bJGKxbRBhy9UUexz12JxyhWMYzKVGxcdVUNaTpX53+vrBDnY
	 vozRrvmJW00xuCrBLlkCyl4LHHOeQWOzYL1wu/eAnCh4PC73SsNW5351ftau+wrPzq
	 q9GhYKLpfCLWg==
Date: Wed, 18 Jun 2025 09:34:03 +0000
To: Benno Lossin <lossin@kernel.org>
From: Oliver Mangold <oliver.mangold@pm.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Asahi Lina <lina@asahilina.net>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 1/5] rust: types: Add Ownable/Owned types
Message-ID: <aFKICIo8L958iFbz@mango>
In-Reply-To: <D9VS2Q4IX7LH.3JLXQUMWYJ2FP@kernel.org>
References: <20250502-unique-ref-v10-0-25de64c0307f@pm.me> <20250502-unique-ref-v10-1-25de64c0307f@pm.me> <D9VS2Q4IX7LH.3JLXQUMWYJ2FP@kernel.org>
Feedback-ID: 31808448:user:proton
X-Pm-Message-ID: 5a2d2a96da1452a1de1dc613523b40c2380f4125
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 250514 1132, Benno Lossin wrote:
> On Fri May 2, 2025 at 11:02 AM CEST, Oliver Mangold wrote:
>=20
> > +/// - That the C code follows the usual mutable reference requirements=
. That is, the kernel will
> > +///   never mutate the [`Ownable`] (excluding internal mutability that=
 follows the usual rules)
> > +///   while Rust owns it.
>=20
> I feel like this requirement is better put on the `Owned::from_raw`
> function.

Thinking about it some more, the problem I see here is that if the type
implements `OwnableMut` this requirement changes from "never mutate" to
"never access at all".

The safety requirements between `Ownable`, `OwnableMut`, `RefCounted`,
`OwnableRefCounted` and `AlwaysRefCounted` are interacting, but I agree
that, when looking at it a certain way, `Owned::from_raw()` is the place
where one would expect these to be. I'm not sure anymore what is best here
:/

> > +pub unsafe trait OwnableMut: Ownable {}
>=20
> I don't like the name, but at the same time I also have no good
> suggestion :( I'll think some more about it.

There was already a bit of discussion about it. I had my own implementation=
 of this
where I used the names `UniqueRefCounted` and `UniqueRef`, but after discov=
ering
this version from Asahi Lina, I took it as it was, keeping the name.

No one else came up with different suggestions so far, so maybe we should j=
ust leave it
at `Owned`/`Ownable`?

Best,

Oliver

