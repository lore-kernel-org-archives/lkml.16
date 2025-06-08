Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DB6EEAA
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 09:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749375392; cv=none; b=lAyT/C1hs1GkyU04J5rXd8knDAd2pviPPgJDADmBfRlW/5yD9xcI3glfM/kTu4C4qqROUK+HlPjllPhazBqckK75LcDmRo3KMyVaSwWfvlIMWBH6t5WGuGLqdif6JRH9cKuYZ52Rp1IssNHOXfsHOqEgDXGxHYZr7ralBz1gAfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749375392; c=relaxed/simple;
	bh=VCLDuzrT1NpTtg6uPad5mV2mHCMOuncqCM44nHvvkz0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cf0md0Wp/xxXOfU3Tbm67NqZH6taBtLqkgGz8TAtDEC1skTl6Et646vdWxHNMDv/zPaMyRxSH8JibcvSUXohVIx0q+ikav6HVW+O1J+dZrelb7Fja40butWhxapDYw2/20NeiCvMpAvfvNM3FzxdUYHXB/UJ1Gf/aKzhaEDxuQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-530d764149eso963214e0c.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 02:36:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749375389; x=1749980189;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nmxOdpkXc8wFRgqF6mDzsfzWIfq2uzHJ8hAPDDQrOa0=;
        b=GiFUVw5DY2EJO2TuGkKiY8zSRkhXPyFT1Ic8Yt7gXym+E0nhMi4amEZkOSsp+/yY1x
         +McaFiqkgVrVX6ms+eMvWt2zQGtwWGNpornCPhPKpNW1DboshLbvXDQoRmNIp/sKkB0o
         vjje+lxW20ixkwZ36bE50v1ak0LjltYEMpIWlpwbN77YXO/5AHsSPFTGRTdnwhe4k84L
         AWSCUwx3liBzAHGTho+QiTh+VKdHQZsAyAQtRKv3gxyWGuzFlTKn3oXKatAzqCevlbS3
         kwvFsAjMZFCccBdVvQcCnu99KN4oYnUy3Dv1Q3EQQfmjJC7ZRdsnoLmxBT8dDOZOEa8a
         NuvQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+ps1A8Au4S38fi6CZKIAR8kc22AmEVdPVvmfqsoPtnGXNTTmOvWw8bk3aQmbz7Y3kjOMqrl75z/3oCiw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz660ZdbJLEXoVVgL9n+dF7a14pcsoDnM9RTItjRZ+FUXxNJ52U
	NSc/S/pPMb+z2cp6In11uOwoZpm8NjQP1HGtAEiUNuMEGsgcnVbcbB+SmGvqF8C4
X-Gm-Gg: ASbGncsUHyniiIzvq7+5SqjJvPZqA+YGmnIxWBuzUF3nbak2oofg/Lkey+319Ii4Pi9
	1xdcfmzjMWUxj+8wSAyPGk2DVt/obIXwHJ5x9SYqj421f+rFoVuysNzpASyIDpv1MehwZZIYRB5
	HqtmAlzO+1G+BhxywaYzUBYCC0IySSPqUrKX1rCy8Jo04vElIavAbV1XK/0eRZxrPL83zhc5Y38
	7kpcqB40AxG05dGLQ1hXhZnD267iHkeA0wT+0kqEjjaS3hvHGDTm4cGh1syygHOE6pTHPacVISn
	AIc9+e+B2OM9KeDijXuT0noq1WaCsJWNextFuBVpwmIqCvCgCgKe0JpL0j9YYXYopVNpZbDJpq8
	94UgHVI+mevRIzQ==
X-Google-Smtp-Source: AGHT+IHrC3C73VfL/Ic3+qXMbGljdLRM46/Hu2h3Xfqt8+6kNruI+6fvQgZB/cfoWhtj1fADELYS7g==
X-Received: by 2002:a05:6122:3188:b0:52a:ee1d:f7fd with SMTP id 71dfb90a1353d-530e48b55c3mr7326642e0c.8.1749375388978;
        Sun, 08 Jun 2025 02:36:28 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-530e62f0c94sm3327345e0c.17.2025.06.08.02.36.28
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Jun 2025 02:36:28 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-4e592443229so1135688137.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 02:36:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXLithKJfKWs7xLG6eeKdLmdM+cB2Qw/xc8xSGkGYSlGxWpm4YIB+ebJyfmpJH0M27BqDvarf/1rUwQVDE=@vger.kernel.org
X-Received: by 2002:a05:6102:3ca4:b0:4e5:5f29:baac with SMTP id
 ada2fe7eead31-4e772aa0fe3mr7547400137.18.1749375388278; Sun, 08 Jun 2025
 02:36:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416114240.2929832-1-daniel@0x0f.com> <ac188e54-7f23-4ecd-805c-c0437a53247a@linux-m68k.org>
 <CAFr9PXmrVUL1HubP04iHR1ObhaNo+mObg7FC+-HpTF7QR0og3g@mail.gmail.com>
 <42674c5a-42fe-4846-bf90-340310393fea@linux-m68k.org> <5bc4ad99-3432-c7e1-32a7-e9f9db86f94a@linux-m68k.org>
In-Reply-To: <5bc4ad99-3432-c7e1-32a7-e9f9db86f94a@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 8 Jun 2025 11:36:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXuuTnDk-snc4NipM1xYOom_uiDHtek1UkxuxhETJEeQA@mail.gmail.com>
X-Gm-Features: AX0GCFurA39txgMwJUlMsxaYBEzkQJOCgUrg-8vEcHy7l3MZSE04h5oOKTiCj9c
Message-ID: <CAMuHMdXuuTnDk-snc4NipM1xYOom_uiDHtek1UkxuxhETJEeQA@mail.gmail.com>
Subject: Re: [PATCH] m68k: Enable dead code elimination
To: Finn Thain <fthain@linux-m68k.org>
Cc: Greg Ungerer <gerg@linux-m68k.org>, Daniel Palmer <daniel@0x0f.com>, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Finn,

On Sun, 8 Jun 2025 at 10:32, Finn Thain <fthain@linux-m68k.org> wrote:
> On Tue, 29 Apr 2025, Greg Ungerer wrote:
> > On 29/4/25 10:04, Daniel Palmer wrote:
> > > On Mon, 28 Apr 2025 at 08:37, Greg Ungerer <gerg@linux-m68k.org> wrote:
> > >> I notice that some other architectures (arm and powerpc) have version
> > >> checks on gcc or ld in the config. Do you know if there is any
> > >> version limitations for m68k here?
> > >
> > > I'm not sure about that. I'll try to work out why they have the checks
> > > and see if that affects m68k too. I'm using GCC13 so probably new
> > > enough that most things work.
> >
> > FWIW, the oldest toolchain I had lying around was based on gcc 8.3.0 and
> > binutils 2.32. This patch worked fine on that.
> >
>
> I was going to try the patch with gcc-6.4.0 but apparently that's too old
> to build stock linux-6.15 (see below). Documentation/admin-guide/README.rst
> says I should have "at least gcc 5.1".

Someone forgot to update that file...
Anyway, it has just been increased again for v6.16-rc1 by Arnd in
commit 118c40b7b50340bf ("kbuild: require gcc-8 and binutils-2.30").

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
