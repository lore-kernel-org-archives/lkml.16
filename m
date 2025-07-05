Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6741F9F7A
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 03:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751685184; cv=none; b=gIkgceiGWGpAZemz7N3bOdEx+vpbHvjmvR1vb3Pmz4/EskPlLhrZbsDF8HWoFfK5Gc6hKPZApsPTC5YagB8+mhiq++937iBRBuj1bEYvt+3n6Uddh5zbaoiZS6SV3nBYtXi/cslVps2D0QMeUo5Va129tiNdOkgZ/hfXZ9oNE4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751685184; c=relaxed/simple;
	bh=DEgrMsqG6/81IQwcVT/EV/oJMUsYcrrAGjo5olWT+6g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l41iQxvwUdKRtMlLI49HFlsxralolGYGcMxTY6XHQiAuLx2yXST8AzAvOsjs+03aYfbbeZ+d3w9+ZU+o4RMwgsDQaufXWbP33mH9OkEayi9W8ZSwDCNVWWO0gvlLii4AWPeprweH8AKrccSKTPecjgm8Dmq5IcadNgnTWsn9i5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NK9Tq898; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NK9Tq898"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3138e64b3fcso1086180a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 20:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751685181; x=1752289981; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FY/r4k7To9wzgbUQkWyprZDjGaEv6yD5m4oe3Q+2M7c=;
        b=NK9Tq898Yk6u23k4aLttYkK3tQ7S+GFBKMuttyLQYQYyKYO2J99BQ0w1Pw8EeqWFqO
         p4wdi2ABZDWiHSBu/fDsK9rWwwvqlN1ppqHVs/3CbpucT3jOXmXPMDanVQkJTcChlKkX
         YlHg92Bs+q8TxYBD6/pMO7K4qFG5PdHjo39gcUT1ZVthf2jesGxjlQ2D62x1Hiqd+Tnz
         i4Fs5IFZBuZa7gNDN1kcYY3ME3K4jR2yl0jzsLqpqTytkRtDYeQBcpeWBnoGkt3vctHa
         euWJie910ogTlvb0JWbB7IM6rd3cdoYGSd6WokGgkI2cBiz99ewuS3znqlpBepNqySED
         pbjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751685181; x=1752289981;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FY/r4k7To9wzgbUQkWyprZDjGaEv6yD5m4oe3Q+2M7c=;
        b=raqR4mUibxpJlW0xQrAJnhss2LcpsyV3lzBmHproTasXPOpmCAZrtcSlCQxQzFrKVw
         gnOLiq15lGFF+fuPWtE+BDAfsKmyUVAZad9vs4FCn3smGKzosBMXuXu1nvtGZ475V47A
         k8yEa+IiP9j4SgS1ezWKFsqjFbcKiju3b58OXTWoDVvRGgCjFkUpmizNpWfkCsSuyXiJ
         gkb7I7plDE6kx1Ciemoxy3QS31PY9DWGkGurs3xYjI90twerqwk+iMhF6nF+Xuu3fucf
         va2RcZwAeJtX/XZa4RoweFOgsIIsQnNjkEcxF0CN8wfl15lx3IMT3PSMoSrFFyH2mw5L
         TaSg==
X-Forwarded-Encrypted: i=1; AJvYcCWXshqlMGhu/loWBa2dVRicQI1D546FWReOMXzweIGcfKuPb8akxyIewzmMZ81ifpXWhOe5YtsuqRxH5uE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjJqwuOYqlyNUxgQC1aNm7EdaHb9X879+tUL1dMnMXkOiGGM1Y
	Ipd3mBHv7y8zOgqkOJTMXSN9tIFyNlhuVi5lXucKFvjBejSb5tqgLZPLCncf25B5ZYS8znS6+gK
	KILj8Jo4ElJKDkvS7JChfxtvjrZJAIogWOYZRTbMGWA==
X-Gm-Gg: ASbGnctT1tNk2R6AjOAn9SRyPzSnC8mjeF193dvMI219/VReUBdLPy5ddMyGBSZ4H87
	ZOH3DAWWNl+DlZ4n7Dl3v0yEWVqh5hdhneYJm8xXlezR1W0tlTeue+H5n6yhTY4Oo8oZfzK1bMJ
	7Ao5Leg7QANl9U2ZH2hz8T2vkVl4xW6NGAScI2uIayVHDhgCI5f7HbmJoNp9Cg2jHIDIZTMsg3Z
	FCO
X-Google-Smtp-Source: AGHT+IGflJd1JaTbpa/qzIA7n7sOZJ4lzJGI9r7FMuK2hOKRMEiMcWrwu7I3vhUYaLXYhtjFFgqeZkJRoJXRteTbCI0=
X-Received: by 2002:a17:90b:3fcd:b0:312:959:dc49 with SMTP id
 98e67ed59e1d1-31aadcf7abemr5905357a91.13.1751685181476; Fri, 04 Jul 2025
 20:13:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250703143941.182414597@linuxfoundation.org> <CA+G9fYu=JdHJdZo0aO+kK-TBNMv3dy-cLyO7KF4RMB20KyDuAg@mail.gmail.com>
In-Reply-To: <CA+G9fYu=JdHJdZo0aO+kK-TBNMv3dy-cLyO7KF4RMB20KyDuAg@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Sat, 5 Jul 2025 08:42:49 +0530
X-Gm-Features: Ac12FXydE-DpGIZ-SmYQ24iTSR8CT1Qg6kyUB_tQ54bVVr8vDj-OLA5wJ2J8fr0
Message-ID: <CA+G9fYv4UUmNpoJ77q7F5K20XGiNcO+ZfOzYNLQ=h7S3uTEc8g@mail.gmail.com>
Subject: Re: [PATCH 6.6 000/139] 6.6.96-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev, 
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, 
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, 
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de, 
	jonathanh@nvidia.com, f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, 
	srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, 
	broonie@kernel.org, James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>, 
	Yeoreum Yun <yeoreum.yun@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Anders Roxell <anders.roxell@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Jul 2025 at 18:55, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> On Thu, 3 Jul 2025 at 20:42, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > This is the start of the stable review cycle for the 6.6.96 release.
> > There are 139 patches in this series, all will be posted as a response
> > to this one.  If anyone has any issues with these being applied, please
> > let me know.
> >
> > Responses should be made by Sat, 05 Jul 2025 14:39:10 +0000.
> > Anything received after that time might be too late.
> >
> > The whole patch series can be found in one patch at:
> >         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.6.96-rc1.gz
> > or in the git tree and branch at:
> >         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.6.y
> > and the diffstat can be found below.
> >
> > thanks,
> >
> > greg k-h
>
> The following build errors were noticed on arm with gcc-13 and clang-20 on
> the stable-rc 6.6.96-rc1.
>
> Test environments:
> - arm
>
> Regression Analysis:
> - New regression? Yes
> - Reproducibility? Yes
>
> Test regression: 6.6.96-rc1: coresight-core.c error implicit
> declaration of function 'FIELD_GET'
>

Bisection results pointing to,

    coresight: Only check bottom two claim bits
     [ Upstream commit a4e65842e1142aa18ef36113fbd81d614eaefe5a ]

The following patch needs to be back ported ?
   b36e78b216e6 ("ARM: 9354/1: ptrace: Use bitfield helpers")


> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> ## Test log
> drivers/hwtracing/coresight/coresight-core.c: In function
> 'coresight_read_claim_tags':
> drivers/hwtracing/coresight/coresight-core.c:138:16: error: implicit
> declaration of function 'FIELD_GET'
> [-Werror=implicit-function-declaration]
>   138 |         return FIELD_GET(CORESIGHT_CLAIM_MASK,
>       |                ^~~~~~~~~
> cc1: some warnings being treated as errors
>
> ## Build
> * kernel: 6.6.96-rc1
> * git: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
> * git commit: e950145d456d01fa4e589d5e6183c2f8f0676743
> * git describe: v6.6.95-140-ge950145d456d
> * test details:
> https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.6.y/build/v6.6.95-140-ge950145d456d
>
> ## Test Regressions (compared to v6.6.94-289-g33e06c71265b)
> * arm, build
>   - clang-20-lkftconfig
>   - clang-20-u8500_defconfig
>   - clang-nightly-lkftconfig
>   - clang-nightly-u8500_defconfig
>   - gcc-13-allmodconfig
>   - gcc-13-lkftconfig
>   - gcc-13-lkftconfig-debug
>   - gcc-13-lkftconfig-kasan
>   - gcc-13-lkftconfig-kunit
>   - gcc-13-lkftconfig-libgpiod
>   - gcc-13-lkftconfig-perf
>   - gcc-13-lkftconfig-rcutorture
>   - gcc-13-u8500_defconfig
>   - gcc-8-u8500_defconfig


- Naresh
