Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F2922AE5D;
	Sat, 31 May 2025 12:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748692991; cv=none; b=kuc1TfmTNtDpMtcJ8sMUgdoHlRzh2PhZt32VoxLv3DdHKlY4SUdxsCrIYKHk+b6Wbxj3NJioXylxWDZix9GqLzqoaTRVwtsU0a1W7tUhrIWJw7BetxYuiJVJ0RRHmwXL/AotoOjtSC/e0KF5H1pA5AvPCt9PJCoXvcrU8TmbKs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748692991; c=relaxed/simple;
	bh=q33pR9reSdcNqx4kG8qjZBkh30ekK0o6hOTX6CGVhAg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=hbPt8fjtJBuhmTfRIcMiMoyFSBXEW+WYwu++qHGEdUlSQmiV3qndz9ajhaZvQXtKUIcP/nzbYD3rd9Sx+HqY47z/WQiZA9a3/dS4PGxhNdKN4CkS9Qh4+aO52AD5qU6umnPLGbjgOvbMSGyaHNKIUY4nDPhVrwdw15usDYOcDrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QQkLH5rk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QQkLH5rk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04D19C4CEE3;
	Sat, 31 May 2025 12:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748692989;
	bh=q33pR9reSdcNqx4kG8qjZBkh30ekK0o6hOTX6CGVhAg=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=QQkLH5rkCgzqmbY81WY69wflccWCGSaP7tI+avqyfWWbuApXbYCr9QCY24oD+1AK6
	 OW+dtvSrtgtSf9N4HF76KLlKJhG3RjpD3nU8x+oKoRZrsx/3mpLMxLAv2aoBpN4dj9
	 tI0sPNJYQRV+M4/9dF3fzQvwtCImmmIXCxcb75j0sF4hCcHHn6Uuft+cirbFciR7vZ
	 O/uvli1cPDsy8rFx8eStP9w9lY1gNvXQBfVWJS+cMSzHNMOUkk520QefTvpQ3pk2Ld
	 KF+3r4ywqKP/LWgY1nTtwR0tvo+39Si9Kr/LKThm8B3E/kBdH1icAssVcxgUuoLR58
	 zbryjnmuC3C4A==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 May 2025 14:03:05 +0200
Message-Id: <DAABXF5QDYF0.21V01UJODPM89@kernel.org>
Cc: <gregkh@linuxfoundation.org>, <rafael@kernel.org>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <benno.lossin@proton.me>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <chrisi.schrefl@gmail.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 7/7] rust: sample: misc: implement device driver sample
From: "Benno Lossin" <lossin@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250530142447.166524-1-dakr@kernel.org>
 <20250530142447.166524-8-dakr@kernel.org>
 <DA9RRZVPZSMW.1LGW9H4G0RLT5@kernel.org> <aDowAzvEvrQcella@pollux>
 <DAA6ZTTNP0CM.270XX92YOFGWB@kernel.org> <aDrZ7ma_aNki3FRz@pollux>
In-Reply-To: <aDrZ7ma_aNki3FRz@pollux>

On Sat May 31, 2025 at 12:29 PM CEST, Danilo Krummrich wrote:
> On Sat, May 31, 2025 at 10:11:08AM +0200, Benno Lossin wrote:
>> On Sat May 31, 2025 at 12:24 AM CEST, Danilo Krummrich wrote:
>> > On Fri, May 30, 2025 at 10:15:37PM +0200, Benno Lossin wrote:
>> >> On Fri May 30, 2025 at 4:24 PM CEST, Danilo Krummrich wrote:
>> >> > +config SAMPLE_RUST_MISC_DEVICE_WITH_PARENT
>> >> > +	bool "Create a misc device with a parent device"
>> >> > +	depends on SAMPLE_RUST_MISC_DEVICE
>> >> > +	default n
>> >> > +	help
>> >> > +	  Say Y here if you want the misc device sample to create a misc
>> >> > +	  device with a parent device.
>> >> > +
>> >>=20
>> >> Why not create a separate file? The `cfg`s might confuse newcomers
>> >> looking at the sample.
>> >
>> > It would be a lot of duplicated code, unless we really *only* exercise=
 the
>> > device creation and registration part, which would be a bit unfortunat=
e, given
>> > that this sample is also a pretty good test.
>>=20
>> We could separate the common parts into a single file and then
>> `include!` that file from the two samples. (Or if the build system
>> supports multi-file samples then just use that, but my gut feeling is
>> that it doesn't)
>
> The samples are normal modules, where we can have multiple files. But I d=
on't
> see how that helps.
>
> `include!` works, but I'm not sure it's that much better.
>
> Another option would be to put the `cfg` on the module!() macro itself an=
d have
> two separate module types, this way there is only a `cfg` on the two modu=
le!()
> invocations.

How about we do it like this:

We create samples/rust/rust_misc_device/{module.rs,parent.rs,common.rs}
and `module.rs`/`parent.rs` are the two entry points. Both of these
files:
* include `common.rs` using `include!` at the very top.
* define a `RustMiscDeviceModule` struct and implmement `InPlaceModule`
  for it.

The module-level docs, common imports constants, `module!` invocation &
other definitions stay in `common.rs`.

This way we can build them at the same time and have no cfgs :)

>> >> > @@ -205,6 +222,31 @@ fn init(_module: &'static ThisModule) -> impl =
PinInit<Self, Error> {
>> >> >      }
>> >> >  }
>> >> > =20
>> >> > +#[cfg(CONFIG_SAMPLE_RUST_MISC_DEVICE_WITH_PARENT)]
>> >> > +impl kernel::Module for RustMiscDeviceModule {
>> >> > +    fn init(_module: &'static ThisModule) -> Result<Self> {
>> >> > +        let options =3D Self::init();
>> >> > +        let faux =3D faux::Registration::new(c_str!("rust-misc-dev=
ice-sample"), None)?;
>> >> > +
>> >> > +        // For every other bus, this would be called from Driver::=
probe(), which would return a
>>=20
>> Missing '`' around Driver::probe().
>>=20
>> >> > +        // `Result<Pin<KBox<T>>>`, but faux always binds to a "dum=
my" driver, hence probe() is
>> >>=20
>> >> Not clear what `T` is supposed to be, do you mean `Self`?
>> >
>> > From the perspective of the type implementing the corresponding Driver=
 trait it
>> > would indeed be `Self`. But I found it ambiguous to write `Self`, sinc=
e I do *not*
>> > mean `RustMiscDeviceModule` with `Self`.
>>=20
>> Yeah that makes sense, I already entered into the `impl Driver` context
>> :) How about we use `<T as Driver>::probe()` above and then `T` makes
>> sense?
>
> Yep, that sounds good.
>
>> Another thing: faux devices don't have a `probe` in rust, so saying "not
>> required" doesn't make much sense, right?
>
> In Rust, faux does not have probe() indeed, but that's because it's "not
> required"; I can't think of a use-case for a new driver (yet), where this=
 isn't
> just unnecessary overhead.

I'd write something along the lines of "the faux rust abstractions do
not have a `probe`, since it's unnecessary, so we initialize the
registration here".

---
Cheers,
Benno
