Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7AB35966
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 09:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738574507; cv=none; b=mQbGXVIkJbE5B3Zoa3kEoESlZfFrhNM03OzJ4Q7EGMLfKcdN317mO/XrU3tStHVUhv43iEQKIkCuxHgUXz5eOym42NLEECL+/KiTdLoTauzm30RTZyjxSt/uBk8sgPEqKo+e99ErfeCKUp3/jA22gdi8TsnHzmHmjbimMpQWYV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738574507; c=relaxed/simple;
	bh=T2aHhJ1v2X/L65Ok4NtOe1VK2qhh+LeKbzOyYclMRiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Po0Ip2XNHU8oLp9rXKQ5d8k0KI7B+qiZdYtCPCr0oYnWVZjr7dT8MQ6+czvmY0qCAiBk8+d8z3twdKBFxg2CXdJaAcd4fPStIgh6jIgE+sU9BA7ayYUu97xwMAOhOFy3HyD1Hs2MRzSJBmcTn/lj9oYdaH8hBbKjjA8k/MzW2+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o1wSLSdw; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o1wSLSdw"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21631789fcdso66622645ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 01:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738574505; x=1739179305; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FecLJFV40YsKf9bjug9HOqC0mT+kboFF4QU5k9qujv0=;
        b=o1wSLSdwsBiVHX1mVGOpA0YIlYZGHrSc/8nUQc+S6Ym4tHJ6pkYGB1GyygHuUlCKUc
         swdMf+O2FsOHREegHZsBeuYTfXUDaN7PjbbQU/sRae1EXBHWSrLXYKsPmTxWEqBXU1Tf
         nWhnxGHuVKS8uqJ9D6aaOiilG32JI9h5TNDOb9lTu/Y1sj1hNlX5uJrfmFQBf4UDQe6/
         zCXMctWDgzm7YRFv5qPTvQ6JYNFpM3UhUMl3Vw4lwiinVqbXnezbLVLCFw4v5F6KN0IM
         xrRSq12BpPq6bLM0zJRoEc9xskEF2Y8l6EJ9U7gJavy9O/B9VCEzGNnq46q7EcgZA96N
         jeIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738574505; x=1739179305;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FecLJFV40YsKf9bjug9HOqC0mT+kboFF4QU5k9qujv0=;
        b=BdLzDSNLplW189ntpmWoBIg/brNjQw+9Z2E3jqmQqqk4t24EX/cGunqwZhjrAeVfg8
         E6WbfrG4JLVAt5F832uSqf/wOePRpKUiXm/o6o2VD0hNeLH0SsjT21jB46p42ThYvqAL
         uW03nj8VdDca0lLogsdkWZyWm43xfPOhs696+To39QnNW306LAg3LH3Bkmg0zeYU0UQ7
         FcT6y9YS9lsSZQitX1WDzKkJ3+D8/lOJqk5JyVh8uX/93BsCyZGiTDEsV/ylgNIeEs1K
         GqjBcZt3LezYHgKU0nAsMQTyuhKDQmJ5cRJhEvZ7bMFtp4sy602T2yjt79FAv4S+LffY
         Py6A==
X-Forwarded-Encrypted: i=1; AJvYcCXtlR0i7eg8+B6fnKbkFTaEuOJzwwi1M+mxrllwpNSQA8yhO05mVU3QouZjhJMNtcM/itujlOp/bbItAWc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4vuOmqZ+44zxCGLseOKcUvxU0IJnszYEOV2cLUfLUIwGeWHs+
	nyDUc4y/hwDZ8Iv6ltra68TgFWfSUBhzAg2OAVg4Ao0eQvyK7TSlwofBr7bUuWY=
X-Gm-Gg: ASbGnctwsRNPwI+R+VlwfUMnhHYzjPY1UobTsH2iBMYTO35mTa8LcuGlF538AsKmCVB
	6VaD1+mVjVQJTEovc5VrFX5GWQC55uDzdQQlVyLejXpvdGIH668lh3Xna3rvgFpy937vJxcssey
	JTs+5vT+dgQQQzevWUXQkxBfHXLuH+XxdQCzfo/itzNFXWT4vVzHxfiusxrjIDZ43ie2hgmPJWo
	pIPpFKE2MW9g+5XNXhz3dmst7CGxPflfHMv09O7lvBCgfwwNGn/K6Ne6mPn0+hNm1u3ofWPMAbZ
	h1LE0AsMXOudJFeeuA==
X-Google-Smtp-Source: AGHT+IH9KGD23tB39BAlcfOmC4lsmAgIuLHGF770EcDsHu1IIGvh7ryZ2hgi0Ns5kUl08HPwrQt0Lg==
X-Received: by 2002:a05:6a00:2b43:b0:725:ebc2:c321 with SMTP id d2e1a72fcca58-72ff2b659e1mr21628782b3a.4.1738574504557;
        Mon, 03 Feb 2025 01:21:44 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69ce076sm8181750b3a.138.2025.02.03.01.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 01:21:43 -0800 (PST)
Date: Mon, 3 Feb 2025 14:51:41 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Pierre Gondois <pierre.gondois@arm.com>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: airoha: add CONFIG_OF dependency
Message-ID: <20250203092141.irtn3qf5feowg4jt@vireshk-i7>
References: <20250122065516.1483301-1-arnd@kernel.org>
 <20250122070000.sawplgg5tfhrvdfw@vireshk-i7>
 <3ccab07b-6cb9-46be-8a8e-e7745f5a951f@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ccab07b-6cb9-46be-8a8e-e7745f5a951f@app.fastmail.com>

On 03-02-25, 09:04, Arnd Bergmann wrote:
> On Wed, Jan 22, 2025, at 08:00, Viresh Kumar wrote:
> >> 
> >> diff --git a/drivers/cpufreq/Kconfig.arm b/drivers/cpufreq/Kconfig.arm
> >> index 704e84d00639..9e46960f6a86 100644
> >> --- a/drivers/cpufreq/Kconfig.arm
> >> +++ b/drivers/cpufreq/Kconfig.arm
> >> @@ -18,6 +18,7 @@ config ARM_ALLWINNER_SUN50I_CPUFREQ_NVMEM
> >>  config ARM_AIROHA_SOC_CPUFREQ
> >>  	tristate "Airoha EN7581 SoC CPUFreq support"
> >>  	depends on ARCH_AIROHA || COMPILE_TEST
> >> +	depends on OF
> >>  	select PM_OPP
> >>  	default ARCH_AIROHA
> >>  	help
> >
> > Applied. Thanks.
> >
> 
> It appears that something went wrong when you applied the fix,
> the version that is in your tree now makes no sense:

Not just that, I actually fixed the problem by myself and so the
commit doesn't have your credentials. I somehow managed to do two
stupid things:

- Lost your original commit, which I have surely applied as I replied
  to you earlier (and I reply only after I apply a patch).

- Reinvented the wheel, that too incorrectly /facepalm .

> --- a/drivers/cpufreq/Kconfig.arm
> +++ b/drivers/cpufreq/Kconfig.arm
> @@ -17,7 +17,7 @@ config ARM_ALLWINNER_SUN50I_CPUFREQ_NVMEM
>  
>  config ARM_AIROHA_SOC_CPUFREQ
>         tristate "Airoha EN7581 SoC CPUFreq support"
> -       depends on ARCH_AIROHA || COMPILE_TEST
> +       depends on (ARCH_AIROHA && OF) || COMPILE_TEST
>         select PM_OPP
>         default ARCH_AIROHA
>         help
> 
> ARCH_AIROHA requires CONFIG_OF, so this change does nothing,
> and the dependency is still missing for the COMPILE_TEST case.

Going to send this patch now, lemme know if it looks okay:

commit 9d51d2710061dfa7f2568287c6ed125b858b7318 (HEAD -> cpufreq/arm/linux-next)
Author: Arnd Bergmann <arnd@arndb.de>
Date:   Wed Jan 22 07:55:01 2025 +0100

    cpufreq: airoha: modify CONFIG_OF dependency

    Compile-testing without CONFIG_OF leads to a harmless build warning:

    drivers/cpufreq/airoha-cpufreq.c:109:34: error: 'airoha_cpufreq_match_list' defined but not used [-Werror=unused-const-variable=]
      109 | static const struct of_device_id airoha_cpufreq_match_list[] __initconst = {
          |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~

    It would be possible to mark the variable as __maybe_unused to shut up
    that warning, but a Kconfig dependency seems more appropriate as this still
    allows build testing in allmodconfig and randconfig builds on all
    architectures.

    An earlier commit, b865a8404642 ("cpufreq: airoha: Depends on OF"),
    tried to fix it incorrectly. ARCH_AIROHA already requires CONFIG_OF, so
    this change does nothing, and the dependency is still missing for the
    COMPILE_TEST case.

    Fix it properly.

    Fixes: 84cf9e541ccc ("cpufreq: airoha: Add EN7581 CPUFreq SMCCC driver")
    Fixes: b865a8404642 ("cpufreq: airoha: Depends on OF")
    Signed-off-by: Arnd Bergmann <arnd@arndb.de>
    [ Viresh: updated commit log and fixed rebase conflict ]
    Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/Kconfig.arm | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/cpufreq/Kconfig.arm b/drivers/cpufreq/Kconfig.arm
index 0ee5c691fb36..9e46960f6a86 100644
--- a/drivers/cpufreq/Kconfig.arm
+++ b/drivers/cpufreq/Kconfig.arm
@@ -17,7 +17,8 @@ config ARM_ALLWINNER_SUN50I_CPUFREQ_NVMEM

 config ARM_AIROHA_SOC_CPUFREQ
        tristate "Airoha EN7581 SoC CPUFreq support"
-       depends on (ARCH_AIROHA && OF) || COMPILE_TEST
+       depends on ARCH_AIROHA || COMPILE_TEST
+       depends on OF
        select PM_OPP
        default ARCH_AIROHA
        help

-- 
viresh
