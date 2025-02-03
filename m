Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD1B201026
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 13:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738590191; cv=none; b=SRcJW2hygfAkiEaQfNI4uSXo5rfbUKl6WTVTtGDTIUiJJd7jKH4dn+uEO64D72EF30lcrMSrpn9u/AGSWIXOab+LrIFYC7KpIAhSE19WU4moA2tlaSZkiYMYm1N45Fy7U77svqco/YqGkGiubQrDOhKj93WY2on9dtrqTMscCdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738590191; c=relaxed/simple;
	bh=QHolWOYwckeHkdVqvHj8bviQ7uqcUs1oI9Xvq1g3Oqs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MxLXYMlMX004u84p1q5i9CRUeX/2eHQXijUiv28GZCQTljW8hwn2H1WdsgnHjaXkJnFgq50vZzI9hdqY9c14rRF1yd97r8OFGOpKUYvEGGD6n4NlXX2+UV1TdZO/xIIIWFx7ApwJ+wwiFyZXamjGklCXyb19XlYfAoFpYx9pNmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dZQ71jnF; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dZQ71jnF"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e53ef7462b6so4445412276.3
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 05:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738590188; x=1739194988; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jAnPCEAxeRwuxhlYPIWOsUNyt8ydB+JWb0c/VRaJa6s=;
        b=dZQ71jnFYlZU9CKlp12TPBFJTp9mQrEgUt3npEXHxd/MhQg6qT5gfTWjVLNsGt1u8K
         Xk1qbLblFymdteye2D2OR+vaxAT+mES+GFYA9KiU/FtVK2Df2NEzw3YaChYcZjfyeE5s
         Bf5fCpa7E0aadJ9DefbN7TDITM31sw4JlETKKqCPsGVsS2aERHd1o6WX9FP881DkfobS
         zknyXvFuywf2D3GPm5SHZiLy+191wAHtqUpbMEezz2Y3Wx3WAJ2LsbPEBlr2nWj5JGjm
         C0peYi/jToOgJnuiEoR4izdFxTggCa7ZoOVIfqEOZCoLzNQkD1ldYtwl28uMrLQ12W7F
         3pBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738590188; x=1739194988;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jAnPCEAxeRwuxhlYPIWOsUNyt8ydB+JWb0c/VRaJa6s=;
        b=ezc3HAEPLTaTbPyGFud9y/eANqpXb5QWL5KPG2xwHAa10BLHe5fCivL6h/7M0rWEWv
         yhssSTczozIAbKkF5hMsiA1fhBEQhjZpjJ5zOQ49P3C43e2z/LDre2QvLjNB8kItJHVh
         I1dKYg9sDjR5rOWaSyIwxTelBGwKdS+ofyHpqMcRGv5w2E7pmEjHHEdqPOnnbt99ycjq
         ckGc0vd315MIJfcyJAiQ6ep9zjIGDl3o4W8mQ1Js/Q7sf2Q+RypDTLSJzwUnPIrNn8pm
         8smXro5gOXxri2x6FHa4JzNZxWSc77BHCnFskOfKeLaNYzihir2vb1wYOygvaVDu9MM3
         SBGg==
X-Gm-Message-State: AOJu0YxRcGXc+/Y8SHYQ5V989MBmIvy4UKtAMilyzD7tjw+l/qnXhHzR
	TU7s7iiyvNLyqKWHDzGb71Zp5rd0HRoDZYMMxluasHWCPu7R2o/9wQYDJdV2bVCZLk4jZtOPRX/
	hGxW6Rxl1BHdvRO+5oRm732hcmEiHCpIyXGqLXQ==
X-Gm-Gg: ASbGncvGQMqUK9Ei1ex1A3g4y4S6YuO2E9xWpoJW/O18cEjQO/AeLc4E5HvYbElT4OS
	wyjxtsgvaitOG8zITN/21aZoU1/sK6J6WxBRItuq6s7QUIvBXlOv/8tOQl6+LULN8ohThs+7IKg
	==
X-Google-Smtp-Source: AGHT+IEWng7PMTXc656jLyqZUOzLX17+vAOU5NWjZ+ntABeZHpNmK4RXTjM0S4PFLmKAEQ+3QDPJcNwuVfqH7mbVMr8=
X-Received: by 2002:a05:6902:1029:b0:e57:2a07:a975 with SMTP id
 3f1490d57ef6-e58a4b33e0emr16052526276.29.1738590188619; Mon, 03 Feb 2025
 05:43:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250127223654.290904-1-erick.shepherd@ni.com>
In-Reply-To: <20250127223654.290904-1-erick.shepherd@ni.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 3 Feb 2025 14:42:32 +0100
X-Gm-Features: AWEUYZnM65CrA0dj0GVnMhXHRV1BGRwh0wOsnucsXlcdK5mTDYyWd6lWdtITML8
Message-ID: <CAPDyKFoYfUBLLBh--Qhj0p5DFW36yOTo_dEAH7s4STvWzuK9fA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] mmc: Update sdhci tune function to return errors
To: Erick Shepherd <erick.shepherd@ni.com>
Cc: linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, york.yang@csr.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Jan 2025 at 23:40, Erick Shepherd <erick.shepherd@ni.com> wrote:
>
> Updates the sdhci_execute_tuning function to return the error code
> that was returned by the __sdhci_execute_tuning function.
> Previously this code was only stored in host->tuning_err and not
> actually returned.
>
> Signed-off-by: Erick Shepherd <erick.shepherd@ni.com>
> ---
>  drivers/mmc/host/sdhci.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
> index f4a7733a8ad2..b35b8917fa1e 100644
> --- a/drivers/mmc/host/sdhci.c
> +++ b/drivers/mmc/host/sdhci.c
> @@ -2967,7 +2967,8 @@ int sdhci_execute_tuning(struct mmc_host *mmc, u32 opcode)
>
>         sdhci_start_tuning(host);
>
> -       host->tuning_err = __sdhci_execute_tuning(host, opcode);
> +       err = __sdhci_execute_tuning(host, opcode);
> +       host->tuning_err = err;

Hmm, this code was deliberately not returning an error in this path,
so I am pretty sure things will break with this change.

Anyway, please re-submit and add Adrian (the sdhci maintainer) and
possibly a couple other contributors that have been working with
tunings for host drivers. We need their feedback on this.

>
>         sdhci_end_tuning(host);
>  out:
> --
> 2.43.0
>

Kind regards
Uffe
