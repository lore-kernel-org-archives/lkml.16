Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A4622B5B1
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 15:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744125778; cv=none; b=L0+R8V7/G7aEvS12fdGfdQR2lwNDto5Sp51ytmGDUWljWfWBC9Jag5EByZI8QOwLiYIPdZqesSamk5H6Jgbb1SbGP8/7PyjNyZINstXpoC4TFL5uZ3pM16LgyIfLAXomtRpKXJvGJr4bLyzGgBXWWqiItT8caXr9bBwZKg0BoCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744125778; c=relaxed/simple;
	bh=3lpzITRPn00lYD/ndslRx6AUWRX254zjphl4pSWfNo8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=opftk87vI4jjetgiQFMbFmel9zic8NmJImjPOTfbG5qyxeCh1ixHr7pI6n0EkK61F1eSobuadC8mrEGHMGFul8qw1+OolTNjkNaEaFtD61kyefxB/fiJqUI1zA0DiSOHmVZONrrxLJbugnzOvrGm4lAiv6/Rnxf+bb5ey9m/agU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SlBgCIex; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SlBgCIex"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-86d377306ddso2457420241.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 08:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744125776; x=1744730576; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Cxg9LKA6+kQvyEUrjxprc+UTcXgCvZJ1Wa5TchzdHtU=;
        b=SlBgCIexBNg9JgdgukxvMc1NlzxmsmSjw6EvTBALeRrNjiCk3Mxi4hkMsJe9a5qHOF
         kbjl1k7uapT68wIzrr8tsbYsbkVa50oO78+I89U/675QSAYWqCuWqwBBJr8sVcd2quoZ
         5s/ajZc6KiJdtb1VSyLeoa4nB2vOAmc5Ohh1RlqF8MeRGVI9WiHvZmgCTsXTDFhdtdzK
         XAOr7FvO7ga1JEPnKcP79qQ0FI3LNWBisPb3iCy22tsBCEOXT1U26YrZ40ZKCpVk8jez
         dmQByVz3nHS1xozJQjOzplaxUYj8A2B7XiyQnXMUrrEC3EFmCQ+lSgv7mPSsiWZl1BE/
         4wRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744125776; x=1744730576;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cxg9LKA6+kQvyEUrjxprc+UTcXgCvZJ1Wa5TchzdHtU=;
        b=AzxGXf2L6kOp/4kzdx/phGZEuF2PGGEPqJFqbOWcM8ww6q5U5kT2zjioOBwQq3Y+b9
         KgK1pkpVlVT7TADxDe63/3aZF71xDR203ImEA7QEIqIZGbu+uTIMroOQdy3xU6q0dmwd
         E4P6MUc/zEdB+Pc02RLOeEqwljEW9Gj0ATDFffYxYYptbiTYztvRwRzarqczJGVaWPfw
         cPrzcnDpzs2XzoC2pV509zY24lDq2yzKE+RWUhxvcdOHU35eNywnnulNEBa7uS0cQT1k
         lOl8r4j+7SXf8Q6+aSyjH21PRicreB7jhZR4da5GlwORwC0OO44BSrtgSuSTnrDMpz2g
         J33Q==
X-Forwarded-Encrypted: i=1; AJvYcCXNKUXTT/+VnKYnRUcvN5gKNLv8+nwAsQTxpFSSAneHmTeN6SUIslHcZl/Tqgv8C845693n0dgT1S1BIeo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwaFPGFaz7aVFTJAb9FTGvMlPi7H6MyaZMKBCHtPE/Ex39Y8X4
	bIOTuqzQbkKl3UqXQpSQbnHkZwSCzFMslgZItzsZRpQ1cMjoNZcvc+k41yUW1nBFpn6nAEx314A
	HaPPqScoYxIS7SxMhG9sCyh+lFTOQkJyhxAZqng==
X-Gm-Gg: ASbGncsjZ/X6DA/7bhM5WYhL216K2OFBf7lFhgwkE1dJiIbVA4tc57nltOLXbmRoKPx
	OzGerkHZMCUWXjUPMBRvq9mSoSpwhuAdZuZFJ4AMQIk1n32iS6WOYOpy7pbiMvwfLSg4/qunAzc
	nVbv9eipAzI80QEKDHk7ofsJTX9tQ9J1B/etNFLbOU7kuYmclDMdRSl4g1ZGj6nikzuVY=
X-Google-Smtp-Source: AGHT+IEtePmmvCUqzXP4fQmhOiQg0gVcd3/T0A8xgplxbFp6FtfV9GDDW+Rjpln3N7ol4Kj4hD73PnpvQwrVCf9mnBM=
X-Received: by 2002:a05:6122:1d0a:b0:520:4996:7d2a with SMTP id
 71dfb90a1353d-527730f997amr9204517e0c.10.1744125775647; Tue, 08 Apr 2025
 08:22:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408104914.247897328@linuxfoundation.org>
In-Reply-To: <20250408104914.247897328@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 8 Apr 2025 20:52:44 +0530
X-Gm-Features: ATxdqUEXqLGH0AeyqvbH4fTDpyq3lu_NpjMbeRtitNjowMQG1rjdctxiPvSjWaY
Message-ID: <CA+G9fYu_OLOYK_+X6urte_9VA4jye7_GcTbDd1GzjnBB1VYtKg@mail.gmail.com>
Subject: Re: [PATCH 6.14 000/731] 6.14.2-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev, 
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, 
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, 
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de, 
	jonathanh@nvidia.com, f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, 
	srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, 
	broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 8 Apr 2025 at 16:36, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.14.2 release.
> There are 731 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Thu, 10 Apr 2025 10:47:53 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.14.2-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.14.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

1)
Regressions on arm64, 390 tinyconfig, allnoconfig builds with clang-20
and gcc-13 on the stable-rc 6.14.

2)
Regressions on arm, arm64 rustclang-lkftconfig-kselftest builds with
clang-20 and gcc-13 on the stable-rc 6.14.

First seen on the 6.14.2-rc1
Bad: v6.14.1-732-gabe68470bb82
Good: v6.14.1

* arm64 and s390, build
 - build/gcc-13-tinyconfig
 - build/clang-20-tinyconfig

* arm and arm64, build
 -  build/rustclang-lkftconfig-kselftest

Regression Analysis:
- New regression? Yes
- Reproducibility? Yes

Build regression: arm64 s390 tinyconfig undefined reference to
`dl_rebuild_rd_accounting'
Build regression: arm64 arm rust pci.rs cannot find type `Core` in
module `device`

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

1)
## Build log
aarch64-linux-gnu-ld: kernel/sched/build_utility.o: in function
`partition_sched_domains_locked':
build_utility.c:(.text+0x3668): undefined reference to
`dl_rebuild_rd_accounting'
build_utility.c:(.text+0x3668): relocation truncated to fit:
R_AARCH64_CALL26 against undefined symbol `dl_rebuild_rd_accounting

2)
## Build log rust
error[E0412]: cannot find type `Core` in module `device`
  --> /builds/linux/rust/kernel/pci.rs:69:58
   |
69 |         let pdev = unsafe { &*pdev.cast::<Device<device::Core>>() };
   |                                                          ^^^^ not
found in `device`


## Source
* Kernel version: 6.14.2-rc1
* Git tree: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
* Git sha: abe68470bb82714d059d1df4a32cb6fd5466dc0e
* Git describe: v6.14.1-732-gabe68470bb82
* Project details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.14.y/build/v6.14.1-732-gabe68470bb82/

## Test
* Build log: https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.14.y/build/v6.14.1-732-gabe68470bb82/testrun/27939968/suite/build/test/gcc-13-tinyconfig/log
* Build details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.14.y/build/v6.14.1-732-gabe68470bb82/testrun/27939968/suite/build/test/gcc-13-tinyconfig/details/
* Build history:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.14.y/build/v6.14.1-732-gabe68470bb82/testrun/27939968/suite/build/test/gcc-13-tinyconfig/history/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2vReGJ6wjd1n99Nsg9WaH58qupU/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2vReGJ6wjd1n99Nsg9WaH58qupU/config
* Build rust history:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.14.y/build/v6.14.1-732-gabe68470bb82/testrun/27940128/suite/build/test/rustclang-lkftconfig-kselftest/history/
* Build rust details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.14.y/build/v6.14.1-732-gabe68470bb82/testrun/27940128/suite/build/test/rustclang-lkftconfig-kselftest/details/
* Build rust log:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.14.y/build/v6.14.1-732-gabe68470bb82/testrun/27940128/suite/build/test/rustclang-lkftconfig-kselftest/log

## Steps to reproduce
 - tuxmake --runtime podman --target-arch arm64 --toolchain gcc-13
--kconfig tinyconfig

--
Linaro LKFT
https://lkft.linaro.org
