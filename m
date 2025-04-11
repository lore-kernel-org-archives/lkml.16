Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F771F7575;
	Fri, 11 Apr 2025 14:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744382080; cv=none; b=l+8fJ5lTGVzXRZeKg0So3fD5rnJJcdQY0h/kr8l1MyVCni2AGlNXBASEzzcQY9doZn0O6iBO2RsQDN0+98AwUqQ1luQPSv3pb3rh0m32X/zqnype9EF9GMIFI/raBvjwwz4sJaFgkidd/hCx2IYYNeQgblX7BesY1qfx6m24tMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744382080; c=relaxed/simple;
	bh=EE0z7VcnS5alp4WrNEPDp5Ms9yqPCFGjsjy878pe6mw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TSgPRezWPqLVgQU2P66NL3sGFUChaJU6jnnuKgjgkvsaZ1JeyOeyLaffqyxsfBT8x9fr6Rd3qdD7H5iv5yW+W1L2XtnRw6i+vG90Lit7YKekMtYSSW0bENjz1W7EnAdeCtgeYGq53bbww4NtZ+Kvbz/HyBUqRNufliU+YChxC8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VrN1qj8A; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VrN1qj8A"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30613802a59so21504301fa.0;
        Fri, 11 Apr 2025 07:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744382077; x=1744986877; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0iiM4A5jNc7XQCTZ7wbH5EfX577sulbS78AGVv/5JM4=;
        b=VrN1qj8AzV1baf4YRBreWeB8R+k1RcTJ6ACOgZkxHFqwOqkCjdC23Gk2gcgxELB2zo
         +mzeNGVIaASAOz/rTbmc9MwWX8trTbR1WtGliPEnHhjAL31TxrKTLe+EFLZBc2iOxc4L
         jlSmidKJMy1Ss0fTS6qiKyHb4bW1h5U+E3TyJgaIxDIvcJFfSfsOgY4PCdcfS/ad2Kdx
         oKXvjxjASWbpEiY5vD4HrthD/CInDAbK8/zI2onLhKcTPd+7qz4YJDDdeW78uw7fevea
         NOJnaYZjjHL2Eh5qDwKdyxMqbiQest6KICxQK7Ffkq6xTqM0PgfKR/GJGC+X1llSfktA
         o5LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744382077; x=1744986877;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0iiM4A5jNc7XQCTZ7wbH5EfX577sulbS78AGVv/5JM4=;
        b=rGAh/RYPleDKlDoKeAAJn1dhzbCmvhgLh9rnJVYAjhBuDEgvtaAlhAyWi1EgacHfod
         W4Gs6CDk2BoDK89pFu2ZAkoKoU8oCmHRaH6pwC+GDOIHLq65RCgOCcQVrRS9Tk0lz8u+
         xvN7K3x4XFjwRkpaAQgE0ivPf0UrDH+FDFSJBLuCPYku7jYq/SFRy/vGFTgIjSlqVp/y
         B/KAhwkqXjlSVEQlVhJYBxfiJmAokOEsG5ATGaeUrJTT9KUkUp79aNAZY9zsu9QKDj5s
         MKKbCYnxCMkC5NaHj/ejDykSPD+pUyESMuhIpvV2QpmBRP8GSX7ygOckfFWGVlWpTHS7
         XvTw==
X-Forwarded-Encrypted: i=1; AJvYcCUi9UuFjaLxTZgf69k8L0WZvNiGIF5aNowisdeXfmie+HzyBuXzxJ3xQukL8+EBhj8yHIHsXpbKC93n7rIdCgQ=@vger.kernel.org, AJvYcCVDgFDNMQ6OKGQPvXSiiPwSnCEJEnPJUewFLW68EezEd0mFDyfSmBTi+3iIWM2YZZgII3iVJ2aYP2crceM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+0eP4Padfhd9SjloGEAMXSCkcjZWLKU/No0meo6dDS2qybecU
	+34wUQIQpcA2SgwsipOm3mNEsbCoSSDI7SRjflqshZRDLxgt6MGX1wM10ulb624Fdr1fbIeMwvV
	9IF28H47keNm52a6rXoaSqh9b7G0=
X-Gm-Gg: ASbGncuI/SOdMJDNeskwrQfwPxKeI9LAkPBX8XtBIAK9VLNv9mqdyQ8bfYXrhdqjbK8
	CZTAnTmb+NiQSwp5xOG2bOLYZ9rBhTr3hKaylJozJEowd4iSHeGTUbYyWx+9f0ckiA/J2piHmhs
	qr4n/kZMPmekj2pmxWR4q9rFJVcx7OqzsQrwJ+JU5vN86LRDAjR0WwT1c=
X-Google-Smtp-Source: AGHT+IGSlwBM6FhbW7GiINpo0e0h9j8maWNeh2TROlmjwiwk8OBBSwUPmjW49GjLZpDNULwYmRok5G0g9+2l3lLU1JM=
X-Received: by 2002:a05:651c:1443:b0:30d:894a:a538 with SMTP id
 38308e7fff4ca-310499fb2d4mr11682591fa.21.1744382076746; Fri, 11 Apr 2025
 07:34:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409-container-of-mutness-v1-1-64f472b94534@gmail.com>
 <Z_jakOS8mciIpxy0@google.com> <CAJ-ks9kEMwpDoys=RJGfWvyLdRco_Lm1984KSmju7mio5_5_WA@mail.gmail.com>
 <D93TAL6PHO34.2WCMTNVGUY522@proton.me> <CAH5fLgh6gmqGBhPMi2SKn7mCmMWfOSiS0WP5wBuGPYh9ZTAiww@mail.gmail.com>
 <CAJ-ks9k_0Ly1nG5jDYQZL=GQ26FVajekCaMQ9C3MOK9VknZssg@mail.gmail.com> <CAH5fLggDVVwfsxVqOojcib3v0COqyatCisQem5z+CUC7aaLDww@mail.gmail.com>
In-Reply-To: <CAH5fLggDVVwfsxVqOojcib3v0COqyatCisQem5z+CUC7aaLDww@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 11 Apr 2025 10:34:00 -0400
X-Gm-Features: ATxdqUGC7GCFIQ26Wis4gvos7FvyMBrX6ffMxRK8sEct8rCKgc9dMd5Gn0fzTjw
Message-ID: <CAJ-ks9mxRqFPz4J_L3KLa-VHX+dcbsobncc=n2f84iZ+ju2VaA@mail.gmail.com>
Subject: Re: [PATCH] rust: retain pointer mut-ness in `container_of!`
To: Alice Ryhl <aliceryhl@google.com>
Cc: Benno Lossin <benno.lossin@proton.me>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2025 at 9:29=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> On Fri, Apr 11, 2025 at 3:09=E2=80=AFPM Tamir Duberstein <tamird@gmail.co=
m> wrote:
> >
> > On Fri, Apr 11, 2025 at 8:38=E2=80=AFAM Alice Ryhl <aliceryhl@google.co=
m> wrote:
> > >
> > > On Fri, Apr 11, 2025 at 2:35=E2=80=AFPM Benno Lossin <benno.lossin@pr=
oton.me> wrote:
> > > >
> > > > On Fri Apr 11, 2025 at 2:25 PM CEST, Tamir Duberstein wrote:
> > > > > On Fri, Apr 11, 2025 at 5:02=E2=80=AFAM Alice Ryhl <aliceryhl@goo=
gle.com> wrote:
> > > > >> On Wed, Apr 09, 2025 at 10:43:16AM -0400, Tamir Duberstein wrote=
:
> > > > >> > @@ -199,9 +199,8 @@ fn panic(info: &core::panic::PanicInfo<'_>=
) -> ! {
> > > > >> >  #[macro_export]
> > > > >> >  macro_rules! container_of {
> > > > >> >      ($ptr:expr, $type:ty, $($f:tt)*) =3D> {{
> > > > >> > -        let ptr =3D $ptr as *const _ as *const u8;
> > > > >> >          let offset: usize =3D ::core::mem::offset_of!($type, =
$($f)*);
> > > > >> > -        ptr.sub(offset) as *const $type
> > > > >> > +        $ptr.byte_sub(offset).cast::<$type>()
> > > > >> >      }}
> > > > >> >  }
> > > > >>
> > > > >> This implementation does not check the type of `ptr`. Would we n=
ot want
> > > > >> it to have the type of the field?
> > > > >
> > > > > I might be missing it but ISTM that the current implementation do=
esn't
> > > > > check that either.
> > > > >
> > > > > It's not obvious to me how you'd implement such a check; given `$=
ptr`
> > > > > and `$f`, how do you get your hands on the type of `$ptr->$($f)*`=
?
> > > >
> > > > I don't think it's possible with current rust, but maybe with field
> > > > projection (:
> > > >
> > > >     ($ptr:expr, $type:ty, $($f:tt)*) =3D> {{
> > > >         // do not run this code, only use it for type-checking:
> > > >         let _ =3D || {
> > > >             let mut ptr =3D $ptr;
> > > >             ptr =3D $ptr.cast::<<field_of!($t, $($f)*) as Field>::T=
ype>();
> > > >         };
> > > >         let offset: usize =3D ::core::mem::offset_of!($type, $($f)*=
);
> > > >         $ptr.byte_sub(offset).cast::<$type>()
> > > >     }}
> > >
> > > You can definitely implement the check with current Rust. You use
> > > addr_of! to create a raw pointer with the type of the field, and
> > > trigger a type error if `ptr` doesn't have the same type as that othe=
r
> > > pointer. Something along these lines would do it:
> > >
> > > let mut ptr =3D $ptr;
> > > let offset: usize =3D ::core::mem::offset_of!($type, $($f)*);
> > > let container =3D ptr.byte_sub(offset).cast::<$type>();
> > > if false {
> > >     ptr =3D ::core::ptr::addr_of!((*container).$($f)*).cast_mut();
> > > }
> > > container
> >
> > It's a nice idea. Wouldn't it require `$ptr` to be `*mut _` and not
> > work with `*const _`?
>
> As far as I can tell, it should work with const pointers too. The rhs
> of the last assignment gets downgraded back to a const pointer in that
> case.
>
> > In any case, I hope we agree that this can be
> > done separately.
>
> Yes, since the feature does not exist today, it can happen separately.

Sent as another patch:
https://lore.kernel.org/all/20250411-b4-container-of-type-check-v1-1-08262e=
f67c95@gmail.com/.

Thanks for the suggestion!
Tamir
