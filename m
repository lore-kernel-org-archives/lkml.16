Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73BB1D9A54;
	Wed, 18 Jun 2025 07:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750232763; cv=none; b=JtO59Hn1izk4cxClU8KiFWFh4ChYrLnZPWPUZYVZ1LgVQ5fk5LmGvNYGeKVjEfvkoedeEo/ufx7QcD/lIgmrlvzda+ohsa+OaFnb1OW8lEU8hetIhIWQUD7VVo7IVihmOKRjCvFbEM9cewR+J31nnUmthzsxTZVMQWS9q5ELCRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750232763; c=relaxed/simple;
	bh=b0G3GBi+4f7gwF1LM6TH+hbbIHBOETXZTvyD81fi7sc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O9ilM8mKWpkP/JYEzZnYhhXt/JI3JnrOmMU4Bk3VdIK+7/isOUOflG1913PhOyfWW6twcCJXuQ+FtS5jDT0SF2D8pXc3pRadGKC8PBbOwgYZCaUtnlGmRRnnEJP7EPDj8bMBx/tdgJDHi0Z4ptLJaI3K8+NHykv/EFtWROaysx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LgopQXuI; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LgopQXuI"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3de209a3eb0so9130385ab.0;
        Wed, 18 Jun 2025 00:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750232760; x=1750837560; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tULZhrakZ1SqDZgksId4M6hv5k6OC7qBOW96YZtTh7Q=;
        b=LgopQXuInDL6JQ1+OGVYiLF+/ZETv5kECalSoYPz6Z2dMrGTf1CFM00iLakoUqdqiV
         fFjajSUyHRl6gNb3i181B39NTJzwGMHksThaqi17yCYMkp95r83ibj40jXui5GobfHMF
         WrXrvgWU25e5OlbR0BGUV/gg/RQIzjdpl1yjmoIKNnAsffaGDpTo3rday7huXebMApOU
         OEtwUQ8nVMsxS0G9yJdOYtyCNXRp+VrupwefVEQNZao6+psCfPoUlk6qjoqhH2sbYV3M
         43yJ0i9e4q/WJ+JRdI81Zy0q5EBPKrsnoFwxYSqQKgTUj+gMnx1HL2+wUaQd8gZBWbg+
         AcsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750232760; x=1750837560;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tULZhrakZ1SqDZgksId4M6hv5k6OC7qBOW96YZtTh7Q=;
        b=G9uVcZMJw3hM0HH+NDlq8khdB9LKiUQ7lMmP5594W19h4AuzFXyC5rgw2fWulpbOE/
         ns9adM1pqgsCfmZUyxvVlTGTqH3bxnlZ66FpEUgEsPME5LW8KK0TjZul2qyZuvowFFpj
         3igaj37FAVfGtbxTg8H1sFq5Jne8HYofU7lxkoD7WIL02VOrIthZnDTqO4EO34kZDH5y
         zWMm+JpTHjULk86MhWpsQwxGE0p1Jt3NIk2OS5coA83ulCHcy5gmjP4vBe4TaNhM3hSC
         nRltRkyhEgH0zvjoaKQpsxTmX31P4UP2cGUA4rxKSmzfkbhK6kG9efdJrF8Oh1xwV146
         OvGw==
X-Forwarded-Encrypted: i=1; AJvYcCUJTGGbEDPOsYeXpNHYmW6duDnqRu+gaY0wtJhIN+YQuvQuYdcZJXHVSuj76Fst37lQPZ91YU9gidT69Po=@vger.kernel.org, AJvYcCXeCIfNxzASfPHEmtI+hdy97bj3NqH9JkU7uqGTNpIvp0gq9PzPSycoeaiQ8eR67kRgRjnEzmZv2f8r52g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzULkjVtq9dQ5NN/wzxTwOM5JLOrvEmDQcDnk95Wdfk6E3s4xFw
	QVoDtEtHS8Cm5g3pqi50BUC/sVsNx+BhAS2pIGP19f5hRSvT5AN+PvzGh0qkGgIBCi1ybySM7u0
	eScyyCw/wW2/gL86E+n3s0yoiH1NNYuE=
X-Gm-Gg: ASbGncsNIkAFwcAHYYpPYZLBo5dtnMYeBKRzYU65GjJsGp3XOMOPEtvjzjj+f7Ff4OJ
	9RRfSHVKEh877pJzzvhOW3YJo12TUtXsSlOyo5hNe0EaProSaROEGhIlkxQKbfFfOGkKWcFyG1i
	wVSN1aT+ZOBgdCPY7iF82mb/E7YpnVawYIyv14Khq3Q04=
X-Google-Smtp-Source: AGHT+IFfCrxJV+PeeGge9EYvb1Zh9E6a381KvCpqcI50jdnWwCK0s0oF7SsxPPVE5X3kGsCKvG8ft5J0rKn3Y7XETrQ=
X-Received: by 2002:a05:6e02:1c2c:b0:3dc:868e:dae7 with SMTP id
 e9e14a558f8ab-3de07d19e01mr213925525ab.15.1750232759861; Wed, 18 Jun 2025
 00:45:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250617071833.3181378-1-shengjiu.wang@nxp.com> <aFEtiKQ5RvvZEt5x@opensource.cirrus.com>
In-Reply-To: <aFEtiKQ5RvvZEt5x@opensource.cirrus.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 18 Jun 2025 15:45:48 +0800
X-Gm-Features: AX0GCFt9AFmRgO6CB1mQvJZPng8-gSLzsFRb4Tqcj_k0G-iluamKTXfqMo6TnTQ
Message-ID: <CAA+D8AMQ5pAw6uVGQEYK+oPHJAojqnPbB+hsMWbmQOwmE9AFvw@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: wm8524: enable constraints when sysclk is configured.
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com, broonie@kernel.org, 
	perex@perex.cz, tiwai@suse.com, patches@opensource.cirrus.com, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 4:55=E2=80=AFPM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
>
> On Tue, Jun 17, 2025 at 03:18:33PM +0800, Shengjiu Wang wrote:
> > In some cases, the sysclk won't be configured on init, and sysclk can b=
e
> > changed in hw_params() according to different sample rate, for example,
> > for 44kHz sample rate, the sysclk is 11.2896MHz, for 48kHz sample rate,
> > the sysclk is 12.288MHz.
> >
> > In order to support the above case, only enable constraints when sysclk
> > is configured.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> > changes in v2
> > - Don't remove constraints, but only enable constraints when sysclk
> >   is configured.
> >
> >  sound/soc/codecs/wm8524.c | 17 +++++++----------
> >  1 file changed, 7 insertions(+), 10 deletions(-)
> >
> > diff --git a/sound/soc/codecs/wm8524.c b/sound/soc/codecs/wm8524.c
> > index 403e513f3fa8..5d8fb45db272 100644
> > --- a/sound/soc/codecs/wm8524.c
> > +++ b/sound/soc/codecs/wm8524.c
> > @@ -63,17 +63,12 @@ static int wm8524_startup(struct snd_pcm_substream =
*substream,
> >       struct wm8524_priv *wm8524 =3D snd_soc_component_get_drvdata(comp=
onent);
> >
> >       /* The set of sample rates that can be supported depends on the
> > -      * MCLK supplied to the CODEC - enforce this.
> > +      * MCLK supplied to the CODEC.
> >        */
> > -     if (!wm8524->sysclk) {
> > -             dev_err(component->dev,
> > -                     "No MCLK configured, call set_sysclk() on init\n"=
);
> > -             return -EINVAL;
> > -     }
> > -
> > -     snd_pcm_hw_constraint_list(substream->runtime, 0,
> > -                                SNDRV_PCM_HW_PARAM_RATE,
> > -                                &wm8524->rate_constraint);
> > +     if (wm8524->sysclk)
> > +             snd_pcm_hw_constraint_list(substream->runtime, 0,
> > +                                        SNDRV_PCM_HW_PARAM_RATE,
> > +                                        &wm8524->rate_constraint);
> >
> >       gpiod_set_value_cansleep(wm8524->mute, 1);
> >
>
> If we are allow the clock to be set at hw_params time, we
> should probably also double check the rates in hw_params and
> return an error if its not supported.

Ok, will add the check in hw_params.

>
> > @@ -98,6 +93,8 @@ static int wm8524_set_dai_sysclk(struct snd_soc_dai *=
codec_dai,
> >       int i, j =3D 0;
> >
> >       wm8524->sysclk =3D freq;
> > +     if (!wm8524->sysclk)
> > +             return 0;
> >
> >       wm8524->rate_constraint.count =3D 0;
> >       for (i =3D 0; i < ARRAY_SIZE(lrclk_ratios); i++) {
>
> We probably should clear rate_constraint.count in the clearing
> sysclk case, and we should probably also check if the DAI is
> active. The user shoudln't be allowed to change clock there is
> audio already happening.

Seems we can't check if the DAI is active or not in sysclk(),
because startup()->set_sysclk(),  in sysclk() the dai is always
active.  if we allow the clock changed in hw_params time, then
we can't check if the DAI is active.

best regards
Shengjiu Wang

>
> Thanks,
> Charles
