Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1A8238D5A
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 10:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745576479; cv=none; b=mt7MlvufyRqQTTS6bAEm22bUkTe0uQ8Huo9XoEY+iBWxjsBq2Oc62XrXaZdY/MHrB3/zC4XZd7JkhsIS5I+7CAwvWx52owiXSkqF1yg2WYBr3RYPFGaXJ+y+Ipp4Suyi4duwqs5DuMVRuGsy2CdNoyG6L7+A8m7kXpH/0LgkXxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745576479; c=relaxed/simple;
	bh=bea2MAWR2xePWrRZDSwx6U/cct68IawnA8pK7VpVqac=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PRmlLwQDCARkNVHDNpVLVKn/CnpSdJwBtw9O17ufQn6ntVCcriX0yUG+XwudVGoO7qf6Rrta53Pqs7+OvnwLip8blGvbSuumGYVMtjhECRsX/aSTcJatO0S9tZKkWwsJTyjkFKREgustWY5livC+SqYr/Wwzt5QmibB/Auxwe78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pYQ2pLQw; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pYQ2pLQw"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-7053f85f059so20071217b3.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 03:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745576476; x=1746181276; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4xtlWzmg2HNhGfo1n6j6VZxV97pQa994I7X0fglbPbg=;
        b=pYQ2pLQw7RRly8kASM2fnwPGu5txqC0V03JcFX+3sAdpNhASp1KUas1PdBoQkhV1Xp
         qUfvvfwyLbe/Yo71EZ46W6jntyzwIjKqwwOD2BaTYqRU1j7gv/uEy0BMDIWTT+y6Ltgq
         8E6bWn94SKa3MgIdSyfOpzt3PlSnLWeyeKtix/VoOpZNofc9j/3bZacJXYEQcCUg/YAD
         5OeImXyixZv2KQBruhIP7k9RHvXoBSOQYPoQgVGqxflI5J4vmT535yq1++ypzpBiTn0e
         wBa3h4uFoS2ESq6g8eCL0uEwiT3Wbji1DjN3DxvTmourvcfWEE+tj2gSiqnNk+Os4gd+
         ko9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745576476; x=1746181276;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4xtlWzmg2HNhGfo1n6j6VZxV97pQa994I7X0fglbPbg=;
        b=tfTiAheRRVmwTp395lgw2SXpajK6Smc35u1e14SCD1yToJsVpehj816Dx+ISalENxQ
         hogzUKx3atDN7FQxgl3bKRYxL42cEvzR6weoo3SiKkS8BiZdA47I4Uj1MJc8JWfgHFo4
         ZE0268TcdUpTH6yX7CRIWH9CmoT+0hZSAxa57xtOwfD5Dco3jZ/f6lAfpHRyFKzP48mN
         +J46QqMbt2UoG87kGvfnxqzTy9Mkx7U+XZACmkCKtjmpblFErh2TRQ3n2Ac/z1rCmR+n
         w2c+EdNAnaQtl3SOlZiSCcC5mPgGBYPyzaXL8HplACM2jscrt+G0nBz8dV5xGiIo/tGm
         HNOw==
X-Forwarded-Encrypted: i=1; AJvYcCWtqgwbkiAsfrcj/iRoU6/KA/y60xHBvS76eeq+z9/joUu/U76mLedlD4S+C6pCTWWzgn+LpNwhv21/KzQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJtt75B5B9y3pwWtLP5s46whytyvGduwlgf02TCpubLdhsjwSN
	lV98Ia7IEPhEMR1TGF2ImtXDobbUqgIHOfjqWU7JpHHguYGUqIuDXtzc+asnu2khaQXZSEsKDOD
	8dDTuYkrYP7OLXgBV9jXu50ZxCPgxrjGEQAAucQ==
X-Gm-Gg: ASbGncutfcsGOsQTLrXIQK87iuhUPhEfVXmuATcHZpmnH1kyPN9mdLADiRTZUxDVp/J
	AMkMQU7iS0ZnwzfIWLxEL2b0hn2jocfQcQaPSQGcvEX6F62V/nfxy8hW1wJl3U4jmVtTurtc+KZ
	tlAcRko1SkRqp5yN/slksmFUM=
X-Google-Smtp-Source: AGHT+IFwzWvVcQW2OIuOPuNm7S3wzxb/4DZpY2/AfSEZfPmecvdAWyRMS5KH+2afz+oKQvj6DmCUtklI/lnuHoLlgh8=
X-Received: by 2002:a05:6902:2411:b0:e6d:e8d4:681f with SMTP id
 3f1490d57ef6-e73168936fdmr2304939276.35.1745576476343; Fri, 25 Apr 2025
 03:21:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417074645.81480-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250417074645.81480-1-krzysztof.kozlowski@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 25 Apr 2025 12:20:40 +0200
X-Gm-Features: ATxdqUFX3-aj6uGzZ6MjZfzJuyAtiwi1E0if2kOJDDTWutgbL5RxXK5HHoQxSiU
Message-ID: <CAPDyKFpTKxA1fvppkADP=XVbU5YroczNMfYtjELK_TyGR54f2A@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: arm: Do not enable by default during compile testing
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 17 Apr 2025 at 09:46, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Enabling the compile test should not cause automatic enabling of all
> drivers, but only allow to choose to compile them.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied for next, thanks!

Kind regards
Uffe


>
> ---
>
> For longer rationale:
> https://lore.kernel.org/all/191543a8-2e2e-4ac4-9b2b-d253820a0c9f@app.fastmail.com/
> ---
>  drivers/pmdomain/arm/Kconfig | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/pmdomain/arm/Kconfig b/drivers/pmdomain/arm/Kconfig
> index efa139c34e08..afed10d382ad 100644
> --- a/drivers/pmdomain/arm/Kconfig
> +++ b/drivers/pmdomain/arm/Kconfig
> @@ -2,7 +2,7 @@
>  config ARM_SCMI_PERF_DOMAIN
>         tristate "SCMI performance domain driver"
>         depends on ARM_SCMI_PROTOCOL || (COMPILE_TEST && OF)
> -       default y
> +       default ARM_SCMI_PROTOCOL
>         select PM_GENERIC_DOMAINS if PM
>         help
>           This enables support for the SCMI performance domains which can be
> @@ -14,7 +14,7 @@ config ARM_SCMI_PERF_DOMAIN
>  config ARM_SCMI_POWER_DOMAIN
>         tristate "SCMI power domain driver"
>         depends on ARM_SCMI_PROTOCOL || (COMPILE_TEST && OF)
> -       default y
> +       default ARM_SCMI_PROTOCOL
>         select PM_GENERIC_DOMAINS if PM
>         help
>           This enables support for the SCMI power domains which can be
> @@ -27,7 +27,7 @@ config ARM_SCMI_POWER_DOMAIN
>  config ARM_SCPI_POWER_DOMAIN
>         tristate "SCPI power domain driver"
>         depends on ARM_SCPI_PROTOCOL || (COMPILE_TEST && OF)
> -       default y
> +       default ARM_SCPI_PROTOCOL
>         select PM_GENERIC_DOMAINS if PM
>         help
>           This enables support for the SCPI power domains which can be
> --
> 2.45.2
>
