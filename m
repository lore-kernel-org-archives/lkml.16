Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4E529C345
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 12:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744375093; cv=none; b=sWiYQvuXCqzdytb7AgvKSc5Pb/payhOTsi5of+iYrvQ4XsAxp3SITR7unwIovLLem2L/Au98hGox0C5Rzq5Nd36EDKoD5K6HR85ci7a+orOe2Op6qMLjIxkJt1zbfCJNXCw4O3DlNuaZFcHv58+xlQLTo90NZYKK1XgXB3kPm2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744375093; c=relaxed/simple;
	bh=GC9MUiEt2lqGAOjbAtumPCOT44VUHRX7V10h8E8101Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tNW8xi/r4myLivrhPCTr9z8FkGGXoILPlHqsenbT4MlcIGaF70xikH1cuJ/gkKybCbHC5HmiNljupAGppP3GLGh69gRuvGNFCa3eFH97EvtCJ/OsSTyIzkSUvS5XpcW+/Wq0WUsxrlNZreZiHV9XEDOWgR0LtW+txHrcqq8Wqzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ShnMTX0j; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ShnMTX0j"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so21104535e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744375089; x=1744979889; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A0F8xOf5n1iP84GznHsgJ3Yj9RMiBObZi8JbJnKUK3U=;
        b=ShnMTX0juONAPTRjwDOKfx9ByNDmHR3NvHgGVs9I9fzyab6bBdqSNZnzAzZDwVW/uj
         SqsHrRrh/ovwIyGXeeKlkvuaDnr9dp0It8Djr2oEZOx+poHf3Y2aFpetUQoBDEvahsIc
         iSFBczhKvlVhf4qdnXw8571IzfPSt4WcUMjCwdHDVu3mTuCfgYXxV6+5Re2OU0eytZpN
         mb4XP1FaVpiQCV+rMos1PAajPPimFln+S6+gX1ov/YZawDhkCNlZY9gbMZqz9VI3U7iZ
         InrxLtH79Ld7//9Ka9fT5J1yO+RgpZ7Bw3zkmS7qo4m6nO8ly5ifVYY7c6WDvU4Q3mhg
         k8XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744375089; x=1744979889;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A0F8xOf5n1iP84GznHsgJ3Yj9RMiBObZi8JbJnKUK3U=;
        b=Mt6todkxykTGY34+UJd7WOVuf8wtKvTJUjoVzOpNkDq4Q3skThluOpmC9U0iKmDFtU
         GDb/wFzTvmu7zIw89Yqz8KjUj187ZAk/cdN78AFtZP+WIJzExmkD+vyCsnlyF5Andqy/
         63Rhv4i8rjnlFZM4+/try3ohNbYntgEIcw4ZbxkAAxy71k8OnVS1Ae+pZWOli6QKm4eq
         ChNzSpPDif2k1vbPp7zwVJ7sjXH//L1ZlOV6UrB22fPuWdI7GtoE3vwtE+Os2nAlS4mf
         yLHUP7rsI1TMc6bkuC9FWMgwwVzxVlcCqXZqX+YEZSDR/zYxQ9vZSmpx5j45ZCz3jXNp
         dzGw==
X-Forwarded-Encrypted: i=1; AJvYcCXT79FT1sTwqUwfxMN6NYvKlUVsYARUaCBE+OAaCGkDOxskiKxttRxnioihc6uvRo3t4sBhKpU77I95iBk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRVUSrxIL65HbwD6egYcqE96fhXnM7VU3sgc1exMydHc0UlN0f
	EFaPZSGr5XNTBYZIRba+uPxxQ+HWkCLCl4s+F4dyjxUynQkIxGunLbf/n+eEmghVSYuNvg8GWPo
	Nrb1cBTEN+X250fAEWEIfca2p4aH8k/RFmSnI
X-Gm-Gg: ASbGncsVRGsUsMPwJCP3NAC6wSBnzLxQNQ0TA9gK8yu4yUMTSBPZWzl++xKM2gL+t1n
	leaqVGS+QmhAGe6KaK8Q0mrXVeOU5ndmnJfds5GsZ+yCIery20IUuXynw0PwoMFyPcCSjDZbnjb
	CXuj3OZ9neI0410hjOCAW4D/I=
X-Google-Smtp-Source: AGHT+IHQ3a2zrmKGWF5WrxGMqmdp8yzn6qJygD9PQ7LQWiFllNcLwB2K9zfh/FDUZ4mUnqpqJTdi7NlLE3XEzC319Ao=
X-Received: by 2002:a5d:64c8:0:b0:38d:ba8e:7327 with SMTP id
 ffacd0b85a97d-39e6e48c131mr2438198f8f.8.1744375089474; Fri, 11 Apr 2025
 05:38:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409-container-of-mutness-v1-1-64f472b94534@gmail.com>
 <Z_jakOS8mciIpxy0@google.com> <CAJ-ks9kEMwpDoys=RJGfWvyLdRco_Lm1984KSmju7mio5_5_WA@mail.gmail.com>
 <D93TAL6PHO34.2WCMTNVGUY522@proton.me>
In-Reply-To: <D93TAL6PHO34.2WCMTNVGUY522@proton.me>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 11 Apr 2025 14:37:57 +0200
X-Gm-Features: ATxdqUH08UABL6SLXxRwEmLQrDVcOqEO7RZ21XDOzt9aQS1EC3IapZTzRg1amf4
Message-ID: <CAH5fLgh6gmqGBhPMi2SKn7mCmMWfOSiS0WP5wBuGPYh9ZTAiww@mail.gmail.com>
Subject: Re: [PATCH] rust: retain pointer mut-ness in `container_of!`
To: Benno Lossin <benno.lossin@proton.me>
Cc: Tamir Duberstein <tamird@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2025 at 2:35=E2=80=AFPM Benno Lossin <benno.lossin@proton.m=
e> wrote:
>
> On Fri Apr 11, 2025 at 2:25 PM CEST, Tamir Duberstein wrote:
> > On Fri, Apr 11, 2025 at 5:02=E2=80=AFAM Alice Ryhl <aliceryhl@google.co=
m> wrote:
> >> On Wed, Apr 09, 2025 at 10:43:16AM -0400, Tamir Duberstein wrote:
> >> > @@ -199,9 +199,8 @@ fn panic(info: &core::panic::PanicInfo<'_>) -> !=
 {
> >> >  #[macro_export]
> >> >  macro_rules! container_of {
> >> >      ($ptr:expr, $type:ty, $($f:tt)*) =3D> {{
> >> > -        let ptr =3D $ptr as *const _ as *const u8;
> >> >          let offset: usize =3D ::core::mem::offset_of!($type, $($f)*=
);
> >> > -        ptr.sub(offset) as *const $type
> >> > +        $ptr.byte_sub(offset).cast::<$type>()
> >> >      }}
> >> >  }
> >>
> >> This implementation does not check the type of `ptr`. Would we not wan=
t
> >> it to have the type of the field?
> >
> > I might be missing it but ISTM that the current implementation doesn't
> > check that either.
> >
> > It's not obvious to me how you'd implement such a check; given `$ptr`
> > and `$f`, how do you get your hands on the type of `$ptr->$($f)*`?
>
> I don't think it's possible with current rust, but maybe with field
> projection (:
>
>     ($ptr:expr, $type:ty, $($f:tt)*) =3D> {{
>         // do not run this code, only use it for type-checking:
>         let _ =3D || {
>             let mut ptr =3D $ptr;
>             ptr =3D $ptr.cast::<<field_of!($t, $($f)*) as Field>::Type>()=
;
>         };
>         let offset: usize =3D ::core::mem::offset_of!($type, $($f)*);
>         $ptr.byte_sub(offset).cast::<$type>()
>     }}

You can definitely implement the check with current Rust. You use
addr_of! to create a raw pointer with the type of the field, and
trigger a type error if `ptr` doesn't have the same type as that other
pointer. Something along these lines would do it:

let mut ptr =3D $ptr;
let offset: usize =3D ::core::mem::offset_of!($type, $($f)*);
let container =3D ptr.byte_sub(offset).cast::<$type>();
if false {
    ptr =3D ::core::ptr::addr_of!((*container).$($f)*).cast_mut();
}
container
