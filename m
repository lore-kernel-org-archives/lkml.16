Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBAA22A7FF;
	Mon, 19 May 2025 15:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747669407; cv=none; b=I41k6J2YfEq42KmUDarl59i/KTGf/u5POH/N6ZscGv31SZLpAXMhIOZMeSqE3JHoXtGspd08Vpo4EMYHpARLu5l+Sh4rtNgz0f6lZsxk++bbwbGhesUqf51IvSe0q8Xk4nyqL6oSeoAy+LUEOkeNfvbqPnnNEuryZbnImSX0gkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747669407; c=relaxed/simple;
	bh=p5928QSFsda2kyYixsE46n79NEDGlaX9y6Xh4Lt2g00=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=B5FJcIe0LYy4ywadS6zlFSwqVIT4YGKquGsW2SRHH5WsqATq/I5q50/woM82CyFMAb5UTddI/0l4ZCKiOJfxY3xyM/DnWCod0KZsN4eFsG4eJ4RUxtm6tH7E+2l2wdc2ZRSXlznitrQrK1iHQNt4RGsgLw91iCV31YGJkkhiuDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev; spf=pass smtp.mailfrom=buenzli.dev; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buenzli.dev
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4b1MQx5Rbjz9syt;
	Mon, 19 May 2025 17:43:21 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 May 2025 17:43:17 +0200
Message-Id: <DA093HA2415H.29OCPLS0M7H84@buenzli.dev>
Cc: "Rob Herring" <robh@kernel.org>, "Saravana Kannan"
 <saravanak@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Dirk Behme" <dirk.behme@de.bosch.com>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v4 6/9] rust: device: Add bindings for reading device
 properties
From: "Remo Senekowitsch" <remo@buenzli.dev>
To: "Danilo Krummrich" <dakr@kernel.org>
References: <20250504173154.488519-1-remo@buenzli.dev>
 <20250504173154.488519-7-remo@buenzli.dev> <aCH5WgORn9ZGl9Il@pollux>
In-Reply-To: <aCH5WgORn9ZGl9Il@pollux>

On Mon May 12, 2025 at 3:36 PM CEST, Danilo Krummrich wrote:
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
>
> I think you have additional requirements on the fwnode, propname and val
> pointers as well as on nval, please document them as well.

What are the additional requirements? The implementation just calls the
underlying `fwnode_property_read_*_array` with the exact same arguments,
so I don't know what the additional requirements are.

>> +    unsafe fn read_array_from_fwnode_property(
>> +        fwnode: *const bindings::fwnode_handle,
>> +        propname: *const ffi::c_char,
>> +        val: *mut Self,
>> +        nval: usize,
>> +    ) -> ffi::c_int;
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
