Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD4222171B
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 11:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746097407; cv=none; b=QoLDN+n1DNR8meW48KyXeTpnXpMcg8msIwvqjtm7JK6ztp4y3LPhsp41nOnhrxGktSqSME0oubywx4kirPxUcArwT+ZcvDZYN5OTcZcrwx2Pzn70Xkbp0kAw8j89KqLCy7iE3olA4Rjh6YMUu/k4FQeJ6kdjiXmHodyk8/QozYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746097407; c=relaxed/simple;
	bh=4AOt/YBzoH/stvqHjdr61xuvjz+JeH9y4RDsGEah2BQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Jk3yM2ESJUTKgIqSnte1Df7QHgjCwBeWccgwEmw7ks5XSdv4uP+t4fjh3Sf7b05pMuRM/gmyM2w5uE0F5qp21/JB+ccrYGK4a07lL1pQoy4arA9Zut6VxU37edYx4sxH66C394Lkmzp+PPYkm6/3SwW4G20/Cj2ghh1IG7E6Zw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zIwREbyS; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zIwREbyS"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43ced8c2eb7so6028855e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 04:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746097403; x=1746702203; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cOOok7HoNGS7TjbGuOzduLpVMwhVDXmCuCUg22wx8to=;
        b=zIwREbyScoxsSxoCF0a6YOyeyZYSqRAfljrU2KmIQfQAuX+6QUgze4IsbqSaONj7vH
         UeyVfPlv5CDgLbobz2QZ7R7KH/X0n8ta9x1YhF9x605hceLzyePUFn6+MIAU6NxAhu/o
         yNh9ciZyeMfcy0XLYyU0ktAwGspByZX5ZOflQe9oPuFSU6OKd0qTxwD3D77+HWNCgGZX
         8TiNXMFbC+PGsCVU4OOlkSQEEIz7Sy3USn7kT1LRTWtpWxAnDT2KmH7Nc8Ro9bfXO2lO
         ZYbdDophjIMhBJ7lbv7xsS6Ecn0cnjtHo6umZfwfUfgbmrfQPJV/Six+NDnpy3VJxAwl
         Kczw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746097403; x=1746702203;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cOOok7HoNGS7TjbGuOzduLpVMwhVDXmCuCUg22wx8to=;
        b=nmuMu1m5hl/EB1icjwaNWqUHICQg0yAx4oEh0XVXu0CO4YduGr1L/VHGSXR5M94gTl
         4fxj8qElFxuZBQGe9TjZv2YYHqVWJcO8npG1f9HjRp0QZIN0fz/rjAkGsocG56dL2Iqv
         AWcqNVBTnU/7aBXA9FIRt1gz643NR2O90E/YI31dFacxe/PuSFbUJJ6Md3aFq7hq14ye
         TjGxB5iGOx9vnuDOaky2MqyT9GdAdRBapWASLhyNDZShCW4VF8Yr2qZHUtJ7cqEaWPnI
         KIuF7U0uPjGHZmehC0dfC6Qvt0drEW4b2TMoA2O8fMH/Ot6f6jA4muKwSlhdGsuEqc3k
         9ZnA==
X-Forwarded-Encrypted: i=1; AJvYcCUioK9rD7ylei3k+Pq/V6/2qEr1mEGGoQkmGcymR45OhkMjK0ZsX8X5MBunctdnsGCIHkuSq6Hu4QYMTPo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9QEyWxUtW93BifHFwKgNcoElSGZk4p6fr/7VDBnDQO+i1OxAP
	eg7u2wEYBT28CzN4rYe4mAkUY/NYe+/gU2snk8oJ44rsKSrr/OB46hrdEDAyNRNSjEsDW2xL/fC
	1PYbKe62QtE6XOQ==
X-Google-Smtp-Source: AGHT+IG2OqgvvIg3X7FpxlD8OB5iJ0hMC7VH5uFV4b6y0zFgp/U8Db6poRecIO86D1QMy8tZoKiWwpmrBdB/WE8=
X-Received: from wmgi20.prod.google.com ([2002:a05:600c:2d94:b0:441:b363:76fa])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1909:b0:43e:a7c9:8d2b with SMTP id 5b1f17b1804b1-441b7044eddmr14852315e9.24.1746097403412;
 Thu, 01 May 2025 04:03:23 -0700 (PDT)
Date: Thu, 1 May 2025 11:03:21 +0000
In-Reply-To: <aBJC_Ef1lKHNx4dv@pollux>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250429-vec-methods-v4-0-dad4436ff82d@google.com>
 <20250429-vec-methods-v4-3-dad4436ff82d@google.com> <aBJC_Ef1lKHNx4dv@pollux>
Message-ID: <aBNU-XsWZLZtlmOo@google.com>
Subject: Re: [PATCH v4 3/7] rust: alloc: add Vec::push_within_capacity
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>
Content-Type: text/plain; charset="utf-8"

On Wed, Apr 30, 2025 at 05:34:20PM +0200, Danilo Krummrich wrote:
> On Tue, Apr 29, 2025 at 02:44:23PM +0000, Alice Ryhl wrote:
> > 
> > +    /// Appends an element to the back of the [`Vec`] instance without reallocating.
> > +    ///
> > +    /// Fails if the vector does not have capacity for the new element.
> > +    ///
> > +    /// # Examples
> > +    ///
> > +    /// ```
> > +    /// let mut v = KVec::with_capacity(10, GFP_KERNEL)?;
> > +    /// for i in 0..10 {
> > +    ///     v.push_within_capacity(i).unwrap();
> 
> I'd prefer to make this
> 
> 	v.push_within_capacity(i).map_err(|_| ENOMEM)?;
> 
> instead.

Perhaps we could make a new error type for `push_within_capacity`? That
way, you can use it with question mark directly, and you also get a
proper error message if you unwrap() it.

> > +    /// }
> > +    ///
> > +    /// assert!(v.push_within_capacity(10).is_err());
> > +    /// # Ok::<(), Error>(())
> > +    /// ```
> > +    pub fn push_within_capacity(&mut self, v: T) -> Result<(), T> {
> > +        if self.len() < self.capacity() {
> > +            // SAFETY: The length is less than the capacity.
> > +            unsafe { self.push_within_capacity_unchecked(v) };
> > +            Ok(())
> > +        } else {
> > +            Err(v)
> > +        }
> > +    }
> >  
> > +    /// Appends an element to the back of the [`Vec`] instance without reallocating.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// The length must be less than the capacity.
> 
> NIT: Maybe be more specific and say:
> 
> "`self.len()` must be less than `self.capacity()`."

I try to avoid starting sentences with code, but I can do it if you
prefer that. But saying "the length" and "the capacity" does not seem
ambiguous to me.

Alice
