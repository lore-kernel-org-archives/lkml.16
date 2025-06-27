Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2523F3234
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 14:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751034696; cv=none; b=HN+nvhI2XwrC6c7q9IpJYRbJtpYxVOcK9Bc8Hw7Gl+w7bzl+800smQJ646A83xru9v2WLLsNTff6Jfw7+g3Xg1MTc37Ckd3M9ziLpbzg8r0oiNlHePKhYj8ISrpoV2yy8HxrgMZZ//oZ4oGhB6Ym+0qI8gLlzHiTn2lTIgOVGy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751034696; c=relaxed/simple;
	bh=B1BdE0J+jY6ME5BrRSZux1zOeKpTZZ4DlpXlyhs8zxE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l3mf7f0Dd9UQCodauLSp+Yj8pBBcypk637A1DvCe4kt4fx12YuAt0Y6ceEGliEwtCKk+hTb4bYmfVDvqVeIzUsXELP0UuI33wQJAfaNrG6MSx56eSauf/N3BIb3RQiGwN4bADHKZdhXukKtLqHO9rkzmFVKXWClrd5BeInvLKvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X15TK5B2; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X15TK5B2"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-607434e1821so3210995a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 07:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751034691; x=1751639491; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8o5xo7GeehPDbRd+X/7D8FpirwN/TZkXVzx9zL2sssc=;
        b=X15TK5B2V1rLeKkJ9wU5Xr0orKYbmRRqGr9S0RVf2ulX2MghILw3tjttiglnpKsyIN
         CRXcaUxMqgmZwfdT5inUh5hTtd8LF8YFhWlnE9wYyP2T4iDAVSVs8ytbigF9VK/llu9P
         iD4hW8Jb0DiLH6OXbJxkMEVL5C5qNUxoKevMQZ4IEsHENA4/RThtxOJakLgX7+Nm32HZ
         e3eXwXlKIoczXAhAGo3cAsKZvWZBGmemfQO6alAIaKrLREmmd1/rs+1+xug+waFxotd3
         WTUMATMEZB5etKoIISu5G6GiTiIYzaGWAx/glxIY858o9BTWoKCkZO4cI30p8SOJzBDs
         UKDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751034691; x=1751639491;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8o5xo7GeehPDbRd+X/7D8FpirwN/TZkXVzx9zL2sssc=;
        b=p94ljND/KiHnYv1+GsU7KwSEk0JthHrlOrYutMyN0b1n1zR2kBz74InNM39OEarpRp
         LKcfF0bpLSUrZFAO0hX0u4f40TOdJiKw/pHAUUN9YWzf8yJTN4KEv6rd4Z4Jyr6cYvwz
         yKUC23K/3VO2d9ZbtqfazsuPVMpojqYNk3iQoogVbxH7MDyva3XkUM7+R/YbXUa3vc9F
         QrZlkebaLlyfwl6FTWH+Y5zYWLZMaA3i6nAJlfn2AjF/dyHQSHuj8Y1VEmLAQatm3HlV
         QC48PYELbk2wyEsdiJEVGEVbqMFGAQhqMEzw96FZyyb7ABR1k4Uo73oJTyZuafodtWTE
         a+Yw==
X-Forwarded-Encrypted: i=1; AJvYcCVyCX+jSM0AuKxqbkDYT0VbSz9cxWEbDuftj8LJWOIV5fznrIRP96bch0x20xkHPWwGHTF28b72pyQC4ok=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFv10pMSxGM5/nftvP5Piz2W2b3i2Uo8yAS8l5PN0MKza4I6U3
	OdWFu5qYmgkA0M9RbioxDI5CoV7EfCZQIbSpSYUTiugC9yCKNi99Ix1c+vHKB+G8D01gDvyH5b6
	33BeqyHEmDclP0pGavyLls4q9UqmNU/C5rWboKKkjKQ==
X-Gm-Gg: ASbGnctULdAV6BJcoKFY4DIZAtfkxnEq7ux9AOdi9ed0QCNDcOYPmyCnWoudi7opEbK
	uMeLokafJrE0XGUQE9ogCYCRCv6QqyW2VTPrm+Y+ECor9y/wKH8/SibetcSB/eCmKOHMA1zJLC3
	UfhuCUa19CpZdCQ0omEhYddItUFwi9y0MKRkZQJrUldzE8AGq5f7Id/pj6qPZUq2b7FbK7cfMtK
	Brovg==
X-Google-Smtp-Source: AGHT+IEL785XIeur6WCbc2OIj5nk/sVLVVNkV3GZ+ObEePJ/qNpPBLIGoWwmBJBgA18YqNdBbv+6Y6RgOuBSpzWsw/4=
X-Received: by 2002:a05:6402:5bc4:b0:607:eeb1:b18b with SMTP id
 4fb4d7f45d1cf-60c88d9c37dmr2283943a12.8.1751034691378; Fri, 27 Jun 2025
 07:31:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250626215911.5992-1-hiagofranco@gmail.com>
In-Reply-To: <20250626215911.5992-1-hiagofranco@gmail.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 27 Jun 2025 08:31:20 -0600
X-Gm-Features: Ac12FXyLrcISUGMKifq1LXY0djWn87ywvC4vhLqatRfOsnXR-16wTizuirmCxWY
Message-ID: <CANLsYkzo32BHkxRzSLY1U_PcidMPOaz7xZjDs8HKtTCQ0ZpF=g@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] remoteproc: imx_rproc: allow attaching to running
 core kicked by the bootloader
To: Hiago De Franco <hiagofranco@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-pm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@oss.nxp.com>, daniel.baluta@nxp.com, iuliana.prodan@oss.nxp.com, 
	"Rafael J . Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 26 Jun 2025 at 15:59, Hiago De Franco <hiagofranco@gmail.com> wrote:
>
> From: Hiago De Franco <hiago.franco@toradex.com>
>
> This patch series depends on Ulf's patches that are currently under
> review, "pmdomain: Add generic ->sync_state() support to genpd" [1].
> Without them, this series is not going to work.
>

I thought we agreed to repost when the feature referred to above and
the work in drivers/pmdomain/core.c will be merge.  I'm not sure what
to do with this patchset.

> For the i.MX8X and i.MX8 family SoCs, currently when the remotecore is
> started by the bootloader and the M core and A core are in the same
> partition, the driver is not capable to detect the remote core and
> report the correct state of it.
>
> This patch series implement a new function, dev_pm_genpd_is_on(), which
> returns the power status of a given power domain (M core power domains
> IMX_SC_R_M4_0_PID0 and IMX_SC_R_M4_0_MU_1A in this case). If it is
> already powered on, the driver will attach to it.
>
> Finally, the imx_rproc_clk_enable() function was also changed to make it
> return before dev_clk_get() is called, as it currently generates an SCU
> fault reset if the remote core is already running and the kernel tries
> to enable the clock again. These changes are a follow up from a v1 sent
> to imx_rproc [2] and from a reported regression [3].
>
> [1] https://lore.kernel.org/all/20250523134025.75130-1-ulf.hansson@linaro.org/
> [2] https://lore.kernel.org/lkml/20250423155131.101473-1-hiagofranco@gmail.com/
> [3] https://lore.kernel.org/lkml/20250404141713.ac2ntcsjsf7epdfa@hiago-nb/
>
> v6:
> - Added "reviewed by" from Ulf and Bjorn.
> - Fixed and improved commit descriptions of patches 2 and 3.
> - Improved the comment inside imx_rproc.c file.
> v5:
> - https://lore.kernel.org/all/20250617193450.183889-1-hiagofranco@gmail.com/
> v4:
> - https://lore.kernel.org/lkml/20250602131906.25751-1-hiagofranco@gmail.com/
> v3:
> - https://lore.kernel.org/all/20250519171514.61974-1-hiagofranco@gmail.com/
> v2:
> - https://lore.kernel.org/lkml/20250507160056.11876-1-hiagofranco@gmail.com/
> v1:
> - https://lore.kernel.org/lkml/20250505154849.64889-1-hiagofranco@gmail.com/
>
> Hiago De Franco (3):
>   pmdomain: core: introduce dev_pm_genpd_is_on()
>   remoteproc: imx_rproc: skip clock enable when M-core is managed by the
>     SCU
>   remoteproc: imx_rproc: detect and attach to pre-booted remote cores
>
>  drivers/pmdomain/core.c        | 33 +++++++++++++++++++++++++++
>  drivers/remoteproc/imx_rproc.c | 41 ++++++++++++++++++++++++++++------
>  include/linux/pm_domain.h      |  6 +++++
>  3 files changed, 73 insertions(+), 7 deletions(-)
>
> --
> 2.39.5
>
