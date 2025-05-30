Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B6B22DFB6;
	Fri, 30 May 2025 17:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748626561; cv=none; b=TLoKcyxY724WQDFSuziteEF6MPw6TjDaw+u8Fyu4cWShsNGxcDCix15PnR+cfCmQcpnune+MjKsqEXp5BQKFzphyXPbdE9OcaQ3fwy0X21eYLZ3iw0baCCDjemgn8goG5bX5lwvP2qIW6ZXwBZoGbh9ub7/iwRg+yzQ2zsZdi74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748626561; c=relaxed/simple;
	bh=PFv6q/UJPqXQD2xVk0skyo4UGrMshhrpaVT5S7LYV0c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I/sEAZ37h2m0mIGcbfcpAZIHTbZ4UefyHIfx8oTjAXevL9V2K38XcLuG0zyxBkn/Axba2zbQnQgqAQhxk5A9ta2fj1nwRT117HXQtDVReSf8eCtFCf9T58RrN+J+Ntt8FC5OSRdlN535TFKzUISrk8qaJg6/NKeaFZGm42o7bso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kvQmHoB9; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kvQmHoB9"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a3771c0f8cso1430544f8f.3;
        Fri, 30 May 2025 10:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748626557; x=1749231357; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KoEqvuxgoUe5hPIlnNTREnqzBdqgdreCBHdNEn1xIzo=;
        b=kvQmHoB9LTRKAY5AEe1K9If5PwWWREwYsrBGcTCNF4F1zinC2OdbZe73TvQO5jQh8R
         UjW1X0g9m273EFAZRf8hnHoN/rHc/DnZEwJFSpjgQnxO83gyhRGky4m3w74lu6YiyC0o
         oiPbkdz9gpoQuar/Wl9xfddPWB6q6M7aJOQfcjuU0203R/Bv6JkTHjZYAeEFOcSTCyde
         d7HX0W/PqCVxpXXC5WHml2ZNeOGHjtugWkNXy9s2HDblNKphTx4ZXqw2y4HU8JDBoOtt
         7wsH6rgvlFe9JFwympiNU75T/j0/Ol78LvaZMIScKWb5nvHfOqyrVmw2o94t5p+0Wac/
         292g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748626557; x=1749231357;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KoEqvuxgoUe5hPIlnNTREnqzBdqgdreCBHdNEn1xIzo=;
        b=SUckGDjWSmn/1hkCMKKJnAz4Z8NZVBgmdC5agVeIy/xdFh5PJ1Gyy1h/F/VSILnWvW
         /CVzohfeL+/cWwCUD4xdBAV+8HzAgpzRzBQL+EmgZHalo6urGG+MAgIcIP2fsTY7y+9r
         IpNYWZ3MDZidi6AiQxmn0S+zzTJgxeTC5abLWXhVBGSjD9jM0ndga7YzkigUWZwAFqT6
         +k4X9zWBJ3uluNNp3JElXzr8A9hbo9TunpjXYamrOqa4zP7HHoY3jBCMUrOh0t1Q47Fi
         30ElxMtKSdfEBOQvVQ1XnxXG8jzrUrOVGbiXTMWBSdxumDXLggMpzsxZoMPCugm/SG3G
         SZPA==
X-Forwarded-Encrypted: i=1; AJvYcCV5oR2cpXmhkiC/Rm+NHn78DwaZxhWpr3SrZPv1BbDupN1mco79yOkBSfi71+s8a+tgTXSMwImlkmCLf1I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTcYkIMsz9hqYUmQ5Z0AUvbWdSm6/vzVCt+U60vZpG/zfbjc6q
	ISfiWbZx+uGDN2DNEP85Oy9wHTb7uTENRVVOEYFn+RLPSh7nVKxZBrtJ
X-Gm-Gg: ASbGncssIl9u24efH8A9tGIoxii52FQZKxCgSfO4TsRPiUhYjUJAsd9AWEuxu1NPJlr
	R6/sPRfWMNm/kjFPEKIah6/ZxkBdzIPs4XneZ6M7qxyPW3IBR9fFaRWwTlrJcnsQjFR0QCoSh2h
	MhgLQ38du4+JoCFA0YQ9eATthHQKkkqhSvP2kuDJrIG21wj+JHyg3vlU+/Xqk3LDH3yEpqy4PtM
	31cf1ASLiDIjZm8u4O8pffFYJILUDy+92JzoAXWSeea2fYF1NS9ylZGPqOwaxXOw3YbwB/agBfs
	HCJHr0JsDwBjQVNcc5qhqlYP9ZHwPt6rkii0nCpnCMIGQNJAiK6ZrlNpNdT6pNzK
X-Google-Smtp-Source: AGHT+IHau6iCfytZCNj9V9Tm3bsJ4JWnnOkWX8wjTyH9tcsTBrOizHj2PW/h7uxb5sRbkbkdGYpzkA==
X-Received: by 2002:a05:6000:2912:b0:3a4:f744:e013 with SMTP id ffacd0b85a97d-3a4f89d3060mr2168403f8f.30.1748626557165;
        Fri, 30 May 2025 10:35:57 -0700 (PDT)
Received: from ?IPV6:2001:871:22a:cd68::171c? ([2001:871:22a:cd68::171c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7f8f1e7sm24092335e9.1.2025.05.30.10.35.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 10:35:56 -0700 (PDT)
Message-ID: <726b746e-d2c1-4208-b2cc-d08d24abd7cf@gmail.com>
Date: Fri, 30 May 2025 19:35:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] rust: miscdevice: properly support device drivers
To: Danilo Krummrich <dakr@kernel.org>, gregkh@linuxfoundation.org,
 rafael@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250530142447.166524-1-dakr@kernel.org>
 <20250530142447.166524-6-dakr@kernel.org>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <20250530142447.166524-6-dakr@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.05.25 4:24 PM, Danilo Krummrich wrote:
> Currently, the design of MiscDeviceRegistration is focused on creating
> and registering a misc device directly from a module and hence does not
> support using misc device from a device driver.
> 
> However, it is important for the design of the misc device abstraction to
> take the driver model into account.
> 
> Hence, consider the use-case of using misc device from a device driver;
> let's go through the design motivation bottom-up:
> 
> Ideally, we want to be able to access (bus) device resources (such as I/O
> memory) from misc device callbacks (such as open() or ioctl()) without
> additional overhead, i.e. without having to go through
> Devres::try_access(), which implies an atomic check and an RCU read side
> critical section. Instead, we want to be able to use Devres::access(),
> which does not have any overhead, which requires a &Device<Bound> to
> prove that we can directly access the device resource.
> 
> Given that all misc device callbacks are synchronized against
> misc_deregister(), we can prove that the misc device's parent device is
> bound iff we guarantee that the misc device's registration won't
> out-live the parent device's unbind.
> 
> This can easily be proven by using devres for the misc device's
> registration object itself.
> 
> Since this is only applicable for the device driver use-case, abstract
> the actual registration instance with a Rust enum, which is either a
> "raw" registration or a "managed" registration.
> 
> In order to avoid any penalties from a managed registration, structurally
> separate the registration's private data from the "raw" misc device
> registration (which either stays "raw" or becomes "managed") depending
> on whether a parent device is supplied.
> 
> The advantage of this solution is that it is entirely transparent to the
> user -- no separate structures or functions for whether the abstraction
> is used directly from a module or from a device driver; instead
> MiscDeviceRegistration::register() gets an optional parent argument.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  rust/kernel/miscdevice.rs        | 178 ++++++++++++++++++++++++-------
>  samples/rust/rust_misc_device.rs |   9 +-
>  2 files changed, 143 insertions(+), 44 deletions(-)
> 
> diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
> index 1b5ec13868e2..6801fe72a8a6 100644
> --- a/rust/kernel/miscdevice.rs
> +++ b/rust/kernel/miscdevice.rs
> @@ -10,16 +10,17 @@
>  
>  use crate::{
>      bindings, container_of,
> -    device::Device,
> +    device::{Bound, Device},
> +    devres::Devres,
>      error::{to_result, Error, Result, VTABLE_DEFAULT_ERROR},
>      ffi::{c_int, c_long, c_uint, c_ulong},
>      fs::File,
>      prelude::*,
>      seq_file::SeqFile,
>      str::CStr,
> -    types::{ForeignOwnable, Opaque},
> +    types::{ARef, ForeignOwnable, Opaque},
>  };
> -use core::{marker::PhantomData, mem::MaybeUninit, pin::Pin};
> +use core::{marker::PhantomData, mem::MaybeUninit, pin::Pin, ptr::NonNull};
>  
>  /// Options for creating a misc device.
>  #[derive(Copy, Clone)]
> @@ -40,44 +41,43 @@ pub const fn into_raw<T: MiscDevice>(self) -> bindings::miscdevice {
>      }
>  }
>  
> -/// A registration of a miscdevice.
> -///
>  /// # Invariants
>  ///
> -/// `inner` is a registered misc device.
> +/// - `inner` is a registered misc device,
> +/// - `data` is valid for the entire lifetime of `Self`.
>  #[repr(C)]
>  #[pin_data(PinnedDrop)]
> -pub struct MiscDeviceRegistration<T: MiscDevice> {
> +struct RawDeviceRegistration<T: MiscDevice> {
>      #[pin]
>      inner: Opaque<bindings::miscdevice>,
> -    #[pin]
> -    data: Opaque<T::RegistrationData>,
> +    data: NonNull<T::RegistrationData>,
>      _t: PhantomData<T>,
>  }
>  
> -// SAFETY:
> -// - It is allowed to call `misc_deregister` on a different thread from where you called
> -//   `misc_register`.
> -// - Only implements `Send` if `MiscDevice::RegistrationData` is also `Send`.
> -unsafe impl<T: MiscDevice> Send for MiscDeviceRegistration<T> where T::RegistrationData: Send {}
> -
> -// SAFETY:
> -// - All `&self` methods on this type are written to ensure that it is safe to call them in
> -//   parallel.
> -// - `MiscDevice::RegistrationData` is always `Sync`.
> -unsafe impl<T: MiscDevice> Sync for MiscDeviceRegistration<T> {}
> -
> -impl<T: MiscDevice> MiscDeviceRegistration<T> {
> -    /// Register a misc device.
> -    pub fn register(
> +impl<T: MiscDevice> RawDeviceRegistration<T> {
> +    fn new<'a>(
>          opts: MiscDeviceOptions,
> -        data: impl PinInit<T::RegistrationData, Error>,
> -    ) -> impl PinInit<Self, Error> {
> +        parent: Option<&'a Device<Bound>>,
> +        data: &'a T::RegistrationData,
> +    ) -> impl PinInit<Self, Error> + 'a
> +    where
> +        T: 'a,
> +    {
>          try_pin_init!(Self {
> -            data <- Opaque::pin_init(data),
> +            // INVARIANT: `Self` is always embedded in a `MiscDeviceRegistration<T>`, hence `data`
> +            // is guaranteed to be valid for the entire lifetime of `Self`.
> +            data: NonNull::from(data),
>              inner <- Opaque::try_ffi_init(move |slot: *mut bindings::miscdevice| {
> +                let mut value = opts.into_raw::<T>();
> +
> +                if let Some(parent) = parent {
> +                    // The device core code will take care to take a reference of `parent` in
> +                    // `device_add()` called by `misc_register()`.
> +                    value.parent = parent.as_raw();
> +                }
> +
>                  // SAFETY: The initializer can write to the provided `slot`.
> -                unsafe { slot.write(opts.into_raw::<T>()) };
> +                unsafe { slot.write(value) };
>  
>                  // SAFETY:
>                  // * We just wrote the misc device options to the slot. The miscdevice will
> @@ -94,12 +94,12 @@ pub fn register(
>      }
>  
>      /// Returns a raw pointer to the misc device.
> -    pub fn as_raw(&self) -> *mut bindings::miscdevice {
> +    fn as_raw(&self) -> *mut bindings::miscdevice {
>          self.inner.get()
>      }
>  
>      /// Access the `this_device` field.
> -    pub fn device(&self) -> &Device {
> +    fn device(&self) -> &Device {
>          // SAFETY: This can only be called after a successful register(), which always
>          // initialises `this_device` with a valid device. Furthermore, the signature of this
>          // function tells the borrow-checker that the `&Device` reference must not outlive the
> @@ -108,6 +108,108 @@ pub fn device(&self) -> &Device {
>          unsafe { Device::as_ref((*self.as_raw()).this_device) }
>      }
>  
> +    fn data(&self) -> &T::RegistrationData {
> +        // SAFETY: The type invariant guarantees that `data` is valid for the entire lifetime of
> +        // `Self`.
> +        unsafe { self.data.as_ref() }
> +    }
> +}
> +
> +#[pinned_drop]
> +impl<T: MiscDevice> PinnedDrop for RawDeviceRegistration<T> {
> +    fn drop(self: Pin<&mut Self>) {
> +        // SAFETY: We know that the device is registered by the type invariants.
> +        unsafe { bindings::misc_deregister(self.inner.get()) };
> +    }> +}
> +
> +#[expect(dead_code)]
> +enum DeviceRegistrationInner<T: MiscDevice> {
> +    Raw(Pin<KBox<RawDeviceRegistration<T>>>),
> +    Managed(Devres<RawDeviceRegistration<T>>),
> +}
> +
> +/// A registration of a miscdevice.
> +#[pin_data(PinnedDrop)]
> +pub struct MiscDeviceRegistration<T: MiscDevice> {
> +    inner: DeviceRegistrationInner<T>,
> +    #[pin]
> +    data: Opaque<T::RegistrationData>,
> +    this_device: ARef<Device>,
> +    _t: PhantomData<T>,
> +}
> +
> +// SAFETY:
> +// - It is allowed to call `misc_deregister` on a different thread from where you called
> +//   `misc_register`.
> +// - Only implements `Send` if `MiscDevice::RegistrationData` is also `Send`.
> +unsafe impl<T: MiscDevice> Send for MiscDeviceRegistration<T> where T::RegistrationData: Send {}
> +
> +// SAFETY:
> +// - All `&self` methods on this type are written to ensure that it is safe to call them in
> +//   parallel.
> +// - `MiscDevice::RegistrationData` is always `Sync`.
> +unsafe impl<T: MiscDevice> Sync for MiscDeviceRegistration<T> {}
> +
> +impl<T: MiscDevice> MiscDeviceRegistration<T> {
> +    /// Register a misc device.
> +    pub fn register<'a>(
> +        opts: MiscDeviceOptions,
> +        data: impl PinInit<T::RegistrationData, Error> + 'a,
> +        parent: Option<&'a Device<Bound>>,
> +    ) -> impl PinInit<Self, Error> + 'a
> +    where
> +        T: 'a,
> +    {
> +        let mut dev: Option<ARef<Device>> = None;
> +
> +        try_pin_init!(&this in Self {
> +            data <- Opaque::pin_init(data),
> +            // TODO: make `inner` in-place when enums get supported by pin-init.
> +            //
> +            // Link: https://github.com/Rust-for-Linux/pin-init/issues/59
> +            inner: {
> +                // SAFETY:
> +                //   - `this` is a valid pointer to `Self`,
> +                //   - `data` was properly initialized above.
> +                let data = unsafe { &*(*this.as_ptr()).data.get() };
> +
> +                let raw = RawDeviceRegistration::new(opts, parent, data);
> +
> +                // FIXME: Work around a bug in rustc, to prevent the following warning:
> +                //
> +                //   "warning: value captured by `dev` is never read."
> +                //
> +                // Link: https://github.com/rust-lang/rust/issues/141615
> +                let _ = dev;
> +
> +                if let Some(parent) = parent {
> +                    let devres = Devres::new(parent, raw, GFP_KERNEL)?;
> +
> +                    dev = Some(devres.access(parent)?.device().into());
> +                    DeviceRegistrationInner::Managed(devres)
> +                } else {
> +                    let boxed = KBox::pin_init(raw, GFP_KERNEL)?;
> +
> +                    dev = Some(boxed.device().into());
> +                    DeviceRegistrationInner::Raw(boxed)
> +                }
> +            },
> +            // Cache `this_device` within `Self` to avoid having to access `Devres` in the managed
> +            // case.
> +            this_device: {
> +                // SAFETY: `dev` is guaranteed to be set in the initializer of `inner` above.
> +                unsafe { dev.unwrap_unchecked() }
> +            },
> +            _t: PhantomData,
> +        })
> +    }
> +
> +    /// Access the `this_device` field.
> +    pub fn device(&self) -> &Device {
> +        &self.this_device
> +    }
> +
>      /// Access the additional data stored in this registration.
>      pub fn data(&self) -> &T::RegistrationData {
>          // SAFETY:
> @@ -120,9 +222,6 @@ pub fn data(&self) -> &T::RegistrationData {
>  #[pinned_drop]
>  impl<T: MiscDevice> PinnedDrop for MiscDeviceRegistration<T> {
>      fn drop(self: Pin<&mut Self>) {
> -        // SAFETY: We know that the device is registered by the type invariants.
> -        unsafe { bindings::misc_deregister(self.inner.get()) };
> -
>          // SAFETY: `self.data` is valid for dropping.
>          unsafe { core::ptr::drop_in_place(self.data.get()) };

I think this can race for a use after free.
The data gets freed in this `Drop` impl but the `miscdevice_deregister` call will only
happen in the `DeviceRegistrationInner` `Drop` implementatation, since the fields 
will only be dropped after the `drop` function has executed.

Either  inner: DeviceRegistrationInner<T> needs to be wrapped in a ManuallyDrop and
dropped manually,
or the Data needs to be wrapped in a type that will automatically drop it (this would
be fine with `UnsafePinned`).


>      }
> @@ -137,14 +236,13 @@ pub trait MiscDevice: Sized {
>      /// The additional data carried by the [`MiscDeviceRegistration`] for this [`MiscDevice`].
>      /// If no additional data is required than the unit type `()` should be used.
>      ///
> -    /// This data can be accessed in [`MiscDevice::open()`] using
> -    /// [`MiscDeviceRegistration::data()`].
> +    /// This data can be accessed in [`MiscDevice::open()`].
>      type RegistrationData: Sync;
>  
>      /// Called when the misc device is opened.
>      ///
>      /// The returned pointer will be stored as the private data for the file.
> -    fn open(_file: &File, _misc: &MiscDeviceRegistration<Self>) -> Result<Self::Ptr>;
> +    fn open(_file: &File, _misc: &Device, _data: &Self::RegistrationData) -> Result<Self::Ptr>;
>  
>      /// Called when the misc device is released.
>      fn release(device: Self::Ptr, _file: &File) {
> @@ -217,17 +315,17 @@ impl<T: MiscDevice> MiscdeviceVTable<T> {
>          // SAFETY:
>          // * `misc_open()` ensures that the `struct miscdevice` can't be unregistered and freed
>          //   during this call to `fops_open`.
> -        // * The `misc_ptr` always points to the `inner` field of a `MiscDeviceRegistration<T>`.
> -        // * The `MiscDeviceRegistration<T>` is valid until the `struct miscdevice` was
> +        // * The `misc_ptr` always points to the `inner` field of a `RawDeviceRegistration<T>`.
> +        // * The `RawDeviceRegistration<T>` is valid until the `struct miscdevice` was
>          //   unregistered.
> -        let registration = unsafe { &*container_of!(misc_ptr, MiscDeviceRegistration<T>, inner) };
> +        let registration = unsafe { &*container_of!(misc_ptr, RawDeviceRegistration<T>, inner) };
>  
>          // SAFETY:
>          // * This underlying file is valid for (much longer than) the duration of `T::open`.
>          // * There is no active fdget_pos region on the file on this thread.
>          let file = unsafe { File::from_raw_file(raw_file) };
>  
> -        let ptr = match T::open(file, registration) {
> +        let ptr = match T::open(file, registration.device(), registration.data()) {
>              Ok(ptr) => ptr,
>              Err(err) => return err.to_errno(),
>          };
> diff --git a/samples/rust/rust_misc_device.rs b/samples/rust/rust_misc_device.rs
> index 843442b0ea1d..b60fd063afa8 100644
> --- a/samples/rust/rust_misc_device.rs
> +++ b/samples/rust/rust_misc_device.rs
> @@ -198,7 +198,8 @@ fn init(_module: &'static ThisModule) -> impl PinInit<Self, Error> {
>          try_pin_init!(Self {
>              _miscdev <- MiscDeviceRegistration::register(
>                  options,
> -                Arc::pin_init(new_mutex!(Inner { value: 0_i32 }), GFP_KERNEL)
> +                Arc::pin_init(new_mutex!(Inner { value: 0_i32 }), GFP_KERNEL),
> +                None,
>              ),
>          })
>      }
> @@ -222,15 +223,15 @@ impl MiscDevice for RustMiscDevice {
>  
>      type RegistrationData = Arc<Mutex<Inner>>;
>  
> -    fn open(_file: &File, misc: &MiscDeviceRegistration<Self>) -> Result<Pin<KBox<Self>>> {
> -        let dev = ARef::from(misc.device());
> +    fn open(_file: &File, misc: &Device, data: &Self::RegistrationData) -> Result<Pin<KBox<Self>>> {
> +        let dev = ARef::from(misc);
>  
>          dev_info!(dev, "Opening Rust Misc Device Sample\n");
>  
>          KBox::try_pin_init(
>              try_pin_init! {
>                  RustMiscDevice {
> -                    shared: misc.data().clone(),
> +                    shared: data.clone(),
>                      unique <- new_mutex!(Inner { value: 0_i32 }),
>                      dev: dev,
>                  }

