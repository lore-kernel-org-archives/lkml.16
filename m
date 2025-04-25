Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097E3221540
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745574215; cv=none; b=pmKuKb8wO6YzLCC5Koaiv7GdnMgTf5svlyUT2niRb+90huOKvY/TUydhQ1y67g/chIe5jBdVivb0vh4/fmiFsEIkesiVu7jtUajY13RtjIKrEK6nBhrNGDqSADVeWIKiY6cORT1uRUyIobnvNUlI6J2JXQKa/FWX11nR9OJ7OJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745574215; c=relaxed/simple;
	bh=3dZ03Cctbk8GRDnjQ2ukDiOT1x+Wh+DV9Coi5ppaQkI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oT5duhfP68uQwr4hsiePcs0Eey0TolNYS3SHj53Wts9ZWkUjaRoMOhOzsoIulEF4oDemQcyj1CuyHmTLeC+Gj9d4eMUc5xA3JqcLQwQcPV0C2/4alBLEGiShHLRx4Df1h1IoG8fXFeHaZ2cz/yXZYW/l0UkWdcCEUYZi1YYLKto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FkDErMqw; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FkDErMqw"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43cf172ffe1so12125705e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 02:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745574212; x=1746179012; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cDzcGD4l+4GamgYmKiWCzMK64wUiCYhUvznVwDpSbTQ=;
        b=FkDErMqwbNT6nqBNryYjB3tLXl8cC36EJGFLPqaWPAiJPIvKx24M8jPMzqOYjNsl3S
         PKqYK/QcZZkCTXPycQuC1kF3bc1brx3MIDSgGLPhAxznUaBFESmTgQj2XrGDU/vGjXXh
         s1b73RJtmrdphvGB5nN9AsS9Li7uq1ovknj1tOXbnnrwtIH/oLStC5z1XTHE+KpMhZ9V
         NHaZ7yCOptlIVY5peD+AOJwM6e8WUhGTB0Wl8zQJ8WUT4f4ZKKOcfrfsxWkpvyJEV5dT
         84d/hQeZO/hF9v/RQH/aA9kGwE/PX7RwaBX4oTAjdcTJ03V2nT4IkMzj7gV9T4Maj5tE
         xX2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745574212; x=1746179012;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cDzcGD4l+4GamgYmKiWCzMK64wUiCYhUvznVwDpSbTQ=;
        b=gZ672ZtcVdInhC9DrXte+7oJGTwryy0H6Pi7H3PzRU1OYFjsM8/aMe6FIlkYSMTdRd
         SfXtcd1Yuh9BI2jP7PYVghkhOhQJnj8nrGLRxTmvXPNsPrrZ1oteuXKlOIYL9uFagLis
         yPAKKtLswV1toNrodzTJYSkOTA3jmNMv451QWnwIQk+AYKr5C541wke3OFtSKy0xt2DB
         OvxhzBL5ATTjgU0CSbb0DQavDAQsJnJymHAF46K1FpeQTpN7jUuEp5iCUqwmY0XHf8iW
         73XJ03ed96ZKFqYmrOgve4Tn+yBBSeTa57NYic0eF2QgZBK610iWZi/BZH+pq8YHejLa
         M4wA==
X-Forwarded-Encrypted: i=1; AJvYcCXlfUqbk/JPSbo8wAmkaF9zi3niqZ9YBgxpMwgS1vMSh2wfOlbtpARlfeNrGNfrokJ2ztlHM+1vaz3Xb9Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuCz4vME/ZSWOcmjXyLXIjwNiAGqNUvwz2pTUBksc50ol0mRaj
	bXGHFnz2CUnLIKN8UMt5k05AbVo/txMDIwBidWX/MORWJt3GCw4KbXi4h1LBanC25eXxLP6MOHv
	HEYQp7f0IBmvy+Q==
X-Google-Smtp-Source: AGHT+IGZ2Cetxgj4OKzHwKVFRWbaU4Tp9Suvxz8cHbZYhOjXprOfWnN6NLdJYK0WqMPmwQqEGM5SZ2qg9SWzB9E=
X-Received: from wmbfp9.prod.google.com ([2002:a05:600c:6989:b0:43c:f6c0:3375])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:510e:b0:43c:f3e4:d6f7 with SMTP id 5b1f17b1804b1-440a66b02d8mr14193825e9.31.1745574212389;
 Fri, 25 Apr 2025 02:43:32 -0700 (PDT)
Date: Fri, 25 Apr 2025 09:43:30 +0000
In-Reply-To: <680a5f5d.050a0220.2035d2.545b@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250424-strncpy-from-user-v1-1-f983fe21685a@google.com> <680a5f5d.050a0220.2035d2.545b@mx.google.com>
Message-ID: <aAtZQkre4KRU2kr1@google.com>
Subject: Re: [PATCH] uaccess: rust: add strncpy_from_user
From: Alice Ryhl <aliceryhl@google.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Apr 24, 2025 at 08:57:13AM -0700, Boqun Feng wrote:
> On Thu, Apr 24, 2025 at 03:17:48PM +0000, Alice Ryhl wrote:
> > This is needed for ioctls that operate on a user-provided string.
> > 
> > It is somewhat unfortunate that strncpy_from_user does not nul-terminate
> > the string when the end of `buf` is reached. This implies that we can't
> > return a &CStr from the function, since the buffer may not always be
> > nul-terminated.
> > 
> > That said, we could add more convenient helpers on top that add a NUL
> > byte in that case.
> > 
> > This method isn't defined on UserSliceReader because it complicates the
> > semantics. The UserSliceReader type also has its own maximum length, so
> > we would have to limit the read by that length too.
> > 
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> >  rust/kernel/uaccess.rs | 27 +++++++++++++++++++++++++++
> >  1 file changed, 27 insertions(+)
> > 
> > diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
> > index 80a9782b1c6e98ed6eae308ade8551afa7adc188..1bd82045e81ea887008e30241bd6de27f096b639 100644
> > --- a/rust/kernel/uaccess.rs
> > +++ b/rust/kernel/uaccess.rs
> > @@ -369,3 +369,30 @@ pub fn write<T: AsBytes>(&mut self, value: &T) -> Result {
> >          Ok(())
> >      }
> >  }
> > +
> > +/// Reads a nul-terminated string into `buf` and returns the length.
> > +///
> > +/// Fails with [`EFAULT`] if the read happens on a bad address. If the end of `buf` is reached,
> > +/// then the buffer will not be nul-terminated.
> > +#[inline]
> > +pub fn strncpy_from_user(ptr: UserPtr, buf: &mut [u8]) -> Result<usize> {
> 
> Sorry maybe there is an email I'm missing, but could you provide more
> context of the usage?
> 
> First the function name is a bit weird, because the 'n' in "strncpy"
> means the parameters should have an 'n' (i.e. length) in it, but there
> is none in the Rust version.

There is a length! It's the length of `buf`. It's pretty normal that C
methods with a pointer and length become a Rust method with a slice.

The distinction between strcpy and strncpy in my eyes is that strcpy
reads until you find a NUL byte, whereas strncpy reads until you find a
NUL byte *or* you read a user-specified number of bytes. This method is
in the latter category.

> Also, we don't need to replicate the
> semantics of C here, we could just do a strncpy_from_user(..., ..., len
> - 1), where `len` is the len of the `buf`, and then we would always have
> a nul-terminated string. But maybe I'm missing something from the usage
> side, so this is not doable?

Well, I guess that probably does make sense. I'll update this to always
add a nul-terminator.

Alice
