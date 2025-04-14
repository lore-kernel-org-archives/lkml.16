Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DB127A921;
	Mon, 14 Apr 2025 14:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744639904; cv=none; b=ia2bTGoY/Uhriqz5A4jNkAYunKNJrSk8RvwLp0jcZhZkOvugTD4qPAwkjuo2NwNDlUw6JaSqU8wbeQIeNHIGZB7C9figI3fQWp8IXeuUrP6VmFE9nzXUfjJsF7ox4LqQggRjImJwM96rvKjnJg4tiow2NYp5GTcYyUElUFFTJSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744639904; c=relaxed/simple;
	bh=EblBvegSnNOt+gChlJRc5y2uhznERwN63/BcMkBvUtk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nvFKneIW0aB0bx7mCRnQuQmAbOHcgVgItzV2+sse3aX6L89yrrqdTowEPvWjwpeRsiMu7HkN2bkKD2w6ie2/GXc6ENU/fV3mVbaqjwuaLY2vMQGIVrSOmrm6wFdYUlKr5fiBBnxfzVYEPwtm7iWRv0GOAqZBdrAj9QzDAQMME3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MmL1Mb9r; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MmL1Mb9r"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-310447fe59aso37286651fa.0;
        Mon, 14 Apr 2025 07:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744639900; x=1745244700; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FIkLP/fQvXNSmz2D/nxX5r5/35zlQ4vXp0PlEAwBoSY=;
        b=MmL1Mb9rqDNwOg9z819eiP6g7JshYwqt6inkIJEvT/bR3RcHQ3a3SUFl87Uf/bQxlV
         BgS2Xwkw/DQq6RG8I73iUu5whDTZmnN991D8l5dhQXDRmago2VtfMusGyPh9xxEs4pSq
         xlUqO6QzeWHxxYwDMucmJmE8IFCewjDKoV6gVR9AX4IJy3e9MNIiT7EY0p7blm6pEmNI
         IE+lwcibrdTOhQzuINSlHnQUA/NvabFaaaYHatAAgVYK1psI9hh1Qa96VxYd1zQtc0Xc
         6clUhIn26GlstMBqMTJNm9ilcokQfJty6UExBPh0DIKS+ibXFDiUsS9QmA9WQDwMUmr1
         /xPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744639900; x=1745244700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FIkLP/fQvXNSmz2D/nxX5r5/35zlQ4vXp0PlEAwBoSY=;
        b=fV5Ik7fIGZ2oGhoBLClohDCirnedzipgQoOh5L3vrXxI8ivLS8J8/TimpVqYuvhiGx
         GsRG7RFR0Q3tPW6jKKMtt52fMtLYUvvPCb9c79n4jtR7zY7YQWwsxQuPlGICcoqz8pNa
         iH+2MbIGrzgM43PJVLknsIa+ykmaZ5mDCiGs2QLKjmPKvVBz3bIApOuTy6cf4wz8aeyo
         r0D2ghagvqZ5TCy1YP69hd6xGiKmmell210ut+WMtoY+3KH+WzyM2EWeqrSKk8+dIuPG
         Pfy0KdsCutb+GCfIS3R+e0gKs4A7QOKVlLfXTbyGN60UYiWUC437QRcAaedV2tE0b5Ml
         5ffw==
X-Forwarded-Encrypted: i=1; AJvYcCUzUn436u8iRJlabWcD3gfIwyRl03OiEhhk9BjyDsxnrXkZV5Lxao/zigU1U4cuNLXkcawcp7EhIHxFS3Y=@vger.kernel.org, AJvYcCVV9OAXUv4k4REzOWnFNUCB3VFMWH0D3IVoO8kQVdPC4bpvkozka1x0X3IzeI8NMP28j/pX6t1RQuApFM0z8UU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzV5BKEDI0O7zywuKmPCaSfTSC0nrXpBeULn+fVYR1IT29wgHPK
	bhMzJw6HIy3AD9+GeSZDxNm2F1Nj/7jn/yaVf0c5CzBv30HR9aKHaGwyfXeYJHqP7F/Vhmgf6F2
	7l9/pDJ7cEWi/hid6J2Gj4C00YEM=
X-Gm-Gg: ASbGnct5fkzjxvyEoUH/vfY9ZU42chOKXJvMXi8JT+1c22ELrFuMIe4Sq5cn8tIUBXR
	pHHzL/a0Zimk4VZzqqCvnrCz5BgUxta5PxDryJ6suaVSQzaX6igaX6RrjOnoNSCl1B4XS1Fmb+u
	ERESB4MfuELtLcSGiUX4530LezcWpdFuXc2h/ZhQ==
X-Google-Smtp-Source: AGHT+IEBJbShyUUSqv7ryp6jyAl8lHdgUBSqXAQy6ELIn46wrDbEXN16PdPI7kNjONyEOGFqubDeOofUNz6tLg0K+cU=
X-Received: by 2002:a2e:a913:0:b0:308:f3b4:ea66 with SMTP id
 38308e7fff4ca-31049a93017mr49404321fa.28.1744639900116; Mon, 14 Apr 2025
 07:11:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250412-b4-container-of-type-check-v2-1-f3cc9934c160@gmail.com> <Z_0V85LF2d4EquZQ@google.com>
In-Reply-To: <Z_0V85LF2d4EquZQ@google.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 14 Apr 2025 10:11:04 -0400
X-Gm-Features: ATxdqUHn6O9Fy2o5Qei-hwgPIqzTQ4SFV56eks-Cdm5ec-O4oGKovntmpFC8FyU
Message-ID: <CAJ-ks9mRYQB-nshNjnPM6T+EAdqz+oWuWR=Mdnb=aOY1Aevhhg@mail.gmail.com>
Subject: Re: [PATCH v2] rust: check type of `$ptr` in `container_of!`
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 10:04=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> On Sat, Apr 12, 2025 at 02:16:08PM -0400, Tamir Duberstein wrote:
> > +    ($field_ptr:expr, $Container:ty, $($fields:tt)*) =3D> {{
> > +        let offset: usize =3D ::core::mem::offset_of!($Container, $($f=
ields)*);
> > +        let container_ptr =3D $field_ptr.byte_sub(offset).cast::<$Cont=
ainer>();
> > +        if false {
> > +            let field_ptr =3D ::core::ptr::addr_of!((*container_ptr).$=
($fields)*).cast_mut();
> > +            [$field_ptr, field_ptr]; // typeof(`$ptr_to_field`) =3D=3D=
 typeof(`$Container.$($fields)*`)
>
> This evaluates $field_ptr twice. The `if false` avoids bad stuff if the
> expression has side-effects, but still seems sub-optimal.

I don't disagree but I intentionally made this choice so that the
compiler error was clear about the LHS element being one of the
arguments to the macro. But maybe the comment provides enough clarity.
The alternative error is

> error[E0308]: mismatched types
>    --> rust/kernel/lib.rs:207:25
>     |
> 207 |             [field_ptr, container_field_ptr]; // typeof(`$field_ptr=
`) =3D=3D typeof(`$Container.$($fields)*`)
>     |                         ^^^^^^^^^^^^^^^^^^^ expected `*mut rb_node`=
, found `*mut K`
>     |
>    ::: rust/kernel/rbtree.rs:270:6
>     |
> 270 | impl<K, V> RBTree<K, V>
>     |      - found this type parameter
> ...
> 332 |             let node =3D unsafe { container_of!(curr, Node<K, V>, k=
ey) };
>     |                                 -----------------------------------=
- in this macro invocation
>     |
>     =3D note: expected raw pointer `*mut bindings::rb_node`
>                found raw pointer `*mut K`
>     =3D note: this error originates in the macro `container_of` (in Night=
ly builds, run with -Z macro-backtrace for more info)
>
> error: aborting due to 1 previous error

Seems OK to me, so I'll do this in v3.
