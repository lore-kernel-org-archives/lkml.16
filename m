Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57D125A2D9
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 10:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747821774; cv=none; b=OkNt3BKjtokX92aD8/J28WfvSRTFdwIFtCt2DTctQ18OXzFXO5W5SEFi7HsfGOWeLUed8PVNzoiS/lL6aEI/tUdfI2x1wjDpEKzr27FDTErPOylIDZk+29SepVr+Xya4dL02z51fXc24+O01iZjgZeaqel5BLahNuR9/Vvg6y5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747821774; c=relaxed/simple;
	bh=hGVCzMZOE97pm/+7xdNe3qSpEf0+u5dNQxNicc26ENo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IYqCaXcrt5DQjBxyfr6oMIUXjlgf1zUNfGl3Ob6OEWPLR8WmQhtCko+17axWFTi3gecnTMBHAI+CHASUcX3y9RtwROBge5xVh7w1TNRcegv9NrTT///Rg05I5Qo7SRtFS/Jml0T9NjNzG1/G0k6PLgLqULTeBT3OgNEiCIWiqgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GY4SR1Zy; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GY4SR1Zy"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6f0c30a1ca3so65486026d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 03:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747821771; x=1748426571; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hGVCzMZOE97pm/+7xdNe3qSpEf0+u5dNQxNicc26ENo=;
        b=GY4SR1Zym8jWawgdz/Zh3Zty9cOr63LjffdNBMwajWn2u30g0cvg0lZOPdRDI63Xf0
         A5tDEFYcgZG/aGhkyAY9w/UKoeocOuoxZuupms18NbCCNpDv+Ad1Myy9fMTJ5kXzt1FV
         5oXfWRrbVB8xU1OG09IbgNDu0oQyqZou56GUJLhjOpjhrCo2viFGDRxj3WNNt+hntbM3
         GdR/Va/qE/f0/IBUKS2s8U+/fxINs1vbun3OkaqwpUgP5NA0GHBh1RVo3lSVjW52Ru2P
         M30OmLOq2dRiEvNYK8HPcFckoOoSJYuULKtGgQ9SKbTyzUbCMLllGoY8WO7q13pSqLpm
         dPNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747821771; x=1748426571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hGVCzMZOE97pm/+7xdNe3qSpEf0+u5dNQxNicc26ENo=;
        b=NKUDnzdRr2zEe8QbOK5EJSw9V2zZR5AvsDeDvD6IzFbkq4ofs12bso4Bz3xNPaHkSm
         xKbAFAQrJbi/yc8wRgI5r1aJvYBD/CLKIkE2u8ugjYBiTvl0oT1AWeRDnF/JntnEeZer
         8bxd/eRe5e6BdRqHL0kpaL46dq1TMotANit+RiKf4Vosxtv7Z9vxEzeWGMLC74QkaxmS
         yam5plXa+i8GpkUY0rERenC+sjiEnG80AaTDxIWK12brOUE8Cicy2Stb6YXNKyPF3oVz
         fo2RNIKB8AlQ7pD1s8XtGUCgjfd/QboNg/0OY/xGWePYVCw9+zYG6sMpq6YqDucchJwJ
         ygsw==
X-Forwarded-Encrypted: i=1; AJvYcCUVKZTs10u4KiOlpQ4hrQ29Cl62VzX/1adGmpHb3MScSQDQt2lruQm40yXEEN4uSFRnMyxjizEqx8CIzRU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDi/zrC8Z8vDmC9QPcP+taiGXhX/plnP8DzkM0mhP8FFIhhbZM
	PLUp4dp5aTlHpNY7Raml1yY0SewRDh6DXhGVALERIfhSmk6hgruTb9ncWqcwtsKwbFFySuE/XcP
	9ffjFoXsyrLBcwzNbDrQzA7cbx9Gsp47punL+j/oe
X-Gm-Gg: ASbGnctfjrMsG2wPXPpvi05q5otUSFEOEthDgfj5hsh6v0TVvdoMMP4YxWHAORIm7Kt
	pI4XN1AyleQAI/Qu8lxPtNZD5YlQm0QCoAMzPUZqLAhDDQwV17RkNPmIfemmm76ZjlJSO9kVPBg
	icLVzvVX9ox9/Fv0Efd85rXcWq16VqoFErXjWN2HrnIQ1KvJ/adCNRh1LN9dagT4G29QunN//N
X-Google-Smtp-Source: AGHT+IEm4BKFb5X1q0agtW63FdYJCI40qvC1DEbS34ledOoHRbdXdLG/0r4eGJo+uqR/WgsmzZYCGMgXB6A4yApRqfk=
X-Received: by 2002:a05:6214:40b:b0:6df:97a3:5e5a with SMTP id
 6a1803df08f44-6f8b08ceb3amr357793746d6.28.1747821770566; Wed, 21 May 2025
 03:02:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507133043.61905-1-lukas.bulwahn@redhat.com>
 <20250508164425.GD834338@ax162> <CACT4Y+a=FLk--rrN0TQiKcQ+NjND_vnSRnwrrg1XzAYaUmKxhw@mail.gmail.com>
In-Reply-To: <CACT4Y+a=FLk--rrN0TQiKcQ+NjND_vnSRnwrrg1XzAYaUmKxhw@mail.gmail.com>
From: Alexander Potapenko <glider@google.com>
Date: Wed, 21 May 2025 12:02:14 +0200
X-Gm-Features: AX0GCFubuxvb81f_x5em7Iy6MU7avDIHjdMdNZqeGYpj71-tqlOCNdY-AOhiHCU
Message-ID: <CAG_fn=XTLcqa8jBTQONNDEWFMJaMTKYO+rxjoWMHESWaYVYbgA@mail.gmail.com>
Subject: Re: [PATCH] Makefile.kcov: apply needed compiler option
 unconditionally in CFLAGS_KCOV
To: Linux Memory Management List <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Lukas Bulwahn <lbulwahn@redhat.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org, 
	kasan-dev@googlegroups.com, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@redhat.com>, 
	Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 4:57=E2=80=AFPM 'Dmitry Vyukov' via kasan-dev
<kasan-dev@googlegroups.com> wrote:
>
> On Thu, 8 May 2025 at 18:44, Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > On Wed, May 07, 2025 at 03:30:43PM +0200, Lukas Bulwahn wrote:
> > > From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> > >
> > > Commit 852faf805539 ("gcc-plugins: remove SANCOV gcc plugin") removes=
 the
> > > config CC_HAS_SANCOV_TRACE_PC, as all supported compilers include the
> > > compiler option '-fsanitize-coverage=3Dtrace-pc' by now.
> > >
> > > The commit however misses the important use of this config option in
> > > Makefile.kcov to add '-fsanitize-coverage=3Dtrace-pc' to CFLAGS_KCOV.
> > > Include the compiler option '-fsanitize-coverage=3Dtrace-pc' uncondit=
ionally
> > > to CFLAGS_KCOV, as all compilers provide that option now.
> > >
> > > Fixes: 852faf805539 ("gcc-plugins: remove SANCOV gcc plugin")
> > > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> >
> > Good catch.
> >
> > Reviewed-by: Nathan Chancellor <nathan@kernel.org>
>
> Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
>
> Thanks for fixing this!

@akpm, could you please take this patch at your convenience?
