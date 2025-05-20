Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F334125D1E9;
	Tue, 20 May 2025 07:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747726628; cv=none; b=WaqiCRIEJqJT/G/dwRpO4sqpiTsxfrEeas0HrW2lCvFOTAPh2S6fOVh25JeyhLny0vhCLqnaCR4g7DEBqpo+axZedMKQG2Vd4BD6i1F6Q0jcOYDNKVEge8nPNywXbEJaG2OEfr5MM7k1mi4CkwWrzTgNwHi9OaDHVIm52dsBgTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747726628; c=relaxed/simple;
	bh=iNcssbjCZ/UwnL4YOxN7u6TKJDP+99vw9pPw/9N1zSo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=BH+7uRb3VjaPHCIfy80+v7wI3miXLQtLEWRu6WR/asRBqsDEM8m/6PYVc2srpM5aabFks+Blenbndw6vvS4THs22aOzyr6/33BL30VoEQNbYsx5x/IHge3Cis1a0GScS9MzNL+7lwKYsMI1m/2khEKYVuQBRd+M9Vv9x57JRNq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kBS1Y7x7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kBS1Y7x7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAD5EC4CEEB;
	Tue, 20 May 2025 07:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747726627;
	bh=iNcssbjCZ/UwnL4YOxN7u6TKJDP+99vw9pPw/9N1zSo=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=kBS1Y7x7EIouekNMvvPWdWhCFjOB8g7o3K+senMOA8FeaSschMBy6dRdSJ3QLVywi
	 2iXEoIxTCaf44VhVV0zSggLmhtELttbSKF6RlVU6kiuRWHweVkInTBmEtJ5pggeOdB
	 vStKadVrVEvBlLY1mXfvEKASI90NEeE11e1ey6IWH0LMOeZJyczm6ZdwzFiblDZonX
	 o2pphL3p8w9cz7ehvp/pBRUMgXJ+oHbjzora173BeODrsigzCzN7yCjApI6c/ZCpzD
	 ItOBA3F6FsHRQDJgw0kfES/ipRuLuJzwnvuMX5/XIHYmX5FOvbsUOdV4MVfofhzEcN
	 ITu59XfpyTeQA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 May 2025 09:37:02 +0200
Message-Id: <DA0TDQ2DPTRX.1T9O4NZEME2JX@kernel.org>
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
In-Reply-To: <20250504173154.488519-7-remo@buenzli.dev>

On Sun May 4, 2025 at 7:31 PM CEST, Remo Senekowitsch wrote:
> +/// Implemented for all integers that can be read as properties.
> +///
> +/// This helper trait is needed on top of the existing [`Property`]
> +/// trait to associate the integer types of various sizes with their
> +/// corresponding `fwnode_property_read_*_array` functions.
> +pub trait PropertyInt: Copy {
> +    /// # Safety
> +    ///
> +    /// Callers must uphold the same safety invariants as for the variou=
s
> +    /// `fwnode_property_read_*_array` functions.
> +    unsafe fn read_array_from_fwnode_property(
> +        fwnode: *const bindings::fwnode_handle,
> +        propname: *const ffi::c_char,
> +        val: *mut Self,
> +        nval: usize,
> +    ) -> ffi::c_int;

I really, really dislike that this trait has to have an unsafe function
with all those raw pointer inputs.

> +}
> +// This macro generates implementations of the traits `Property` and
> +// `PropertyInt` for integers of various sizes. Its input is a list
> +// of pairs separated by commas. The first element of the pair is the
> +// type of the integer, the second one is the name of its corresponding
> +// `fwnode_property_read_*_array` function.
> +macro_rules! impl_property_for_int {
> +    ($($int:ty: $f:ident),* $(,)?) =3D> { $(
> +        impl PropertyInt for $int {
> +            unsafe fn read_array_from_fwnode_property(
> +                fwnode: *const bindings::fwnode_handle,
> +                propname: *const ffi::c_char,
> +                val: *mut Self,
> +                nval: usize,
> +            ) -> ffi::c_int {
> +                // SAFETY: The safety invariants on the trait require
> +                // callers to uphold the invariants of the functions
> +                // this macro is called with.
> +                unsafe {
> +                    bindings::$f(fwnode, propname, val.cast(), nval)
> +                }
> +            }
> +        }
> +    )* };
> +}
> +impl_property_for_int! {
> +    u8: fwnode_property_read_u8_array,
> +    u16: fwnode_property_read_u16_array,
> +    u32: fwnode_property_read_u32_array,
> +    u64: fwnode_property_read_u64_array,
> +    i8: fwnode_property_read_u8_array,
> +    i16: fwnode_property_read_u16_array,
> +    i32: fwnode_property_read_u32_array,
> +    i64: fwnode_property_read_u64_array,
> +}
> +/// # Safety
> +///
> +/// Callers must ensure that if `len` is non-zero, `out_param` must be
> +/// valid and point to memory that has enough space to hold at least
> +/// `len` number of elements.
> +unsafe fn read_array_out_param<T: PropertyInt>(
> +    fwnode: &FwNode,
> +    name: &CStr,
> +    out_param: *mut T,
> +    len: usize,
> +) -> ffi::c_int {
> +    // SAFETY: `name` is non-null and null-terminated.
> +    // `fwnode.as_raw` is valid because `fwnode` is valid.
> +    // `out_param` is valid and has enough space for at least
> +    // `len` number of elements as per the safety requirement.
> +    unsafe {
> +        T::read_array_from_fwnode_property(fwnode.as_raw(), name.as_char=
_ptr(), out_param, len)
> +    }
> +}

Why does this function exist? It doesn't do anything and just delegates
the call to `T::read_array_from_fwnode_property`.

This feels like you're dragging the C interface through the lower layers
of your Rust abstractions, which I wouldn't do. I also looked a bit at
the C code and saw this comment in `driver/base/property.c:324`:

     * It's recommended to call fwnode_property_count_u8() instead of calli=
ng
     * this function with @val equals %NULL and @nval equals 0.

That probably holds also for the other functions, so maybe we should do
that instead? (although `fwnode_property_count_u8` just delegates and
calls with `fwnode_property_read_u8_array`...)

How about we do it like this:

    pub trait PropertyInt: Copy + Sized + private::Sealed {
        /// ...
        ///
        /// Returns a reference to `out` containing all written elements.
        fn read<'a>(
            fwnode: &FwNode,
            name: &CStr,
            out: &'a mut [MaybeUninit<Self>],
        ) -> Result<&'a mut [Self]>;
   =20
        fn length(fwnode: &FwNode, name: &CStr) -> Result<usize>;
    }

And then have a macro to implement it on all the integers.

Hope this helps!

---
Cheers,
Benno
