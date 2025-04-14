Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35FEE1F4629;
	Mon, 14 Apr 2025 23:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744674953; cv=none; b=SAhW2YaWNyFHySxCh4jjcvvcRSeahQQDMWQjFzSoo8cMUTCWRIHwzqOeem6vjfCIr8qsM9k5Gsj5vCwpqS7ejTB3rU1KhUWvbjz3ghdW7zukI7C8VtTqEzHUu4str3CenU1IGYyOoycXqt93tz40L8swGoJ9+lxEBNARH0ap6xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744674953; c=relaxed/simple;
	bh=wKcPy6IRTS9YIbU0E85rCPpKCLuKQu/qae4l7CO2Js0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=GtGx8KfhGwtxFyLeMgGzfL5ekGL4M0DULU7YWcrpG3IULc9KryLTInma+gDjr1LS+V20K2L7f/M24wQIQ8DjMXAPv5CGNzdQ8M1tJ1FXsqXMyB74vMzxjNABXonfB/8hUJHp0JTT70VM299TSK23KIkDif3djW4ecZaN9ItEAsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev; spf=pass smtp.mailfrom=buenzli.dev; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buenzli.dev
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4Zc41G30fNz9twy;
	Tue, 15 Apr 2025 01:55:46 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 15 Apr 2025 01:55:42 +0200
Message-Id: <D96RNFS3N8L2.33MSG7T019UQM@buenzli.dev>
Subject: Re: [PATCH v2 2/5] rust: Add bindings for reading device properties
From: "Remo Senekowitsch" <remo@buenzli.dev>
To: "Danilo Krummrich" <dakr@kernel.org>
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
References: <20250326171411.590681-1-remo@buenzli.dev>
 <20250414152630.1691179-1-remo@buenzli.dev>
 <20250414152630.1691179-3-remo@buenzli.dev> <Z_1Jfs5DXD2vuzLj@cassiopeiae>
In-Reply-To: <Z_1Jfs5DXD2vuzLj@cassiopeiae>

On Mon Apr 14, 2025 at 7:44 PM CEST, Danilo Krummrich wrote:
> On Mon, Apr 14, 2025 at 05:26:27PM +0200, Remo Senekowitsch wrote:
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
>
> The patch adds a lot of thing, i.e.
>   * implement PropertyInt
>   * implement PropertyGuard
>   * extend FwNode by a lot of functions
>   * extend Device by some property functions
>
> I see that from v1 a lot of things have been squashed, likely because the=
re are
> a few circular dependencies. Is there really no reasonable way to break t=
his
> down a bit?

I was explicitly asked to do this in the previous thread[1]. I'm happy
to invest time into organizing files and commits exactly the way people
want, but squashing and splitting the same commits back and forth
between subsequent patch series is a waste of my time.

Do reviewers not typically read the review comments of others as well?
What can I do to avoid this situation and make progress instead of
running in circles?

Link: https://lore.kernel.org/rust-for-linux/20250326171411.590681-1-remo@b=
uenzli.dev/T/#m68b99b283a2e62726ee039bb2394d0741b31e330 [1]

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
>
> Why do we need this? Can't we use write! right away?

I don't know how, can you be more specific? I'm not too familiar with
how these formatting specifiers work under the hood, but on the face of
it, Rust and C seem very different.

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
>> +        struct FwNodeDisplayName<'a>(&'a FwNode);
>> +
>> +        impl core::fmt::Display for FwNodeDisplayName<'_> {
>> +            fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fm=
t::Result {
>> +                // SAFETY: "%pfwP" is a valid format string for fwnode
>> +                unsafe { self.0.fmt(f, c_str!("%pfwP")) }
>> +            }
>> +        }
>> +
>> +        FwNodeDisplayName(self)
>> +    }
>> +
>> +    /// Returns an object that implements [`Display`](core::fmt::Displa=
y) for
>> +    /// printing the full path of a node.
>> +    pub fn display_path(&self) -> impl core::fmt::Display + use<'_> {
>> +        struct FwNodeDisplayPath<'a>(&'a FwNode);
>> +
>> +        impl core::fmt::Display for FwNodeDisplayPath<'_> {
>> +            fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fm=
t::Result {
>> +                // SAFETY: "%pfwf" is a valid format string for fwnode
>> +                unsafe { self.0.fmt(f, c_str!("%pfwf")) }
>> +            }
>> +        }
>> +
>> +        FwNodeDisplayPath(self)
>> +    }
>>  }
>> =20
>>  // SAFETY: Instances of `FwNode` are always reference-counted.
>> @@ -73,3 +257,200 @@ unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
>>          unsafe { bindings::fwnode_handle_put(obj.cast().as_ptr()) }
>>      }
>>  }
>> +
>> +/// Implemented for several types that can be read as properties.
>> +///
>> +/// Informally, this is implemented for strings, integers and arrays of
>> +/// integers. It's used to make [`FwNode::property_read`] generic over =
the
>> +/// type of property being read. There are also two dedicated methods t=
o read
>> +/// other types, because they require more specialized function signatu=
res:
>> +/// - [`property_read_bool`](Device::property_read_bool)
>> +/// - [`property_read_array_vec`](Device::property_read_array_vec)
>> +pub trait Property: Sized {
>> +    /// Used to make [`FwNode::property_read`] generic.
>> +    fn read(fwnode: &FwNode, name: &CStr) -> Result<Self>;
>> +}
>> +
>> +impl Property for CString {
>> +    fn read(fwnode: &FwNode, name: &CStr) -> Result<Self> {
>> +        let mut str: *mut u8 =3D ptr::null_mut();
>> +        let pstr: *mut _ =3D &mut str;
>> +
>> +        // SAFETY: `name` is non-null and null-terminated. `fwnode.as_r=
aw` is
>> +        // valid because `fwnode` is valid.
>> +        let ret =3D unsafe {
>> +            bindings::fwnode_property_read_string(fwnode.as_raw(), name=
.as_char_ptr(), pstr.cast())
>> +        };
>> +        to_result(ret)?;
>> +
>> +        // SAFETY: `pstr` contains a non-null ptr on success
>> +        let str =3D unsafe { CStr::from_char_ptr(*pstr) };
>> +        Ok(str.try_into()?)
>> +    }
>> +}
>
> I think it would be pretty weird to have a function CString::read() that =
takes a
> FwNode argument, no? Same for all the other types below.
>
> I assume you do this for
>
> 	pub fn property_read<'fwnode, 'name, T: Property>(
> 	   &'fwnode self,
> 	   name: &'name CStr,
> 	)
>
> but given that you have to do the separate impls anyways, is there so muc=
h value
> having the generic variant? You could still generate all the
> property_read_{int}() variants with a macro.
>
> If you really want a generic property_read(), I think you should create n=
ew
> types instead and implement the Property trait for them instead.

Yeah, that would be workable. On the other hand, it's not unusual in
Rust to implement traits on foreign types, right? If the problem is
the non-descriptive name "read" then we can change it to something more
verbose. Maybe `CStr::read_from_fwnode_property` or something. It's not
meant to be used directly, a verbose name wouldn't cause any damage.

I think making the function generic can be nice to work with, especially
if type inference is working. But I'm fine with either.
