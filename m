Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD491EB5DA;
	Tue, 20 May 2025 11:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747739048; cv=none; b=VtgXBcXir0xEuHr9OBv0yxCOSHWAY7MZR9P1lq7f4r5CDlbcgLUMzXlucgXs7HXyI1ZjoJw7hnB2SQz2HvAXUQ8mnKs515kjxkzBfluXdBYP5YkrSGKdCJlO6KvIQXgLWbMbA/J/lz+zPp0CdPMhLNa+68s5W9QyFzY9cIHOSp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747739048; c=relaxed/simple;
	bh=ZyVcfvjxM1I6n4gKTauGERvGlWcYkNltfm3/b8t60DI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ATyKnSdcJmLZWyj8t/QDyF+sHQz5V3M7N7qNXpqoEVSsfPaViyCbFj2Z6TEwKIfacrNP3dUaT4Ha0OYauH+o9dRbyKdjCgOew+d7SM67DyPBZfAXdRPHR6uww2acb+ko7hccHtng3odj1Tc/nW6HCv1BUgd4bGqVcUK8TgLgpA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oG8Rhfsh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oG8Rhfsh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FFA5C4CEE9;
	Tue, 20 May 2025 11:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747739047;
	bh=ZyVcfvjxM1I6n4gKTauGERvGlWcYkNltfm3/b8t60DI=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=oG8RhfshlxAEDRpznA+7GButlNZ5JPtKTzRUJ74HT7/aOrIXekTh/AZBNZmllkwxk
	 P4sttLFH6PGY8/FPn8G6ksKgEHX/9Bzzxv2IFns5EQVMgIH/PVgJHs3zKyw9RoFXIW
	 fK/3ht0yaRPf0ps3rqPBku0qLCtrfxxsNO97nhmUkooW31o/Bj+hInAFL2+FRY6A9s
	 Bch/019eBHjwaI3ObaMnS8xizxrAdqbz8bq9KD7oNR3bPWYC+fUtuzi9ZWzvk4Z2xw
	 xNoWh4DX23aJTQBc/+DPW2pze+hjQNU4pJ0PqF6okAKyzXC3fEOdZVjHwodyZ+oK++
	 7xvUq1aM80T7w==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 May 2025 13:04:01 +0200
Message-Id: <DA0XS7JK5B71.3D2CS7QVKOM52@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v4 6/9] rust: device: Add bindings for reading device
 properties
From: "Benno Lossin" <lossin@kernel.org>
To: "Remo Senekowitsch" <remo@buenzli.dev>, "Rob Herring" <robh@kernel.org>,
 "Saravana Kannan" <saravanak@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Dirk Behme" <dirk.behme@de.bosch.com>
X-Mailer: aerc 0.20.1
References: <20250504173154.488519-1-remo@buenzli.dev>
 <20250504173154.488519-7-remo@buenzli.dev>
 <DA0TDQ2DPTRX.1T9O4NZEME2JX@kernel.org>
 <DA0X3RE11LJI.3GDSU2DK09HQ0@buenzli.dev>
In-Reply-To: <DA0X3RE11LJI.3GDSU2DK09HQ0@buenzli.dev>

On Tue May 20, 2025 at 12:32 PM CEST, Remo Senekowitsch wrote:
> On Tue May 20, 2025 at 9:37 AM CEST, Benno Lossin wrote:
>> On Sun May 4, 2025 at 7:31 PM CEST, Remo Senekowitsch wrote:
>>> +/// Implemented for all integers that can be read as properties.
>>> +///
>>> +/// This helper trait is needed on top of the existing [`Property`]
>>> +/// trait to associate the integer types of various sizes with their
>>> +/// corresponding `fwnode_property_read_*_array` functions.
>>> +pub trait PropertyInt: Copy {
>>> +    /// # Safety
>>> +    ///
>>> +    /// Callers must uphold the same safety invariants as for the vari=
ous
>>> +    /// `fwnode_property_read_*_array` functions.
>>> +    unsafe fn read_array_from_fwnode_property(
>>> +        fwnode: *const bindings::fwnode_handle,
>>> +        propname: *const ffi::c_char,
>>> +        val: *mut Self,
>>> +        nval: usize,
>>> +    ) -> ffi::c_int;
>>
>> I really, really dislike that this trait has to have an unsafe function
>> with all those raw pointer inputs.
>
> What is the concrete problem with that? Or is it just "not pretty"?
> (I'm fine with making it prettier, just making sure I understand
> correctly.)

With the design I explained below, this becomes not necessary. Less
unsafe code always is better, since there are fewer places that can go
wrong.

Also hiding all the unsafe code inside of your module as private code or
implementation detail is also much better, as you prevent people from
accidentally using it.

>>> +}
>>> +// This macro generates implementations of the traits `Property` and
>>> +// `PropertyInt` for integers of various sizes. Its input is a list
>>> +// of pairs separated by commas. The first element of the pair is the
>>> +// type of the integer, the second one is the name of its correspondin=
g
>>> +// `fwnode_property_read_*_array` function.
>>> +macro_rules! impl_property_for_int {
>>> +    ($($int:ty: $f:ident),* $(,)?) =3D> { $(
>>> +        impl PropertyInt for $int {
>>> +            unsafe fn read_array_from_fwnode_property(
>>> +                fwnode: *const bindings::fwnode_handle,
>>> +                propname: *const ffi::c_char,
>>> +                val: *mut Self,
>>> +                nval: usize,
>>> +            ) -> ffi::c_int {
>>> +                // SAFETY: The safety invariants on the trait require
>>> +                // callers to uphold the invariants of the functions
>>> +                // this macro is called with.
>>> +                unsafe {
>>> +                    bindings::$f(fwnode, propname, val.cast(), nval)
>>> +                }
>>> +            }
>>> +        }
>>> +    )* };
>>> +}
>>> +impl_property_for_int! {
>>> +    u8: fwnode_property_read_u8_array,
>>> +    u16: fwnode_property_read_u16_array,
>>> +    u32: fwnode_property_read_u32_array,
>>> +    u64: fwnode_property_read_u64_array,
>>> +    i8: fwnode_property_read_u8_array,
>>> +    i16: fwnode_property_read_u16_array,
>>> +    i32: fwnode_property_read_u32_array,
>>> +    i64: fwnode_property_read_u64_array,
>>> +}
>>> +/// # Safety
>>> +///
>>> +/// Callers must ensure that if `len` is non-zero, `out_param` must be
>>> +/// valid and point to memory that has enough space to hold at least
>>> +/// `len` number of elements.
>>> +unsafe fn read_array_out_param<T: PropertyInt>(
>>> +    fwnode: &FwNode,
>>> +    name: &CStr,
>>> +    out_param: *mut T,
>>> +    len: usize,
>>> +) -> ffi::c_int {
>>> +    // SAFETY: `name` is non-null and null-terminated.
>>> +    // `fwnode.as_raw` is valid because `fwnode` is valid.
>>> +    // `out_param` is valid and has enough space for at least
>>> +    // `len` number of elements as per the safety requirement.
>>> +    unsafe {
>>> +        T::read_array_from_fwnode_property(fwnode.as_raw(), name.as_ch=
ar_ptr(), out_param, len)
>>> +    }
>>> +}
>>
>> Why does this function exist? It doesn't do anything and just delegates
>> the call to `T::read_array_from_fwnode_property`.
>
> It's used in three places. Taking Rust references as input reduces the
> safety requirements the callers must uphold. But I guess it's a small
> benefit, I can remove it.

That's true, but why not make the trait take references if all users
will use references anyways :)

>> This feels like you're dragging the C interface through the lower layers
>> of your Rust abstractions, which I wouldn't do. I also looked a bit at
>> the C code and saw this comment in `driver/base/property.c:324`:
>>
>>      * It's recommended to call fwnode_property_count_u8() instead of ca=
lling
>>      * this function with @val equals %NULL and @nval equals 0.
>>
>> That probably holds also for the other functions, so maybe we should do
>> that instead? (although `fwnode_property_count_u8` just delegates and
>> calls with `fwnode_property_read_u8_array`...)
>
> Yeah, I saw that too. The original implementation is from Rob. I assume
> the recommendation is for users, maybe for clarity and readability of
> the code. These Rust abstractions are pretty low level, so I thought
> it's probably fine.

Yeah it's probably fine.

>> How about we do it like this:
>>
>>     pub trait PropertyInt: Copy + Sized + private::Sealed {
>>         /// ...
>>         ///
>>         /// Returns a reference to `out` containing all written elements=
.
>>         fn read<'a>(
>>             fwnode: &FwNode,
>>             name: &CStr,
>>             out: &'a mut [MaybeUninit<Self>],
>>         ) -> Result<&'a mut [Self]>;
>>
>>         fn length(fwnode: &FwNode, name: &CStr) -> Result<usize>;
>>     }
>>
>> And then have a macro to implement it on all the integers.
>
> I think I tried to make the macro as small as possible and use regular
> generics on top, because I was concerned people would be put off by big
> complicated macros. I'm fine with moving the actual trait implementation
> into the macro body, seems reasonable.

Big macro bodies are rarely the issue. Lots of parsing in declarative
macros is where they become unreadable.

> But still, I'm not sure why we're trying to make the PropertyInt trait's
> interface pretty or rusty. It's not supposed to be used, implemented or
> in any way interacted with outside this module. It's just a low-level
> building block to make some functions generic, giving users type
> inference.

Sure, but if we can make it safe, we should. I could also very much
imagine that someone has a statically allocated buffer they would want
to write stuff to and this function would then allow that with much
easier `unsafe` code than the current approach.

---
Cheers,
Benno
