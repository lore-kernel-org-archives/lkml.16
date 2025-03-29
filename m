Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325CF339A1
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 14:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743257401; cv=none; b=egpq9S8b5d1THx9FeJC+BQVJHZX0aNlZ+7fSXGL2pfhD9GgRRPK8w43UtXEE9O0VTIf3ERGp4JJs1TlKr4wRs1Q2E9qcSgn0SaF0/uNSpUGRFpKN8UaG5OI/hujguDXIkUB1RQ7FG3xKuN6N+GRM+QkQ38SMc3mXV8nvs8/fxGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743257401; c=relaxed/simple;
	bh=8DNXuriryviUYkCuwI114J6F32sIvMmR3rYQl7tnHHA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cyiMUsfAjYX6eAxiqWD1SOC9UnnmZ1H7KQQB72Ez8+yaTz/sEPqNPU+ingLEtzYmjMlvx0wmFrtgk3heoEKMfqSzkOFtipEgIgsxci9teqDz5GVoZjoKa8AV666gcXLHaYRRgZvlZiHFmcbypRsjqTHt9Y0wtM6deUeHKJKedz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mJZKY/kj; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mJZKY/kj"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7c56a3def84so323900685a.0
        for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 07:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743257398; x=1743862198; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cLupDByQlOIZkjLN6KvumJEoZRkf2lxrlQMOafN8FXA=;
        b=mJZKY/kjATAFfeSeX3IlH1P18s1I758hUsUjPe4xrHpbyHVDyKU0vhCVWDWdQ/nG+9
         lzbf9Bdzp/Fr7BC/qIDu1jOGXQD4guEqeWJqJZxGBNMQ7cy5ImOpvQbFQ5p+dqWa3FBZ
         zG5WuZloNwvW+vlLqj4oKSjOqol0H6b2NIkkDvZRmy/kMdhT9vzgcu9ZksmuIT4HUbcA
         2eJ+hbzd0lqUgj8Uu47VNmyNDPn8glKiQ7nu5xCfiO5N0eHUnGYaEqSl8MkPoeP58JBY
         poI995I1Ta5/78Bc416NQaPmAwfY6dOnxg820+hjux8+Ayt/L3kKjWT3mJXeZUmRhPiH
         LrEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743257398; x=1743862198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cLupDByQlOIZkjLN6KvumJEoZRkf2lxrlQMOafN8FXA=;
        b=aDenbSt7nIw/pK8jd+yfRX+hzCcvtMsNHRuOxd0aeuPw8C4+bRY4hNDGFWJl+rhIor
         OXfrIymnz0SJoWvPL4eOX9/x0XDZ1kOWw3rMlUjdn6aL1d3+xaEwZEPLhOoD9rwrpxPq
         Q17hGe0px3yLzk8bwQfbNmhv5TmjbRvZcSrksHMdSQrK7kDKFxGJqSy1asx05QpRf0Jz
         +Ty4PizYQP7JJnmudIIQUjxwfhwdG0+Ub4hzc1M1F1fOumBNjZiNEnb8IK7G4cqEFuJV
         AauW5RqwEQ9J35F39tZriYPYYbvfJoTrcE/aKmIDg21cJE1X8CFO2hgoV7qgJjxYeban
         4qkg==
X-Forwarded-Encrypted: i=1; AJvYcCU4rt99+/4+uzERC4I0dX6e6ybARromEshh0jiuyIGlKATtg1SogHrQgLnU0AtEhiEwnI+hybiCaHAiEhw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqqfhTP9IydIgy1JwUvoYH1zPam21FKi8q4C7hS272yNoQYhEx
	BhgfvDjb1EO6x4+0KGKtKBm2kDh8UiRw4VwgvVJE9kl/DoZlhIFwx66FsN60Xs/mpRUa/CaS0/q
	lP2lL4gOhD68YiYa2z9V9ivhoxeo=
X-Gm-Gg: ASbGnctEXvyydB16l/GHdQIwCsYdzj4Tx/35tk0tEeZHsNehfZSUgZO4BeZ0AGqNmd0
	dYAx0kElXfAAPVEvE5JPe8O6eKFeQXTwhkxzi1BLC0hVLY1YtbcnDUTk0Deab2hGSETn94bNg7b
	OPjOX0A8D9PzR1UL0JKmiJJLmaynOmh2jIpc37tNM=
X-Google-Smtp-Source: AGHT+IHiBV1iV4PKMC1ZMhEAyiFTBS7TU37wn1t1Fvc53PoREVRcm+1339Zxp6rKgDE1U0dx2ZKUSAa/QKA8UXFNFWY=
X-Received: by 2002:a05:620a:4384:b0:7c5:5d4b:e635 with SMTP id
 af79cd13be357-7c69087dcfamr463442985a.40.1743257397863; Sat, 29 Mar 2025
 07:09:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z+fTJRBOZ+66zmsh@HP-650> <alpine.DEB.2.22.394.2503291210090.58211@hadrien>
In-Reply-To: <alpine.DEB.2.22.394.2503291210090.58211@hadrien>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Sat, 29 Mar 2025 15:09:49 +0100
X-Gm-Features: AQ5f1Jpm4caITwijzgimQ8EsoiZ5v867wameF7gf2V278j-wvdcs0k14LhfU3KU
Message-ID: <CADYq+fYizY_eRozZkKYzsD00biQMTGfhOcuqiQ0RzXApXiAF6A@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary type encoding in
 variable names
To: Julia Lawall <julia.lawall@inria.fr>
Cc: outreachy@lists.linux.dev, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 29, 2025 at 12:13=E2=80=AFPM Julia Lawall <julia.lawall@inria.f=
r> wrote:
>
>
>
> On Sat, 29 Mar 2025, Abraham Samuel Adekunle wrote:
>
> > type encoding in variable names are not a standard in Linux kernel codi=
ng
> > style.
> >
> > Remove redundant type prefixes (e.g, `b`, `p`) in variable names,
> > as explicit type encoding is not necessary in Linux kernel code which
> > uses type definitions rather than variable name prefixes
>
> You seem to have also gotten rid of capitalization.

Hello Julia, thank you for your review
Yes, I should have added that to my commit message. Thank you.

> It's also not clear how you have chosen which variables to update.  Mostl=
y
> it seems to be pDM_Odm, but there is also pRFCalibrateInfo in some
> comments.  But you haven't updated eg bMaskDWord.

I chose to update the boolean and pointer variables which have been
declared in the source files
I was working on. pDM_Odm, declared in the source file, is a pointer
of type struct dm_odm_t,
which has been declared in a header file, so altering the pointer name
would have no compiler errors since
it is declared in the source file I modified.
Some function prototypes have been declared in header files, so
altering their names in their definition in the files
I was editing would result in compiler errors too if the headers were
not modified.
I could have modified the variables in those header files too in
drivers/staging/rtl8723bs/include
but I was not sure how many files would be affected by the change and
how long my patch would be,
considering the three files I modified already made my patch over 3000
lines long.

RFCalibrateInfo(without the p) is a pointer that is a member of the
struct dm_odm_t, which has been
declared in the header file, so altering that in the source file would
result in compiler errors too, since the header file
 was not modified in drivers/staging/rtl8723bs/include/
>
> I don't know what the r represents in rOFDM0_XATxIQImbalance.

The bMaskWord is a macro defined in the
drivers/staging/rtl8723bs/include/Hal8192CPhyReg.h
as `#define bMaskDWord 0xffffffff and also rOFDM0_XATxIQImbalance is a
macro defined as
`#define rOFDM0_XATxIQImbalance 0xc80` in the header file; these two
values are not boolean values and are
also declared in the header, so altering them in the source files will
result in compiler errors

However, other Boolean variables declared in the source files were modified=
.

>
> julia
>
> >

> >
> > -     struct odm_rf_cal_t *pRFCalibrateInfo =3D &pDM_Odm->RFCalibrateIn=
fo;
> > +     struct odm_rf_cal_t *rf_calibrate_info =3D &dm_odm->RFCalibrateIn=
fo;

Example of RFCalibrateInfo (with the p ) being declared as a pointer
of type struct odm_rf_cal_t
and also a member of the struct dm_odm_t

So the declared variable(with the p) was modified, but the
member(without the p) was not modified.
With these, please what suggestions do you have?
Thanks

Adekunle
