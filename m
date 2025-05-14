Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4535B27510A;
	Wed, 14 May 2025 12:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747225307; cv=none; b=KVcVF2ULyga5YtQKIhrZSPCAUzkKpYsKyogxZ1EFSW2rGO7jLTZBtNyqQyWTj4G9u212lVYDUh7zAo5MUNyK1mc3iKFh6ScNwJBlAJaIMfSJNZ5zDgKbe7rokQLA3vNS5JZ+03M19AadhaiHh/mkOIY/Yhm7vTqYMxfvAtT/Hl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747225307; c=relaxed/simple;
	bh=Ymu0unxrdD4AbfbR2cd5zhAgf8o4S6x1avMoiulo4yk=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=dnzC9xziiZvcd0whU9eFQUmkLHN5AKYvFETwrNsZWpKOQZRihH8tnQFvSU7uHq+GvIkgGxzLd0os4znTOrUmukiz5/YyiHVlpDfqY/mU+5Vzwh7zgCG04vDPZXtGgTu1aFYmh55PZK4c1jBWaZ6FWDxWuSYkT+oblff5w9/P3G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BKhF4ukX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BKhF4ukX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82DB7C4CEED;
	Wed, 14 May 2025 12:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747225306;
	bh=Ymu0unxrdD4AbfbR2cd5zhAgf8o4S6x1avMoiulo4yk=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=BKhF4ukX4v+i+ULC+RgzqXNJB61patkwsZ/5DUQO77T8SqrNZJcuqQ0BN2RhwXhgc
	 fSIG2Bey2WeH8nFLKh27lA3dYHEFfNps9xMpp/G8A25oLAEiiV8C45PuvvVdeuKiGZ
	 dJPBTXSZD22RH+vfeWGXuY4Wx76BhU00yqF8Z/xvUITdwjvq82jyVfLIXsQHkSv5FY
	 lxrtlgfyDxsjtVkkxsk47oo82Bl6NOOrYcIHyVRBLQNqXz+YZZPZLO3tUaYfstTr3L
	 yE9Bavq5L2WZne7fbezJz+k+ushRIqeB6fcIlOpYRrCwDfVU2rLoSBbhgfSVlpg/hb
	 IWk9av+EBTVuw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 May 2025 14:21:41 +0200
Message-Id: <D9VVOENW6H8P.32D4SGCFJ0LJU@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>
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
X-Mailer: aerc 0.20.1
References: <20250505-debugfs-rust-v5-0-3e93ce7bb76e@google.com>
 <20250505-debugfs-rust-v5-4-3e93ce7bb76e@google.com>
 <D9VPA1M45WBK.1TB4KOUXD24BD@kernel.org> <aCRdNJ2oq-REBotd@pollux>
 <D9VSJTPCSNXV.1LCXKGKVDGP96@kernel.org> <aCR9cD7OcSefeaUm@pollux>
In-Reply-To: <aCR9cD7OcSefeaUm@pollux>

On Wed May 14, 2025 at 1:24 PM CEST, Danilo Krummrich wrote:
> On Wed, May 14, 2025 at 11:54:39AM +0200, Benno Lossin wrote:
>> On Wed May 14, 2025 at 11:07 AM CEST, Danilo Krummrich wrote:
>> > On Wed, May 14, 2025 at 09:20:49AM +0200, Benno Lossin wrote:
>> >> On Tue May 6, 2025 at 1:51 AM CEST, Matthew Maurer wrote:
>> >> > +impl kernel::Module for RustDebugFs {
>> >> > +    fn init(_this: &'static ThisModule) -> Result<Self> {
>> >> > +        // Create a debugfs directory in the root of the filesyste=
m called "sample_debugfs".
>> >> > +        let debugfs =3D Dir::new(c_str!("sample_debugfs"));
>> >> > +
>> >> > +        {
>> >> > +            // Create a subdirectory, so "sample_debugfs/subdir" n=
ow exists.
>> >> > +            // We wrap it in `ManuallyDrop` so that the subdirecto=
ry is not automatically discarded
>> >> > +            // at the end of the scope - it will be cleaned up whe=
n `debugfs` is.
>> >> > +            let sub =3D ManuallyDrop::new(debugfs.subdir(c_str!("s=
ubdir")));
>> >>=20
>> >> I dislike the direct usage of `ManuallyDrop`. To me the usage of
>> >> `ManuallyDrop` signifies that one has to opt out of `Drop` without th=
e
>> >> support of the wrapped type. But in this case, `Dir` is sometimes
>> >> intended to not be dropped, so I'd rather have a `.keep()` function I
>> >> saw mentioned somewhere.
>> >
>> > I agree, if we really want to "officially" support to forget() (sub-)d=
irectories
>> > and files in order to rely on the recursive cleanup of the "root" dire=
ctory, it
>> > should be covered explicitly by the API. I.e. (sub-)directories and fi=
les should
>> > have some kind of keep() and / or forget() method, to make it clear th=
at this is
>> > supported and by design and won't lead to any leaks.
>> >
>> > Consequently, this would mean that we'd need something like your propo=
sed const
>> > generic on the Dir type, such that keep() / forget() cannot be called =
on the
>> > "root" directory.
>> >
>> > However, I really think we should keep the code as it is in this versi=
on and
>> > just don't provide an example that utilizes ManuallyDrop and forget().
>> >
>> > I don't see how the idea of "manually dropping" (sub-)directories and =
files
>> > provides any real value compared to just storing their instance in a d=
river
>> > structure as long as they should stay alive, which is much more intuit=
ive
>> > anyways.
>>=20
>> Yeah that's whats normally done in Rust anyways. But I think that
>> lifetimes bite us in this case:
>>=20
>>     let debugfs: Dir<'static> =3D Dir::new(cstr!("sample_debugfs"));
>>=20
>>     let sub: Dir<'a> =3D debugfs.subdir(cstr!("subdir"));
>>     // lifetime `'a` starts in the line above and `sub` borrows `debugfs=
`
>>=20
>>     /* code for creating the file etc */
>>=20
>>     Ok(Self { _debugfs: debugfs, _sub: sub })
>>     // lifetime `'a` has to end in the line above, since debugfs is move=
d but `sub` still borrows from it!
>>=20
>> This code won't compile, since we can't store the "root" dir in the same
>> struct that we want to store the subdir, because the subdir borrows from
>> the root dir.
>>=20
>> Essentially this would require self-referential structs like the
>> `ouroboros` crate [1] from user-space Rust. We should rather have the
>> `.keep()` function in the API than use self-referential structs.
>
> Fair enough -- I think we should properly document those limitations, rec=
ommend
> using keep() for those cases and ensure that we can't call keep() on the =
"root"
> directory then.
>
> Unless, we can find a better solution, which, unfortunately, I can't thin=
k of
> one. The only thing I can think of is to reference count (parent) directo=
ries,
> which would be contrary to how the C API works and not desirable.

Yeah, I also don't have an idea, but if I find something, I'll let you
know.

>> [1]: https://docs.rs/ouroboros/latest/ouroboros/attr.self_referencing.ht=
ml
>>=20
>> Another problem that only affects complicated debugfs structures is that
>> you would have to store all subdirs & files somewhere. If the structure
>> is dynamic and changes over the lifetime of the driver, then you'll need
>> a `Vec` or store the dirs in `Arc` or similar, leading to extra
>> allocations.
>
> If it changes dynamically then it's pretty likely that we do not only wan=
t to
> add entries dynamically, but also remove them, which implies that we need=
 to be
> able to drop them. So, I don't think that's a problem.

Yeah that's true.

> What I see more likely to happen is a situation where the "root" director=
y
> (almost) lives forever, and hence subsequent calls, such as
>
> 	root.subdir("foo").keep()
>
> effectively are leaks.
>
> One specific example for that would be usb_debug_root, which is created i=
n the
> module scope of usb-common and is used by USB host / gadget / phy drivers=
.
>
> The same is true for other cases where the debugfs "root" is created in t=
he
> module scope, but subsequent entries are created by driver instances. If =
a
> driver would use keep() in such a case, we'd effectively leak memory ever=
ytime a
> device is unplugged (or unbound in general).

Hmm that is unfortunate. But I don't see a problem with having:

    static USB_DEBUGFS: Dir<'static> =3D ...; // or some on-demand init pro=
cess

Then users can store subdir that also is `Dir<'static>` and just borrow
the USB_DEBUGFS for `'static`.

The docs on `keep` should definitely warn about leaks.

---
Cheers,
Benno
