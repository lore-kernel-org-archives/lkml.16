Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723EB3A8D0;
	Sat,  1 Feb 2025 06:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738393006; cv=none; b=caghwRsuSgAFIiZrwJoBvhi+tcM2wIKvz2Efy5z0ljOliScE/5gcUo3E0hrLPv9QK6uN9mHWNjfLpTandN6sM5eZZh1neFDhNu4c8xRBFgw8aH8FwfnaCaZmzJgcZ1UWW6Wm25sAh3pa6gLmGe9R9osvwfT9jftj1hc2sHbzs58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738393006; c=relaxed/simple;
	bh=bwdk7Pd/FJdFWW5/815Dw0KWuedXWuZzPsb1BlH0XzQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dtqU3DkrgyaIBoBN3bRK7E3wQ9HqzJhdfZuYQEC1sFEp60/8/MJSQ9WnpFjB9L1QWhPr46xl/M0zMGNJj+Gi5LWWS/xmICmwRknEqV6qm5N0rSkW8/On4QbY2JzyjbrPgQBoALo1H1ULMkEmrh+Grx44Ep1HwVSbO+VLg5XKPeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UKHuyTwN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UKHuyTwN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A86C1C4CED3;
	Sat,  1 Feb 2025 06:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738393005;
	bh=bwdk7Pd/FJdFWW5/815Dw0KWuedXWuZzPsb1BlH0XzQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=UKHuyTwNp3erAiwtSuJVIWafxoR7RM4n+rMNnxNktaqz+KiBrfm1r5W5byC0rxELD
	 9Fkjoe2kWIImZh/cztcvq9KhITEALRKmaGW/TPhShk9ENEKWnSTw3ILNoigMcVOj+x
	 SDgGEZScJUjzo6FpMXINgHLibnDoel6IS57TkT+DN3/qdb+6PUsfFsyKnLGFaP8kMG
	 91JD5x3JTR/jJwH97pXQtsjh1Y/FhB2vzQ7LxgDvwQeWvNHxD6/87KUbBa4ywmENX3
	 PwtEnFDKbutURbxU17cYull3M6FLkvJg880zk58vB9zneEwQaWiwaPyNbuFzpdo9Ij
	 mc/7cV4oSCNpw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Charalampos Mitrodimas" <charmitro@posteo.net>
Cc: "Danilo Krummrich" <dakr@kernel.org>,  "Miguel Ojeda"
 <ojeda@kernel.org>,  "Alex Gaynor" <alex.gaynor@gmail.com>,  "Boqun Feng"
 <boqun.feng@gmail.com>,  "Gary Guo" <gary@garyguo.net>,  =?utf-8?Q?Bj?=
 =?utf-8?Q?=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno Lossin" <benno.lossin@proton.me>,
  "Alice Ryhl" <aliceryhl@google.com>,  "Trevor Gross" <tmgross@umich.edu>,
  "Joel Becker" <jlbec@evilplan.org>,  "Christoph Hellwig" <hch@lst.de>,
  <rust-for-linux@vger.kernel.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/4] rust: configfs: introduce rust support for configfs
In-Reply-To: <m25xluv5wp.fsf@posteo.net> (Charalampos Mitrodimas's message of
	"Sat, 01 Feb 2025 00:56:54 +0000")
References: <20250131-configfs-v1-0-87947611401c@kernel.org>
	<20250131-configfs-v1-3-87947611401c@kernel.org>
	<nKxc3ZgUAMTH7b-J6RrGSRznWwW7XSWS0gf_HVio3boAsLwYInm8zrr7KdEbvmVIp2IeelFX7qolt_0dg1jj9w==@protonmail.internalid>
	<m25xluv5wp.fsf@posteo.net>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Sat, 01 Feb 2025 07:56:37 +0100
Message-ID: <878qqqkva2.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Charalampos Mitrodimas" <charmitro@posteo.net> writes:

> Andreas Hindborg <a.hindborg@kernel.org> writes:
>
>> This patch adds a rust API for configfs, thus allowing rust modules to use
>> configfs for configuration. The implementation is a shim on top of the C
>> configfs implementation allowing safe use of the C infrastructure from
>> rust.
>>
>> The patch enables the `const_mut_refs` feature on compilers before rustc
>> 1.83. The feature was stabilized in rustc 1.83 and is not required to be
>> explicitly enabled on later versions.
>>
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>>
>> ---
>>

[cut]

>> +
>> +    /// # Safety
>> +    ///
>> +    /// `item` must be embedded in a `bindings::config_group`.
>> +    ///
>> +    /// If `item` does not represent the root group of a `configfs` subsystem,
>> +    /// the group must be embedded in a `Group<PAR>`.
>> +    ///
>> +    /// Otherwise, the group must be a embedded in a
>> +    /// `bindings::configfs_subsystem` that is embedded in a `Subsystem<PAR>`.
>> +    ///
>> +    /// `page` must point to a readable buffer of size at least `size`.
>> +    unsafe extern "C" fn store(
>> +        item: *mut bindings::config_item,
>> +        page: *const kernel::ffi::c_char,
>> +        size: usize,
>> +    ) -> isize {
>> +        let c_group: *mut bindings::config_group =
>> +        // SAFETY: By function safety requirements, `item` is embedded in a
>> +        // `config_group`.
>> +            unsafe { container_of!(item, bindings::config_group, cg_item) }.cast_mut();
>> +
>> +        // SAFETY: The function safety requirements for this function satisfy
>> +        // the conditions for this call.
>> +        let data: &DATA = unsafe { get_group_data(c_group) };
>> +
>> +        let ret = AO::store(
>> +            data,
>> +            // SAFETY: By function safety requirements, `page` is readable
>> +            // for at least `size`.
>> +            unsafe { core::slice::from_raw_parts(page.cast(), size) },
>> +        );
>> +
>> +        match ret {
>> +            Ok(()) => size as isize,
>> +            Err(err) => err.to_errno() as isize,
>
> Do we reach the Err arm here?

Yes, when `AO::store` returns `Err(_)`, the error arm should evaluate.

>
>> +        }
>> +    }
>> +
>> +    /// Create a new attribute.
>> +    ///
>> +    /// The attribute will appear as a file with name given by `name`.
>> +    pub const fn new(name: &'static CStr) -> Self {
>> +        Self {
>> +            attribute: Opaque::new(bindings::configfs_attribute {
>> +                ca_name: name as *const _ as _,
>> +                ca_owner: core::ptr::null_mut(),
>> +                ca_mode: 0o660,
>> +                show: Some(Self::show),
>> +                store: if AO::HAS_STORE {
>> +                    Some(Self::store)
>> +                } else {
>> +                    None
>> +                },
>> +            }),
>> +            _p: PhantomData,
>> +        }
>> +    }
>> +}
>> +
>> +/// Operations supported by an attribute.
>> +///
>> +/// Implement this trait on type and pass that type as generic parameter when
>> +/// creating an [`Attribute`]. The type carrying the implementation serve no
>> +/// purpose other than specifying the attribute operations.
>> +#[vtable]
>> +pub trait AttributeOperations<const ID: u64 = 0> {
>> +    /// The type of the object that contains the field that is backing the
>> +    /// attribute for this operation.
>> +    type Data;
>> +
>> +    /// This function is called by the kernel to read the value of an attribute.
>> +    ///
>> +    /// Implementations should write the rendering of the attribute to `page`
>> +    /// and return the number of bytes written.
>> +    fn show(data: &Self::Data, page: &mut [u8; PAGE_SIZE]) -> Result<usize>;
>> +
>> +    /// This function is called by the kernel to update the value of an attribute.
>> +    ///
>> +    /// Implementations should parse the value from `page` and update internal
>> +    /// state to reflect the parsed value. Partial writes are not supported and
>> +    /// implementations should expect the full page to arrive in one write
>> +    /// operation.
>> +    fn store(_data: &Self::Data, _page: &[u8]) -> Result {
>> +        kernel::build_error!(kernel::error::VTABLE_DEFAULT_ERROR)
>> +    }
>> +}
>> +
>> +/// A list of attributes.
>> +///
>> +/// This type is used to construct a new [`ItemType`]. It represents a list of
>> +/// [`Attribute`] that will appear in the directory representing a [`Group`].
>> +/// Users should not directly instantiate this type, rather they should use the
>> +/// [`kernel::configfs_attrs`] macro to declare a static set of attributes for a
>> +/// group.
>> +#[repr(transparent)]
>> +pub struct AttributeList<const N: usize, DATA>(
>> +    UnsafeCell<[*mut kernel::ffi::c_void; N]>,
>> +    PhantomData<DATA>,
>> +);
>> +
>> +// SAFETY: Ownership of `AttributeList` can safely be transferred to other threads.
>> +unsafe impl<const N: usize, DATA> Send for AttributeList<N, DATA> {}
>> +
>> +// SAFETY: We do not provide any operations on `AttributeList` that need synchronization.
>> +unsafe impl<const N: usize, DATA> Sync for AttributeList<N, DATA> {}
>> +
>> +impl<const N: usize, DATA> AttributeList<N, DATA> {
>> +    #[doc(hidden)]
>> +    /// # Safety
>> +    ///
>> +    /// This function can only be called by expanding the `configfs_attrs`
>> +    /// macro.
>> +    pub const unsafe fn new() -> Self {
>> +        Self(UnsafeCell::new([core::ptr::null_mut(); N]), PhantomData)
>> +    }
>> +
>> +    #[doc(hidden)]
>> +    /// # Safety
>> +    ///
>> +    /// This function can only be called by expanding the `configfs_attrs`
>> +    /// macro.
>> +    pub const unsafe fn add<
>> +        const I: usize,
>> +        const ID: u64,
>> +        O: AttributeOperations<ID, Data = DATA>,
>> +    >(
>> +        &'static self,
>> +        attribute: &'static Attribute<ID, O, DATA>,
>> +    ) {
>> +        if I >= N - 1 {
>> +            kernel::build_error!("Invalid attribute index");
>> +        }
>> +
>> +        // SAFETY: This function is only called through `configfs_attrs`. This
>> +        // ensures that we are evaluating the function in const context when
>> +        // initializing a static. As such, the reference created below will be
>> +        // exclusive.
>> +        unsafe {
>> +            (&mut *self.0.get())[I] = (attribute as *const Attribute<ID, O, DATA>)
>> +                .cast_mut()
>> +                .cast()
>> +        };
>> +    }
>> +}
>> +
>> +/// A representation of the attributes that will appear in a [`Group`].
>> +///
>> +/// Users should not directly instantiate objects of this type. Rather, they
>> +/// should use the [`kernel::configfs_attrs`] macro to statically declare the
>> +/// shape of a [`Group`].
>> +#[pin_data]
>> +pub struct ItemType<DATA> {
>> +    #[pin]
>> +    item_type: Opaque<bindings::config_item_type>,
>> +    _p: PhantomData<DATA>,
>> +}
>> +
>> +// SAFETY: We do not provide any operations on `ItemType` that need synchronization.
>> +unsafe impl<DATA> Sync for ItemType<DATA> {}
>> +
>> +// SAFETY: Ownership of `ItemType` can safely be transferred to other threads.
>> +unsafe impl<DATA> Send for ItemType<DATA> {}
>> +
>> +impl<DATA> ItemType<DATA> {
>> +    #[doc(hidden)]
>> +    pub const fn new_with_child_ctor<const N: usize, PAR, CHLD, CPTR, PCPTR>(
>> +        owner: &'static ThisModule,
>> +        attributes: &'static AttributeList<N, DATA>,
>> +    ) -> Self
>> +    where
>> +        PAR: GroupOperations<Child = CHLD, ChildPointer = CPTR, PinChildPointer = PCPTR>,
>> +        CPTR: InPlaceInit<Group<CHLD>, PinnedSelf = PCPTR>,
>> +        PCPTR: ForeignOwnable<PointedTo = Group<CHLD>>,
>> +    {
>> +        Self {
>> +            item_type: Opaque::new(bindings::config_item_type {
>> +                ct_owner: owner.as_ptr(),
>> +                ct_group_ops: (&GroupOperationsVTable::<PAR, CHLD, CPTR, PCPTR>::VTABLE as *const _)
>> +                    as *mut _,
>> +                ct_item_ops: core::ptr::null_mut(),
>> +                ct_attrs: attributes as *const _ as _,
>> +                ct_bin_attrs: core::ptr::null_mut(),
>> +            }),
>> +            _p: PhantomData,
>> +        }
>> +    }
>> +
>> +    #[doc(hidden)]
>> +    pub const fn new<const N: usize>(
>> +        owner: &'static ThisModule,
>> +        attributes: &'static AttributeList<N, DATA>,
>> +    ) -> Self {
>> +        Self {
>> +            item_type: Opaque::new(bindings::config_item_type {
>> +                ct_owner: owner.as_ptr(),
>> +                ct_group_ops: core::ptr::null_mut(),
>> +                ct_item_ops: core::ptr::null_mut(),
>> +                ct_attrs: attributes as *const _ as _,
>> +                ct_bin_attrs: core::ptr::null_mut(),
>> +            }),
>> +            _p: PhantomData,
>> +        }
>> +    }
>> +}
>> +
>> +impl<DATA> ItemType<DATA> {
>> +    fn as_ptr(&self) -> *const bindings::config_item_type {
>> +        self.item_type.get()
>> +    }
>> +}
>> +
>> +/// Define a list of configfs attributes statically.
>> +#[macro_export]
>> +macro_rules! configfs_attrs {
>> +    (
>> +        container: $container:ty,
>> +        attributes: [
>> +            $($name:ident: $attr:literal,)*
>> +        ],
>> +    ) => {
>> +        $crate::configfs_attrs!(
>> +            count:
>> +            @container($container),
>> +            @child(),
>> +            @no_child(x),
>> +            @attrs($($name $attr)*),
>> +            @eat($($name $attr,)*),
>> +            @assign(),
>> +            @cnt(0usize),
>> +        )
>> +    };
>> +    (
>> +        container: $container:ty,
>> +        child: $child:ty,
>> +        pointer: $pointer:ty,
>> +        pinned: $pinned:ty,
>> +        attributes: [
>> +            $($name:ident: $attr:literal,)*
>> +        ],
>> +    ) => {
>> +        $crate::configfs_attrs!(
>> +            count:
>> +            @container($container),
>> +            @child($child, $pointer, $pinned),
>> +            @no_child(),
>> +            @attrs($($name $attr)*),
>> +            @eat($($name $attr,)*),
>> +            @assign(),
>> +            @cnt(0usize),
>> +        )
>> +    };
>> +    (count:
>> +     @container($container:ty),
>> +     @child($($child:ty, $pointer:ty, $pinned:ty)?),
>> +     @no_child($($no_child:ident)?),
>> +     @attrs($($aname:ident $aattr:literal)*),
>> +     @eat($name:ident $attr:literal, $($rname:ident $rattr:literal,)*),
>> +     @assign($($assign:block)*),
>> +     @cnt($cnt:expr),
>> +    ) => {
>> +        $crate::configfs_attrs!(
>> +            count:
>> +            @container($container),
>> +            @child($($child, $pointer, $pinned)?),
>> +            @no_child($($no_child)?),
>> +            @attrs($($aname $aattr)*),
>> +            @eat($($rname $rattr,)*),
>> +            @assign($($assign)* {
>> +                const N: usize = $cnt;
>> +                // SAFETY: We are expanding `configfs_attrs`.
>> +                unsafe {
>> +                    $crate::macros::paste!( [< $container:upper _ATTRS >])
>> +                        .add::<N, $attr, _>(
>> +                            & $crate::macros::paste!( [< $container:upper _ $name:upper _ATTR >])
>> +                        )
>> +                };
>> +            }),
>> +            @cnt(1usize + $cnt),
>> +        )
>> +    };
>> +    (count:
>> +     @container($container:ty),
>> +     @child($($child:ty, $pointer:ty, $pinned:ty)?),
>> +     @no_child($($no_child:ident)?),
>> +     @attrs($($aname:ident $aattr:literal)*),
>> +     @eat(),
>> +     @assign($($assign:block)*),
>> +     @cnt($cnt:expr),
>> +    ) =>
>> +    {
>> +        $crate::configfs_attrs!(final:
>> +                                @container($container),
>> +                                @child($($child, $pointer, $pinned)?),
>> +                                @no_child($($no_child)?),
>> +                                @attrs($($aname $aattr)*),
>> +                                @assign($($assign)*),
>> +                                @cnt($cnt),
>> +        )
>> +    };
>> +    (final:
>> +     @container($container:ty),
>> +     @child($($child:ty, $pointer:ty, $pinned:ty)?),
>> +     @no_child($($no_child:ident)?),
>> +     @attrs($($name:ident $attr:literal)*),
>> +     @assign($($assign:block)*),
>> +     @cnt($cnt:expr),
>> +    ) =>
>> +    {
>> +        {
>> +            $(
>> +                $crate::macros::paste!{
>> +                    // SAFETY: We are expanding `configfs_attrs`.
>> +                    static [< $container:upper _ $name:upper _ATTR >]:
>> +                      $crate::configfs::Attribute<$attr, $container, $container> =
>> +                        unsafe {
>> +                            $crate::configfs::Attribute::new(c_str!(::core::stringify!($name)))
>> +                        };
>> +                }
>> +            )*
>> +
>> +
>> +            const N: usize = $cnt + 1usize;
>> +            $crate::macros::paste!{
>> +                // SAFETY: We are expanding `configfs_attrs`.
>> +                static [< $container:upper _ATTRS >]:
>> +                  $crate::configfs::AttributeList<N, $container> =
>> +                    unsafe { $crate::configfs::AttributeList::new() };
>> +            }
>> +
>> +            $($assign)*
>> +
>> +            $(
>> +                $crate::macros::paste!{
>> +                    const [<$no_child:upper>]: bool = true;
>> +                };
>> +
>> +                $crate::macros::paste!{
>> +                    static [< $container:upper _TPE >] : $crate::configfs::ItemType<$container>  =
>> +                        $crate::configfs::ItemType::new::<N>(
>> +                            &THIS_MODULE, &[<$ container:upper _ATTRS >]
>> +                        );
>> +                }
>> +            )?
>> +
>> +            $(
>> +                $crate::macros::paste!{
>> +                    static [< $container:upper _TPE >]:
>> +                      $crate::configfs::ItemType<$container>  =
>> +                        $crate::configfs::ItemType::new_with_child_ctor::
>> +                    <N, $container, $child, $pointer, $pinned>(
>> +                        &THIS_MODULE, &[<$ container:upper _ATTRS >]
>> +                    );
>> +                }
>> +            )?
>> +
>> +            &$crate::macros::paste!( [< $container:upper _TPE >] )
>> +        }
>> +    };
>> +
>> +}
>> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
>> index 545d1170ee6358e185b48ce10493fc61c646155c..91f05cf54db0ea83f27837c4c3a80cf48c5158da 100644
>> --- a/rust/kernel/lib.rs
>> +++ b/rust/kernel/lib.rs
>> @@ -19,6 +19,7 @@
>>  #![cfg_attr(not(CONFIG_RUSTC_HAS_COERCE_POINTEE), feature(unsize))]
>>  #![feature(inline_const)]
>>  #![feature(lint_reasons)]
>> +#![cfg_attr(not(CONFIG_RUSTC_HAS_CONST_MUT_REFS_MERGED), feature(const_mut_refs))]
>>
>>  // Ensure conditional compilation based on the kernel configuration works;
>>  // otherwise we may silently break things like initcall handling.
>> @@ -35,6 +36,8 @@
>>  pub mod block;
>>  #[doc(hidden)]
>>  pub mod build_assert;
>> +#[cfg(CONFIG_CONFIGFS_FS)]
>> +pub mod configfs;
>>  pub mod cred;
>>  pub mod device;
>>  pub mod error;
>> diff --git a/samples/rust/Kconfig b/samples/rust/Kconfig
>> index b0f74a81c8f9ad24c9dc1ca057f83531156084aa..ba540a167ebf49853f377f09374bba0c6facee8c 100644
>> --- a/samples/rust/Kconfig
>> +++ b/samples/rust/Kconfig
>> @@ -30,6 +30,17 @@ config SAMPLE_RUST_PRINT
>>
>>  	  If unsure, say N.
>>
>> +config SAMPLE_RUST_CONFIGFS
>> +	tristate "Configfs sample"
>> +	depends on CONFIGFS_FS
>> +	help
>> +	  This option builds the Rust configfs sample.
>> +
>> +	  To compile this as a module, choose M here:
>> +	  the module will be called rust_configfs.
>> +
>> +	  If unsure, say N.
>> +
>>  config SAMPLE_RUST_HOSTPROGS
>>  	bool "Host programs"
>>  	help
>> diff --git a/samples/rust/Makefile b/samples/rust/Makefile
>> index c1a5c16553955b1cfc59d77e85e1d60b06242967..2b2621046f10609321b76cad3c7f327bafc802c0 100644
>> --- a/samples/rust/Makefile
>> +++ b/samples/rust/Makefile
>> @@ -3,6 +3,7 @@ ccflags-y += -I$(src)				# needed for trace events
>>
>>  obj-$(CONFIG_SAMPLE_RUST_MINIMAL)		+= rust_minimal.o
>>  obj-$(CONFIG_SAMPLE_RUST_PRINT)			+= rust_print.o
>> +obj-$(CONFIG_SAMPLE_RUST_CONFIGFS)		+= rust_configfs.o
>>
>>  rust_print-y := rust_print_main.o rust_print_events.o
>>
>> diff --git a/samples/rust/rust_configfs.rs b/samples/rust/rust_configfs.rs
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..a77fe292d1b6c775210abb31d706519de2ab125a
>> --- /dev/null
>> +++ b/samples/rust/rust_configfs.rs
>> @@ -0,0 +1,192 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +//! Rust configfs sample.
>> +
>> +use kernel::alloc::flags;
>> +use kernel::c_str;
>> +use kernel::configfs;
>> +use kernel::configfs_attrs;
>> +use kernel::new_mutex;
>> +use kernel::prelude::*;
>> +use kernel::sync::Arc;
>> +use kernel::sync::Mutex;
>> +
>> +module! {
>> +    type: RustConfigfs,
>> +    name: "rust_configfs",
>> +    author: "Rust for Linux Contributors",
>> +    description: "Rust configfs sample",
>> +    license: "GPL",
>> +}
>> +
>> +#[pin_data]
>> +struct RustConfigfs {
>> +    #[pin]
>> +    config: configfs::Subsystem<Configuration>,
>> +}
>> +
>> +#[pin_data]
>> +struct Configuration {
>> +    message: &'static CStr,
>> +    #[pin]
>> +    bar: Mutex<(KBox<[u8; 4096]>, usize)>,
>> +}
>> +
>> +impl Configuration {
>> +    fn new() -> impl PinInit<Self, Error> {
>> +        try_pin_init!(Self {
>> +            message: c_str!("Hello World\n"),
>> +            bar <- new_mutex!((KBox::new([0;4096], flags::GFP_KERNEL)?,0)),
>> +        })
>> +    }
>> +}
>> +
>> +impl kernel::InPlaceModule for RustConfigfs {
>> +    fn init(_module: &'static ThisModule) -> impl PinInit<Self, Error> {
>> +        pr_info!("Rust configfs sample (init)\n");
>> +
>> +        let item_type = configfs_attrs! {
>> +            container: Configuration,
>> +            child: Child,
>> +            pointer: Arc<configfs::Group<Child>>,
>> +            pinned: Arc<configfs::Group<Child>>,
>> +            attributes: [
>> +                message: 0,
>> +                bar: 1,
>> +            ],
>> +        };
>> +
>> +        try_pin_init!(Self {
>> +            config <- configfs::Subsystem::new(
>> +                kernel::c_str!("rust_configfs"), item_type, Configuration::new()
>> +            ),
>> +        })
>> +    }
>> +}
>> +
>> +#[vtable]
>> +impl configfs::GroupOperations for Configuration {
>> +    type Parent = Self;
>> +    type Child = Child;
>> +    type ChildPointer = Arc<configfs::Group<Child>>;
>> +    type PinChildPointer = Arc<configfs::Group<Child>>;
>> +
>> +    fn make_group(
>> +        _this: &Self,
>> +        name: &CStr,
>> +    ) -> Result<impl PinInit<configfs::Group<Child>, Error>> {
>> +        let tpe = configfs_attrs! {
>> +            container: Child,
>> +            child: GrandChild,
>> +            pointer: Arc<configfs::Group<GrandChild>>,
>> +            pinned: Arc<configfs::Group<GrandChild>>,
>> +            attributes: [
>> +                baz: 0,
>> +            ],
>> +        };
>> +
>> +        Ok(configfs::Group::new(name.try_into()?, tpe, Child::new()))
>> +    }
>> +}
>> +
>> +#[vtable]
>> +impl configfs::AttributeOperations<0> for Configuration {
>> +    type Data = Configuration;
>> +
>> +    fn show(container: &Configuration, page: &mut [u8; 4096]) -> Result<usize> {
>> +        pr_info!("Show message\n");
>> +        let data = container.message;
>> +        page[0..data.len()].copy_from_slice(data);
>> +        Ok(data.len())
>> +    }
>> +}
>> +
>> +#[vtable]
>> +impl configfs::AttributeOperations<1> for Configuration {
>> +    type Data = Configuration;
>> +
>> +    fn show(container: &Configuration, page: &mut [u8; 4096]) -> Result<usize> {
>> +        pr_info!("Show bar\n");
>> +        let guard = container.bar.lock();
>> +        let data = guard.0.as_slice();
>> +        let len = guard.1;
>> +        page[0..len].copy_from_slice(&data[0..len]);
>> +        Ok(len)
>> +    }
>> +
>> +    fn store(container: &Configuration, page: &[u8]) -> Result {
>> +        pr_info!("Store bar\n");
>> +        let mut guard = container.bar.lock();
>> +        guard.0[0..page.len()].copy_from_slice(page);
>> +        guard.1 = page.len();
>> +        Ok(())
>
> Do we return Err() here? It seems to me that this will either return
> Ok(()) or panic at,
> 	   guard.0[0..page.len()].copy_from_slice(page);

configfs guarantees that the attribute buffer is never more than
`PAGE_SIZE`, so this particular code will not panic on systems where
`PAGE_SIZE` is 4k. I should probably use the constant for the buffer
size though.

Also, I will add this info about the buffer size to the
`configfs::AttributeOperatiosn` trait documentation.

Thanks!


Best regards,
Andreas Hindborg


