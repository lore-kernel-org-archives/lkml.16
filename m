Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF66C28751D
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750242029; cv=none; b=nYQzAhy+UQkRWdLKh8edWyezOdTlWyxXrbSMNAf7HWYUe8foULh4YMTCOXwMTlhvxmD6zhf3dgFbOjDYBUvlouQSuCUxkqm/by6ash3mWfxA05tRLY1eyc31xv71/ssghu9GyGaiVRAJd058Iiar2tzEGOGArTPKImtVfne4xLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750242029; c=relaxed/simple;
	bh=TSkpXMUCGBLGW57RuPGfv/LqzC6cxyMmgIfCk78NNvQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=REklSft7Rk/+QLmhLXsiKGCaxO7aiJF8F2ruIKaLU09uLiddo/qasBi4GvvLFic0qUOpYfCH7/XgwDFctrInMwHHtzAUF2edQlo86Q0zae1UHhPlnhPITC25REKzboFDl+n370gQGEp/vOiPgsU5JzlgrGjWck5+Z4NRILz2VdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VwNFOSi5; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VwNFOSi5"
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-87ec4ec218fso1082585241.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 03:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750242026; x=1750846826; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CZscgBK7vQh5GyGDP3R0SwzOToDIeiQZZam9YvCUg+A=;
        b=VwNFOSi5uvpYti9AuZLJqrSlSr4FVHcx9wFtFhisLU7mIQl3cVr5TA39mekGOHtW6w
         yDiLu/lWbGM1WQ8BVmu2mS8sbwxEdGfGW/h56F+sV5l4ssflU/tbAfWUiAtYWPJK07q+
         cRVpyz6NRxDYVuI1yn1lFej3TWloa+VE9Wzgv2cALhPPN62u6YEPnx+pIAFsOEq6wyJK
         WI/IAApGm9sObcqNDD0YQUcqgfWCxVkC63AWenDcu+JkLNYwWYsngJ9LSdvMBK7ruISW
         CgtmPK+7QqLpsV2bcgeVkJrKtoSqU3cyUtbkgbr0qmL8zkaGlVFNkENxah0k1J7Duc6q
         69hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750242026; x=1750846826;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CZscgBK7vQh5GyGDP3R0SwzOToDIeiQZZam9YvCUg+A=;
        b=PT0Wr02/2jc81MbWdqA4PxBya0/tIWKasAiWJ3rt/Wio7nu4Rz/uwmBXo9rk7AFuYt
         QL6nXniyg8S4E+C/wAGRi1Elwix0tFdyKArJRw8yCEz0CN560okavBcFiCpNpb0w1Ab4
         JtHKmpoM5mfCzDmi+9nGBv81jui3Cy54f/xt7ZeSShA7xgWdcfDMFrw3PadmmQj8gFDM
         YNhcRdSVesppF2+rU5fOaZl4ahNkBRhsd1GtmLrt+Q2ySBC8AS+mjQ1rxzPLzSTaEkU5
         ONaL+hQYZwj99pdFTTO1VG+oybHRtD/fVHyStFaSPTrXe8osHCebon7fSQEA2V/fs5/I
         Iv0w==
X-Forwarded-Encrypted: i=1; AJvYcCUlgmGTE9aCY8SPw9QhHo7nQBaNlTtQE/CBO4bP8IjV+kxrQxCkCoj3URyYrHk0VndH4jBTlmosWPCf1Ps=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRHU7FYJQ8VbEy+f2AGoCmDI1qYKp+SDthjTNGQoQH1uSIY6PZ
	I9QFiaM55/3kcQgrElcNFYXqS41zHX1V/IO3lHfrurwJF2df7sztML4hSQ0Rd6dYHtsMLEdof5q
	ZdI+ke4ZXJzV+GgJXlLAyWGKqgauCSxupnQY5Mbz1uw==
X-Gm-Gg: ASbGncvdtwmDnP70ACVhdvNPE7fqPiYz2yrWRkZs9itsz5ltgbMmUojoznxDyW1+48S
	aN2fT2U26wbgD3eE85StQDGVXXNXGqfEpgqNtTuaKcow+gAeknTk1OXVdXzihGKBMX7kLp8DtBK
	3y3rLFE/f2ikGVblxOe2ezAO4ac71a08zfN+t6bdWtYtW0R9xUpFItBg==
X-Google-Smtp-Source: AGHT+IE3OBH47heT44z75CQFO2vVoaeyYg3Kk8JAVuB+6zADI2o9rVsm2ZYzU9bGVzLJfE7whT3gToQzdyWSK6aa+PY=
X-Received: by 2002:a05:6102:508b:b0:4e2:aafe:1bde with SMTP id
 ada2fe7eead31-4e7f61b60b9mr12500027137.9.1750242026432; Wed, 18 Jun 2025
 03:20:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250617152338.212798615@linuxfoundation.org>
In-Reply-To: <20250617152338.212798615@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 18 Jun 2025 15:50:14 +0530
X-Gm-Features: Ac12FXxVzmGim5VNLRe8LnObfmRIABb-cQ6rWKWTtElMPXcLJuXbjNGza6aHiF0
Message-ID: <CA+G9fYsda33su7S3ysR9q3TSoytpZnWtMX9jU8XXAKTTjoNz4Q@mail.gmail.com>
Subject: Re: [PATCH 6.6 000/356] 6.6.94-rc1 review
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

On Tue, 17 Jun 2025 at 20:58, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.6.94 release.
> There are 356 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Thu, 19 Jun 2025 15:22:33 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-=
6.6.94-rc1.gz
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
* kernel: 6.6.94-rc1
* git: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-=
rc.git
* git commit: 7ef12da06319e12118a7bbb823004d011c57f718
* git describe: v6.6.93-357-g7ef12da06319
* test details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.6.y/build/v6.6.9=
3-357-g7ef12da06319

## Test Regressions (compared to v6.6.92-445-g58cbe685685b)

## Metric Regressions (compared to v6.6.92-445-g58cbe685685b)

## Test Fixes (compared to v6.6.92-445-g58cbe685685b)

## Metric Fixes (compared to v6.6.92-445-g58cbe685685b)

## Test result summary
total: 217939, pass: 198129, fail: 4284, skip: 15211, xfail: 315

## Build Summary
* arc: 5 total, 5 passed, 0 failed
* arm: 129 total, 127 passed, 0 failed, 2 skipped
* arm64: 44 total, 43 passed, 0 failed, 1 skipped
* i386: 23 total, 23 passed, 0 failed
* mips: 26 total, 25 passed, 1 failed
* parisc: 4 total, 4 passed, 0 failed
* powerpc: 32 total, 31 passed, 1 failed
* riscv: 15 total, 15 passed, 0 failed
* s390: 14 total, 13 passed, 1 failed
* sh: 10 total, 10 passed, 0 failed
* sparc: 7 total, 7 passed, 0 failed
* x86_64: 37 total, 37 passed, 0 failed

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
* kselftest-intel_pstate
* kselftest-ipc
* kselftest-kcmp
* kselftest-kvm
* kselftest-livepatch
* kselftest-membarrier
* kselftest-memfd
* kselftest-mincore
* kselftest-mm
* kselftest-mqueue
* kselftest-net
* kselftest-net-mptcp
* kselftest-openat2
* kselftest-ptrace
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
* kselftest-x86
* kunit
* kvm-unit-tests
* lava
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
* ltp-fs
* ltp-fs_bind
* ltp-fs_perms_simple
* ltp-hugetlb
* ltp-math
* ltp-mm
* ltp-nptl
* ltp-pty
* ltp-sched
* ltp-smoke
* ltp-syscalls
* ltp-tracing
* modules
* perf
* rcutorture

--
Linaro LKFT
https://lkft.linaro.org
