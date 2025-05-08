Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFEF223DE7
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 08:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746692537; cv=none; b=JDXr4QO1CVm9cTJsAuUKMEFJPBEVuNd0v3wzTwUVJqzpc9FUY7Q05YhXTGhLtmyu4Fm3AVmLZdg6s5Ns2kew1uS54tYUHTX839mELOADSW2+O1pkEdTYpIym5Aq6Ot3Ik2StckOY6XHsfzbv26edPb9ZBOSg00hxwSxOTKx8o9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746692537; c=relaxed/simple;
	bh=XWfLcjDKDI/D9TTc1clgQJz4Ie+db+3RU9g/MnHeVPo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K2oZoJYFBWwt23lP+xa6RTNELj1ZzTfsqz//dUxPlIp99t1KzTEXwIGwaC5vJ7yMUrKThe9m5fnJWbo8w0vuBlzqkB+rb99keEfnZ48J8g3Ve9yrdpJWp0DbTXz0j3mi01cO9C5JP2A3qDQKA0p98r0oVfa01zcbnEOPGu1aE98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ExCB/hzd; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ExCB/hzd"
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4ddac386a29so237482137.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 01:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746692534; x=1747297334; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4SXfokFPPLJwoMKncfdiN1Zib++ikD4gCmyzaltHX8s=;
        b=ExCB/hzdmRwTJfMTM+Vu9NLQkriENGUZ8ffvWr0kmbsAm1dAmYy45wfBkSq6jsTV9B
         ov7WnQFQAB+Fn6gizFiQDOq6xQznaqm9H2t8zPUnVy5EjPHwnglAqaIj5AAlK912JLJS
         kC1SFaERtL9n7KPOR2/W6RnBrLlrp/n3mwsRvjrZDbWUa49gTOr/FwBmQmfNfAo03oyx
         o2IPARaROpk+4VE0onyWGehJg61F7mTY+wB6SAeP6Mwvt33cbSgBCAhXU8XofEJ5NDjM
         X3QroJfi8VJkhHBMeI0P+hIOirUqGXKUOsGp8C8AX7OKwTBY7EqUlhGAyZBDNSpAuGgH
         M8Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746692534; x=1747297334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4SXfokFPPLJwoMKncfdiN1Zib++ikD4gCmyzaltHX8s=;
        b=WaM8IQSM47vZ+daEgGaPanLh1NvnGBliT87fJRGgX9j/qMJDzm/GA0qx1rFpfVPt1h
         x2Cm5A+q/RU++0gjQ9nZP+6MFz3B5SC2KJU7SlEjJsVMaI0mArv1QYLa0cXHdPxPi1yh
         kw3gbzrketGA64ANyTTJvwHZdV9VUYFIzzyR0TN9ZHQuVanxJ8YpSSbPGucIO6yjz/22
         XZgGrqhl07t0LvKJMw5N5XtfMO9OxnzqdQFZfSW4+qYwhARNfFjRimY6K6aJU9YU7yef
         hQA6Jfh9QlA26W84t4pyvFLjFQU87sLllLjkzsIoooz7UONfV4WeFIdvwfsB1RvJtiKJ
         T1yQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTmdHVBz7RCavVb6rPVdhNcdd6f86SrEpChp9+FtYLGaJ4sOGwgvbF8AnrPkN/xWn11E0n6XI1jKRMQwc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3ZewI5zP66u3ACr/xZp6gm7xuPJSjp2t5U7eTa82ThlS/+nji
	iAxwRGHUtNPwBSgN6PA2dke4TbQBs15yxk1p6YkvALC2QmhdT+Efj3gS93E7+ZUQV48R6QA4Nud
	/T+USc4g1V7Mx0y8lut8i88YTsBhklWG4rGz1sWbM1U6GRwgpMnw=
X-Gm-Gg: ASbGncu0xk5+w9CWOThueuLgkhM3TwDatjtwnci7MqUrv8qz2vpqV6Y1rC8l2+Oqjdy
	q6CDUKwiUSWAM2YBNdyg+8BubG7tRiGkxoT0wmzX6YyS0B1rRgGwJhCZRX9gWGgiNSSEmtmBucc
	m7C+bEGOPW4yXYGrrWNKy8hpY0kzrYM/hd4fJsnJcStnZcr2T9SM5ngJU=
X-Google-Smtp-Source: AGHT+IHlylVojaFVxlpNw0MP0NVcwjPbv2ez05UaIZkY1iM/eQuqvcRPbqM2LAtJO6AS4BNg/KZaVgxZfCYEVDeRey4=
X-Received: by 2002:a05:6102:5090:b0:4dd:ad20:a333 with SMTP id
 ada2fe7eead31-4ddad20abc1mr1297672137.10.1746692534570; Thu, 08 May 2025
 01:22:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507183820.781599563@linuxfoundation.org>
In-Reply-To: <20250507183820.781599563@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 8 May 2025 13:52:02 +0530
X-Gm-Features: ATxdqUF56HpomFLeHyAStWrs4gBJAxYiq8xr1FI8Qqso3ZFo7BKUuCQKs_K1faQ
Message-ID: <CA+G9fYvR12QXK9+uQYu_XiiH6AtyVT-Z_yx-f=1k0V2QpMGsCQ@mail.gmail.com>
Subject: Re: [PATCH 6.12 000/164] 6.12.28-rc1 review
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

On Thu, 8 May 2025 at 00:29, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.12.28 release.
> There are 164 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Fri, 09 May 2025 18:37:41 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-=
6.12.28-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-6.12.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Results from Linaro=E2=80=99s test farm.
No regressions on arm64, arm, x86_64, and i386.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build
* kernel: 6.12.28-rc1
* git: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-=
rc.git
* git commit: 483b39c5e6de6bcb0adeeab81c10cac4aa25f8ec
* git describe: v6.12.26-167-g483b39c5e6de
* test details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.12.y/build/v6.12=
.26-167-g483b39c5e6de

## Test Regressions (compared to v6.12.24-499-g990f4938689a)

## Metric Regressions (compared to v6.12.24-499-g990f4938689a)

## Test Fixes (compared to v6.12.24-499-g990f4938689a)

## Metric Fixes (compared to v6.12.24-499-g990f4938689a)

## Test result summary
total: 118401, pass: 96123, fail: 6121, skip: 15784, xfail: 373

## Build Summary
* arc: 5 total, 5 passed, 0 failed
* arm: 139 total, 137 passed, 2 failed
* arm64: 57 total, 56 passed, 1 failed
* i386: 18 total, 16 passed, 2 failed
* mips: 34 total, 33 passed, 1 failed
* parisc: 4 total, 4 passed, 0 failed
* powerpc: 40 total, 40 passed, 0 failed
* riscv: 25 total, 23 passed, 2 failed
* s390: 22 total, 21 passed, 1 failed
* sh: 5 total, 5 passed, 0 failed
* sparc: 4 total, 3 passed, 1 failed
* x86_64: 49 total, 42 passed, 7 failed

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
* rt-tests-cyclicdeadline
* rt-tests-pi-stress
* rt-tests-pmqtest
* rt-tests-rt-migrate-test
* rt-tests-signaltest

--
Linaro LKFT
https://lkft.linaro.org
