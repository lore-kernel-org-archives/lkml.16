Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06DEAC2ED;
	Mon, 21 Apr 2025 18:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745260984; cv=none; b=AyUA1sX1J4aQzKzEgt+4nRTuFgaul//jDqWMbQvuxrN0KJGNClV7gn+zHdfPJ9R3PlQS0d+W7imCr1Fy6dpK/oOiHdxX8BPoWuxLhayciFO78V1/q1VOVSlUG7GWuQwu5GF7h9H0On0JGBC4W/7s3RqL8LzoXeF+jpLSx8DxtMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745260984; c=relaxed/simple;
	bh=12pNAYV5E3uTGRq/iVL3og6PyUEcWmekCJ/kjMC72F0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=acEgsRxPD8adcyv9ofSdoU0XF/3sjm2z57cVtuJTjDazynwOg+VrMQJr5DLM632C/OWFYwqKy/DC0qMM+KgI/2v1z7aoE9oiwRzUnkwfwmelyTQ3iqvDND1RQesGsTkIMIpWSPq5HRoRIaFzK+zRDybGSefNH/oyOtTmjq2dPnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S/Cq1IqI; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S/Cq1IqI"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3105ef2a06cso39397611fa.2;
        Mon, 21 Apr 2025 11:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745260981; x=1745865781; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ghDrkF0tVAgm9hBQXnH82rKOM2q62qgv1XyqF65d5cg=;
        b=S/Cq1IqILYmErmAGdyF1ljXZ1B0RigXB5fcG0yt9ZMZtsCr4BuWyfhzseiDjAymd5b
         E842WVbJQ7zmugjpTh3VLsxL/SH2+D+3tidOqo0715goxACYU8yksq7FFd/xYZ7zHXxn
         D7590tdFoHxqiC8KL7GZorNFP/nokTPJkN73DM7cxJptvCfM1/GITD898/iEYLLpszhB
         gjPIHN4NKAUUGqMLmeQJV3B6GG5PUmPVT8W/H/c8beTCF+NPgdAuyTCbA4i9VHZDlywE
         A+wCBHovKlNAN8fdbFIVZCzyd2d6BkK12Vc4nul9GMpdTCq0h/hGZPx9Jc9nnEFpWHJg
         q6Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745260981; x=1745865781;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ghDrkF0tVAgm9hBQXnH82rKOM2q62qgv1XyqF65d5cg=;
        b=AgvnfEfFkIxAiMDluziHnYJJWPhlzkRUvQPPcrqzLG8oKuOEYRZXOZN67vSn47FKUR
         80MkFCI8LlpPys59ow+tPJVdzcsvMK120YhKFHEApGbiM46GWGVbXm+IvubG/vl350Es
         8Q4V29geN1OWwqv6fO+2IxFY+LiCaU9io8wqxqDeEZ6Jt6urdkL77LDcfQXWKX8KhkPz
         MPktb1OzsC/4GPKTjB5j+m80UvN1lhV5iy4uX95RtPS8q9JN1O9Gzu9VDe/osMD9KUtU
         QdIz8K1ue7wekyTPhTZZQIrMmx42GCV+Y64iiNOvQw3ny6lVWP9Uzs+xJT9dhTkBEfKb
         os8g==
X-Forwarded-Encrypted: i=1; AJvYcCUv1lr//byM8ISlglbrPbflslEqOivL+CoaCLXjBz7wtLaansIPschgEvatuwlWgNR90n6fhi3lGL0YGhk=@vger.kernel.org, AJvYcCVWhP9COo99Ek6AwS5eIwx5RgdwTSv34w7onHO19rOu6HCHBnv/NT8Vi2BQPbe2ARQeI142W2sEaWm9N79Eblk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyC5YtFwJZfek7kHt3CX7edj//DkqzBmcjJmu6kaqnUNp41rpXI
	SlXaS91l4p+ZmYzcWpPY+HEHa7MEgDrl3tKKN2FP0zI0JUJSKod5WtQZVCJJc1HqXDes3rBgPmY
	p9geezBmll2lzrnT8WrX5MAiu0WI=
X-Gm-Gg: ASbGnctAIgvm2HrYaHBib4i4tveJ+TsJYM2ItqY32r3DjOG99ICE0dWQcsLJ65WvslV
	jQt5dbkSjYGseF98Hu7z/+Mi+lbJl/Lv36+uq/WjkQ+hnLVvwo1CEHx66jh6ao2LwpA1BTRCm17
	CnRcPWMBuEkn+gUePsrhBsbYx5v2bq4lcJuoJQbw==
X-Google-Smtp-Source: AGHT+IGK/M7zfu/tJBOd1Os5RtFN0XD2brN0dqT6KIGGp3Et9fsK1pUoZoHkRnpk1/qt5Wz5GWW2/yq0EbZpPPlG15Q=
X-Received: by 2002:a05:651c:150d:b0:30b:f775:bae5 with SMTP id
 38308e7fff4ca-310904c7c9fmr41380531fa.6.1745260980699; Mon, 21 Apr 2025
 11:43:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250421134909.464405-1-benno.lossin@proton.me> <20250421134909.464405-2-benno.lossin@proton.me>
In-Reply-To: <20250421134909.464405-2-benno.lossin@proton.me>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 21 Apr 2025 14:42:24 -0400
X-Gm-Features: ATxdqUEYWX-95trk7CtalZxQC6bawj_76d_ckxO0puOdXJptw1PENUHZDAqVj5o
Message-ID: <CAJ-ks9m0=TRiq_6p_11xj3GjXJnPgrHYp9UByZt1HEHXyTorEg@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] rust: transmute: add `cast_slice[_mut]` functions
To: Benno Lossin <benno.lossin@proton.me>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Aliet Exposito Garcia <aliet.exposito@gmail.com>, 
	Fiona Behrens <me@kloenk.dev>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 21, 2025 at 9:50=E2=80=AFAM Benno Lossin <benno.lossin@proton.m=
e> wrote:
>
> Add functions to make casting slices only one `unsafe` block.
>
> Signed-off-by: Benno Lossin <benno.lossin@proton.me>
> ---
>  rust/kernel/transmute.rs | 41 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>
> diff --git a/rust/kernel/transmute.rs b/rust/kernel/transmute.rs
> index 1c7d43771a37..242623bbb565 100644
> --- a/rust/kernel/transmute.rs
> +++ b/rust/kernel/transmute.rs
> @@ -2,6 +2,8 @@
>
>  //! Traits for transmuting types.
>
> +use core::slice;
> +
>  /// Types for which any bit pattern is valid.
>  ///
>  /// Not all types are valid for all values. For example, a `bool` must b=
e either zero or one, so
> @@ -69,3 +71,42 @@ macro_rules! impl_asbytes {
>      {<T: AsBytes>} [T],
>      {<T: AsBytes, const N: usize>} [T; N],
>  }
> +
> +/// Casts the type of a slice to another.
> +///
> +/// # Examples
> +///
> +/// ```rust
> +/// # use kernel::transmute::cast_slice;
> +/// #[repr(transparent)]
> +/// #[derive(Debug)]
> +/// struct Container<T>(T);
> +///
> +/// let array =3D [0u32; 42];
> +/// let slice =3D &array;
> +/// // SAFETY: `Container<T>` transparently wraps a `T`.
> +/// let container_slice =3D unsafe { cast_slice(slice) };
> +/// pr_info!("{container_slice}");
> +/// ```

How can this example compile? The type of `container_slice` can't
possibly be known.

> +///
> +/// # Safety
> +/// - `T` and `U` must have the same layout.
> +pub unsafe fn cast_slice<T, U>(slice: &[T]) -> &[U] {
> +    // CAST: by the safety requirements, `T` and `U` have the same layou=
t.
> +    let ptr =3D slice.as_ptr().cast::<U>();
> +    // SAFETY: `ptr` and `len` come from the same slice reference.
> +    unsafe { slice::from_raw_parts(ptr, slice.len()) }
> +}
> +
> +/// Casts the type of a slice to another.
> +///
> +/// Also see [`cast_slice`].
> +///
> +/// # Safety
> +/// - `T` and `U` must have the same layout.
> +pub unsafe fn cast_slice_mut<T, U>(slice: &mut [T]) -> &mut [U] {
> +    // CAST: by the safety requirements, `T` and `U` have the same layou=
t.
> +    let ptr =3D slice.as_mut_ptr().cast::<U>();
> +    // SAFETY: `ptr` and `len` come from the same slice reference.
> +    unsafe { slice::from_raw_parts_mut(ptr, slice.len()) }
> +}

With the example fixed (or if I'm mistaken and it does compile):

Reviewed-by: Tamir Duberstein <tamird@gmail.com>
