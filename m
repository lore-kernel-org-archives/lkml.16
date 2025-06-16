Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9790D2EAD15
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 11:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750075021; cv=none; b=eYMh06tHxr2O8IsYpOcDMJ5pmEL31wSguJ5kFt9rrdcuq+uLhAg6wUdJHw3x4l0kf464+NEELGnHyF+/MC8UH/sHh1PhTN38su+NntpamKm4/jkhHizrbaTT5v5M3aIUbTevpWqd0WYfIF2mVrnfO0P2Va0i6Yx9aRnzp7AzRqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750075021; c=relaxed/simple;
	bh=EhgfHlpYtA1MNSF+q2GiTzeyjq3nuOPTsda5ZaDFAqU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iFthKKtmhtfAf38k/3CRQZVQQ7bJJunozqGc2Hn9zx/pmS9j0PP0z+bBAgzerW6YfGiv0DgoXaOVZOLhpyBIjvGhC4OKIsZVOEKPWi4/uuA4fBeVNBHE8+26Pjorhrmot7f18UHo9luECngB5Ufd1ZlTakLZ8nLvNzx/fdMVFdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=P4u/Ut02; arc=none smtp.client-ip=109.224.244.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="P4u/Ut02"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1750075011; x=1750334211;
	bh=w6GZhjSddy4eR4E78ib6Xk7D+h/hNv5radSD+voC61Y=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=P4u/Ut02t+oS4HAB84+RW0VCBeXFm5uuMZ+k5StP5XtDtml+THyhExWXt3iCdQS0A
	 S6ITwE1S63ZW42653lV7hZn3yzI/Rwnq82oFCnEJ4cNKmM2JaOEhx1kmbzTlWvit9K
	 gdkAID53F1e5gqMnpOgKeekwGOXPMnxBtkcqpo59uwBT8K6b1XFTng3fjrceEu3PD+
	 4dGzC/7sHSetAuRqFiIk2ENPZb4Cp6eUHs+7r92F2G8BaPzaNrA2ARvvzGWvescezG
	 f9C81v1HQW2wfkPTPUbW06f1yuFKQL2YGjljZoccHpdx3195GeyyLlL2HVbvn/PMan
	 koXThDJiB46FA==
Date: Mon, 16 Jun 2025 11:56:47 +0000
To: Alice Ryhl <aliceryhl@google.com>
From: Oliver Mangold <oliver.mangold@pm.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Asahi Lina <lina@asahilina.net>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 2/5] rust: Rename AlwaysRefCounted to RefCounted
Message-ID: <aFAGeu5FwaEEUZD8@mango>
In-Reply-To: <aBStYylT7wy9JiDx@google.com>
References: <20250502-unique-ref-v10-0-25de64c0307f@pm.me> <20250502-unique-ref-v10-2-25de64c0307f@pm.me> <aBStYylT7wy9JiDx@google.com>
Feedback-ID: 31808448:user:proton
X-Pm-Message-ID: 2eda56265984c79b38f85539f8985a4131d807fe
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 250502 1132, Alice Ryhl wrote:
> On Fri, May 02, 2025 at 09:02:37AM +0000, Oliver Mangold wrote:
> > AlwaysRefCounted will become a marker trait to indicate that it is allo=
wed
> > to obtain an ARef<T> from a `&T`, which cannot be allowed for types whi=
ch
> > are also Ownable.
> >
> > Signed-off-by: Oliver Mangold <oliver.mangold@pm.me>
> > Suggested-by: Alice Ryhl <aliceryhl@google.com>
>=20
> >  // SAFETY: All instances of `Request<T>` are reference counted. This
> > -// implementation of `AlwaysRefCounted` ensure that increments to the =
ref count
> > +// implementation of `RefCounted` ensure that increments to the ref co=
unt
> >  // keeps the object alive in memory at least until a matching referenc=
e count
> >  // decrement is executed.
>=20
> It looks like "keeps" now fits on the previous line. I would reflow all
> text in this patch.

Say, this means you have a tool to do that automatically for you? I'm doing
it by hand currently.

> > +/// An extension to RefCounted, which declares that it is allowed to c=
onvert
> > +/// from a shared reference `&T` to an owned reference [`ARef<T>`].
> > +///
> > +/// # Safety
> > +///
> > +/// Implementers must ensure that no safety invariants are violated by=
 upgrading an `&T`
> > +/// to an [`ARef<T>`]. In particular that implies [`AlwaysRefCounted`]=
 and [`Ownable`]
> > +/// cannot be implemented for the same type, as this would allow to vi=
olate the uniqueness
> > +/// guarantee of [`Owned<T>`] by derefencing it into an `&T` and obtai=
ning an [`ARef`] from that.
> > +pub unsafe trait AlwaysRefCounted: RefCounted {}
>=20
> Adding a new trait should not happen in a commit called "rename X to Y".
> Consider renaming this patch to "split AlwaysRefCounted into two traits"
> or similar.

Sure. Will do.

Oliver

