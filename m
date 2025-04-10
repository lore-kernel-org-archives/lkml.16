Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0AAF204594
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 06:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744268263; cv=none; b=UXjDeXSLpoEMJicnPGQQWQh3lxAV/E8g32zdxE950HuEhUrPfmoLtR4OrOBN+qjw+MJxICAqV929PrunNKnaNFLBiHpj96/vhuuQWaA0e3G3Q5p0A4R+Xx085rhSIm7NMmIK4YppaVMAU3BdD50inFWsOc5ZhJ55n7l8PAh9skE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744268263; c=relaxed/simple;
	bh=sTwsAjGY0cGXvK0SH9dMyP6DZMtS36qt5mtZ3fR9MlA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EntM51motdO9U3HIKbe8OnMBy0RTfgtY6jF9fIszXFndqYakaqwYhZ0OM0lqH1yjIO8IFXxGFfRGXGHM1r0yOLCB3h1q1FbMcrpAW2CThQNRDyiBuyOvEAae5gGMd+oAUV+iZQ6vQVQiI/TkEaLzqGl5Rv+UT+jAbsshAIByNCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WegCxNm6; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WegCxNm6"
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-86d42f08219so185632241.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 23:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744268260; x=1744873060; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ARRmXRJ2mCRgXoILVP1SStKYj4zjnHUfBxpKz5KWgHA=;
        b=WegCxNm6ACIpSo0rXU6oya50pl06wvga08zSKecB9dQoq+OTKuFDPN5VZEKykgZUsQ
         flzC2lZPQnJw9OhsDkKYxcrbKQxd/kpmkX4qCMIDYHNmp/4qLUCwY+E6vvK8wkayBJm/
         kIeVuyZkmD6VDNYefo4wkAYAblgUINR2oUbM1QmXgAJBfXjNVX6RHf0rI5D57AGn4V27
         wEGXP0VxT3uGIs9umt1EfqBCozGXmp8wvaNsbnHK88UwG9DNIZCZ1ixILv8jdh/fbQna
         xAxQVCEY3Zfme5nQ7oDfdsdCczb0/KI7vMpkxtCKW7qy+sS2TiiLVzDo4NUXgnNbt3L8
         0B3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744268260; x=1744873060;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ARRmXRJ2mCRgXoILVP1SStKYj4zjnHUfBxpKz5KWgHA=;
        b=JUluJnztXNZiVL3aU7gCft3q+tdt5jusH0aCtb9BOkwEFvvKsx5PwcwSpcuK17DgA/
         s8BzBDG7rXCP2lp9CzmZosn+iHWbwKQBE6MOdNs2TLF3QS+ICgGKMBlXpkC4jKtdfyL1
         2BkK/7ObFhcURYPajFp+SKWYaVHR/CMkH3pcSP2sqTVI9kj2/h31AdPLNI/PF9DFIXBD
         9bT6i3DGaeOYz6AMnavcwwy7Ml2lCHMMgycTLNHzJRdPcxkQ141y1WylHuTL+k/1IwUU
         AdVUXvkq4ZF6xdqN8ObrQ910WmeNF9W1nxZBKID2tLh5Eh+phz/yNh++n5R+JBhevc88
         unQA==
X-Forwarded-Encrypted: i=1; AJvYcCVeHth3ryA80s/gzardIVhSeQskTPRmXXZM/G6flJTKgTE6w1K8dwXuLEXXyyg0Iyh/M25xleYQEuedxO0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9V4aQ3/7AJTfmmEDPTFBg/atJk/BHV3JsxQiEfblfOr36EvBh
	XoDcew6V7b/id0hP39wF9+tXzy0/wot6HY2EkFYOkJxBSV+Ntq9Znv/PJnSUUIM8aCYHPm49Bbi
	HO2k2Vrg/VZJaWp9vR54rACGl//iMr5ndOwZNTQ==
X-Gm-Gg: ASbGncuh5UI9+ZbxTO9+41jwUrkDON5dESr99ZRrYxLIxg5f+FKBtMRntg9JZ9zJDlu
	vSKSbrh3iwaPDisAP0bPBjlA6abfM2sinSiHpr0c3r54DTbBgHgcPsZzTlD+ZhlWVpAGoF5hZ4U
	BFZptG/VoL93WxYAWx5NCXmsEX+w+UqQAR1l12VMTIx+taiRqfDX5ga/0=
X-Google-Smtp-Source: AGHT+IHnUcAdtPw/Bu+bfLYER0We+JE2unYWgD9+ylsXtm+yAmF1+/a2MICvq/3Z6LjMbkZydv/6M4WXUoGm3z69jlw=
X-Received: by 2002:a05:6102:5714:b0:4c1:9e65:f90b with SMTP id
 ada2fe7eead31-4c9d35c5826mr1056195137.17.1744268260583; Wed, 09 Apr 2025
 23:57:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409115840.028123334@linuxfoundation.org>
In-Reply-To: <20250409115840.028123334@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 10 Apr 2025 12:27:27 +0530
X-Gm-Features: ATxdqUFpdOs38enhPpqvgs50sZwp2PaSSnIi3QTcWZBE0JZMUFx3jvgJXa9Sb2k
Message-ID: <CA+G9fYvgMbV0LK=zHsCO4EGLdKKPPaOwJZ7UzgePNP_9O6Ag_A@mail.gmail.com>
Subject: Re: [PATCH 6.6 000/269] 6.6.87-rc2 review
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

On Wed, 9 Apr 2025 at 17:34, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.6.87 release.
> There are 269 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Fri, 11 Apr 2025 11:58:04 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-=
6.6.87-rc2.gz
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
* kernel: 6.6.87-rc2
* git: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-=
rc.git
* git commit: 327efcc6dcd0abb5f5c298eacd01af487dc297eb
* git describe: v6.6.86-270-g327efcc6dcd0
* test details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.6.y/build/v6.6.8=
6-270-g327efcc6dcd0

## Test Regressions (compared to v6.6.83-270-g0d015475ca4d)

## Metric Regressions (compared to v6.6.83-270-g0d015475ca4d)

## Test Fixes (compared to v6.6.83-270-g0d015475ca4d)

## Metric Fixes (compared to v6.6.83-270-g0d015475ca4d)

## Test result summary
total: 109721, pass: 87807, fail: 4013, skip: 17422, xfail: 479

## Build Summary
* arc: 5 total, 5 passed, 0 failed
* arm: 129 total, 128 passed, 1 failed
* arm64: 44 total, 42 passed, 2 failed
* i386: 27 total, 23 passed, 4 failed
* mips: 26 total, 25 passed, 1 failed
* parisc: 4 total, 4 passed, 0 failed
* powerpc: 32 total, 29 passed, 3 failed
* riscv: 20 total, 20 passed, 0 failed
* s390: 14 total, 12 passed, 2 failed
* sh: 10 total, 10 passed, 0 failed
* sparc: 7 total, 7 passed, 0 failed
* x86_64: 37 total, 36 passed, 1 failed

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

--
Linaro LKFT
https://lkft.linaro.org
