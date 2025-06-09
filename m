Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489C7258CE8
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 13:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749475617; cv=none; b=FLnv6Mx0VWj7TuHh47Op4LgiTTBQLGPd1sSwSVUGyNAiWQfFfVeVcCqKbAp35jOltvpZvdFm+gCz7HDQcRJDo+7NAERqZ6kjL1q2d58NeOdjRIGSd+Tv00i/kUbSGKF3rkZSF8X2Q8WV43bIRUDzfTJjl/CGCz6IHFSXctT0NPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749475617; c=relaxed/simple;
	bh=KsFwIrR3yyZx5H44934iQzkL8sKWbowPXtwXD39xdts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JqY+SR/Ldj/Vr0LCCpdimmEC3+k21C8mfsbhqlgTAswbzEnh4KZ8jg0DU+kmx5CtJ3XWBrDt0kkJu8ln/dCcENrPoxfcCFiQr3FrXgOcNCQFAy24k+LqGOCb69te4zniQk1AEAdexKG8/yikj5GoPqLrbFrIoaEXhDGo4dvgDCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ze1kJeQt; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ze1kJeQt"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e740a09eb00so3200954276.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 06:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749475615; x=1750080415; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mAiRbciuoiorHgM5EFNBfKf1XaHXDRt4R+Ad1zIscbE=;
        b=ze1kJeQt659RsJQI+FVZ9v6fkijd+LulZCFVO+7hsyQ6EJakqjoyJZvKC2RlIhXVQB
         Tv8lLBtD/ZCxI4OgL/1gXkSt09/xyhhlM52frik24Tfpffg+sGo8mF2eMbOqpRkkoy1F
         0x08QCncmXDbFBA1hfe5G7CdGl3oCD9QQrG0lBWFt8Wv1oocNK7DSmaR9t5MM5tErk6B
         xOozEC5f8U9BD75Cw5AP5FwhK2PBWio2l01KzEN2/hIjJj77/BvIGrJakAvzfYQQ1AAS
         dYWlYDIUM5kHwYXBvT9c6pjUvf87obpsgTd7hGAz7s0hMXm3qJQZwtiLhPoOX04vmZNv
         8FKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749475615; x=1750080415;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mAiRbciuoiorHgM5EFNBfKf1XaHXDRt4R+Ad1zIscbE=;
        b=oYbYVqQThhPuDY88M8tXckXbvj6t2W7zBs121Tp4BRPG06EL9ESmif/df/6GwKiPBd
         w3bc0nMefot1U5mJcfu5eP3q9kQjgcMzo0jhR5LDgJ/ktfd+jvy/qYQlxTiJeuySpAaH
         e9+kEDP6pZmKmVRKLW7v6F1ZPFXaqe0+7WLBiYAkRdKcYUk/2UlWkDfPCgRpYW/irvzB
         D1ZgEjCMuYzpw9F11HIUS6iw89omnrtCbHLQb3LXSNmK8Stq1YQ3+sVViWb7stVoZBeI
         /OcgzcpfJQ5aagQluDrf+2BV/oHoWQDqlmvkvVwathZTXHqP4S73tz7BUzd8JWR/7Oci
         E75g==
X-Forwarded-Encrypted: i=1; AJvYcCUaDdCbHLyLq/9EtDcTScX1Sp+/DDKh/zVFlOWxASfgBJZtbCwKaENpylNFVOtb45pKUNjJD0noO1YyDEo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOS22eM/4rRRYHvRXpenXCNXWpVwjQpdnDaDCnzzbX3+eKCbOG
	FPX+ha3ALl6Cwc/5RPFYO0wOc1/bWWjw8Bc2jaQwBogu5S9TaTI81kIZhP979wsUCp2lt9xZG9X
	3wwu6AiM/V8t+g5BIu/d+/ZCu6mxo9F8u+iiwLf1ROw==
X-Gm-Gg: ASbGnctqyVkShuSyR9iNkHDcIR/MMYqcu9NG7SnBn4lEjZf/Mw7mPlg5fTrCB9iMBiW
	3XHfO9tQksjagBr6u3V0OCBvyy7zG+SphgnGD/2fym4WaOPjS0mX+gURUCn3rRpIX+sBjQShxFn
	NTeI5tQkwsVeeNJe7FEtMyC8moN9apvpvDW2GuyTv+vqt/
X-Google-Smtp-Source: AGHT+IEdp4Uo8DXeT5EnMuQJvMNr8+WtEiGeMqcg+uuVjNdRmH13ttSqp1H/4vx3AbsAuwuDP4cRp1d7FkuP24yL/II=
X-Received: by 2002:a05:6902:98f:b0:e7d:7b06:c567 with SMTP id
 3f1490d57ef6-e81a226a49dmr18772294276.8.1749475615295; Mon, 09 Jun 2025
 06:26:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250529104853.1987456-1-alvin.paulp@amd.com>
In-Reply-To: <20250529104853.1987456-1-alvin.paulp@amd.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 9 Jun 2025 15:26:19 +0200
X-Gm-Features: AX0GCFsV0kgRqKk0VesGIpH7txHIuNQCBKwAYohUvjNa9Wq16CR9xgCE78X7Q9Y
Message-ID: <CAPDyKFok6Ftr6OAHpy_qL3S17cecHT9f2tKWagCd+KvVFSmAFA@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: sdhci-of-arasan: Add shutdown callback
To: Paul Alvin <alvin.paulp@amd.com>
Cc: michal.simek@amd.com, adrian.hunter@intel.com, git@amd.com, 
	linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 29 May 2025 at 12:49, Paul Alvin <alvin.paulp@amd.com> wrote:
>
> Implement shutdown hook to suspend host and disable all mmc clocks to
> increase power saving during shutdown or reboot.

So how long is the shutdown process for the platform? What do we really gain?

In general we don't quite care about power-savings during shutdown, as
we are going to turn off things anyway, right?

Kind regards
Uffe

>
> Signed-off-by: Paul Alvin <alvin.paulp@amd.com>
> ---
>
> Changes in v2:
> - Make use of platform suspend instead of driver suspend as driver
>   suspend will only get defined if PMC_SLEEP is configured which
>   results in build failure if it is not configured.
> - Updated commit description.
>
>  drivers/mmc/host/sdhci-of-arasan.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/mmc/host/sdhci-of-arasan.c b/drivers/mmc/host/sdhci-of-arasan.c
> index 8c29676ab662..4abdad3c4e5b 100644
> --- a/drivers/mmc/host/sdhci-of-arasan.c
> +++ b/drivers/mmc/host/sdhci-of-arasan.c
> @@ -2056,6 +2056,11 @@ static void sdhci_arasan_remove(struct platform_device *pdev)
>         clk_disable_unprepare(clk_ahb);
>  }
>
> +static void sdhci_arasan_shutdown(struct platform_device *pdev)
> +{
> +       sdhci_pltfm_suspend(&pdev->dev);
> +}
> +
>  static struct platform_driver sdhci_arasan_driver = {
>         .driver = {
>                 .name = "sdhci-arasan",
> @@ -2065,6 +2070,7 @@ static struct platform_driver sdhci_arasan_driver = {
>         },
>         .probe = sdhci_arasan_probe,
>         .remove = sdhci_arasan_remove,
> +       .shutdown = sdhci_arasan_shutdown,
>  };
>
>  module_platform_driver(sdhci_arasan_driver);
> --
> 2.44.1
>
