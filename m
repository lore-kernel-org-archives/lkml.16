Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECCA20AF8B;
	Fri, 11 Apr 2025 15:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744386158; cv=none; b=gxEjmZLjBVLxvbuxnS4xPqqf+CrI1sn78dNFWPSVaI3ev/2dKzyHG8MKdxeLMcCPvagMYKHzzocZ7X7yG4cF+yf/vhJtMwFcUT2q1UXM2LrQ4WCVv0Lr9pWi+JTDXq/jyCkXRVmYsFBD11NWJlhnWVDlkhNesETos8Vk6teefqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744386158; c=relaxed/simple;
	bh=gnBbhv3mvF+tMBrml1VYiY9ms1MrU/Z6u0cONi8wxSA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jzYi06R399gYknA7n6Gxh3jTELDCA4ysTHbFRH99SIby3hEJZ+2cOewIkvaVnWguKtamQNVR+3orWd1jXLADMxcdTV9PVNvLGA8DzbM1kQGpmrybdrkJXwz6T+diWPXB7tzOWD6DIomm4OTTRe69uRZ3plWrnmij0tZTmqYv5GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GHsViSc+; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GHsViSc+"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30ddad694c1so20529901fa.2;
        Fri, 11 Apr 2025 08:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744386155; x=1744990955; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kr3QCC4yWSYbKwa/9QhuMeCkhanmC+lmaNqfSwbnS5A=;
        b=GHsViSc+FZobfR3ja+bCk9Fw8BnYt49QY+81ptIt0P9diLCgcMJSuKcO7Ss/Z0MJJU
         s09NXjoE7YkSjnfm1KjVjQLC6qlZfOLiTdvnQicdchg0He47Y7Ln3dAn1bLna9s+uClm
         83lwsvpt/jrTXLbqZRHLXLYOv+mMqDiKHxZxkayefnhqALJnXXH0aqxntJSGAKufOVu3
         Wnx+WK/yAt19ymTEKFmv7S2338lKt5lNXy2hRGuPuQ31cL/LLxpI57m/i4aVELXUhSTt
         sqVxCymbgTViDF19CbfYg3pngze5e/UaLLoDRTqDg0QRZWs7EqXKuJqfcIVzkWygGWQP
         l6fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744386155; x=1744990955;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kr3QCC4yWSYbKwa/9QhuMeCkhanmC+lmaNqfSwbnS5A=;
        b=QebJPFU1F7rxPQ4Es0wWc4nIi+pqrXXtxapha4G4dvJGyi0MBeSn1Gw7AXNQn50vQD
         +6ERegfWKDw1qhy7bsArIfrXO1BPy8BYwNY490v8IEErPWvJIQZf4X+H1Tr7Q+3hZjrU
         p3twV6u3oe4Cbk1qcDXP3btBvZygLnUt7ib7SLcEOtPz/5KoIjh3SD+PDHx/1DkTDjTa
         r5EyuwAi/HC1raXHie9uw/0fkoAMlyh7n7/83TFrnOYcmhCc1eYzp11YDqrKWgIUx14E
         ibzE0hxOdtmlBnhCNIYHBtFWrOah+V+1t+P6OgFfTKrYckB6rW/LtI0FDr0SXFnp9SXG
         QXeA==
X-Forwarded-Encrypted: i=1; AJvYcCWSMY+kZhrVmU90oLWzYhxCq+ZMr5CikadBktu0Gp5TZWfj9QqEH9XWfbBgZZN1O+iOqVt25E1ICYRS8j07VeA=@vger.kernel.org, AJvYcCXcxtjSmgnsAHC+9sb8LtdZuVyzOsVoDOauAGvtjjLZTxmJauV/brt3frvDX+qghux5MGuseFGdXvT9dDo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2ujvZySA7SXV7I0RcJ2/OgPmNoblYA0hlQijO9qWrl4hJ7liS
	0K7qWYM4wxmWxr7q24jojmFK4v6eQCd6OlXLdo158TpQEy9P0gRJ9yE8x7F5rPncGNdOXcjmAl2
	g36jIsoN1ZKIf+11QBD7AawXZ30Q=
X-Gm-Gg: ASbGncuCS7MH42tVduTyDcdSW1zHgjPhaY9ltVh00r2Hd6Yg4+Yf/Q0fdoIPu1G3j+o
	tl6aE7a5949BiPZvooVBYZLegeAeOxDU+W+Nui0DIlZk992yHcvJKaTikF54NnsJKB+XuPXq67m
	+SLRI5nmLoSQKaaJKphtNDt+Drf9R1oJ6EkjTWx8F61vLW9rj4Vu+8hxs=
X-Google-Smtp-Source: AGHT+IGXllipXTRH1B7RCI1/+JP74F4QqJHZv24mWNB5IxvRlsMhMoOKHtNPJ9AgyhdL9Ew/4sCCUn/ayOAWRwe3dVA=
X-Received: by 2002:a2e:a80d:0:b0:30c:317:f3ec with SMTP id
 38308e7fff4ca-310499faf2fmr12639361fa.17.1744386154905; Fri, 11 Apr 2025
 08:42:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250411-b4-container-of-type-check-v1-1-08262ef67c95@gmail.com> <CAH5fLgioEPTrh0vYt5zdmj8POCMyDdV+Bd=j_M3PZ-EdKLZtTQ@mail.gmail.com>
In-Reply-To: <CAH5fLgioEPTrh0vYt5zdmj8POCMyDdV+Bd=j_M3PZ-EdKLZtTQ@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 11 Apr 2025 11:41:57 -0400
X-Gm-Features: ATxdqUGPZVazUuzjrRM_oICvr2LuOUO2diQhg6U1ull5a1KS_QlsccB8V9o_UkI
Message-ID: <CAJ-ks9ngPKeoR86WX=qcuS8LtMafZuRXQt7+J9YRv+NVoSgr-A@mail.gmail.com>
Subject: Re: [PATCH] rust: check type of `$ptr` in `container_of!`
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2025 at 10:36=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> On Fri, Apr 11, 2025 at 4:31=E2=80=AFPM Tamir Duberstein <tamird@gmail.co=
m> wrote:
> >
> > Add a compile-time check that `*$ptr` is of the type of `$type->$($f)*`=
.
> >
> > Suggested-by: Alice Ryhl <aliceryhl@google.com>
> > Link: https://lore.kernel.org/all/CAH5fLgh6gmqGBhPMi2SKn7mCmMWfOSiS0WP5=
wBuGPYh9ZTAiww@mail.gmail.com/
> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> > ---
> >  rust/kernel/lib.rs | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> > index 1df11156302a..da9e36aa7967 100644
> > --- a/rust/kernel/lib.rs
> > +++ b/rust/kernel/lib.rs
> > @@ -200,7 +200,10 @@ fn panic(info: &core::panic::PanicInfo<'_>) -> ! {
> >  macro_rules! container_of {
> >      ($ptr:expr, $type:ty, $($f:tt)*) =3D> {{
> >          let offset: usize =3D ::core::mem::offset_of!($type, $($f)*);
> > -        $ptr.byte_sub(offset).cast::<$type>()
> > +        let container =3D $ptr.byte_sub(offset).cast::<$type>();
> > +        fn assert_same_type<T>(_: T, _: T) {}
> > +        assert_same_type($ptr, ::core::mem::addr_of!((*container).$($f=
)*).cast_mut());

I noticed I accidentally sent `::core::mem::addr_of` instead of
`::core::ptr::addr_of`; will fix once we agree below.

> Perhaps it would be better to wrap the type check in an `if false` to
> avoid evaluating the expressions at runtime?

It's optimized out at O1: https://godbolt.org/z/44Go5xnWr. Is it worth it?
