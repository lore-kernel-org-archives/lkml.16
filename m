Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006DC2951B1
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 12:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744719082; cv=none; b=N9OU7tQe1dyiUcELtDeBgAMQwlSNgDf8cPE3+ZBmI1O0Fm2SqH/fvB2qhvanaesPqmcxbhgXbs3OUXbQ+Q0fjK2sYH28uEqu079mgOT+hNRyR89m3PXNrEiIYaS/1M/urPijwBqqZ4LfPXS8Fh85rBo6H53J5P/pQuvK4vjJLHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744719082; c=relaxed/simple;
	bh=npxmSflEeXX301XFSjqGTkkUcKvkacPYYcvrPCcyNqU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ILGG0uxJURam3x/ZlOPAvazx4kw/97cBFkn5TWLsNjYGOClMqR2ddN4xpAWZK052dIi+Rji5G+2qiFQbRB/5SN1OBZk0Pmy2/9e2EkaBnVf9rRP1suSY1GhE+sdcKym21zdlJKT7+qNH668wxsIEv5FtTwVGUPQW87EM7SKmUoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VT9rX9lH; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VT9rX9lH"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43efa869b0aso41463875e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 05:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744719078; x=1745323878; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0cs6tEZrhI32qLDnd2XZ2OWDLqbjW7yrnTUhiyZvTeU=;
        b=VT9rX9lHO0NQCrNy4qvBo/RLrHBysb/HQUADFJwP8sfNtdyzXOoAtr0VV5I2bJr1Ch
         dYxZnpY5F+bJX2nvaajVgDUlD1WdO/fkdRUxC2LcbFB0ZyE9POWrseER5Q2kdG/hjg5i
         QRB9iwGomUQO8ikNTTXJynBVuYxsfQ85yMKqob9d+pp72XtVTajvqukVtqSyU48zHHm0
         gh/cTVAraWr5Ct0HnBSoOTngQ9Bj0sd13K2fecYoR/3dVIMIBe19/rJGsVNiVBzVGuqi
         Zv7wUAV8F8uZ4G1i2p5VEUCQgYxFYs1234BvthFtjjLBWkreNtDzDPhmbk/amfPCOdad
         TjgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744719078; x=1745323878;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0cs6tEZrhI32qLDnd2XZ2OWDLqbjW7yrnTUhiyZvTeU=;
        b=BFmAuh0kM6cqcftx3m+Ii+k96gFi+G+nVUKDHdGosr80ur2z0MvHSUDN0EJaeveK0C
         XF3574hIQG1kBhj5IGx5DgS+T6VKv/xMNwvhhVzhA8fkXJOmy+AWeemqrmzApsChOoHg
         HorRf84McNIv0JlJqDV/anXAVAssvTfPZRSs327GkB74huUuqA/dluu3jIu743THDZlX
         cdYQpiFXkubqHczP5IR1oj6FR1VpicxaA647EANFL74jFhBGlUR5RUK0g3hJxGTfCRyn
         5CPkz7CrPOuHInOHIAH+EWw+I3KWj2WRBLS43SDm8PEoVOch2D0Z1Q0B6uQbxbx3Iqv9
         +vXw==
X-Forwarded-Encrypted: i=1; AJvYcCWO2GdY3C6yNQnyUdda723T50eXQXP+EhjndsF/VIp5Vz8JWa2QLw4Jx+zEhj8l4xYM02NPO4d9Mbk0wmE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi0VSNfPQlqZ7SpThZAibOUT6HS0hv1Wqss8HscB58q2JVTI9O
	aDlhsbYXzrPQYSoLvoaLYU9eOBLFEBpttbyZU+SagqbFIPMEwveEIeoYghCKU13AstQl3ddrMNM
	ticMAXhzwWzUo+g==
X-Google-Smtp-Source: AGHT+IFc11qpJSN9kx0m1/6vKedUiT6jLGM7Ajcb3HQxOcVN/cw7nvtJL3Ae8R08b66w5B8KI4622dqhHAESa1k=
X-Received: from wmbh17.prod.google.com ([2002:a05:600c:a111:b0:43d:1c11:4e5d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3c82:b0:43c:ebc4:36a5 with SMTP id 5b1f17b1804b1-43f3a933b99mr135834825e9.7.1744719078418;
 Tue, 15 Apr 2025 05:11:18 -0700 (PDT)
Date: Tue, 15 Apr 2025 12:11:16 +0000
In-Reply-To: <20250414131934.28418-5-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250414131934.28418-1-dakr@kernel.org> <20250414131934.28418-5-dakr@kernel.org>
Message-ID: <Z_5M5Auqj2KK-rPz@google.com>
Subject: Re: [PATCH v4 4/5] rust: auxiliary: add auxiliary registration
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, david.m.ertman@intel.com, 
	ira.weiny@intel.com, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@kernel.org, tmgross@umich.edu, 
	airlied@gmail.com, acourbot@nvidia.com, jhubbard@nvidia.com, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Apr 14, 2025 at 03:18:07PM +0200, Danilo Krummrich wrote:
> Implement the `auxiliary::Registration` type, which provides an API to
> create and register new auxiliary devices in the system.
> 
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  rust/kernel/auxiliary.rs | 88 +++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 87 insertions(+), 1 deletion(-)
> 
> diff --git a/rust/kernel/auxiliary.rs b/rust/kernel/auxiliary.rs
> index 75423737032a..b40d663b42eb 100644
> --- a/rust/kernel/auxiliary.rs
> +++ b/rust/kernel/auxiliary.rs
> @@ -5,7 +5,7 @@
>  //! C header: [`include/linux/auxiliary_bus.h`](srctree/include/linux/auxiliary_bus.h)
>  
>  use crate::{
> -    bindings, device,
> +    bindings, container_of, device,
>      device_id::RawDeviceId,
>      driver,
>      error::{to_result, Result},
> @@ -230,6 +230,18 @@ pub fn parent(&self) -> Option<&device::Device> {
>      }
>  }
>  
> +impl Device {
> +    extern "C" fn release(dev: *mut bindings::device) {
> +        // SAFETY: By the type invariant `self.0.as_raw` is a pointer to the `struct device`
> +        // embedded in `struct auxiliary_device`.
> +        let adev = unsafe { container_of!(dev, bindings::auxiliary_device, dev) }.cast_mut();

FYI, Tamir's patch makes this cast_mut() unnecessary.

> +        // SAFETY: `adev` points to the memory that has been allocated in `Registration::new`, via
> +        // `KBox::new(Opaque::<bindings::auxiliary_device>::zeroed(), GFP_KERNEL)`.
> +        let _ = unsafe { KBox::<Opaque<bindings::auxiliary_device>>::from_raw(adev.cast()) };
> +    }
> +}
> +
>  // SAFETY: `Device` is a transparent wrapper of a type that doesn't depend on `Device`'s generic
>  // argument.
>  kernel::impl_device_context_deref!(unsafe { Device });
> @@ -272,3 +284,77 @@ unsafe impl Send for Device {}
>  // SAFETY: `Device` can be shared among threads because all methods of `Device`
>  // (i.e. `Device<Normal>) are thread safe.
>  unsafe impl Sync for Device {}
> +
> +/// The registration of an auxiliary device.
> +///
> +/// This type represents the registration of a [`struct auxiliary_device`]. When an instance of this
> +/// type is dropped, its respective auxiliary device will be unregistered from the system.
> +///
> +/// # Invariants
> +///
> +/// `self.0` always holds a valid pointer to an initialized and registered
> +/// [`struct auxiliary_device`].
> +pub struct Registration(NonNull<bindings::auxiliary_device>);
> +
> +impl Registration {
> +    /// Create and register a new auxiliary device.
> +    pub fn new(parent: &device::Device, name: &CStr, id: u32, modname: &CStr) -> Result<Self> {
> +        let boxed = KBox::new(Opaque::<bindings::auxiliary_device>::zeroed(), GFP_KERNEL)?;
> +        let adev = boxed.get();
> +
> +        // SAFETY: It's safe to set the fields of `struct auxiliary_device` on initialization.
> +        unsafe {
> +            (*adev).dev.parent = parent.as_raw();
> +            (*adev).dev.release = Some(Device::release);
> +            (*adev).name = name.as_char_ptr();
> +            (*adev).id = id;
> +        }
> +
> +        // SAFETY: `adev` is guaranteed to be a valid pointer to a `struct auxiliary_device`,
> +        // which has not been initialized yet.
> +        unsafe { bindings::auxiliary_device_init(adev) };
> +
> +        // Now that `adev` is initialized, leak the `Box`; the corresponding memory will be freed
> +        // by `Device::release` when the last reference to the `struct auxiliary_device` is dropped.
> +        let _ = KBox::into_raw(boxed);
> +
> +        // SAFETY:
> +        // - `adev` is guaranteed to be a valid pointer to a `struct auxiliary_device`, which has
> +        //   been initialialized,
> +        // - `modname.as_char_ptr()` is a NULL terminated string.
> +        let ret = unsafe { bindings::__auxiliary_device_add(adev, modname.as_char_ptr()) };
> +        if ret != 0 {
> +            // SAFETY: `adev` is guaranteed to be a valid pointer to a `struct auxiliary_device`,
> +            // which has been initialialized.
> +            unsafe { bindings::auxiliary_device_uninit(adev) };

Does this error-path actually free the box?

Alice

> +            return Err(Error::from_errno(ret));
> +        }
> +
> +        // SAFETY: `adev` is guaranteed to be non-null, since the `KBox` was allocated successfully.
> +        //
> +        // INVARIANT: The device will remain registered until `auxiliary_device_delete()` is called,
> +        // which happens in `Self::drop()`.
> +        Ok(Self(unsafe { NonNull::new_unchecked(adev) }))
> +    }
> +}
> +
> +impl Drop for Registration {
> +    fn drop(&mut self) {
> +        // SAFETY: By the type invariant of `Self`, `self.0.as_ptr()` is a valid registered
> +        // `struct auxiliary_device`.
> +        unsafe { bindings::auxiliary_device_delete(self.0.as_ptr()) };
> +
> +        // This drops the reference we acquired through `auxiliary_device_init()`.
> +        //
> +        // SAFETY: By the type invariant of `Self`, `self.0.as_ptr()` is a valid registered
> +        // `struct auxiliary_device`.
> +        unsafe { bindings::auxiliary_device_uninit(self.0.as_ptr()) };
> +    }
> +}
> +
> +// SAFETY: A `Registration` of a `struct auxiliary_device` can be released from any thread.
> +unsafe impl Send for Registration {}
> +
> +// SAFETY: `Registration` does not expose any methods or fields that need synchronization.
> +unsafe impl Sync for Registration {}
> -- 
> 2.49.0
> 
