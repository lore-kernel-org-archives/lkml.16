Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8217B265CC6
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 13:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744204468; cv=none; b=FuXtBrSE3EmjHWVrmib2yPJtSIEb/5/SsUHOAphkjPKGeeMLHDOKY0eBKWLDm8WAOumRAlLIV6KR3T+SAhY3IjkiIygr2UhQBruUyuPgNydYi3kqRzgdFkhg6pYX/Nw7By9uw7F+cwjVDYlboLmokkTVD2JPRMhudWN46GGQDu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744204468; c=relaxed/simple;
	bh=7zbFeCLuI+K99uAK3B6Tbmrqzoz0Zborq7yQnLiljzs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JoU9owu4iu7XaNaU0mpLEztPtygbLjEMu2AlZ+eGlzV3TP+TdmT9XApUJfPWnQ2h6drJ9PG51FWhtrIW8Bqe7/pkH/YH53ce60YPMviH7ctbjF9V2q51EicwI46q7lBxqmAtkU2dYjp1QWswiUXgtoqkjnk5ghVjm4LOkboLZO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rmNhFEZK; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rmNhFEZK"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6ff07872097so61984927b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 06:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744204465; x=1744809265; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nZVX5PQPrfquBJMxVk5gyHF9PFmvV5mvI058XbwmWQ0=;
        b=rmNhFEZK9TNfxgaKI861YjADyfu8zsHpCCnLswuweMje3foKiL9ac30+Q66ClekgH6
         VOBaXnLOsiK5opGK64pFcZ7PsQfhkM+2F/8VdjFHKkfDe+YZl/mueG82d38VhHx97y/d
         0LtGPLCV6XKrTIoOEQXyIFJR1/Kd/JK2FJ+IHUdAFZB+fK90QSsHmtAuse9cmBROTVuE
         SSancx8yzCIMjiCtMJTUdyi/bqamxXAIh8ygxj6eDPJg7F29+nfU7gaLhNn8cIlBuD1h
         g2b4p60EwMfJLoBdqO9suVUSLdnXJUuoY1LA6Y0PwoVtJV1DC0ex984ANDXvMrXp4k6a
         KpEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744204465; x=1744809265;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nZVX5PQPrfquBJMxVk5gyHF9PFmvV5mvI058XbwmWQ0=;
        b=oBP9IAlu0eFM+37mGc858T6sNEaKqRjn6ZtzTEMtC/tPlN7wBMBWKzXnoUYRskkAPc
         D5ddK7kebnPl/O5kzfX7h3Zjmwl5dwsfhWoBjzQUP7mmpspYUEAkC+N/AU0adC9ZXbhC
         AofcTSbgVYUNz6zn5MqGlSRQxYD4JzI6IMesDMzQUrXX/xpUWYBtMwmNq7J3ub9sJ/Pk
         hngMt4HQk42PpVQja221q6OkzYbEBbyG/UrmUCcjec7dA6heryOZElYDuv/yCsF0oMSg
         ayBurpgnbCEQZZ/WH9BB1sZSs1Bx0KBgCjeo/zhofr9HVIy+fa7Vvrdev81c6np+Zkcb
         X/iw==
X-Forwarded-Encrypted: i=1; AJvYcCXg+uxEQ4GNy/1+LwuFToNHvVXPagEyHFi44V0/06d5xOZJbLkSm23sPGDVrhfDaDnq128bg5IaN7rTE4A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwacxhNZOwS3XxWQn1hI0JC6TyuI70cAtcWyNKboo92xJ2S1O5+
	S/azSbavZ9f8Kb5reIwm4z5my31n8GSR5QBEIhq1vYKA2QnjPpz3bOIj9dy9Q/p7n3qMyasQW43
	I7NykZVGokhRVgHt5CRm6fw9WAjhZFixbw1Q/XA==
X-Gm-Gg: ASbGnctCQiJd0wZmoX6ez3QvWlIHUHAMVyyez4TgUHCZkwvqBVuY3L8GsMGjtb2BM/t
	bFNBwCTlpRXgT5GLu1KZ5bUjj+txZcadCBb30/q49jz0798RjUHkQe591AfngAF7eBORptNDYAx
	BQk7qZiC5kybAIwRQPkGN4SBI=
X-Google-Smtp-Source: AGHT+IHbawswjfdH3sqFi36CBNn1RNgtkyGSJ/NGOXxL4dZhfzW2bxsKoLqgb75/B41CMWmJKQ4D2DTNItFMQGhMGyk=
X-Received: by 2002:a05:690c:4482:b0:6f7:55a2:4cd8 with SMTP id
 00721157ae682-7053ad41c01mr37577897b3.5.1744204465406; Wed, 09 Apr 2025
 06:14:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401195751834zbm34YDvwPeQf7ooZBCdh@zte.com.cn>
In-Reply-To: <20250401195751834zbm34YDvwPeQf7ooZBCdh@zte.com.cn>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 9 Apr 2025 15:13:49 +0200
X-Gm-Features: ATxdqUFC3YjMsK4_mQfKP9WcVyJ3UW9jxF0KfI-w6NTkkAFGErDieKR4c5JNlbQ
Message-ID: <CAPDyKFouaoE67WtdnQvohT9VjqCVC6CeFaCg0WZDWnVF5G+YNg@mail.gmail.com>
Subject: Re: [PATCH] mmc: alcor: Use str_read_write() helper
To: shao.mingyin@zte.com.cn
Cc: yang.yang29@zte.com.cn, xu.xin16@zte.com.cn, ye.xingchen@zte.com.cn, 
	feng.wei8@zte.com.cn, u.kleine-koenig@baylibre.com, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Apr 2025 at 13:58, <shao.mingyin@zte.com.cn> wrote:
>
> From: Feng Wei <feng.wei8@zte.com.cn>
>
> Remove hard-coded strings by using the str_read_write() helper.
>
> Signed-off-by: Feng Wei <feng.wei8@zte.com.cn>
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/alcor.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/alcor.c b/drivers/mmc/host/alcor.c
> index b6b6dd677ae5..24abd3a93da9 100644
> --- a/drivers/mmc/host/alcor.c
> +++ b/drivers/mmc/host/alcor.c
> @@ -20,6 +20,7 @@
>  #include <linux/irq.h>
>  #include <linux/interrupt.h>
>  #include <linux/platform_device.h>
> +#include <linux/string_choices.h>
>
>  #include <linux/mmc/host.h>
>  #include <linux/mmc/mmc.h>
> @@ -208,7 +209,7 @@ static void alcor_trf_block_pio(struct alcor_sdmmc_host *host, bool read)
>         len = min(host->sg_miter.length, blksize);
>
>         dev_dbg(host->dev, "PIO, %s block size: 0x%zx\n",
> -               read ? "read" : "write", blksize);
> +               str_read_write(read), blksize);
>
>         host->sg_miter.consumed = len;
>         host->blocks--;
> --
> 2.25.1
