Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D5A215077
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 17:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743789236; cv=none; b=PMqaDZSjM0DkyHXuPoVXJGfch7M8o8wyageaOK90+m/GxLWDlQnLOg51AHtzO3tTwZJSnO4F8oURWVi5iQdPt/hNbBUWJvqPgALDUPHLrXb7t9KWj9PSNnIrLGwVl98gPlH3vF80go3R1YKoToZsgQYEPrMb6hAegjpCOeIm80o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743789236; c=relaxed/simple;
	bh=w6XLZQZ7SxQAxIlopsBskwMTuttUnj6XdCz/qeLI9Fo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kx+URmWof/WEjF3X3VO/cAE7AK2fbFRQj5ehWHhB9DkJLZzyJWdYl8BO6GAmxP9p5wUdXdB3pSIhepzOmwN7jmkOIRp+iumJE14yEBUgK3d+dzykXhKdgPKm9qk0m5ZUoQdj4TNy9S04v4Z7r65gQm56xEBruEF6fU8+nsoQOeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xYDjA2Wd; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xYDjA2Wd"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-51eb18130f9so1275887e0c.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 10:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743789234; x=1744394034; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y/QkejiZqG1AwqRbXs+dWYNpxR/iWqIC5Zwh4CzRL48=;
        b=xYDjA2WdkaA15+BSMUVp9r9mcffmjGf7eKE5H748L+zShcZUtn5XvuT+k0f6wmKcac
         7qSYjhlE9RjD5+91OH2/WwociuaaC6XdQglsDpaeD/stn4xdv5Mmy+wWKZ1XeV5Q2XxE
         p2aIc1BB9ojqc4TCfbYCBrChpz+DP4JAZDSdy1sEPUwD/8S2CRJV7yMgaB9EWwsiuw8v
         /ZaWImVqoAnxZ0BkXgnfxLJfKfcuChTpxiqorL9tQGQnLIS6TEQmthxWylt2XaL5DwtA
         7CPsHMsRj2UfdnbCJtMl65zpoXNZgvcPKD7oVEfKq0ddGsEmFCHjcKv+fkydD20zkuKp
         nELA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743789234; x=1744394034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y/QkejiZqG1AwqRbXs+dWYNpxR/iWqIC5Zwh4CzRL48=;
        b=VV4vBkEy8lgAcRO2jy/RtSCLHrb6Lpi6zBMG5s3Cz4Zo6kXjjbf2SfpsPQ6J2q8evr
         TRtagmyTE3ry21DOaVPwEpKwFLdQxeaAitukV6jNqsOHQUCtdnTCmf5CqGPFXXcCEY2m
         +t2kych0ZmJXWdg8hQokTx79l79a7esh/HHWQDih16C06WUxZ1H9ucV2v4h6z9b44BQn
         0GUeZW7y6yKQymM39tVecOqxWnJ4lAznAEIhLd+VVvXRWU2nf/T9nK5jdJ+uYcE4Lx3G
         A/LTXLmS4zdGU6qOIitVO8p6zm83ebZMR6/SzfybkqusF68FWQDSE1Z1+wGpKK70GT1x
         7SKw==
X-Forwarded-Encrypted: i=1; AJvYcCVYfOIUywnK+8fOgGgWYEBjdSyqbo9G8/d41OKE7Yu8mPUDn6PQX0TiynPz8jfxxws2A2Hp9Fupqj7EZVE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywvzlt3nsvCijaHcQ1pIHHraS+MdQ33cVyirpZ8HF9f0XKe2WMd
	ZzaWshZm7kAzJCGLdwJuJfZisXXkS91PkXmoCG3jysAiq+AbTUwQYqft+RQb6KACXcmcwgvNniE
	gRG+1TCb4XpTrY4nE6p+omcolwWB34csQdVQhhw==
X-Gm-Gg: ASbGncsX1fSZ/xylF/gPaVUsTbtltTAgDBPar6O6WtyvrkX8jTcLoQJZgOM9JLEAQR+
	jfejU1K2El2MM/7Est00K2C9EURm3Rxop8BbxHVhHOt7EEel98uppic8sK4XnDrsNsjmwydaTRc
	l+MkOvAIPfV7vL4bHyCJa1E1Hg8LriqJ5P0pzt/NjNSixDYl5/f8qiLNYkSAImcR7I41Zprg==
X-Google-Smtp-Source: AGHT+IHb0kf0KwRowiN1++/tNtzAOf06R1sEJzd3+qIJSrUlcgjsj9QhFya2h5gmYkdwJlrbxqRyKZFKlVdDC+1LPu0=
X-Received: by 2002:a05:6122:a09:b0:520:42d3:91c1 with SMTP id
 71dfb90a1353d-527645a5e5dmr3682982e0c.10.1743789233728; Fri, 04 Apr 2025
 10:53:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403151620.960551909@linuxfoundation.org>
In-Reply-To: <20250403151620.960551909@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 4 Apr 2025 23:23:42 +0530
X-Gm-Features: ATxdqUFpk3ftm-esTm2WI6L89CtrJ8-6rIhluVCmpjNB4EDEzoJu5oFlJFgC-ms
Message-ID: <CA+G9fYuixzW3nkcp_2mPwZnFkDSgDRietB=-Dc=7QZP3KKTCKg@mail.gmail.com>
Subject: Re: [PATCH 6.1 00/22] 6.1.133-rc1 review
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

On Thu, 3 Apr 2025 at 20:53, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.1.133 release.
> There are 22 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Sat, 05 Apr 2025 15:16:11 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-=
6.1.133-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-6.1.y
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
  - clang-nightly-s3c2410_defconfig

* powerpc, build
  - clang-nightly-defconfig
  - clang-nightly-ppc64e_defconfig

clang-nightly: ERROR: modpost: "wcslen" [fs/smb/client/cifs.ko] undefined!
 - https://lore.kernel.org/all/CA+G9fYuQHeGicnEx1d=3DXBC0p1LCsndi5q0p86V7pC=
Z02d8Fv_w@mail.gmail.com/

## Build
* kernel: 6.1.133-rc1
* git: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-=
rc.git
* git commit: 819efe388d47dcb84a834dbbe01d7bd2c120053d
* git describe: v6.1.131-221-g819efe388d47
* test details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.1.y/build/v6.1.1=
31-221-g819efe388d47

## Test Regressions (compared to v6.1.131-198-g0c858fc73636)

## Metric Regressions (compared to v6.1.131-198-g0c858fc73636)

## Test Fixes (compared to v6.1.131-198-g0c858fc73636)

## Metric Fixes (compared to v6.1.131-198-g0c858fc73636)

## Test result summary
total: 89322, pass: 68357, fail: 4336, skip: 16301, xfail: 328

## Build Summary
* arc: 5 total, 5 passed, 0 failed
* arm: 135 total, 133 passed, 2 failed
* arm64: 43 total, 42 passed, 1 failed
* i386: 27 total, 23 passed, 4 failed
* mips: 26 total, 25 passed, 1 failed
* parisc: 4 total, 4 passed, 0 failed
* powerpc: 32 total, 29 passed, 3 failed
* riscv: 11 total, 11 passed, 0 failed
* s390: 14 total, 12 passed, 2 failed
* sh: 10 total, 10 passed, 0 failed
* sparc: 7 total, 7 passed, 0 failed
* x86_64: 35 total, 35 passed, 0 failed

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
