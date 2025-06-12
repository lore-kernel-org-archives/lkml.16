Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4E329C32B;
	Thu, 12 Jun 2025 16:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749745065; cv=none; b=OuniCBh1vwhvtg/10VbwAMyGDT6+aoboqhoqpowHvzNB40Rr/wLB8m6KovPv2MoJOzzA16xppq+Fnslsu/0Q919FO0I2M74GbtTWa/QO7RUveIM9Ci1Vcu5h/dmxqsDm+rcEnGP6+5/TLeVBp21w2WW6npNOMpI6x7FEIoVRibs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749745065; c=relaxed/simple;
	bh=P4GkkwYbWhmeh9csBqgTZ7uqaf+uAYctZ+HQnsHZM2A=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=FY/aGfjWDYIkPG1UfJY2uZFsWpuuYFM+xp8Njax0oeZjcMJvr4wQgDJmg2+CrPIv8xeqVKZalk3y+8gLrIdjQRJeo+MPWg9GoPmzDo/72sWVgoTHfXkmQ/pZ60nj8f9OGK2DEd4Z6TgvPBepGD87JVMb2JB+SDXAH+Tjchm/5ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c1SUe28k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c1SUe28k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25F9DC4CEF8;
	Thu, 12 Jun 2025 16:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749745064;
	bh=P4GkkwYbWhmeh9csBqgTZ7uqaf+uAYctZ+HQnsHZM2A=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=c1SUe28kWHoENEz7zJJWNdOCkDzVJ0gX5wNQllCms2F9d6UA/5iMwgh/2ZisCw3Ig
	 iF2vdcPkN7qmXV4DRZHGsLqDCyz6QyAWlc5r7xfgbhA52uMZzkar3I2NMFrR77l4G9
	 RMLofZsvxyxChA2TVLjahHNx2+kbY+6nUKMDWVELUbrK9HYcgv9UtIp3pG4HDLG2nK
	 7P77E6WBT6B2ku7nXOBteVpz96VixU5cwYebEITcusCWIP/r9Dh+kLNLsTeHdkbesh
	 ASyyLVivCyXXBO+5fqjBE55THBu4OvEFa5LT621WgP+vB2M/BpuTgDQQSyMMd+TL9A
	 EGup12qZ+6H0g==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Jun 2025 18:17:40 +0200
Message-Id: <DAKOUVS4YP4L.3I6FD9JKN02EU@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: <gregkh@linuxfoundation.org>, <rafael@kernel.org>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <benno.lossin@proton.me>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/4] rust: revocable: support fallible PinInit types
From: "Benno Lossin" <lossin@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250612145145.12143-1-dakr@kernel.org>
 <20250612145145.12143-2-dakr@kernel.org>
 <DAKO8MMSCUE4.1WVR6SBADGP8W@kernel.org> <aEr5FNDaueo5SG5R@cassiopeiae>
In-Reply-To: <aEr5FNDaueo5SG5R@cassiopeiae>

On Thu Jun 12, 2025 at 5:58 PM CEST, Danilo Krummrich wrote:
> On Thu, Jun 12, 2025 at 05:48:36PM +0200, Benno Lossin wrote:
>> On Thu Jun 12, 2025 at 4:51 PM CEST, Danilo Krummrich wrote:
>> > diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
>> > index fa1fd70efa27..41b8fe374af6 100644
>> > --- a/rust/kernel/revocable.rs
>> > +++ b/rust/kernel/revocable.rs
>> > @@ -82,8 +82,11 @@ unsafe impl<T: Sync + Send> Sync for Revocable<T> {=
}
>> > =20
>> >  impl<T> Revocable<T> {
>> >      /// Creates a new revocable instance of the given data.
>> > -    pub fn new(data: impl PinInit<T>) -> impl PinInit<Self> {
>> > -        pin_init!(Self {
>> > +    pub fn new<E>(data: impl PinInit<T, E>) -> impl PinInit<Self, Err=
or>
>> > +    where
>> > +        Error: From<E>,
>>=20
>> I don't think we need this bound as you don't use it in the function
>> body.
>
> I think it's needed by try_pin_init!() below, no?
>
> Without it I get the compilation error in [1].
>
>> > +    {
>> > +        try_pin_init!(Self {
>> >              is_available: AtomicBool::new(true),
>> >              data <- Opaque::pin_init(data),
>> >          })

Does it work with this?

    try_pin_init!(Self {
        is_available: AtomicBool::new(true),
        data <- Opaque::pin_init(data),
    }? E)

---
Cheers,
Benno

>>=20
>
> [1]
>
> error[E0277]: `?` couldn't convert the error to `error::Error`
>   --> rust/kernel/revocable.rs:87:9
>    |
> 87 | /         try_pin_init!(Self {
> 88 | |             is_available: AtomicBool::new(true),
> 89 | |             data <- Opaque::pin_init(data),
> 90 | |         })
>    | |          ^
>    | |          |
>    | |__________this can't be annotated with `?` because it has type `Res=
ult<_, E>`
>    |            the trait `core::convert::From<E>` is not implemented for=
 `error::Error`
>    |
>    =3D note: the question mark operation (`?`) implicitly performs a conv=
ersion on the error value using the `From` trait
>    =3D note: required for `core::result::Result<revocable::Revocable<T>::=
new::__InitOk, error::Error>` to implement `core::ops::FromResidual<core::r=
esult::Result<core::convert::Infallible, E>>`
>    =3D note: this error originates in the macro `$crate::__init_internal`=
 which comes from the expansion of the macro `try_pin_init` (in Nightly bui=
lds, run with -Z macro-backtrace for more info)
> help: consider introducing a `where` clause, but there might be an altern=
ative better way to express this requirement
>    |
> 83 | impl<T> Revocable<T> where error::Error: core::convert::From<E> {
>    |                      ++++++++++++++++++++++++++++++++++++++++++
>
> error[E0277]: the trait bound `impl PinInit<Revocable<T>, Error>: PinInit=
<Revocable<T>, E>` is not satisfied
>   --> rust/kernel/revocable.rs:85:48
>    |
> 85 |     pub fn new<E>(data: impl PinInit<T, E>) -> impl PinInit<Self, E>
>    |                                                ^^^^^^^^^^^^^^^^^^^^^=
 the trait `pin_init::PinInit<revocable::Revocable<T>, E>` is not implement=
ed for `impl pin_init::PinInit<revocable::Revocable<T>, error::Error>`
>    |
>    =3D help: the following other types implement trait `pin_init::PinInit=
<T, E>`:
>              `core::result::Result<T, E>` implements `pin_init::PinInit<T=
, E>`
>              `pin_init::ChainInit<I, F, T, E>` implements `pin_init::PinI=
nit<T, E>`
>              `pin_init::ChainPinInit<I, F, T, E>` implements `pin_init::P=
inInit<T, E>`
>              `pin_init::__internal::AlwaysFail<T>` implements `pin_init::=
PinInit<T, ()>`
>    =3D note: the full name for the type has been written to 'kernel.long-=
type-441004638990533407.txt'
>    =3D note: consider using `--verbose` to print the full type name to th=
e console

