Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4586E21D3D9
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 15:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745939394; cv=none; b=fSJHGpYxyGZR3YincMEw6orbVmCJJLEyYSp1Tvn6O6BYvewsaR0syPaEjilKO8Kaq2tTQyti79PSMPpTUI6S8RkXeYOCdpyKxX7+pfo8Q3Bk3w+XzvyCfI/lhEzvHPsuK14dmKX3PVO0uQJ7kZ6zGR5S9BMi4svWl1hUTlllH7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745939394; c=relaxed/simple;
	bh=7dYHrKUTPQP/Hr8bdLFOeeYAAyr9lrBYjROmKMi5q2Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=boCXHwpz/Lc5C8d738HH/sSuh6xW/E07iYkIk1q08nOUc9jm+NAzJfXUyUrX6qxVWJTc5O7Hivc4tKVcKTRq9tPYwQMZvf23f7vYzP3rmq6vsdYxKq6HX+pf4A6qWJlpTzvuUahGuDRTl+7H0q5vXE5LC5bNZK8y4uTSZDcc8c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SgOP5dSv; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SgOP5dSv"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3912539665cso2831175f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 08:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745939390; x=1746544190; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YSv8m1J8saJ9RpNQY0ts0Wj93tfXy19QLPFGEb6TRBw=;
        b=SgOP5dSvMLWzaU/IRuDk5lLvNt4+xyWgduzjHdD9xwvBJEVpj8ebWapaZZzh83tQai
         M3GdNeGItQFw72pFk6VOKFwU5XfNtWQ9/btpvFkRONVy+0FnMJOfAT+6uXiPw3mui+k0
         VfYNEB8N295a0ydAP0EAymzLaCV8fbHdZGA6d5gwxZhRu1KvYoPsZrExLVC1q0oupv8A
         SQ7wjbvFdIoi8xH2yBnL8jKh6GVJUP+fCBbjrDFfO1Re4HEHN18OCOe88tzUd7tF0b4H
         HAeOtqBYWAE0ZB7805j3EJjEThx1MD+no3yjr5SXgstMHxLOY/gJrhRTzgcA5M963kVh
         NPmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745939390; x=1746544190;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YSv8m1J8saJ9RpNQY0ts0Wj93tfXy19QLPFGEb6TRBw=;
        b=dWP9um8QXDWJ6u+qFuHePfG/K3HyAk1DeWv9AwL8/Qc7OFZaCKIpyTsVVaGJKxuFb+
         GCRu8Cgas+5xXVmCYr2Ge7fTyHNThF6C3vhvsb3PNIC1HPIhS9tA11jqp7Lae1pCQ19G
         wqgRftOQ1l4OyFmPDUhjyrFhzdZk04oTN3r7RhCD5SuDcOeTgqzEiCCnmfqVB0dOZB/B
         UkgwcGntaCTsx8TYon6+GlmCZN/becB4U+LF8QYaTtiIO4HZ11S6sYu02Vq03ONMLva9
         NQHkWoUw43O4WHbKyAcDgIFKRM8APqWRnoxVz6zTycj2QAIaMMchj7HD0stCxUFZtPhS
         99zA==
X-Forwarded-Encrypted: i=1; AJvYcCU9u5WvvV56D9G8kHy4SX/c0+t3MvfO1aSZk0Db3FTGaP60ZnycpB5oQWUodkxJqN0qNwc1xFzqwcPmSdA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKPkRPN8dXThYE6Px6heJ1AYKkK3l/ncBhf0up3PH7i19NLiNq
	pdyCKzFPzyJRfeYLqg/SAa5wkR2f9MROmklDw3cK62XIT3A+0PeFzUT3AxSSfD8NhLjlirW2sr8
	3YVmPCiTd/DZcXA==
X-Google-Smtp-Source: AGHT+IGounaCRSN9hjbKTVwcvwCpFuIXy9GARicDb4UeOPCmeVFAKu67J/rky+PAHuGyzy+H/gPxT0yINOcSmFY=
X-Received: from wrbck11.prod.google.com ([2002:a5d:5e8b:0:b0:39a:be9d:f396])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:220d:b0:39c:1258:d12c with SMTP id ffacd0b85a97d-3a08a558dd9mr2706214f8f.28.1745939390469;
 Tue, 29 Apr 2025 08:09:50 -0700 (PDT)
Date: Tue, 29 Apr 2025 15:09:48 +0000
In-Reply-To: <2025042918-outer-roamer-ab80@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250429-strncpy-from-user-v2-0-7e6facac0bf0@google.com>
 <20250429-strncpy-from-user-v2-1-7e6facac0bf0@google.com> <2025042918-outer-roamer-ab80@gregkh>
Message-ID: <aBDrvBelMq2QwPs0@google.com>
Subject: Re: [PATCH v2 1/2] uaccess: rust: add strncpy_from_user
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Apr 29, 2025 at 01:04:44PM +0200, Greg Kroah-Hartman wrote:
> On Tue, Apr 29, 2025 at 09:02:22AM +0000, Alice Ryhl wrote:
> > This patch adds a direct wrapper around the C function of the same name.
> > It's not really intended for direct use by Rust code since
> > strncpy_from_user has a somewhat unfortunate API where it only
> > nul-terminates the buffer if there's space for the nul-terminator. This
> > means that a direct Rust wrapper around it could not return a &CStr
> > since the buffer may not be a cstring. However, we still add the method
> > to build more convenient APIs on top of it, which will happen in
> > subsequent patches.
> > 
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> >  rust/kernel/uaccess.rs | 34 +++++++++++++++++++++++++++++++++-
> >  1 file changed, 33 insertions(+), 1 deletion(-)
> > 
> > diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
> > index 80a9782b1c6e98ed6eae308ade8551afa7adc188..acb703f074a30e60d42a222dd26aed80d8bdb76a 100644
> > --- a/rust/kernel/uaccess.rs
> > +++ b/rust/kernel/uaccess.rs
> > @@ -8,7 +8,7 @@
> >      alloc::{Allocator, Flags},
> >      bindings,
> >      error::Result,
> > -    ffi::c_void,
> > +    ffi::{c_char, c_void},
> >      prelude::*,
> >      transmute::{AsBytes, FromBytes},
> >  };
> > @@ -369,3 +369,35 @@ pub fn write<T: AsBytes>(&mut self, value: &T) -> Result {
> >          Ok(())
> >      }
> >  }
> > +
> > +/// Reads a nul-terminated string into `buf` and returns the length.
> > +///
> > +/// This reads from userspace until a NUL byte is encountered, or until `buf.len()` bytes have been
> > +/// read. Fails with [`EFAULT`] if a read happens on a bad address. When the end of the buffer is
> > +/// encountered, no NUL byte is added, so the string is *not* guaranteed to be NUL-terminated when
> > +/// `Ok(buf.len())` is returned.
> 
> I don't know if it matters, but this can fill up the buffer a bit and
> still fail, to quote from the strncpy_from_user() documentation:
> 
> 	 If access to userspace fails, returns -EFAULT (some data may have been copied).

It doesn't matter, but it may still be useful to mention.

> > +///
> > +/// # Guarantees
> > +///
> > +/// When this function returns `Ok(len)`, it is guaranteed that the first `len` of `buf` bytes are
> > +/// initialized and non-zero. Furthermore, if `len < buf.len()`, then `buf[len]` is a NUL byte.
> > +/// Unsafe code may rely on these guarantees.
> > +#[inline]
> > +pub fn raw_strncpy_from_user(ptr: UserPtr, buf: &mut [MaybeUninit<u8>]) -> Result<usize> {
> > +    // CAST: Slice lengths are guaranteed to be `<= isize::MAX`.
> > +    let len = buf.len() as isize;
> > +
> > +    // SAFETY: `buf` is valid for writing `buf.len()` bytes.
> > +    let res = unsafe {
> > +        bindings::strncpy_from_user(buf.as_mut_ptr().cast::<c_char>(), ptr as *const c_char, len)
> > +    };
> > +
> > +    if res < 0 {
> > +        return Err(Error::from_errno(res as i32));
> 
> Nit, this can just be returning EFAULT, but I guess it's safest just to
> mirror what was passed back.

I think it's easiest to just mirror what was passed back.

> I would say to just leave it as "pub" for now, but that's not a big
> deal.
> 
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Thanks!

Alice
