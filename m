Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE501D5176
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 13:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738590595; cv=none; b=QqrtfN67hlw9JtTjdihs9BCAzz1HFMq2OmSC0GGbHKtSuNIcqBlbx1Sc0DwGPVQv29LYdLAlkCfPFJu75LaIgcoA7ZWrzsT3NZtxurmAODEAYkUkbXCbKmmEnrr4lTGiLnWKvJG+1G/uPxsT8Ym3PCGYvgYy6I28Mm3yZrcshmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738590595; c=relaxed/simple;
	bh=OMneIbJtN3JepqshIapxhdqlKUSdQ4wLnI8CFiRi39k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=th1nnq+y142xy7H0ZMGWvvkrFTCNzb9OP8f2PROZwJH8g9G/qYcN+zmFOFHu4mSWet5Vi/TZmThbOOnSZnqXMRseJZpnQ6UHM5HTY7k+vMme9+3oqhYFucwCfRhhsDjZfA9XqUGLLZkbX+8B5j1MdhFyNqehnvQt9lme/U76wso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yUlTJo1j; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yUlTJo1j"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e5afeb2acecso816066276.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 05:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738590593; x=1739195393; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xwSJmHx6P+rMD6RxP3/JhseAAuf/cHx7WPYGkJ10+9E=;
        b=yUlTJo1jm1BavXhZ0OEhzL/d0R/oZxXNhL9ctglo/m1hJouQ6DrWQY9ywGi/bwKPo4
         nGeKiU8A9/AE84Nq6lh1R+GAXKoEt+sMyU0K1TJEJtFgk6DYucUvxowQsZMt40IlShHv
         Xa1DcSYCt0RTvhPMNnvNpTlMtjnNKBctcf+ly+u7TBMpRkpGpJtUGoPbD1dVmSMiJdUA
         U8MOSVqfFMZa/nh0IbC5AP31P8JAsIGkw2vx+oC1e+yAADqat4J1djPVfdyeTJ1a9mik
         liuhShSD8fbUcOGIH0c7Gi7g89OA2dLomZyFuQAf0yZK0J+Xgp4I/F+pG7Cob8jldFGV
         KkpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738590593; x=1739195393;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xwSJmHx6P+rMD6RxP3/JhseAAuf/cHx7WPYGkJ10+9E=;
        b=rAwPuA0yaThIivsSF21oN8KaTuhdlWqmeKmQNx1PJjGDkdo65tWmJtLMF5/cgQNsW6
         bYGXrisdPkv2m71F9OZbDUH0a+87aGpf7flhmjUnEWeIJl1CJywv1ofndtgU0C3U9bqy
         gJzomRnW/Wn/haJDagxHmbrnbyYLmVmNYYwQvBGUaVHw6x/OQ+ULDv2yWxXEWqKA5KUD
         ZWtIO1YSedx96oaGLtN6k/c0/0x5c9vAx7SmbRfpYE9mel8sdTIP2ow1AQKpuX/Fwdg5
         PUc6W3/3xd8WR/ll4ir+JhJDEgqMBnsxUJMvYoMZCWR/p/cgPHQ5aj9MTOuoltiA1lGJ
         +nZA==
X-Gm-Message-State: AOJu0Ywp+JVoG9wC/ZKGNC0NKEwCbm1+aTbwuoAlavhbp1RCfUOEh9HJ
	4CoHJjzWwI/9BkCmhl3N5H7aYA2gAectaV/Qnp4oyBcpJ2qkDtSs1HpwJPHiHte3Eau0WBnbMoj
	Gnz52PYPAOp1c9FSu0ZzVnsECSM9JuZY9kOlfRg==
X-Gm-Gg: ASbGncty57yn8Y9wKDLDNirIS3GaRXJ0ssiT4jRqEi8ATVWPT7e9OaleeBLV3ploHYF
	ujlW32e5hHX++thQSUzCDPfEdgweq+ANL4L6X+6GJUXTfh7izNL5obMw2tjR9IGqSCDIWm0QKhg
	==
X-Google-Smtp-Source: AGHT+IGRrUGdfzC94muI+2V/wVBT3fz/YRByVEQs+BTutk4DS3YGIjwshGg4biCOkTb8kfbTM8xIsmSQAUYgpgDWQUk=
X-Received: by 2002:a05:6902:27c7:b0:e54:d63a:911c with SMTP id
 3f1490d57ef6-e5ac88e5a09mr14876073276.10.1738590592938; Mon, 03 Feb 2025
 05:49:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250127223654.290904-1-erick.shepherd@ni.com> <20250127223654.290904-2-erick.shepherd@ni.com>
In-Reply-To: <20250127223654.290904-2-erick.shepherd@ni.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 3 Feb 2025 14:49:17 +0100
X-Gm-Features: AWEUYZmGYi0SLIcXBc-UKrgCIvbWzfijse9lXC6ZFq2emMgPsHTojtfuZg3kCKM
Message-ID: <CAPDyKForwTcjEaP4n56zw_VsvmZ=cZZ5BgauL1v_-MnP4En=TQ@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] mmc: Allow tuning to be skipped during card init
To: Erick Shepherd <erick.shepherd@ni.com>
Cc: linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, york.yang@csr.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Jan 2025 at 23:41, Erick Shepherd <erick.shepherd@ni.com> wrote:
>
> Add a new field to the mmc_host struct to track when the card should
> skip the initial tuning and use it to conditionally stop tuning in the
> mmc_sd_init_uhs_card function. Currently the new field only gets set
> when a DDR50 card fails to tune, which indicates the card does not
> support tuning.
>
> Signed-off-by: Erick Shepherd <erick.shepherd@ni.com>
> ---
>  drivers/mmc/core/sd.c    | 4 +++-
>  include/linux/mmc/host.h | 1 +
>  2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/core/sd.c b/drivers/mmc/core/sd.c
> index cc757b850e79..353715fd8f53 100644
> --- a/drivers/mmc/core/sd.c
> +++ b/drivers/mmc/core/sd.c
> @@ -663,7 +663,8 @@ static int mmc_sd_init_uhs_card(struct mmc_card *card)
>         if (!mmc_host_is_spi(card->host) &&
>                 (card->host->ios.timing == MMC_TIMING_UHS_SDR50 ||
>                  card->host->ios.timing == MMC_TIMING_UHS_DDR50 ||
> -                card->host->ios.timing == MMC_TIMING_UHS_SDR104)) {
> +                card->host->ios.timing == MMC_TIMING_UHS_SDR104) &&
> +               !card->host->skip_init_tune) {
>                 err = mmc_execute_tuning(card);
>
>                 /*
> @@ -676,6 +677,7 @@ static int mmc_sd_init_uhs_card(struct mmc_card *card)
>                 if (err && card->host->ios.timing == MMC_TIMING_UHS_DDR50) {
>                         pr_warn("%s: ddr50 tuning failed\n",
>                                 mmc_hostname(card->host));
> +                       card->host->skip_init_tune = 1;

Rather than adding a host specific flag to let the core signal to the
host driver that it should skip tuning, I think it would be better if
we can avoid the core to request a tuning instead.

So we need to get the information from the host, during the first
tuning attempt if it fails and then the tuning should be disabled for
the *card*, forever.

>                         err = 0;
>                 }
>         }
> diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
> index 68f09a955a90..91c4db6837c9 100644
> --- a/include/linux/mmc/host.h
> +++ b/include/linux/mmc/host.h
> @@ -486,6 +486,7 @@ struct mmc_host {
>         unsigned int            use_spi_crc:1;
>         unsigned int            claimed:1;      /* host exclusively claimed */
>         unsigned int            doing_init_tune:1; /* initial tuning in progress */
> +       unsigned int            skip_init_tune:1;       /* skip the initial tuning */
>         unsigned int            can_retune:1;   /* re-tuning can be used */
>         unsigned int            doing_retune:1; /* re-tuning in progress */
>         unsigned int            retune_now:1;   /* do re-tuning at next req */
> --
> 2.43.0
>

Again, please re-submit and loop in Adrian to get his opinion on this.

Kind regards
Uffe
