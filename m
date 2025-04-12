Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600F21531F9;
	Sat, 12 Apr 2025 18:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744482017; cv=none; b=SKfNG+c7UclK7Bdk2QkXOEtA2FCjdlWswiqzy+hgy5WV3vwcdX/IwSGBoTKQo/mi7e7M9eCZJ+wRsxkpDWxLZcSXGT75CDfLAmH619CbF+KI/S6+zfrxd2h5onH5ZjNwUl33FLwbcVkgyjdh71iw/ggZ7Ub/GM/FT94wGZc5UQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744482017; c=relaxed/simple;
	bh=MNGBjHStcCPCHpmjHcGTu/au725KHgPUaXg8breL6ak=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WL0MV887fzXpfI7E3d+4wQmmOeuIQ5KWDOvtXFB17H8yIp9gC88kKZ2UzCFJcpy4nyLKC7GIBI+WrExqyHLAtbYUvhQ4tROHzwF/oSxO+gxb1Xj7STTlR1B4PFH8lDPIS8Fb4BZHk5pZqTNA4VQJN3mexHud4XQuZtriF6Ktz+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m5/kHs+X; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m5/kHs+X"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54b10594812so3528955e87.1;
        Sat, 12 Apr 2025 11:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744482012; x=1745086812; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6UtTBufJD0f3s5omuCN4kvNN2MZ8T1t5ikW7t32q/6s=;
        b=m5/kHs+XziYfTm51d6rcGJz1amASzO3/JEHhKZSglH+8/Jadu8lILIcbpXrPl9g1QW
         YJr6uiJH5QvACebEWAtJg6/6ZoH/LNPMHBmQ8QR/ukdOdj+U+hA/WgxVfqWZSxu8AlIy
         yZWe8D5UmHVtLJOyT6BDRdhRxIhHyCV47qhM+fzIEXvjKem+XXhOYlwMIiSBNMv5V4RW
         FGzXymn1pJjYZcsrll7d8owmqMqPBZpGc7uAEHwDA42hWz5w/CbGYCMo9E600ccyYfGg
         PEDkpvH6aTynHnuWjoiTj7ctgvonOQ6w6VNRbHGw86nqUfS8ZS3fOpqQrL27yUhZM3Ts
         eaMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744482012; x=1745086812;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6UtTBufJD0f3s5omuCN4kvNN2MZ8T1t5ikW7t32q/6s=;
        b=lOskZAsiz5geXlG+WyI8sbTervbFbGRIpZRbHbbWultFOlN/b0NoonGoZyHpkbcAzi
         VQ3ByHNLwp+pNjFsStdd9XsXswOe73UbU9erzNHu1nY+YYOzYd9ovYxroNbbsBS7/jGj
         EiE+ic/9jpoDQ+GykKuSdlJVwI4kRuJikcFYi4jG6er8pcST0qtgdOo5bGHODaQUVw0u
         WSrAx8OiYLH9V6g2zFo44/2evr0uHUYLKrWgjedzu4ERQM4KUJVYPANOzaBNdHwR5kn8
         Ta6KuMVzwgt42xz4CxJugZSIFzN0kch/yk53uGsT/goC/n3SCEnn1VTBfTM/Xnn7ETFM
         zafw==
X-Forwarded-Encrypted: i=1; AJvYcCXFVO0S/LdJPxwF/g/pYCC8o4akxYGCtNA0I4pxJwobYqyLs/1PAXAP6+Atup7wuhcA67hHQRskIAR4yvQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7r5hmNtjmrD8tD2PJhugrWoWZt+Uo22nMWLrn/FeklFL0v14/
	PQIgIqCI8PVPOTMRckCWGha70Gnc429A9HsKsOPj533qNhB6eNpGnvIvJNZY1Y++k1MvUNHMDR2
	JT/i8w1KabYwZE7fmO9ROBlghHXU=
X-Gm-Gg: ASbGnctJ0gOg4GzIajYs2dLMGJb0/SuorV7Zl2F2XhHHmNh4w0VGZ1YxreTM58fXmOs
	QIwb5HhF+n85AkyFSa4N+yWhMRDyVq3gLpUNq9kao1GnOfC486oH6o3QT3vjdiTCJUSYmvX6ykr
	NMlhDtzgitqBuVmFP6vumv5AhW6Kt32Tjgis0dAvV3sb+IkKwOQK2qMUo=
X-Google-Smtp-Source: AGHT+IEoLimenIrHbhxA0Fl+Bje7VuLEFGeGl9/6AHxlHtjLYgN0QfzqPfx8K0+VcBylrfVvHZLgVog0BXRL8TT0+Vc=
X-Received: by 2002:a05:6512:2353:b0:54b:e9b:db19 with SMTP id
 2adb3069b0e04-54d452c9cbfmr2023444e87.35.1744482012140; Sat, 12 Apr 2025
 11:20:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250412-b4-container-of-type-check-v2-1-f3cc9934c160@gmail.com>
In-Reply-To: <20250412-b4-container-of-type-check-v2-1-f3cc9934c160@gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 12 Apr 2025 14:19:36 -0400
X-Gm-Features: ATxdqUGgTuDWpfAiEBejgr-4UQVpAhn7DqkJPx65wTL3uLeRseY4iz-imzJOHUQ
Message-ID: <CAJ-ks9mRUpw5gV54rbQD0Qbju6k+mhjXUHw1JZQiaV+r2RaWzw@mail.gmail.com>
Subject: Re: [PATCH v2] rust: check type of `$ptr` in `container_of!`
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 12, 2025 at 2:16=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> [...]
>
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 1df11156302a..6fbd4cc5afff 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -198,9 +198,14 @@ fn panic(info: &core::panic::PanicInfo<'_>) -> ! {
>  /// ```
>  #[macro_export]
>  macro_rules! container_of {
> -    ($ptr:expr, $type:ty, $($f:tt)*) =3D> {{
> -        let offset: usize =3D ::core::mem::offset_of!($type, $($f)*);
> -        $ptr.byte_sub(offset).cast::<$type>()
> +    ($field_ptr:expr, $Container:ty, $($fields:tt)*) =3D> {{
> +        let offset: usize =3D ::core::mem::offset_of!($Container, $($fie=
lds)*);
> +        let container_ptr =3D $field_ptr.byte_sub(offset).cast::<$Contai=
ner>();
> +        if false {
> +            let field_ptr =3D ::core::ptr::addr_of!((*container_ptr).$($=
fields)*).cast_mut();
> +            [$field_ptr, field_ptr]; // typeof(`$ptr_to_field`) =3D=3D t=
ypeof(`$Container.$($fields)*`)

The comment here should be s/ptr_to_field/field_ptr/. I missed this
when renaming this placeholder for clarity.

> +        }
> +        container_ptr
>      }}
>  }
