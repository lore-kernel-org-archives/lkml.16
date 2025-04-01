Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08A51519B8
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 10:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743503969; cv=none; b=WnDycfoEvrRCfnhFqqFnS1IWcMAbPsKAeXIUaWjlls4sYGTJtJ0v/NXDThOgYcJtNPZvNVexVc1fBz2hbsYNRUqlx9/HERqsSsOVF9Bhjubc5Fm/7mmZ5HH62GtYCFnxBVwaujMm3drqTMn7yP/UmIkyVGURQGCnz7dAb2ZMuqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743503969; c=relaxed/simple;
	bh=QAN9bi4PQf0VAM9ayYdXy0M2N2RrxYNHychjXqyLJoA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gp1jPQ/1hsKtvVYI+CAB7NhI6kaHlfF3+dGZQN7dgks8CgkU+hxbd74KfV8cyGd4mHyRcYm8CZUydoLFjPAOtsiLeOKD1G+e6/cOHgybL+HKzNLYpCTmBqYQ0z9u4n0ZxN5KlOvs2hmZEkhhTwgxSONZ9lKXQUhNTlRcI0zKnas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eIJIpsup; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eIJIpsup"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30bf1d48843so46654691fa.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 03:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743503964; x=1744108764; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pRV+VeBoTN2SUSAD80QVrLhbV77gG979UsKYtyQMX8w=;
        b=eIJIpsupa/ayJxuZOWyNQe4U92h7NehLtIBKTTc7RdolPOPVr6O6/ulv8J4R7orQrG
         RN4qfHSn1dSDJSGEYXDjV1GDEuD++fdsfqVX3Vg3/Mj4VjaQH9zeXplhrFX+j3VZiEjY
         oTRHW/PqPvYtZ2UOFMLXBN3PSpNZ1vqoX3yg4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743503964; x=1744108764;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pRV+VeBoTN2SUSAD80QVrLhbV77gG979UsKYtyQMX8w=;
        b=F1hM+na5nearHYWSOiQqVAys4PXu0DWm3TE37iTqsddMwbkGnQaQtnRR5M0XjO+WNi
         53g+YOMmN/8aMKR0y4OyckXuwr3uwfHmN/qa+ny5MrI67+QjosDlDjaJkpJBCIkVIxPZ
         yjJfTPycCFNELsf359r/r80NUK6mfLNdgvApvBgTvYQPO9J2qYg1EOMPG7yLLbTo0UML
         uhAtzWRZt6QrYoYYSONxHtbXeU+a5UToF2bEqY7EQLgcUsOUgXWBclA9RxKnL9IWP9FB
         QQP4kZxb4oX2fEfCPvoLmp1Zij5XqlI5+6Pj7QQCu3eT3S8L+SzoOsT9hxorEuhlfjCg
         xoqA==
X-Forwarded-Encrypted: i=1; AJvYcCW671is5xhVk5GYMDnYDyW1bdJ4iXyxCiiu4Hop9lNTjRXO0I/fV6KJC7Utc/jKbEP5Ctrnv7py7QdqCes=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdi17vjoUOc7WoHm4b9qFkSJ03UBB7L4FFtK7nNkAO3TeomvWQ
	7fULc3eU6iI62C4zd1Tdc33N2w0pYGgAppxNYKmmYp6BZAlFNnSQIbU1xxlarGkKWNSgh+Rs0sv
	cN7kSzQ/92zN3nDi2hNRApkq31/Sbnhbs5c1L
X-Gm-Gg: ASbGncuaENASJiSbJfNZ1WLTWxJXN6eXw34yGrBVv+P5cU4EmQEDhc40nwHYenoPMZk
	lG5ikXfSeelM37WycyY/UsIHdNALiYZWHrUUBBa4PlpM1E1ocwcNGI4MbLGZ5z/2k8ThsbUy9i8
	Du6hEbumWSTURowRRPYY4FnuZTydBvqX3dRRwtNrEYQPzq2/FoVSYULw==
X-Google-Smtp-Source: AGHT+IHYL4/j9tzg1TKZZJWZGJjZ8cGZeF1J3Sn0HnhWsgBtHcAF53FT/BIES0497J4HXcNOkVv/f17SBTVzgwcdel4=
X-Received: by 2002:a2e:9b05:0:b0:30d:626e:d03a with SMTP id
 38308e7fff4ca-30de02f8530mr35374221fa.34.1743503964001; Tue, 01 Apr 2025
 03:39:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401085659.1222008-1-wenst@chromium.org> <2de0cc68-f3d7-4b9c-86d3-105666963fb7@collabora.com>
 <CAGXv+5Hw+13J6eU6X3EPa+Vr4kmyNH5L83Zj2VLqx=_Z+XtOzw@mail.gmail.com>
In-Reply-To: <CAGXv+5Hw+13J6eU6X3EPa+Vr4kmyNH5L83Zj2VLqx=_Z+XtOzw@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 1 Apr 2025 18:39:12 +0800
X-Gm-Features: AQ5f1Jofn6bhSx5kpNoRsfEnci1ZkLDZUqLOYiDj9S7j7E1dOgnZdf4ci23APiY
Message-ID: <CAGXv+5GwbFXo0W3VCkwgouHZTDwqou-i7sQ2zocNchgEYG16fw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: re-enable buffer pre-allocation on some platforms
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-sound@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, treapking@chromium.org, yuanhsinte@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 1, 2025 at 6:38=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> wr=
ote:
>
> On Tue, Apr 1, 2025 at 6:12=E2=80=AFPM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
> >
> > Il 01/04/25 10:56, Chen-Yu Tsai ha scritto:
> > > In commit 32c9c06adb5b ("ASoC: mediatek: disable buffer pre-allocatio=
n")
> > > buffer pre-allocation was disabled to accommodate newer platforms tha=
t
> > > have a limited reserved memory region for the audio frontend.
> > >
> > > Turns out disabling pre-allocation across the board impacts platforms
> > > that don't have this reserved memory region. Buffer allocation failur=
es
> > > have been observed on MT8173 and MT8183 based Chromebooks under low
> > > memory conditions, which results in no audio playback for the user.
> > >
> > > Reinstate the original policy of pre-allocating audio buffers at prob=
e
> > > time on MT8173, MT8183, and MT8186 platforms. These platforms do not
> > > have reserved memory for the audio frontend.
> > >
> > > Fixes: 32c9c06adb5b ("ASoC: mediatek: disable buffer pre-allocation")
> > > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> >
> > Have you tried to add the reserved memory regions to the MT8173/83/86 A=
FE?
>
> I haven't tried it, though I'm fairly certain that would work as well.
>
> > This means not only devicetree but also the driver - that should be sim=
ple
> > enough, and would allow to eventually add a layer of further commonizat=
ion
> > between the AFE PCM drivers of all those MediaTek SoCs.
>
> I think no driver changes are necessary? It's a single memory region,
> so it would automatically be picked by the driver core for all coherent
> DMA allocations.
>
> I picked the driver route because it restores old behavior.

Also because one setting policy in the device tree, while the other
is in the implementation.

>
> ChenYu
>
> > Cheers,
> > Angelo
> >
> > > ---
> > >   sound/soc/mediatek/common/mtk-afe-platform-driver.c | 4 +++-
> > >   sound/soc/mediatek/common/mtk-base-afe.h            | 1 +
> > >   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c          | 1 +
> > >   sound/soc/mediatek/mt8183/mt8183-afe-pcm.c          | 1 +
> > >   sound/soc/mediatek/mt8186/mt8186-afe-pcm.c          | 1 +
> > >   5 files changed, 7 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/sound/soc/mediatek/common/mtk-afe-platform-driver.c b/so=
und/soc/mediatek/common/mtk-afe-platform-driver.c
> > > index 6b6330583941..70fd05d5ff48 100644
> > > --- a/sound/soc/mediatek/common/mtk-afe-platform-driver.c
> > > +++ b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
> > > @@ -120,7 +120,9 @@ int mtk_afe_pcm_new(struct snd_soc_component *com=
ponent,
> > >       struct mtk_base_afe *afe =3D snd_soc_component_get_drvdata(comp=
onent);
> > >
> > >       size =3D afe->mtk_afe_hardware->buffer_bytes_max;
> > > -     snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, afe->de=
v, 0, size);
> > > +     snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, afe->de=
v,
> > > +                                    afe->preallocate_buffers ? size =
: 0,
> > > +                                    size);
> > >
> > >       return 0;
> > >   }
> > > diff --git a/sound/soc/mediatek/common/mtk-base-afe.h b/sound/soc/med=
iatek/common/mtk-base-afe.h
> > > index f51578b6c50a..a406f2e3e7a8 100644
> > > --- a/sound/soc/mediatek/common/mtk-base-afe.h
> > > +++ b/sound/soc/mediatek/common/mtk-base-afe.h
> > > @@ -117,6 +117,7 @@ struct mtk_base_afe {
> > >       struct mtk_base_afe_irq *irqs;
> > >       int irqs_size;
> > >       int memif_32bit_supported;
> > > +     bool preallocate_buffers;
> > >
> > >       struct list_head sub_dais;
> > >       struct snd_soc_dai_driver *dai_drivers;
> > > diff --git a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c b/sound/soc/m=
ediatek/mt8173/mt8173-afe-pcm.c
> > > index 04ed0cfec174..37b20ec80829 100644
> > > --- a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
> > > +++ b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
> > > @@ -1114,6 +1114,7 @@ static int mt8173_afe_pcm_dev_probe(struct plat=
form_device *pdev)
> > >       afe->mtk_afe_hardware =3D &mt8173_afe_hardware;
> > >       afe->memif_fs =3D mt8173_memif_fs;
> > >       afe->irq_fs =3D mt8173_irq_fs;
> > > +     afe->preallocate_buffers =3D true;
> > >
> > >       platform_set_drvdata(pdev, afe);
> > >
> > > diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/m=
ediatek/mt8183/mt8183-afe-pcm.c
> > > index d083b4bf0f95..0ef07fb2898d 100644
> > > --- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
> > > +++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
> > > @@ -1214,6 +1214,7 @@ static int mt8183_afe_pcm_dev_probe(struct plat=
form_device *pdev)
> > >       afe->mtk_afe_hardware =3D &mt8183_afe_hardware;
> > >       afe->memif_fs =3D mt8183_memif_fs;
> > >       afe->irq_fs =3D mt8183_irq_fs;
> > > +     afe->preallocate_buffers =3D true;
> > >
> > >       afe->runtime_resume =3D mt8183_afe_runtime_resume;
> > >       afe->runtime_suspend =3D mt8183_afe_runtime_suspend;
> > > diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c b/sound/soc/m=
ediatek/mt8186/mt8186-afe-pcm.c
> > > index db7c93401bee..c588a68d672d 100644
> > > --- a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
> > > +++ b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
> > > @@ -2935,6 +2935,7 @@ static int mt8186_afe_pcm_dev_probe(struct plat=
form_device *pdev)
> > >       afe->irq_fs =3D mt8186_irq_fs;
> > >       afe->get_dai_fs =3D mt8186_get_dai_fs;
> > >       afe->get_memif_pbuf_size =3D mt8186_get_memif_pbuf_size;
> > > +     afe->preallocate_buffers =3D true;
> > >
> > >       afe->runtime_resume =3D mt8186_afe_runtime_resume;
> > >       afe->runtime_suspend =3D mt8186_afe_runtime_suspend;
> >
> >
