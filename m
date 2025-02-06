Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFF61A3174
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 14:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738853824; cv=none; b=i2adiE9AXgIvHOIh+fM/mHhGKJ7TF9Suoae+o2jHiy4jc7Gck/BHyzM22lZyHnrxjaEoFKDdlVlkjE+5i/aqap4d3qe0c3bPq85URkREehTyWyJudIoCG8ZtCg8MIlBYFD0KPDGA7dwhYF/vXgjr83xn/btofUm+dY27GVBSRK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738853824; c=relaxed/simple;
	bh=6uq0mAsPLJS8exNPPFK8GwkvG8bs5kLtKrK6eAgoTqM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sPkSdJIEjZ18hk6zR/C6EbAxhVx5mh8OKe9nkNM1pmSWsFhBDTYkdB0T5WUDCcHRo5GFGw522i+x23he9sm/zjhEdCtv0uBbAoPpcYCUip0IIslhUrRmqhE/ns/hJhZZx7yoHHIw36nyyRkcaN9+8OiRDCG4v6C3MEHC+7UvXiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jY2ujJSU; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jY2ujJSU"
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4b10dd44c8bso282552137.3
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 06:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738853820; x=1739458620; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jfnsTMmEDZLdDZKD5lXbIllWt+t0HFZbbF8QjtXMaKs=;
        b=jY2ujJSUSJ0aBuXzzPrwoj2Q4OuikHs6aHDw4AmvAFXvNpWndL83SjkU6dfNt6BnLD
         g5hiEIK/7f/b6aKYpFcmwRJ7iHtnnwlD5oq8ZXo7QmMiq+AQgvsOUjhOsC4Bf2jfk7mo
         KlzUu0ZdhOxZBN0TyeFR5P9zBmQXeIf0K+4O6Acj6hw8o+Pw1VEpK2IenSPmKXbbj+n5
         7gI4RujpgUFzuT1SgYTxcnvvKvtoumVpK6IPluc8/dZ9VZQuz0Xaex2cjPUo2d1vrLO8
         Dik+2e4ab+PuCEX2apFhE6J+hqXyX7v34KI4Y3GggcEpMEMpuuWm2eHe+Yu4xFtGdfUS
         kgzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738853820; x=1739458620;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jfnsTMmEDZLdDZKD5lXbIllWt+t0HFZbbF8QjtXMaKs=;
        b=R2IevZbocnNulEJFm5ZvX2yLiv8yfd9/lkcvvZs4H/VutSIM36WE7qRbOdJzZo8Z6i
         VB2f6X7X0nrZn0L1Kbc0Wc2kMonq0kGkTwWFtk0C/etpoQwbWELvLiULEntUX0n5TbwM
         N3Hv659yGZDzolPKHqxMgx0fy8051q8z85oj5Ybkueq6PNF6LwG8JMvZGtNQL4FWDWuk
         tcLcxMghho5FSNbxQaPWWx+yaoZKyUgnBD0cbsemuQ4zxHUaiJi1OP/LrNoCDMRcxhUI
         RQvY1VRnoPkLVNf7j0XNxKC1R2/GxDwHYhYjsLm3rbX+73JF11Y78w7FwV4qQptLYBda
         BLVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoSU7TeK9VuQDBx/lYFeV2cB7HPfvLMVyqSe/2U/ICmgc8mW18Oo4PzLKQjD9Oc9nD8zj5+IrxCKW3PcU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhMF4xZyhS2t1lUBdBZp1/2qei0qrxFkJMnr6fmsmOcc3k11cL
	VmI80ofkgSvzMori890XgvG0/rC9D33ayXv1v6gP4A5vYTUNVlDxoAcbydJCk0jMT+m2KKSgn07
	sOFPxL9VGRGrtty32gvcq/oArcLE9iRbaA/uTxQ==
X-Gm-Gg: ASbGncs3WylkJel2jZ/iHCUyXLhhSujiaEQ6wCuYk8U7TlhvU5pkPc2iLCbM17Lihx6
	Dnmci/ppDaqThsIejJSzLsc3CuQODkaAPz9P9yyzeYW9fvHx8BgVze5bw4LJ5WU8I+GpXwKZFp/
	uMuVtXYOAwdQykGxKgNLnfxeHeQrAMZg==
X-Google-Smtp-Source: AGHT+IF1gfa+n/8OkVpzIpcr7+uOCYLCT1ZeK9A33AjOH/LYrvhC5X9BjSQGBsh4TdmE2VYnL17ZPfLGRnsQkuzHtR4=
X-Received: by 2002:a05:6102:2b8d:b0:4af:ed5a:b697 with SMTP id
 ada2fe7eead31-4ba478e696cmr4806047137.13.1738853820234; Thu, 06 Feb 2025
 06:57:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250205134420.279368572@linuxfoundation.org>
In-Reply-To: <20250205134420.279368572@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 6 Feb 2025 20:26:47 +0530
X-Gm-Features: AWEUYZlyhthLvcxBuYa3QMp3qch5FNwA3x567X5JSJFQpCw9jy_XQspq4Iungu8
Message-ID: <CA+G9fYtCam8wR6Z-Agx6vaQOtXcomc_PaM+TX6QFY9BOFzk0oQ@mail.gmail.com>
Subject: Re: [PATCH 6.6 000/393] 6.6.76-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev, 
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, 
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, 
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de, 
	jonathanh@nvidia.com, f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, 
	srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, 
	broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 5 Feb 2025 at 19:15, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.6.76 release.
> There are 393 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Fri, 07 Feb 2025 13:43:04 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-=
6.6.76-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-6.6.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Results from Linaro=E2=80=99s test farm.
No regressions on arm64, arm, x86_64, and i386.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build
* kernel: 6.6.76-rc1
* git: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-=
rc.git
* git commit: 3b8d2f9dc632278f4bc3589b49712b752cb93654
* git describe: v6.6.74-439-g3b8d2f9dc632
* test details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.6.y/build/v6.6.7=
4-439-g3b8d2f9dc632

## Test Regressions (compared to v6.6.74-44-g2c44b59139a8)

## Metric Regressions (compared to v6.6.74-44-g2c44b59139a8)

## Test Fixes (compared to v6.6.74-44-g2c44b59139a8)

## Metric Fixes (compared to v6.6.74-44-g2c44b59139a8)

## Test result summary
total: 71538, pass: 42664, fail: 17801, skip: 10732, xfail: 341

## Build Summary
* arc: 6 total, 5 passed, 1 failed
* arm: 133 total, 133 passed, 0 failed
* arm64: 46 total, 44 passed, 2 failed
* i386: 31 total, 28 passed, 3 failed
* mips: 30 total, 25 passed, 5 failed
* parisc: 5 total, 5 passed, 0 failed
* powerpc: 36 total, 32 passed, 4 failed
* riscv: 23 total, 22 passed, 1 failed
* s390: 18 total, 14 passed, 4 failed
* sh: 12 total, 10 passed, 2 failed
* sparc: 9 total, 8 passed, 1 failed
* x86_64: 38 total, 37 passed, 1 failed

## Test suites summary
* boot
* commands
* kselftest-arm64
* kselftest-breakpoints
* kselftest-capabilities
* kselftest-cgroup
* kselftest-clone3
* kselftest-core
* kselftest-cpu-hotplug
* kselftest-cpufreq
* kselftest-efivarfs
* kselftest-exec
* kselftest-fpu
* kselftest-ftrace
* kselftest-futex
* kselftest-gpio
* kselftest-ipc
* kselftest-kcmp
* kselftest-kvm
* kselftest-membarrier
* kselftest-memfd
* kselftest-mincore
* kselftest-mqueue
* kselftest-net
* kselftest-net-mptcp
* kselftest-openat2
* kselftest-rseq
* kselftest-rtc
* kselftest-seccomp
* kselftest-sigaltstack
* kselftest-size
* kselftest-tc-testing
* kselftest-timers
* kselftest-tmpfs
* kselftest-tpm2
* kselftest-user_events
* kselftest-vDSO
* kunit
* kvm-unit-tests
* libgpiod
* libhugetlbfs
* log-parser-boot
* log-parser-build-clang
* log-parser-build-gcc
* log-parser-test
* ltp-capability
* ltp-commands
* ltp-containers
* ltp-controllers
* ltp-cpuhotplug
* ltp-crypto
* ltp-cve
* ltp-dio
* ltp-fcntl-locktests
* ltp-filecaps
* ltp-fs
* ltp-fs_bind
* ltp-fs_perms_simple
* ltp-hugetlb
* ltp-ipc
* ltp-math
* ltp-mm
* ltp-nptl
* ltp-pty
* ltp-sched
* ltp-smoke
* ltp-syscalls
* ltp-tracing
* perf
* rcutorture

--
Linaro LKFT
https://lkft.linaro.org
