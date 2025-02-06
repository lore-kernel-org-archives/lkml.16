Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3120C22C322;
	Thu,  6 Feb 2025 11:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738841895; cv=none; b=cesNsWWBB4g07nj9l0DQVsKcFCDjO/80vYeyT/c+t/OY9y299tWz/vj5cstrHzsbhM2UBqLXS3Xzc75cWHjJ9WWkxnR17q9G98HQfT3PhsLXQkri6GuWm5TiNRKPdr7EL7l1AzIwC1AnOgYM3KCgK0h9UqjnHFDWIewNp29Sr8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738841895; c=relaxed/simple;
	bh=A3owJN5B+OUsQm2m+Rw/6zqmqJJLWM87rAwKoOvv4wA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=AOx+jcuahRk/KcPJRJUh9pZMl6ErWyE7bK9SHFb2yXrwbtZNehmc2RvA78BDnpb8xaO9PHufDtRKFf+0dKAks/gAS+DMJGgFeg3bv57oiN9UGi8DTQU8mGLo2VY5rTCvhgc1Z/pHQ7QyiioAFzQZBmtMlD8PFqRLGvPXQVpzass=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XKQhMl5N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XKQhMl5N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76F40C4CEDD;
	Thu,  6 Feb 2025 11:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738841893;
	bh=A3owJN5B+OUsQm2m+Rw/6zqmqJJLWM87rAwKoOvv4wA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=XKQhMl5N37I0f5Ru9w+HepK2t/n521D/cobWcQ5i1MOfzHzx9iI08qL9T31MKTrpR
	 ll+wLDBgEhKgvH06n6z77J82L+PfvwClkqfz/Dl0ErJm/zRmKqn9RNcWI9tCVlbjuo
	 DxtSVDvDPihxqnr/S4aIcy4fDHoQYmBT3nnAHVxKX1Sxcq8pPvTr0m+nCMcCgSmqTL
	 BMK3EvQyAVTEsUWCMyWlEZXLrvCKgCwyL99QOP7FWM+5kwG3hs6FQqNF25jAM3qqR3
	 f/jeQCYa+Php2qNJPtaQ0W2Vulxao7mImhv/oBZIum7R/GinzaEjWvAKpNuuWHQ3l5
	 HJSRZYmXYb8IQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Fiona Behrens" <me@kloenk.dev>
Cc: "Danilo Krummrich" <dakr@kernel.org>,  "Miguel Ojeda"
 <ojeda@kernel.org>,  "Alex Gaynor" <alex.gaynor@gmail.com>,  "Boqun Feng"
 <boqun.feng@gmail.com>,  "Gary Guo" <gary@garyguo.net>,  =?utf-8?Q?Bj?=
 =?utf-8?Q?=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno Lossin" <benno.lossin@proton.me>,
  "Alice Ryhl" <aliceryhl@google.com>,  "Trevor Gross" <tmgross@umich.edu>,
  "Joel Becker" <jlbec@evilplan.org>,  "Christoph Hellwig" <hch@lst.de>,
  <rust-for-linux@vger.kernel.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/4] rust: configfs: introduce rust support for configfs
In-Reply-To: <87wme4nl7o.fsf@kloenk.dev> (Fiona Behrens's message of "Wed, 05
	Feb 2025 22:19:23 +0100")
References: <20250131-configfs-v1-0-87947611401c@kernel.org>
	<20250131-configfs-v1-3-87947611401c@kernel.org>
	<hlmed80z1XLW8Lk874NHQlDa-r-BHEODXB1lSV8G1ZEoO7EU0rSsRPvpnXA4yCvQulPtKCrudfD7ds-grqXnkQ==@protonmail.internalid>
	<87wme4nl7o.fsf@kloenk.dev>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 06 Feb 2025 12:37:57 +0100
Message-ID: <87frkrjobu.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Fiona Behrens" <me@kloenk.dev> writes:

> Andreas Hindborg <a.hindborg@kernel.org> writes:
>

[cut]

>> +/// A `configfs` subsystem.
>> +///
>> +/// This is the top level entrypoint for a `configfs` hierarchy. Embed =
a field
>> +/// of this type into a struct and implement [`HasSubsystem`] for the s=
truct
>> +/// with the [`kernel::impl_has_subsystem`] macro. Instantiate the subs=
ystem with
>> +/// [`Subsystem::register`].
>> +///
>> +/// A [`Subsystem`] is also a [`Group`], and implementing [`HasSubsyste=
m`] for a
>> +/// type will automatically implement [`HasGroup`] for the type.
>
> Rustdoc is unhappy about this (and other lines where `HasGroup` is used)
> as `HasGroup` is private and therefore rustdoc cannot resolve this link.

Right, I'll remove this link.

>
>> +#[pin_data(PinnedDrop)]
>> +pub struct Subsystem<DATA> {
>
> I would favour this as PascalCase (so `Subsystem<Data>`), as this is a
> generic type and not a generic const (I always see all uppercase for
> const generics).

Yea, that makes sense. I somehow thought all generics had to be
screaming snake.


[cut]

>> +
>> +#[pinned_drop]
>> +impl<DATA> PinnedDrop for Subsystem<DATA> {
>> +    fn drop(self: Pin<&mut Self>) {
>> +        // SAFETY: We registered `self.subsystem` in the initializer re=
turned by `Self::new`.
>> +        unsafe { bindings::configfs_unregister_subsystem(self.subsystem=
get()) };
>
> I see other users (e.g. gpio-virtuser[0]) to also destroy the mutex, is
> that a required action?
>
> [0]: https://elixir.bootlin.com/linux/v6.13.1/source/drivers/gpio/gpio-vi=
rtuser.c#L1841

Referring to C null_blk, they do not destroy the mutex when tearing
down. I am not sure what the correct thing to do is. Perhaps lockdep
wants it destroyed? I'll investigate.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/block/null_blk/main.c?h=3Dv6.14-rc1#n2105


[cut]

>> +
>> +impl<PAR, CHLD, CPTR, PCPTR> GroupOperationsVTable<PAR, CHLD, CPTR, PCP=
TR>
>> +where
>> +    PAR: GroupOperations<Child =3D CHLD, ChildPointer =3D CPTR, PinChil=
dPointer =3D PCPTR>,
>> +    CPTR: InPlaceInit<Group<CHLD>, PinnedSelf =3D PCPTR>,
>> +    PCPTR: ForeignOwnable<PointedTo =3D Group<CHLD>>,
>> +{
>
> I usualy favour having struct and then impls for the functions direcly
> above each other. Here you have th `get_group_data` function between
> that, maybe it makes sense to move that function either further up or
> down.

I agree, I'll move it =F0=9F=91=8D
>
> So far this is all that I did direcly see.

Thanks!


Best regards,
Andreas Hindborg


