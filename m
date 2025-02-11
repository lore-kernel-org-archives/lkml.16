Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF1A1F8AE2;
	Tue, 11 Feb 2025 15:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739287209; cv=none; b=ZvQxUDubSnOf+1+aMJoTIqyNUlvOQQp8P34GbFRAP4+nHYqGQqoXLFlEGm52zFPT7/nLxaWWeMIAhueBDnmyp2lvy9ybO/Ns/TPx5H3w+bndf8Pf07alkMeYkDUD9Hb4mz0XsC15caIBRHPD55PYyb7MKPcg0y8M/+8lxby6QG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739287209; c=relaxed/simple;
	bh=P4/JUSQFJJgd2+ctyS23wFSUH0XddSHllH1RmQo/+AE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AuIVvWHW34O8iamMgoKCtvfKX4qaaXWKQTU5UMWz4pJi2tnTujAJAFFbNu1i7X5vYRgwVELdx6Jd+WoZ5lkJp5+SiISXvyy0O3soSZ39Htw7uIo8IOs1CFSBA9WBXvVYsA6xibU1FledwGDYAe/3kPVtziEiEs3gupLt6DbhNMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c050c6e201so288000785a.0;
        Tue, 11 Feb 2025 07:20:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739287206; x=1739892006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HeI1h3X9YFsKZxmC1aBdZztDggHHYsmIO5rZzIxeESU=;
        b=w7LT46NM2Zjyowny6slavYWj3EQ6rLKgN8gmEL7rKgeiPuiLv+c7cBYPmcDi9EIRz6
         rMPUOvO7fND1g+PySNqbo7NDNsvxoNZi3ixtkFdjOuqXmaXvJZaJ5HTl7tpvydGozGLN
         C9068dHAyGqB6OaC+f+NlQZHlsdx35B5jjwhIj6hhvR1Fc1Q1prb5iUUFyksH/9PZqF7
         gkYf14I6DPGrJeS8kWd88vSJwyVzyHv6HMiy3pRkuRPWPiFsYNTLXBVFUKQwN/mLn1eY
         3eR6L+l2JerGA9X8hg9u4p0XR/OjtogWQILTrmi+A0DMFXrNZIu67zcFW81E/dicP/KM
         i5rQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3naXsTQUHGAcENkzcfg9t5mlsAJc3/24giHeFu2zd5UfXTKkTVnA6FyNJXyWKJxqdDE9ZOmEVIGdn@vger.kernel.org, AJvYcCWzz6VMoqm4BBIpOZtzU1xY70b84XZ7N1hrxQ519qQhpYYPZOZiLx/UL9PHRE3a6gxsgafXYayX6zfZln0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVN8v0EvfQRzXQb2WxKznap55rbYPyncDFij3uweqAj/7QPmXH
	MS3kETqSS5t071fHTg2iOW0XqCyXX366PAGTTbK+15BhFOfZsL6FVbWhhumo8OY=
X-Gm-Gg: ASbGncuK3Kc36wBkLq2fiNtodANeU3WyOxv0+sY+jJeKAQsuFGc1Lv2CM8mjKXQVdxj
	XGiRrQO6wvv8on+YLvuOJU51DfimpgmhmMhttCBDm7T4S7G4yL1mKaSixCVAtO76xsql9snYWyK
	1mnKIihMwBAc8S+V6IJzUzu81FRfXmwZ2W1XUvo+YMYS4XwFOxI8FWBLIUzRDCEmH4+IvedccC+
	9URULmdlecoxYxzBd611O4hu5gDyExwo1KEG8Nqqy9zFwW30FYwDOoYH72vL93ZJ1DRl3tOkTvP
	NXxqLB8f3glk/K7PJw3jw2p4mne4P0HWF6cuY/xlAkDOZNc2RFGJt0zmoA==
X-Google-Smtp-Source: AGHT+IGXhHRmf9BdxgLS7RQmnwByon8F7DkbyBt3MEy9cIQVRmBo7eGOsthG/L9/dVtqRGYKyXuj5Q==
X-Received: by 2002:a05:620a:470a:b0:7c0:6188:902b with SMTP id af79cd13be357-7c06f3af02amr23109685a.5.1739287205772;
        Tue, 11 Feb 2025 07:20:05 -0800 (PST)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com. [209.85.160.178])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c041ded12asm685311985a.5.2025.02.11.07.20.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 07:20:05 -0800 (PST)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-46c8474d8daso44782661cf.3;
        Tue, 11 Feb 2025 07:20:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUODZm0EtIP/rGQenfGbiCG1BGpDjpNIKbtWC3edh2qbnUNgwAmOWg2CW+/+qIRGoGrUvvaj4JKc04akjs=@vger.kernel.org, AJvYcCW/5ChObQyNOAWCkK+5DG66VFPPKpWnQ5f90KSzT3dhpt57EMiQxyZPy93sKLhLbm5r18cBhg1Er/Xd@vger.kernel.org
X-Received: by 2002:a05:622a:1347:b0:467:5eb6:5153 with SMTP id
 d75a77b69052e-471679efd97mr266573411cf.19.1739287205151; Tue, 11 Feb 2025
 07:20:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203-b4-get_maintainer-v2-0-83ba008b491f@suse.cz>
 <20250203-b4-get_maintainer-v2-1-83ba008b491f@suse.cz> <7aodxv46lj6rthjo4i5zhhx2lybrhb4uknpej2dyz3e7im5w3w@w23bz6fx3jnn>
 <CAMuHMdVeMe++0_hOx7ug0eRXD2cOWMRZsuHUee3KPjBE5FxjNQ@mail.gmail.com> <6ff32b12-7113-41dc-80d3-e729cc15a5ce@suse.cz>
In-Reply-To: <6ff32b12-7113-41dc-80d3-e729cc15a5ce@suse.cz>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Feb 2025 16:19:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXNaNPiVXMrqf4YqM-PRC6ZrTgmHtOP1S9PPCP2HqvGWA@mail.gmail.com>
X-Gm-Features: AWEUYZn1xjyqB1EpoC6789OaNQPaQ4r64nAW_WDpvE8uFlaj5_lViZH23fSGHDY
Message-ID: <CAMuHMdXNaNPiVXMrqf4YqM-PRC6ZrTgmHtOP1S9PPCP2HqvGWA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] get_maintainer: add --substatus for reporting
 subsystem status
To: Vlastimil Babka <vbabka@suse.cz>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>, workflows@vger.kernel.org, 
	"Theodore Ts'o" <tytso@mit.edu>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Thorsten Leemhuis <linux@leemhuis.info>, Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Vlastimil,

On Tue, 11 Feb 2025 at 15:58, Vlastimil Babka <vbabka@suse.cz> wrote:
> On 2/11/25 11:48, Geert Uytterhoeven wrote:
> > On Tue, 11 Feb 2025 at 11:32, Uwe Kleine-K=C3=B6nig
> > <u.kleine-koenig@baylibre.com> wrote:
> >> On Mon, Feb 03, 2025 at 12:13:16PM +0100, Vlastimil Babka wrote:
> >> > The subsystem status is currently reported with --role(stats) by
> >> > adjusting the maintainer role for any status different from Maintain=
ed.
> >> > This has two downsides:
> >> >
> >> > - if a subsystem has only reviewers or mailing lists and no maintain=
ers,
> >> >   the status is not reported (i.e. typically, Orphan subsystems have=
 no
> >> >   maintainers)
> >> >
> >> > - the Supported status means that someone is paid for maintaining, b=
ut
> >> >   it is reported as "supporter" for all the maintainers, which can b=
e
> >> >   incorrect. People have been also confused about what "supporter"
> >> >   means.
> >> >
> >> > This patch introduces a new --substatus option and functionality aim=
ed
> >> > to report the subsystem status separately, without adjusting the
> >> > reported maintainer role. After the e-mails are output, the status o=
f
> >> > subsystems will follow, for example:
> >> >
> >> > ...
> >> > linux-kernel@vger.kernel.org (open list:LIBRARY CODE)
> >> > LIBRARY CODE status: Supported
> >> >
> >> > In order to allow replacing the role rewriting seamlessly, the new
> >> > option works as follows:
> >> >
> >> > - it is automatically enabled when --email and --role are enabled
> >> >   (the defaults include --email and --rolestats which implies --role=
)
> >> >
> >> > - usages with --norolestats e.g. for git's --cc-cmd will thus need n=
o
> >> >   adjustments
> >> >
> >> > - the most common Maintained status is not reported at all, to reduc=
e
> >> >   unnecessary noise
> >> >
> >> > - THE REST catch-all section (contains lkml) status is not reported
> >> >
> >> > - the existing --subsystem and --status options are unaffected so th=
eir
> >> >   users will need no adjustments
> >> >
> >> > Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
> >>
> >> This patch is in next as c1565b6f7b53ea1ea3e757538832e12d7d13d949. It
> >> breaks one of my scripts that I use to semi-automatically determine
> >> recipents for patch series.
> >>
> >> It works as follows:
> >>
> >>         $ batch-add-recipents audin-patch-v1/0001-ASoC-meson-HACK-let-=
AIU-export-its-clocks-through-cl.patch
> >>         #!/bin/sh
> >>
> >>         addrecipent \
> >>         -t "Rob Herring <robh@kernel.org>" $(: maintainer:OPEN FIRMWAR=
E AND FLATTENED DEVICE TREE BINDINGS) \
> >>         -t "Krzysztof Kozlowski <krzk+dt@kernel.org>" $(: maintainer:O=
PEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS) \
> >>         -t "Conor Dooley <conor+dt@kernel.org>" $(: maintainer:OPEN FI=
RMWARE AND FLATTENED DEVICE TREE BINDINGS) \
> >>         -t "Neil Armstrong <neil.armstrong@linaro.org>" $(: maintainer=
:ARM/Amlogic Meson SoC support) \
> >>         -t "Kevin Hilman <khilman@baylibre.com>" $(: maintainer:ARM/Am=
logic Meson SoC support) \
> >>         -c "Jerome Brunet <jbrunet@baylibre.com>" $(: reviewer:ARM/Aml=
ogic Meson SoC support) \
> >>         -c "Martin Blumenstingl <martin.blumenstingl@googlemail.com>" =
$(: reviewer:ARM/Amlogic Meson SoC support) \
> >>         -t "Liam Girdwood <lgirdwood@gmail.com>" $(: supporter:SOUND -=
 SOC LAYER / DYNAMIC AUDIO POWER MANAGEM...) \
> >>         -t "Mark Brown <broonie@kernel.org>" $(: supporter:SOUND - SOC=
 LAYER / DYNAMIC AUDIO POWER MANAGEM...) \
> >>         -t "Jaroslav Kysela <perex@perex.cz>" $(: maintainer:SOUND) \
> >>         -t "Takashi Iwai <tiwai@suse.com>" $(: maintainer:SOUND) \
> >>         -c "devicetree@vger.kernel.org" $(: open list:OPEN FIRMWARE AN=
D FLATTENED DEVICE TREE BINDINGS) \
> >>         -c "linux-arm-kernel@lists.infradead.org" $(: moderated list:A=
RM/Amlogic Meson SoC support) \
> >>         -c "linux-amlogic@lists.infradead.org" $(: open list:ARM/Amlog=
ic Meson SoC support) \
> >>         -c "linux-kernel@vger.kernel.org" $(: open list) \
> >>         -c "linux-sound@vger.kernel.org" $(: open list:SOUND - SOC LAY=
ER / DYNAMIC AUDIO POWER MANAGEM...) \
> >>         audin-patch-v1/0001-ASoC-meson-HACK-let-AIU-export-its-clocks-=
through-cl.patch
> >
> > Hey, that looks familiar ;-)
> >
> >> the output is usually redirected to a file that I edit before running
> >> it. The additional line in the output of
> >>
> >>         scripts/get_maintainer.pl audin-patch-v1/0001-ASoC-meson-HACK-=
let-AIU-export-its-clocks-through-cl.patch
> >>
> >> with your change breaks that script.
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
> >
> > Iff this extra output is good to have, why not include it in the commen=
t
> > next to the existing entries with the email addresses, so it will be
> > handled automatically by all scripting on top?
>
> I've tried to do that in v1 in the form of reporting e.g. as
> John Doe <jd@example.com> (maintainer:SUBSYSTEM [supported])
>
> But it seemed noisy to repeat that on every line involving the subsystem.

Yeah, it could be considered noisy... (more below)

> When you say comment, what kind of separation for the comment would work
> regardless of what's used for postprocessing?

I don't mind much. Perhaps just a comma?

> > Now, as both Uwe and I edit our generated scripts before running them,
> > we can delete the unwanted lines, but it's more work...
> > Thanks!
>
> I guess technically your scripts could detect first if --no-substatus is
> supported by grepping --help or testing if passing the option results in =
an
> error? But yeah it's not ideal, looks like I've hit the limits of automag=
ic
> heuristics here.
> Or we make it fully opt-in but then most non-scripting users will not lea=
rn
> the status at all because it won't occur to them to enable it...

I still seem to miss the real story behind this patch (so perhaps
that's why I would consider all of it noisy ;-). When I create a patch,
what am I gonna do with this extra information?
E.g. decide not to send the patch, because the driver is orphaned?

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
