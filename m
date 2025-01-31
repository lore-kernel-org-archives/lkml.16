Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7FF17C225
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 10:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738317729; cv=none; b=X5He8rtcLwctckGM4kvc/EEHsDUBEDSUR2Ochs//n2SWxcTpqZk0iLFLd+q2fB+J3dG/y/YXhtdLNukj68rtwXStRAvgZDaUZ4+XaM8ZSMiF8/1kHcOM2AZ36ed1tiyzPi9S3Zz+voxqF1Cm/0LtbTV9Rlrm8BGTV6aSt3qc9LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738317729; c=relaxed/simple;
	bh=jIkGB7/X0ONGNq6a38B5cDa4Qlz0ARCWTcPRiP3B7Jg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LZAbz408r8m0SveBBHpsYaC7l06xXWD/emF0KzUx6hZL5M6LMLh5pH1A4SF/NB5oQSVWmGtGrZsi3SI4Niy/rT0o7saXhfU2nxJjLzXrx/02NdKuDyMwpYr+PIqoofIsPXEItcOYd6UisQnn+jEgngQDZ28FSQvsogYvKS0IHjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev; spf=none smtp.mailfrom=sedlak.dev; dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b=H7i8XLpe; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b="H7i8XLpe"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4361b0ec57aso18208515e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 02:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sedlak-dev.20230601.gappssmtp.com; s=20230601; t=1738317726; x=1738922526; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TH+Mf8SIqLxWTfJTWY/h5Gp4AzULl9OECEnQGSHygnE=;
        b=H7i8XLpe2Fbz5zbF9vHavYO7zQBU83gH92c5ubZEEkK92YUD7O6BmYqgbQQtZLK/C+
         LPerDyYZx8vGLPzpS94J4TTRv3dUddflJd91GVVw/5C4MbjpImBti8SLqlvld1J/FkFu
         iOVpsYmsUSZXcx/Xg+CUtBVgOHijV193D/y4XoE+79e1Usy/1RxDufdJ8WW24s3NQ1O9
         Yal3osFCu8Wukc3Y228f280gyRUrO2wlWlkMGUFy3qsgS3iZBXoMG796hmcpSzTGOtFF
         2ReN16CCdYgcPEPypQ4VwMX1dWfq5eWj1vpgBp+VOlnHY95ejunfWC1niddUM7xs1jkZ
         7Opg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738317726; x=1738922526;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TH+Mf8SIqLxWTfJTWY/h5Gp4AzULl9OECEnQGSHygnE=;
        b=rnw+zpNZClsjd2nDStHf2CZOV8nz545rhDSswUc2F6hRBAIePgrYCNuqyPiFwPOLj7
         uCDE4eAP/dbwRJsvpo+7xf3j56YrxguGrDSzNw4SjZmqXeeT8ML3oHmTmux5c6cHO0Sc
         tKNM96+xw2ap3am0bLnKdDQvJ83Qhdv0CGMS89IW2vN/WE9KhwbaJ1AhRuJNoD9Cw+s4
         Xk02xJeXWsn9kI5mEmF3gS0KlaoUjKM1Lshi59mf1jgLyaWNvS7JVvUSCd2XhJ3OLa7W
         NpVxUteghLWRE5ooQA6n1xLxVVoa8qFotZre4hDLg15LBTCqTpNyvrBqRoGSSX6s6+Wr
         DcNA==
X-Forwarded-Encrypted: i=1; AJvYcCW9rdK36lhGllw+7DC9hs50YjA+3QJ9Ignmnll1UyimQ8QJx3I1y5nXjl1vigOb7HPkHwWysV3Yqwq7dus=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCKqS6W6U9CIqwbHCJlwXOrzLn3ir3qmpgUERXmLEcT6V5ooFd
	xTnA5LnopKA72ler+iAzrxPfX5j2sVLZVeBUPKhFdUpU3kLsrx1q4BojMd+8fhg=
X-Gm-Gg: ASbGncu90vDZlOpWkUFqkSVa+UWShb9k6B1n1+wh9Xt8kyuqmAdYp1MGYo/JAw9IE6U
	IlIT5I3EVKTQbL2L52aYueL/xcjojIx7/kODkmBUU2dVyz3YPnZcVZYc+2P5GEfkpaYFX0rXgm4
	mGndk5Rd01hyCOWIyptHiROqvJkblhtwGquH45jPwfCh2lkJxWwni/u8VELDm+VNTIsT6sboocB
	4tjhG0qhWC6wXGpA8dbH25DtukUvwf/n8wH3453H2HnusslVTCnd23Hi5ddl7q5uDYOV9KZOI/S
	xq9PTVIiU9KhMsV9
X-Google-Smtp-Source: AGHT+IHcc+zMs1dK6kkPPsRpkyp1nUSSMDTtFQjCju0jQZMIs0GgDN1MFSsFD4ROUOsC9xtlxzKS0Q==
X-Received: by 2002:adf:e6cf:0:b0:38b:f04c:25e6 with SMTP id ffacd0b85a97d-38c519447bdmr7403096f8f.14.1738317725338;
        Fri, 31 Jan 2025 02:02:05 -0800 (PST)
Received: from [192.168.88.249] ([95.85.217.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1b574fsm4215864f8f.70.2025.01.31.02.02.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 02:02:04 -0800 (PST)
Message-ID: <0623e789-ff5d-4d6f-a73a-7d514e0dc6d7@sedlak.dev>
Date: Fri, 31 Jan 2025 11:02:03 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] rust: io: add resource abstraction
To: Daniel Almeida <daniel.almeida@collabora.com>, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.mco, benno.lossin@proton.me, a.hindborg@kernel.org,
 aliceryhl@google.com, tmgross@umich.edu, gregkh@linuxfoundation.org,
 rafael@kernel.org, dakr@kernel.org, boris.brezillon@collabora.com,
 robh@kernel.org
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 Fiona Behrens <me@kloenk.dev>
References: <20250130220529.665896-1-daniel.almeida@collabora.com>
 <20250130220529.665896-2-daniel.almeida@collabora.com>
Content-Language: en-US
From: Daniel Sedlak <daniel@sedlak.dev>
In-Reply-To: <20250130220529.665896-2-daniel.almeida@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 1/30/25 11:05 PM, Daniel Almeida wrote:

> +/// Returns a reference to the global `iomem_resource` variable.
> +pub fn iomem_resource() -> &'static Resource {
> +    // SAFETY: `bindings::iomem_resoure` has global lifetime and is of type Resource.
> +    unsafe { Resource::from_ptr(core::ptr::addr_of_mut!(bindings::iomem_resource)) }
> +}
> +
> +/// Resource Size type.
> +/// This is a type alias to `u64`
> +/// depending on the config option `CONFIG_PHYS_ADDR_T_64BIT`.

The comment seems weirdly formatted, shouldn't it be rather:

/// Resource size type. This is a type alias to `u64`
/// depending on the config option `CONFIG_PHYS_ADDR_T_64BIT`.

or

/// Resource size type.
///
/// This is a type alias to `u64` depending on the config
/// option `CONFIG_PHYS_ADDR_T_64BIT`.

> +#[cfg(CONFIG_PHYS_ADDR_T_64BIT)]
> +pub type ResourceSize = u64;
> +
> +/// Resource Size type.
> +/// This is a type alias to `u32`
> +/// depending on the config option `CONFIG_PHYS_ADDR_T_64BIT`.

Similar to the previous one.

> +#[cfg(not(CONFIG_PHYS_ADDR_T_64BIT))]
> +pub type ResourceSize = u32;
> +
> +/// A region allocated from a parent resource.
> +///
> +/// # Invariants
> +/// - `self.0` points to a valid `bindings::resource` that was obtained through
> +/// `__request_region`.

Shouldn't be there an extra newline after # Invariants, to be consistent 
with others in the patch?

> +pub struct Region(NonNull<bindings::resource>);
> +
> +impl Deref for Region {
> +    type Target = Resource;
> +
> +    fn deref(&self) -> &Self::Target {
> +        // SAFETY: Safe as per the invariant of `Region`
> +        unsafe { Resource::from_ptr(self.0.as_ptr()) }
> +    }
> +}
> +
> +impl Drop for Region {
> +    fn drop(&mut self) {
> +        // SAFETY: Safe as per the invariant of `Region`
> +        let res = unsafe { Resource::from_ptr(self.0.as_ptr()) };
> +        let flags = res.flags();
> +
> +        let release_fn = if flags.contains(flags::IORESOURCE_MEM) {
> +            bindings::release_mem_region
> +        } else {
> +            bindings::release_region
> +        };
> +
> +        // SAFETY: Safe as per the invariant of `Region`
> +        unsafe { release_fn(res.start(), res.size()) };
> +    }
> +}
> +
> +// SAFETY: `Region` only holds a pointer to a C `struct resource`, which is safe to be used from
> +// any thead.

typo thead -> thread
> +unsafe impl Send for Region {}
> +
> +// SAFETY: `Region` only holds a pointer to a C `struct resource`, references to which are
> +// safe to be used from any thead.

typo thead -> thread

> +unsafe impl Sync for Region {}
> +
> +/// A resource abstraction.
> +///
> +/// # Invariants
> +///
> +/// `Resource` is a transparent wrapper around a valid `bindings::resource`.
> +#[repr(transparent)]
> +pub struct Resource(Opaque<bindings::resource>);
> +
> +impl Resource {
> +    /// Creates a reference to a [`Resource`] from a valid pointer.
> +    ///
> +    /// # Safety
> +    ///
> +    /// The caller must ensure that for the duration of 'a, the pointer will
> +    /// point at a valid `bindings::resource`
> +    ///
> +    /// The caller must also ensure that the `Resource` is only accessed via the
> +    /// returned reference for the duration of 'a.
> +    pub(crate) const unsafe fn from_ptr<'a>(ptr: *mut bindings::resource) -> &'a Self {
> +        // SAFETY: Self is a transparent wrapper around `Opaque<bindings::resource>`.
> +        unsafe { &*ptr.cast() }
> +    }
> +
> +    /// A helper to abstract the common pattern of requesting a region.
> +    fn request_region_checked(
> +        &self,
> +        start: ResourceSize,
> +        size: ResourceSize,
> +        name: &CStr,
> +        request_fn: RequestFn,
> +    ) -> Option<Region> {
> +        // SAFETY: Safe as per the invariant of `Resource`
> +        let region = unsafe { request_fn(start, size, name.as_char_ptr()) };
> +
> +        Some(Region(NonNull::new(region)?))
> +    }
> +
> +    /// Requests a resource region.
> +    ///
> +    /// Exclusive access will be given and the region will be marked as busy.
> +    /// Further calls to `request_region` will return `None` if the region, or a
> +    /// part of it, is already in use.
> +    pub fn request_region(
> +        &self,
> +        start: ResourceSize,
> +        size: ResourceSize,
> +        name: &CStr,
> +    ) -> Option<Region> {
> +        self.request_region_checked(start, size, name, bindings::request_region)
> +    }
> +
> +    /// Requests a resource region with the IORESOURCE_MUXED flag.

formatting: IORESOURCE_MUXED -> `IORESOURCE_MUXED`

> +    ///
> +    /// Exclusive access will be given and the region will be marked as busy.
> +    /// Further calls to `request_region` will return `None` if the region, or a
> +    /// part of it, is already in use.
> +    pub fn request_muxed_region(
> +        &self,
> +        start: ResourceSize,
> +        size: ResourceSize,
> +        name: &CStr,
> +    ) -> Option<Region> {
> +        self.request_region_checked(start, size, name, bindings::request_muxed_region)
> +    }
> +
> +    /// Requests a memory resource region, i.e.: a resource of type
> +    /// IORESOURCE_MEM.

formatting: IORESOURCE_MEM -> `IORESOURCE_MEM`

> +    ///
> +    /// Exclusive access will be given and the region will be marked as busy.
> +    /// Further calls to `request_region` will return `None` if the region, or a
> +    /// part of it, is already in use.
> +    pub fn request_mem_region(
> +        &self,
> +        start: ResourceSize,
> +        size: ResourceSize,
> +        name: &CStr,
> +    ) -> Option<Region> {
> +        self.request_region_checked(start, size, name, bindings::request_mem_region)
> +    }
> +
> +    /// Returns the size of the resource.
> +    pub fn size(&self) -> ResourceSize {
> +        let inner = self.0.get();
> +        // SAFETY: safe as per the invariants of `Resource`
> +        unsafe { bindings::resource_size(inner) }
> +    }
> +
> +    /// Returns the start address of the resource.
> +    pub fn start(&self) -> u64 {

Should the address be of type `usize`?

> +        let inner = self.0.get();
> +        // SAFETY: safe as per the invariants of `Resource`
> +        unsafe { *inner }.start
> +    }
> +
> +    /// Returns the name of the resource.
> +    pub fn name(&self) -> &CStr {
> +        let inner = self.0.get();
> +        // SAFETY: safe as per the invariants of `Resource`
> +        unsafe { CStr::from_char_ptr((*inner).name) }
> +    }
> +
> +    /// Returns the flags associated with the resource.
> +    pub fn flags(&self) -> Flags {
> +        let inner = self.0.get();
> +        // SAFETY: safe as per the invariants of `Resource`
> +        let flags = unsafe { *inner }.flags;
> +
> +        Flags(flags)
> +    }
> +}
> +
> +// SAFETY: `Resource` only holds a pointer to a C `struct resource`, which is safe to be used from
> +// any thead.

typo: thead -> thread

> +unsafe impl Send for Resource {}
> +
> +// SAFETY: `Resource` only holds a pointer to a C `struct resource`, references to which are
> +// safe to be used from any thead.

typo: thead -> thread

> +unsafe impl Sync for Resource {}
> +
> +/// Resource flags as stored in the C `struct resource::flags` field.
> +///
> +/// They can be combined with the operators `|`, `&`, and `!`.
> +///
> +/// Values can be used from the [`flags`] module.
> +#[derive(Clone, Copy, PartialEq)]
> +pub struct Flags(u64);
> +
> +impl Flags {
> +    /// Check whether `flags` is contained in `self`.
> +    pub fn contains(self, flags: Flags) -> bool {
> +        (self & flags) == flags
> +    }
> +}
> +
> +impl core::ops::BitOr for Flags {
> +    type Output = Self;
> +    fn bitor(self, rhs: Self) -> Self::Output {
> +        Self(self.0 | rhs.0)
> +    }
> +}
> +
> +impl core::ops::BitAnd for Flags {
> +    type Output = Self;
> +    fn bitand(self, rhs: Self) -> Self::Output {
> +        Self(self.0 & rhs.0)
> +    }
> +}
> +
> +impl core::ops::Not for Flags {
> +    type Output = Self;
> +    fn not(self) -> Self::Output {
> +        Self(!self.0)
> +    }
> +}
> +
> +/// Resource flags as stored in the `struct resource::flags` field.
> +pub mod flags {
> +    use super::Flags;
> +
> +    /// PCI/ISA I/O ports

formatting: period at the end

> +    pub const IORESOURCE_IO: Flags = Flags(bindings::IORESOURCE_IO as u64);
> +
> +    /// Resource is software muxed.
> +    pub const IORESOURCE_MUXED: Flags = Flags(bindings::IORESOURCE_MUXED as u64);
> +
> +    /// Resource represents a memory region.
> +    pub const IORESOURCE_MEM: Flags = Flags(bindings::IORESOURCE_MEM as u64);
> +}

	Daniel
