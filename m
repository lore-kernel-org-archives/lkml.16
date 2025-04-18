Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3798A20767E;
	Fri, 18 Apr 2025 13:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744983226; cv=none; b=X4/aDLZ7c0ZafZLEp9oKNnKzQDttG+dZyhADm6CSEj/PqbrFtOPSiDbnjm+ix9tVECIZYrhdrwyR7bvFFVD+3ECOASFyl1TKuAgppMXU0RqhA8H8N/QhGIjf47pG0JxzXxjzzi1UmMYZs9DmlIoZE+TfQ/W2pbqJm9xVTG2syaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744983226; c=relaxed/simple;
	bh=3Z4YnHM43VypcaF4kkDkg1YapNVsfZNI9IyDQF8iwss=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n4wBesDaB19ttEDLhkqmHFBfnrRSaMnJd4zkOEmVTgamLKK+YREw6XcCuIs3r6XVABn6ZqqaLWpE4LoWT4Q0/dfRUXuW3GpOw84IQ1rcxB603znnpRe8NB97TYcNrpBTrXKInjGpJJMAwojvgp1ODwKc7g8I9iCB9UN8mKe2PGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PpyLvpRd; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PpyLvpRd"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso16106825e9.0;
        Fri, 18 Apr 2025 06:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744983222; x=1745588022; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cymBwHPYpEJEkaRMP6s4Kg37tPDaEt+/oHljHuUzLVw=;
        b=PpyLvpRdhZ5xvOXEvSMaOytVV3Mmx7w5TNmM663n/KiAXUNTM8tuD+vr9GUeqaWM0X
         2Xd9W4PHKEt8uudH8QCDAlqEjcuQpCle8X/PjlsDvpR2bb1kG/GeaJn+GOVK88KsPgPj
         JaYHkp7FiiuShHoyL6WRufuxHoZJVnCh0tKsyL5zkH+wnMhMWXLBVP5wDpl40Aaa4hqP
         QVmktoDXRjcS1uH7fCMEsW04UpihjIYUC7wFA4WY/6Y0cBlrjZJeIG20NwrmhG52+up5
         O5x53ItXO02Ip5MxpE9T2ZR44T2Z2oOmdj+r3DYXDykrN/FmsLKkcQuFHDp4/CY+Aj5T
         gsYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744983222; x=1745588022;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cymBwHPYpEJEkaRMP6s4Kg37tPDaEt+/oHljHuUzLVw=;
        b=rO3dSGSuYRCeZteMQPbPydBq5Rmhke7Fu4IQJHjzAeQaJmaWd30mZrEDECqHLGHLTt
         i9+/ilQqwmUpfaRuDA4HBAgiX5Ul7ytyLlgod2AnXbOW2Dgj46SOF60sImoE9sirjAAL
         3Y9HQyIU+ovZiRt1zm5q/1yysqWOs7PqcU44VNIGkbz0p2JeJfkDLGncrH9Spuuzxpl3
         zJO/9kPcto7XDbMawVzCNDBkcecMf84MdD8pPYMCL+iC7OFM5+OryLoZn/k9XIESUSsk
         tlvlmH4EZ2K2jqcJUDySuOgrH5KLVtd+DzpWoyzzzQJCZKh3IhfrcVY90etv+d8fb/YO
         o0Ug==
X-Forwarded-Encrypted: i=1; AJvYcCV6U3Kb6xS6NADM5b0e+BJIVNNxQGw4LzacoPm0jYhTVnrP36NVJH75el2JZ9s8s5ykEZ0Z/kHxKt3LecHgqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YztOnCsBi8b+ojEjKzZTA8lwBi7SQIGf8NEjuGF29gsD/Afj9qf
	77W/Ajv42h8+urrIw0lZKi2BO9HHqYrezv0F3FfLdYVfeZBHdrsH
X-Gm-Gg: ASbGncuFgjtrqlnFpNhmNX7GX5uMVc4yUVbRzITmKL+6wTjYGBRR34gsc9czqhQjh7m
	jFRzj6KczrWqeIEh5suk0ZEaVWBwv2PPyg9QCqwc7lwBBahrSPEhJhc+9Yz+BbxELJdBw9sPwol
	weCdM9XsoL/CSO1+VE4A2yz8+vTKuKsjaPwD4ofv88dpJQ49zrZOPpyaGdlv+B6LcR5dPZbCfiW
	8BGU98N61frQ9RFCqVqX390GKINSKvukQTwjpYZuceDuHUsTHEPX8VeUA/yYk8UJGxuRRx7LJh/
	xy+p79M7l6WxWmmeRhsO3BoYiCkFuDIsObXLG0G31K4Kg1SpMem+hA==
X-Google-Smtp-Source: AGHT+IHBVrFm2ZwSGihGjuXl8gvgQdefinioA2Zg9indXx/RiKOxWd0H/obTDd6YQ/hlmhy8Gkh+XQ==
X-Received: by 2002:a05:600c:1554:b0:43c:fdbe:43be with SMTP id 5b1f17b1804b1-4406ac115e0mr22992475e9.27.1744983222143;
        Fri, 18 Apr 2025 06:33:42 -0700 (PDT)
Received: from ?IPV6:2001:871:22a:99c5::1ad1? ([2001:871:22a:99c5::1ad1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa43cb43sm2833495f8f.53.2025.04.18.06.33.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 06:33:41 -0700 (PDT)
Message-ID: <75b94302-e6ca-431d-95de-044af3061839@gmail.com>
Date: Fri, 18 Apr 2025 15:33:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] rust: add UnsafePinned type
To: Benno Lossin <benno.lossin@proton.me>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20250418-rust_unsafe_pinned-v1-1-c4c7558399f8@gmail.com>
 <D99SR99KSGLV.3TUC5AEKPHJHL@proton.me>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <D99SR99KSGLV.3TUC5AEKPHJHL@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.04.25 3:25 PM, Benno Lossin wrote:
> On Fri Apr 18, 2025 at 2:21 PM CEST, Christian Schrefl wrote:
>> `UnsafePinned<T>` is useful for cases where a value might be shared with C
>> code but not directly used by it. In particular this is added for
>> storing additional data in the `MiscDeviceRegistration` which will be
>> shared between `fops->open` and the containing struct.
>>
>> Similar to `Opaque` but guarantees that the value is always initialized
>> and that the inner value is dropped when `UnsafePinned` is dropped.
>>
>> This was originally proposed for the IRQ abstractions [0] and is also
>> useful for other where the inner data may be aliased, but is always valid
>> and automatic `Drop` is desired.
>>
>> Since then the `UnsafePinned` type was added to upstream Rust [1] as a
>> unstable feature, therefore this patch implements the subset required
>> for additional data in `MiscDeviceRegistration` on older rust versions
>> and using the upstream type on new rust versions which include this
>> feature.
>>
>> Some differences to the upstream type definition are required in the
>> kernel implementation, because upstream type uses some compiler changes
>> to opt out of certain optimizations, this is documented in a comment on
>> the `UnsafePinned` type.
>>
>> The documentation on is based on the upstream rust documentation with
>> minor modifications.
>>
>> Link: https://lore.kernel.org/rust-for-linux/CAH5fLgiOASgjoYKFz6kWwzLaH07DqP2ph+3YyCDh2+gYqGpABA@mail.gmail.com [0]
>> Link: https://github.com/rust-lang/rust/pull/137043 [1]
>> Suggested-by: Alice Ryhl <aliceryhl@google.com>
>> Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>
> 
> This probably is another patch by itself, but we should use
> `UnsafePinned` in `Opaque` instead of re-implementing it there. Feel
> free to open an issue, send a patch or let me open an issue.

I'll take a look at it once this patch has landed if you want
or I might include that as a second Patch for a future version.

>> ---
>> This patch is mostly to show how the upstream `UnsafePinned`
>> Rust type can be used once it is stable.
>>
>> It is probalby not desired to use the unstable feature before
>> that time.
> 
> Yeah, we don't want to introduce new unstable features where possible.
> If this one is stabilized quickly, then we should add it, but if not,
> then we just keep the manual implementation.

My plan was for this RFC to demonstrate the usage of vendored and upsteam
`UnsafePinned`, with a (not RFC) patch that just adds the vendored
implementation.  

> 
>>
>> To test using the upsteam implementation a fairly new nightly
>> rust version is required.
>>
>> Tested with rustc 1.88.0-nightly (78f2104e3 2025-04-16) and
>> rustc 1.78.0 (9b00956e5 2024-04-29).
>> ---
>>  init/Kconfig                       |  3 ++
>>  rust/kernel/lib.rs                 |  1 +
>>  rust/kernel/types.rs               | 34 ++++++++++++++
>>  rust/kernel/types/unsafe_pinned.rs | 90 ++++++++++++++++++++++++++++++++++++++
>>  4 files changed, 128 insertions(+)
> 
>> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
>> index 9d0471afc9648f2973235488b441eb109069adb1..c4e234d5c07168295499c2a8fccc70e00e83e7ca 100644
>> --- a/rust/kernel/types.rs
>> +++ b/rust/kernel/types.rs
>> @@ -253,6 +253,9 @@ fn drop(&mut self) {
>>  ///
>>  /// [`Opaque<T>`] is meant to be used with FFI objects that are never interpreted by Rust code.
>>  ///
>> +/// In cases where the contained data is only used by Rust, is not allowed to be
>> +/// uninitialized and automatic [`Drop`] is desired [`UnsafePinned`] should be used instead.
>> +///
>>  /// It is used to wrap structs from the C side, like for example `Opaque<bindings::mutex>`.
>>  /// It gets rid of all the usual assumptions that Rust has for a value:
>>  ///
>> @@ -578,3 +581,34 @@ pub enum Either<L, R> {
>>  /// [`NotThreadSafe`]: type@NotThreadSafe
>>  #[allow(non_upper_case_globals)]
>>  pub const NotThreadSafe: NotThreadSafe = PhantomData;
>> +
>> +// When available use the upstream `UnsafePinned` type
>> +#[cfg(CONFIG_RUSTC_HAS_UNSAFE_PINNED)]
>> +pub use core::pin::UnsafePinned;
>> +
>> +// Otherwise us the kernel implementation of `UnsafePinned`
>> +#[cfg(not(CONFIG_RUSTC_HAS_UNSAFE_PINNED))]
>> +mod unsafe_pinned;
>> +#[cfg(not(CONFIG_RUSTC_HAS_UNSAFE_PINNED))]
>> +pub use unsafe_pinned::UnsafePinned;
>> +
>> +/// Trait for creating a [`PinInit`]ialized wrapper containing `T`.
>> +// Needs to be defined in kernel crate to get around the Orphan Rule when upstream `UnsafePinned`
>> +// is used.
>> +pub trait TryPinInitWrapper<T: ?Sized> {
>> +    /// Create an [`Self`] pin-initializer which contains `T`
>> +    fn try_pin_init<E>(value: impl PinInit<T, E>) -> impl PinInit<Self, E>;
>> +}
>> +impl<T: ?Sized> TryPinInitWrapper<T> for UnsafePinned<T> {
>> +    fn try_pin_init<E>(value: impl PinInit<T, E>) -> impl PinInit<Self, E> {
>> +        // SAFETY:
>> +        //   - In case of an error in `value` the error is returned, otherwise `slot` is fully
>> +        //     initialized, since `self.value` is initialized and `_pin` is a zero sized type.
>> +        //   - The `Pin` invariants of `self.value` are upheld, since no moving occurs.
>> +        unsafe {
>> +            pin_init::pin_init_from_closure(move |slot| {
>> +                value.__pinned_init(Self::raw_get_mut(slot))
>> +            })
>> +        }
>> +    }
>> +}
> 
> I'd prefer the impl for `core::pin::UnsafePinned` to exist in
> `pin-init`. Do you mind creating a PR on github [1]? If not, just send a
> patch and I will upstream it.

It would probably also make sense to add this impl to other 
Container/Wrapper types in `pin-init`.

I'll start writing up a PR.

Cheers,
Christian
