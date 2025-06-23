Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D1921B9C9
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 21:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750713839; cv=none; b=F7fSZppdifeeX0fX4Ka5b8Zv49J2cDtcKDBavmJ6jTjxrHPO/Ui/Bw0QByyg8jWBpNvTlcaq7SWglVotrZmN/2i/JDdOMp5g90jVOD6hx2Kr5UH23V6BGVlmi31s3owbmOXuVpTIhp4+Ftm6eG0mBeeDuPAVkN1f7KnznS8hm8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750713839; c=relaxed/simple;
	bh=/Kg0WRXw5VKnsXhRWYSpnatlSaD/D8BnYoR5CRjJ7wQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=thd7p7L9BdWfijBCrmXB/LME7GcY5peEGIn9UXIUleLaMhDjZp5FRtaSKuVt0vrLUHEIc/o0AUL5UF4p0mOLMJm7X/SBnos4ja1EeX99BWXKJgjuf1RVZtLQ1j+XHl+382v9ddcLZ3pSlprhS88L998Ey0YbcShGdzrkRDcJ0zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lSOwPplZ; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lSOwPplZ"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-312e747d2d8so3741951a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 14:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750713837; x=1751318637; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=By+WfrXAyPyITn9F5TDk+hwemNBoK/rCwALmacNE1Jk=;
        b=lSOwPplZ91UDKmLvEUVhFin2qG1CQnWWY0syFUbgwyk4VypirZlP9n9Z3evsr7q3jX
         PdHj1OFLQBw+jmk2ApFlEycPy/FDodod8nn7qeukn3M5EeNk4S0goO1Z3BP5rnMAOGMC
         KOa6PbWvqbMd7MP4r6tdNk/Y1TMdAtQ7k3hLIr/0BuvWzsDIsVkPDJke432grohUQHvd
         FFHBPZPzF8iQpTHPCApSMm84Dsp6gA2F5P8HojEJNlv+tg/bltdYNLdg+katsZL/JlKs
         gF1FriW1jj4t0itmguB+YnwEhOdpHrQJ4AADRndkdVWt0BDBUAI9uwT7TLg3fM29h9U2
         eGkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750713837; x=1751318637;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=By+WfrXAyPyITn9F5TDk+hwemNBoK/rCwALmacNE1Jk=;
        b=wwW4GhS51ODXnjjlBthR5nPui2NZ85okR6X5Lb9kxoHXCRJhgA6qYnjrMyoNh4iP0y
         WbVp5GFnSlLJkhvTcGHLLpfIIf5fdEDWit/A72O1rGk0bQhQNryOK44mlkFH8YmtrZdD
         49ImtKXSffo5Ae1AgnG5e/og0YMcRSdQ9buoTd8dFBQbQTvLhgUmY72WlV2z8l5qBGpV
         kpdKfvt5/E7cbU6Sb6zOZNcUEU+ftSau3+T/rfgHpSNACZBi645KfjdvNACPJ1JjF02h
         jVaMfO71yXiEEMBCFhxUtrq71RctCz5TpoFNIbEy1K2b9mTANQ18ynq3IZ55YOwYtEdh
         Gm+w==
X-Forwarded-Encrypted: i=1; AJvYcCV+o720PzWKGzX1Cs2Eq/wyQ/dUfYLiw4G4dwz8nfvYe/SrG/z8CZh2knGY4k2/prBKtdz/tKdm8g7w3m4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcAyifGiDOfSPYOGwsjPsym3SpftwrRdEhsPkXxqRbbZ/tGCgk
	2Wh1Zg/YNq4DvvV0+fiWOj345fL5EkPALLduiV6voRyW9ih0HV0HijPfa2aerRSgosCqFot8RO4
	cYLovUJMXqxtE7iMCYwxCs9WiCzvj+5EtMhgKtN+PfQ==
X-Gm-Gg: ASbGnct+GzzCQswtzNlFUlkS/V0HMOZzT1L1H4ZaWTSBjmKcTkYtMLVf3ZqyEV5PyzB
	/2LEEzthxrHLXBXd5D+ntnHFG+otnkQgMFP5poAP/7s4BEffd0nDlPINGp87eP2rSzXpPHr0jof
	TCG0EtnMFCrM4O0X9SL1BIqVG5LWoicGhCasbwIVZ8REKKt+7nZfvECBmZSUN0Wu4qZ7ktoVe/D
	lZV
X-Google-Smtp-Source: AGHT+IHJlRRLWWoQ6yh3AeFZC83NODh6v6Ss+DAN43JkjEBbpOfz48bjecKNoDN25759ZXlyzX8KWTWbCxW22IU+1EE=
X-Received: by 2002:a17:90b:38c9:b0:313:f995:91cc with SMTP id
 98e67ed59e1d1-315ccc32116mr1516367a91.2.1750713835691; Mon, 23 Jun 2025
 14:23:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250623130626.910356556@linuxfoundation.org>
In-Reply-To: <20250623130626.910356556@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 24 Jun 2025 02:53:43 +0530
X-Gm-Features: Ac12FXzeAzIXRWJ7lKN4j0ifqWtMYFRuT9M7G2PFqIjYGj7Dh1wwE6lAMfMxRVY
Message-ID: <CA+G9fYtROQg1rpX_6uG-AYktDOHqaEzEPVvL9Fxi9mQfLy6zBQ@mail.gmail.com>
Subject: Re: [PATCH 6.6 000/290] 6.6.95-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev, 
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, 
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, 
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de, 
	jonathanh@nvidia.com, f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, 
	srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, 
	broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Jun 2025 at 18:39, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.6.95 release.
> There are 290 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Wed, 25 Jun 2025 13:05:53 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.6.95-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.6.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Regressions on parisc, s390 allmodconfig builds with gcc-13 and gcc-11 failed on
the Linux stable-rc 6.6.95-rc1.

Regressions found on s390
* parisc, build
  - gcc-11-allmodconfig

* s390, build
  - gcc-13-allmodconfig

Regression Analysis:
 - New regression? Yes
 - Reproducibility? Yes

Build regression: stable-rc 6.6.95-rc1 s390 parisc allmodconfig
sdhci-esdhc-imx.c 'sdhc_esdhc_tuning_restore' defined but not used

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build errors
drivers/mmc/host/sdhci-esdhc-imx.c:1571:13: error:
'sdhc_esdhc_tuning_restore' defined but not used
[-Werror=unused-function]
 1571 | static void sdhc_esdhc_tuning_restore(struct sdhci_host *host)
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~
drivers/mmc/host/sdhci-esdhc-imx.c:1549:13: error:
'sdhc_esdhc_tuning_save' defined but not used
[-Werror=unused-function]
 1549 | static void sdhc_esdhc_tuning_save(struct sdhci_host *host)
      |             ^~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

## Source
* Kernel version: 6.6.95-rc1
* Git tree: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
* Git sha: 44f41e69469d0de714a6e7e56848c3e423ac2bb9
* Git describe: v6.6.94-291-g44f41e69469d
* Project details:
https://regressions.linaro.org/lkft/linux-stable-rc-linux-6.6.y/v6.6.94-291-g44f41e69469d/
* Architectures: parisc, s390
* Toolchains: gcc-11, gcc-13
* Kconfigs: allmodconfig

## Build s390
* Build log: https://qa-reports.linaro.org/api/testruns/28839625/log_file/
* Build details:
https://regressions.linaro.org/lkft/linux-stable-rc-linux-6.6.y/v6.6.94-291-g44f41e69469d/build/gcc-13-allmodconfig/
* Build link:  https://storage.tuxsuite.com/public/linaro/lkft/builds/2yuYHPJ5UcFEMxXVXUOIqaCBQWP/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2yuYHPJ5UcFEMxXVXUOIqaCBQWP/config

## Steps to reproduce
  - tuxmake --runtime podman --target-arch s390 --toolchain gcc-13
--kconfig allmodconfig

--
Linaro LKFT
https://lkft.linaro.org
