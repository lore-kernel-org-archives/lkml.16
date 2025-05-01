Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0C32222C9
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 11:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746097817; cv=none; b=kWUVYXXsOToEEyTh30ISI9Ka8oxknJhzdmtFmjOhIPJD5RJbEEvRrLBYFNXPsXaSv3bsSRyJR05YqCvOUSHmJZ1isPk8FrhaBCaKVq1xrDGmA2yNyvbWiJuIagwJz8pS+wOZ8ba34Mw+yQ2ygCoUtC6xCwsTFz9fej7zCb0ICI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746097817; c=relaxed/simple;
	bh=fmufCjKMa/1GdLVfIcRUkDLPj+gpksWoLes0VAK38KU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OpOWd7L0YkRNDGbN8ZA5U8fkgnNFCIxlmlg3E1x8w6ZnMwxAFJ2c9VnpSWyY8hLyGh8ZlZmTd7FUYewTfBb1OHvWrkqoFyZlNYHgmvgRN2hk9H9eLPtFMgqD5Y2l5h85MeW1DdOa5OeJEwd59OkzHoCrGNgf1T6asB0x2dmXeXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SiyN5Xjj; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SiyN5Xjj"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43cec217977so3797685e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 04:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746097814; x=1746702614; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7ggEgPl3pvNDVkQxDz7r2XsQfWBdla9v522Bu48raVI=;
        b=SiyN5XjjD7boRai/JpseGuW4QuikL6Cpa4uvFwyKo9tR34vq1G4lExD+TaHddUqx6O
         zBP/W27JamPqRDfCWvnT1gSKGJvBJ1D+T+sRVqGH7A7MQdKuquHiQ53iKgaBwgnJQe/h
         sIKizz9hzVoONP8uiCJxS+tdFneXl2hDz5Q9GSELEZ+LVQJNlAM2jlHhT9xN0t2lSJ0J
         9pygSnorFzNVpvKDt5+mdbJLLy1fo6s+Noz10kVNpN56Z6bMtX0FzRPy0jPWTTr5X9pm
         JfLdAJWeVNSO1hqk3BcCrDaq55uBA5Az9ORx+0FZkdTsIbRwFp8BZTBhTBwreCHiWN9/
         /tcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746097814; x=1746702614;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7ggEgPl3pvNDVkQxDz7r2XsQfWBdla9v522Bu48raVI=;
        b=NcFDFOy5acIsxeQ7vD/Af4Z8Xj/jxvkrYBWtRQAQFt8ZJC12nhJgx/NmD/DSQxbPSq
         /2U28JiIBVaKy+NXUZuB2sMr5oPnbDNI4+JZCSDlOk4fuVhCSwdyMLsgJxK4Uha4IpAb
         MT0+95AfK22RaxvEtl8iHcG3wRaqrxOnc31rrQZ2i95oNnvM7MQBCvKHQOAfWShOJEig
         h+7VfwIpn8Hh3slaKi9fQRUndSmTsAspTrDyilXqvYpLwM7X2u0LeQCGvExUXztJuVyn
         +3B9XuLTJ4dkw+o0u+gDS254AXPOXA1CHe8VngcS+lv9VYc/ReQwvNW77GfbcjfEae0k
         KyFw==
X-Forwarded-Encrypted: i=1; AJvYcCXAa29kcvAxkGQ16Fn8JM6GkT2VcMYrwbyMlhr1CcIBWotOLqUM4ugGRKydrScvCTjJz0jG17buY057H20=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnZ7FZa6Rpo86Uem+PxiXxUBr+pyMhldzxutGwyxnhu8WfN59m
	sXYwhD68pwRBcL+7vXg55uoCX5NhBT5dfvm7rom5EExJAU8H1I/jVHnGl/l+iNRQp0M4a3QbRoj
	PgZnz75zULjWQ6w==
X-Google-Smtp-Source: AGHT+IGiXMli2M8bidn1mM2vM56aSGnm3+Zxr8ZiYNuu39eMKLwUJyFMs7iQNxXfvfFTr6l6nNOZ1qwXcroVqLQ=
X-Received: from wmqd8.prod.google.com ([2002:a05:600c:34c8:b0:43e:9aac:5a49])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3154:b0:43d:ea:51d2 with SMTP id 5b1f17b1804b1-441b64f67b4mr15942075e9.14.1746097814464;
 Thu, 01 May 2025 04:10:14 -0700 (PDT)
Date: Thu, 1 May 2025 11:10:12 +0000
In-Reply-To: <aBJPHUDYBGyAgUNf@pollux>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250429-vec-methods-v4-0-dad4436ff82d@google.com>
 <20250429-vec-methods-v4-5-dad4436ff82d@google.com> <aBJPHUDYBGyAgUNf@pollux>
Message-ID: <aBNWlC6uSOiFrQDL@google.com>
Subject: Re: [PATCH v4 5/7] rust: alloc: add Vec::retain
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Apr 30, 2025 at 06:26:05PM +0200, Danilo Krummrich wrote:
> On Tue, Apr 29, 2025 at 02:44:25PM +0000, Alice Ryhl wrote:
> > This adds a common Vec method called `retain` that removes all elements
> > that don't match a certain condition. Rust Binder uses it to find all
> > processes that match a given pid.
> >
> > The stdlib retain method takes &T rather than &mut T and has a separate
> > retain_mut for the &mut T case. However, this is considered an API
> > mistake that can't be fixed now due to backwards compatibility. There's
> > no reason for us to repeat that mistake.
> >
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> >  rust/kernel/alloc/kvec.rs | 72 +++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 72 insertions(+)
> >
> > diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
> > index 72bc743ec88bf7b91a0a1ffd9f830cfe4f983ffd..357f5a37c7b1d15b709a10c162292841eed0e376 100644
> > --- a/rust/kernel/alloc/kvec.rs
> > +++ b/rust/kernel/alloc/kvec.rs
> > @@ -608,6 +608,29 @@ pub fn drain_all(&mut self) -> DrainAll<'_, T> {
> >              elements: elems.iter_mut(),
> >          }
> >      }
> > +
> > +    /// Removes all elements that don't match the provided closure.
> > +    ///
> > +    /// # Examples
> > +    ///
> > +    /// ```
> > +    /// let mut v = kernel::kvec![1, 2, 3, 4]?;
> > +    /// v.retain(|i| *i % 2 == 0);
>
> NIT: What about making this `v.retain(|&mut i| i % 2 == 0)`?
>
> > +    /// assert_eq!(v, [2, 4]);
> > +    /// # Ok::<(), Error>(())
> > +    /// ```
> > +    pub fn retain(&mut self, mut f: impl FnMut(&mut T) -> bool) {
> > +        let mut num_kept = 0;
> > +        let mut next_to_check = 0;
> > +        while let Some(to_check) = self.get_mut(next_to_check) {
> > +            if f(to_check) {
> > +                self.swap(num_kept, next_to_check);
> > +                num_kept += 1;
> > +            }
> > +            next_to_check += 1;
> > +        }
> > +        self.truncate(num_kept);
> > +    }
> >  }
> >
> >  impl<T: Clone, A: Allocator> Vec<T, A> {
> > @@ -1130,3 +1153,52 @@ fn drop(&mut self) {
> >          }
> >      }
> >  }
> > +
> > +#[macros::kunit_tests(rust_kvec_kunit)]
> > +mod tests {
> > +    use super::*;
> > +    use crate::prelude::*;
> > +
> > +    #[test]
> > +    fn test_kvec_retain() {
>
> Can we have this return a Result, like doctests can do?

I get warning when I try that:

warning: unused `core::result::Result` that must be used
    --> rust/kernel/alloc/kvec.rs:1232:1
     |
1232 | #[macros::kunit_tests(rust_kvec_kunit)]
     | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
     |
     = note: this `Result` may be an `Err` variant, which should be handled
     = note: `#[warn(unused_must_use)]` on by default
     = note: this warning originates in the attribute macro `macros::kunit_tests`
             (in Nightly builds, run with -Z macro-backtrace for more info)

> > +        /// Verify correctness for one specific function.
> > +        #[expect(clippy::needless_range_loop)]
> > +        fn verify(c: &[bool]) {
> > +            let mut vec1: KVec<usize> = KVec::with_capacity(c.len(), GFP_KERNEL).unwrap();
> > +            let mut vec2: KVec<usize> = KVec::with_capacity(c.len(), GFP_KERNEL).unwrap();
> > +
> > +            for i in 0..c.len() {
> > +                vec1.push_within_capacity(i).unwrap();
> > +                if c[i] {
> > +                    vec2.push_within_capacity(i).unwrap();
> > +                }
> > +            }
> > +
> > +            vec1.retain(|i| c[*i]);
> > +
> > +            assert_eq!(vec1, vec2);
>
> Don't we have macros around kunit_assert!() and kunit_assert_eq() outside of
> doctests (i.e. dedicated kunit tests)?
>
> I much prefer their output over the kernel panic we get with the "normal"
> asserts, unwraps, etc.
>
> Consistently sticking to the same output on failure makes it easier to catch and
> easier to setup CI environments.

The documentation for those macros says "Public but hidden since it
should only be used from generated tests." so I don't think I'm supposed
to use them.

Alice
