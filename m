Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559BB13AA3C
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 17:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748713139; cv=none; b=n8GuhdPFm0BUWhyNsVcvMn+oj2BcZ4MKh3yoop/Cg5+Xl+QONCfhoQVcnwqF/UYDhIjev1eBv/FWoERnUL9gQU59Tf5V5uFlpcc08dDwoD2OFgj3W4hgEAd0sgN8d17fN2mcNmFbiNLyS/BlZmpegbJVfujoQ5WTeKC7/17fyes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748713139; c=relaxed/simple;
	bh=+yiCfGe4fW0XffAwNncdBCVmgxhtqqA4Z5ANJlPMTug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZaHLfvfy5BYZysilfO8tPGpnGOg5/c6pVM3XnfITwyGmnIlOhkI0CS6K9YT92E4AIzkBnxuG0++9MGe8/+1duEBW9ERv4Xp6BOV32gV2Bd2VDu3ZKUYh+fagW1XJbQZeX1oxYdzwHmpaFhgi3DKTeYn+220tQiYX04OR6nIZb0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qf1RFcfK; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qf1RFcfK"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a3798794d3so2567322f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 10:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748713135; x=1749317935; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eLCLVg3DRY+kdQKI3UOmRBlx/q2NwNG+bRafEeb9LK4=;
        b=qf1RFcfKwcW5/Hk47bNBUBgraAI0lhsiNe/xpJiwQSRUWCLo5lg7d9SLEvoZzC8e+F
         iidoSxdM8HhaLQZqa2YgjLf6fCGUqT8qYCTl7NIWYw9hNgJoITjzaXSFj8bXajyL3MFg
         mBkIxodI48Idcv4OdNVPXeYjl+P4erJOtvCtvSWj5oONdrOterSXseVtGvj2ipIhyD8v
         Wly6cA/KvVmWyXqEr6InEVPcjiJ6E0Lgc+oojO9EjfYtrAyfd7+qIHU0KUS8oKUI0Gfv
         vEhnTEpVU0cWmxmEkUYYPco/a+c2I8csdeAGGAR/ek5Rfsgl4sf64IyiFbpphr2kG8YK
         sFiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748713135; x=1749317935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eLCLVg3DRY+kdQKI3UOmRBlx/q2NwNG+bRafEeb9LK4=;
        b=UsMQ8h9LeUBxtdmnaf9pu5kUX1UH0DcR9sjlSjxZeUl1NKWxTBeA0unN3PiJPgvWwi
         FL9r6f5+934riL3++cvfYTi+ubPkgIFtKO6UiiLm+JrwIWBYkkQPHIyQgp9j+J4TvaHp
         pZ/Zz6Fap8dQDrwwXw90974cgmNDyf/lZCUBBgU6zUet6gF5uSU7Jngm5w3BqWwqOHsy
         Ht0o3h+SQjxncf0qnuvJHa9veNZJ76Ge3D+1X8mhuj9pPwP7EKU94EOqOOiaEL1F5xDC
         WIF9s/71GGodklVZ7BymZLuq+mZOqQrkj4ZDzgdcc1lnMxXqw+sEy6LLnSCZvg3SEXsw
         He8A==
X-Forwarded-Encrypted: i=1; AJvYcCVPtX/+x/M9S4y5UjrmP+r/94rEvGu/jmPhxxWlmf1x3soBJF6Y0pUdmV2m3reigRIrLrSE4Xqj4rHaBF8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuxFtSioXQsG1DffBt9yCbJmF6UpDEgco/OrnLwYCKcn+6RKx9
	hTMGkdV5t6lVSQLLhFAbxnUebr3pzXHBk4uHRX6uthbyyQbrcdeP0ZziZyf6y6LSMWXY+6Wwn3l
	9oxq7l+qeihJ4rAUpQl5p5aTgkevhyWbfCnHY0mJx
X-Gm-Gg: ASbGncs45Jp+saMd0xwxw2G7O/l7yohR1z0mTuZB1veTGSEmbbQh6Ixa+pWbVUoPNib
	aFc8LbCSlXfBDars1z8e0Z+dR6iIcIRb2KoitGezCJK7bldmzfB8bYCXaX3z8W5HyDlCgfXZ5DN
	lRN8nMiWwqFPdCKyyR4flWTaxyLaIUycKEZHPjRrEO5k1N
X-Google-Smtp-Source: AGHT+IFcQc7PhrlU3iGzooaB91LCZp9G23UHEC8GFDWBqsB6YALAnfq0jsP/gQvtcHrgFUl7d6tErACA3KF7ENhU2+U=
X-Received: by 2002:a5d:64e2:0:b0:3a4:e1e1:777f with SMTP id
 ffacd0b85a97d-3a4fe160ce4mr1952606f8f.1.1748713135419; Sat, 31 May 2025
 10:38:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250527-strncpy-from-user-v4-0-82168470d472@google.com>
 <20250527-strncpy-from-user-v4-2-82168470d472@google.com> <DA9P904SL0KL.1QNQAI240QLH6@kernel.org>
 <CAH5fLgjZrJ66VnW0J_CHc-3yUFOt+DRWgTCNxoftACga+Lw+fA@mail.gmail.com> <DAAG8AUG7GE2.EVO9Y6PZTHDI@kernel.org>
In-Reply-To: <DAAG8AUG7GE2.EVO9Y6PZTHDI@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sat, 31 May 2025 19:38:43 +0200
X-Gm-Features: AX0GCFupvoH_OV-ioJo2JO2JFQ27ZZjQte_A5hZNPm4JMyO-baMu7qThPLV4JKs
Message-ID: <CAH5fLgjNCQV8zsfdeq21iXiu_VOpt=WGnm9nMp-B0bOEMEBctw@mail.gmail.com>
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

On Sat, May 31, 2025 at 5:25=E2=80=AFPM Benno Lossin <lossin@kernel.org> wr=
ote:
>
> On Sat May 31, 2025 at 3:25 PM CEST, Alice Ryhl wrote:
> > On Fri, May 30, 2025 at 8:16=E2=80=AFPM Benno Lossin <lossin@kernel.org=
> wrote:
> >> On Tue May 27, 2025 at 2:34 PM CEST, Alice Ryhl wrote:
> >> > This patch adds a more convenient method for reading C strings from
> >> > userspace. Logic is added to NUL-terminate the buffer when necessary=
 so
> >> > that a &CStr can be returned.
> >> >
> >> > Note that we treat attempts to read past `self.length` as a fault, s=
o
> >> > this returns EFAULT if that limit is exceeded before `buf.len()` is
> >> > reached.
> >> >
> >> > Reviewed-by: Danilo Krummrich <dakr@kernel.org>
> >> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> >> > ---
> >> >  rust/kernel/uaccess.rs | 56 +++++++++++++++++++++++++++++++++++++++=
++++++++++-
> >> >  1 file changed, 55 insertions(+), 1 deletion(-)
> >> >
> >> > diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
> >> > index 9b1e4016fca2c25a44a8417c7e35e0fcf08aa959..e6534b52a1920254d61f=
8349426d4cdb38286089 100644
> >> > --- a/rust/kernel/uaccess.rs
> >> > +++ b/rust/kernel/uaccess.rs
> >> > @@ -293,6 +293,61 @@ pub fn read_all<A: Allocator>(mut self, buf: &m=
ut Vec<u8, A>, flags: Flags) -> R
> >> >          unsafe { buf.set_len(buf.len() + len) };
> >> >          Ok(())
> >> >      }
> >> > +
> >> > +    /// Read a NUL-terminated string from userspace and return it.
> >> > +    ///
> >> > +    /// The string is read into `buf` and a NUL-terminator is added=
 if the end of `buf` is reached.
> >> > +    /// Since there must be space to add a NUL-terminator, the buff=
er must not be empty. The
> >> > +    /// returned `&CStr` points into `buf`.
> >> > +    ///
> >> > +    /// Fails with [`EFAULT`] if the read happens on a bad address =
(some data may have been
> >> > +    /// copied).
> >> > +    #[doc(alias =3D "strncpy_from_user")]
> >> > +    pub fn strcpy_into_buf<'buf>(self, buf: &'buf mut [u8]) -> Resu=
lt<&'buf CStr> {
> >> > +        if buf.is_empty() {
> >> > +            return Err(EINVAL);
> >> > +        }
> >> > +
> >> > +        // SAFETY: The types are compatible and `strncpy_from_user`=
 doesn't write uninitialized
> >> > +        // bytes to `buf`.
> >> > +        let mut dst =3D unsafe { &mut *(buf as *mut [u8] as *mut [M=
aybeUninit<u8>]) };
> >> > +
> >> > +        // We never read more than `self.length` bytes.
> >> > +        if dst.len() > self.length {
> >> > +            dst =3D &mut dst[..self.length];
> >> > +        }
> >> > +
> >> > +        let mut len =3D raw_strncpy_from_user(dst, self.ptr)?;
> >> > +        if len < dst.len() {
> >> > +            // Add one to include the NUL-terminator.
> >> > +            len +=3D 1;
> >> > +        } else if len < buf.len() {
> >> > +            // This implies that `len =3D=3D dst.len() < buf.len()`=
.
> >> > +            //
> >> > +            // This means that we could not fill the entire buffer,=
 but we had to stop reading
> >> > +            // because we hit the `self.length` limit of this `User=
SliceReader`. Since we did not
> >> > +            // fill the buffer, we treat this case as if we tried t=
o read past the `self.length`
> >> > +            // limit and received a page fault, which is consistent=
 with other `UserSliceReader`
> >> > +            // methods that also return page faults when you exceed=
 `self.length`.
> >> > +            return Err(EFAULT);
> >> > +        } else {
> >> > +            // This implies that len =3D=3D buf.len().
> >> > +            //
> >> > +            // This means that we filled the buffer exactly. In thi=
s case, we add a NUL-terminator
> >> > +            // and return it. Unlike the `len < dst.len()` branch, =
don't modify `len` because it
> >> > +            // already represents the length including the NUL-term=
inator.
> >> > +            //
> >> > +            // SAFETY: Due to the check at the beginning, the buffe=
r is not empty.
> >> > +            unsafe { *buf.last_mut().unwrap_unchecked() =3D 0 };
> >>
> >> In this case you're overwriting the last character read. Should we giv=
e
> >> `raw_strncpy_from_user` access to one less byte and then write NUL int=
o
> >> that?
> >
> > Why? I'm not interested in changing the implementation just because.
> > It needs to be significantly simpler, and I do not think it is.
>
> Sure, but then I think we should document this behavior.

Document what? I understood your suggestion as a change to the
implementation of strcpy_into_buf that would not change its behavior.
Did I misunderstand?

Alice
