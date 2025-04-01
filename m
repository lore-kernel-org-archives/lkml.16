Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CF021CC5A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 20:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743540578; cv=none; b=NU8xBpVqNvUC+9c8uBpWWi1++HGiVqR7cIrDMNaFVRIDQBoVrh9sGV7MZEjUFKjDfQlLSIL823vSkHedFLFm0Y/6KY1XoxfJNdGGqp5d6MleigAe1mERWJaDv7yUGiqfpyV6k2UQxtJAueYfcrPNgBKDYVVKS3UxjaVnjpzofFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743540578; c=relaxed/simple;
	bh=ITra87Ge9ziCxxV74nFM46xlitQdobzeOagu5+uaS08=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DLtgjGnBNsyxh/y3uoDoNEHcMFEsPXLMKadZdgFmh2oX9glUyqgIFY8XSptz1GVrruDSQsA5Io0qqcvO0nPhYweywBiypHx0SGj6dAASqym7n0i/2qfFWyiVg0wMnnqf3H0MyRiKjHty3AFPOAllHqPIwcmkV1rUP17+kXDzDCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FUQp5Svh; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FUQp5Svh"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5eb92df4fcbso10902510a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 13:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743540575; x=1744145375; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fL6MSoj0M6+FX80QOKYrjbi4QGh9WEvNHDtTjbu3pdM=;
        b=FUQp5SvhhCZT348Kp2fpayS9197wSHsXstkqfZdsYgKUuUBycmpZpqcskFC1WzzeOy
         oI+fw9OLXE8Ovk84QlPFZk4UGi0KpDzQvtZMXGMOeNXCVOXxusgY6gd90vejG7kNf7ZR
         j3yOlia4hllySqEfJ3ku3p7j3Jg6Tm1mHhz7+Naz8mXDBUnT7fXA13WlrnwDjnSMTyuf
         JhCsdcA8zPW1kSkiZmzK2/j3lYvxja5gT9uhZhMDJ+O4yCsuTMLznkuxIfLK6nzo8ueA
         qB3FMOd6AFLH/d3RgA71NCaSxCDzYu3EC15OCQYpbssz9cUnzmYE05H1o9EwgPl1leMO
         MKTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743540575; x=1744145375;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fL6MSoj0M6+FX80QOKYrjbi4QGh9WEvNHDtTjbu3pdM=;
        b=qPQKkov/jHHDo29DkibvCgKRH+UMWIgie7gqNa48At9fN2jEplQgcmbCmzDnvOkPMj
         NGZ2UFMSq+DvzRrqyFqiytjN9vdDsrNjTFS7P3JH5bLFsQr2f3/gjeJkK4pyGMFQcYzl
         MqyvHuNDzaabKt64XzxQUocLLIBbmMi4VnOMrBCSfLaehRXGPc7DwIElPbNfI1s1rgWi
         iE3WclLFqsJfFgxEDAgbND/Jzh7KtOx1CBx3PA5oz5LAkeko1RUOY9QhQ0cxr436MCp/
         +cJN/zkLVrr42stXScDIqm9HVEnKG6b7StDgPJhTREwN49kkGt+H5gO+ii2LkA9cCU9f
         ZE3w==
X-Forwarded-Encrypted: i=1; AJvYcCX1HgXlwu3WqsczXVlvcTz+hvOPsAA5pC995wayR2NGoYdvYMDw12q4HlwHyXlv/gHPhqs6PZbY9CaSgck=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3Xu9eY13K5cuz/X1vEqNmFEVTmdlmiNVIb2iuOU0ecj67RYyP
	nfEI2mMInjAkrjOadiAI+0V6uqUJClrSCFH5pZineR6wmy5+3qd6qWjv4LNTad/uoX/KQtMX4ij
	OHdR+CRePEeEzpQjsrq9Jv0eaFMs=
X-Gm-Gg: ASbGncvX5AegrsOte/5sT3TjW5gxEridc5IGd5AKk1E4NsVkGcHUcw+0eeBuvARPu5n
	9cjxcFYzomtWm6nrdM2BF4gAZAaBNDkRyVCPFxxSmZmYtHIIYZtSxt6CBrDet09rwxYBcfQZv2a
	TcPgnP/hObFHwZ4K878xXeq/YO
X-Google-Smtp-Source: AGHT+IHmUa2f0QCGqqrQGpdkpSWFSg5udVc8VFWhDOR5cXCQDfc+BCb+Cm+G6bspYrNcR2ilrg+6fDTpwJTgts9svCk=
X-Received: by 2002:a05:6402:24a4:b0:5e7:8501:8c86 with SMTP id
 4fb4d7f45d1cf-5edfd6fdbdemr14425520a12.22.1743540574438; Tue, 01 Apr 2025
 13:49:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401203029.1132135-1-mjguzik@gmail.com> <Z-xOFuT9Sl6VuFYi@gmail.com>
 <Z-xQAyPxQGvlg_hd@gmail.com>
In-Reply-To: <Z-xQAyPxQGvlg_hd@gmail.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Tue, 1 Apr 2025 22:49:22 +0200
X-Gm-Features: AQ5f1JqSWVP-N0mFS3HCYuY_PUU7q_jKGVaGjK7Snj6t0sI9ai6dGk4sHuSl6k4
Message-ID: <CAGudoHESK=sPyYLjqubjfAy-Un18EML8HX45EgfL+UhiqU8bHA@mail.gmail.com>
Subject: Re: [PATCH] x86: predict __access_ok() returning true
To: Ingo Molnar <mingo@kernel.org>
Cc: mingo@redhat.com, x86@kernel.org, linux-kernel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, 
	Uros Bizjak <ubizjak@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 1, 2025 at 10:43=E2=80=AFPM Ingo Molnar <mingo@kernel.org> wrot=
e:
>
>
> * Ingo Molnar <mingo@kernel.org> wrote:
>
> > It's also the right place to have the hint: that user addresses are
> > valid is the common case we optimize for.
> >
> > Thanks,
> >
> >       Ingo
> >
> >  arch/x86/include/asm/uaccess_64.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/x86/include/asm/uaccess_64.h b/arch/x86/include/asm/u=
access_64.h
> > index c52f0133425b..4c13883371aa 100644
> > --- a/arch/x86/include/asm/uaccess_64.h
> > +++ b/arch/x86/include/asm/uaccess_64.h
> > @@ -54,7 +54,7 @@ static inline unsigned long __untagged_addr_remote(st=
ruct mm_struct *mm,
> >  #endif
> >
> >  #define valid_user_address(x) \
> > -     ((__force unsigned long)(x) <=3D runtime_const_ptr(USER_PTR_MAX))
> > +     likely((__force unsigned long)(x) <=3D runtime_const_ptr(USER_PTR=
_MAX))
>
> Should we go this way, this is the safe macro variant:
>
>    #define valid_user_address(x) \
>         (likely((__force unsigned long)(x) <=3D runtime_const_ptr(USER_PT=
R_MAX)))
>

Note the are 2 tests and the other one does not get covered by *this* likel=
y:
valid_user_address(sum) && sum >=3D (__force unsigned long)ptr;

as in sum >=3D ptr is left be.

However, I confirmed that with your patch the issue also goes away so
I guess it is fine.

I think it would be the safest to likely within valid_user_address()
like in your patch, and likely on the entire expression like in mine.

That said, there will be no hard feelz if you just commit your patch
and drop mine.

> But this compiler bug sounds weird ...
>

It is very weird.

A person running a different distro with a 6.13 kernel and new gcc
confirmed they have the same bad asm, so this is not just something
screwy in my setup.

--=20
Mateusz Guzik <mjguzik gmail.com>
