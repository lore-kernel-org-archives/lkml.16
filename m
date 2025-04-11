Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F676290BC8;
	Fri, 11 Apr 2025 21:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744407604; cv=none; b=AlETwJLzx/1GBTl4uYdFNMjVA3sE1jTkDdkkJaO6OhyhWEgyaUaiqa7e5MmVo2tKbPKGCtJ5WO5esyqa05dK82pVvzVNDgHbOjpTiQaZMJuo+Lf+wAb4KR4ykUIcSL0iuKe3TlPUGl41fz6kH/o6dZFkYyYsyEfcQ2RLpEBaJCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744407604; c=relaxed/simple;
	bh=l2ixHkDHu4UF4khfs4dZMY5WNUrhbcoQx9KKnNu5lhM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CXnFFgf8FQRXMnOJNbm+m2z+e2Tx2ZR/8LlBFJEv4dE35ZSvA9xu0Q04wJFl/dte71mCjsk+waH9pTkXIoA/Phqmd4UySj9/Orm7qzV2URD4sBeX8V53IIJyMyDnph+X7bHyjbkEIuRfKNEDNTY4w/fxxHZDds252y2Rc4f798A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T73bdhJl; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T73bdhJl"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30de488cf81so22948721fa.1;
        Fri, 11 Apr 2025 14:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744407601; x=1745012401; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cHzvTKqQnZsFJhyl+9CHQINwYQjJikJQzP1SZXJrQco=;
        b=T73bdhJlUOKQN2nM1z+O7nmgvJqs0sMSwhLfd0fbr5stIdfrXzeeg4jm0+9+JvccQT
         SYoASt5devBnqvD3tgS4aQZDibbH4xsCXw/plA54+SUW0hsW3A0zsvD+0a/7owNMPTtQ
         GHa1zuRXxJHx3uYXZVUiQbvSsIltIozqm+yfcLrDNSfy5WL+uPJlt/2BObq8KzxuP1+v
         QeL70e/rqsNXFOK8LTP3WNxeC1L32v0qla9MdBKAYLa5MmKv7nAbafk+eiB37KxlN1m0
         bfy1r7OE/2GRbZHZMGtAjbFYxxYbMjHrcasacdrwr2xMOf1j1+XNJ6zQbMvj8PQZfR8f
         eUdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744407601; x=1745012401;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cHzvTKqQnZsFJhyl+9CHQINwYQjJikJQzP1SZXJrQco=;
        b=Z3E/WHUwOHnBYCqDLHEqtjMAk27JX/amwq357I2+Cf4IpwmFjkSoh9nN/KsgEKEgiM
         LWWQqueYWUhbH1J8qgid8QT+iXqcLkZoBDm2ZdGxzto/m8/lnwxmYwk4HQ/XG7xy33pH
         4tJm43gFRAO6hLk4n1favBNiJNsfRxZO9QM8FTzhcPh4lJUCMOAvYY+TP6O8dmbfV3SN
         lTJIQ1h6N5AzRoXMlViyT3g2VY8qSOMjgU5ViKxIjQlCikpu14vZxeXjZow8qfegaHzP
         YUm4nSF1cFbKcwADRvJH82J17q7CmDGTZpu0WzH+MOq7ThVLwaflWspDwutrCxycElTO
         P5jQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMGdVPbCHXij6HvuMInnY1D5s6DW4DhGCHdC/UfgevEJB2Snv8U/vDs40mol618GOsfXLb8mKzSi2h1K2A5Lg=@vger.kernel.org, AJvYcCWu6xSqXZKfdkNf7ubJV/frxxzwsJ35euWL6a5MIAjwX6ouhTgqVySuTKgAWVrQ+AZy69Ap/9RSr/7EfbY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5KXzg6izpuYOhtweqiYbQ8CyVfqgzhaDaTnKNeecR48Fofw9R
	/wy/KJWmw/JUTM3zl1fBKHDalH6D77pRVkRv+mYT1d5NUwXHcKTfSiKsBvziIS1InBXvBESWMkf
	4gTwLtJQpdR4XX7SlLaGpJjrRso0=
X-Gm-Gg: ASbGnctXv3vBxsCKczUFQOB1B4SmPiFL8bPiQhhTwatXoSSIN/meX6t5KMVoeBr7nyV
	Fnoop+1JsIWEQEFm0ek7TmPPR+EDwAveNj0f/UVf9aONdwEyAZnUebQ06RB8hCXfdae0gPkUwzr
	qTJp++WmeY5+xJqTsoHKzCNSlJSnWwji8+/VdN/Gz40HIRTdp5f8I1SQSiIEiP7SGkJQ==
X-Google-Smtp-Source: AGHT+IH+2crPQuINeW9TSPIxfXOGmDucWEfhDYdkSGFFACjH82AzFC8zYTVJPyk+jKuempZoI9F7qX2a5WP9LlYBZF8=
X-Received: by 2002:a2e:a9a3:0:b0:302:2598:de91 with SMTP id
 38308e7fff4ca-310499fb36bmr13550771fa.16.1744407600312; Fri, 11 Apr 2025
 14:40:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250411-b4-container-of-type-check-v1-1-08262ef67c95@gmail.com>
 <CAH5fLgioEPTrh0vYt5zdmj8POCMyDdV+Bd=j_M3PZ-EdKLZtTQ@mail.gmail.com>
 <CAJ-ks9ngPKeoR86WX=qcuS8LtMafZuRXQt7+J9YRv+NVoSgr-A@mail.gmail.com> <D944ADIR8SAC.1CRNV5FJ99TFD@proton.me>
In-Reply-To: <D944ADIR8SAC.1CRNV5FJ99TFD@proton.me>
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 11 Apr 2025 17:39:24 -0400
X-Gm-Features: ATxdqUFfQbsWSDpkBa1dp1WyLsAsilNsTwqJcn1WRDuFNchFqGtE_33d_jwZAhs
Message-ID: <CAJ-ks9kBpj1-_bwN_ncMc62indvviJv6zbpdJgd8JOf5o05a-g@mail.gmail.com>
Subject: Re: [PATCH] rust: check type of `$ptr` in `container_of!`
To: Benno Lossin <benno.lossin@proton.me>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2025 at 5:12=E2=80=AFPM Benno Lossin <benno.lossin@proton.m=
e> wrote:
>
> On Fri Apr 11, 2025 at 5:41 PM CEST, Tamir Duberstein wrote:
> > On Fri, Apr 11, 2025 at 10:36=E2=80=AFAM Alice Ryhl <aliceryhl@google.c=
om> wrote:
> >>
> >> On Fri, Apr 11, 2025 at 4:31=E2=80=AFPM Tamir Duberstein <tamird@gmail=
.com> wrote:
> >> >
> >> > Add a compile-time check that `*$ptr` is of the type of `$type->$($f=
)*`.
> >> >
> >> > Suggested-by: Alice Ryhl <aliceryhl@google.com>
> >> > Link: https://lore.kernel.org/all/CAH5fLgh6gmqGBhPMi2SKn7mCmMWfOSiS0=
WP5wBuGPYh9ZTAiww@mail.gmail.com/
> >> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> >> > ---
> >> >  rust/kernel/lib.rs | 5 ++++-
> >> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >> >
> >> > diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> >> > index 1df11156302a..da9e36aa7967 100644
> >> > --- a/rust/kernel/lib.rs
> >> > +++ b/rust/kernel/lib.rs
> >> > @@ -200,7 +200,10 @@ fn panic(info: &core::panic::PanicInfo<'_>) -> =
! {
> >> >  macro_rules! container_of {
> >> >      ($ptr:expr, $type:ty, $($f:tt)*) =3D> {{
> >> >          let offset: usize =3D ::core::mem::offset_of!($type, $($f)*=
);
> >> > -        $ptr.byte_sub(offset).cast::<$type>()
> >> > +        let container =3D $ptr.byte_sub(offset).cast::<$type>();
> >> > +        fn assert_same_type<T>(_: T, _: T) {}
> >> > +        assert_same_type($ptr, ::core::mem::addr_of!((*container).$=
($f)*).cast_mut());
> >
> > I noticed I accidentally sent `::core::mem::addr_of` instead of
> > `::core::ptr::addr_of`; will fix once we agree below.
> >
> >> Perhaps it would be better to wrap the type check in an `if false` to
> >> avoid evaluating the expressions at runtime?
> >
> > It's optimized out at O1: https://godbolt.org/z/44Go5xnWr. Is it worth =
it?
>
> Wrapping in `if false` definitely doesn't hurt, since we get better
> debug perf.

How's this?

if false { [$ptr, ::core::ptr::addr_of!((*container).$($f)*).cast_mut()]; }

Confirmed it's entirely gone from codegen: https://godbolt.org/z/fo3x13r5K.




Tamir
