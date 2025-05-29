Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B87F1DEFE8;
	Thu, 29 May 2025 21:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748553604; cv=none; b=EOYy/bwLUWKXHA9VfJddElwCJhGKI4wU1YGN4zQv1ndL93NDHtvOjOJmWKsDOPDZVZn4nhe1cLTASQl+Ib8DpVe6YRmgJNSM8lRNcIhNTkzWjqck5z+j2pmiSfFwCGKYyxMeuKZIa4Km3V/eYQUTYmaordlw5rGHi8eiYiFdJlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748553604; c=relaxed/simple;
	bh=0++LZUZpJ3GvBids+E5UU/owBZZ4gJOS4xWxQrexAuQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lmkz/je6klQjSXTmUxTq6gSoH8E6f1qU4QTbvYxct/5lN8Og5wGZT63zJIfNNKifqwtzWqi6SxiO2bbwltU1otOvjyOG97CBEbTPKD2kcw4zTZO5da9rmOrpMNXHyy0Iu1kRPBI7ClTV+jDN334Um/bPsq9/2Vsc7vTOmb5+SSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gCJizGB5; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gCJizGB5"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3087a70557bso186891a91.2;
        Thu, 29 May 2025 14:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748553602; x=1749158402; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LULgnj8mgpeuIbU+1+RH9F8LPHyJxHaqsByN5Cl7VAY=;
        b=gCJizGB55tzfwqwoQk/y+MLoBMS+Td68gmiQ1E6HY8LZrX+d0uIiaxFoEjZ7+RKcDX
         2jaVIXAlscFfMfTpMhcZ8z/p0Ph4H9X4vPmkGhPxfpXpsulLSRsdrUD4c9HrVdGfX+ev
         Sh3mys6GEJRCTml211U7iNyUgq5Ll2mVo5J1w8vqu3SPlfzaMH6gI2g8pVnbQcrNUTV1
         5aFTQ6DfIImVM3j/CGqxzmPYoCO5Y+27ieiIkCC7LAqzT+p5c8XYtKJAZrCL/DwnK+a1
         xAwZpQvvpimt/OOEtJqUBz/DQbvuj11iDXdm6MyXL7m1adDVpKK/ozuucmxWpvvCp3KQ
         Xf7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748553602; x=1749158402;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LULgnj8mgpeuIbU+1+RH9F8LPHyJxHaqsByN5Cl7VAY=;
        b=h7Rom9DtfsurdbrgeHoVL0RFibfwANJmry6urmLj5ZkmG6PZJjCqeG0NDUUMNcyuGe
         kvAxdYoQ2bwVOONWF9CtqoC87vArL/sAPGDmHfXqcMwqRgm6FA+ffbN8cNtPIREvHWY7
         lcXRilZtkjV50OxbdEWa5OoGeXqnsKXb6pJmU+4sSXXeqptG+HI9rvB3MKfrjVULoBZB
         2/NyxDGdwIR49Sm3tiVYYOucOw7n9IXbGkV7Jm5xtIfgbpLq9nZqQRmHBfWiW3uA4vls
         CgC+/IfLHn7UH32Q1Y33EcpKSdBkyBdeBUC2JcUYn4gm2JBkuDZdWZqNM30BrSegsRwb
         lGWA==
X-Forwarded-Encrypted: i=1; AJvYcCW3leiP1soVqbvxm+qvMGErfHQHdiCLuGe7+mGoOyDwKPEZZZkDP6ODEsWX1SJ74oolqpvZdOfd6tENGXsoBOI=@vger.kernel.org, AJvYcCX3DyyjpK5VBqIIiAOv4Yk9UymwqppFo/JB1ZXhmRNgCAcfAu67B7u984TcJqxX+fW6aNYc9uYh7vxzcns=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0eZ5Vj5SZoL6F3KNxItaZK4FEHgH75i5MIdubJPyk9+P6io9x
	LcgVBO6kN4i8tzgE5fE6v5SCabYw8pFJztJYE5/64FOnMj4uuOpeQv5Be9wqvx7r32ICfcflqcH
	NSFSpbq5aGp7JwVAKCfT1/DNkRDchI10=
X-Gm-Gg: ASbGncv6HDhuDqQIBW4mDAZRTOj2EVJT3RulYddI6nXSpD0tZv287G/KrvvDkWW5/un
	0DEe7b4tg53h1W09ds19xYjSE9QNCaXR5hyNxwqKKeOawpgRRT9154xzO8V64m/tBgduBicNlpl
	flMzL68AoGV+yCN+kFYE97dqOLa297oOwL+OrE1ha/NRf7jXTn+bPGtQ==
X-Google-Smtp-Source: AGHT+IES40CgwS/YOf1l/IjgZf9QAjUIUwge87svyQafynEBoF9nUJVQIWezfhgcz4uExX9A7iXpfvv4mP9es0kcvxI=
X-Received: by 2002:a17:90b:1f81:b0:311:e8cc:4250 with SMTP id
 98e67ed59e1d1-3124daf3e85mr26367a91.3.1748553602532; Thu, 29 May 2025
 14:20:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250529-b4-container-of-type-check-v4-1-bf3a7ad73cec@gmail.com>
In-Reply-To: <20250529-b4-container-of-type-check-v4-1-bf3a7ad73cec@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 29 May 2025 23:19:49 +0200
X-Gm-Features: AX0GCFu8AdUNF2fm6Omgj-O7DrSdoGzRyUjuJjYBjmiFifBnmxvk1MXSWCtJDsI
Message-ID: <CANiq72mFiCrzawVUVOU2giJtBVsRdAO3sGtDsZptPuFvmid3EQ@mail.gmail.com>
Subject: Re: [PATCH v4] rust: check type of `$ptr` in `container_of!`
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 29, 2025 at 3:11=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> Add a compile-time check that `*$ptr` is of the type of `$type->$($f)*`.
> Rename those placeholders for clarity.
>
> Given the incorrect usage:
>
> > diff --git a/rust/kernel/rbtree.rs b/rust/kernel/rbtree.rs
> > index 8d978c896747..6a7089149878 100644
> > --- a/rust/kernel/rbtree.rs
> > +++ b/rust/kernel/rbtree.rs
> > @@ -329,7 +329,7 @@ fn raw_entry(&mut self, key: &K) -> RawEntry<'_, K,=
 V> {
> >          while !(*child_field_of_parent).is_null() {
> >              let curr =3D *child_field_of_parent;
> >              // SAFETY: All links fields we create are in a `Node<K, V>=
`.
> > -            let node =3D unsafe { container_of!(curr, Node<K, V>, link=
s) };
> > +            let node =3D unsafe { container_of!(curr, Node<K, V>, key)=
 };
> >
> >              // SAFETY: `node` is a non-null node so it is valid by the=
 type invariants.
> >              match key.cmp(unsafe { &(*node).key }) {
>
> this patch produces the compilation error:
>
> > error[E0308]: mismatched types
> >    --> rust/kernel/lib.rs:220:45
> >     |
> > 220 |         $crate::assert_same_type(field_ptr, (&raw const (*contain=
er_ptr).$($fields)*).cast_mut());
> >     |         ------------------------ ---------  ^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ expected `*mut rb_node`, found `*mut K`
> >     |         |                        |
> >     |         |                        expected all arguments to be thi=
s `*mut bindings::rb_node` type because they need to match the type of this=
 parameter
> >     |         arguments to this function are incorrect
> >     |
> >    ::: rust/kernel/rbtree.rs:270:6
> >     |
> > 270 | impl<K, V> RBTree<K, V>
> >     |      - found this type parameter
> > ...
> > 332 |             let node =3D unsafe { container_of!(curr, Node<K, V>,=
 key) };
> >     |                                 ---------------------------------=
--- in this macro invocation
> >     |
> >     =3D note: expected raw pointer `*mut bindings::rb_node`
> >                found raw pointer `*mut K`
> > note: function defined here
> >    --> rust/kernel/lib.rs:227:8
> >     |
> > 227 | pub fn assert_same_type<T>(_: T, _: T) {}
> >     |        ^^^^^^^^^^^^^^^^ -  ----  ---- this parameter needs to mat=
ch the `*mut bindings::rb_node` type of parameter #1
> >     |                         |  |
> >     |                         |  parameter #2 needs to match the `*mut =
bindings::rb_node` type of this parameter
> >     |                         parameter #1 and parameter #2 both refere=
nce this parameter `T`
> >     =3D note: this error originates in the macro `container_of` (in Nig=
htly builds, run with -Z macro-backtrace for more info)
>
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Link: https://lore.kernel.org/all/CAH5fLgh6gmqGBhPMi2SKn7mCmMWfOSiS0WP5wB=
uGPYh9ZTAiww@mail.gmail.com/
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Applied to `rust-next` -- thanks everyone!

    [ We decided to go with a variation of v1 [1] that became v4, since it
      seems like the obvious approach, the error messages seem good enough
      and the debug performance should be fine, given the kernel is always
      built with -O2.

      In the future, we may want to make the helper non-hidden, with
      proper documentation, for others to use.

      [1] https://lore.kernel.org/rust-for-linux/CANiq72kQWNfSV0KK6qs6oJt+a=
GdgY=3DhXg=3DwJcmK3zYcokY1LNw@mail.gmail.com/

        - Miguel ]

    [ Added intra-doc link. - Miguel ]

Cheers,
Miguel
