Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFEB8B674
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 12:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746015319; cv=none; b=Dpu36zjjWcEd2RuT73PAvkoMAGe65YE06kQZlJY+7SAqDqoZSkqaVDy7Hnk5O59ss94dixJ6LWb84X+zeMa/KiLTPTq8e/D/LzUWrnfhSGJ/41AjMIug6tuj6P9qrxYcrIiHIRg4HgB1a16evEGi052VgAjq2TLID0byx0aiZuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746015319; c=relaxed/simple;
	bh=+PMrTV4cMqqu/lA+cBky0GvUBIqaXbLjxr4LQJmpKag=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FTkPhdo2W9pyM9xoghKgS4qiwHo/BWSXKOP/Wn4DplP2ZF++u+UNaaBYen76En0m6Sen4Ip7FK9qhirt58e1Wf3E5uv9QeH+nQ0ycNM6k5N1AnvUPDg+Om9LLYg6VZuj74kMCvjlxiZ73pO03nlfYoKf7BL7QwHRQvCIOjaEOsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JY2Uls+j; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JY2Uls+j"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43d0830c3f7so55023765e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 05:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746015316; x=1746620116; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nTKCIm+7pqVBVyacOmAhIisX4MK9GGaxDxO7NBbyAN4=;
        b=JY2Uls+jmAxMbrMhH47Nzk3Bh3KqBPPOHK5E8xB9azg7e/jiZJC+YkfR+J1w4z72ua
         1ANIIsHmNy/4kLXzKR7AoHb5WUgl/cH5RkLVB/Z9vzjqFwo26okrwZEyA8MuejFy0h5F
         NkmLLMil1tnagQwOFvHgIZZP5P3J06JjskfBMWPVnEM1geC6y2BID7FmhOYGCbifs6U4
         IPIGKwX/wti9FEQIwr4XdgPTcyXtk4j3UFH31ofpixcZLfdfVRSlKCIlkv2tGTxiVazZ
         FbHFH68F26hOkD3+7nvOgz0inZwKaf+CFRGtpmlUG4URkr6fuDE+l1hmZ0MWCYzfGpeo
         pXcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746015316; x=1746620116;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nTKCIm+7pqVBVyacOmAhIisX4MK9GGaxDxO7NBbyAN4=;
        b=ppCpYwWvxcBzTY/ZxQ5J9ynkQ4mEs4NUJD+ytlVoiYuTD2Jf425ewHXjyJwZbTVzfc
         xxacjUFSI9ROCNJEalzzBM8Qlt3jwK91ESQEKk912YaZvXcQySvB2g+1s+bflAvGk8Nl
         YRf2dPUBlIjtoL4zk281tAgWyzMQbASCg3tOUy0JpeZQbd0IqBtkZlf9Gb5HpI5lIbJc
         sYve4/wrf8yhWGxyXBzOpnTs75C36oWxigeeYaL03xfRPWfDKgp7cFa2DLXVYwF573UH
         tMwPpmxa3lYPzOUpVdIaGHAz50UjMTkB2diVTiIZYF4MOdgFxz7uzFBIckjWgJarfvs5
         SSdg==
X-Forwarded-Encrypted: i=1; AJvYcCXtmggSLyeWq8kIejLe5LL7bp+A2ncgFJ4EVWHsRRnWWasumCBKC9Nq8ZsyUn2GlxtxZpxGLsp5CjgDP+Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUo6rr6ekTrMmg2D/rfB9lFV+QnEuW36W1DMxUlcAsX5cerzP4
	j/L0udTwdqH2EDuUSRZu78RSsh3AwPWjjri3wuvpAcpj9hnFkJD5k7YQblngoWgaOLHSnzesd37
	o0j0fCWmlMlBgag==
X-Google-Smtp-Source: AGHT+IHMDr/rZjgFYSiN16p1TscIq688FqOB0h/PUjPN14cIJ5RHkwIyd6kYOwKeOQZmyhKW+W0dB9Qx4oUzhP8=
X-Received: from wmrs8.prod.google.com ([2002:a05:600c:3848:b0:43c:fd72:aae1])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b08:b0:43c:f64c:447f with SMTP id 5b1f17b1804b1-441b43a62ccmr10399725e9.29.1746015316406;
 Wed, 30 Apr 2025 05:15:16 -0700 (PDT)
Date: Wed, 30 Apr 2025 12:15:14 +0000
In-Reply-To: <2025043045-overbuilt-swab-5b65@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250429-vec-methods-v4-0-dad4436ff82d@google.com>
 <20250429-vec-methods-v4-7-dad4436ff82d@google.com> <2025042925-kindly-squash-fa6f@gregkh>
 <aBIIZ64_Wsk1unB2@google.com> <2025043045-overbuilt-swab-5b65@gregkh>
Message-ID: <aBIUUs4AWTII2bcO@google.com>
Subject: Re: [PATCH v4 7/7] rust: alloc: add Vec::insert_within_capacity
From: Alice Ryhl <aliceryhl@google.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Apr 30, 2025 at 01:39:03PM +0200, Greg KH wrote:
> On Wed, Apr 30, 2025 at 11:24:23AM +0000, Alice Ryhl wrote:
> > On Tue, Apr 29, 2025 at 05:30:06PM +0200, Greg KH wrote:
> > > On Tue, Apr 29, 2025 at 02:44:27PM +0000, Alice Ryhl wrote:
> > > > This adds a variant of Vec::insert that does not allocate memory. This
> > > > makes it safe to use this function while holding a spinlock. Rust Binder
> > > > uses it for the range allocator fast path.
> > > > 
> > > > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > > > ---
> > > >  rust/kernel/alloc/kvec.rs | 39 +++++++++++++++++++++++++++++++++++++++
> > > >  1 file changed, 39 insertions(+)
> > > > 
> > > > diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
> > > > index 0682108951675cbee05faa130e5a9ce72fc343ba..998afdcde47bec94b2c9d990ba3afbb3488ea99e 100644
> > > > --- a/rust/kernel/alloc/kvec.rs
> > > > +++ b/rust/kernel/alloc/kvec.rs
> > > > @@ -355,6 +355,45 @@ pub unsafe fn push_within_capacity_unchecked(&mut self, v: T) {
> > > >          unsafe { self.inc_len(1) };
> > > >      }
> > > >  
> > > > +    /// Inserts an element at the given index in the [`Vec`] instance.
> > > > +    ///
> > > > +    /// Fails if the vector does not have capacity for the new element. Panics if the index is out
> > > > +    /// of bounds.
> > > 
> > > Why panic and why not just return an error instead?
> > 
> > It's for consistency with stdlib. Illegal use is panic, expected error
> > conditions are errors.
> 
> But this is the kernel, not userspace :)
> 
> As you can return an error, why not?  Rebooting a box should be a "last
> resort" type of thing when you can not recover from an error.  You can
> easily not overflow and return an error here, so why do you want to just
> give up and cause all data to be lost?
> 
> And I don't see any other panics happening in this file, so would this
> be the first one?

I don't feel strongly about this method, but it's not the first panic.
The vector type has an indexing operator vec[i] that panics if you index
out-of-bounds.

Alice
