Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970DA2528FD;
	Tue, 11 Feb 2025 15:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739287341; cv=none; b=ju+91WECF8B1EB7rv0tGAeLZpMEtimJ3SMNwuGlbnA3QNsZsdBMB5Ru1hHne3q1BcSslCmAMAdmdMkOXYLQpx8ZaLU9Qm59m8NclSiop1mT+qn5acGxQpN3Itv0W6HDE0wqu2pdOOrOxDb5A5fibcrhfSUxSdgiV5aIGakHrENQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739287341; c=relaxed/simple;
	bh=GE1ArqccH4ggT/QH/gEhglvAE2yVFqHuvuk6REkFiNg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uLZfQ/Y4m7c8XzYVJbo9s6wNe8TpA71m+VpLlDg67iKHnjhwlIlPWlE3z2i3/CYHUUOzJg1T5zjWYx89cgHiMm9oAeqW68awH1lc3ZzETdX39m9v2L+QhjfHAzT9yaFh+6GswNU0BrcDu2gYiUBKRr9aRpsbuy6t/5s4A4uwaNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-520602fc185so166923e0c.0;
        Tue, 11 Feb 2025 07:22:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739287338; x=1739892138;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IDf/FBN18w/MSePGkCpc/DsFbol5PkzHDiDAzsZGsQM=;
        b=W+wjPq3ziWCRz9tcY2QQ0+HQ1mvFjCxh7OQKBp7kjxa7PgXs8MpKjFEQ9meHa9Wvv4
         ofMEH2eDD7TY5PrQOHDF5/vZUkf/QkZt2ClgRPIPBgL5yByOU+j5uv4ZLheERmk44s1N
         NWwzdCLTelPmvIq7f9J9iRmI9fV7KGEIIaDE2o2lhS54CXf6WuO4m+ODYRWT6wvWWa/g
         2PkpIAuqUg9POyyfn0wG4b/LzD9YVbiqqFFkXlsOqDX9Yomau2pMtc6CKO+JTkhkXkHQ
         vI+mcEQNqB6JGUczLYLcrmcLyr0D94dA3hlpn8Q0X7GGjTcfgn/S9xjL6+iPQVEpn53G
         4l+A==
X-Forwarded-Encrypted: i=1; AJvYcCUCOA+7s2QlOT3jY7AxG9y4a9EdlzvMEoLQRP6vuCR1OxG/AEPwFYDvtXXd+etXuTlyDYplfzdN/au4@vger.kernel.org, AJvYcCWaZuweKlXDII7ZpoyQygycgcMzIyC13E36a+k1Sf+yQjgo0tsKVoRKrZ9cYa70VklP2FDFzu+OibUcH8k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBz2Oky8At0G2W+a2uMVGI8VufURGmObgNMH5Csm4aq2XNZaKc
	CnX2nyqJNmKtM493LRy1Dpbi9OLPOxo0BddnTiyUPYSXvTBeAeCNKGypG0sC4V8=
X-Gm-Gg: ASbGncu4fhyJDu1eyk0oEk0ngsi1cKgyLX/m0yWVhEJBefldGjFDlAQvXnP3RNw5d4U
	6+rBWhC2hCEP95j2ZtdNFRW6Ufu6enkQI2AjqWBildSepAiMyo346hYG4k19TLQWkcgIOmAnos2
	1Lb4Y/YE/2eKI5dvkmjyMTIumgu7ly76q6c9aMM5xSSgR3x9WEG/tlo2TnL4jpLD/JrKDPScnhh
	TKjqmU3gP/95R0uxtfUwCYZ0TX3VnqajoJlIZq5qpM0DaMxkYlah670KMuKkmLfUVNbi0Wv0uB5
	paYPYDuQd0vUxjTTkSKJsBJqdyVrdITh0vNwAscy7HmLVWT/x6CFXg==
X-Google-Smtp-Source: AGHT+IGlCbPSmhsKFL3kESPvclbxx7BWj/TZq8wJ+BTJGi8mrZRAe1XSxdlrANvn4cjUPpp/FzMTkw==
X-Received: by 2002:a05:6122:2528:b0:518:9f81:f91d with SMTP id 71dfb90a1353d-51f2e2a6b2emr11719618e0c.10.1739287337437;
        Tue, 11 Feb 2025 07:22:17 -0800 (PST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-520580d4af4sm247117e0c.42.2025.02.11.07.22.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 07:22:16 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4bbbaa03b0aso750133137.3;
        Tue, 11 Feb 2025 07:22:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUBQXp/KF8YVu9hkSwWHd6WRHslLdo9gctxCZxP5KBqKC08CIPOfh1aWHBUIaYjsGAccZV0NroVfl0OHZc=@vger.kernel.org, AJvYcCVJ03uxP55EUTr51zG5UNBPan89ekemlwbwJSgbECq5yaiAtgw4Z+9apwSKUs4to7fxdPa4PRY01Pl0@vger.kernel.org
X-Received: by 2002:a05:6102:418b:b0:4bb:5d61:1252 with SMTP id
 ada2fe7eead31-4bb5d611970mr7175358137.23.1739287336539; Tue, 11 Feb 2025
 07:22:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203-b4-get_maintainer-v2-0-83ba008b491f@suse.cz>
 <20250203-b4-get_maintainer-v2-1-83ba008b491f@suse.cz> <7aodxv46lj6rthjo4i5zhhx2lybrhb4uknpej2dyz3e7im5w3w@w23bz6fx3jnn>
 <CAMuHMdVeMe++0_hOx7ug0eRXD2cOWMRZsuHUee3KPjBE5FxjNQ@mail.gmail.com> <wy6yhp2ty2s5wq76u7toghuuztdzb5f7uphfqkgw4t7vu4eojd@sc26ynxekxki>
In-Reply-To: <wy6yhp2ty2s5wq76u7toghuuztdzb5f7uphfqkgw4t7vu4eojd@sc26ynxekxki>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Feb 2025 16:22:04 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVXgK3DiUjjOC==mm0SD8Fgtd44T+s2giPjD+G_c1tXeA@mail.gmail.com>
X-Gm-Features: AWEUYZmf4rySmvZVXNOk5ylfnfY73xg5CsSAPYmCgFP_oFg40q0rY3aRwfpC3dA
Message-ID: <CAMuHMdVXgK3DiUjjOC==mm0SD8Fgtd44T+s2giPjD+G_c1tXeA@mail.gmail.com>
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

On Tue, 11 Feb 2025 at 16:09, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
> On Tue, Feb 11, 2025 at 11:48:13AM +0100, Geert Uytterhoeven wrote:
> > On Tue, 11 Feb 2025 at 11:32, Uwe Kleine-K=C3=B6nig
> > <u.kleine-koenig@baylibre.com> wrote:
> > > On Mon, Feb 03, 2025 at 12:13:16PM +0100, Vlastimil Babka wrote:
> > > > The subsystem status is currently reported with --role(stats) by
> > > > adjusting the maintainer role for any status different from Maintai=
ned.
> > > > This has two downsides:
> > > >
> > > > - if a subsystem has only reviewers or mailing lists and no maintai=
ners,
> > > >   the status is not reported (i.e. typically, Orphan subsystems hav=
e no
> > > >   maintainers)
> > > >
> > > > - the Supported status means that someone is paid for maintaining, =
but
> > > >   it is reported as "supporter" for all the maintainers, which can =
be
> > > >   incorrect. People have been also confused about what "supporter"
> > > >   means.
> > > >
> > > > This patch introduces a new --substatus option and functionality ai=
med
> > > > to report the subsystem status separately, without adjusting the
> > > > reported maintainer role. After the e-mails are output, the status =
of
> > > > subsystems will follow, for example:
> > > >
> > > > ...
> > > > linux-kernel@vger.kernel.org (open list:LIBRARY CODE)
> > > > LIBRARY CODE status: Supported
> > > >
> > > > In order to allow replacing the role rewriting seamlessly, the new
> > > > option works as follows:
> > > >
> > > > - it is automatically enabled when --email and --role are enabled
> > > >   (the defaults include --email and --rolestats which implies --rol=
e)
> > > >
> > > > - usages with --norolestats e.g. for git's --cc-cmd will thus need =
no
> > > >   adjustments
> > > >
> > > > - the most common Maintained status is not reported at all, to redu=
ce
> > > >   unnecessary noise
> > > >
> > > > - THE REST catch-all section (contains lkml) status is not reported
> > > >
> > > > - the existing --subsystem and --status options are unaffected so t=
heir
> > > >   users will need no adjustments
> > > >
> > > > Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
> > >
> > > This patch is in next as c1565b6f7b53ea1ea3e757538832e12d7d13d949. It
> > > breaks one of my scripts that I use to semi-automatically determine
> > > recipents for patch series.
> > >
> > > It works as follows:
> > >
> > >         $ batch-add-recipents audin-patch-v1/0001-ASoC-meson-HACK-let=
-AIU-export-its-clocks-through-cl.patch
> > >         #!/bin/sh
> > >
> > >         addrecipent \
> > >         -t "Rob Herring <robh@kernel.org>" $(: maintainer:OPEN FIRMWA=
RE AND FLATTENED DEVICE TREE BINDINGS) \
> > >         -t "Krzysztof Kozlowski <krzk+dt@kernel.org>" $(: maintainer:=
OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS) \
> > >         -t "Conor Dooley <conor+dt@kernel.org>" $(: maintainer:OPEN F=
IRMWARE AND FLATTENED DEVICE TREE BINDINGS) \
> > >         -t "Neil Armstrong <neil.armstrong@linaro.org>" $(: maintaine=
r:ARM/Amlogic Meson SoC support) \
> > >         -t "Kevin Hilman <khilman@baylibre.com>" $(: maintainer:ARM/A=
mlogic Meson SoC support) \
> > >         -c "Jerome Brunet <jbrunet@baylibre.com>" $(: reviewer:ARM/Am=
logic Meson SoC support) \
> > >         -c "Martin Blumenstingl <martin.blumenstingl@googlemail.com>"=
 $(: reviewer:ARM/Amlogic Meson SoC support) \
> > >         -t "Liam Girdwood <lgirdwood@gmail.com>" $(: supporter:SOUND =
- SOC LAYER / DYNAMIC AUDIO POWER MANAGEM...) \
> > >         -t "Mark Brown <broonie@kernel.org>" $(: supporter:SOUND - SO=
C LAYER / DYNAMIC AUDIO POWER MANAGEM...) \
> > >         -t "Jaroslav Kysela <perex@perex.cz>" $(: maintainer:SOUND) \
> > >         -t "Takashi Iwai <tiwai@suse.com>" $(: maintainer:SOUND) \
> > >         -c "devicetree@vger.kernel.org" $(: open list:OPEN FIRMWARE A=
ND FLATTENED DEVICE TREE BINDINGS) \
> > >         -c "linux-arm-kernel@lists.infradead.org" $(: moderated list:=
ARM/Amlogic Meson SoC support) \
> > >         -c "linux-amlogic@lists.infradead.org" $(: open list:ARM/Amlo=
gic Meson SoC support) \
> > >         -c "linux-kernel@vger.kernel.org" $(: open list) \
> > >         -c "linux-sound@vger.kernel.org" $(: open list:SOUND - SOC LA=
YER / DYNAMIC AUDIO POWER MANAGEM...) \
> > >         audin-patch-v1/0001-ASoC-meson-HACK-let-AIU-export-its-clocks=
-through-cl.patch
> >
> > Hey, that looks familiar ;-)
> >
> > > the output is usually redirected to a file that I edit before running
> > > it. The additional line in the output of
> > >
> > >         scripts/get_maintainer.pl audin-patch-v1/0001-ASoC-meson-HACK=
-let-AIU-export-its-clocks-through-cl.patch
> > >
> > > with your change breaks that script.
> >
> > You forgot to list the additional output?
> >
> > I gave it a try with my script, and with one of my own patches.
> > Example additional output is:
> >
> >      --cc "ARM/Microchip" $(: AT91] SoC support status: Supported \
> >     --cc "QAT DRIVER status: Supported \
> >     --cc "ARM/ASPEED MACHINE SUPPORT status: Supported \
> >     --cc "MELEXIS MLX90614 DRIVER status: Supported \
> >     --cc "ARM/NUVOTON MA35 ARCHITECTURE status: Supported \
> >     --cc "ARM/RISC-V/RENESAS ARCHITECTURE status: Supported \
>
> Is that really your output? No closing ) in the first line and no
> closing " in the 5 last?

Yes it is....
As I need to delete the lines anyway, invalid syntax is irrelevant ;-)

> For me it's worse(?), I get:
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
>         -t "Liam Girdwood <lgirdwood@gmail.com>" $(: maintainer:SOUND - S=
OC LAYER / DYNAMIC AUDIO POWER MANAGEM...) \
>         -t "Mark Brown <broonie@kernel.org>" $(: maintainer:SOUND - SOC L=
AYER / DYNAMIC AUDIO POWER MANAGEM...) \
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
>         Failed to parse "SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEME=
NT (ASoC) status: Supported
>         " at -e line 6, <> line 17.

Oops...

My version is also not perfect. I'm used to doing manual adjustments...

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
