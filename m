Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F02A21ABDE
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 15:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743435372; cv=none; b=AZPnPrrF1+3zEFvpXUO8eu558WUb9R1Uxk6dAQmtXa280CXtYc79EwOPgFivNhrhpXJiZemtlvKz5ozjLZsWTlM8Y85KngGkByZ796ZpLaTBx5B0IYjxhVQsY/ZcLMovJ33UBVdcLtYf6PD0d90sxiyoU/F3m6rYkOI4oKcdE+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743435372; c=relaxed/simple;
	bh=gr2i7ElkViQia/0pNOSKmak0K4CKCzxZlnH5gwwO/GU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LtmwFYRzbSXzbHE3VjHRMuVLUSC+NELkFM3VEdotEfGsdLhIkqB5bza6PnQdh2CdK7G7ZDjQCIoin+a2G5cioRKZOCMkEdonDgon8qwLaoBl3ZP1LHzCus1gbg6oORbGqemNjnrSo5owzf7+vo3Q/ERr+S6zrDYhbcGjtd2WHbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PX1oQUDP; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PX1oQUDP"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so52240155e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 08:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743435369; x=1744040169; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5ywrICBipCo3D98Pb8idqM4gJmh0ImUQe88U+5Mvgaw=;
        b=PX1oQUDPjYNPIx1lUJRY5RR3HGQDlhE/6x/X3g/V4uRSkwkKlzFmB+fk/g/cvXGH/O
         UqUKDVawcc6BDJD5AP0Ns6MCsHo+qs49ds7VgIXEPJfmtPVAhnND1iEf38xmI5CvIgE2
         YbzHkif3PkRXVLkSXma4slVPqRzthAj/A2mY0kb/NevHDXuS7CszJkGGiAFl4gP41Ehs
         He7dAYnUT6HUiG/w5D0CvyLj1r0nCCuu6KTShJm/cXI8/sOHR9+JqBYkfobaIwn0HTv0
         DmSM8p6pF4Tjs5oL4DS+Lhn/E9DxkGwD2FEhkuvBGxR8UPS5C554UctqyEN8qSugjJxQ
         cfaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743435369; x=1744040169;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ywrICBipCo3D98Pb8idqM4gJmh0ImUQe88U+5Mvgaw=;
        b=FxYkriuOH8Z6F/qceZ6WjC6nZTGCTrFiTyipG+/A+auF8NhBOgWJbDN5UCegYaSVIR
         GbEpJgSrfThkUI46mmYRfARYUYiQzg3oh0Tb8UpU045JSL9or6LYrDdLx6rmVMmJCuAt
         ocpnwJGqHaAkg6d3ZIRIYqCozkjtWeW0y2/SrWBJiinDo4Q1fcPjN3tGB4a270eT35UJ
         RBDzz5bZm+i5BpvekQyHD35w3DRrYIcT4f8u1FQ1Z0ZkCCpMD/7xrvTd/c4839mAZM3k
         6IeRZynaLOH1cpB8u6lcz6k1tM1TCF8JvNwKa971jSqH2tHAsZn7t7Gh4I5IU+/Akahw
         Eraw==
X-Forwarded-Encrypted: i=1; AJvYcCVgSSlG+CazG4CKSsXZltRiOyz+Eh6BiklgsYJhmVQPGE117nKnaAUOVK//IyiySLN795HA3ctn/w4AYO4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJvXNUOhkLOInLQ5htbAeheEbOmewzmUh/U6ZEWBSBF3UdaXjG
	PcfFhy8AAutQ6K2sDrS4TeiZBoZiTiZzPIiir2KbxfAfCNt5FofdZIDkVLaxIihMBBh6KCwvq52
	LEwjYmnkC5yVy+kP+50MexDkjJPPgWQKGvxeHcMj6ia4p+Kqbzu/ilw==
X-Gm-Gg: ASbGnctpTaLuF0L4DyodqLVYOf9/zW9KFSoIBkveXAZ87Y58d7LRZKRRT+14nbAgYUw
	khWdhA7Zh87HMTTVWJbqPicqUntyYlBJqgSHhdBdWZ3x+0ik91rXQxoOzrM9GI6V7ECu4GnK0uL
	GLREARJ6xDWt/aAaliQSZWAF1T1/H0
X-Google-Smtp-Source: AGHT+IFh6+GM0IlcpIWBwIQonGGQpesbhVlKLCa6o8H68xAK6yvnnZx2ARkalCWY/48oTB3ma91dmfr1kqQk/SHjFFE=
X-Received: by 2002:a05:600c:4fc8:b0:43d:9f2:6274 with SMTP id
 5b1f17b1804b1-43db6248ff6mr92802865e9.14.1743435368685; Mon, 31 Mar 2025
 08:36:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250314174800.10142-1-srinivas.kandagatla@linaro.org> <20250314174800.10142-4-srinivas.kandagatla@linaro.org>
In-Reply-To: <20250314174800.10142-4-srinivas.kandagatla@linaro.org>
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Mon, 31 Mar 2025 17:35:57 +0200
X-Gm-Features: AQ5f1Jr5r8kzu92uTPWXhQdvRpNmkEoxDzeY_UvzmL6qGDeAb3ny2uTxjO8tcRE
Message-ID: <CACr-zFBgQsiO=EVD-sCyvQHonbRLS+7J=q+Y8WNbwSPkF_5kug@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] ASoC: q6apm-dai: make use of q6apm_get_hw_pointer
To: srinivas.kandagatla@linaro.org
Cc: broonie@kernel.org, perex@perex.cz, tiwai@suse.com, 
	krzysztof.kozlowski@linaro.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dmitry.baryshkov@linaro.org, johan+linaro@kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Srini,

On Fri, 14 Mar 2025 at 18:49, <srinivas.kandagatla@linaro.org> wrote:
>
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>
> With the existing code, the buffer position is only reset in pointer
> callback, which leaves the possiblity of it going over the size of
> buffer size and reporting incorrect position to userspace.
>
> Without this patch, its possible to see errors like:
> snd-x1e80100 sound: invalid position: pcmC0D0p:0, pos = 12288, buffer size = 12288, period size = 1536
> snd-x1e80100 sound: invalid position: pcmC0D0p:0, pos = 12288, buffer size = 12288, period size = 1536
>
> Fixes: 9b4fe0f1cd79 ("ASoC: qdsp6: audioreach: add q6apm-dai support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Tested-by: Johan Hovold <johan+linaro@kernel.org>

Seems like I missed adding my T-b to this patch. If it's not too late,
please add:

Tested-by: Christopher Obbard <christopher.obbard@linaro.org>

> ---
>  sound/soc/qcom/qdsp6/q6apm-dai.c | 23 ++++-------------------
>  1 file changed, 4 insertions(+), 19 deletions(-)
>
> diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
> index 9d8e8e37c6de..90cb24947f31 100644
> --- a/sound/soc/qcom/qdsp6/q6apm-dai.c
> +++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
> @@ -64,7 +64,6 @@ struct q6apm_dai_rtd {
>         phys_addr_t phys;
>         unsigned int pcm_size;
>         unsigned int pcm_count;
> -       unsigned int pos;       /* Buffer position */
>         unsigned int periods;
>         unsigned int bytes_sent;
>         unsigned int bytes_received;
> @@ -124,23 +123,16 @@ static void event_handler(uint32_t opcode, uint32_t token, void *payload, void *
>  {
>         struct q6apm_dai_rtd *prtd = priv;
>         struct snd_pcm_substream *substream = prtd->substream;
> -       unsigned long flags;
>
>         switch (opcode) {
>         case APM_CLIENT_EVENT_CMD_EOS_DONE:
>                 prtd->state = Q6APM_STREAM_STOPPED;
>                 break;
>         case APM_CLIENT_EVENT_DATA_WRITE_DONE:
> -               spin_lock_irqsave(&prtd->lock, flags);
> -               prtd->pos += prtd->pcm_count;
> -               spin_unlock_irqrestore(&prtd->lock, flags);
>                 snd_pcm_period_elapsed(substream);
>
>                 break;
>         case APM_CLIENT_EVENT_DATA_READ_DONE:
> -               spin_lock_irqsave(&prtd->lock, flags);
> -               prtd->pos += prtd->pcm_count;
> -               spin_unlock_irqrestore(&prtd->lock, flags);
>                 snd_pcm_period_elapsed(substream);
>                 if (prtd->state == Q6APM_STREAM_RUNNING)
>                         q6apm_read(prtd->graph);
> @@ -247,7 +239,6 @@ static int q6apm_dai_prepare(struct snd_soc_component *component,
>         }
>
>         prtd->pcm_count = snd_pcm_lib_period_bytes(substream);
> -       prtd->pos = 0;
>         /* rate and channels are sent to audio driver */
>         ret = q6apm_graph_media_format_shmem(prtd->graph, &cfg);
>         if (ret < 0) {
> @@ -445,16 +436,12 @@ static snd_pcm_uframes_t q6apm_dai_pointer(struct snd_soc_component *component,
>         struct snd_pcm_runtime *runtime = substream->runtime;
>         struct q6apm_dai_rtd *prtd = runtime->private_data;
>         snd_pcm_uframes_t ptr;
> -       unsigned long flags;
>
> -       spin_lock_irqsave(&prtd->lock, flags);
> -       if (prtd->pos == prtd->pcm_size)
> -               prtd->pos = 0;
> -
> -       ptr =  bytes_to_frames(runtime, prtd->pos);
> -       spin_unlock_irqrestore(&prtd->lock, flags);
> +       ptr = q6apm_get_hw_pointer(prtd->graph, substream->stream) * runtime->period_size;
> +       if (ptr)
> +               return ptr - 1;
>
> -       return ptr;
> +       return 0;
>  }
>
>  static int q6apm_dai_hw_params(struct snd_soc_component *component,
> @@ -669,8 +656,6 @@ static int q6apm_dai_compr_set_params(struct snd_soc_component *component,
>         prtd->pcm_size = runtime->fragments * runtime->fragment_size;
>         prtd->bits_per_sample = 16;
>
> -       prtd->pos = 0;
> -
>         if (prtd->next_track != true) {
>                 memcpy(&prtd->codec, codec, sizeof(*codec));
>
> --
> 2.39.5
>
>
