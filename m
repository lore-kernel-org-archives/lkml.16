Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F391AA1DB;
	Tue, 17 Jun 2025 14:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750171249; cv=none; b=XiVYfWrjPDvwUcRkIJk6sQcsTPkpIpnIQIIq2BHpTEbbX/dv8VwMCz7c8k1HTJaew+F79w8ATAj3JOMbHDxnNosQq35PQupci8S5bOxLIM0YHWiCBNOq528RlOnSf1erQJIceh8r+1PkDodfJiqCLQqByyWFDEdANtCgoBXUf/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750171249; c=relaxed/simple;
	bh=0mb3vGBaE0i3M/SUNhFjCQPgtSzD466nZlwMNKnyljA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VzdxU6iq5zlHQz78oag1VZYQWHV4+zwERNBxxzh3r22DjYNm07IBCYAb+8U+4FPKxlnkvRari9QDICPrTfHs99rdC67DBaVa5aq7tJeSlfIafF/3yniGjoiqHkXEakLtqMuLh2u8vdlQUBI0BfJo2dVfTxv0riEMan6vn3TxxgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BAKxBJ+o; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BAKxBJ+o"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-32aabfd3813so50183671fa.3;
        Tue, 17 Jun 2025 07:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750171246; x=1750776046; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nA6qtEQYSObjmTSjXfycB+WycPATkd4P72jiPnHCAA4=;
        b=BAKxBJ+oh49SUWdP7uSbWB8VFlU9MA5hSvKeIjAz6IFdh73Ji3BKX243i2m2vblQE1
         bXpVK6pP11myeoWq80Yq2dktPvc2WVFjuVSSEMa5m0MuAsJHccXM3l78e9rVNfF8sP4r
         ZF8lAy3SjA9sdp28LyOVdAKMvDsRC6mvlMLJuumjW3+FJW1AVAfOVEiT4ZilEHelPxvO
         Yt/Kw1MzWJmT3FzLndABsEqtmgDdkwBlWI7gDwj8MUTIFiBvSpF2i0rsYCARZXRtp3r1
         CRyfBpvtmYQjJzVCyN6f8xZBz/q+gU2+DDq8A6c0GmlokVYdnzkp3/NXWCHFd1xFBqyv
         abnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750171246; x=1750776046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nA6qtEQYSObjmTSjXfycB+WycPATkd4P72jiPnHCAA4=;
        b=uTVUXChb9FGlEELZyNBQ/2qporOEttZx4ZDzpOXKWIxhYZj6klG8sYcueTrAVY1NYT
         pLz6JxTzis6wLuMDW9vFEVzP3Htr0uik+vJKRUksh8kFrgYbOIlitCnXWOMeRhVsMZUK
         9fP/LGWzQHp0XjgAk/MwDd2W+Xfoa5ie8Esu9IIwe+paJtZ8fkkg2hUNk3906qeXZSeY
         fSA5Y0Vd9GIe/K/OvZbwWw7I1E605aH67FxX9LHP9EiVJNKkjvFkPwmDYzbXEBpcFLl3
         WxzYd1/2UYiid/UWR5a7/VIMgKC+nl8/xN6aBZtVcqZkMlYRjJJGjLXkmelBQTkN7PG5
         ygRw==
X-Forwarded-Encrypted: i=1; AJvYcCUCSJfSbzLTPCQxvAduIKxXHSl3WoS84vRlgVKH0g3w+pKfRI9CFmM1WDBMat2y4AoAKUXjgF9pFJLAFgz/sZU=@vger.kernel.org, AJvYcCUk0y6RxSAtqlt4ilsJ8QhjdqrETnUqrLxzWYojJ4qwbYuZZnu8vaC9Rl3MpNYd32CmOlp4rGKg9rB6rrk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvutypLY+CDOSqfNzVnekkSj3/HaQ2SNqDS+NmLLc7x9mI+JTp
	iz2+lRCiylPtJOFpI+7XEwo2Lb+XxcbYhdU9ZTecN4m+D8jM/LogoxsuZZDzR8upsvGPnbkWXTL
	NQm8jHrvwGqGVq2otbK5KvlP3k9i5QyA=
X-Gm-Gg: ASbGncsnROBNWWkBt+1Yfex2cakwnDlqSh5fkQ6qHpu39Wzo8amwvGUEMxgG3k9kLdt
	4SRm9NGUVMpwCx07nOdLvmxdSD6wVaXrNoh/gl1vqncNrFOoXUTd/bZRGmTeSlKoERTLsG+aWqC
	Pq7fyjWOajtqEDZxmzZKMqh4kUSVeliLiQXe/4zD7P0+E4S5v7hCwIW0sHjMQ=
X-Google-Smtp-Source: AGHT+IGkuuKjtvKBNl3QmjTudRGbGevTIb7oBUqZsL6XetkWnP5IqJY5hvQVch1DK/G++9+iLJKtCSGjfz4FCwve8jA=
X-Received: by 2002:a2e:bc15:0:b0:32a:7122:58cc with SMTP id
 38308e7fff4ca-32b4a2e24cbmr39908461fa.6.1750171245443; Tue, 17 Jun 2025
 07:40:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250617-opaque-from-raw-v1-1-a2e99efa3ba2@google.com>
In-Reply-To: <20250617-opaque-from-raw-v1-1-a2e99efa3ba2@google.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Tue, 17 Jun 2025 10:40:09 -0400
X-Gm-Features: AX0GCFv7lU3SvnR9E3OzendU9NdImRIdabiEAKbvNCS_347sx3bZCnind6a_fJU
Message-ID: <CAJ-ks9=Sy3S8Rir-RftkF7_ZCV4WVsCOPHYX3WN41MY1ukFwKQ@mail.gmail.com>
Subject: Re: [PATCH] rust: types: add Opaque::from_raw
To: Alice Ryhl <aliceryhl@google.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 9:38=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Since commit b20fbbc08a36 ("rust: check type of `$ptr` in
> `container_of!`") we have enforced that the field pointer passed to
> container_of! must match the declared field. This caused mismatches when
> using a pointer to bindings::x for fields of type Opaque<bindings::x>.
>
> This situation encourages the user to simply pass field.cast() to the
> container_of! macro, but this is not great because you might
> accidentally pass a *mut bindings::y when the field type is
> Opaque<bindings::x>, which would be wrong.
>
> To help catch this kind of mistake, add a new Opaque::from_raw that
> wraps a raw pointer in Opaque without changing the inner type.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Tamir Duberstein <tamird@gmail.com>

> ---
>  rust/kernel/drm/device.rs  | 4 +---
>  rust/kernel/drm/gem/mod.rs | 4 +---
>  rust/kernel/lib.rs         | 7 +++++++
>  rust/kernel/types.rs       | 5 +++++
>  4 files changed, 14 insertions(+), 6 deletions(-)
>
> diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
> index 624d7a4c83ead64b93325189f481d9b37c3c6eae..763c825d53aaba4f874361b78=
5587b2c5129d49a 100644
> --- a/rust/kernel/drm/device.rs
> +++ b/rust/kernel/drm/device.rs
> @@ -135,11 +135,9 @@ pub(crate) fn as_raw(&self) -> *mut bindings::drm_de=
vice {
>      ///
>      /// `ptr` must be a valid pointer to a `struct device` embedded in `=
Self`.
>      unsafe fn from_drm_device(ptr: *const bindings::drm_device) -> *mut =
Self {
> -        let ptr: *const Opaque<bindings::drm_device> =3D ptr.cast();
> -
>          // SAFETY: By the safety requirements of this function `ptr` is =
a valid pointer to a
>          // `struct drm_device` embedded in `Self`.
> -        unsafe { crate::container_of!(ptr, Self, dev) }.cast_mut()
> +        unsafe { crate::container_of!(Opaque::from_raw(ptr), Self, dev) =
}.cast_mut()
>      }
>
>      /// Not intended to be called externally, except via declare_drm_ioc=
tls!()
> diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
> index 4cd69fa84318c3ff2cec57949e9bab05559a3c2f..5b80c248761bb39914a63ad79=
47aa8d3779054ef 100644
> --- a/rust/kernel/drm/gem/mod.rs
> +++ b/rust/kernel/drm/gem/mod.rs
> @@ -125,11 +125,9 @@ fn as_raw(&self) -> *mut bindings::drm_gem_object {
>      }
>
>      unsafe fn as_ref<'a>(self_ptr: *mut bindings::drm_gem_object) -> &'a=
 Self {
> -        let self_ptr: *mut Opaque<bindings::drm_gem_object> =3D self_ptr=
.cast();
> -
>          // SAFETY: `obj` is guaranteed to be in an `Object<T>` via the s=
afety contract of this
>          // function
> -        unsafe { &*crate::container_of!(self_ptr, Object<T>, obj) }
> +        unsafe { &*crate::container_of!(Opaque::from_raw(self_ptr), Obje=
ct<T>, obj) }
>      }
>  }
>
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 6b4774b2b1c37f4da1866e993be6230bc6715841..d2402d42b8776c9399a7dfdbe=
7bd61de7ef8dba3 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -204,6 +204,13 @@ fn panic(info: &core::panic::PanicInfo<'_>) -> ! {
>
>  /// Produces a pointer to an object from a pointer to one of its fields.
>  ///
> +/// If you encounter a type mismatch due to the [`Opaque`] type, then us=
e [`Opaque::raw_get`] or
> +/// [`Opaque::from_raw`] to resolve the mismatch.
> +///
> +/// [`Opaque`]: crate::types::Opaque
> +/// [`Opaque::raw_get`]: crate::types::Opaque::raw_get
> +/// [`Opaque::from_raw`]: crate::types::Opaque::from_raw
> +///
>  /// # Safety
>  ///
>  /// The pointer passed to this macro, and the pointer returned by this m=
acro, must both be in
> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
> index 22985b6f69820d6df8ff3aae0bf815fad36a9d92..a79295500b3c812326cea8a9d=
339a8545a7f457d 100644
> --- a/rust/kernel/types.rs
> +++ b/rust/kernel/types.rs
> @@ -413,6 +413,11 @@ pub const fn get(&self) -> *mut T {
>      pub const fn raw_get(this: *const Self) -> *mut T {
>          UnsafeCell::raw_get(this.cast::<UnsafeCell<MaybeUninit<T>>>()).c=
ast::<T>()
>      }
> +
> +    /// The opposite operation of [`Opaque::raw_get`].
> +    pub const fn from_raw(this: *const T) -> *const Self {
> +        this.cast()
> +    }
>  }
>
>  /// Types that are _always_ reference counted.
>
> ---
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> change-id: 20250617-opaque-from-raw-ac5b8ef6faa2
>
> Best regards,
> --
> Alice Ryhl <aliceryhl@google.com>
