Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA332101F2
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 13:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748697976; cv=none; b=bdqsI/TItzZJnKzm7j8xuOBWOGXmCKs9I9cU+XYQv5t328jBM4Ox13qEpiB+CO093074syWbxt28JguO+VRbrPzHZXHUhtnH717I/eFHpUqoNTn37uFnHuGcXb0PXS+tUdOEipkVDFHdG9syb0b8Wx67cPMebUGeYKzChaLGLjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748697976; c=relaxed/simple;
	bh=W9KCPpIgVUVF2Ha44C+Ff3OIGGXCprwabXjXMKOwsHU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=risfn/E/K7ueG2kM69vYw1JAm+s4hbWaGRJcTdRrGmSZDAISljBTkPFpkB7DXVK07bSziNs4oB2V3ekD3PeWL6Xc1y5kLaFb4TkFNf6wNIcPchFYUFDuNo5VQjJDgWLz11+Gc0Un/hyk9oqNgJwK/iD/kKWv+sGO6Ifxj4TKE7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Bc4d6XKQ; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Bc4d6XKQ"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-450cf214200so24690055e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 06:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748697973; x=1749302773; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T9DR5NCa957iPYKZxiFu8GdXDM88JZymN1Uk+Vzg6j0=;
        b=Bc4d6XKQ433wM3240xQSB3Y2/73iq9D1mYEDzR+q4KisO7lfjh9yHUj6dDJlD9pyvr
         K3ZPeuKac3FH1Ht2CcfYmwNzhlvpK/gJnKsQXcpK0Xo72Kpx10+9ZAJRX4/ulG9cz2F0
         8zvQHbdhg5rDFml8bDtk2QVcXCecO29LcgatUyI1dJYm8Q6ilZFJRcf3Vg9CV59dDFKC
         7uy1d2iTiLoeR6RZj0kR/F4M19lFSXATAcy1CqECy/MH7JdeNQ1lnrzFehhx4LHxNpyu
         UdUY9XZuFx6/50VMpVckAOXTYCqasgsnFtDvz7gegicWix8vcuyt8WqsrNinExveGn6U
         JlIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748697973; x=1749302773;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T9DR5NCa957iPYKZxiFu8GdXDM88JZymN1Uk+Vzg6j0=;
        b=whtautGeYO69N8szNvjmVhQjJb92v891jV0dzJN4Jp6A1EFuA11ymOMHF2xrPyIvGr
         NkVnU17QOalacx6BJUULmjlM9JZNgR2psnK9Ucbi6RrnT/u9C5U1S/Zeg6mVFhGhbo+g
         /54ZxoJAX8xnmOzQ6hZP41uJZsuC9+HeE99T5J3P2M1nfM/8D2WB41//enADmNHIODce
         DAaYjCMTTXUAEvEH5DvisKYhgU/RGw4XXx/5zTsiOzJ30u+VdPWUwIAhT0d/Xq21fu1s
         I0+JBtqdgF1VwEqHtdt9FxlpxdjPassO1dMKTP3bIQ1o2zlducxfz5IeID4OxA7/D5+W
         vEUw==
X-Forwarded-Encrypted: i=1; AJvYcCXuJ6R8Rp8W8Bh6zku3DzY1UtiHy3g6eWGT5dfT4vs5k/CRJIz2yGats9lekJvWPKd9KTJyyFmd6VkG7eE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaV8PS5M+4LayxWfXGawuCjOHjRPBiw41Mz6zbYn6Ht4rgtpUs
	ukRh3JFGYMBTg49mgNbFQNmUYWoinzfcllXkRoe0iSA7mMsNJEfTP89+5snbIEVjau6wS+hBDcB
	wZyj+gnXt6xRgGwzm2V19qESrkmRUCM2nwhtuU0p8
X-Gm-Gg: ASbGncsCUJGinQI/hmGS6DrTe/BzwiogjHWHVr/ZcBx6KlxQGImO7sa51P5BODHaDkX
	Md+teA+i/3nHBqOBvlKDYl9mmdRT77AIJpTqzuTEB7awy7wF2ui/C72WkoaCdUcYMrbClA0Io4t
	Ta11eOdGN70p9nUxjyWsu1h5Vcko3N1ITZ9fxPNvqhW+H+
X-Google-Smtp-Source: AGHT+IGfp7hAa2spWVj2SPN735mg85khi0WUeYTJjMXgdY9zq6ZssaO+bV4k8ffrTsF1yUBZ29L6uhBVYwowFKEqnHk=
X-Received: by 2002:a05:600c:4f87:b0:442:cd03:3e2 with SMTP id
 5b1f17b1804b1-450d87fd991mr56835405e9.2.1748697972759; Sat, 31 May 2025
 06:26:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250527-strncpy-from-user-v4-0-82168470d472@google.com>
 <20250527-strncpy-from-user-v4-2-82168470d472@google.com> <DA9P904SL0KL.1QNQAI240QLH6@kernel.org>
In-Reply-To: <DA9P904SL0KL.1QNQAI240QLH6@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sat, 31 May 2025 15:25:59 +0200
X-Gm-Features: AX0GCFtznRzZkf4kQM1n1yrj4tNMoC1t-3RZZV41dZwGVCOxltkfbwDODmlvkuU
Message-ID: <CAH5fLgjZrJ66VnW0J_CHc-3yUFOt+DRWgTCNxoftACga+Lw+fA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] uaccess: rust: add UserSliceReader::strcpy_into_buf
To: Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 30, 2025 at 8:16=E2=80=AFPM Benno Lossin <lossin@kernel.org> wr=
ote:
>
> On Tue May 27, 2025 at 2:34 PM CEST, Alice Ryhl wrote:
> > This patch adds a more convenient method for reading C strings from
> > userspace. Logic is added to NUL-terminate the buffer when necessary so
> > that a &CStr can be returned.
> >
> > Note that we treat attempts to read past `self.length` as a fault, so
> > this returns EFAULT if that limit is exceeded before `buf.len()` is
> > reached.
> >
> > Reviewed-by: Danilo Krummrich <dakr@kernel.org>
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> >  rust/kernel/uaccess.rs | 56 ++++++++++++++++++++++++++++++++++++++++++=
+++++++-
> >  1 file changed, 55 insertions(+), 1 deletion(-)
> >
> > diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
> > index 9b1e4016fca2c25a44a8417c7e35e0fcf08aa959..e6534b52a1920254d61f834=
9426d4cdb38286089 100644
> > --- a/rust/kernel/uaccess.rs
> > +++ b/rust/kernel/uaccess.rs
> > @@ -293,6 +293,61 @@ pub fn read_all<A: Allocator>(mut self, buf: &mut =
Vec<u8, A>, flags: Flags) -> R
> >          unsafe { buf.set_len(buf.len() + len) };
> >          Ok(())
> >      }
> > +
> > +    /// Read a NUL-terminated string from userspace and return it.
> > +    ///
> > +    /// The string is read into `buf` and a NUL-terminator is added if=
 the end of `buf` is reached.
> > +    /// Since there must be space to add a NUL-terminator, the buffer =
must not be empty. The
> > +    /// returned `&CStr` points into `buf`.
> > +    ///
> > +    /// Fails with [`EFAULT`] if the read happens on a bad address (so=
me data may have been
> > +    /// copied).
> > +    #[doc(alias =3D "strncpy_from_user")]
> > +    pub fn strcpy_into_buf<'buf>(self, buf: &'buf mut [u8]) -> Result<=
&'buf CStr> {
> > +        if buf.is_empty() {
> > +            return Err(EINVAL);
> > +        }
> > +
> > +        // SAFETY: The types are compatible and `strncpy_from_user` do=
esn't write uninitialized
> > +        // bytes to `buf`.
> > +        let mut dst =3D unsafe { &mut *(buf as *mut [u8] as *mut [Mayb=
eUninit<u8>]) };
> > +
> > +        // We never read more than `self.length` bytes.
> > +        if dst.len() > self.length {
> > +            dst =3D &mut dst[..self.length];
> > +        }
> > +
> > +        let mut len =3D raw_strncpy_from_user(dst, self.ptr)?;
> > +        if len < dst.len() {
> > +            // Add one to include the NUL-terminator.
> > +            len +=3D 1;
> > +        } else if len < buf.len() {
> > +            // This implies that `len =3D=3D dst.len() < buf.len()`.
> > +            //
> > +            // This means that we could not fill the entire buffer, bu=
t we had to stop reading
> > +            // because we hit the `self.length` limit of this `UserSli=
ceReader`. Since we did not
> > +            // fill the buffer, we treat this case as if we tried to r=
ead past the `self.length`
> > +            // limit and received a page fault, which is consistent wi=
th other `UserSliceReader`
> > +            // methods that also return page faults when you exceed `s=
elf.length`.
> > +            return Err(EFAULT);
> > +        } else {
> > +            // This implies that len =3D=3D buf.len().
> > +            //
> > +            // This means that we filled the buffer exactly. In this c=
ase, we add a NUL-terminator
> > +            // and return it. Unlike the `len < dst.len()` branch, don=
't modify `len` because it
> > +            // already represents the length including the NUL-termina=
tor.
> > +            //
> > +            // SAFETY: Due to the check at the beginning, the buffer i=
s not empty.
> > +            unsafe { *buf.last_mut().unwrap_unchecked() =3D 0 };
>
> In this case you're overwriting the last character read. Should we give
> `raw_strncpy_from_user` access to one less byte and then write NUL into
> that?

Why? I'm not interested in changing the implementation just because.
It needs to be significantly simpler, and I do not think it is.

Alice
