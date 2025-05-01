Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CE219F11B
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 14:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746109455; cv=none; b=tjyNNMn+7bWlfmN7/oY6HwXgnYooTN6kYoMOfLtvm+yjTtcfyaFFHQ9qInMjbK1W6M6GxzvDqOR0z6mr6YF8AUrmag5Cy1ML0LGvZ5hq/APR6lxtg+lfgvanXyHQd0DINNjtnn/nGvddnm4kcPMQW+gMih6izJiaacLKtVPPkCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746109455; c=relaxed/simple;
	bh=gnCkNJEuzzUc6tNGlIMicZLHA6gxUDZ8Ms+e0F962zQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BcGk4gE0Zn4xRK1cidtGbPC3GWqW++4pxOo6xq7NS65SQyVn7QJvrL9Z9nW5tqpRwuBSW6YLDMKvq+o2FRcTREY/0LgFqtjXNIoEFykfDSldHEYHW10SfyYD5132V5dZihPziU02ynQoyd0l9f5XmKswUGtxRhrOQ7nws17THBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BRAxa/UT; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BRAxa/UT"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-39123912ff0so213182f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 07:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746109452; x=1746714252; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GD4VAxiUdckVgdAlI2FatFx9gxYTX40bGPiV9AMDOdA=;
        b=BRAxa/UTvkXcbMc0K9CZKQaiDoy7A8zsuA5NGoz6WqElZ4hZOuXAsDrPfxnvzMFDJz
         XPCx47pvLDjR51o+Q+7OPeXafrNXvu9xoo1ySG8jKihKb7Ek/k1tiGQSK1kv44KJxnkT
         lTki1K1FC0e2u4ZLo92Bo8y9ATXbSpv4gZhr66zsv0SNClpUV/IL0e8Z7Aqidv/JzKSS
         DYYc7lqNexVZAc7oITvZOF/qmEfO37fWbP3sLTRTfTazAJIfYScbmrCt926R1rpoqUSi
         cHFZsompqXguLMsmAwivqUdCOdeqpdgt8R4vsbUmFCFOGpE9USJexelXx0V5yXp0Q8P9
         PPWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746109452; x=1746714252;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GD4VAxiUdckVgdAlI2FatFx9gxYTX40bGPiV9AMDOdA=;
        b=VE4kq+dQBXTLuZfYSxdZ7hscXFBC8+5cXnqrqZJha0mkdbi92L47cBltZSkNWMFxFv
         78LoDuWyUr1KD0HVMfSTxJjUFmNYiKeATrPy5YneNJmCTlkVZh0zUt4EHXPZ3QT9CZ7G
         fvmocYSmcrzu63kmqbKlpfcEkrd6v69yfl/I8MubRcGtL7OlGaPIVx8d5j3oa/ePAxt8
         Ca9tbQIvw+VMFHsTnV71iKjYZWJy8JxSCQxxuzsWPdRJPk2PMqYTQHs6nUZQq5hDxMDV
         zZOGiyuY4lwZTbvEEccv3VghMumime36LFjacdhxb3EE6JvzBAFKetl1jhzcYcF3J4lj
         ixvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzCYFuD9/xOnC7z7GbOpcN7cKcX7YAangF1Cx58IzyL40M6h1cPwtNZDtLLCk4DICVMii2qdpr+xC6X6I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSNUEvs8AQF484Zl1DiIbVFSr553XntnOjvVXYe2dG0cYgs8T9
	25Hrj1DNIqK21IWMD9aB5VUiPPuKZHxfCvQb6sdP1+TESpk+PFdyJRFyorIkRdUa+zKpR9bBIJN
	EzcXO+BXm7oMzTA==
X-Google-Smtp-Source: AGHT+IH9yGiPQdQL/rTilbunR/lysJc95bXc2ytBh0NmP0UvNWHaAuoBWrl9kb95nbidxeiQM/JuMcTKm/XCOfs=
X-Received: from wmbfk13.prod.google.com ([2002:a05:600c:ccd:b0:43c:f6c0:3375])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1446:b0:39c:310a:f87e with SMTP id ffacd0b85a97d-3a09404c8c7mr2238448f8f.16.1746109452277;
 Thu, 01 May 2025 07:24:12 -0700 (PDT)
Date: Thu, 1 May 2025 14:24:10 +0000
In-Reply-To: <aBNbTL2dIOFQq8yG@pollux>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250429-vec-methods-v4-0-dad4436ff82d@google.com>
 <20250429-vec-methods-v4-5-dad4436ff82d@google.com> <aBJPHUDYBGyAgUNf@pollux>
 <aBNWlC6uSOiFrQDL@google.com> <aBNbTL2dIOFQq8yG@pollux>
Message-ID: <aBOECvlbtVjP6iAI@google.com>
Subject: Re: [PATCH v4 5/7] rust: alloc: add Vec::retain
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, May 01, 2025 at 01:30:20PM +0200, Danilo Krummrich wrote:
> On Thu, May 01, 2025 at 11:10:12AM +0000, Alice Ryhl wrote:
> > On Wed, Apr 30, 2025 at 06:26:05PM +0200, Danilo Krummrich wrote:
> > > On Tue, Apr 29, 2025 at 02:44:25PM +0000, Alice Ryhl wrote:
> > > > +#[macros::kunit_tests(rust_kvec_kunit)]
> > > > +mod tests {
> > > > +    use super::*;
> > > > +    use crate::prelude::*;
> > > > +
> > > > +    #[test]
> > > > +    fn test_kvec_retain() {
> > >
> > > Can we have this return a Result, like doctests can do?
> > 
> > I get warning when I try that:
> > 
> > warning: unused `core::result::Result` that must be used
> >     --> rust/kernel/alloc/kvec.rs:1232:1
> >      |
> > 1232 | #[macros::kunit_tests(rust_kvec_kunit)]
> >      | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >      |
> >      = note: this `Result` may be an `Err` variant, which should be handled
> >      = note: `#[warn(unused_must_use)]` on by default
> >      = note: this warning originates in the attribute macro `macros::kunit_tests`
> >              (in Nightly builds, run with -Z macro-backtrace for more info)
> 
> Yes, I'm aware, I tried playing with that myself. I really meant the question as
> I wrote, not as "Can you please change that?". :-) Sorry for the confusion.

One downside is that returning a Result doesn't show the line of code
where it failed.

> > > > +        /// Verify correctness for one specific function.
> > > > +        #[expect(clippy::needless_range_loop)]
> > > > +        fn verify(c: &[bool]) {
> > > > +            let mut vec1: KVec<usize> = KVec::with_capacity(c.len(), GFP_KERNEL).unwrap();
> > > > +            let mut vec2: KVec<usize> = KVec::with_capacity(c.len(), GFP_KERNEL).unwrap();
> > > > +
> > > > +            for i in 0..c.len() {
> > > > +                vec1.push_within_capacity(i).unwrap();
> > > > +                if c[i] {
> > > > +                    vec2.push_within_capacity(i).unwrap();
> > > > +                }
> > > > +            }
> > > > +
> > > > +            vec1.retain(|i| c[*i]);
> > > > +
> > > > +            assert_eq!(vec1, vec2);
> > >
> > > Don't we have macros around kunit_assert!() and kunit_assert_eq() outside of
> > > doctests (i.e. dedicated kunit tests)?
> > >
> > > I much prefer their output over the kernel panic we get with the "normal"
> > > asserts, unwraps, etc.
> > >
> > > Consistently sticking to the same output on failure makes it easier to catch and
> > > easier to setup CI environments.
> > 
> > The documentation for those macros says "Public but hidden since it
> > should only be used from generated tests." so I don't think I'm supposed
> > to use them.
> 
> Same here, that's more a fundamental question, rather than something for you to
> change right away.
> 
> I really like the way doctests implement the assert macros and how they appear
> in the kernel log compared to panics through the "real" assert ones, unwraps,
> etc.
> 
> I also think that avoiding things that directly panic in doctests (i.e. example
> code) is the correct thing to do. For KUnit tests it's probably less important,
> since they don't directly serve as sample code.
> 
> So, I wonder what's our take on that. Do we want to have KUnit and doctests
> aligned? I think that'd be a good thing.

I think that both of these would be reasonable to fix. Also the fact
that I had to do #[macros::kunit_tests()] instead of just #[kunit_tests()].

Alice
