Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0057D220F58
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 09:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746782607; cv=none; b=sqa1gWEWPth0bTrOM/1nz3/1TT7X5/phbz8UzGI5Aw9uRyvQfzBcPyB6s4tusnKtHMVs45g9VvknSqRmoGTD1v21nhvMxGaOyoB8pj8ZUeSBjZko7TWYMUoZOKT8srXhlT7wm+5iK71qR2Vr0kYCgZdGDwizRd9nta2gfTQP9Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746782607; c=relaxed/simple;
	bh=orNsIBHvumuIEYwOUdggNHqoj/VcRbaBN0QdchWSsr8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f1Vu/k4RfSKM2r6Zgkpdx1uqrW+JGbOm6S8S3JFGe7Iz3TLzji1UqGnJlVuX3uo71CAhDF0juW1mvqufzYCrqfAObSLzzWiFpW/xdyq8y290g9ap2mh8FOSdyrdKzPYD1qSg43+SvglRPQBTSwxyvlOBqsyscI07Nzvff/d/u1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WsZizdXw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WsZizdXw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EE8DC4CEE9
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 09:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746782606;
	bh=orNsIBHvumuIEYwOUdggNHqoj/VcRbaBN0QdchWSsr8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WsZizdXw8RhjQGY2xsfdDxAhDvw11kKDmRN6J8U65884v943Uuku+J4nfri+SoFKn
	 uSfeo9Do4n26N31gcScYko5a2J/rYMYHJvo2b1BSFOcnFjdynQG0k2Rfvq0Z6DoOeN
	 OI31nbEQd4cMaZgRpcXUzaR5S+e2Ut9c6vShCZIb2yke4FmSwxYNVGU+rYunwvJENx
	 Q54aR2ZA3pLz+sL/wFZRVpr8T5hveL4Idh8n4qHBKOAPDUDj+RKloF43hUbR9cYMBB
	 BAp5CvRpx/usCK5ct2tvWYD/vdE0q0TXAlaRV0MQBbRImCU2cN/fdT3GlPXz/XAOhL
	 rvSju3Ho+T5Rw==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54d3ee30af1so1236754e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 02:23:26 -0700 (PDT)
X-Gm-Message-State: AOJu0YynGPbqK1RhvFrqbBXtBpLn3cWvUtH1Z86cCKYr7A7JR//hk4yC
	nsbzgVNZSrHrvJE4ckRTQgdqRJN2y3eq6GD1VR+vyNT/WMr8U+TLcUiLbIzfgM2j7uVNhCVpMmy
	D0fzHZ39tyvs7dqJJJK9dSUFpjQA=
X-Google-Smtp-Source: AGHT+IHROycVcCVXCil0Pp22cUai2J8w5Fgzg+A7pGdF0RAlaP4uxX9ZTomNpnXxNRsWJbp1niYxaIWDOjiCxkpd3aI=
X-Received: by 2002:a05:651c:198c:b0:31f:8c3c:605b with SMTP id
 38308e7fff4ca-326c46c0798mr10484471fa.39.1746782604894; Fri, 09 May 2025
 02:23:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1746037489.git.sergii.dmytruk@3mdeb.com> <5c4d5adaa40fc5d5d1bcfef813713040e4df13a4.1746037489.git.sergii.dmytruk@3mdeb.com>
In-Reply-To: <5c4d5adaa40fc5d5d1bcfef813713040e4df13a4.1746037489.git.sergii.dmytruk@3mdeb.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 9 May 2025 11:23:13 +0200
X-Gmail-Original-Message-ID: <CAMj1kXF6uHrEYLkbnuK=noLDFJFwjDgcwRXNH2O5m-vveDOMeA@mail.gmail.com>
X-Gm-Features: ATxdqUFmvkLcyVANtsl9IxUVBF4eEHa8N2BqP_FBMYxUFiakgqveNZGR0pqZPBw
Message-ID: <CAMj1kXF6uHrEYLkbnuK=noLDFJFwjDgcwRXNH2O5m-vveDOMeA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 8/9] x86: AMD changes for EFI stub DRTM launch support
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
Cc: linux-kernel@vger.kernel.org, trenchboot-devel@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 1 May 2025 at 00:45, Sergii Dmytruk <sergii.dmytruk@3mdeb.com> wrote:
>
> From: Ross Philipson <ross.philipson@oracle.com>
>
> * Only do the TXT setup steps if this is a TXT launch not an SKINIT one.
> * Initialize boot params address for SKINIT.
>
> Signed-off-by: Ross Philipson <ross.philipson@oracle.com>
> Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>

Acked-by: Ard Biesheuvel <ardb@kernel.org>

> ---
>  drivers/firmware/efi/libstub/x86-stub.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/firmware/efi/libstub/x86-stub.c b/drivers/firmware/efi/libstub/x86-stub.c
> index bfa36466a79c..0453be1ba58d 100644
> --- a/drivers/firmware/efi/libstub/x86-stub.c
> +++ b/drivers/firmware/efi/libstub/x86-stub.c
> @@ -798,15 +798,21 @@ static bool efi_secure_launch_update_boot_params(struct slr_table *slrt,
>                                                  struct boot_params *boot_params)
>  {
>         struct slr_entry_intel_info *txt_info;
> +       struct slr_entry_amd_info *skinit_info;
>         struct slr_entry_policy *policy;
>         bool updated = false;
>         int i;
>
>         txt_info = slr_next_entry_by_tag(slrt, NULL, SLR_ENTRY_INTEL_INFO);
> -       if (!txt_info)
> -               return false;
> +       if (txt_info)
> +               txt_info->boot_params_addr = (u64)boot_params;
> +
> +       skinit_info = slr_next_entry_by_tag(slrt, NULL, SLR_ENTRY_AMD_INFO);
> +       if (skinit_info)
> +               skinit_info->boot_params_addr = (u64)boot_params;
>
> -       txt_info->boot_params_addr = (u64)boot_params;
> +       if (!txt_info && !skinit_info)
> +               return false;
>
>         policy = slr_next_entry_by_tag(slrt, NULL, SLR_ENTRY_ENTRY_POLICY);
>         if (!policy)
> --
> 2.49.0
>
