Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC10A2E6D04
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 10:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751539178; cv=none; b=nte9gR9k68tYM1M8XWa+wRSNM0tG16YQ/thWkSEaFmXk71LHqNJC3BgdHaYrwPNQ2e/izdVAzbyQuM2TVAoZe/fKyFgDJDusvmprYMmvikD6i2peSkQVZYN1ko4rwNfGLJiUSflpAn5TRzOBK/BAZKFL5v9TTbShoBUc+3NX/J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751539178; c=relaxed/simple;
	bh=bGwLvvH+krpxqZJW/aKT+tTKat2sdRhbvziWM56lIss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QgyGWodNz1csb4umO+rjJJWD8Nf161BefYwWNvBNmZxMw0cjs5BtrOhsGVG/ijMRljCNvc4zzORc+W0em2BoxM1D7HxSoBMy5MD9Q4QVvxnTqiMkEZCyjk8LrkJaxJfUMikxZa8kajTszAVMhvJKQkIp3+0vQxDBjmzNHTfRaus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SpLjYFsI; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SpLjYFsI"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-70e64b430daso59921887b3.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 03:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751539175; x=1752143975; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nbccPWOLMeO5ZiCDV22jEjK7nQ6LCiFcg1Ikp2bgtaE=;
        b=SpLjYFsIeaeLZNe5zWyXHUZeaqfukoxmfm+giFclTMNef1wfyx+KGc4LAlVh9gk5qw
         v52I4la6BBWsmJHTLQRh6UT4ETguXXRj5A0S43LiELwbD9Iz6+AqRH52ifPupBpvzY+r
         XSiN7bmZaCgOsvHGi83o7ZbQuvxi52/Ivn66Tokg4z751pPfhibpiLoiSGfSAHw1ilDf
         zSwtEyveHXKEuFbxe4rCV1JLh1G9JnyOiN6eGxVfqLecRkI90sD2LdbH+4Sac4bT/jLV
         bNqPI+7XbFxrxEVCjBgDMS0EhxUzGIpSlOWG5GIVPcUuqM6tCyZEDsoqk2CEjbsBPmcL
         oDoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751539175; x=1752143975;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nbccPWOLMeO5ZiCDV22jEjK7nQ6LCiFcg1Ikp2bgtaE=;
        b=VJcy9HVBd452hTs7AqzU5osC1kUjQ4IBh/4paWI45qsMMzq23/KHU5IyH+QvWZ5DAP
         5yvP+Txl4lIU9OrGQskXXXFJjBl34gm+gRU07Hl0MW1z5II4r6WfWwbz6GIbhWYXnvSe
         kce6tZtqSOHTN73Giwd1AyCpTSPM74hvfCfsYcW9CGh4JX4ZnzgaF/+uG+riZx/hEUeu
         qkCYASz7OhQHQWQRhWdtI8efk2xokyyGc+5Uy0ES4oV0uxtP9yu2gEyZeqISplEcQLR1
         7dVXy5kxuo18ewg+CL3N0W7z61d47dUd8unaIe/oLm410FY85PMUHqKIG7ERe+LvtARN
         cwSg==
X-Forwarded-Encrypted: i=1; AJvYcCUbM/oMhxEnWD0eTe28KzplgHtzud9kMUZtlRejqHs261lOcftaRuxmu5EZi4nUi96eKw7P/s6NpLlpILw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYoaDBnVXiI/ghIHZ7NBb/qc4gbKplNDxkF7txK5KqBc8qcqny
	tPNTF3L8m1l9mUQVe6o4fR2GcOvXaIwiH4aqZuA+qO9+QxRbCZjPTlo4V5qbPo499TnhRHakzfU
	UfnQJxQDlY/chH2aZWcPOdcsrQqDuPdcak92BdCJTIA==
X-Gm-Gg: ASbGnctZ96ygphk0KaO5JNYfMXGBxRU3UOmYBwIAZ7Bdbd1RX8TT9EzbJhJnvbZ40FD
	GI4fch/BYOQUrDzZN0A4abvEvXn+QIjurhY1iQiGUOh8VsUaSRE6PyWgiLEhxuOH6adNRieV3rS
	Cw63jyvEqPtaujYmGvODYGloduUI653+zPnz2NkpmxMmMiSW4T4VwA8Is=
X-Google-Smtp-Source: AGHT+IF9eVk0FlIbMoHs5RgnCTviyum9RB4oGuI3RQdRmxuzWPhnfbE8XXHvyI2bhvdId129RaE1973qQU974VuN4FY=
X-Received: by 2002:a05:690c:39c:b0:70e:29d2:fb96 with SMTP id
 00721157ae682-7164d4d235emr83418887b3.36.1751539174826; Thu, 03 Jul 2025
 03:39:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620033018.87920-1-lidong@vivo.com>
In-Reply-To: <20250620033018.87920-1-lidong@vivo.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 3 Jul 2025 12:38:58 +0200
X-Gm-Features: Ac12FXwr34opsEKBKvjMq0YQRpajMerqzhzzFcEylaOwubo_bokLxMggyMS1_jE
Message-ID: <CAPDyKFrkjuwU5b2-26LLWJ9gWduvXa9SOZ5j1+ndk1n5grXHVA@mail.gmail.com>
Subject: Re: [PATCH v1] mmc: Convert ternary operator to str_write_read() helper
To: Li Dong <lidong@vivo.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	"open list:MULTIMEDIA CARD (MMC), SECURE DIGITAL (SD) AND..." <linux-mmc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	opensource.kernel@vivo.com, luhongfei@vivo.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 20 Jun 2025 at 05:30, Li Dong <lidong@vivo.com> wrote:
>
> Replace direct ternary condition check with existing helper function
> str_write_read() to improve code readability and maintain consistency.

The below tells me there are more cases than mmc_spi. Please re-spin
and take care of all in one patch for the mmc subsystem.

git grep "\"write\"" drivers/mmc

Kind regards
Uffe

>
> Signed-off-by: Li Dong <lidong@vivo.com>
> ---
>  drivers/mmc/host/mmc_spi.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/mmc_spi.c b/drivers/mmc/host/mmc_spi.c
> index 47443fb5eb33..0a1098140dc0 100644
> --- a/drivers/mmc/host/mmc_spi.c
> +++ b/drivers/mmc/host/mmc_spi.c
> @@ -27,6 +27,7 @@
>  #include <linux/spi/mmc_spi.h>
>
>  #include <linux/unaligned.h>
> +#include <linux/string_choices.h>
>
>
>  /* NOTES:
> @@ -774,7 +775,7 @@ mmc_spi_data_do(struct mmc_spi_host *host, struct mmc_command *cmd,
>         unsigned                n_sg;
>         bool                    multiple = (data->blocks > 1);
>         bool                    write = (data->flags & MMC_DATA_WRITE);
> -       const char              *write_or_read = write ? "write" : "read";
> +       const char              *write_or_read = str_write_read(write);
>         u32                     clock_rate;
>         unsigned long           timeout;
>
> --
> 2.34.1
>
