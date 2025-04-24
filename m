Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8ECA221FA5;
	Thu, 24 Apr 2025 11:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745493940; cv=none; b=AdLj3G14tj60eEVObbu7r74WtNaKViDxN1X2/Um1jv63xn1Z4T2JEFiqS4kEJTdEnNOg9HxoEvB9bydOF2pOaN0HAn1FbEuhUOBpSTPVl3IfQefjdhg3FAnrxP5Ub/jpBq8K/b6gaD5F7Wim2UgoLDT+IkU06yIZkQT7LZ1g/As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745493940; c=relaxed/simple;
	bh=T6vlT/iufvMVBJdh00gNIO67VTiPTNMihGurbSdPLaQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=poi8sN7hZuN0MI56tCAL/pIbOUVfXzhjwYkaBW5Q2INM7/yrqbuf3NU3xCYQS0eGL4tDqHvOkLri+tM6ffnftXB5wBCnEY0LVjuLXngLmhep07D5N+4cU74gcL/IAkq+UtENGvXGcRd4nA9NB+PDHEiclo3dWqVlxEAn41ofcvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev; spf=pass smtp.mailfrom=buenzli.dev; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buenzli.dev
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4Zjtv10yLzz9sm9;
	Thu, 24 Apr 2025 13:25:33 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 24 Apr 2025 13:25:28 +0200
Message-Id: <D9ETYGX6RS7R.1LLJX3WDZI4QY@buenzli.dev>
Cc: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 2/5] rust: Add bindings for reading device properties
From: "Remo Senekowitsch" <remo@buenzli.dev>
To: "Dirk Behme" <dirk.behme@de.bosch.com>, "Rob Herring" <robh@kernel.org>,
 "Saravana Kannan" <saravanak@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>
References: <20250326171411.590681-1-remo@buenzli.dev>
 <20250414152630.1691179-1-remo@buenzli.dev>
 <20250414152630.1691179-3-remo@buenzli.dev>
 <d179848e-63e1-4921-891e-455834f3733e@de.bosch.com>
In-Reply-To: <d179848e-63e1-4921-891e-455834f3733e@de.bosch.com>

Hi Dirk,

On Wed Apr 23, 2025 at 2:29 PM CEST, Dirk Behme wrote:
> Hi Remo,
>
> On 14/04/2025 17:26, Remo Senekowitsch wrote:
>> The device property API is a firmware agnostic API for reading
>> properties from firmware (DT/ACPI) devices nodes and swnodes.
>>=20
>> While the C API takes a pointer to a caller allocated variable/buffer,
>> the rust API is designed to return a value and can be used in struct
>> initialization. Rust generics are also utilized to support different
>> types of properties where appropriate.
>>=20
>> The PropertyGuard is a way to force users to specify whether a property
>> is supposed to be required or not. This allows us to move error
>> logging of missing required properties into core, preventing a lot of
>> boilerplate in drivers.
>>=20
>> Co-developed-by: Rob Herring (Arm) <robh@kernel.org>
>> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>> Signed-off-by: Remo Senekowitsch <remo@buenzli.dev>
>> ---
>>  rust/kernel/property.rs | 385 +++++++++++++++++++++++++++++++++++++++-
>>  1 file changed, 383 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/rust/kernel/property.rs b/rust/kernel/property.rs
>> index f6e6c980d..0d4ea3168 100644
>> --- a/rust/kernel/property.rs
>> +++ b/rust/kernel/property.rs
> ...
>> +    /// helper used to display name or path of a fwnode
>> +    ///
>> +    /// # Safety
>> +    ///
>> +    /// Callers must provide a valid format string for a fwnode.
>> +    unsafe fn fmt(&self, f: &mut core::fmt::Formatter<'_>, fmt_str: &CS=
tr) -> core::fmt::Result {
>> +        let mut buf =3D [0; 256];
>> +        // SAFETY: `buf` is valid and `buf.len()` is its length. `self.=
as_raw()` is
>> +        // valid because `self` is valid.
>> +        let written =3D unsafe {
>> +            bindings::scnprintf(buf.as_mut_ptr(), buf.len(), fmt_str.as=
_ptr(), self.as_raw())
>> +        };
>> +        // SAFETY: `written` is smaller or equal to `buf.len()`.
>> +        let b: &[u8] =3D unsafe { core::slice::from_raw_parts(buf.as_pt=
r(), written as usize) };
>> +        write!(f, "{}", BStr::from_bytes(b))
>> +    }
>> +
>> +    /// Returns an object that implements [`Display`](core::fmt::Displa=
y) for
>> +    /// printing the name of a node.
>> +    pub fn display_name(&self) -> impl core::fmt::Display + use<'_> {
>
>
> I don't know about the details but with rustc 1.81 [1] I'm getting [2].
> Just doing what is proposed seems to "fix" it:
>
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 3b1af034e902e..eadf7501d499b 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -26,6 +26,7 @@
>  #![feature(const_mut_refs)]
>  #![feature(const_ptr_write)]
>  #![feature(const_refs_to_cell)]
> +#![feature(precise_capturing)]
>
>  // Ensure conditional compilation based on the kernel configuration work=
s;
>  // otherwise we may silently break things like initcall handling.
>
> Just want to mention it because I think the minimal rustc version we
> have to support is 1.78.

Thanks for catching this! I'll make sure to compile with 1.78 from now
on. Luckily we don't need to activate an unstable feature, there is an
"older" capturing syntax that works here. (`'_` instead of `use<'_>`)

> Best regards
>
> Dirk
>
> P.S.: Many thanks for working on this! :)
>
> [1]
>
> $ rustc --version
> rustc 1.81.0 (eeb90cda1 2024-09-04)
>
> [2]
>
> error[E0658]: precise captures on `impl Trait` are experimental
>    --> rust/kernel/property.rs:256:61
>     |
> 256 |     pub fn display_name(&self) -> impl core::fmt::Display + use<'_>=
 {
>     |                                                             ^^^
>     |
>     =3D note: see issue #123432
> <https://github.com/rust-lang/rust/issues/123432> for more information
>     =3D help: add `#![feature(precise_capturing)]` to the crate attribute=
s
> to enable
>     =3D note: this compiler was built on 2024-09-04; consider upgrading i=
t
> if it is out of date
>
> error[E0658]: precise captures on `impl Trait` are experimental
>    --> rust/kernel/property.rs:271:61
>     |
> 271 |     pub fn display_path(&self) -> impl core::fmt::Display + use<'_>=
 {
>     |                                                             ^^^
>     |
>     =3D note: see issue #123432
> <https://github.com/rust-lang/rust/issues/123432> for more information
>     =3D help: add `#![feature(precise_capturing)]` to the crate attribute=
s
> to enable
>     =3D note: this compiler was built on 2024-09-04; consider upgrading i=
t
> if it is out of date
>
> error: aborting due to 2 previous errors

--
Best regards,
Remo
