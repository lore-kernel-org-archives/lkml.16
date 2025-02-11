Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74811C5D40;
	Tue, 11 Feb 2025 10:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739270911; cv=none; b=kH8RDNmV18b9ciSMOB0aDBGALJF2azXcA3SBTMo0D9XXHUT4YxHiisuq0LD6JwcVEHLP32GagR8tNrNxI1dk56Y69/YhI12/JbwDzDaN3gBR/gZTY4xIldG3jeP7REnGXCsddQXGgx56llOOZwgPYwrpzDSuHBIq/TES4BNGYG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739270911; c=relaxed/simple;
	bh=UerPirAcW+nkYfZL4ZWlBNq/4Xh35eAiYuHhOLWAPos=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Di/PiyDSV2uNQv213/zYdhDnaqKnJElGFkMkq2yokHcMjRyE0YOc3yv6U24s/dwRn5Tv1Tk0ypwyH8OxAc2pXG6BZfi+yJ1qTq0qbKETVtOsk85MkLqr28QRA6HT320+Mkr7gC0mD4E8exLpZNR4KRbjfa3tfLYa1ak0JQ/4ttg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-4bbe470bc3fso338083137.0;
        Tue, 11 Feb 2025 02:48:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739270907; x=1739875707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KKBYxCaYYpe4xFUvgehK9MXy/sIDCvhlqBo2hvhtNmc=;
        b=nFB04ttGU7LSkoue9f4JX1u7XPb76voMnznNsMLbQvJjgp8fMCPLG58S0ShsJr+jI5
         6H9x7sh+/TXg/ucU3uGNgBnOaCqiDX4TqCp1UQt/vZb/2bXwRguNIKIkrJB4ncneXTok
         7lafObtbJF3ss3bapRdpoxpsHKRnY9fcHXjIH8XxhxOEw+asZ+IKf2tytSu2KVg4AKZU
         KujgYqRqAZ4UVYOjNIn6sE8gpLj7fQVudLlQ1G0hYiksxhuF54tMyaO0je6La32SCR4v
         lcVWjN8uPSe6UuDicaKnqYiBEutLf+z96Q7D8A8WhfiZg7lzKaSWy0MbHuQiJNltLRSF
         i8fw==
X-Forwarded-Encrypted: i=1; AJvYcCVxNdevwSZmWUejsUOW2pu0efc92FEZ4ad/Ahvv87OzaI8haVIpwDnW8Tv7J+j+MNcHhYdfDTyA2siE@vger.kernel.org, AJvYcCWVR0yOBB2DEDZxhXQCCRJDG98Ptn3inbvIpHsukoAW998g8F7iJ4XiHlXv2IjPXD30bwZ0SyE+cw/l0Jg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb/TxSa7Fypt0mSp9z0WTSR4qCthzszu9VS9SlVURp9C2tWFuj
	h3Ij1hJAOeB9SLTYPzt095vo9R3gES8s43UQymvD/W3ZO5Dy3qo5YBI8HeRT98A=
X-Gm-Gg: ASbGncvYk9RPBl4Gt42Q2NCQAiZe5hlotPCYKAhX1NDETySQ7aSVrWMr1DxxBk+URdH
	rrGm/F4ZZ6ibw2aQyPBCfNyg07nYAQW7IGHnwROt/a3bzT5OneOJSB8Ri56r6WJktJDNv2xKGwX
	Bdh1V0RZjX0+CdSLxTKcT2sCwYqr4Cop7s+K5eU1hsTU6/MDwWPyv3yaZkhLZQLdkrAA8usXuoL
	2FALdug7EtTjdn/ruKv3iPVtqDYyf+CbPT6FugZ2WeRBCSdR0b0zSmDGuPWx7gRIENVITpsFLmu
	yI0ki3BDntB5/Kf9l+W+MeeQ2BxJr6UucvbPEeSbcE20+SMb0B0+wQ==
X-Google-Smtp-Source: AGHT+IEqWAwrHiFYR5epPqIkauCxj7JOZX1C1ABxJ0syOBvyg/RYW67pqK6fAWSOgOJ9OPaT0U7G5g==
X-Received: by 2002:a05:6102:205c:b0:4ba:99b5:60f5 with SMTP id ada2fe7eead31-4ba99b567d4mr5800830137.23.1739270907176;
        Tue, 11 Feb 2025 02:48:27 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4bbcf5660c0sm592849137.18.2025.02.11.02.48.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 02:48:26 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-867129fdb0aso2249019241.1;
        Tue, 11 Feb 2025 02:48:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUVqIJus5G4PWtiHawxnHPvTV2Zw0ByCLAFuH/T2fXsbojCeJKB/T6K7OroAwGHBKu7Z2IbO1gw7v0DRKs=@vger.kernel.org, AJvYcCWvY49de1+E+hmhHlFVkoi892Rnw0E/JxsnlwgJED5mpVbxYhJEYEIXb8Nxuugf1DGIj24cT4hUt6js@vger.kernel.org
X-Received: by 2002:a05:6102:2ac7:b0:4bb:c8e5:aa6d with SMTP id
 ada2fe7eead31-4bbc8e5ad50mr4378402137.17.1739270905440; Tue, 11 Feb 2025
 02:48:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203-b4-get_maintainer-v2-0-83ba008b491f@suse.cz>
 <20250203-b4-get_maintainer-v2-1-83ba008b491f@suse.cz> <7aodxv46lj6rthjo4i5zhhx2lybrhb4uknpej2dyz3e7im5w3w@w23bz6fx3jnn>
In-Reply-To: <7aodxv46lj6rthjo4i5zhhx2lybrhb4uknpej2dyz3e7im5w3w@w23bz6fx3jnn>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Feb 2025 11:48:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVeMe++0_hOx7ug0eRXD2cOWMRZsuHUee3KPjBE5FxjNQ@mail.gmail.com>
X-Gm-Features: AWEUYZlRIwnbJ4xR6KQkMkb3NhTJ5vBwKhACfgor7fj8riEEVlYdsOTpWfe2clE
Message-ID: <CAMuHMdVeMe++0_hOx7ug0eRXD2cOWMRZsuHUee3KPjBE5FxjNQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] get_maintainer: add --substatus for reporting
 subsystem status
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Vlastimil Babka <vbabka@suse.cz>, Joe Perches <joe@perches.com>, 
	Andrew Morton <akpm@linux-foundation.org>, workflows@vger.kernel.org, 
	"Theodore Ts'o" <tytso@mit.edu>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Thorsten Leemhuis <linux@leemhuis.info>, Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Uwe,

On Tue, 11 Feb 2025 at 11:32, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
> On Mon, Feb 03, 2025 at 12:13:16PM +0100, Vlastimil Babka wrote:
> > The subsystem status is currently reported with --role(stats) by
> > adjusting the maintainer role for any status different from Maintained.
> > This has two downsides:
> >
> > - if a subsystem has only reviewers or mailing lists and no maintainers=
,
> >   the status is not reported (i.e. typically, Orphan subsystems have no
> >   maintainers)
> >
> > - the Supported status means that someone is paid for maintaining, but
> >   it is reported as "supporter" for all the maintainers, which can be
> >   incorrect. People have been also confused about what "supporter"
> >   means.
> >
> > This patch introduces a new --substatus option and functionality aimed
> > to report the subsystem status separately, without adjusting the
> > reported maintainer role. After the e-mails are output, the status of
> > subsystems will follow, for example:
> >
> > ...
> > linux-kernel@vger.kernel.org (open list:LIBRARY CODE)
> > LIBRARY CODE status: Supported
> >
> > In order to allow replacing the role rewriting seamlessly, the new
> > option works as follows:
> >
> > - it is automatically enabled when --email and --role are enabled
> >   (the defaults include --email and --rolestats which implies --role)
> >
> > - usages with --norolestats e.g. for git's --cc-cmd will thus need no
> >   adjustments
> >
> > - the most common Maintained status is not reported at all, to reduce
> >   unnecessary noise
> >
> > - THE REST catch-all section (contains lkml) status is not reported
> >
> > - the existing --subsystem and --status options are unaffected so their
> >   users will need no adjustments
> >
> > Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
>
> This patch is in next as c1565b6f7b53ea1ea3e757538832e12d7d13d949. It
> breaks one of my scripts that I use to semi-automatically determine
> recipents for patch series.
>
> It works as follows:
>
>         $ batch-add-recipents audin-patch-v1/0001-ASoC-meson-HACK-let-AIU=
-export-its-clocks-through-cl.patch
>         #!/bin/sh
>
>         addrecipent \
>         -t "Rob Herring <robh@kernel.org>" $(: maintainer:OPEN FIRMWARE A=
ND FLATTENED DEVICE TREE BINDINGS) \
>         -t "Krzysztof Kozlowski <krzk+dt@kernel.org>" $(: maintainer:OPEN=
 FIRMWARE AND FLATTENED DEVICE TREE BINDINGS) \
>         -t "Conor Dooley <conor+dt@kernel.org>" $(: maintainer:OPEN FIRMW=
ARE AND FLATTENED DEVICE TREE BINDINGS) \
>         -t "Neil Armstrong <neil.armstrong@linaro.org>" $(: maintainer:AR=
M/Amlogic Meson SoC support) \
>         -t "Kevin Hilman <khilman@baylibre.com>" $(: maintainer:ARM/Amlog=
ic Meson SoC support) \
>         -c "Jerome Brunet <jbrunet@baylibre.com>" $(: reviewer:ARM/Amlogi=
c Meson SoC support) \
>         -c "Martin Blumenstingl <martin.blumenstingl@googlemail.com>" $(:=
 reviewer:ARM/Amlogic Meson SoC support) \
>         -t "Liam Girdwood <lgirdwood@gmail.com>" $(: supporter:SOUND - SO=
C LAYER / DYNAMIC AUDIO POWER MANAGEM...) \
>         -t "Mark Brown <broonie@kernel.org>" $(: supporter:SOUND - SOC LA=
YER / DYNAMIC AUDIO POWER MANAGEM...) \
>         -t "Jaroslav Kysela <perex@perex.cz>" $(: maintainer:SOUND) \
>         -t "Takashi Iwai <tiwai@suse.com>" $(: maintainer:SOUND) \
>         -c "devicetree@vger.kernel.org" $(: open list:OPEN FIRMWARE AND F=
LATTENED DEVICE TREE BINDINGS) \
>         -c "linux-arm-kernel@lists.infradead.org" $(: moderated list:ARM/=
Amlogic Meson SoC support) \
>         -c "linux-amlogic@lists.infradead.org" $(: open list:ARM/Amlogic =
Meson SoC support) \
>         -c "linux-kernel@vger.kernel.org" $(: open list) \
>         -c "linux-sound@vger.kernel.org" $(: open list:SOUND - SOC LAYER =
/ DYNAMIC AUDIO POWER MANAGEM...) \
>         audin-patch-v1/0001-ASoC-meson-HACK-let-AIU-export-its-clocks-thr=
ough-cl.patch

Hey, that looks familiar ;-)

> the output is usually redirected to a file that I edit before running
> it. The additional line in the output of
>
>         scripts/get_maintainer.pl audin-patch-v1/0001-ASoC-meson-HACK-let=
-AIU-export-its-clocks-through-cl.patch
>
> with your change breaks that script.

You forgot to list the additional output?

I gave it a try with my script, and with one of my own patches.
Example additional output is:

     --cc "ARM/Microchip" $(: AT91] SoC support status: Supported \
    --cc "QAT DRIVER status: Supported \
    --cc "ARM/ASPEED MACHINE SUPPORT status: Supported \
    --cc "MELEXIS MLX90614 DRIVER status: Supported \
    --cc "ARM/NUVOTON MA35 ARCHITECTURE status: Supported \
    --cc "ARM/RISC-V/RENESAS ARCHITECTURE status: Supported \

Iff this extra output is good to have, why not include it in the comment
next to the existing entries with the email addresses, so it will be
handled automatically by all scripting on top?

Now, as both Uwe and I edit our generated scripts before running them,
we can delete the unwanted lines, but it's more work...
Thanks!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
