Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D3720C03F;
	Tue, 22 Apr 2025 10:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745317757; cv=none; b=Vs3gDoOsYGk7dWwqBJZHpF7BvtZx05gXUFDJbmFtQG8rn9ylyuEwQHKL6q0KxV8fskZYKeBwRVMc7x+m5uvc/+1X99m84co92zLlVBFplZ5lPfBKtGCnTBpRkFb6aRZznVFLE+oZMa9dJm6cOFHmRFaAq3XoBB1GNsL9+ny1Ak0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745317757; c=relaxed/simple;
	bh=OFAd4pLJeK+Mq0F7F6qfF5355bPoI9VG3dxk3BPrGhs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W+K0URPTE4Cd3J91675KF8qILwEsP4J11RNkF4q/n4wVNHhg6Dfwk/GhouVb6uVcuCkW5eUeu9xiYKMoM9dAsIg/n/15qy7G4HrLzBN7Mb9LOQ/ta1+A+6XsNsbwQmMwjlyA4uXhb6n4gXd0SzlZHRsaMmghBDi59tzG8ILVSuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IzMcnO7/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IzMcnO7/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AFF9C4CEEA;
	Tue, 22 Apr 2025 10:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745317757;
	bh=OFAd4pLJeK+Mq0F7F6qfF5355bPoI9VG3dxk3BPrGhs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IzMcnO7/hnMIUrVPk0IUzgI/Vkz11j+5SMzE8iDicQSN9D7ciAKD9+epS1JmSauW5
	 La4vinMdGWPRqy9r2Ghd+I7rnoEeqBqo0SX5VnqKlld3jHSwdQ90MbrdHXmXC3XWwr
	 IQJi+JYwOD4NgxoU0kG0c+t0dFcLNN9bDt9oLLRk5AwlCnxrfasXaux6gp4ct8O0LI
	 h86c5lie0vVAH42fPij467wL1CsUVOesDGRcVf5HV0xESP08o4fcVoLcDb2+5lvlH+
	 OCwRhCQO1+E8KQz4Qvbd7ffw6nSVpwjs2XU0HhLLy5Iys9MX0ihLboTp8YBFnf7N1O
	 9AuMsJGmHb0nA==
Date: Tue, 22 Apr 2025 12:29:09 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>,
	John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 06/16] gpu: nova-core: define registers layout using
 helper macro
Message-ID: <aAdvdczmQYBAS7vs@cassiopeiae>
References: <20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com>
 <20250420-nova-frts-v1-6-ecd1cca23963@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250420-nova-frts-v1-6-ecd1cca23963@nvidia.com>

On Sun, Apr 20, 2025 at 09:19:38PM +0900, Alexandre Courbot wrote:
> Add the register!() macro, which defines a given register's layout and
> provide bit-field accessors with a way to convert them to a given type.
> This macro will allow us to make clear definitions of the registers and
> manipulate their fields safely.
> 
> The long-term goal is to eventually move it to the kernel crate so it
> can be used my other drivers as well, but it was agreed to first land it
> into nova-core and make it mature there.
> 
> To illustrate its usage, use it to define the layout for the Boot0
> register and use its accessors through the use of the convenience
> with_bar!() macro, which uses Revocable::try_access() and converts its

s/try_access/try_access_with/

> returned Option into the proper error as needed.

Using try_access_with() / with_bar! should be a separate patch.

> diff --git a/Documentation/gpu/nova/core/todo.rst b/Documentation/gpu/nova/core/todo.rst
> index 234d753d3eacc709b928b1ccbfc9750ef36ec4ed..8a459fc088121f770bfcda5dfb4ef51c712793ce 100644
> --- a/Documentation/gpu/nova/core/todo.rst
> +++ b/Documentation/gpu/nova/core/todo.rst
> @@ -102,7 +102,13 @@ Usage:
>  	let boot0 = Boot0::read(&bar);
>  	pr_info!("Revision: {}\n", boot0.revision());
>  
> +Note: a work-in-progress implementation currently resides in
> +`drivers/gpu/nova-core/regs/macros.rs` and is used in nova-core. It would be
> +nice to improve it (possibly using proc macros) and move it to the `kernel`
> +crate so it can be used by other components as well.
> +
>  | Complexity: Advanced
> +| Contact: Alexandre Courbot

This is good -- thanks for adding it.

> diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
> index b1a25b86ef17a6710e6236d5e7f1f26cd4407ce3..e315a3011660df7f18c0a3e0582b5845545b36e2 100644
> --- a/drivers/gpu/nova-core/regs.rs
> +++ b/drivers/gpu/nova-core/regs.rs
> @@ -1,55 +1,15 @@
>  // SPDX-License-Identifier: GPL-2.0
>  
> -use crate::driver::Bar0;
> +use core::ops::Deref;
> +use kernel::io::Io;
>  
> -// TODO
> -//
> -// Create register definitions via generic macros. See task "Generic register
> -// abstraction" in Documentation/gpu/nova/core/todo.rst.
> +#[macro_use]
> +mod macros;
>  
> -const BOOT0_OFFSET: usize = 0x00000000;
> +use crate::gpu::Chipset;
>  
> -// 3:0 - chipset minor revision
> -const BOOT0_MINOR_REV_SHIFT: u8 = 0;
> -const BOOT0_MINOR_REV_MASK: u32 = 0x0000000f;
> -
> -// 7:4 - chipset major revision
> -const BOOT0_MAJOR_REV_SHIFT: u8 = 4;
> -const BOOT0_MAJOR_REV_MASK: u32 = 0x000000f0;
> -
> -// 23:20 - chipset implementation Identifier (depends on architecture)
> -const BOOT0_IMPL_SHIFT: u8 = 20;
> -const BOOT0_IMPL_MASK: u32 = 0x00f00000;
> -
> -// 28:24 - chipset architecture identifier
> -const BOOT0_ARCH_MASK: u32 = 0x1f000000;
> -
> -// 28:20 - chipset identifier (virtual register field combining BOOT0_IMPL and
> -//         BOOT0_ARCH)
> -const BOOT0_CHIPSET_SHIFT: u8 = BOOT0_IMPL_SHIFT;
> -const BOOT0_CHIPSET_MASK: u32 = BOOT0_IMPL_MASK | BOOT0_ARCH_MASK;
> -
> -#[derive(Copy, Clone)]
> -pub(crate) struct Boot0(u32);
> -
> -impl Boot0 {
> -    #[inline]
> -    pub(crate) fn read(bar: &Bar0) -> Self {
> -        Self(bar.read32(BOOT0_OFFSET))
> -    }
> -
> -    #[inline]
> -    pub(crate) fn chipset(&self) -> u32 {
> -        (self.0 & BOOT0_CHIPSET_MASK) >> BOOT0_CHIPSET_SHIFT
> -    }
> -
> -    #[inline]
> -    pub(crate) fn minor_rev(&self) -> u8 {
> -        ((self.0 & BOOT0_MINOR_REV_MASK) >> BOOT0_MINOR_REV_SHIFT) as u8
> -    }
> -
> -    #[inline]
> -    pub(crate) fn major_rev(&self) -> u8 {
> -        ((self.0 & BOOT0_MAJOR_REV_MASK) >> BOOT0_MAJOR_REV_SHIFT) as u8
> -    }
> -}
> +register!(Boot0@0x00000000, "Basic revision information about the GPU";
> +    3:0     minor_rev => as u8, "minor revision of the chip";
> +    7:4     major_rev => as u8, "major revision of the chip";
> +    28:20   chipset => try_into Chipset, "chipset model"

Should we preserve the information that this is the combination of two register
fields?

> +);
> diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..fa9bd6b932048113de997658b112885666e694c9
> --- /dev/null
> +++ b/drivers/gpu/nova-core/regs/macros.rs
> @@ -0,0 +1,297 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Types and macros to define register layout and accessors.
> +//!
> +//! A single register typically includes several fields, which are accessed through a combination
> +//! of bit-shift and mask operations that introduce a class of potential mistakes, notably because
> +//! not all possible field values are necessarily valid.
> +//!
> +//! The macros in this module allow to define, using an intruitive and readable syntax, a dedicated
> +//! type for each register with its own field accessors that can return an error is a field's value
> +//! is invalid. They also provide a builder type allowing to construct a register value to be
> +//! written by combining valid values for its fields.
> +
> +/// Helper macro for the `register` macro.
> +///
> +/// Defines the wrapper `$name` type, as well as its relevant implementations (`Debug`, `BitOr`,
> +/// and conversion to regular `u32`).
> +macro_rules! __reg_def_common {
> +    ($name:ident $(, $type_comment:expr)?) => {
> +        $(
> +        #[doc=$type_comment]
> +        )?
> +        #[repr(transparent)]
> +        #[derive(Clone, Copy, Default)]
> +        pub(crate) struct $name(u32);
> +
> +        // TODO: should we display the raw hex value, then the value of all its fields?

To me it seems useful to have both.

> +        impl ::core::fmt::Debug for $name {
> +            fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
> +                f.debug_tuple(stringify!($name))
> +                    .field(&format_args!("0x{0:x}", &self.0))
> +                    .finish()
> +            }
> +        }
> +
> +        impl core::ops::BitOr for $name {
> +            type Output = Self;
> +
> +            fn bitor(self, rhs: Self) -> Self::Output {
> +                Self(self.0 | rhs.0)
> +            }
> +        }
> +
> +        impl From<$name> for u32 {

Here and in a few more cases below: This needs the full path; also remember to
use absolute paths everwhere.

> +            fn from(reg: $name) -> u32 {
> +                reg.0
> +            }
> +        }
> +    };
> +}
> +
> +/// Helper macro for the `register` macro.
> +///
> +/// Defines the getter method for $field.
> +macro_rules! __reg_def_field_getter {
> +    (
> +        $hi:tt:$lo:tt $field:ident
> +            $(=> as $as_type:ty)?
> +            $(=> as_bit $bit_type:ty)?
> +            $(=> into $type:ty)?
> +            $(=> try_into $try_type:ty)?
> +        $(, $comment:expr)?
> +    ) => {
> +        $(
> +        #[doc=concat!("Returns the ", $comment)]
> +        )?
> +        #[inline]
> +        pub(crate) fn $field(self) -> $( $as_type )? $( $bit_type )? $( $type )? $( core::result::Result<$try_type, <$try_type as TryFrom<u32>>::Error> )? {

Please make sure to wrap lines with a length > 100.

> +            const MASK: u32 = ((((1 << $hi) - 1) << 1) + 1) - ((1 << $lo) - 1);
> +            const SHIFT: u32 = MASK.trailing_zeros();
> +            let field = (self.0 & MASK) >> SHIFT;
> +
> +            $( field as $as_type )?
> +            $(
> +            // TODO: it would be nice to throw a compile-time error if $hi != $lo as this means we
> +            // are considering more than one bit but returning a bool...

Would the following work?

	const _: () = {
	   build_assert!($hi != $lo);
	   ()
	};

Though I guess, the above definition of MASK already guarantees that $hi and $lo
are known on compile time.

> +            <$bit_type>::from(if field != 0 { true } else { false }) as $bit_type
> +            )?
> +            $( <$type>::from(field) )?
> +            $( <$try_type>::try_from(field) )?
> +        }
> +    }
> +}
> +
> +/// Helper macro for the `register` macro.
> +///
> +/// Defines all the field getter methods for `$name`.
> +macro_rules! __reg_def_getters {
> +    (
> +        $name:ident
> +        $(; $hi:tt:$lo:tt $field:ident
> +            $(=> as $as_type:ty)?
> +            $(=> as_bit $bit_type:ty)?
> +            $(=> into $type:ty)?
> +            $(=> try_into $try_type:ty)?
> +        $(, $field_comment:expr)?)* $(;)?
> +    ) => {
> +        #[allow(dead_code)]
> +        impl $name {
> +            $(
> +            __reg_def_field_getter!($hi:$lo $field $(=> as $as_type)? $(=> as_bit $bit_type)? $(=> into $type)? $(=> try_into $try_type)? $(, $field_comment)?);
> +            )*
> +        }
> +    };
> +}
> +
> +/// Helper macro for the `register` macro.
> +///
> +/// Defines the setter method for $field.
> +macro_rules! __reg_def_field_setter {
> +    (
> +        $hi:tt:$lo:tt $field:ident
> +            $(=> as $as_type:ty)?
> +            $(=> as_bit $bit_type:ty)?
> +            $(=> into $type:ty)?
> +            $(=> try_into $try_type:ty)?
> +        $(, $comment:expr)?
> +    ) => {
> +        kernel::macros::paste! {
> +        $(
> +        #[doc=concat!("Sets the ", $comment)]
> +        )?
> +        #[inline]
> +        pub(crate) fn [<set_ $field>](mut self, value: $( $as_type)? $( $bit_type )? $( $type )? $( $try_type)? ) -> Self {
> +            const MASK: u32 = ((((1 << $hi) - 1) << 1) + 1) - ((1 << $lo) - 1);
> +            const SHIFT: u32 = MASK.trailing_zeros();
> +
> +            let value = ((value as u32) << SHIFT) & MASK;
> +            self.0 = (self.0 & !MASK) | value;
> +            self
> +        }
> +        }
> +    };
> +}
> +
> +/// Helper macro for the `register` macro.
> +///
> +/// Defines all the field setter methods for `$name`.
> +macro_rules! __reg_def_setters {
> +    (
> +        $name:ident
> +        $(; $hi:tt:$lo:tt $field:ident
> +            $(=> as $as_type:ty)?
> +            $(=> as_bit $bit_type:ty)?
> +            $(=> into $type:ty)?
> +            $(=> try_into $try_type:ty)?
> +        $(, $field_comment:expr)?)* $(;)?
> +    ) => {
> +        #[allow(dead_code)]
> +        impl $name {
> +            $(
> +            __reg_def_field_setter!($hi:$lo $field $(=> as $as_type)? $(=> as_bit $bit_type)? $(=> into $type)? $(=> try_into $try_type)? $(, $field_comment)?);
> +            )*
> +        }
> +    };
> +}
> +
> +/// Defines a dedicated type for a register with an absolute offset, alongside with getter and
> +/// setter methods for its fields and methods to read and write it from an `Io` region.
> +///
> +/// Example:
> +///
> +/// ```no_run
> +/// register!(Boot0@0x00000100, "Basic revision information about the chip";
> +///     3:0     minor_rev => as u8, "minor revision of the chip";
> +///     7:4     major_rev => as u8, "major revision of the chip";
> +///     28:20   chipset => try_into Chipset, "chipset model"
> +/// );
> +/// ```
> +///
> +/// This defines a `Boot0` type which can be read or written from offset `0x100` of an `Io` region.
> +/// It is composed of 3 fields, for instance `minor_rev` is made of the 4 less significant bits of
> +/// the register. Each field can be accessed and modified using helper methods:
> +///
> +/// ```no_run
> +/// // Read from offset 0x100.
> +/// let boot0 = Boot0::read(&bar);
> +/// pr_info!("chip revision: {}.{}", boot0.major_rev(), boot0.minor_rev());
> +///
> +/// // `Chipset::try_from` will be called with the value of the field and returns an error if the
> +/// // value is invalid.
> +/// let chipset = boot0.chipset()?;
> +///
> +/// // Update some fields and write the value back.
> +/// boot0.set_major_rev(3).set_minor_rev(10).write(&bar);
> +///
> +/// // Or just update the register value in a single step:
> +/// Boot0::alter(&bar, |r| r.set_major_rev(3).set_minor_rev(10));
> +/// ```
> +///
> +/// Fields are made accessible using one of the following strategies:
> +///
> +/// - `as <type>` simply casts the field value to the requested type.
> +/// - `as_bit <type>` turns the field into a boolean and calls `<type>::from()` with the obtained
> +///   value. To be used with single-bit fields.
> +/// - `into <type>` calls `<type>::from()` on the value of the field. It is expected to handle all
> +///   the possible values for the bit range selected.
> +/// - `try_into <type>` calls `<type>::try_from()` on the value of the field and returns its
> +///   result.
> +///
> +/// The documentation strings are optional. If present, they will be added to the type or the field
> +/// getter and setter methods they are attached to.
> +///
> +/// Putting a `+` before the address of the register makes it relative to a base: the `read` and
> +/// `write` methods take a `base` argument that is added to the specified address before access,
> +/// and adds `try_read` and `try_write` methods to allow access with offsets unknown at
> +/// compile-time.
> +///
> +macro_rules! register {
> +    // Create a register at a fixed offset of the MMIO space.
> +    (
> +        $name:ident@$offset:expr $(, $type_comment:expr)?

Can we use this as doc-comment?

> +        $(; $hi:tt:$lo:tt $field:ident
> +            $(=> as $as_type:ty)?
> +            $(=> as_bit $bit_type:ty)?
> +            $(=> into $type:ty)?
> +            $(=> try_into $try_type:ty)?
> +        $(, $field_comment:expr)?)* $(;)?
> +    ) => {
> +        __reg_def_common!($name);
> +
> +        #[allow(dead_code)]
> +        impl $name {
> +            #[inline]
> +            pub(crate) fn read<const SIZE: usize, T: Deref<Target=Io<SIZE>>>(bar: &T) -> Self {

Not necessarily a PCI bar, could be any I/O type.

> +                Self(bar.read32($offset))
> +            }
> +
> +            #[inline]
> +            pub(crate) fn write<const SIZE: usize, T: Deref<Target=Io<SIZE>>>(self, bar: &T) {
> +                bar.write32(self.0, $offset)
> +            }
> +
> +            #[inline]
> +            pub(crate) fn alter<const SIZE: usize, T: Deref<Target=Io<SIZE>>, F: FnOnce(Self) -> Self>(bar: &T, f: F) {
> +                let reg = f(Self::read(bar));
> +                reg.write(bar);
> +            }
> +        }
> +
> +        __reg_def_getters!($name; $( $hi:$lo $field $(=> as $as_type)? $(=> as_bit $bit_type)? $(=> into $type)? $(=> try_into $try_type)? $(, $field_comment)? );*);
> +
> +        __reg_def_setters!($name; $( $hi:$lo $field $(=> as $as_type)? $(=> as_bit $bit_type)? $(=> into $type)? $(=> try_into $try_type)? $(, $field_comment)? );*);
> +    };
> +
> +    // Create a register at a relative offset from a base address.
> +    (
> +        $name:ident@+$offset:expr $(, $type_comment:expr)?
> +        $(; $hi:tt:$lo:tt $field:ident
> +            $(=> as $as_type:ty)?
> +            $(=> as_bit $bit_type:ty)?
> +            $(=> into $type:ty)?
> +            $(=> try_into $try_type:ty)?
> +        $(, $field_comment:expr)?)* $(;)?
> +    ) => {

I assume this is for cases where we have multiple instances of the same
controller, engine, etc. I think it would be good to add a small example for
this one too.

> +        __reg_def_common!($name);
> +
> +        #[allow(dead_code)]
> +        impl $name {
> +            #[inline]
> +            pub(crate) fn read<const SIZE: usize, T: Deref<Target=Io<SIZE>>>(bar: &T, base: usize) -> Self {
> +                Self(bar.read32(base + $offset))
> +            }
> +
> +            #[inline]
> +            pub(crate) fn write<const SIZE: usize, T: Deref<Target=Io<SIZE>>>(self, bar: &T, base: usize) {
> +                bar.write32(self.0, base + $offset)
> +            }
> +
> +            #[inline]
> +            pub(crate) fn alter<const SIZE: usize, T: Deref<Target=Io<SIZE>>, F: FnOnce(Self) -> Self>(bar: &T, base: usize, f: F) {
> +                let reg = f(Self::read(bar, base));
> +                reg.write(bar, base);
> +            }
> +
> +            #[inline]
> +            pub(crate) fn try_read<const SIZE: usize, T: Deref<Target=Io<SIZE>>>(bar: &T, base: usize) -> ::kernel::error::Result<Self> {
> +                bar.try_read32(base + $offset).map(Self)
> +            }
> +
> +            #[inline]
> +            pub(crate) fn try_write<const SIZE: usize, T: Deref<Target=Io<SIZE>>>(self, bar: &T, base: usize) -> ::kernel::error::Result<()> {
> +                bar.try_write32(self.0, base + $offset)
> +            }
> +
> +            #[inline]
> +            pub(crate) fn try_alter<const SIZE: usize, T: Deref<Target=Io<SIZE>>, F: FnOnce(Self) -> Self>(bar: &T, base: usize, f: F) -> ::kernel::error::Result<()> {
> +                let reg = f(Self::try_read(bar, base)?);
> +                reg.try_write(bar, base)
> +            }
> +        }
> +
> +        __reg_def_getters!($name; $( $hi:$lo $field $(=> as $as_type)? $(=> as_bit $bit_type)? $(=> into $type)? $(=> try_into $try_type)? $(, $field_comment)? );*);
> +
> +        __reg_def_setters!($name; $( $hi:$lo $field $(=> as $as_type)? $(=> as_bit $bit_type)? $(=> into $type)? $(=> try_into $try_type)? $(, $field_comment)? );*);
> +    };
> +}
> 
> -- 
> 2.49.0
> 
