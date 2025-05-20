Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E155726A0F6;
	Tue, 20 May 2025 10:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747737142; cv=none; b=iRozr56YYV+te4X8c8j8N9JnSkoRnlFmdLdwG+AUksQ80MZC2tNnhzXLKK1ogIx2QPPeWce8hFcjyTXO9yci2EHakUI4o0glAUomDBPkf2pnNP83yLnALSf2Xc/DypUIXMWEJhFWgAUyaQ2VEWVPbT/HumlGEigTT3eWuMmqY/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747737142; c=relaxed/simple;
	bh=Pq1ftI00kBkDlSWEq6rlyruRH9SImrSn0nEiC5X6xTo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=GIHd8cfuexkIw7A7Z7n1Yj9CzyDawWIBWfmkk2TQ8+LYjDLlLQjrLEbr9oTf+p/RvwlmxJZEs9NGbYsPgNMJFlgCq5OCm7RMRBoYIPVdUfPRjIG0FArJ2ZVZ9aFKehAfPPI2XWYwKkHNVjhBPDrt3MwvPiEACnPMN+phJ/N37eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev; spf=pass smtp.mailfrom=buenzli.dev; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buenzli.dev
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4b1rTR5QMzz9sNt;
	Tue, 20 May 2025 12:32:11 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 May 2025 12:32:05 +0200
Message-Id: <DA0X3RE11LJI.3GDSU2DK09HQ0@buenzli.dev>
Cc: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v4 6/9] rust: device: Add bindings for reading device
 properties
From: "Remo Senekowitsch" <remo@buenzli.dev>
To: "Benno Lossin" <lossin@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Saravana Kannan" <saravanak@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Dirk Behme" <dirk.behme@de.bosch.com>
References: <20250504173154.488519-1-remo@buenzli.dev>
 <20250504173154.488519-7-remo@buenzli.dev>
 <DA0TDQ2DPTRX.1T9O4NZEME2JX@kernel.org>
In-Reply-To: <DA0TDQ2DPTRX.1T9O4NZEME2JX@kernel.org>

On Tue May 20, 2025 at 9:37 AM CEST, Benno Lossin wrote:
> On Sun May 4, 2025 at 7:31 PM CEST, Remo Senekowitsch wrote:
>> +/// Implemented for all integers that can be read as properties.
>> +///
>> +/// This helper trait is needed on top of the existing [`Property`]
>> +/// trait to associate the integer types of various sizes with their
>> +/// corresponding `fwnode_property_read_*_array` functions.
>> +pub trait PropertyInt: Copy {
>> +    /// # Safety
>> +    ///
>> +    /// Callers must uphold the same safety invariants as for the vario=
us
>> +    /// `fwnode_property_read_*_array` functions.
>> +    unsafe fn read_array_from_fwnode_property(
>> +        fwnode: *const bindings::fwnode_handle,
>> +        propname: *const ffi::c_char,
>> +        val: *mut Self,
>> +        nval: usize,
>> +    ) -> ffi::c_int;
>
> I really, really dislike that this trait has to have an unsafe function
> with all those raw pointer inputs.

What is the concrete problem with that? Or is it just "not pretty"?
(I'm fine with making it prettier, just making sure I understand
correctly.)

>> +}
>> +// This macro generates implementations of the traits `Property` and
>> +// `PropertyInt` for integers of various sizes. Its input is a list
>> +// of pairs separated by commas. The first element of the pair is the
>> +// type of the integer, the second one is the name of its corresponding
>> +// `fwnode_property_read_*_array` function.
>> +macro_rules! impl_property_for_int {
>> +    ($($int:ty: $f:ident),* $(,)?) =3D> { $(
>> +        impl PropertyInt for $int {
>> +            unsafe fn read_array_from_fwnode_property(
>> +                fwnode: *const bindings::fwnode_handle,
>> +                propname: *const ffi::c_char,
>> +                val: *mut Self,
>> +                nval: usize,
>> +            ) -> ffi::c_int {
>> +                // SAFETY: The safety invariants on the trait require
>> +                // callers to uphold the invariants of the functions
>> +                // this macro is called with.
>> +                unsafe {
>> +                    bindings::$f(fwnode, propname, val.cast(), nval)
>> +                }
>> +            }
>> +        }
>> +    )* };
>> +}
>> +impl_property_for_int! {
>> +    u8: fwnode_property_read_u8_array,
>> +    u16: fwnode_property_read_u16_array,
>> +    u32: fwnode_property_read_u32_array,
>> +    u64: fwnode_property_read_u64_array,
>> +    i8: fwnode_property_read_u8_array,
>> +    i16: fwnode_property_read_u16_array,
>> +    i32: fwnode_property_read_u32_array,
>> +    i64: fwnode_property_read_u64_array,
>> +}
>> +/// # Safety
>> +///
>> +/// Callers must ensure that if `len` is non-zero, `out_param` must be
>> +/// valid and point to memory that has enough space to hold at least
>> +/// `len` number of elements.
>> +unsafe fn read_array_out_param<T: PropertyInt>(
>> +    fwnode: &FwNode,
>> +    name: &CStr,
>> +    out_param: *mut T,
>> +    len: usize,
>> +) -> ffi::c_int {
>> +    // SAFETY: `name` is non-null and null-terminated.
>> +    // `fwnode.as_raw` is valid because `fwnode` is valid.
>> +    // `out_param` is valid and has enough space for at least
>> +    // `len` number of elements as per the safety requirement.
>> +    unsafe {
>> +        T::read_array_from_fwnode_property(fwnode.as_raw(), name.as_cha=
r_ptr(), out_param, len)
>> +    }
>> +}
>
> Why does this function exist? It doesn't do anything and just delegates
> the call to `T::read_array_from_fwnode_property`.

It's used in three places. Taking Rust references as input reduces the
safety requirements the callers must uphold. But I guess it's a small
benefit, I can remove it.

> This feels like you're dragging the C interface through the lower layers
> of your Rust abstractions, which I wouldn't do. I also looked a bit at
> the C code and saw this comment in `driver/base/property.c:324`:
>
>      * It's recommended to call fwnode_property_count_u8() instead of cal=
ling
>      * this function with @val equals %NULL and @nval equals 0.
>
> That probably holds also for the other functions, so maybe we should do
> that instead? (although `fwnode_property_count_u8` just delegates and
> calls with `fwnode_property_read_u8_array`...)

Yeah, I saw that too. The original implementation is from Rob. I assume
the recommendation is for users, maybe for clarity and readability of
the code. These Rust abstractions are pretty low level, so I thought
it's probably fine.

> How about we do it like this:
>
>     pub trait PropertyInt: Copy + Sized + private::Sealed {
>         /// ...
>         ///
>         /// Returns a reference to `out` containing all written elements.
>         fn read<'a>(
>             fwnode: &FwNode,
>             name: &CStr,
>             out: &'a mut [MaybeUninit<Self>],
>         ) -> Result<&'a mut [Self]>;
>
>         fn length(fwnode: &FwNode, name: &CStr) -> Result<usize>;
>     }
>
> And then have a macro to implement it on all the integers.

I think I tried to make the macro as small as possible and use regular
generics on top, because I was concerned people would be put off by big
complicated macros. I'm fine with moving the actual trait implementation
into the macro body, seems reasonable.

But still, I'm not sure why we're trying to make the PropertyInt trait's
interface pretty or rusty. It's not supposed to be used, implemented or
in any way interacted with outside this module. It's just a low-level
building block to make some functions generic, giving users type
inference.

Best regards,
Remo
