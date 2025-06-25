Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADB4260567
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 12:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750855590; cv=none; b=h4Ydyj90fCP/LfUjPYYnnnVzzhH04EkkCmvh8VBhLdurKIQDhbCHGD2SytT2LDz6zX3vqpzcejqaW22/GTMKd80j/opKmqdlTPRkO26Ntat5HRBFXpjP/+Fz+QfzRQdCSGftjzTBousLh71qXZHzRAzD/k59JEPi8yjjMJ0zmG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750855590; c=relaxed/simple;
	bh=uKe/lXCPQGq24nA7rp+Toa7FOiyyQGSx6ZJ25/LXCwI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nxWurv/ktYKs3miMVgFJnx4Wc2F+bwGEKFgGRvSRVuHhOjlMFZaBJqbQAblQuRaAibUWT9J1fAwM6gAhbjmtcurKstWhlZ4L0KmB83vqNUUxO265PgQmOrqLKy0US2VYAbb4pv1t8N3lFBKa5QnlT/X4v1C0EMq+QcL7deK85Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=geo7a+Ck; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="geo7a+Ck"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e81cf6103a6so5889360276.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 05:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750855588; x=1751460388; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aj4jAhuCkHLc0MKXkhpZy35x/RLjZn6KIWkW8s4y+Y4=;
        b=geo7a+CksCTvrATNZg1AGdKiEW35SDXnVT4fwqM44cWUMCepSvW3RAU6+2D0e8QpKp
         yj7VgE+MoiLEP3evL6AWgczsHFwdGSAZHNSddn2GB2UPUg2AwFebSN7mNE+8wgWuJsrb
         RzUPP6MfEWL1w7U+ol9D376ePUHI4Je63Re4BG5U5zNNSYf3Fg+P/ws+9yq/a9P9+UMT
         mOhQQMnkxEf+pKDilFNtObRabkCseSdMZmFNXFyhkJWXU/hZMPPp05f3ysCb7X4j6t3h
         C0Zr7VNwX95BmmNKnR6a7f1Zndm5XeRCN3sOnghtkh9sjZrPJ3BBu9fY16ACTq3+okMr
         vlBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750855588; x=1751460388;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aj4jAhuCkHLc0MKXkhpZy35x/RLjZn6KIWkW8s4y+Y4=;
        b=HZrYHHADB3FVDmAwDFVFFTj+c1t1p3SvGYkeKWA/3kcMOYpg1/uM95EDkZVUzgcyRL
         ig7xasV6lk5t0BeNGJlW1p71Gy7jwDn1iPu2DnkznxxbzcLthrbd0D5Q2orx+F66yfoO
         tGykcCNxbeGydfxiBkoaXORbSZEtOrJk5IsknWtJlC+bozLpgmhln7RMzdQBHUGB+cOv
         Y7PVYAXyJlvq+cZ71JAUFPGIHmDQTsNJTq3Th7qZWcQP8+u4FX7y8kqW0f73oYwkgPCI
         McT7ZkDOCvGXcusgcjw1WBElcs09fRhXP28MYB1jtpsN/LHWqErWRJrBH3DjKi+l7NUe
         hELQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxfSucHX9G6twzDyd+vKHKjbFMHISfzdW3r9lcBlUDo/oJrpzPBacBZ2+mjo7TwAxMmEJzLMLEJ3plrbo=@vger.kernel.org
X-Gm-Message-State: AOJu0YytJBuxaRFvw61T2Q93Q3IosT3JWy0cL7xD0F66rLI9zOh6J6YR
	igBrPga6XghGfPupZ/Hs0AgxGXPbP0vJIDy7SSxDvBxnvNvfVRvoXKmjbnpCJjh8lJLuLHgCV8B
	ZQDPyVLS8+jDcJJHfQxDixqaZcbJ7G+RLu0UOnrxIWA==
X-Gm-Gg: ASbGnct9Eyv9IUmxDyKzZDCvEf6YEdkm4Glv9AzZXcS2B3fVSEdDITJDRMVDDOIEAyX
	6dJXQtaf5TH016HjTOABtlJvuSJjMn+MBmex6ZfgxR8jqgsgJL33DPDBrNrtBisR0BUYbX4SOoi
	dBkQzSE0VwK55Q81jj64Ob1AtZjSGbsDrFzt6b0VwbpAA=
X-Google-Smtp-Source: AGHT+IHuqbs3+ZWuZkWAAPqD4OwhWYQ4/+DMgIxw4fLXOlRsaFo0LQlpSx2p1DV+41IMvrV599rDMZdlt1nY1Sc/mtw=
X-Received: by 2002:a05:6902:2782:b0:e84:2cbd:3212 with SMTP id
 3f1490d57ef6-e86018cf6afmr3027295276.20.1750855588294; Wed, 25 Jun 2025
 05:46:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <174972756982.3337526.6755001617701603082.stgit@mhiramat.tok.corp.google.com>
 <20250625052106.584905-1-senozhatsky@chromium.org>
In-Reply-To: <20250625052106.584905-1-senozhatsky@chromium.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 25 Jun 2025 14:45:52 +0200
X-Gm-Features: Ac12FXwFOrEcUFEsusjn1MoQ84IvAh5xPRaGYt6omrx5SZ03KEKKj6Opk4VwAGk
Message-ID: <CAPDyKFoYgi3bauUQ8xrc+0KtwmmXi9jNNzcOt_fmyP2pFQ9Jbw@mail.gmail.com>
Subject: Re: [PATCH] mtk-sd: reset host->mrq on prepare_data() error
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Tomasz Figa <tfiga@chromium.org>, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 25 Jun 2025 at 07:21, Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> Do not leave host with dangling ->mrq pointer if we hit
> the msdc_prepare_data() error out path.
>
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>

Applied for fixes, thanks!

Kind regards
Uffe

> ---
>  drivers/mmc/host/mtk-sd.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index b12cfb9a5e5f..d7020e06dd55 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -1492,6 +1492,7 @@ static void msdc_ops_request(struct mmc_host *mmc, struct mmc_request *mrq)
>         if (mrq->data) {
>                 msdc_prepare_data(host, mrq->data);
>                 if (!msdc_data_prepared(mrq->data)) {
> +                       host->mrq = NULL;
>                         /*
>                          * Failed to prepare DMA area, fail fast before
>                          * starting any commands.
> --
> 2.50.0.714.g196bf9f422-goog
>
