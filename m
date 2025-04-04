Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D6B215178
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 17:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743789572; cv=none; b=UpIHjXpSNgWtkXbu8a+tjmnBDHo0Stj+4bUTBZ8Sk7KJ4A7AY2KEOiWQ/HMNMaV69+BxBTYSf0gHASF6M2a+z+R2/2uP5wIrt2a6NKEs4L+8K1QgSrNxeNq+/NU3bMJNge6Sgs7q4dW7UKoDOFYrIAIG64GS80CxwVgWEjqncJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743789572; c=relaxed/simple;
	bh=q8DoTobLpnYblqeIorLCLu56Rsyfri0rK2AVfCaxCQ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jMDkg8P2+TLagm/g3mj+v9ufgarOwRv3W+JIgGrTaGUUpz+UduBNayHfiIt9p8MZB0tggW98b2jqPbhxFsJ+ZQr00wFZ0qPrVpXXgBlYnUmUByVQ/b0oEBXruYOmL2xZuFeEscdtGeIx+zqPLle71uAuYdRWanpH9glOiauBf64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s5Dutyeq; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s5Dutyeq"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-86d30787263so1136344241.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 10:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743789569; x=1744394369; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KHT122mHzqsL6lq6QlrYjoaMISpllKEJj8WOiydjFLc=;
        b=s5DutyeqVOZBqKTiRFP4ZR9nQB2xG/A+XW4U4RZv/8dm8jnxnR/W1gLy/1bYbZGCw2
         A/9wd7RdaQ5XO0gDxPQc7jCzzIq4RbWV6QdJg0Qe3asg+QJFO01Wg0mYrTaSgwxIU9Fh
         X7JHatd6UuXFUujVVGVL4uJnliss0QhiOo2lWYaDMChEDBmiAXfvBNYu3V4PajSHUQMW
         7hdlAtlt11iwRy8PeRpt7i27BQ8P20jEkuiUcLQg4xvW1Rex4Jd6XfUW7ywn7kQwKLS8
         hPEnCwtGfB066dpzOwcTRPEGFFXCRzTYMjckZvNnG6oAvUgCL5PIDkJY0W6J2rftrzxw
         1xFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743789569; x=1744394369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KHT122mHzqsL6lq6QlrYjoaMISpllKEJj8WOiydjFLc=;
        b=jhGQno/muF5DAdhnht+JKKiyJPEATQXELVhhYkdH2U7yUUtpmPgc6yirXQk9HhpJxO
         olwRxutzqq9eiRzQTgsLCIJOa9uF865V4ASp6NYQJ9DQI9s5e2bngVEGql/sKtkCu2tR
         HR2Z2cl7P7qhhZAUTrovzDcJhZ4tTpGmfwdXCqVUx3vbDcGmcMxp5SjS11Ap93yUKKZf
         6ZN1sXQJx8LSyacz4GHDB43pr5Po5WfSIzS+88NzzLCNJ2eTwA3A5wulWhC76Oh7K1tJ
         PKWXZ/umc9XnTrCyNtIPrs0Sm5hSSiK7EgEfNN2qQ0DUil62TUAr0a9dheGzcuIp+eq5
         4Rgg==
X-Forwarded-Encrypted: i=1; AJvYcCUsIwEsc61H2BemGqe0lqMAtdTnylqesusHdDoKqYSkIpSgAH5fPEXbUKdZxUSb4oFeecu7OwusqWE948A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwUBLnMJVkbcHuON0WcRYAe04fmIKLI8Z9A/UtHmI6BAWnI9RK
	yT3Jx+EWP+3FsIKOBLNaq7K5fy89jmzGqbkPp0E/RJHBPo1hpCrQpgE67JK3GqNwhZU/uNu0dKw
	T57goambC7R/+W5K1ebIQ8KnAxRh+SwnGP1QBHA==
X-Gm-Gg: ASbGncuFV33OqS6bTwtv9cwk04BiAf60A7Be260SVBnxf6TuboyrKH3J20VwxIiGlp5
	A9rZ4ehe5w7vFGM7zuhrYirKk3NsX+o3TlmZgw61U3hPJFrkHr+cv913s1AWY1JHmhTueYhiMrB
	rl/ync6nkGKuT9yTbKgTv37RkgmHlo2HyABc06HTxiKQaasZyLL8QMsByj0h0=
X-Google-Smtp-Source: AGHT+IE9WhJGCC9Sf0OWLwG2goCnVjCBxH58MrkWIcuF26FFbG2ANrEsW1UY0l1r6UUcxRxBqHIsKVGD+fmPzNj3I5I=
X-Received: by 2002:a05:6102:3a14:b0:4c3:49b:8f78 with SMTP id
 ada2fe7eead31-4c8554b54b3mr3755908137.25.1743789569527; Fri, 04 Apr 2025
 10:59:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403151622.415201055@linuxfoundation.org>
In-Reply-To: <20250403151622.415201055@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 4 Apr 2025 23:29:18 +0530
X-Gm-Features: ATxdqUEERi0sXqrIoWXVmVmXORGEUPIkxW2NkQkG6v3Qp4HIxVCRpucxb4_Rqk0
Message-ID: <CA+G9fYvKqmjaWVLdOWqk8ATqyTTgyE4d3L5UN78wA7L+-BRtVw@mail.gmail.com>
Subject: Re: [PATCH 6.6 00/26] 6.6.86-rc1 review
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

On Thu, 3 Apr 2025 at 20:57, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.6.86 release.
> There are 26 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Sat, 05 Apr 2025 15:16:11 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-=
6.6.86-rc1.gz
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

NOTE:
The following build issues reported on mainline and next,
* arm, build
  - clang-nightly-nhk8815_defconfig

* powerpc, build
  - clang-nightly-defconfig
  - clang-nightly-ppc64e_defconfig

clang-nightly: ERROR: modpost: "wcslen" [fs/smb/client/cifs.ko] undefined!
 - https://lore.kernel.org/all/CA+G9fYuQHeGicnEx1d=3DXBC0p1LCsndi5q0p86V7pC=
Z02d8Fv_w@mail.gmail.com/

## Build
* kernel: 6.6.86-rc1
* git: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-=
rc.git
* git commit: 0d015475ca4d65fcd012dd52ee5c8c432cadb1e4
* git describe: v6.6.83-270-g0d015475ca4d
* test details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.6.y/build/v6.6.8=
3-270-g0d015475ca4d

## Test Regressions (compared to v6.6.83-243-g1a8546896fa3)

## Metric Regressions (compared to v6.6.83-243-g1a8546896fa3)

## Test Fixes (compared to v6.6.83-243-g1a8546896fa3)

## Metric Fixes (compared to v6.6.83-243-g1a8546896fa3)

## Test result summary
total: 119369, pass: 96334, fail: 3835, skip: 18728, xfail: 472

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
* kselft[
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
* kselftest[
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
