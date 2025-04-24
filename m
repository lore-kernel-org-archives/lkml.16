Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF95C186294;
	Thu, 24 Apr 2025 13:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745502512; cv=none; b=F5WDIbnXVjaDjOfuEUpgK1FbCStHYuTilVZicHkJBVvTj1v8u2aR+O7d2oah+K5DizcaXy5B9Ni5JOGEFWHZIT1ayn/1Nz4dyQQY4U5DwsRNzgLqJ2j4LItJV3Ra2URie78Yw4AVdjQ+cG+W2zkTJRd+uhRhwyW6TdrVcMdEIQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745502512; c=relaxed/simple;
	bh=qvIve6pwWQ5C2gYqgC67Nyk4ECh/prYFjYyaen8N8ME=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qnZG+MBTnbc3HtM/nwn8lJf0oOtthEwltCYdenNa7hSTZxgPzW8N66Lzcd0PM6NAz7GjSI1sJaYL3Ffl4LYXfuMsnedMRKYUe1CekZAK8qIRBsZUFpfn/aI3JxWqzpyy6y20KKvGVC+zYnkxn2RD5+oVFMAja4tmeN2a2zTqx9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=foryxtg2; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="foryxtg2"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30bfd4d4c63so9757051fa.2;
        Thu, 24 Apr 2025 06:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745502509; x=1746107309; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0RwzVTwG8nmHSDimraa9LWFea9Cdtru6px1wsv7MBh4=;
        b=foryxtg2kpRKFvTGfnNZojtHm2DZ4BqHY/NAYRtORxOaCJ8rjSC3taa4yCNBlAXMb8
         Lwx62tXS+pA2VFaFr//HfPxs5uZc+biDs4KqMnLvAXEf5qSvb08prIMXoZdwzmLuNHW3
         SE0fIAGLw3uCJ1ageNUZRX3RcVWPn39izyqnMTfAuTtJfDR/rr0RmT2/yMVoJu2asBgy
         KphtCQMomuc8rCDEwq/e4agQFLblnbqxFaibLxrumzRg3iD+6o3HToqafcRWXqjTyczt
         cN5/GELn4y4Hrim7vRR75dzjc83Vj4rp0G3/ZMsPBbXgv2n1L91JmKHk4uTfJGYkvNYa
         7roA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745502509; x=1746107309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0RwzVTwG8nmHSDimraa9LWFea9Cdtru6px1wsv7MBh4=;
        b=plaeue5v77OcJ1vHgp7Cbjk18cFpM2rwRZ8K8u75fXbQ5nfLveZ3qiZYwkQ8FwMlwx
         7kD0WAilX6QgZ32upnFNhcjbNyJlP2PRUKNH1AN5v7kWko9Yjyum+YloGnzVajXq5Q10
         NCWmxhMPtlD3TWaTkMeYqK4G85zpQc7z8RyA+af2gADObQQBDQ7Vbt8oXtSpVDlBFVZn
         QxHmnGBxKrDP3NvUDICVl6u7b5/vOyGohjQf7t9Va0I+qG2SzLWMbaX22n7HxUJyE4NX
         mfZdhHU2YN2Igjxef585glzSMbVR2xuwTMoC2qY4EgMIeNyjwzmFrfGHuq3MdN1l64s/
         86qg==
X-Forwarded-Encrypted: i=1; AJvYcCULZIwzR2NNacGqwQaYluoVh7aKssw7T/YgZMPgwvOGlcyFLIGeERYWan2gT8H/512YvNSpUxoOPDLoxJE=@vger.kernel.org, AJvYcCWTtbcruru/gc3Qg/ShoYPaO4G1kpIjL/UJ0TFxk3izt5hHkHF+i7RmC+F2tfyuFyvuvwQKIcXIG32eKaceNR4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNAkE4R+okomvjHGRB+M5tWcY+p/S62A18O57IOobOnNfvp2lT
	qJYujUhEpKdZjkgl9FPthkmop/yi1bK3nftDssnUMdw+bsPpkX5HKiOh81p11VkK1Iwei8I2ECW
	AJunPcAM27kHo0uLrDdMlP5ddDLs=
X-Gm-Gg: ASbGnctsGaN1Gb/cMVfPYrz+W74jsB8BIdq3Twm0IoU8OGF3fDzfu7byd7DxJynlH7j
	Hfv10zEAiCvULRTIsj5Lf/Uh2LArJWNEc9Hww9wQ/1G6Fg+p7MVr9kBSx8d7FCr6nWKObF1532r
	QoUJWKBzAT6eWVA+UPzrW+vcJ0ltXNb20e7pQz6g==
X-Google-Smtp-Source: AGHT+IGfYtqtqnEQUmVVtVkr9ACHBDu7yCTF+ZijzmAOFXGQaNxtgq89CZsSs5L3NcdakGMOgFAKoAOhJbpVJkpsElg=
X-Received: by 2002:a2e:a588:0:b0:30c:177c:9e64 with SMTP id
 38308e7fff4ca-3179ffc89aemr9631721fa.35.1745502508531; Thu, 24 Apr 2025
 06:48:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423-b4-container-of-type-check-v3-1-7994c56cf359@gmail.com> <aAomRMzyu3EX5Xal@google.com>
In-Reply-To: <aAomRMzyu3EX5Xal@google.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 24 Apr 2025 09:47:52 -0400
X-Gm-Features: ATxdqUEyShDrMfzYO0ZcV0Cacwz0kfxfITOaTr0jwTwMEZmEjiAEwXlZ4uo-zMg
Message-ID: <CAJ-ks9nMqjj85rK6LsSnTPqsTHmMUDJsQxqJ7n2+r4oSZqBibA@mail.gmail.com>
Subject: Re: [PATCH v3] rust: check type of `$ptr` in `container_of!`
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 7:53=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> On Wed, Apr 23, 2025 at 01:40:10PM -0400, Tamir Duberstein wrote:
> > Add a compile-time check that `*$ptr` is of the type of `$type->$($f)*`=
.
> > Rename those placeholders for clarity.
> >
> > Given the incorrect usage:
> >
> > > diff --git a/rust/kernel/rbtree.rs b/rust/kernel/rbtree.rs
> > > index 8d978c896747..6a7089149878 100644
> > > --- a/rust/kernel/rbtree.rs
> > > +++ b/rust/kernel/rbtree.rs
> > > @@ -329,7 +329,7 @@ fn raw_entry(&mut self, key: &K) -> RawEntry<'_, =
K, V> {
> > >          while !(*child_field_of_parent).is_null() {
> > >              let curr =3D *child_field_of_parent;
> > >              // SAFETY: All links fields we create are in a `Node<K, =
V>`.
> > > -            let node =3D unsafe { container_of!(curr, Node<K, V>, li=
nks) };
> > > +            let node =3D unsafe { container_of!(curr, Node<K, V>, ke=
y) };
> > >
> > >              // SAFETY: `node` is a non-null node so it is valid by t=
he type invariants.
> > >              match key.cmp(unsafe { &(*node).key }) {
> >
> > this patch produces the compilation error:
> >
> > > error[E0308]: mismatched types
> > >    --> rust/kernel/lib.rs:207:25
> > >     |
> > > 207 |             [field_ptr, container_field_ptr]; // typeof(`$field=
_ptr`) =3D=3D typeof(`$Container.$($fields)*`)
> > >     |                         ^^^^^^^^^^^^^^^^^^^ expected `*mut rb_n=
ode`, found `*mut K`
> > >     |
> > >    ::: rust/kernel/rbtree.rs:270:6
> > >     |
> > > 270 | impl<K, V> RBTree<K, V>
> > >     |      - found this type parameter
> > > ...
> > > 332 |             let node =3D unsafe { container_of!(curr, Node<K, V=
>, key) };
> > >     |                                 -------------------------------=
----- in this macro invocation
> > >     |
> > >     =3D note: expected raw pointer `*mut bindings::rb_node`
> > >                found raw pointer `*mut K`
> > >     =3D note: this error originates in the macro `container_of` (in N=
ightly builds, run with -Z macro-backtrace for more info)
> > >
> > > error: aborting due to 1 previous error
> >
> > Reviewed-by: Benno Lossin <benno.lossin@proton.me>
> > Suggested-by: Alice Ryhl <aliceryhl@google.com>
> > Link: https://lore.kernel.org/all/CAH5fLgh6gmqGBhPMi2SKn7mCmMWfOSiS0WP5=
wBuGPYh9ZTAiww@mail.gmail.com/
> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
>
> >  rust/kernel/lib.rs | 12 +++++++++---
> >  1 file changed, 9 insertions(+), 3 deletions(-)
> >
> > diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> > index 1df11156302a..d14ed86efb68 100644
> > --- a/rust/kernel/lib.rs
> > +++ b/rust/kernel/lib.rs
> > @@ -198,9 +198,15 @@ fn panic(info: &core::panic::PanicInfo<'_>) -> ! {
> >  /// ```
> >  #[macro_export]
> >  macro_rules! container_of {
> > -    ($ptr:expr, $type:ty, $($f:tt)*) =3D> {{
> > -        let offset: usize =3D ::core::mem::offset_of!($type, $($f)*);
> > -        $ptr.byte_sub(offset).cast::<$type>()
> > +    ($field_ptr:expr, $Container:ty, $($fields:tt)*) =3D> {{
>
> It's rather unusual to use an uppercase C in the name of this parameter.

I took the parameter name from `offset_of`:
https://doc.rust-lang.org/stable/std/mem/macro.offset_of.html.
