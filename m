Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092A62701B2
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 11:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745495269; cv=none; b=m4OALU72xoBeAnykNklcH+8iTFuKkriHi2lj8D6F4MeWKX/Ppkj8FZl2DeEPQPfZEXTx0bFa1ZIJ92O8L16T7SrnlH+DTCyYxaJTKamNuq04W3TWy9ppXSY3l0vTMiAHba7U+uHlRG0gHgS3MaQCuK0EMLN98s6D4FV8NGK35+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745495269; c=relaxed/simple;
	bh=w59BdtIdWvLqx8yPsO65Kvt2OcdoiM5urxXFfQ/uCQA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cEPT9IIGU+Uve2+2PoPopPBZSm1u4GXYcda+g6TPzTyEU+5JzXToSKaYukcXe+RF0C+UNBu4stsg9Gnol9X8RBslNiSskOTE/3Qmg+EbxGO3Ud98Uly9rMyx8dEWddc3iZFDSfxcskLZGnRzWyBaQ20EA2IZdbSWzKaGYMkoysk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Tg0GYw3O; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Tg0GYw3O"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-44059976a1fso3401035e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 04:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745495266; x=1746100066; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xox/wdPA3KHuKTWKwSgLpPolKz1P+xeFzFYtxAW0a7A=;
        b=Tg0GYw3OdeTuBrWtL5hmWzAS2EIk50biI+sKaHid1I86oAgmIi6k4oDVFJiGC6vErz
         ESaxGuCQc/2EfcQa4rBqSIyeXYyDk8QfQ+8w4D/PtIOgpdQEeEyvtphiAppWCC3TeId3
         pCMQGoo0aKTBUSfkpV6d2zaT7uX4cXMDx/SX/9BfbWShWRqIBwauJ1oWfoWNgTDl5vfz
         WSQcBJw+QZ3mpEHw05QVLQj/ZKtri3dCjrh0j5rBDK0A/PjKhadN4tg1+q2rQYKC/Bu/
         /4ysZvqPQtOtHOMbBdBOj1CJPlgoHTNyz0kfblnQoSPIMlLoiHRnvqIsu1OqoRDaiPcW
         HOyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745495266; x=1746100066;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Xox/wdPA3KHuKTWKwSgLpPolKz1P+xeFzFYtxAW0a7A=;
        b=ot4sZBEWN2CYXfB/XJQXGjkFMYwGqRbymwE8UmPj7vcMce3peqJSmfwzp5K9nKmVpY
         zXPt6e9cLlypY6vp42tTV2cF6K+rlCWkdbE/omfNqNVowVE5xkyWVzwC7sfQ2tsxiNU0
         0qFQyl6ZrUpz1tzb2Tl8ZQahKFkjuLRvGGrb+ZLkI3/qOAJX+AvUtR21pkmJmMYPTlCB
         eXqs2Pmtr190wwCNfLVTfw5eeyGisIdaGePsyLR8oJOjOzC7KN6Uzvt6wQYkeAuLxSdP
         FSqF5Ob353sOaUBoj0z/8PFs8AMv0wVTntgXYEsewM+vtIm5rEpKpN4ZfmKH/gZWDH7I
         s0NA==
X-Forwarded-Encrypted: i=1; AJvYcCUnUHL996XGII+Vgk0H9wjHkCMuUm0KCJpHhto+UL9322/+CtT7HNe+hV8FNdCMdV12//YCVCV4O2byNZI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxiWCxQUSgrpwQJ6Xqw7GCETcBD1WB0av5VJeF1Eoi9W33o6+c
	9lIGaHluJSffjKmpIUnbYQmB+dcJBnA+7cRkBlBAQI1YWgL2okwszFwuUKroA9QSfJNHPeow3HR
	1iJMbBbogzm2rcw==
X-Google-Smtp-Source: AGHT+IE8GPUl4p+XCHCJtZ/bS3UjEhkOpr3VygdZXDV7mGAhD3Kn6zP169MP+y4/I3uuB1lV+3rs5yW3t7KmcrA=
X-Received: from wmbfp26.prod.google.com ([2002:a05:600c:699a:b0:43d:1c63:a630])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:510e:b0:43c:e6d1:efe7 with SMTP id 5b1f17b1804b1-4409bd830ebmr15355855e9.26.1745495266461;
 Thu, 24 Apr 2025 04:47:46 -0700 (PDT)
Date: Thu, 24 Apr 2025 11:47:44 +0000
In-Reply-To: <CAJ-ks9mg7U0YV805YEY_ViB0i3f_afHcR1xFEe9dhZeQz=rFDQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250422-vec-methods-v3-0-deff5eea568a@google.com>
 <20250422-vec-methods-v3-3-deff5eea568a@google.com> <CAJ-ks9mg7U0YV805YEY_ViB0i3f_afHcR1xFEe9dhZeQz=rFDQ@mail.gmail.com>
Message-ID: <aAok4KhTHb86S26u@google.com>
Subject: Re: [PATCH v3 3/7] rust: alloc: add Vec::push_within_capacity
From: Alice Ryhl <aliceryhl@google.com>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 11:38:28AM -0400, Tamir Duberstein wrote:
> On Tue, Apr 22, 2025 at 5:53=E2=80=AFAM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> >
> > This introduces a new method called `push_within_capacity` for appendin=
g
> > to a vector without attempting to allocate if the capacity is full. Rus=
t
> > Binder will use this in various places to safely push to a vector while
> > holding a spinlock.
> >
> > The implementation is moved to a push_within_capacity_unchecked method.
> > This is preferred over having push() call push_within_capacity()
> > followed by an unwrap_unchecked() for simpler unsafe.
> >
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > +    /// Appends an element to the back of the [`Vec`] instance without=
 reallocating.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// The length must be less than the capacity.
> > +    pub unsafe fn push_within_capacity_unchecked(&mut self, v: T) {
>=20
> Did you intend for this to be pub? The commit message doesn't
> obviously indicate it.

Well, I don't think it hurts.

> >          let spare =3D self.spare_capacity_mut();
> >
> >          // SAFETY: The call to `reserve` was successful so the spare c=
apacity is at least 1.
>=20
> What call to reserve?

I have to update this comment, thanks.

> >          unsafe { spare.get_unchecked_mut(0) }.write(v);
> >
> >          // SAFETY: We just initialised the first spare entry, so it is=
 safe to increase the length
> > -        // by 1. We also know that the new length is <=3D capacity bec=
ause of the previous call to
> > -        // `reserve` above.
> > +        // by 1. We also know that the new length is <=3D capacity bec=
ause the caller guarantees that
> > +        // the length is less than the capacity at the beginning of th=
is function.
> >          unsafe { self.inc_len(1) };
> > -        Ok(())
> >      }

Alice
