Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54821E521F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 10:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743503923; cv=none; b=qCwMEgRo1rtx23OSMPHpy/aWb6RTYvPyS547zCwNIcRAXXs9fqal12MP1hwuv5+CJxnzR7EDGWH3DmHymDId8xRLxnnu3A0ixSb15pVwA+r3pS7CeJ8vwk7/iiBIzytPs2DHy0QIr2J03vZXt7Nh2udEuTB+jSV212cOspaiKPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743503923; c=relaxed/simple;
	bh=rx5U4Jsgee7SIwQm3aNh69dwRb7hBlysDqEA979LxAA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HqOwxb3Hizpo/cHroa5i+Qz6TaMVsV2xJp3eXBIAnAHe+GZwUwO5J199m9wOpNZE1vW9LDJYYqTBULlz5Olh/iiwW3l0p94hhhjqoG56Sfobvv44MRDuk//JnlcpPxhdnycrIArYyhZlivZu8czoJvhwt8+Hbx1nQ4W5+RfjQ1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HxwWE1Fi; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HxwWE1Fi"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5499c5d9691so5709015e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 03:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743503920; x=1744108720; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6P6SMD/bKhjEujLUGf61mWQXWZIRCeLismurG+acV7Y=;
        b=HxwWE1FiH2C6BoIt16r3cd4Pl7/Y3xqzT3qMNtfJ36nlaROBdBwIAuFlyLK9wRgOmT
         KBG3EPbq0C/JgEf1ZzZUciPJoEVJzQh6tX1Wi7nlaD78tEXnqYdNJzA/fTMHDZxdrSPZ
         KM5ePMQ//9Soh8ybyblKfVUPi+jOA1aaD+syc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743503920; x=1744108720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6P6SMD/bKhjEujLUGf61mWQXWZIRCeLismurG+acV7Y=;
        b=wqqwPuRLD6BxmsY91OAxzPbib/isnJzGRGAXsqdppgFn4mka3lnIA4DiEWU51I7GtO
         QxizdcrC7NjQLQdk7fB4MTYIAI0BEh1Jb/iIzO+cqo9VW0Th4pAdXq97YdHvYoX+EsWo
         TAf+0j/DMVQfQYlTrYf2ve/HtR5fDmLD4/nu1m4mGyvYRKNz92IzxBI2o032NW+Re3gR
         ABcv/KIcdQsqeoBq4PmPMw5XTlDe/RhBpZ/Xfy7O19ZQA+Boyi+S0eRVS14Io4hp4tQ6
         NSo1f/IsALW5Yomuosday1KITtbOB2QVJtMjMU2OPV7223KwnkzPODbfDm25NCx67vNv
         ClqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMigYPGFo57X5mzZlPKjLH3iaXWipfnXCh5mI45LcASsMmsIYpcolCucdf3xjbxvJBXtlsTX/PgdeMvNU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNmwxvBB6GEeo9PrytOgJyMYbZgp5YtITXDPVkS2KP1SCl6UP4
	fq3+8W/fcTQG8wCSl3YZYCYr0sMVRr7rGckH6gjmha1CYGkJzGs8+SxrzvoxR4HfZqWmSv4iLS1
	d/0F54Lb+MaG4KwXozLeaYhOSqXgsuY+Ut3VK
X-Gm-Gg: ASbGncuuFpF/59pd0zPjnLJeBpibguAcAOFYIrpGlpo4hF9Xr0CPCC/VgT4GD3kT63K
	CEhJ1UFW00Q3vOmM53w5r6f7zxBFIHl66k9z12jsjHAKT1fX7pr1u66XhXw3PIpFpzkfYsmPJsh
	kUzboWnQRP0BeAWmcTGuCup0oC/LMWwjvc0RcmPrWLTEfTjTr4yO9jew==
X-Google-Smtp-Source: AGHT+IFqb50D2XU09Hg1uqN245vHYLHlnocBE1aPtPJ4+hrmspphH1HPpdjvdi8L1C0+N760QbNY2I46IYB3Jv1diC4=
X-Received: by 2002:a05:6512:12c4:b0:549:4e79:dd5f with SMTP id
 2adb3069b0e04-54b11011803mr3105755e87.37.1743503919726; Tue, 01 Apr 2025
 03:38:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401085659.1222008-1-wenst@chromium.org> <2de0cc68-f3d7-4b9c-86d3-105666963fb7@collabora.com>
In-Reply-To: <2de0cc68-f3d7-4b9c-86d3-105666963fb7@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 1 Apr 2025 18:38:28 +0800
X-Gm-Features: AQ5f1JrCHXHKf9Nj2VGAr7AcO-rnH97YDI2A2evb14saP9NqEu9tQ2fTUEE_3nA
Message-ID: <CAGXv+5Hw+13J6eU6X3EPa+Vr4kmyNH5L83Zj2VLqx=_Z+XtOzw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: re-enable buffer pre-allocation on some platforms
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-sound@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, treapking@chromium.org, yuanhsinte@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 1, 2025 at 6:12=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 01/04/25 10:56, Chen-Yu Tsai ha scritto:
> > In commit 32c9c06adb5b ("ASoC: mediatek: disable buffer pre-allocation"=
)
> > buffer pre-allocation was disabled to accommodate newer platforms that
> > have a limited reserved memory region for the audio frontend.
> >
> > Turns out disabling pre-allocation across the board impacts platforms
> > that don't have this reserved memory region. Buffer allocation failures
> > have been observed on MT8173 and MT8183 based Chromebooks under low
> > memory conditions, which results in no audio playback for the user.
> >
> > Reinstate the original policy of pre-allocating audio buffers at probe
> > time on MT8173, MT8183, and MT8186 platforms. These platforms do not
> > have reserved memory for the audio frontend.
> >
> > Fixes: 32c9c06adb5b ("ASoC: mediatek: disable buffer pre-allocation")
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>
> Have you tried to add the reserved memory regions to the MT8173/83/86 AFE=
?

I haven't tried it, though I'm fairly certain that would work as well.

> This means not only devicetree but also the driver - that should be simpl=
e
> enough, and would allow to eventually add a layer of further commonizatio=
n
> between the AFE PCM drivers of all those MediaTek SoCs.

I think no driver changes are necessary? It's a single memory region,
so it would automatically be picked by the driver core for all coherent
DMA allocations.

I picked the driver route because it restores old behavior.


ChenYu

> Cheers,
> Angelo
>
> > ---
> >   sound/soc/mediatek/common/mtk-afe-platform-driver.c | 4 +++-
> >   sound/soc/mediatek/common/mtk-base-afe.h            | 1 +
> >   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c          | 1 +
> >   sound/soc/mediatek/mt8183/mt8183-afe-pcm.c          | 1 +
> >   sound/soc/mediatek/mt8186/mt8186-afe-pcm.c          | 1 +
> >   5 files changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/sound/soc/mediatek/common/mtk-afe-platform-driver.c b/soun=
d/soc/mediatek/common/mtk-afe-platform-driver.c
> > index 6b6330583941..70fd05d5ff48 100644
> > --- a/sound/soc/mediatek/common/mtk-afe-platform-driver.c
> > +++ b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
> > @@ -120,7 +120,9 @@ int mtk_afe_pcm_new(struct snd_soc_component *compo=
nent,
> >       struct mtk_base_afe *afe =3D snd_soc_component_get_drvdata(compon=
ent);
> >
> >       size =3D afe->mtk_afe_hardware->buffer_bytes_max;
> > -     snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, afe->dev,=
 0, size);
> > +     snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, afe->dev,
> > +                                    afe->preallocate_buffers ? size : =
0,
> > +                                    size);
> >
> >       return 0;
> >   }
> > diff --git a/sound/soc/mediatek/common/mtk-base-afe.h b/sound/soc/media=
tek/common/mtk-base-afe.h
> > index f51578b6c50a..a406f2e3e7a8 100644
> > --- a/sound/soc/mediatek/common/mtk-base-afe.h
> > +++ b/sound/soc/mediatek/common/mtk-base-afe.h
> > @@ -117,6 +117,7 @@ struct mtk_base_afe {
> >       struct mtk_base_afe_irq *irqs;
> >       int irqs_size;
> >       int memif_32bit_supported;
> > +     bool preallocate_buffers;
> >
> >       struct list_head sub_dais;
> >       struct snd_soc_dai_driver *dai_drivers;
> > diff --git a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c b/sound/soc/med=
iatek/mt8173/mt8173-afe-pcm.c
> > index 04ed0cfec174..37b20ec80829 100644
> > --- a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
> > +++ b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
> > @@ -1114,6 +1114,7 @@ static int mt8173_afe_pcm_dev_probe(struct platfo=
rm_device *pdev)
> >       afe->mtk_afe_hardware =3D &mt8173_afe_hardware;
> >       afe->memif_fs =3D mt8173_memif_fs;
> >       afe->irq_fs =3D mt8173_irq_fs;
> > +     afe->preallocate_buffers =3D true;
> >
> >       platform_set_drvdata(pdev, afe);
> >
> > diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/med=
iatek/mt8183/mt8183-afe-pcm.c
> > index d083b4bf0f95..0ef07fb2898d 100644
> > --- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
> > +++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
> > @@ -1214,6 +1214,7 @@ static int mt8183_afe_pcm_dev_probe(struct platfo=
rm_device *pdev)
> >       afe->mtk_afe_hardware =3D &mt8183_afe_hardware;
> >       afe->memif_fs =3D mt8183_memif_fs;
> >       afe->irq_fs =3D mt8183_irq_fs;
> > +     afe->preallocate_buffers =3D true;
> >
> >       afe->runtime_resume =3D mt8183_afe_runtime_resume;
> >       afe->runtime_suspend =3D mt8183_afe_runtime_suspend;
> > diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c b/sound/soc/med=
iatek/mt8186/mt8186-afe-pcm.c
> > index db7c93401bee..c588a68d672d 100644
> > --- a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
> > +++ b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
> > @@ -2935,6 +2935,7 @@ static int mt8186_afe_pcm_dev_probe(struct platfo=
rm_device *pdev)
> >       afe->irq_fs =3D mt8186_irq_fs;
> >       afe->get_dai_fs =3D mt8186_get_dai_fs;
> >       afe->get_memif_pbuf_size =3D mt8186_get_memif_pbuf_size;
> > +     afe->preallocate_buffers =3D true;
> >
> >       afe->runtime_resume =3D mt8186_afe_runtime_resume;
> >       afe->runtime_suspend =3D mt8186_afe_runtime_suspend;
>
>
