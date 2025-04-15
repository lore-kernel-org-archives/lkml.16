Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2170717C98;
	Tue, 15 Apr 2025 11:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744715479; cv=none; b=PlSM3hwPB8ojlj/92W2ftG2R2orhf8FqanjIVcfOImhkDCuysE/Y3QRrkbrn2u16ynn6m599chwJUVFmZD8oSjTnYT4+C9mSSdWuDbQzM08buDtjgdTLNe45NNGi9nTXlBIlpkeu9CCq2FgmIXD2zFlvPRy8ZzhUDrSzNEVM57s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744715479; c=relaxed/simple;
	bh=PQP9aQ4AewNgvBkjS7rl4kENezRz6vX7JiNLpToEyK4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=IHqSZFEsIezSp9d6xxyvQ2OwwF5Cfbpn7/GMG752HCssM0b0jl8wgxpVQh2Mux7UyRbY8JMIGsmeFgIxWKUTTgdaPBfEwtOr6/GfGn+KIkNdZdQhbT1APBSuMUdDitcO+aOs1PN0eUV/okjZsFFLo/oAhaZxzxddvqQeEv4USws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev; spf=pass smtp.mailfrom=buenzli.dev; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buenzli.dev
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4ZcM0b59Smz9t2W;
	Tue, 15 Apr 2025 13:11:11 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 15 Apr 2025 13:11:07 +0200
Message-Id: <D9760KMM0PSB.HONQ7MUG8OTN@buenzli.dev>
Cc: "Rob Herring" <robh@kernel.org>, "Saravana Kannan"
 <saravanak@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 2/5] rust: Add bindings for reading device properties
From: "Remo Senekowitsch" <remo@buenzli.dev>
To: "Danilo Krummrich" <dakr@kernel.org>
References: <20250326171411.590681-1-remo@buenzli.dev>
 <20250414152630.1691179-1-remo@buenzli.dev>
 <20250414152630.1691179-3-remo@buenzli.dev> <Z_1Jfs5DXD2vuzLj@cassiopeiae>
 <D96RNFS3N8L2.33MSG7T019UQM@buenzli.dev> <Z_4rVyUjK1dlnTsT@pollux>
In-Reply-To: <Z_4rVyUjK1dlnTsT@pollux>

On Tue Apr 15, 2025 at 11:48 AM CEST, Danilo Krummrich wrote:
> On Tue, Apr 15, 2025 at 01:55:42AM +0200, Remo Senekowitsch wrote:
>> On Mon Apr 14, 2025 at 7:44 PM CEST, Danilo Krummrich wrote:
>> > On Mon, Apr 14, 2025 at 05:26:27PM +0200, Remo Senekowitsch wrote:
>> >> The device property API is a firmware agnostic API for reading
>> >> properties from firmware (DT/ACPI) devices nodes and swnodes.
>> >>=20
>> >> While the C API takes a pointer to a caller allocated variable/buffer=
,
>> >> the rust API is designed to return a value and can be used in struct
>> >> initialization. Rust generics are also utilized to support different
>> >> types of properties where appropriate.
>> >>=20
>> >> The PropertyGuard is a way to force users to specify whether a proper=
ty
>> >> is supposed to be required or not. This allows us to move error
>> >> logging of missing required properties into core, preventing a lot of
>> >> boilerplate in drivers.
>> >
>> > The patch adds a lot of thing, i.e.
>> >   * implement PropertyInt
>> >   * implement PropertyGuard
>> >   * extend FwNode by a lot of functions
>> >   * extend Device by some property functions
>> >
>> > I see that from v1 a lot of things have been squashed, likely because =
there are
>> > a few circular dependencies. Is there really no reasonable way to brea=
k this
>> > down a bit?
>>=20
>> I was explicitly asked to do this in the previous thread[1].
>
> I'm well aware that you were asked to do so and that one reason was that
> subsequent patches started deleting code that was added in previous ones
> (hence my suspicion of circular dependencies and that splitting up things=
 might
> not be super trivial).
>
>> I'm happy
>> to invest time into organizing files and commits exactly the way people
>> want, but squashing and splitting the same commits back and forth
>> between subsequent patch series is a waste of my time.
>
> I don't think you were asked to go back and forth, but whether you see a
> reasonable way to break things down a bit, where "reasonable" means witho=
ut
> deleting code that was just added.

I was asked to squash two specific commits. The first was making the
read method generic. That was the one that deleted much code. Totally
reasonable, and the generic stuff might be discarded anyway, so I won't
be moving stuff back and forth.

However, the second commit was the one introducing PropertyGuard. That
was a beautifully atomic commit, no circular dependencies in sight. If
this commit is to be split up, one of the smaller ones would without
doubt look exactly the same as the one before. I provided a link[1]
to the exact email telling me to squash that exact patch to avoid any
confusion.

>> Do reviewers not typically read the review comments of others as well?
>
> I think mostly they do, but maintainers and reviewers are rather busy peo=
ple.
> So, I don't think you can expect everyone to follow every thread, especia=
lly
> when they get lengthy.
>
>> What can I do to avoid this situation and make progress instead of
>> running in circles?
>
> I suggest to investigate whether it can be split it up in a reasonable wa=
y and
> subsequently answer the question.

The point is that I agree with you that the PropertyGuard patch can be
split out. And possibly more: I think a reasonable person could make a
separate commit for every `property_read_<type>` method. And I'm happy
to do that if it's the way to go.  But if I do that, send a v3 and then
someone else asks me to squash it again (because they didn't read this
exchange between you and me...) then I would've wasted my time.

> With your contribution you attempt to add a rather large portion of prett=
y core
> code. This isn't an easy task and quite some discussion is totally expect=
ed;
> please don't get frustrated, the series goes pretty well. :)

I'm trying, but I can't say I have a good first impression of doing
code review over a mailing list. Doing open-heart surgery with a
pickfork and writing documents in Microsoft Word both seem like more
productive and enjoyable activities to me.
=20
Link: https://lore.kernel.org/rust-for-linux/20250326171411.590681-1-remo@b=
uenzli.dev/T/#m68b99b283a2e62726ee039bb2394d0741b31e330 [1]
