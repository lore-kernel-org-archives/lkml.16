Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0432418DB16
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 16:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746115782; cv=none; b=WdVd63BmWCUAYjSQGMOhFZRWG/8PTIkiyEoreXqeyViE3mH+eZyGsSMIjU23/DB9ARWKG5GMClkkj5rNwTS6bQqRc2dqfCNL2lcwZmSDsPw27/hMlGBxrq8ZAX4pTaqR3QgZa9lD+W/oXRVSpaze+CicL74YiYpNP49g588o7hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746115782; c=relaxed/simple;
	bh=bBxC21kT1JanavCPIwyzVdV5Hwkbt7+efpIxPYFsRIA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o+DI5Ih59dtHPQO2vKsCXgtBe96tlfUbnbk9k9Qv6YF09p9tX/iv3b5xqtBEMCOHzJBLIciecccgRxWqCPn6XGw8d5Zy8pA8o37pe0nxTNmk5R3lywVDGtM3blBX/TsqFurch0rF2sHPvTcGCp3wbeO882+hHy8sob9G6hD+1GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=D4RGoGFF; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D4RGoGFF"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5dbfc122b82so8575a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 09:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746115779; x=1746720579; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3dGgS9+XYUY/AHlzebZpEHOHPGAamIAi76IFx8ruh4Q=;
        b=D4RGoGFFbWK1TwRR8QrOYm4j2z69oQquKUeiXhP7iCdMWIbgKViM6Xp/AbXTpEjf2t
         NJ+cT6wMrztKmDXyXgD0dp6dVMzdDrzPsc6mG1BvOk754XTJffWEBNAj/MEUpZ0vb1sg
         9SE6wo88R15cAi9PImqyZZwM7GXzFND3vcDYn5LXmqtAoIJ1+SCHaE9dvPdkAV2lfAjA
         kaYE9fYTS0DX7ptWLYcvfCsVyvsfKYtTs/v+UK73ZGVs+nitF2oUChCIqGoeL63kjTST
         jXNUcyf8EUSmMECzvOzBaKGk+XMc20cQOk8Ff6xbu+VUawo6d/BcvM69Fvh0heLyucac
         y+xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746115779; x=1746720579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3dGgS9+XYUY/AHlzebZpEHOHPGAamIAi76IFx8ruh4Q=;
        b=RzG5C+7RMka8faSykP/d/6GtQc4WY2b3QqqZujfKOT77g4s65CMI0qeCyqZAgm4cgI
         gu0kWkn2W/1ybvSzFIPqC6dK9qTMmWLuLEElIY3Bl3ibroav06ENqTHYARvA5xZEyQCB
         W7dtXAcDU4X+jhKFVMuetCakbI9uhKPwIvZOOpESxIYq4+CU1RLE4Pbn1Y3+Ob5InmPs
         5JkPOrokVd4QE+dUTbz8NYxxepKfVP9Tpef4NB4l8TXy7dzezktQ+6Pmd1NvWxQaYYoA
         7cQDJvJ6ZhEF5c7BSaSJKfb7NpEhj30grNRJVrmuPiWpltVk8Bdx4JyCBBqtkMBEzgxq
         lJCA==
X-Forwarded-Encrypted: i=1; AJvYcCX0aQbV7QZd9qrb6ZU+VjQoQ+YGoPXb6AdvJLLNFhKTa8/Ow85gFGyB8sPHhE/s3mWNV9zMMAcJEKRNBqA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw53FMSQyKfr1e/TUJUUKQjmveTuzBS2eWDM3aMEyXDpHXyGm39
	Gxodk3fyR3Z0opxx2F49oY0gAjv8wbKRhrZmZHzanCjWe7BCnpkTtRZxzI14F16Ugsn1rc0gw8R
	Abck5Zg2WrWvx6t1PoC01re/7yUBcf4Ta8cA4p13HnynUxdALTUDT
X-Gm-Gg: ASbGncsdt+UkBKaYGlk0ZSZ1wRLrpAhznkAQmjTc+MbMd1tfLzbC1u9T7uHzNkDvFsN
	4P4dl4L/BzX3MaMt0EDobzSQjfi7CJEGXVy8U4DXokwlFBik4NgpCiNAKjSTRyqoRieCDbeZjlR
	AjVPBYY22yK5WAkriPdAQaNJ7ef0euYfKJilbcZlRMg0Q8HUGbe9DC
X-Google-Smtp-Source: AGHT+IEom6KQ86FQp8tMj8EoyAHP0LGiZyNqtwcv9VNmGOeBoTizAog2I5Ty8E4oLEiIgxq9axgA+FgIDPtNJMmyoJ8=
X-Received: by 2002:a05:6402:b2c:b0:5f8:7b57:e5c2 with SMTP id
 4fb4d7f45d1cf-5f9145ec020mr100596a12.4.1746115779074; Thu, 01 May 2025
 09:09:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430-debugfs-rust-v2-0-2e8d3985812b@google.com>
 <20250430-debugfs-rust-v2-2-2e8d3985812b@google.com> <aBNO1rMcAwo-TNWQ@pollux>
In-Reply-To: <aBNO1rMcAwo-TNWQ@pollux>
From: Matthew Maurer <mmaurer@google.com>
Date: Thu, 1 May 2025 09:09:27 -0700
X-Gm-Features: ATxdqUEp0oFfHH9MsjJ7gnqTeaNSwguXWHJENgmAafy3ieIOzdQU6RDhpCoCots
Message-ID: <CAGSQo005hmZCJNBUJE+oJ9NH7e9wCALaGYLGN-DL_Du7+9K0YQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] rust: debugfs: Bind file creation for long-lived Display
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 1, 2025 at 3:37=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> On Wed, Apr 30, 2025 at 11:31:57PM +0000, Matthew Maurer wrote:
> > Allows creation of files for references that live forever and lack
> > metadata through the `Display` implementation.
> >
> > The reference must live forever because we do not have a maximum
> > lifetime for the file we are creating.
> >
> > The `Display` implementation is used because `seq_printf` needs to rout=
e
> > through `%pA`, which in turn routes through Arguments. A more generic
> > API is provided later in the series, implemented in terms of this one.
> >
> > Signed-off-by: Matthew Maurer <mmaurer@google.com>
> > ---
> >  rust/kernel/debugfs.rs | 102 +++++++++++++++++++++++++++++++++++++++++=
++++++++
> >  1 file changed, 102 insertions(+)
> >
> > diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
> > index b533ab21aaa775d4e3f33caf89e2d67ef85592f8..87de94da3b27c2a399bb377=
afd47280f65208d41 100644
> > --- a/rust/kernel/debugfs.rs
> > +++ b/rust/kernel/debugfs.rs
> > @@ -7,6 +7,7 @@
> >  //! C header: [`include/linux/debugfs.h`](srctree/include/linux/debugf=
s.h)
> >
> >  use crate::str::CStr;
> > +use core::fmt::Display;
> >
> >  /// Handle to a DebugFS directory.
> >  // INVARIANT: The wrapped pointer will always be NULL, an error, or an=
 owned DebugFS `dentry`
> > @@ -121,6 +122,47 @@ fn as_ptr(&self) -> *mut bindings::dentry {
> >      pub fn keep(self) {
> >          core::mem::forget(self)
> >      }
> > +
> > +    /// Create a file in a DebugFS directory with the provided name, a=
nd contents from invoking
> > +    /// [`Display::fmt`] on the provided reference.
> > +    ///
> > +    /// # Examples
> > +    ///
> > +    /// ```
> > +    /// # use kernel::c_str;
> > +    /// # use kernel::debugfs::Dir;
> > +    /// let dir =3D Dir::new(c_str!("my_debugfs_dir"));
> > +    /// dir.display_file(c_str!("foo"), &200).keep();
> > +    /// // "my_debugfs_dir/foo" now contains the number 200.
> > +    /// ```
> > +    pub fn display_file<T: Display + Sized>(&self, name: &CStr, data: =
&'static T) -> Self {
> > +        // SAFETY:
> > +        // * `name` is a NUL-terminated C string, living across the ca=
ll, by CStr invariant
> > +        // * `parent` is a live dentry since we have a reference to it
> > +        // * `vtable` is all stock `seq_file` implementations except f=
or `open`.
> > +        //   `open`'s only requirement beyond what is provided to all =
open functions is that the
> > +        //   inode's data pointer must point to a `T` that will outliv=
e it, which we know because
> > +        //   we have a static reference.
> > +        // * debugfs_create_file_full either returns an error code or =
a legal dentry pointer, so
> > +        //   `Self::from_ptr` is safe to call here.
> > +        #[cfg(CONFIG_DEBUG_FS)]
> > +        unsafe {
> > +            Self::from_ptr(bindings::debugfs_create_file_full(
> > +                name.as_char_ptr(),
> > +                0o444,
> > +                self.as_ptr(),
> > +                data as *const _ as *mut _,
> > +                core::ptr::null(),
> > +                &<T as DisplayFile>::VTABLE,
> > +            ))
> > +        }
> > +        #[cfg(not(CONFIG_DEBUG_FS))]
> > +        {
> > +            // Mark parameters used
> > +            let (_, _) =3D (name, data);
> > +            Self()
> > +        }
> > +    }
>
> Analogous to SubDir, this should be a new type, such that we can't leak t=
he root
> directory. Also, methods like subdir() don't really make sense for a file=
, no?
I agree, v3 will have a `File` type which:
1. Doesn't auto-discard the file, but provides a method to discard it.
2. Doesn't deref to `Dir`, so you can't call subdir.
>
> Besides that, don't we also need a separate type for a file to be able to=
 attach
> non-static data anyways? I.e. something like:
>
>         #[cfg(CONFIG_DEBUG_FS)]
>         struct File<T> {
>            dentry: *mut bindings::dentry,
>            data: T,
>         }
>
>         #[cfg(not(CONFIG_DEBUG_FS))]
>         struct File<T> {
>            _p: PhantomData<T>,
>         }
>
> I'm not exactly sure how v1 did this; I haven't had time to look at v1 be=
fore v2
> was posted. I seems like v1 relied on a separate structure storing the da=
ta,
> which also held a reference to the corresponding dentry or something alon=
g those
> lines?
In v1, this was done via
```
#[pin_data]
struct Values<T> {
  dir: /* ignore this type */,
  #[pin]
  backing: T
}
```
Then, there was an interface that let the user provide a building
function which had to have a fully polymorphic lifetime, which would
be passed a backing reference that it was allowed to attach to
subdirectory files. Since the dir would be cleaned up before the
backing went away, we could know that it successfully outlived it.
It'll probably look a little different when I send the follow-up
series on top of this one.

Attaching to the root directory rather than each individual file made
sense to me because this meant that if you had
```
struct Foo {
  prop_a: u32,
  prop_b: u32
}
```
it would not be as tricky to attach `prop_a` to one file and `prop_b`
to another, because the directory would own `Foo`. This'll probably be
clearer when I send up a dependent series on top of v3 later today.
