Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29B5D299;
	Sun, 22 Jun 2025 20:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750623245; cv=none; b=M/UJp8Gwm8kLTpuv04M6/SohPuz52gKcVY1jAMXx644NsMD02JXXJWx+inq+4A1EVkYuqjYJ+SmUU/2l8mrs9QkOAUcQHHSAFNBATnTpta8PLpxPZrcjYalkhUE1sEz3RqilYY6MQRK9UJyPgAHHjMGknM8yUc6cl4aXnkr2nlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750623245; c=relaxed/simple;
	bh=35x6Mxn3trce9gfGtiBjrHl6Aqu//3K9ejdgH0ORui8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=ap14juVBrX+BcNqnM+r99Cd8i5AaakmoI1RMIh/BxuU2GEHpYp6+SJ62IJEKnhixmfzvPndhTYHH9NU9iVc6oqG+kOSB/2AdZhNMO/zYBVjMQIQDdzlvdPQt59zikmmRWR4sIV1o/4yjyZFdneQR7P0h9waXDG3jUgxw0c1g+KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GMADnHIx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GMADnHIx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E421C4CEE3;
	Sun, 22 Jun 2025 20:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750623245;
	bh=35x6Mxn3trce9gfGtiBjrHl6Aqu//3K9ejdgH0ORui8=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=GMADnHIxayoLHisZ14MSmoav5j5XAYJaDcq7jq9h62Bc7timN/epnfj4mEkzE7Luf
	 gXboIyIIH80JkOnmRCI1a3H4WeqlhCFOues64G3mzWgA5ljyuL4eZxDGXYd7NhheRc
	 SqRmLdGctBn7Gv6uZwldmOeGsm8M462aABC+7+T75ryM8354hKfffk9YQFYE6m8JMO
	 OrmVuNIqDLPQ7ZamSmo7Boi4l9pwPuBrKjqhEzkBPemm2zoCpbmQq3gPEm1UjDMPyu
	 S8XFpqEFMtcKrOdi7vKO4D9qkdYqt9BmA3YJATVqfEpBn13c5Ai2HwikdAXEkccNsE
	 mxabx9zRySkaQ==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 22 Jun 2025 22:14:00 +0200
Message-Id: <DATC5A2JBHZQ.33AFQQP6V6L1A@kernel.org>
Subject: Re: [PATCH 4/4] rust: devres: implement register_foreign_release()
From: "Benno Lossin" <lossin@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: <gregkh@linuxfoundation.org>, <rafael@kernel.org>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <benno.lossin@proton.me>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20250612145145.12143-1-dakr@kernel.org>
 <20250612145145.12143-5-dakr@kernel.org>
 <DASVTOJU2OE8.GU1NH3MZ3SX@kernel.org> <aFf7QVhqE6dhp0m2@pollux>
In-Reply-To: <aFf7QVhqE6dhp0m2@pollux>

On Sun Jun 22, 2025 at 2:46 PM CEST, Danilo Krummrich wrote:
> On Sun, Jun 22, 2025 at 09:26:33AM +0200, Benno Lossin wrote:
>> On Thu Jun 12, 2025 at 4:51 PM CEST, Danilo Krummrich wrote:
>> > +pub trait Release {
>> > +    /// Called once the [`Device`] given to [`register_foreign_releas=
e`] is unbound.
>> > +    fn release(&self);
>>=20
>> Would it make sense to also supply the `Device` that this is attached
>> to? In case you have one object in multiple `register_foreign_release`
>> calls with different devices, or is that something that doesn't happen?
>
> No, doing that wouldn't make any sense. A resource should only be bound t=
o the
> lifetime of a single device.

But the API doesn't prevent it... Does it make more sense to instead ask
the user to provide a closure?

>> > +}
>> > +
>> > +impl<T: Release> Release for crate::sync::ArcBorrow<'_, T> {
>> > +    fn release(&self) {
>> > +        self.deref().release();
>> > +    }
>> > +}
>> > +
>> > +impl<T: Release> Release for Pin<&'_ T> {
>> > +    fn release(&self) {
>> > +        self.deref().release();
>> > +    }
>> > +}
>>=20
>> We should also implement it for `&T`, since that is `Box`'s `Borrowed`.
>
> That should implicitly be the case when T: Release, where T is P<T>.

I don't understand? When `P` is set to `Box<T>` in the
`register_foreign_release` below, then `P::Borrow<'_> =3D=3D &'_ T` and the
bound of `&T: Release` is not satisfied.

>> > +
>> > +/// Consume the `data`, [`Release::release`] and [`Drop::drop`] `data=
` once `dev` is unbound.
>> > +///
>> > +/// # Examples
>> > +///
>> > +/// ```no_run
>> > +/// use kernel::{device::{Bound, Device}, devres, devres::Release, sy=
nc::Arc};
>> > +///
>> > +/// struct Registration<T> {
>>=20
>> Maybe add some explanation above/below this example. It looks like a new
>> bus registration?
>
> *class device registration, see Registration::new() below. But I can also=
 add a
> brief comment to the struct. It's indeed a bit subtly this way. :)

I'd just add a small paragraph explaining what it does :)

---
Cheers,
Benno
