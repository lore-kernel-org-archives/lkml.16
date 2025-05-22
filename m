Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9459817A2E1
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 08:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747901947; cv=none; b=pFY7DTwJOUIcpei7rw3CuROt6sSJnmJ2jhVc3xyKxUnosP8c3KcCyRuDtkbzz9i6XcfHHNEEbgMZRJMjEL/OwVnjTAc3abhcM8utP6R4dNMDnvfyhG6qE3uUQfS2UcagBOs9PyzLQzgGsOD24NRy9NlL3mBRiMolrjkc2agiJqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747901947; c=relaxed/simple;
	bh=oJTN6hV71jQUNgSy1LNPLAIveMnFUYRGpDK+06PX/VA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lkgJLIdGUsdYp2F1OCChd51DjFm4xGRaEar6Keq34ez2sX47PdCReb6vKb3kybm3hj5qiQBDd6lQxjHsQ9Jjg+/xLPsjLlkrP8SLg5rM6g9EihYbZZ5ayCCXZqDAS1tboE19i2Dlwk3FQfl0pDQIX3PmNBs5sTi3H+BjbOvyGLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oSIzVgg/; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oSIzVgg/"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6f8b9c72045so80931086d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 01:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747901944; x=1748506744; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oJTN6hV71jQUNgSy1LNPLAIveMnFUYRGpDK+06PX/VA=;
        b=oSIzVgg/OAQc77oUvdk8kfvShMVQEcK+MCm7W3W4aSaYk3Jhvzbx7jxEUBHVy9/bkL
         G16juiM/mexl75JYymtdq346MA7Up0t21Pn4M4Pfzz7p3HIA8QQfoOuWDFluZQrxByMV
         wQtL4AZLn5jcqsWV8MrgaLVkBC2b/P6wKE0iAtMr39dOmymTdlCRIBn6NR1YxfvV2Fx6
         LwY+0VlUnmCF8G3eFhlDYZGfF9EIEqe8s5NMc345F6jcJZLYadbwZMTA7BqUZNrCdAVB
         YVazQb2/0wS0lFx8pBcBH4/ILuFqucMhk3Ng5GaVyCLUonsolX7iGB/mgH4vMaQeXzcB
         JHmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747901944; x=1748506744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oJTN6hV71jQUNgSy1LNPLAIveMnFUYRGpDK+06PX/VA=;
        b=RztHppwNJAH1TDN6Vfs50ZRmv+OpIZ2UTN4F6TmPi/lTQlbbKSixreq7kZEPLOTL2A
         rIGWeIzwFjTyOJaxTFMRxNEV0InTW4XRkV+RMktarWziKZOCkdcpoEwK+jRDMXN1PhEO
         MZFKIC8UQ5wWB21J968a552wY1FddJiVZ0U3vY3Yh8mAfrSPmI5gLUX4Y4Hqj7n8+R5a
         iOWRB1ThACgFnE4nm9upESj5Xlt/TjOTRrq0BWY+6iY3vskMrNgO7so/gQrxFkFJBkK3
         Nq0pENXKJt456C9rvAeEI6t5sxVeuPS+4coAHMr8kEE3X1G3oz159lfFXdoedtwv6XmP
         yrBA==
X-Forwarded-Encrypted: i=1; AJvYcCUzAL7U75aZM/Sa2dUuinAmN7IrCHHT4cngCbJ449ma0H9iCVmXYAQCzo/TaDZfusovoXYWcS4ULlf2V5M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCpdrH8OGKmoJu/vC/cktnGv35YwK0tjdWIiLjshcCVSU+/rWt
	RoPKEtcxDO+yKN58sakQ2gJFu7g4IQDN9oFVjfwdWCKRa3wt9UTWuiZKJ+EEMh7oMIft9pHZTwZ
	yAQNMRNeCT/KWt5UABeOh/LMU2syhhXw2NjaDmWUH
X-Gm-Gg: ASbGncvpoGtXfuHHazmQjaMhs4nN4CNmlQSmoFoNEoauGnfSvBGaLhaFwAgDlkAB6nf
	E6vqtnH11sGIg75DuKTD5RxBaW53b2Sw2UGd0gfZqlzIllB1O7eHSKbSzSGUHBL4np+0NHt2+kC
	GNXSCV9qvQZVYSiPt5xMzTuf3EUjIADD/0enuXX9TDEowm86IFCDCt8ubwUsMniVkzY5zPkZ2uE
	w==
X-Google-Smtp-Source: AGHT+IHQHS5Z4OfCDsSLJETYOT+4adkEmE5LR6YcwjJSerg+rRFXldUX9SiNeZoXTpvEKIrHUxfsfRBmdUdLiYq7J2c=
X-Received: by 2002:ad4:5f8e:0:b0:6f0:e2d4:5936 with SMTP id
 6a1803df08f44-6f8b0881a22mr402532476d6.22.1747901944252; Thu, 22 May 2025
 01:19:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507133043.61905-1-lukas.bulwahn@redhat.com>
 <20250508164425.GD834338@ax162> <CACT4Y+a=FLk--rrN0TQiKcQ+NjND_vnSRnwrrg1XzAYaUmKxhw@mail.gmail.com>
 <CAG_fn=XTLcqa8jBTQONNDEWFMJaMTKYO+rxjoWMHESWaYVYbgA@mail.gmail.com> <61db74cd-2d6c-4880-8e80-12baa338a727@app.fastmail.com>
In-Reply-To: <61db74cd-2d6c-4880-8e80-12baa338a727@app.fastmail.com>
From: Alexander Potapenko <glider@google.com>
Date: Thu, 22 May 2025 10:18:27 +0200
X-Gm-Features: AX0GCFuwLEa7GMNWl3kzXafes8eikGOYdLyOEbupah07l52RPChxZx4Uvrgxo3o
Message-ID: <CAG_fn=XZ4CrMfPEr8hgsFfkuftRAKp3xLjAUqSjwmn5Q98c27A@mail.gmail.com>
Subject: Re: [PATCH] Makefile.kcov: apply needed compiler option
 unconditionally in CFLAGS_KCOV
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linux Memory Management List <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Nathan Chancellor <nathan@kernel.org>, Lukas Bulwahn <lbulwahn@redhat.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Andrey Konovalov <andreyknvl@gmail.com>, linux-kbuild@vger.kernel.org, 
	kasan-dev@googlegroups.com, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@redhat.com>, 
	Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 4:11=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Wed, May 21, 2025, at 12:02, Alexander Potapenko wrote:
> > On Tue, May 20, 2025 at 4:57=E2=80=AFPM 'Dmitry Vyukov' via kasan-dev
> > <kasan-dev@googlegroups.com> wrote:
> >>
> >> On Thu, 8 May 2025 at 18:44, Nathan Chancellor <nathan@kernel.org> wro=
te:
> >> >
> >> > On Wed, May 07, 2025 at 03:30:43PM +0200, Lukas Bulwahn wrote:
> >> > > From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> >> > >
> >> > > Commit 852faf805539 ("gcc-plugins: remove SANCOV gcc plugin") remo=
ves the
> >> > > config CC_HAS_SANCOV_TRACE_PC, as all supported compilers include =
the
> >> > > compiler option '-fsanitize-coverage=3Dtrace-pc' by now.
> >> > >
> >> > > The commit however misses the important use of this config option =
in
> >> > > Makefile.kcov to add '-fsanitize-coverage=3Dtrace-pc' to CFLAGS_KC=
OV.
> >> > > Include the compiler option '-fsanitize-coverage=3Dtrace-pc' uncon=
ditionally
> >> > > to CFLAGS_KCOV, as all compilers provide that option now.
> >> > >
> >> > > Fixes: 852faf805539 ("gcc-plugins: remove SANCOV gcc plugin")
> >> > > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> >> >
> >> > Good catch.
> >> >
> >> > Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> >>
> >> Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
> >>
> >> Thanks for fixing this!
> >
> > @akpm, could you please take this patch at your convenience?
>
> I have applied it on the asm-generic tree now, as this contains
> the original broken commit. Sorry for missing it earlier.

Thanks!
