Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9518C142E77
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 10:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746699320; cv=none; b=U+MG98IWIcX8DJlFTpBLAYKtIIQCg5ORBWsfb1jkyZ0tAd3ublCpn0ovDlF4GXogGOhcfbbctGKyzMUaocE/QesisdE3cKzg6UE9KqF4xS6ZmUom5MSBw3GNPYeRj7XkL96a/31MaPZdJpjg/VQfWtMBR8WBNrgQjKlt01Vzf04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746699320; c=relaxed/simple;
	bh=qhNsKNLNw5tmwB3UAIDERkC8dHitaFy99n00D7sMtvs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LUs4p//u5pbV/wzcQn0QcTtvcy3srDe+8ikVQaGn4IcstrOHeqipmlRGbrpNhbIn4TRWPhpN7o9gpIYQOCswK2mC2LhLAKGE0X65dVOHdv6U5L51PcrCuJxIdtPwzWdC5QgWtGAJ1CYbT3xnz9WEnh10q6CBlkpp6yP5ZIdHImI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IEwe50iX; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IEwe50iX"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e78f44034ffso333122276.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 03:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746699317; x=1747304117; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gpNKcie2UhGLpgDU+EfoQWjK/q5dcvHwia1KJeJcP0Q=;
        b=IEwe50iXy+VAW6dWq6aFlqUo6/kvIHAy5zsrJeV5WqOniEaizm+QpVTzvAtiDU6fLj
         VHvWROTzS+NJBP0XBcFR1Q2WQFZ42nYEQqX9CMUJLqi7zfgFapgK7uu3vjY0YKQMYVy7
         qNfh2G10V+io7+iwENa5VY2pkfyCiJRIuwbFv4qF+GNtJzUIxEc1Q5A/etLdxrcpA/9R
         RAaehVuSzY0rP4mQM63SQfykZnPUpQgmErVoFTUSKooJPBL4DNhzzSWsQ+Pre6y0gDs9
         u04RpUTzqqFGJ28r4LVrsYHtKSmJUJ/vtI9tEn8bn5CDuoDXLZn0gN9CFfd3Mjd9B5AJ
         g1EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746699317; x=1747304117;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gpNKcie2UhGLpgDU+EfoQWjK/q5dcvHwia1KJeJcP0Q=;
        b=EIijjn+p7Cb3RU9Uh0HPns8GTLYotWVBKp6N0Cz/0HZAbg25bMTq+tP16mEZl/MrjW
         rKbg9XiNvNDKCGSYbSK/2b7GTjoES7CcbOdxd00pJO4V9DR/8Zg4OQx2/0wUKrMilSIR
         rtVI8keZISXbljzy5tmwfW24eu6U20REiU16xu6gMFGThOZTyMqo4Dd9MH6eE0PU/2Qw
         OLBI5f3T54C4VvpPGubliylIGsejjERRoZprSyoMf1dnXdvUey823QwA2OwJi2wRPCuJ
         kXPWHxkZa5vFiAU7Yx4r4uEEz1oHLOb+n1v7MIkczqhf0HlFthiNyqdvEk2gzOtT6I4/
         +m9w==
X-Forwarded-Encrypted: i=1; AJvYcCV5h56Pu54rjjaE64eFUrGhCRfKQkdjk5Zi4ilg1PQXBeFPxAxhJN1XeZFbZpzbAItqer3vJxxhdIIU2NU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOb726A/6hhyfIDUeZ2ImqCVyd2OQ411sabUQCD3MKZKgdnjDb
	mZ5Xz2PHv1P6X4wwtyYGaG2BfT2HaiGAp3EoIhkiGYlCfzSHL/xl5UJT3F7sDyHUmfi9fu49Jyt
	dcaroDJxviqYfqGmJSb2WknWF23GYToOJ1kXq4w==
X-Gm-Gg: ASbGncvoIR15lBX3EqO29ZepRHokggToLuhEdeFk+zVAKIAUUHjRhxiTEkT4cNxLauw
	nAbnHR8QPuNwnlB59aaWM32XZjruHTaq5a6s9Wvj5D0VjyZ1G0flG1o0ivvlBObFU31jHA0woqX
	KJtI4QDo8UQ7lyVwp2z05l3o4=
X-Google-Smtp-Source: AGHT+IFZR+3HdpndujRIwAKAXYMyHzJt6gQWJhlrflCknDzCNNPyqtjJEyMg55oFZwNVRamj1dH6embSLYS37XFNcDM=
X-Received: by 2002:a05:6902:230f:b0:e73:1ff1:ca2f with SMTP id
 3f1490d57ef6-e78ef6f7c55mr3056251276.32.1746699317373; Thu, 08 May 2025
 03:15:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aBxPQ8AI8N5v-7rL@stanley.mountain>
In-Reply-To: <aBxPQ8AI8N5v-7rL@stanley.mountain>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 8 May 2025 12:14:41 +0200
X-Gm-Features: ATxdqUHgbU1sftWGZFEYCFbWV60qCjH22SvLEOP-bV81E5it0iQHN0cHPsZak-8
Message-ID: <CAPDyKFoZiEAn8yT8a9VZqayR1=HPnMn+a51O3zUAUR3L6RXH=Q@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: core: Fix error checking in genpd_dev_pm_attach_by_id()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Niklas Cassel <niklas.cassel@linaro.org>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 May 2025 at 08:29, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> The error checking for of_count_phandle_with_args() does not handle
> negative error codes correctly.  The problem is that "index" is a u32 so
> in the condition "if (index >= num_domains)" negative error codes stored
> in "num_domains" are type promoted to very high positive values and
> "index" is always going to be valid.
>
> Test for negative error codes first and then test if "index" is valid.
>
> Fixes: 3ccf3f0cd197 ("PM / Domains: Enable genpd_dev_pm_attach_by_id|name() for single PM domain")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Thanks for the fix! It looks correct to me!

What puzzles me though, if this is a real problem I am sure we would
have been receiving bug reports, don't you think?

Kind regards
Uffe

> ---
>  drivers/pmdomain/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index cd4429653093..ff5c7f2b69ce 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -3176,7 +3176,7 @@ struct device *genpd_dev_pm_attach_by_id(struct device *dev,
>         /* Verify that the index is within a valid range. */
>         num_domains = of_count_phandle_with_args(dev->of_node, "power-domains",
>                                                  "#power-domain-cells");
> -       if (index >= num_domains)
> +       if (num_domains < 0 || index >= num_domains)
>                 return NULL;
>
>         /* Allocate and register device on the genpd bus. */
> --
> 2.47.2
>
