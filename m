Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE192367B6
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 12:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744375700; cv=none; b=X/ipksZydRZLmEPs+Xnyn/Fc/20sBvpFx7GwTWLtr90es31jUak1SHJ/HITDgN5ySjbdBQTmSE2jcaqA2v6fWCTWC4ZFY2NW2sSdsSfaaQXSSULZOF/NZ3w0zSaurDCZNPe82hTZbwOyEobwpX+pNcA7iVD5pwZS1xwycQLesmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744375700; c=relaxed/simple;
	bh=iIXhUTuTMVRtBV6akmIRKiVFuAsKIeKfSEx1kF6Jb8I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tMxbehNzlg36GBqBGPPBRJ+mC1mZYQbRM3vRDFuS62qVbZmoOO5ubZSiiQjl5CDhS9hlVIQ6lPwwNRfSFfJzG678K9PE9sXHtTLvVGNmHDwplW7F0c0cgeGG1tyxabi6689qymr6FQ0pJGHhZzSWH7BDwKzgoMU4pNv2WwZMXoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hn/r5F90; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hn/r5F90"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e5e1a38c1aso2399502a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744375697; x=1744980497; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/uUhACwZlOE2GToixSeEf4eAlE3fOBpPw4pGGk5hedw=;
        b=hn/r5F90GZMWmEtWsK9eJJ9u2jwdS0fr9shaPXHIwXS/XlZhl++5XQBY15nuF498Mi
         R3XV+ce0lW41shNchYQDsbinkQyx7p/4MO4jcfWbdQWA2h/Nssnn8q9u+FWpmgd/5+dd
         tUlrYdmpa4KD+DUXlvmjn9mlqc2SJIAEtQbWUwcFBGQSADhAQr5jmtVDSWBGmKlSNNg2
         bRz1OLlkN1TmG2qCpcY1OXa/WIiJnMEjlkmpWcybp/nkMyUg7oz0AcIuCTnnFdmMGigF
         tN5TXx18zw0Ob3vZdnzSfhqCsngrHOcjf7U08JBHQGlPat0hONQj9G0t0FePZ6sMrQyb
         EltA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744375697; x=1744980497;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/uUhACwZlOE2GToixSeEf4eAlE3fOBpPw4pGGk5hedw=;
        b=TQpYxLScjbEX530W7BBiCJP20K7k2oKMFH+RLqHO6pA41Tbsy/ZaH45rG4cTLeoza9
         EbCz+sxriuaLotZha5jBpKFhp1tXB0XvRHEd29Q1lRGQfQ/W2WxDhVywVRN7nqI1AKEP
         SHnfCsRZVVwAv0E/GPvWXCFox0xuTO+283+ESTVyf7yUdb8BENAarKu+/RxJAkvKhr3x
         xFPv7kzeRZ4SW7DCnFFBPOAZ295QEdQQrCOJizxaqPw/LiSCjiyC8DgkDfil+onuHsCo
         QFzGCzrPUpPXC/7SpwcPIKlxaH5gq7mFqjOxb3X7+MchfFuB6/LVBQZuDFSCICUr4sAQ
         GVig==
X-Forwarded-Encrypted: i=1; AJvYcCW+zcH4FpwGAY6pbKgJwF19JAz7nCoSjnPRlfGA7OYePlEV/gKPm8P+qTFeMurdzV1eqkdPg89xem5VyCE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhMRDW9Of7gN0eARmi/ox8DNGPkXj0zilbP7PwKMYFv7rrolQs
	hFCkZYBbrcvIvO8EA9mNeML4/B5yqf4slVcar5rsVyND0otBydPdu4xvgHF00MasXekzlK7SjjP
	CUIcaL31dW5h5P3KH2ml0cfpdK4k=
X-Gm-Gg: ASbGnctRUTZ23mY4P1Gf9yXChmk3soT7SvBGKFgTigKCzZfRaL1+Riw2qcwBOZnUlfy
	bTVS5jPILR78aFGRgyw9PWmsf5GlBh8Fo3zLzBUOKmYUR3GZAGXV3h4Yd8acyKRisO9Yixf0EZd
	602krd6PhOjdYWjnkuHdu9og==
X-Google-Smtp-Source: AGHT+IENqg2TMgVvXnFD8HPwGEygChGNKLbwW1vPhSEy0Hge9XMVbW5fpxQYCipcWET9fpnnP8CwQ0J5aummKNhaga8=
X-Received: by 2002:a17:907:6ea4:b0:abf:7636:3cab with SMTP id
 a640c23a62f3a-acad34c6e2cmr210546066b.29.1744375696469; Fri, 11 Apr 2025
 05:48:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z/bA4tMF5uKLe55p@ubuntu> <CAHp75Vd0PUFv_tigmKp7MEiOOuHpFhB_i8u42jZdQ1jajjq0rw@mail.gmail.com>
 <b4904b21-0a41-43f6-b386-dea4e27c7a27@stanley.mountain>
In-Reply-To: <b4904b21-0a41-43f6-b386-dea4e27c7a27@stanley.mountain>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 11 Apr 2025 15:47:40 +0300
X-Gm-Features: ATxdqUF-_H-8QqtApbiHgqOdbAIohEab_xD36YpEQTHp3CadLWW5d2dKWwCOkD4
Message-ID: <CAHp75VehJd4FUXBJSJh35a6KF3Qr2eBG6PiNogZ1m9SzBph0Ow@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: Replace `& 0xfff` with `% 4096u`
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>, outreachy@lists.linux.dev, 
	julia.lawall@inria.fr, gregkh@linuxfoundation.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	david.laight.linux@gmail.com, andy@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2025 at 1:37=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
> On Thu, Apr 10, 2025 at 08:43:53PM +0300, Andy Shevchenko wrote:
> >
> > > $ make drivers/staging/rtl8723bs/core/rtw_xmit.o
> > > $ cmp rtw_xmit_before.o rtw_xmit_after.o
> >
> > cmp is good but not good enough in general. Here it shows the 1:1
> > binary, but in some cases code can be the same, while binaries are
> > different. To make sure the code is the same use the bloat-o-meter
> > tool instead.
>
> I don't understand what you're saying at all.  cmp shows that the compile=
r
> was automaticall tanslating the "& 0xfff" into "% 04096u" so the resultin=
g
> object files are exactly the same.

There is a possibility that the compiler changes the code to the
equivalent and cmp will break, bloat-o-meter will check at least what
happened to the size of the *code*. object file is not only a code. It
may also contain debug symbols and other stuff which may break cmp,
while the code can be *the same*.

> ./scripts/bloat-o-meter just looks at the sizes so it's less useful in
> this case.



--=20
With Best Regards,
Andy Shevchenko
