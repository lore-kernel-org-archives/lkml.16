Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96932246799;
	Tue,  1 Jul 2025 19:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751399189; cv=none; b=JKAgdkPK1BR4onAzSxPKJNUA1Jtj1G80nVjaTWOv3JAtJm1iqJxStoHSwNgywbTZ2guKc1KLUV5aUv6taDjaLLe2yBIPyha5hKuj+XwFmWX78Lvq+IZjkZKixso6Z8Lumbt1DICpEwfanXRyM3plCsFb76rAw2MKJQBqhcgYc/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751399189; c=relaxed/simple;
	bh=XLkDdeh0DEjAErIB3aJsz7IIlmjvu0WCHTgIHeBbJsc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=qvMTbXq2+7bD9t1V9kKZpM4EQzV8eqM6bX//LRLx1AerQhkdFC4lKvHJOq2d7ksKRhLaN45JyHPSrTgBxLVG/+9juvshvOZhAfniZXFPmWWAxPRFaPiqngeBmZX683Dw4c+BCQecMFPyMBjQ1McuMNzP4TvFog44WXZBxZ1m19U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JzodV04K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JzodV04K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E75A6C4CEEB;
	Tue,  1 Jul 2025 19:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751399189;
	bh=XLkDdeh0DEjAErIB3aJsz7IIlmjvu0WCHTgIHeBbJsc=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=JzodV04KgYduDkcDLvIvzoZkg1ZYwvCNXJONtLMIy+UHNB97/d8/L6k5ztvI8kt4X
	 300Ou5ToeDApwtPoyNAStqS13oD+2ex5rgM/3IcjTFQn8FnmHRS0QqiGOxnwo/Vc0O
	 D7Hzr1siaFvMGN5wx+N/Jp7ILvjy7+5FQBL38I6eeHn2+TNiJFKjCETHiL6VsCGxP4
	 qhE3EcrsdASynbGHAZbKq3pw/q9mUDL0qA4ttp9HuOdpSNdVxWlxJ+RUrm/7BSiuR4
	 MYLcoCBLa+Bva9+YLTzRCD2/o/72AVO07wzdLEd4O0tllumzluZbaMMsEceP8rHAPs
	 7OdTngluK8XAw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 01 Jul 2025 21:46:24 +0200
Message-Id: <DB0Z71SF488V.3QURUHHELOY84@kernel.org>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Sami Tolvanen" <samitolvanen@google.com>, "Timur
 Tabi" <ttabi@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Dirk Behme" <dirk.behme@de.bosch.com>
Subject: Re: [PATCH v8 4/6] rust: debugfs: Support arbitrary owned backing
 for File
From: "Benno Lossin" <lossin@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>, "Matthew Maurer"
 <mmaurer@google.com>
X-Mailer: aerc 0.20.1
References: <5c3a2289-01c5-413e-9d7c-88a41c3f54e2@kernel.org>
 <CAGSQo038u_so+_pMRYj0K546zNfO5-eqoXFivXsEF6ACK=Y5cw@mail.gmail.com>
 <ce8f428b-fcb0-48dc-b13e-6717c9a851b4@kernel.org>
 <CAGSQo02hyJncD1oTpUMgiSZeX5UYYY2p-WZTyroQJJ6fMnOrCQ@mail.gmail.com>
 <aGLUl7ZtuQBPoCuv@pollux> <2025070131-icon-quarters-0c16@gregkh>
 <aGPtCBB6nWTNJuwK@pollux> <2025070137-tartar-juncture-fcd2@gregkh>
 <aGP6d2-jJy5rtjMK@pollux>
 <CAGSQo00eG5oRdN_xORLUyUauLi_vzypU-gz6DSU_FzaAbHRLng@mail.gmail.com>
 <aGQ1VsnFaxBo9zaM@pollux>
In-Reply-To: <aGQ1VsnFaxBo9zaM@pollux>

On Tue Jul 1, 2025 at 9:21 PM CEST, Danilo Krummrich wrote:
> On Tue, Jul 01, 2025 at 11:11:13AM -0700, Matthew Maurer wrote:
>> On Tue, Jul 1, 2025 at 8:10=E2=80=AFAM Danilo Krummrich <dakr@kernel.org=
> wrote:
>> >         impl Firmware {
>> >            pub fn new(&dir: debugfs::Dir, buffer: [u8]) -> impl PinIni=
t<Self> {
>> >               pin_init!(Self {
>> >                  minor <- dir.create_file("minor", 1),
>> >                  major <- dir.create_file("major", 2),
>> >                  buffer <- dir.create_file("buffer", buffer),
>> >               })
>> >            }
>> >         }
>> >
>> >         // This is the only allocation we need.
>> >         let fw =3D KBox::pin_init(Firmware::new(...), GFP_KERNEL)?;
>> >
>> > With this everything is now in a single allocation and since we're usi=
ng
>> > pin-init, Dir::create_file() can safely store pointers of the correspo=
nding data
>> > in debugfs_create_file(), since this structure is guaranteed to be pin=
ned in
>> > memory.
>> >
>> > Actually, we can also implement *only this*, since with this my previo=
us example
>> > would just become this:
>>=20
>> If we implement *only* pinned files, we run into an additional problem
>> - you can't easily extend a pinned vector. This means that you cannot
>> have dynamically created devices unless you're willing to put every
>> new `File` into its own `Box`, because you aren't allowed to move any
>> of the previously allocated `File`s for a resize.
>>=20
>> Where previously you would have had
>>=20
>> ```
>> debug_files: Vec<File>
>> ```
>>=20
>> you would now have
>>=20
>> ```
>> debug_files: Vec<PinBox<File<T>>>
>> ```
>
> Stuffing single File instances into a Vec seems like the wrong thing to d=
o.
>
> Instead you may have instances of some data structure that is created
> dynamically in your driver that you want to expose through debugfs.
>
> Let's say you have (userspace) clients that can be registered arbitrarily=
, then
> you want a Vec<Client>, which contains the client instances. In order to =
provide
> information about the Client in debugfs you then have the client embed th=
ings as
> discussed above.
>
> 	struct Client {
> 	   id: File<ClientId>,
> 	   data: File<ClientData>,
> 	   ...
> 	}
>
> I think that makes much more sense than keeping a Vec<Arc<Client>> *and* =
a
> Vec<File> separately. Also, note that with the above, your Client instanc=
es
> don't need to be reference counted anymore.
>
> I think this addresses the concerns below.

You still have the issue that `Client` now needs to be pinned and the
vector can't be resized. But if you know that it's bounded, then we
could just make `Pin<Vec<T>>` work as expected (not relocating the
underlying allocation by not exposing `push`, only
`push_within_capacity`).

We also could have a `SegmentedVec<T>` that doesn't move elements.
Essentially it is
   =20
    enum SegmentedVec<T> {
        Cons(Segment<T>, KBox<SegmentedVec<T>>)
        Nul,
    }

    struct Segment<T> {
        elements: [T; 16]
    }

or make the segments variable-sized and grow them accordingly.

---
Cheers,
Benno
