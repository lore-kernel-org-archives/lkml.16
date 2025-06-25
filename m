Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC5E170826
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 16:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750867661; cv=none; b=EqNx+nqPncM4ZHIyS9yD8d9kInkJldZHZIs6/UVtia5XaZx0VQThDoxtuPV55IQ78qbPPaYrRLardwIjLzc29fQswrpW1SFWRA8GFL8gseGN+GLM5tptKPxdu4hnRyCNk7E2s7Sdj3FHFL8Qdqjkn/JQqxZiOjxwGKMvIYYEWPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750867661; c=relaxed/simple;
	bh=PmLKnatmcArjaqzkFbJF6iubiesxiEHtv6p0vrH87PU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cyx7y0rkGjS617nwVunAAd0u90AnpPjj8lj/xoU1idSSTiyTjYW7jvxsNsfShNMLZg4iPZdvcaOmL+1vQsMZolWCiiRPKiuuCEbfGU+Ml1xyGPBO2IzGX1mejvHI7xfEFIr4AurJDAJ1KNr2e+jQgj313ReHWPWGmrV3Q2PET58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=l+o3JLEU; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l+o3JLEU"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-47e9fea29easo464741cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750867658; x=1751472458; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B2kSE53PozQNQP+6R+o2GRPmYUVj66J2/LIU6nQDQ3k=;
        b=l+o3JLEUQoOmHPFFARPZm1hTn5iY0YGuBa2KshP4nCLy9AUToOH9dARTwT6kkBanan
         4iJdu6H8Exv/bXotGvYNXNAV7bcO6AijeckcaInSYStYCFbkHCBNaTKk2M3UVcZDaXfT
         36k0y4LxgzNeVyUmYHQQZrevFJ/zTDIBw2W1hITGpYb7U4M15bVyA4aFlWTWN3VzsJRe
         n/sBW98Q0B3llrcKSj2P63rHnAClg3rv+QUv6b8TVO44TJ0tmdzHy1nmu4QO3TsyIUap
         l4bsxdxJQubna77VPV1Tw4QbZihI0eXc1YU4c2TxS/dpGatPa/62uVru0pBTw9SYreBo
         AC4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750867658; x=1751472458;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B2kSE53PozQNQP+6R+o2GRPmYUVj66J2/LIU6nQDQ3k=;
        b=OADq3RS83qqqM+iDLH9kWinCgpZvvOj+C37TM49f5a4SgjUGZ3TaqBExuvKkWKvdlb
         thYLqzRAoNxV0acv6DEKf0z1Iy85LOIVGC+qDuJGRz3932sqIqC1v/1wRuUKbXmyg+mZ
         4+ehgcaTozs/NyRS9ZYqZBe8/373bzmUaiVszYHTmfcdDaEKnHPlSR4bJkfLfRn+q1il
         aeJI3C/IKsNgdXNqWZI2VRdEHhFfoUg2L4bnhNG6D0hSLRPZ9WkV88HOPcd5nuskeC+E
         EHmwGB3kM9ft1ATq4FQzyMfMKkMOkd48OQ1w37nClMa53dJF535spyiPTzyb+qeAmK40
         sNRg==
X-Forwarded-Encrypted: i=1; AJvYcCVFytZAnT2c+2nfA8vBuq/au50b8lTxkm51j4VHC4zY9ujL09qiBryXGUZ2wNeJ4v9YjVdqVZNxg8l8yZk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMqWyq0Bml37pFni6s99bsx9OsTCrEcXpe3X+5vr2HFC9oW7lw
	UAdHJ5hmPHM2Nd2gojkhboARvvIiwiPvVWkNGHpqt/XasSpu803Rv0NoUI7xmVlFpQASOSYCChP
	h2dHY6e29mgtKAHigTnWNOdPL6ddqzBc62KXX/BY9
X-Gm-Gg: ASbGncuRfV9IwWNt0ZPnpVqY8UAlb6u38PSeLmMYpSJr9Bj9lu298lr4DKZ2U4sSVq+
	IIlZDlk/s7O8LP+VjGPfXtvAkstIrSvM47jLxjBg1Sjzv1VF/Blzaxzcks3WdXiQvHkrn/MKcTp
	04tWcYNeMPSTnkpdY+AzYAhPPDEU6RidWAJl0CiGIukQ==
X-Google-Smtp-Source: AGHT+IEKTFo972c6FUomRFX6TTuvtcbQhZlTwD1AoLa3bGcnE2hHiBorQJ20QzhOgsiiVShTDRPJT+ULmhy04NwuUhM=
X-Received: by 2002:a05:622a:8d1c:b0:471:f34d:1d83 with SMTP id
 d75a77b69052e-4a7c70b82bemr2870931cf.7.1750867657865; Wed, 25 Jun 2025
 09:07:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250618125037.53182-1-petr.pavlu@suse.com>
In-Reply-To: <20250618125037.53182-1-petr.pavlu@suse.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 25 Jun 2025 09:07:26 -0700
X-Gm-Features: Ac12FXwWUvrVId3iEH6F7cARj25951BIhaDjfYAOAdNuZpJPAx-cEVSASoHkK9o
Message-ID: <CAJuCfpGeLXn4UGudJZywOJWUECE6oJUm9OyCvQ__SWE4qCLHbA@mail.gmail.com>
Subject: Re: [PATCH v2] codetag: Avoid unused alloc_tags sections/symbols
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Arnd Bergmann <arnd@arndb.de>, Casey Chen <cachen@purestorage.com>, linux-arch@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 5:50=E2=80=AFAM Petr Pavlu <petr.pavlu@suse.com> wr=
ote:
>
> With CONFIG_MEM_ALLOC_PROFILING=3Dn, vmlinux and all modules unnecessaril=
y
> contain the symbols __start_alloc_tags and __stop_alloc_tags, which defin=
e
> an empty range. In the case of modules, the presence of these symbols als=
o
> forces the linker to create an empty .codetag.alloc_tags section.
>
> Update codetag.lds.h to make the data conditional on
> CONFIG_MEM_ALLOC_PROFILING.
>
> Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
> Reviewed-by: Kent Overstreet <kent.overstreet@linux.dev>
> Reviewed-by: Suren Baghdasaryan <surenb@google.com>

Thanks!

Acked-by: Suren Baghdasaryan <surenb@google.com>

> ---
>
> Changes since v1 [1]:
> - Trivially rebased the patch on top of "alloc_tag: remove empty module t=
ag
>   section" [2].
>
> [1] https://lore.kernel.org/all/20250313143002.9118-1-petr.pavlu@suse.com=
/
> [2] https://lore.kernel.org/all/20250610162258.324645-1-cachen@purestorag=
e.com/
>
>  include/asm-generic/codetag.lds.h | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/include/asm-generic/codetag.lds.h b/include/asm-generic/code=
tag.lds.h
> index a45fe3d141a1..a14f4bdafdda 100644
> --- a/include/asm-generic/codetag.lds.h
> +++ b/include/asm-generic/codetag.lds.h
> @@ -2,6 +2,12 @@
>  #ifndef __ASM_GENERIC_CODETAG_LDS_H
>  #define __ASM_GENERIC_CODETAG_LDS_H
>
> +#ifdef CONFIG_MEM_ALLOC_PROFILING
> +#define IF_MEM_ALLOC_PROFILING(...) __VA_ARGS__
> +#else
> +#define IF_MEM_ALLOC_PROFILING(...)
> +#endif
> +
>  #define SECTION_WITH_BOUNDARIES(_name) \
>         . =3D ALIGN(8);                   \
>         __start_##_name =3D .;            \
> @@ -9,7 +15,7 @@
>         __stop_##_name =3D .;
>
>  #define CODETAG_SECTIONS()             \
> -       SECTION_WITH_BOUNDARIES(alloc_tags)
> +       IF_MEM_ALLOC_PROFILING(SECTION_WITH_BOUNDARIES(alloc_tags))
>
>  #define MOD_SEPARATE_CODETAG_SECTION(_name)    \
>         .codetag.##_name : {                    \
> @@ -22,6 +28,6 @@
>   * unload them individually once unused.
>   */
>  #define MOD_SEPARATE_CODETAG_SECTIONS()                \
> -       MOD_SEPARATE_CODETAG_SECTION(alloc_tags)
> +       IF_MEM_ALLOC_PROFILING(MOD_SEPARATE_CODETAG_SECTION(alloc_tags))
>
>  #endif /* __ASM_GENERIC_CODETAG_LDS_H */
>
> base-commit: 52da431bf03b5506203bca27fe14a97895c80faf
> prerequisite-patch-id: acb6e2f6708cd75488806308bfecf682b2367dc9
> --
> 2.49.0
>
