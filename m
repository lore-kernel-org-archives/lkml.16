Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FC5215F7C
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 19:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745954964; cv=none; b=kZonoCCy0jN5BxCzj5EENiYcIaDErzonco4ocWrd54qfCfLCT+Ha9ql4EpFcoHiPQrQHPukvO33Tnw6gy6KLVNVvCpYW+l8aHcf4mujWdumQ5q9cDQo/PORA5FWCv4d5nU277hjSEmZQP/5yi/o2T/SzqRV/Q6EcYWWLehnjRQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745954964; c=relaxed/simple;
	bh=kHc/cytx5Adj+8CqLo2UyKgU1kEEXeemLFRGfdkhqgQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sGfilHIrs0151hzfXRjvbfGQc9jSskyvvDaOaIz/OB34q+mlB0tpMgjkHD6Qrq6XYfTZYZUlYFdbatBz63Ef1w2OPSdvkkIblJudB2ln1FQ7e9wXIx/X6sV7UIzUAELxYywFmbafyFml6cGUMDqk0vYaMqw+UzFZ+vHItaxVFn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uqmWrgk/; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uqmWrgk/"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-391342fc0b5so4708842f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 12:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745954960; x=1746559760; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XqMZCaPyPBAIN/Fd3CxJHtlGXvSegu6boDxVIZP3NUQ=;
        b=uqmWrgk/J11SZEksWiK3JPCe1Fzdzgk2pMiYt2UFN8fmxESWsTA2cPGYdXJxWIr8X5
         F25g4narJfrZNN9Ekauo42pA957PHPuGrz5Tcj7KxbAsNBoguuW22tiZJ5fPWmg+LcTS
         Ug+87pKTVmaL+vZR79wfjAMDFFErP1JfeCKaZ0MBNg0Ixb4wovtKA0HrfEr38fBVmkgR
         s7sKjWxglXIWPaC+7kZxEo5FCLnCs/mbEDQEq1AEb3T1l0AZfDqbur8GhlCzKQRpA+EG
         xaWL3mfTncti2+L+cxMGYYaDNHP5uoz8GgAgPW+xOcgjcuDIV0a/HCDRvLyjwK3nEsiF
         xVQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745954960; x=1746559760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XqMZCaPyPBAIN/Fd3CxJHtlGXvSegu6boDxVIZP3NUQ=;
        b=hYNnXOw2ygLu7g4tAUEvt49+Mz+BzgR7McHjKxhwj0PBSGFhI1plWuFmLUQ/BWw4w/
         DITQqj53HgHg8KXdi9H2s5cNBcZdwSI54yogLpLtQuigXv7bQGjdbU4hkkOLwSrH2/uN
         FLQHpgfAvGWJddt5YyqO0qf62DI/vnz/getqTVl9BwqYx0GTOqIdzXDCq9nKt1heb1hh
         nzorV89lwDwLdtogz0xJGFGIp7VNd21o1g/ZYHxsdP2h05n7eeYxxhHPulvOHJg35SZc
         ob57kjZDdB+tv5URDoEFftCtqKb+U9PgE6EzRi6sAaj/OYefgHkhe7akQc2LZm+gB1YG
         szRA==
X-Forwarded-Encrypted: i=1; AJvYcCXrDlvK4+/DI5MnBxX/VTsC3pJJ3vNDJ7sJOyu2kHKwyTmVq0j29A1y6CfqIa0nTJPzFJagRc7+Doj2J/0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBwV/x175Z9WkmKr4FsZ1cncxvJSLItXvpRQ6K7O/gzrsSkjXO
	lV37CcLxEIpz512f5nNNjas6UdDlMA3bNs8ZEM1l/JzGAHUo0zeY00er92bQ2bzm1ezLtSq20dT
	+mawBII0a/9jSa3sYi2pIvqLs2rcX6FU3Td9G
X-Gm-Gg: ASbGnctybliNU8BMZJYKUMSJ4WLaHxTDwZNzlbvXBwXcUw0vJsDexEe9n9M461a5AHD
	qaTQ6r+e2itVS7yBsTeWctvrhL33puDybGX5sb2wCE1aHZVui3aZJCKTEiUkWL0Kqkeokz0UyNp
	x3ShUbB8KZOlRiMY8PiwvsfMIzUK8VqvgPJQ==
X-Google-Smtp-Source: AGHT+IH1OnVehQWv94v0BQMbp7CUXSGalAv8VO+ObtTwx1jiibBMzs9kXVSL8iuRc7gDhDYnjG8EJirxKA4k1bx6gxI=
X-Received: by 2002:a05:6000:400b:b0:3a0:8a37:fb8e with SMTP id
 ffacd0b85a97d-3a08f77c285mr484722f8f.27.1745954960258; Tue, 29 Apr 2025
 12:29:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429-strncpy-from-user-v2-0-7e6facac0bf0@google.com>
 <20250429-strncpy-from-user-v2-2-7e6facac0bf0@google.com> <68111422.050a0220.e6713.25af@mx.google.com>
In-Reply-To: <68111422.050a0220.e6713.25af@mx.google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 29 Apr 2025 21:29:07 +0200
X-Gm-Features: ATxdqUHzG5OYUybCnGZV1DFce1JDL7NLUDOej9-nRXITvFXjwy1VlvSzbSi_LLY
Message-ID: <CAH5fLggj-Mfhd3311aKUt9go_+FeAuXdPxditW26QL5VtLD3iQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] uaccess: rust: add UserSliceReader::strcpy_into_buf
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 8:02=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> On Tue, Apr 29, 2025 at 09:02:23AM +0000, Alice Ryhl wrote:
> > This patch adds a more convenient method for reading C strings from
> > userspace. Logic is added to NUL-terminate the buffer when necessary so
> > that a &CStr can be returned.
> >
> > Note that we treat attempts to read past `self.length` as a fault, so
> > this returns EFAULT if that limit is exceeded before `buf.len()` is
> > reached.
> >
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> >  rust/kernel/uaccess.rs | 35 +++++++++++++++++++++++++++++++++++
> >  1 file changed, 35 insertions(+)
> >
> > diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
> > index acb703f074a30e60d42a222dd26aed80d8bdb76a..7cec1b62bd8b816f523c8be=
12cb29905740789fc 100644
> > --- a/rust/kernel/uaccess.rs
> > +++ b/rust/kernel/uaccess.rs
> > @@ -293,6 +293,41 @@ pub fn read_all<A: Allocator>(mut self, buf: &mut =
Vec<u8, A>, flags: Flags) -> R
> >          unsafe { buf.set_len(buf.len() + len) };
> >          Ok(())
> >      }
> > +
> > +    /// Read a NUL-terminated string from userspace and append it to `=
dst`.
>
> s/`dst`/`buf`
>
> ?

Hm, append is also wrong. Thanks.

> > +
> > +        // We never read more than `self.length` bytes.
> > +        if dst.len() > self.length {
> > +            dst =3D &mut dst[..self.length];
> > +        }
> > +
> > +        let mut len =3D raw_strncpy_from_user(self.ptr, dst)?;
> > +        if len < dst.len() {
> > +            // Add one to include the NUL-terminator.
> > +            len +=3D 1;
> > +        } else if len < buf.len() {
> > +            // We hit the `self.length` limit before `buf.len()`.
> > +            return Err(EFAULT);
> > +        } else {
> > +            // SAFETY: Due to the check at the beginning, the buffer i=
s not empty.
> > +            unsafe { *buf.last_mut().unwrap_unchecked() =3D 0 };
> > +        }
> > +        self.skip(len)?;
> > +
>
> So if the UserSlice content is "abcdefg" (not tailing NUL), and the buf
> size is 4, after a strcpy_into_buf(), the return would be a CStr "abc"
> (with a tailing NUL), and the UserSlice would move 4 bytes and become
> "edg" (not tailing NUL), is this a desired behavior?
>
> Alternatively, we can make `dst` always 1 byte less then `buf`, so that
> in the above case, UserSlice will only move 3 bytes and become "defg",
> and the return CStr is still "abc" (with a tailing NUL).

Maybe we just have this method consume the UserSliceReader and avoid
thinking about what happens if you use it afterwards.

> The current behavior makes me feel like we can lose some information,
> for example, if the user-kernel protocol is that "a userslice that
> contains 4 64-byte strings which don't have a tailing NUL", we cannot do
> 4 strcpy_into_buf() to get them, right? But of course, the scenario is
> completely made up, just food for thoughts.

But then you should probably just read the [u8;64] type four times?

Alice
