Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4CE12D758
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 13:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748698078; cv=none; b=VdDw6EMtmo8dU3EUPORocH/uB7n0cf7DRjzmZryNHsE2bxhcBwlC9hkVZdS+KJxZBQ9+UW5BDpqnTNFe0q4qv27PeMq0IGDT986tpff/l3XwtIXiWDDl4oCVQWwnR+3Jc5bL1BEal1IwhZb0wL8/xLzv6alW0KDqfzaseMNc5CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748698078; c=relaxed/simple;
	bh=dnZGVEmP8lQ2yjLmNRMNfQCk7G7HPch0ofnn/V7NCB4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cEku3i+V+T7Dpvl1ZXkiJLQZj4uPNI5u7GVNJFMi+3/IY+6EB5RAuCzykamwCMIgbbNAnKQCHI2p9Kw6HGki+0yE74QF58JtR+Mwd3Cx6WrcPw3i2KDxc434mvwvDDBe7dRxEmua2wJnosgYRx1CxJq7MGRKAcHzCm1Nsl/qdrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wX8d+tdN; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wX8d+tdN"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a363d15c64so1962490f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 06:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748698075; x=1749302875; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AnpqmHgYLPI4hzWL/k8NVMbgoWIzDssICv/avNSiu+Y=;
        b=wX8d+tdN+MZ9tvcGZ7FV8CJOVQc5kqRyZmn+Ve1vZur7aBsPbn/lC+GOWv7wX0eUFs
         zwPtS2rqAZSA+Jt8QgeqJDSFWqvVFdVzApeI/4tDUqo6cuU8icd1FRCCPmRLcrzaSBvi
         wlZJNZv39fFWuCCPXagtAWuX//IU9g2xASyowUudMoA+UdDqeL5GDHZQTOKmWJQnVcLH
         WpxqgaTxWXcHg7hQTarjIrMDfOMRtyl9rRWOG+4ig/3FNr5rbaMJDxmMpDP2lFbPgD/f
         RPhrmdW97s7vcInmFTJz2zqd+9AVgWAgvJLclYtP9BUqcrFZNQuCRX1FyniAs0N7oSvA
         yqcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748698075; x=1749302875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AnpqmHgYLPI4hzWL/k8NVMbgoWIzDssICv/avNSiu+Y=;
        b=IkL38tSMqZ16CxdoOljv1QV9rifT60xMuJY1vpaVPbBhcMWPYFqn8tfvzr9yM5MPB9
         XDnJC7LvqkSAxD9Fe6YRo4JjiUdrRFGhpEbg3ZDuktn8OWO5tprKkrX4lD46EqwF6jdX
         X2RAx7GZpJw2/gx2oj9PMjlYBbpyYB67EjxOyH1b+P+50hxb8aPY2ULxsQZ4MRHuKETu
         uxIVSX2heS333uUTD6PhbkGgFPwE9RzuGduRQsj3oD6hLbDU+RQHTBKBz+SLnFeB70Ii
         QNYH5Mqjoga5KWjMJqpmOIgTeDjMdaA9SyB4tJdSZ3WzaldSbOdnrrn7ctJIWuBnrj5q
         nyBQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6XOG92SXcOqpaXQ2guNrk5VM88Hl/xBj97rTzKBSgDjnaz01MOIi7uA9Bo0D6tCIHLl48NHUj9h0fOeM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt44S9AN1pjgmYvKHijEuZFqh94aBx1YRHSM1Qj+1fa2KomFal
	Eg+k76z/1zdKnL4SnmVRNBUB/WNA9N+1tIcOvtZnU8uGayLJ7XQA9vyXHI+InQLB0E/JuMGKUb7
	hY8ag6WKPUacMDyUoPtUoNF62PPxWNgQcZETsaNzW
X-Gm-Gg: ASbGncu+SvCQhhuaAwG5FFsh8nu61iG0F24cDPChO/Oi73bE4TgsElyXelRgfIio1Oj
	BjzjlWVQQcM8TW4hsoEww7GJWZOwlf//H427vg664BSUgbFJZ6XvAbW5i09niQK4Uccq1cT7mKx
	ZPzXILEAZVzq2cNZZKrcr1y1bCUhEDvMRTdZklVSE3RYazkliZ9MEYhqM=
X-Google-Smtp-Source: AGHT+IHz4dGneNsz3I86jpWfUkTX0LdPSNEr1rfeK531BxSj7yoVtYDQ9VtZtSXN1TJMVHmK3I6ahTgb51RGXdmNNKo=
X-Received: by 2002:a5d:64ed:0:b0:3a4:e672:deef with SMTP id
 ffacd0b85a97d-3a4f7a6cd16mr5014540f8f.36.1748698074866; Sat, 31 May 2025
 06:27:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250527-strncpy-from-user-v4-0-82168470d472@google.com>
 <20250527-strncpy-from-user-v4-1-82168470d472@google.com> <DA9P6CSP6563.1OYPZXIP5S7N1@kernel.org>
In-Reply-To: <DA9P6CSP6563.1OYPZXIP5S7N1@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sat, 31 May 2025 15:27:41 +0200
X-Gm-Features: AX0GCFsyOpodom7COF6Q47O6GbdlFNGm3NxxkLS6_i0l2e9VkeQHWf9q4FIx-EI
Message-ID: <CAH5fLgjoX5AEO8NvDdj+05HUtpoVUPpOa7ri5UG6Djp98vQDxQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] uaccess: rust: add strncpy_from_user
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

On Fri, May 30, 2025 at 8:13=E2=80=AFPM Benno Lossin <lossin@kernel.org> wr=
ote:
>
> This patch's title should be adjusted, as it's adding
> `raw_strncpy_from_user` and not `strncpy_from_user`.
>
> On Tue May 27, 2025 at 2:34 PM CEST, Alice Ryhl wrote:
> > +/// Reads a nul-terminated string into `dst` and returns the length.
> > +///
> > +/// This reads from userspace until a NUL byte is encountered, or unti=
l `dst.len()` bytes have been
> > +/// read. Fails with [`EFAULT`] if a read happens on a bad address (so=
me data may have been
> > +/// copied). When the end of the buffer is encountered, no NUL byte is=
 added, so the string is
> > +/// *not* guaranteed to be NUL-terminated when `Ok(dst.len())` is retu=
rned.
> > +///
> > +/// # Guarantees
> > +///
> > +/// When this function returns `Ok(len)`, it is guaranteed that the fi=
rst `len` bytes of `dst` are
> > +/// initialized and non-zero. Furthermore, if `len < dst.len()`, then =
`dst[len]` is a NUL byte.
> > +/// Unsafe code may rely on these guarantees.
>
> I would remove the last sentence, it already is implied.

I do not mind that.

> > +#[inline]
> > +#[expect(dead_code)]
> > +fn raw_strncpy_from_user(dst: &mut [MaybeUninit<u8>], src: UserPtr) ->=
 Result<usize> {
> > +    // CAST: Slice lengths are guaranteed to be `<=3D isize::MAX`.
> > +    let len =3D dst.len() as isize;
> > +
> > +    // SAFETY: `dst` is valid for writing `dst.len()` bytes.
> > +    let res =3D unsafe {
> > +        bindings::strncpy_from_user(dst.as_mut_ptr().cast::<c_char>(),=
 src as *const c_char, len)
> > +    };
> > +
> > +    if res < 0 {
> > +        return Err(Error::from_errno(res as i32));
> > +    }
> > +
> > +    #[cfg(CONFIG_RUST_OVERFLOW_CHECKS)]
> > +    assert!(res <=3D len);
> > +
> > +    Ok(res as usize)
>
> We probably should add a `GUARANTEES` comment here, no?

I can see the idea behind such comments, but I do not believe we've
used them so far.

Alice
