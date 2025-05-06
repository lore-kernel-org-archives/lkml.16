Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EACC264615
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 09:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746523129; cv=none; b=DQGUvXT2LCY1wqNAWj441dZ27BXQVA201k34p+45D03QlXCFBGK/Xo5oe6bOGZKTme3+P789B7nL/A9/IWt/NdlVCtwzVlVuDAwWfZYjMUwsPRJRqgc4D+fnQH3BsFlHml81U6wccvT+dAhkAH6PoaykSzRsX8QautB+QcvZx+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746523129; c=relaxed/simple;
	bh=E17ZjcvNnE3gAHLsWjbhAU+S/T/HGrIZaGnxTG4pkM0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UDl7dd+yf1QflDr4WlYK6EoNt/vhuIHTFh6lX5szyKRNILbIHHDXwc1dz5X6EqQYQKfDYXE5dYjQEXow9CZTzJ014VPUlwE3sd0GEfuQagnWsCzHYYN/fbYlkkMzgOjSlaGhCVSFzLKMV9zL/wYwUTq+/4Nu3QaHGiS4W1xOxm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I9NNNywE; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I9NNNywE"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43cf446681cso31399095e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 02:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746523125; x=1747127925; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=AiYBfuBPq0PKabiO1M3oY2RQ97WInUw/jmCaL8pZJF0=;
        b=I9NNNywEUGwjQsJdkMTR6FDfHlPaZyY58OwhwbddgD1MzgfNFELY5preIjlaaJzHpN
         qAZ7l1CJVYc+YuN8gMGj5h+PNky0sA3/Pqt2kqb8zdUg62RP7ZrKN8iPJIPaLVsEKctI
         FRs4NOw3si1sdgCEc85YckxOGDB9tr7612VA6PwIlogGzWwv0DAISgFEdqxkoQ5pCiNY
         RpV0tTpO7YEuFsZ1LIx4VLhmmnjJny0l6lKyIF24Am3QTdEINPgaiiOSXct+xu82aUId
         1kQA+RvWAIq0CSKmtR9NraJu6K9Kvllw0lRstDkiLoPcOTNjpa3DexsXSTs2hnyLpCyV
         HvEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746523125; x=1747127925;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AiYBfuBPq0PKabiO1M3oY2RQ97WInUw/jmCaL8pZJF0=;
        b=Gd8RIBLYrfERdOfezK3CsZJs4jDVWss81pst9dsk2y6NEicxsxvhZHSRvs5p7RZSUI
         nH7bDnLtN05MHrO5IDeKG6oPOhViPgazOI45s+s/ZkaY1kqvnSEAx2SfMi6LpHSgUfiv
         CdulDgLzPTTyYlD0LIs/UaPZJDbbemjKek8OMVY0ujQg7s3ZXaTF3K+RcVC0XVKs1vRz
         7YFMpP+CyFDy6PwuGvKnrJUUbFg5+DMWuiaX1swrLW3aqadr2CWms82/LbZ11QZkmAd0
         XsGJzFepJVLv6hVviISIFpAzCu3OXR6326HK214ROpushg8fj5blsXBZGoRty903rVXZ
         jOEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcrUrsCohJs1yyfTP60odTvqqLey30gXxzH2R9VfBXtgctFskc6yf/lyWGI5N8YDEW49luJkoi3HOZRNs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo5OQpEyNRCqKT3CGS/KKaIek2kLutnc6AUAQFBNX9xnsfMg+p
	gb5htC0kqU+DZTc40PSOAr7wRQ0RUCSGHYhl7rBo21xivTyF+vdueMO/WVBqOXml9l6Tsip3PA5
	lcYu3kfBLi/dTtg==
X-Google-Smtp-Source: AGHT+IFUIi/aIrJ+YBlE4GZq9QhM4TQhjCYLMqpNPEPZ/dnhztAF0TRSuK+vVuzlXWZ0B183nyofXeU+L1JIfzI=
X-Received: from wmsp15.prod.google.com ([2002:a05:600c:1d8f:b0:43d:56fa:9b95])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3c90:b0:43c:f44c:72b7 with SMTP id 5b1f17b1804b1-441c48bdfdamr99780575e9.14.1746523123132;
 Tue, 06 May 2025 02:18:43 -0700 (PDT)
Date: Tue, 6 May 2025 09:18:41 +0000
In-Reply-To: <2025050544-sneak-compactor-d701@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250505-strncpy-from-user-v3-0-85c677fd4f91@google.com>
 <20250505-strncpy-from-user-v3-1-85c677fd4f91@google.com> <2025050544-sneak-compactor-d701@gregkh>
Message-ID: <aBnT8Y3lJqd6J40q@google.com>
Subject: Re: [PATCH v3 1/2] uaccess: rust: add strncpy_from_user
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

On Mon, May 05, 2025 at 04:30:05PM +0200, Greg Kroah-Hartman wrote:
> On Mon, May 05, 2025 at 12:17:31PM +0000, Alice Ryhl wrote:
> > This patch adds a direct wrapper around the C function of the same name.
> > It's not really intended for direct use by Rust code since
> > strncpy_from_user has a somewhat unfortunate API where it only
> > nul-terminates the buffer if there's space for the nul-terminator. This
> > means that a direct Rust wrapper around it could not return a &CStr
> > since the buffer may not be a cstring. However, we still add the method
> > to build more convenient APIs on top of it, which will happen in
> > subsequent patches.
> > 
> > Reviewed-by: Danilo Krummrich <dakr@kernel.org>
> > Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> >  rust/kernel/uaccess.rs | 35 ++++++++++++++++++++++++++++++++++-
> >  1 file changed, 34 insertions(+), 1 deletion(-)
> > 
> > diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
> > index 80a9782b1c6e98ed6eae308ade8551afa7adc188..a7b123915e9aa2329f376d67cad93e2fc17ae017 100644
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
> > @@ -369,3 +369,36 @@ pub fn write<T: AsBytes>(&mut self, value: &T) -> Result {
> >          Ok(())
> >      }
> >  }
> > +
> > +/// Reads a nul-terminated string into `buf` and returns the length.
> > +///
> > +/// This reads from userspace until a NUL byte is encountered, or until `buf.len()` bytes have been
> > +/// read. Fails with [`EFAULT`] if a read happens on a bad address (some data may have been
> > +/// copied). When the end of the buffer is encountered, no NUL byte is added, so the string is
> > +/// *not* guaranteed to be NUL-terminated when `Ok(buf.len())` is returned.
> > +///
> > +/// # Guarantees
> > +///
> > +/// When this function returns `Ok(len)`, it is guaranteed that the first `len` of `buf` bytes are
> > +/// initialized and non-zero. Furthermore, if `len < buf.len()`, then `buf[len]` is a NUL byte.
> > +/// Unsafe code may rely on these guarantees.
> > +#[inline]
> > +#[expect(dead_code)]
> > +fn raw_strncpy_from_user(ptr: UserPtr, buf: &mut [MaybeUninit<u8>]) -> Result<usize> {
> 
> Nit, the parameters here are backwards from the C version of
> strncpy_from_user(), which is going to cause us no end of grief when
> reviewing code between the two languages :(

I'll swap them.

fn raw_strncpy_from_user(dst: &mut [MaybeUninit<u8>], src: UserPtr) -> Result<usize> {

> Also, it's not your fault, but we don't have any type of __user tag for
> data coming from userspace yet to track this type of thing?  The
> compiler (well sparse) can catch this type of thing in C, any hints on
> what we could do in Rust for the same type of guarantee (i.e. don't
> touch user data before it's been copied, and then we need to treat it as
> "unverified" but that's a different patch series...)

The UserPtr typedef is intended to do that, but since it's only a
typedef to usize, the compiler won't detect it if you mix up a user
pointer with a length. (It will detect mix-ups with pointers since we
use an integer type for UserPtr.)

What we can do is replace the typedef with

#[repr(transparent)]
struct UserPtr(pub usize);

That way, it becomes it's own separate type (this is called the newtype
pattern [1]) so that it can't be mixed up with anything else.

The #[repr(transparent)] annotation makes the compiler treat it like a
bare long for ABI-purposes. I'm not sure if any function ABIs actually
treat a long differently from a struct that just contains a long, but if
such ABIs exist, then the annotation ensures that the long ABI is used
rather than the struct-containing-long ABI.

Alice

[1]: https://doc.rust-lang.org/rust-by-example/generics/new_types.html
