Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213BE28C2DE
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 12:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751633482; cv=none; b=RVCDNfDBFwkK3Ntne5/J4R0z0A7K7QM00PAE8hqhCPgRZI04l95WWIQHY/vRlOnFxM2PTPNCdAgYHa2+ynMrYcHatQN+1Tz+6AU/oTnkD9DM8tWecKRI1c+Cxyu0IZuc9j1Rse3QMxxRAessQPa30MEbM34hyUsMZDLLk8KZ5Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751633482; c=relaxed/simple;
	bh=C2JsrBQDM/2Gtp6cf9tRIQqCka5uiTWycN0lUlxENJM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A/sqcDaCQS9FBYs9EIoxsOawayEZFvfygBRC1+1Wr50yRn1QmexTU+wctgNCZaRGZ/LMaKpV1y4IeRUc0BFHlcPI/8xb5PNXJcEsPlPAvJxH4sAN7rUWPAyTdmaMDhxvzAarorYLmtVMg/deHD8qmpNtXtZSdF6PrKfXnPvedxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tU1Jf52l; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tU1Jf52l"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-70e302191a3so7726127b3.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 05:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751633479; x=1752238279; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d3mT2DmA5wvH27UV5xYoCQ2K7QXKbZIhjduzRwCTti4=;
        b=tU1Jf52lIdIiyQZlxygQYGBot1AgszSIA4plyR9/54fxmuvF+Ya0CQO4ZrtRQFcf7i
         7Gn1RUPWQ/Br/eSep+9qA5BR9pEBAToFD4UOZlqe9pTM7BrPW9ZBn0j78u6vXEJBfJ/v
         DIyQq/3LClRepcjbql+fQ3MvLox+oqf3T048Nm+ctLfoHVEjFtit3bQd6wqeVcvRDg8/
         F0zUk/vxpt5f0MO+twiu3x10jLvLV3QETfKoc10E2rkc8Imwlh5M5leuXF8jatF3KHG+
         ykdYQEpnofnlQKTy1VO59XjR5UaKgkM1Fy22RqYUBgHGD3p3BKnfRZUSEEZjYPkLXgKr
         okvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751633479; x=1752238279;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d3mT2DmA5wvH27UV5xYoCQ2K7QXKbZIhjduzRwCTti4=;
        b=R35X8o1QoZxqQTBiyVCJ8jiAkzKpa/n/Jg3yO1mabm+iAkDy1pWplaue5uzrIBFY7E
         H8dEJ35kPNY4RtVbDpMuUlvsyQ4jql9dR5Oj/2E5YyDgnYNHYX0+ayzueuktfrd62TNp
         GZUa1JS9rX/0Ti4dvzPITACx1uGmQpId6r9KCGMy6z+qs/RfmCjAla7sKCKN5WcJPpXr
         VKmi8iBDJGheF+lMF8f3ETTHkKQbzvuvMJSpxax7HswYYIL3ImTBup/pHlg+Nqm1RbC+
         2zK9jvKm+Y2uQP/2Qq15irQoBwyAcQjTToZ3DV7CrBHiT/fv4rHdVNpx4TsiVdxhc14Y
         Dhsw==
X-Forwarded-Encrypted: i=1; AJvYcCV2fv+fgx2Lq3+w8TuVVECQfnm3/LcvVfL53RXX9MPbUjjRQPL1HvBe7shXG5JeWBMpK/txuIw3JBtn6S0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5D+VplHktHZAmIqtiF9YVEpXD5DDtPZn9603eBHZEZaXG3kHf
	YyX16JHYgwycidmQ+aMnKEp5A3/J/7pZrtfIdNDj8ll4yIkrQX94cSLS48Jwg4g/tvfJGXe0Gyk
	P4p/dYLOyNHdqw5OhMudH8EMHEDMhUmYwshxOT/2HBg==
X-Gm-Gg: ASbGncsP1bxll6VPzigZo5l+kUu9WXVBUnLkHfk9yVvP0IPA4SwjpVVJcuFSZi05HkN
	mAw3+vhk9nKl7Dkeptwud5Ll63Cyd4MOj1iYurlaTV3e8XsfXYl317p//n1NT5O91PniTtQnoWV
	0P0Nmwt5KJmRzIZoF2X21FedFpAhxKD6TlVhr9K9nlLUDrSoc5COfo4y4=
X-Google-Smtp-Source: AGHT+IFQbNFkv/fEySTEVZ9okBV5QTRp6+fp/hf67AUdITWKjdmWSEHBFqPIy5Jt+n5Rq/hwT5RWEGJi9jyWEkvpPkQ=
X-Received: by 2002:a05:690c:fd1:b0:711:16d4:60dd with SMTP id
 00721157ae682-71668cf2028mr34131887b3.19.1751633479103; Fri, 04 Jul 2025
 05:51:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616102917.1677116-1-o.rempel@pengutronix.de> <20250616102917.1677116-3-o.rempel@pengutronix.de>
In-Reply-To: <20250616102917.1677116-3-o.rempel@pengutronix.de>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 4 Jul 2025 14:50:43 +0200
X-Gm-Features: Ac12FXycOTDU5DpoFxOAxmXzvceBnNCsToAY-3pMEV-YnqafCa0Kdog2wWrND_M
Message-ID: <CAPDyKFp1gyJYWpuHB2-fP2q9ZuRwHNMJAB_0rPScYvD6rPi8wQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/4] mmc: core: Add MMC_POWEROFF_UNDERVOLTAGE support
 in _mmc_suspend()
To: Oleksij Rempel <o.rempel@pengutronix.de>, Avri Altman <avri.altman@sandisk.com>
Cc: kernel@pengutronix.de, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Mark Brown <broonie@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, =?UTF-8?Q?S=C3=B8ren_Andersen?= <san@skov.dk>, 
	Christian Loehle <christian.loehle@arm.com>, Adrian Hunter <adrian.hunter@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Jun 2025 at 12:29, Oleksij Rempel <o.rempel@pengutronix.de> wrote:
>
> Introduce MMC_POWEROFF_UNDERVOLTAGE as a new mmc_poweroff_type value and
> adjust _mmc_suspend() to skip cache flush for this case. This prepares for
> undervoltage handling in a follow-up patch.
>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
> changes v5:
> - rebase against latest mmc/next
> - use MMC_POWEROFF_UNDERVOLTAGE enum instead of function parameter.
> changes v3:
> - add comments
> - make sure _mmc_flush_cache is not executed in the undervoltage case
> ---
>  drivers/mmc/core/mmc.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
> index 5689ab6eefe1..6812df679ba9 100644
> --- a/drivers/mmc/core/mmc.c
> +++ b/drivers/mmc/core/mmc.c
> @@ -36,6 +36,7 @@
>  enum mmc_poweroff_type {
>         MMC_POWEROFF_SUSPEND,
>         MMC_POWEROFF_SHUTDOWN,
> +       MMC_POWEROFF_UNDERVOLTAGE,
>         MMC_POWEROFF_UNBIND,
>  };
>
> @@ -2132,9 +2133,15 @@ static int _mmc_suspend(struct mmc_host *host, enum mmc_poweroff_type pm_type)
>         if (mmc_card_suspended(host->card))
>                 goto out;
>
> -       err = _mmc_flush_cache(host);
> -       if (err)
> -               goto out;
> +       /*
> +        * For the undervoltage case, we care more about device integrity.
> +        * Avoid cache flush and notify the device to power off quickly.
> +        */
> +       if (pm_type != MMC_POWEROFF_UNDERVOLTAGE) {
> +               err = _mmc_flush_cache(host);
> +               if (err)
> +                       goto out;
> +       }

I think this sounds reasonable as we may simply not have the time to
complete a flush.

Yet, it may be device specific on what makes best sense. Let's see if
Avri also agrees with this.

>
>         if (mmc_card_can_poweroff_notify(host->card) &&
>             mmc_host_can_poweroff_notify(host, pm_type))
> --
> 2.39.5
>

That said, please squash this with patch3. Especially since I think
patch3 can be made a bit simpler due to my comments on patch1.

Kind regards
Uffe
