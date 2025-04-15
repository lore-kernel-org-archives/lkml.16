Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E86E2820B6
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 12:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744718910; cv=none; b=OFI8zHAw2sUXEzfsfYeCZHD/aDYmHOunm+eoRtxsIlRQk1YDSo+gPixDEbje5ailhB9rCkJtTytWjvpiYKPuCIB74NTkpaMTIkkv7JVuB/gStw+jNdEkRJf0q/hHwaEkYmCoqLqtDfsZNrYKh7C0xvRxsI5UoIrgZSXLDaQyEuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744718910; c=relaxed/simple;
	bh=mHq18OpBfAyK0EnzEkx0Tm6ePf1uyVfmSkAKah6C6zA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=O5SZoB4zdOmHO+huU4rKluA+gxcSXkUHsuk6BUFsyHbNr4B1DPfYnDqB9GvDfF15ikC9IXbVs9IzWTlFjh9mqVwIlUYCCrBZIwBnSfwJC44JnboDQuCStqRBGT9s9B9sIxns30tZLtQR5m2YWLk65yRIOKU5CE2VKOa3/WgJbCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QZhYztmI; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QZhYztmI"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43eea5a5d80so29961395e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 05:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744718906; x=1745323706; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ibk7l1kfkplOBda2bMSZubeI5zZB2pQ8Aatk8VdGnRs=;
        b=QZhYztmIcIkYnjLsUNImHaHYVI3AVxM7JaZ2YfBIcRnKiddmpSS4DvQGrJzd0MgvB4
         1vRCayp+CkZRwfsE+Ld4eD+sW2upopc/ihVg1fp+SaIEm4B35wjlxEhEg6VYCyPiAhBf
         wjzFwp9vwwESfmD0Uzcbxo6Qk0vcr5JxCITcYvvt5h1hSc3VxbfouJM1Jo3m1eBS6aYy
         wO9ymUwvUkcv92NH4JoUJGTGDUDFIzumsw9T2HH57kPvPse8fPbr9nY7+/Fq1ilkelIC
         CuULG47Ph3TFiOvTwqwnb2Esod/Q+oker7pQlp7J91kB56F/+CwBBsr/nFQbZ0eIcqEd
         4qSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744718906; x=1745323706;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ibk7l1kfkplOBda2bMSZubeI5zZB2pQ8Aatk8VdGnRs=;
        b=ZMFRIOtK7J4kzla4RKtIv7n9WrR7dq744EBVO+HESctKqRJMIWJrxf/M6D0pZylXAN
         8PEXvQHH9B/IaxJRNfka67UjJCNGUGAItaft1nO6pS+I6ajmCMulgJBtQ2it2GD1GJXd
         koLdKeayeYU4pcUZVxJsYXrLKXX/2F/yGMw/QWdoS+J0ao8xcH3RVMEI4DZRtgNB5B6j
         FD9tIvXhATZkZZaZMnNZGbeI/8zcKbgULSOOA5JAVIZ/pU79tzUn9J6xy6PwAtr5J0P1
         5FXnejvZzsGPL7f66KtUv3zYK2zvguwF8VFhaoqgIUFfxcsPugyu1mtdktcX/wIG4XBd
         Iejg==
X-Forwarded-Encrypted: i=1; AJvYcCU7n/7qf1ciimeiRTgY9B16BJEqm40hvsFkTh9GLDq84z7YY0cYv0p0ZjFN7OBsHonis/89P1z/E4zUJEg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2y/lMb91vGxu9A0Uid4/ENs7xa+dQHI8Wnk3z3etXJYgPjcJK
	FcmZkP033j2giKsGAgW8j8+sPFTrjhFy3hZofy5WIJZfxTL0MqJ2uOozvBe7NZY+XxXw06rWO32
	A1IM1yzn5qJTiBw==
X-Google-Smtp-Source: AGHT+IHW30Sj0MVsftpoPKzFhlZZDOh1Z+Bv8uiTfXY2XPZFrAqpcI5g98IGsdqGD7l9P0diw17ch1m6ajljDNw=
X-Received: from wmbbh10.prod.google.com ([2002:a05:600c:3d0a:b0:43b:c7e5:66e0])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:354d:b0:43d:7588:6699 with SMTP id 5b1f17b1804b1-43f3a9266ebmr128981895e9.7.1744718906604;
 Tue, 15 Apr 2025 05:08:26 -0700 (PDT)
Date: Tue, 15 Apr 2025 12:08:24 +0000
In-Reply-To: <20250414131934.28418-4-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250414131934.28418-1-dakr@kernel.org> <20250414131934.28418-4-dakr@kernel.org>
Message-ID: <Z_5MODlzsC3LNtFj@google.com>
Subject: Re: [PATCH v4 3/5] rust: auxiliary: add auxiliary device / driver abstractions
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, david.m.ertman@intel.com, 
	ira.weiny@intel.com, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@kernel.org, tmgross@umich.edu, 
	airlied@gmail.com, acourbot@nvidia.com, jhubbard@nvidia.com, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Apr 14, 2025 at 03:18:06PM +0200, Danilo Krummrich wrote:
> Implement the basic auxiliary abstractions required to implement a
> driver matching an auxiliary device.
> 
> The design and implementation is analogous to PCI and platform and is
> based on the generic device / driver abstractions.
> 
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Overall looks okay to me, but I do have some comments.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

>  MAINTAINERS                     |   2 +
>  rust/bindings/bindings_helper.h |   1 +
>  rust/helpers/auxiliary.c        |  23 +++
>  rust/helpers/helpers.c          |   1 +
>  rust/kernel/auxiliary.rs        | 274 ++++++++++++++++++++++++++++++++
>  rust/kernel/device.rs           |   1 -
>  rust/kernel/lib.rs              |   2 +
>  7 files changed, 303 insertions(+), 1 deletion(-)
>  create mode 100644 rust/helpers/auxiliary.c
>  create mode 100644 rust/kernel/auxiliary.rs
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 96b827049501..a7bc29ca37d4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3872,6 +3872,8 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git
>  F:	Documentation/driver-api/auxiliary_bus.rst
>  F:	drivers/base/auxiliary.c
>  F:	include/linux/auxiliary_bus.h
> +F:	rust/kernel/auxiliary.rs
> +F:	samples/rust/rust_driver_auxiliary.rs
>  
>  AUXILIARY DISPLAY DRIVERS
>  M:	Andy Shevchenko <andy@kernel.org>
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
> index ab37e1d35c70..8a2add69e5d6 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -7,6 +7,7 @@
>   */
>  
>  #include <kunit/test.h>
> +#include <linux/auxiliary_bus.h>
>  #include <linux/blk-mq.h>
>  #include <linux/blk_types.h>
>  #include <linux/blkdev.h>
> diff --git a/rust/helpers/auxiliary.c b/rust/helpers/auxiliary.c
> new file mode 100644
> index 000000000000..0db3860d774e
> --- /dev/null
> +++ b/rust/helpers/auxiliary.c
> @@ -0,0 +1,23 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/auxiliary_bus.h>
> +
> +void rust_helper_auxiliary_set_drvdata(struct auxiliary_device *adev, void *data)
> +{
> +	auxiliary_set_drvdata(adev, data);
> +}
> +
> +void *rust_helper_auxiliary_get_drvdata(struct auxiliary_device *adev)
> +{
> +	return auxiliary_get_drvdata(adev);
> +}
> +
> +void rust_helper_auxiliary_device_uninit(struct auxiliary_device *adev)
> +{
> +	return auxiliary_device_uninit(adev);
> +}
> +
> +void rust_helper_auxiliary_device_delete(struct auxiliary_device *adev)
> +{
> +	return auxiliary_device_delete(adev);
> +}
> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> index e1c21eba9b15..6b279279cb12 100644
> --- a/rust/helpers/helpers.c
> +++ b/rust/helpers/helpers.c
> @@ -7,6 +7,7 @@
>   * Sorted alphabetically.
>   */
>  
> +#include "auxiliary.c"
>  #include "blk.c"
>  #include "bug.c"
>  #include "build_assert.c"
> diff --git a/rust/kernel/auxiliary.rs b/rust/kernel/auxiliary.rs
> new file mode 100644
> index 000000000000..75423737032a
> --- /dev/null
> +++ b/rust/kernel/auxiliary.rs
> @@ -0,0 +1,274 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Abstractions for the auxiliary bus.
> +//!
> +//! C header: [`include/linux/auxiliary_bus.h`](srctree/include/linux/auxiliary_bus.h)
> +
> +use crate::{
> +    bindings, device,
> +    device_id::RawDeviceId,
> +    driver,
> +    error::{to_result, Result},
> +    prelude::*,
> +    str::CStr,
> +    types::{ForeignOwnable, Opaque},
> +    ThisModule,
> +};
> +use core::{
> +    marker::PhantomData,
> +    ptr::{addr_of_mut, NonNull},
> +};
> +
> +/// An adapter for the registration of auxiliary drivers.
> +pub struct Adapter<T: Driver>(T);
> +
> +// SAFETY: A call to `unregister` for a given instance of `RegType` is guaranteed to be valid if
> +// a preceding call to `register` has been successful.
> +unsafe impl<T: Driver + 'static> driver::RegistrationOps for Adapter<T> {
> +    type RegType = bindings::auxiliary_driver;
> +
> +    unsafe fn register(
> +        adrv: &Opaque<Self::RegType>,
> +        name: &'static CStr,
> +        module: &'static ThisModule,
> +    ) -> Result {
> +        // SAFETY: It's safe to set the fields of `struct auxiliary_driver` on initialization.
> +        unsafe {
> +            (*adrv.get()).name = name.as_char_ptr();
> +            (*adrv.get()).probe = Some(Self::probe_callback);
> +            (*adrv.get()).remove = Some(Self::remove_callback);
> +            (*adrv.get()).id_table = T::ID_TABLE.as_ptr();
> +        }
> +
> +        // SAFETY: `adrv` is guaranteed to be a valid `RegType`.
> +        to_result(unsafe {
> +            bindings::__auxiliary_driver_register(adrv.get(), module.0, name.as_char_ptr())
> +        })
> +    }
> +
> +    unsafe fn unregister(adrv: &Opaque<Self::RegType>) {
> +        // SAFETY: `adrv` is guaranteed to be a valid `RegType`.
> +        unsafe { bindings::auxiliary_driver_unregister(adrv.get()) }
> +    }
> +}
> +
> +impl<T: Driver + 'static> Adapter<T> {
> +    extern "C" fn probe_callback(
> +        adev: *mut bindings::auxiliary_device,
> +        id: *const bindings::auxiliary_device_id,
> +    ) -> core::ffi::c_int {

We shouldn't use core::ffi.

> +        // SAFETY: The auxiliary bus only ever calls the probe callback with a valid pointer to a
> +        // `struct auxiliary_device`.
> +        //
> +        // INVARIANT: `adev` is valid for the duration of `probe_callback()`.
> +        let adev = unsafe { &*adev.cast::<Device<device::Core>>() };
> +
> +        // SAFETY: `DeviceId` is a `#[repr(transparent)` wrapper of `struct auxiliary_device_id` and

Typo: missing ]

> +        // does not add additional invariants, so it's safe to transmute.
> +        let id = unsafe { &*id.cast::<DeviceId>() };
> +        let info = T::ID_TABLE.info(id.index());
> +
> +        match T::probe(adev, info) {
> +            Ok(data) => {
> +                // Let the `struct auxiliary_device` own a reference of the driver's private data.
> +                // SAFETY: By the type invariant `adev.as_raw` returns a valid pointer to a
> +                // `struct auxiliary_device`.
> +                unsafe { bindings::auxiliary_set_drvdata(adev.as_raw(), data.into_foreign()) };
> +            }
> +            Err(err) => return Error::to_errno(err),
> +        }
> +
> +        0
> +    }
> +
> +    extern "C" fn remove_callback(adev: *mut bindings::auxiliary_device) {
> +        // SAFETY: The auxiliary bus only ever calls the remove callback with a valid pointer to a
> +        // `struct auxiliary_device`.
> +        let ptr = unsafe { bindings::auxiliary_get_drvdata(adev) };
> +
> +        // SAFETY: `remove_callback` is only ever called after a successful call to
> +        // `probe_callback`, hence it's guaranteed that `ptr` points to a valid and initialized
> +        // `KBox<T>` pointer created through `KBox::into_foreign`.
> +        let _ = unsafe { KBox::<T>::from_foreign(ptr) };

Nit: isn't this usually written

    drop(unsafe { KBox::<T>::from_foreign(ptr) });

?

> +    }
> +}
> +
> +/// Declares a kernel module that exposes a single auxiliary driver.
> +#[macro_export]
> +macro_rules! module_auxiliary_driver {
> +    ($($f:tt)*) => {
> +        $crate::module_driver!(<T>, $crate::auxiliary::Adapter<T>, { $($f)* });
> +    };
> +}
> +
> +/// Abstraction for `bindings::auxiliary_device_id`.
> +#[repr(transparent)]
> +#[derive(Clone, Copy)]
> +pub struct DeviceId(bindings::auxiliary_device_id);
> +
> +impl DeviceId {
> +    /// Create a new [`DeviceId`] from name.
> +    pub const fn new(modname: &'static CStr, name: &'static CStr) -> Self {
> +        let name = name.as_bytes_with_nul();
> +        let modname = modname.as_bytes_with_nul();
> +
> +        // TODO: Replace with `bindings::auxiliary_device_id::default()` once stabilized for
> +        // `const`.
> +        //
> +        // SAFETY: FFI type is valid to be zero-initialized.
> +        let mut id: bindings::auxiliary_device_id = unsafe { core::mem::zeroed() };
> +
> +        let mut i = 0;
> +        while i < modname.len() {
> +            id.name[i] = modname[i];
> +            i += 1;
> +        }
> +
> +        // Reuse the space of the NULL terminator.
> +        id.name[i - 1] = b'.';
> +
> +        let mut j = 0;
> +        while j < name.len() {
> +            id.name[i] = name[j];
> +            i += 1;
> +            j += 1;
> +        }
> +
> +        Self(id)
> +    }
> +}
> +
> +// SAFETY:
> +// * `DeviceId` is a `#[repr(transparent)` wrapper of `auxiliary_device_id` and does not add

Typo: missing ]

> +//   additional invariants, so it's safe to transmute to `RawType`.
> +// * `DRIVER_DATA_OFFSET` is the offset to the `driver_data` field.
> +unsafe impl RawDeviceId for DeviceId {
> +    type RawType = bindings::auxiliary_device_id;
> +
> +    const DRIVER_DATA_OFFSET: usize =
> +        core::mem::offset_of!(bindings::auxiliary_device_id, driver_data);
> +
> +    fn index(&self) -> usize {
> +        self.0.driver_data
> +    }
> +}
> +
> +/// IdTable type for auxiliary drivers.
> +pub type IdTable<T> = &'static dyn kernel::device_id::IdTable<DeviceId, T>;
> +
> +/// Create a auxiliary `IdTable` with its alias for modpost.
> +#[macro_export]
> +macro_rules! auxiliary_device_table {
> +    ($table_name:ident, $module_table_name:ident, $id_info_type: ty, $table_data: expr) => {
> +        const $table_name: $crate::device_id::IdArray<
> +            $crate::auxiliary::DeviceId,
> +            $id_info_type,
> +            { $table_data.len() },
> +        > = $crate::device_id::IdArray::new($table_data);
> +
> +        $crate::module_device_table!("auxiliary", $module_table_name, $table_name);
> +    };
> +}
> +
> +/// The auxiliary driver trait.
> +///
> +/// Drivers must implement this trait in order to get an auxiliary driver registered.
> +pub trait Driver {
> +    /// The type holding information about each device id supported by the driver.
> +    ///
> +    /// TODO: Use associated_type_defaults once stabilized:
> +    ///
> +    /// type IdInfo: 'static = ();
> +    type IdInfo: 'static;
> +
> +    /// The table of device ids supported by the driver.
> +    const ID_TABLE: IdTable<Self::IdInfo>;
> +
> +    /// Auxiliary driver probe.
> +    ///
> +    /// Called when an auxiliary device is matches a corresponding driver.
> +    fn probe(dev: &Device<device::Core>, id_info: &Self::IdInfo) -> Result<Pin<KBox<Self>>>;
> +}
> +
> +/// The auxiliary device representation.
> +///
> +/// This structure represents the Rust abstraction for a C `struct auxiliary_device`. The
> +/// implementation abstracts the usage of an already existing C `struct auxiliary_device` within
> +/// Rust code that we get passed from the C side.
> +///
> +/// # Invariants
> +///
> +/// A [`Device`] instance represents a valid `struct auxiliary_device` created by the C portion of
> +/// the kernel.
> +#[repr(transparent)]
> +pub struct Device<Ctx: device::DeviceContext = device::Normal>(
> +    Opaque<bindings::auxiliary_device>,
> +    PhantomData<Ctx>,
> +);
> +
> +impl<Ctx: device::DeviceContext> Device<Ctx> {
> +    fn as_raw(&self) -> *mut bindings::auxiliary_device {
> +        self.0.get()
> +    }
> +
> +    /// Returns the auxiliary device' id.
> +    pub fn id(&self) -> u32 {
> +        // SAFETY: By the type invariant `self.as_raw()` is a valid pointer to a
> +        // `struct auxiliary_device`.
> +        unsafe { (*self.as_raw()).id }
> +    }
> +
> +    /// Returns a reference to the parent [`device::Device`], if any.
> +    pub fn parent(&self) -> Option<&device::Device> {
> +        let ptr: *const Self = self;
> +        // CAST: `Device<Ctx: DeviceContext>` types are transparent to each other.
> +        let ptr: *const Device = ptr.cast();
> +        // SAFETY: `ptr` was derived from `&self`.
> +        let this = unsafe { &*ptr };
> +
> +        this.as_ref().parent()
> +    }
> +}
> +
> +// SAFETY: `Device` is a transparent wrapper of a type that doesn't depend on `Device`'s generic
> +// argument.
> +kernel::impl_device_context_deref!(unsafe { Device });
> +kernel::impl_device_context_into_aref!(Device);
> +
> +// SAFETY: Instances of `Device` are always reference-counted.
> +unsafe impl crate::types::AlwaysRefCounted for Device {
> +    fn inc_ref(&self) {
> +        // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
> +        unsafe { bindings::get_device(self.as_ref().as_raw()) };
> +    }
> +
> +    unsafe fn dec_ref(obj: NonNull<Self>) {
> +        // CAST: `Self` a transparent wrapper of `bindings::auxiliary_device`.
> +        let adev: *mut bindings::auxiliary_device = obj.cast().as_ptr();
> +
> +        // SAFETY: By the type invariant of `Self`, `adev` is a pointer to a valid
> +        // `struct auxiliary_device`.
> +        let dev = unsafe { addr_of_mut!((*adev).dev) };
> +
> +        // SAFETY: The safety requirements guarantee that the refcount is non-zero.
> +        unsafe { bindings::put_device(dev) }
> +    }
> +}
> +
> +impl<Ctx: device::DeviceContext> AsRef<device::Device<Ctx>> for Device<Ctx> {
> +    fn as_ref(&self) -> &device::Device<Ctx> {
> +        // SAFETY: By the type invariant of `Self`, `self.as_raw()` is a pointer to a valid
> +        // `struct auxiliary_device`.
> +        let dev = unsafe { addr_of_mut!((*self.as_raw()).dev) };
> +
> +        // SAFETY: `dev` points to a valid `struct device`.
> +        unsafe { device::Device::as_ref(dev) }
> +    }
> +}
> +
> +// SAFETY: A `Device` is always reference-counted and can be released from any thread.
> +unsafe impl Send for Device {}
> +
> +// SAFETY: `Device` can be shared among threads because all methods of `Device`
> +// (i.e. `Device<Normal>) are thread safe.
> +unsafe impl Sync for Device {}
> diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
> index 911045e32c34..bbd308b8c694 100644
> --- a/rust/kernel/device.rs
> +++ b/rust/kernel/device.rs
> @@ -68,7 +68,6 @@ pub(crate) fn as_raw(&self) -> *mut bindings::device {
>      }
>  
>      /// Returns a reference to the parent device, if any.
> -    #[expect(unused)]
>      pub(crate) fn parent(&self) -> Option<&Self> {
>          // SAFETY:
>          // - By the type invariant `self.as_raw()` is always valid.
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index de07aadd1ff5..55a8dfeece0b 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -38,6 +38,8 @@
>  pub use ffi;
>  
>  pub mod alloc;
> +#[cfg(CONFIG_AUXILIARY_BUS)]
> +pub mod auxiliary;
>  #[cfg(CONFIG_BLOCK)]
>  pub mod block;
>  #[doc(hidden)]
> -- 
> 2.49.0
> 
