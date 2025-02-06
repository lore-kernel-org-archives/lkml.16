Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A5722619B
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 11:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738841312; cv=none; b=ejZazKVP6uPmK7N7/3JApC0XHJqJbrhvSq+JRC6gP6vLfDiynzf96z2iXt3g3W9+KCQ9DkzxPL6rAMhUEm8BxTsnNJDxj/6HRUup7si9kFDAowDfscVA90/xSwRfFvNAkAUgqkTjHsOucHro/ptrjXE+DR6uyfHw60K0aBYmdx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738841312; c=relaxed/simple;
	bh=gkvL/tIQOpjbV+IEHUwsroudtsX79+gQy7ra+TBn9ms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V+WX/u9zfxz8zIdUwyxWeIb3Q0nfcEaY5WEzoelsTgPa6DD7uYp7mDe5qhXLax+b2CQSJACnHImjd1rkk1rFq02AKezhPBqX0kQljJRh6x9fraTSCAjy4GpvkeZpSFbx4+PiySLTe6jqrtrdgGtkqjrHJA2My+WXvWS8AceNTMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RcJUMDl9; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RcJUMDl9"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-51eb1818d4fso443591e0c.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 03:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738841310; x=1739446110; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xdTDdTuLvbbZnRC35I/8pWi+JuCtYdxpx4t0NnXNk6g=;
        b=RcJUMDl9c/fVnUw+ISkKfans1zhXt3DMl2rFEkyk8cNx1sBVZbENiaD0gpE7rx8acr
         5M1DORQ1rAy4jznxRCyblVbX/R2zyIs9nTg7VZZUaXOvVXCn9E5xmAPjGpM8yAYX6YEs
         GXPPyeb6f2VN4uzhY2i7Vm04UaERoCJYmkXdqedgGUjiaaGAfNS3JpfFj9nANCrYBqeJ
         2X3lz0TKgPT2hSMqLIWlQg84DSZnPZDKnIMwSsxDQFlxFja4/1zS1FTvuRi2gyvCcUIn
         xQgR0GbXgnF1KHehAczb+gCSOTmrAmA4S5HSEhVaissAsAE7W6tpiQhOjNKAzG+THhwd
         bIag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738841310; x=1739446110;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xdTDdTuLvbbZnRC35I/8pWi+JuCtYdxpx4t0NnXNk6g=;
        b=fgpSeQlP7c+rhHh/ILXD2bCsJ/eaP7T8p+FLPf0754BkRewICCZQkhFMw7/ipQzY1d
         UWG28TkNf6vMb60lSxcY17K0TU1u3+KUhkre0fQQHjSHVIuXFfNE9Mj8rd3F+sV97Zmn
         +DNv0Zr8fWqWuJDx+/QJspgYd8TKebJqx4sufVzKrS9cxKiMMQ0JrPUUA3PUF1KkFneI
         nXsYBgFdzUZxsePSwvCKZeLaEi7OHI8P1lwX4sVnEqOv15wEB1k4+6z5viS6pM6h9D9J
         yTjkJEAMobTFgnYQhZTBk8wgtE4rteY2EENE/Pksg9UQxuPZx7SpWUzdjGu/qUkobzVh
         2Khg==
X-Forwarded-Encrypted: i=1; AJvYcCU2SCeEsCCJN+Q+G0AwPNtFIyaGDkzW7QsPO3ErwjamN1MLXG3gl1veTM1N2DKpJvsLR0mhd/pz7FBvVrU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMFWHeOno9RB1yustREsbVji+meq/rwzwAVoi2g4cmMwkfFlU/
	PzFV+O+UYWG+ESFyewTe5Qemr6qIOD2vd8thu5Wbp0Uic3JJwfv+KdF4baWAMLc1PGnQNmXlJxR
	VOi0GaGliJ9pcDeL4LgfSyD3eHDB4LZhMyKdo+w==
X-Gm-Gg: ASbGncunD7+wnSEY6df0eVjlIASp8GfYJ/x8vLoxLqdJjNBmBz7Aj0J5/SUYYbjnQy2
	uW+eojAQMh07pk7PFRlYc3gj09mebd7kVGgqjgR78oUrDjNF/LN+6aVAvcZxrlCR2jTByYODCTg
	==
X-Google-Smtp-Source: AGHT+IFVhSbR4SlXlIdBGR5/DW3hEWOyZBmOavtvcjBArrMJE2u+LJyOt+XjqQ6Rij82LJes4ZkKzTbmgfRma58x7Ns=
X-Received: by 2002:a05:6122:3409:b0:51e:f800:f7cf with SMTP id
 71dfb90a1353d-51f0c519723mr4006718e0c.10.1738841309685; Thu, 06 Feb 2025
 03:28:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250205134455.220373560@linuxfoundation.org>
In-Reply-To: <20250205134455.220373560@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 6 Feb 2025 16:58:18 +0530
X-Gm-Features: AWEUYZkLyxExF5EDZlJh2dRl_k_H3fRPFlRe5hOC4Smd0GjRAWK4R6ruu_jcYyU
Message-ID: <CA+G9fYsREyVPJYFeVYK1yu1NxUdcLrLNcNtiP2Drjaczr4LgMg@mail.gmail.com>
Subject: Re: [PATCH 6.12 000/590] 6.12.13-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev, 
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, 
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, 
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de, 
	jonathanh@nvidia.com, f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, 
	srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, 
	broonie@kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Anders Roxell <anders.roxell@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	David Laight <david.laight.linux@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 5 Feb 2025 at 19:16, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.12.13 release.
> There are 590 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Fri, 07 Feb 2025 13:43:01 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.12.13-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.12.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Regressions on the arm64, builds failed with gcc-8 on Linux stable-rc
6.12.13-rc1. But the gcc-13 and clang builds pass.

This was also reported on Linus tree a few weeks back [1] and also seen on
the stable-rc 6.13.2-rc1

Build regression: arm64, gcc-8 phy-fsl-samsung-hdmi.c __compiletime_assert_537

Good: v6.12.11
Bad: 6.12.13-rc1 (v6.12.11-634-g9ca4cdc5e984)

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

* arm64:
    build:
     * gcc-8-defconfig
     * gcc-8-defconfig-40bc7ee5
     * gcc-8-lkftconfig-hardening

## Build log
n function 'fsl_samsung_hdmi_phy_configure_pll_lock_det.isra.10',
    inlined from 'fsl_samsung_hdmi_phy_configure' at
drivers/phy/freescale/phy-fsl-samsung-hdmi.c:523:2:
include/linux/compiler_types.h:536:38: error: call to
'__compiletime_assert_478' declared with attribute error: FIELD_PREP:
value too large for the field
  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                      ^
include/linux/compiler_types.h:517:4: note: in definition of macro
'__compiletime_assert'
    prefix ## suffix();    \
    ^~~~~~
include/linux/compiler_types.h:536:2: note: in expansion of macro
'_compiletime_assert'
  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
  ^~~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:39:37: note: in expansion of macro
'compiletime_assert'
 #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                     ^~~~~~~~~~~~~~~~~~
include/linux/bitfield.h:68:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
   BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?  \
   ^~~~~~~~~~~~~~~~
include/linux/bitfield.h:115:3: note: in expansion of macro '__BF_FIELD_CHECK'
   __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: "); \
   ^~~~~~~~~~~~~~~~
drivers/phy/freescale/phy-fsl-samsung-hdmi.c:401:9: note: in expansion
of macro 'FIELD_PREP'
  writeb(FIELD_PREP(REG12_CK_DIV_MASK, div), phy->regs + PHY_REG(12));
         ^~~~~~~~~~
make[6]: *** [scripts/Makefile.build:229:
drivers/phy/freescale/phy-fsl-samsung-hdmi.o] Error 1


## Source
* kernel version: 6.12.13-rc1
* git tree: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
* git sha: 9ca4cdc5e9841a39adf2ea1fc8ae45d28b4c85ea
* git describe: v6.12.11-634-g9ca4cdc5e984
* project details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.12.y/build/v6.12.11-634-g9ca4cdc5e984

## Build
* build log: https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.12.y/build/v6.12.11-634-g9ca4cdc5e984/testrun/27199296/suite/build/test/gcc-8-defconfig/
* build history:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.12.y/build/v6.12.11-634-g9ca4cdc5e984/testrun/27199296/suite/build/test/gcc-8-defconfig/history/
* test details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.12.y/build/v6.12.11-634-g9ca4cdc5e984/testrun/27199296/suite/build/test/gcc-8-defconfig/
* kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2scp7S3yK4hl95VryTZn5t3cUVh/config
* architectures: arm64
* toolchain version: gcc-8

## Steps to reproduce
tuxmake --runtime podman --target-arch arm64 --toolchain gcc-8
--kconfig defconfig

## Links
 [1] https://lore.kernel.org/all/CA+G9fYsHGrgZsEEVvP0XMcAhLyCYnrCPgZJ1puT6cfQBCGUB9g@mail.gmail.com/

--
Linaro LKFT
https://lkft.linaro.org
