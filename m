Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BE317BA1;
	Fri, 11 Apr 2025 13:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744376972; cv=none; b=bj5SReW2tmMrNw7a1iUFkN6F/IAGWVVRb8PdWpfTLm7hjTtwfMtKNHNvDQjwNoRsxqakbI1Kcg5Rb8I6E5LU8yJxih5w2+JCeyaqIoNxqxRWi7S0/zl/ujhEML/3VhX0YbOAzCKqGo3dbKxvQkKyxznOon3qQLXsqQbHVk2xKLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744376972; c=relaxed/simple;
	bh=CgXWwFIG1rzbeLp9R8d/hJo6ANfBEUMnCUfNgzUlU3I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gSwOP0QxHWQPFziULJrI43DYcjRYCvmsDli2ZxhKefFOfKK+7T+56j4m/AaokZMUtrN5Tg8x8opbe3nhbZoLjJ/fqawtr4gD9l41eCF0s3XVEaveRRYZ5X1H00QEIBARqj2e5r6CFSuXNvDzdbIKFpKnR4trsz0YwRGcFgZZ6Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gwJiaAqy; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gwJiaAqy"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30db1bd3bebso18202221fa.2;
        Fri, 11 Apr 2025 06:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744376968; x=1744981768; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zuLCjM7isZBiWAGYzmF65fCZGLZ6vMHE3L8TUytQU3M=;
        b=gwJiaAqyVmAwoUcgNrmuASEwHU17dZys8Q+JbbGPRZ0J/QDRVp53IiPOFAezjlfwxi
         e1XTHOBVNtT4gC3qn8FEaprIgANXSX2igznBIEGp8DrWtOxNTDOG3eVTcZsLv7pxPiOn
         MXRuL6IrjJ74nBCTO0ajbiUU9r7l77l1BXzirKy7fRBwL9yc6e0JTO1W5Pzdfr96oxZV
         ye1eRDIZHsvdvvRg5aUb/IaAtLSHVI+OtFU7rlexRNGRC0bhH/qnKPV+2ys7b5SVcN/8
         Vrt4g3+lK3Yl8os55FOpoQT4VVrrGMJfvhUsGWyXqCSH8e4r3UGxyufjInGxfZpRjjD8
         fXkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744376968; x=1744981768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zuLCjM7isZBiWAGYzmF65fCZGLZ6vMHE3L8TUytQU3M=;
        b=mh9WOCgSyrGipl7IHDPCdbKzGreadItbBHL+fLgpjH/eTj0dzBSGwSW2LjOT8T8St/
         IgtyMIAL7Cm5C4knBZgJ5eqqNk7VmA4l2Pyzxbnsy8rfYKDPitDpNtW2WJIyzcIn5deL
         DPeAn1baddMBe8W0ziCZD544bNCwYhCck3bFkqJ2iGW47isNbLsUjbnauRkYUhqhsSFj
         3lwj6UbKxpU3bnjt4mUCkI/BUq9lSeSCrljGWJWl3H6OqYj0wl0uXSvYWL9Dtn4BSIaf
         XaVaS/C1NYudhrnTcSxeMsR2IVzV5WGwgw3owv95MzTxbDvGmqiBegpH4ls3vUmOnEyE
         9jPw==
X-Forwarded-Encrypted: i=1; AJvYcCWPeXkDglgFKuiX0tNqsKp2yCbEZYashpcDFUM7wEzeDiM4o5IkEGnZ3sk67e3WjrpDPz0G34QMRwY/Jhk=@vger.kernel.org, AJvYcCX1S3m9fNk8V9PuUq7UenpYkxqKIbc/qv90L9xGfTD63efmWp0UTyHpE8sxVoE9t/7nkpkPmrybbKnijmgc/0s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYGLDaHusBjdGv7xk/aPjx+qLM1cEtnhvJGK5Fyfsg1joTwv7b
	pBWGupoKWT/55/Gon45qqMDeC1jarJXIj0j4Y+pKAut2If4RkWJpgDd9X1hT1qaeTbqzcrcfneF
	5OrwYOl/Q6tuqMQs3l3UQvVhmL4o=
X-Gm-Gg: ASbGncv/Vo5ssm2MnSjUC9ag0Yih5rnCFv/q/Ec/o9B/Qq5sn3z4i2U16tzr1/WVXR/
	DYGMFhU9TNzHkuHxBEyibSAOHzcmNKZ14fo1u4ra6uajYyNcK5lemAXEhZm3TumtYfoxj9ssaXr
	cT5Ww1ukL0/teD4CGyR9gSKQdz7ZEyIbONTYllswGgZjcEPrlVfrpj14imQ/zUXCxUYA==
X-Google-Smtp-Source: AGHT+IFFMH84ro4JijeQOA3E8kL52gqwCL5KW48kWNmyG/cUtLHNV8xMuQFwiv8kUxi+X3wZySSOl9TPJBEAC0iTniw=
X-Received: by 2002:a2e:bc1c:0:b0:30d:e104:a942 with SMTP id
 38308e7fff4ca-31049aaf9d7mr7492851fa.38.1744376967856; Fri, 11 Apr 2025
 06:09:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409-container-of-mutness-v1-1-64f472b94534@gmail.com>
 <Z_jakOS8mciIpxy0@google.com> <CAJ-ks9kEMwpDoys=RJGfWvyLdRco_Lm1984KSmju7mio5_5_WA@mail.gmail.com>
 <D93TAL6PHO34.2WCMTNVGUY522@proton.me> <CAH5fLgh6gmqGBhPMi2SKn7mCmMWfOSiS0WP5wBuGPYh9ZTAiww@mail.gmail.com>
In-Reply-To: <CAH5fLgh6gmqGBhPMi2SKn7mCmMWfOSiS0WP5wBuGPYh9ZTAiww@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 11 Apr 2025 09:08:49 -0400
X-Gm-Features: ATxdqUEH8pJZdWWYxl3eFvEljOvRQsfpUkzaSL8kmaPLuCBZvm8GDaS6Gdepqk4
Message-ID: <CAJ-ks9k_0Ly1nG5jDYQZL=GQ26FVajekCaMQ9C3MOK9VknZssg@mail.gmail.com>
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

On Fri, Apr 11, 2025 at 8:38=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> On Fri, Apr 11, 2025 at 2:35=E2=80=AFPM Benno Lossin <benno.lossin@proton=
.me> wrote:
> >
> > On Fri Apr 11, 2025 at 2:25 PM CEST, Tamir Duberstein wrote:
> > > On Fri, Apr 11, 2025 at 5:02=E2=80=AFAM Alice Ryhl <aliceryhl@google.=
com> wrote:
> > >> On Wed, Apr 09, 2025 at 10:43:16AM -0400, Tamir Duberstein wrote:
> > >> > @@ -199,9 +199,8 @@ fn panic(info: &core::panic::PanicInfo<'_>) ->=
 ! {
> > >> >  #[macro_export]
> > >> >  macro_rules! container_of {
> > >> >      ($ptr:expr, $type:ty, $($f:tt)*) =3D> {{
> > >> > -        let ptr =3D $ptr as *const _ as *const u8;
> > >> >          let offset: usize =3D ::core::mem::offset_of!($type, $($f=
)*);
> > >> > -        ptr.sub(offset) as *const $type
> > >> > +        $ptr.byte_sub(offset).cast::<$type>()
> > >> >      }}
> > >> >  }
> > >>
> > >> This implementation does not check the type of `ptr`. Would we not w=
ant
> > >> it to have the type of the field?
> > >
> > > I might be missing it but ISTM that the current implementation doesn'=
t
> > > check that either.
> > >
> > > It's not obvious to me how you'd implement such a check; given `$ptr`
> > > and `$f`, how do you get your hands on the type of `$ptr->$($f)*`?
> >
> > I don't think it's possible with current rust, but maybe with field
> > projection (:
> >
> >     ($ptr:expr, $type:ty, $($f:tt)*) =3D> {{
> >         // do not run this code, only use it for type-checking:
> >         let _ =3D || {
> >             let mut ptr =3D $ptr;
> >             ptr =3D $ptr.cast::<<field_of!($t, $($f)*) as Field>::Type>=
();
> >         };
> >         let offset: usize =3D ::core::mem::offset_of!($type, $($f)*);
> >         $ptr.byte_sub(offset).cast::<$type>()
> >     }}
>
> You can definitely implement the check with current Rust. You use
> addr_of! to create a raw pointer with the type of the field, and
> trigger a type error if `ptr` doesn't have the same type as that other
> pointer. Something along these lines would do it:
>
> let mut ptr =3D $ptr;
> let offset: usize =3D ::core::mem::offset_of!($type, $($f)*);
> let container =3D ptr.byte_sub(offset).cast::<$type>();
> if false {
>     ptr =3D ::core::ptr::addr_of!((*container).$($f)*).cast_mut();
> }
> container

It's a nice idea. Wouldn't it require `$ptr` to be `*mut _` and not
work with `*const _`? In any case, I hope we agree that this can be
done separately.
