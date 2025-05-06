Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A6328030C
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 13:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746538247; cv=none; b=MHOJ3gIhTRpNRnkTeCuj5p059ci4383uj0XHxL6BU32MiQWQ9dMqFnBU/YfPcYL8wlt8xQv0uq0nqizFLhc6n7ZuPs+2YrceBj5R2n3sgO888va+8pShwhS7OBpMpDXgOMvliChrZ/NF0UvGEICoXMpniF24/sPxXvJfP63c/7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746538247; c=relaxed/simple;
	bh=1v2F6E/reecpTU0NuFpDLkVROLOTw2+0J7MSKVGr+HI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hmpsP4rZ7cxjneUVRRQeCXjqk9QnIE6AuaRI+5VCJiAmz+A28CBdsnbyXfuFEzM3kmRFpBaC7p/Gej85Ii3g7pdv9vH/7Vd8U6pYQpDmpYxBBeCV43h5ZvqY5hLP7V8qxaGRRIkTE5hASVuPYfi+WjBBSXkJ07E7T+R3x39K+9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=V/Pzh2+q; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V/Pzh2+q"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39c1efbefc6so4217789f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 06:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746538243; x=1747143043; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8tLDVhQCLyrzP+ndxjJm3VMFwBBqHU2pRrBGlwODZms=;
        b=V/Pzh2+qYuqxxl9RhkukeH3LU9PqynodzQsEQwgMtHK6qheXL7YtPLFjKCnHS+fCJ3
         3Z/aonljqoju9eJncYEf7kLCLhokWKKalvZaGkd1XJwatM3ct5NWf2xiiT14qhSa2f9O
         i7Wq+0D8um2i3aqTUMmVUH0hVWfXYkKPW+g4DiVFiMFyrdU60zSL7XuLudOFYqDqhhn5
         zXlp85s9eeIBEbASwVPc2nUqYbfD18fhWfRMK4OVtsiFwpieqeQxOj35/j8fXRDOlM1t
         hv+OaWG8JeIiAcN1FulOtgOJa+SBqxMzRg8+nTijGGl73ASAzGCWACczI6c7JaMB+V8B
         83dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746538243; x=1747143043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8tLDVhQCLyrzP+ndxjJm3VMFwBBqHU2pRrBGlwODZms=;
        b=Dv0nSYopT17uvLPCDlZPSVbU6azI4zTNVbVQtDYb3XnvBZvp/hGoEWEvzSkJOeQTJr
         2OfQPn7nWaKDmSB5S26JMHO9HiTGyXzh4qVwjfzLSDgl4Z5ux4QNlKLk2BxurtaLDaPQ
         +QcDyk9r+a+nqDnS7YM/P96PG18PW6gcltBMDRLjcZ4tZwclEZJOyxa+fT2+SgflSSyZ
         0RzvLzBdiXVXgigZOZeSm+0MnZuoyM9ErAgqz9Tt/FE9sb/F8FxoRdqvk0y39K0Z813H
         4w51cB6aHmymTi1Miz2GhvsI6qqTWvNf3b2Xt6/Uym8N7dYefX9TkBhfwBNsaF//l3vp
         Rwzg==
X-Forwarded-Encrypted: i=1; AJvYcCUhwbTikQkqHGa/S0MVmEjEgOT/5dnYVQwvq5itHTCiX5Jubgc0KrkjnMFIkNRfOeDm/sf0zTGovlaT+94=@vger.kernel.org
X-Gm-Message-State: AOJu0YzO/yF/RE3n0SqMwfo6f+tSPKlXrIzaR9SoKBlEE0enVe9GAgFW
	mn0BTKzXiWKccsw91uAVwc1zpjTOKUiK0WvjPEADVZ987WPBVr2usygrKjdQAIVf/bs31/EQwKL
	SGxL5czuTJXCf3UL/zgmjLr0QlmmnvH0IYb9v
X-Gm-Gg: ASbGnctk7jO4auH31uC2ZuVlDalJDm4Ke23Maa2NWH78fYv1YuL9QNUmypC7GEFsH0s
	bhLeq2WodxeW1eFi6V1Vr12Kzp7Vu51A1/+u1i/OGYAgO08Z9GaxX5ZWIWCUQtr44WZ1oReZxAF
	BVqYtN8IfspgdUYknwTorNSM0kpfAp30BzPL56G07JpdNtTY2yPXLjHa14TkxEW2w=
X-Google-Smtp-Source: AGHT+IH4WVO2x+UNQJaXF3flvCK8PoRR1G1qPIbcuqcjV6irDtLwrNAO4Ic9f8W11nKVRVDOt5rlpn3yY9ihPpyjM/8=
X-Received: by 2002:a5d:598c:0:b0:3a0:880f:1a87 with SMTP id
 ffacd0b85a97d-3a0ac3ea55fmr2474933f8f.51.1746538243088; Tue, 06 May 2025
 06:30:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250505-strncpy-from-user-v3-0-85c677fd4f91@google.com>
 <20250505-strncpy-from-user-v3-1-85c677fd4f91@google.com> <2025050544-sneak-compactor-d701@gregkh>
 <aBnT8Y3lJqd6J40q@google.com> <2025050645-trifocals-olympics-4692@gregkh>
In-Reply-To: <2025050645-trifocals-olympics-4692@gregkh>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 6 May 2025 15:30:30 +0200
X-Gm-Features: ATxdqUFEcNWR9cLEKaFLA0iO3V5BEC2JItlvm6igRmjYwq8ZyWUToLmqHbiS3uo
Message-ID: <CAH5fLgjVmyAy8GRBzmRG8+i3ci16M4zk7qQghn47krpPmpLQnw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] uaccess: rust: add strncpy_from_user
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 2:52=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, May 06, 2025 at 09:18:41AM +0000, Alice Ryhl wrote:
> > On Mon, May 05, 2025 at 04:30:05PM +0200, Greg Kroah-Hartman wrote:
> > > On Mon, May 05, 2025 at 12:17:31PM +0000, Alice Ryhl wrote:
> > > > This patch adds a direct wrapper around the C function of the same =
name.
> > > > It's not really intended for direct use by Rust code since
> > > > strncpy_from_user has a somewhat unfortunate API where it only
> > > > nul-terminates the buffer if there's space for the nul-terminator. =
This
> > > > means that a direct Rust wrapper around it could not return a &CStr
> > > > since the buffer may not be a cstring. However, we still add the me=
thod
> > > > to build more convenient APIs on top of it, which will happen in
> > > > subsequent patches.
> > > >
> > > > Reviewed-by: Danilo Krummrich <dakr@kernel.org>
> > > > Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
> > > > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > > > ---
> > > >  rust/kernel/uaccess.rs | 35 ++++++++++++++++++++++++++++++++++-
> > > >  1 file changed, 34 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
> > > > index 80a9782b1c6e98ed6eae308ade8551afa7adc188..a7b123915e9aa2329f3=
76d67cad93e2fc17ae017 100644
> > > > --- a/rust/kernel/uaccess.rs
> > > > +++ b/rust/kernel/uaccess.rs
> > > > @@ -8,7 +8,7 @@
> > > >      alloc::{Allocator, Flags},
> > > >      bindings,
> > > >      error::Result,
> > > > -    ffi::c_void,
> > > > +    ffi::{c_char, c_void},
> > > >      prelude::*,
> > > >      transmute::{AsBytes, FromBytes},
> > > >  };
> > > > @@ -369,3 +369,36 @@ pub fn write<T: AsBytes>(&mut self, value: &T)=
 -> Result {
> > > >          Ok(())
> > > >      }
> > > >  }
> > > > +
> > > > +/// Reads a nul-terminated string into `buf` and returns the lengt=
h.
> > > > +///
> > > > +/// This reads from userspace until a NUL byte is encountered, or =
until `buf.len()` bytes have been
> > > > +/// read. Fails with [`EFAULT`] if a read happens on a bad address=
 (some data may have been
> > > > +/// copied). When the end of the buffer is encountered, no NUL byt=
e is added, so the string is
> > > > +/// *not* guaranteed to be NUL-terminated when `Ok(buf.len())` is =
returned.
> > > > +///
> > > > +/// # Guarantees
> > > > +///
> > > > +/// When this function returns `Ok(len)`, it is guaranteed that th=
e first `len` of `buf` bytes are
> > > > +/// initialized and non-zero. Furthermore, if `len < buf.len()`, t=
hen `buf[len]` is a NUL byte.
> > > > +/// Unsafe code may rely on these guarantees.
> > > > +#[inline]
> > > > +#[expect(dead_code)]
> > > > +fn raw_strncpy_from_user(ptr: UserPtr, buf: &mut [MaybeUninit<u8>]=
) -> Result<usize> {
> > >
> > > Nit, the parameters here are backwards from the C version of
> > > strncpy_from_user(), which is going to cause us no end of grief when
> > > reviewing code between the two languages :(
> >
> > I'll swap them.
> >
> > fn raw_strncpy_from_user(dst: &mut [MaybeUninit<u8>], src: UserPtr) -> =
Result<usize> {
> >
> > > Also, it's not your fault, but we don't have any type of __user tag f=
or
> > > data coming from userspace yet to track this type of thing?  The
> > > compiler (well sparse) can catch this type of thing in C, any hints o=
n
> > > what we could do in Rust for the same type of guarantee (i.e. don't
> > > touch user data before it's been copied, and then we need to treat it=
 as
> > > "unverified" but that's a different patch series...)
> >
> > The UserPtr typedef is intended to do that, but since it's only a
> > typedef to usize, the compiler won't detect it if you mix up a user
> > pointer with a length. (It will detect mix-ups with pointers since we
> > use an integer type for UserPtr.)
>
> Sorry, I missed the "UserPtr" for some reason.  But having an integer
> type for UserPtr feels like it's going to cause problems in the
> long-run.
>
> > What we can do is replace the typedef with
> >
> > #[repr(transparent)]
> > struct UserPtr(pub usize);
> >
> > That way, it becomes it's own separate type (this is called the newtype
> > pattern [1]) so that it can't be mixed up with anything else.
>
> Why not use a real pointer like:
>         struct UserPtr(pub *const u8)
>
> > The #[repr(transparent)] annotation makes the compiler treat it like a
> > bare long for ABI-purposes. I'm not sure if any function ABIs actually
> > treat a long differently from a struct that just contains a long, but i=
f
> > such ABIs exist, then the annotation ensures that the long ABI is used
> > rather than the struct-containing-long ABI.
>
> In the kernel, "unsigned long" is guaranteed to hold a pointer.  Which
> is why many of the old allocation functions return that type.

Let's continue this discussion on the patch I just sent to make it a
real struct:
https://lore.kernel.org/r/20250506-userptr-newtype-v1-1-a0f6f8ce9fc5@google=
.com

I don't fully recall the reason, but it was changed from a raw pointer
to usize in version 6 of the patch set that added it.

Alice
