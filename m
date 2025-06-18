Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B8D286405
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750242784; cv=none; b=q+iRFBcfYHvwgDjkRmXLFFV8id+koFBybJ65n4F2XFUu1fsOAb0/utl/xp3lKro7CAD62J7f6HKDGatPMS5nR67uKS8Fs/7Sll6w14EniqUrv1Ck/Jqb1GJk1kE9U5zOJ714sKx5GNKl4GgsMlyRlHQZIwRtnY5YOJwOS1lCDvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750242784; c=relaxed/simple;
	bh=UrYSDfsSo8jbAtRvRzWzGL/NZSe82kdFNONR7gB8P70=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CBQ1CaFk1FmoZeOVfkHMqYsZRrHaTg1QXLIJEJZevC6PQ5HoGE4MrX7HFPxruLBwrSk/u5rV04b8KLxDkK6C2xHSVlOzi+h4eKBzQxCOYN9NNULAPMdxz4lndAg7+h6W8rdgx7AChw04fa/jcYCxKU7Dy0Tnqo0aLwePc3T2KYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cSSxlVFE; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cSSxlVFE"
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-87f04817bf6so4626578241.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 03:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750242780; x=1750847580; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aITcoDBlN7uXS1VgjgbrvDBeop4ua9noQuKy/Q4cyYg=;
        b=cSSxlVFEHxWVfvwEvs9Ote8+yUVI46WKKLLl/j/Lu/WYr9xBXAUfWaW/AsqD+E3x3O
         zvUt8ouI5kk/tusiqaKolQljkrBb9PeBoZfExPM41gpBENFDbhxgh6C03vN+WWhdRvrf
         sLhkLB5qLmpIrk9oNSEXEeHnjIY85tRAwT87kFctixK5J/hJRL0ohk356gfxADjn84F3
         zww3JY495eCkHFMHxwxlgHDiPit8+D6kl+ecB0iwmMnwsQVDHsgz10DtYcZ+c72vUaM5
         JZF+biZOh9thTZts/mNs5t4lbc888Qfx8sywIcvFZRjsaTG1RMl5FkQDNcQZt7+Dnov2
         I1HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750242780; x=1750847580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aITcoDBlN7uXS1VgjgbrvDBeop4ua9noQuKy/Q4cyYg=;
        b=p7F/YrcKuEdgDeW3UmJxuVshs7QhkpO/7sRFuXVMaTCs8eXrCNV6F9DIX0mWmBr53Z
         Xl+ONcbZUlJaUQy69lnH8j8rTMmL8b/NakMzc6y50ErjZkiyC6XtivwQ/nLSNLsLvWtq
         G9RA9v0+ISvAlsuFgIXSCxXLsCVe9tRkEtx3R3EXALLUcK9js0ItvESHaPXIJODDTL70
         IY/A+WzVEgW9rM3B1MXv42EtFZvSSpd13PBzIlRXGgwB1apd05xdgwXA2Ilr3iksmVzQ
         k8yVo3jQDNTp56H4cC5Dm0ABiQBrA13hEANL3pXFx2IB4yGlYgSYtWbQ0Bi6PkJpHbYb
         98Sg==
X-Forwarded-Encrypted: i=1; AJvYcCXc4Fx+KnGHm8DulH37FpXVGQk2r3pcj+ZELvXEWRW0/TiJJR63Zk5MBR+IkFBD4vAuLlz4AOJxsUUpwls=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQBgRWiXNrr1usAQK/bd9TKYalMzQDTYhlchStVbi2xA6efZgq
	Ltu3aZoKaUyo2+zRbV4g5vKFNlppG3wGAb1e1vUMdpqVqw+1e/W7DHbij06z9WTF5VeFyf8oXU5
	Hmyz8APeUtAzH+9TnsY81bdx7/XYJ68w+cz3gl66yOA==
X-Gm-Gg: ASbGnctwTaOZbL5p5xc24xbUzxsxR52yTQHtKRgVBZMq+fowS9OCQVdJkG4mNmxUZfB
	GEgqqrf/sZPKg7ZOnP8uEkTdD4q/73xFnkJBHgbbOI9txty3AQtEMG0Mt3d+aYjNPrx1LB4qHHv
	lyb3RYkt/vKWN5cA/hHGfaocWvRpt80Urv5vklNgpZA9c=
X-Google-Smtp-Source: AGHT+IEOhMxcalcExwDVkASvmUiqj8BpLqLOJHPINNMBGhG0xRGGjlY4gMGyxbaf8vTC3PowQvMp9pc8rPfXoq8SPoE=
X-Received: by 2002:a05:6102:5985:b0:4e5:9380:9c20 with SMTP id
 ada2fe7eead31-4e7f60f55c4mr14046287137.2.1750242780042; Wed, 18 Jun 2025
 03:33:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250617152419.512865572@linuxfoundation.org>
In-Reply-To: <20250617152419.512865572@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 18 Jun 2025 16:02:47 +0530
X-Gm-Features: Ac12FXwvCnSSJUeypLbKfrwr_IFThfVnPumtJ2s-S0kqzXU_38IZ41IQZmYKQXU
Message-ID: <CA+G9fYsiW-qzcJgkooTwU2YzQydit6jW-C1XyT8VOUQCcBK_Dw@mail.gmail.com>
Subject: Re: [PATCH 6.12 000/512] 6.12.34-rc1 review
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
> This is the start of the stable review cycle for the 6.12.34 release.
> There are 512 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Thu, 19 Jun 2025 15:22:45 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-=
6.12.34-rc1.gz
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
* kernel: 6.12.34-rc1
* git commit: 519e0647630e07972733e99a0dc82065a65736ea
* git describe: v6.12.32-538-g519e0647630e
* test details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.12.y/build/v6.12=
.32-538-g519e0647630e

## Test Regressions (compared to v6.12.32-25-g6fa41e6c65f7)

## Metric Regressions (compared to v6.12.32-25-g6fa41e6c65f7)

## Test Fixes (compared to v6.12.32-25-g6fa41e6c65f7)

## Metric Fixes (compared to v6.12.32-25-g6fa41e6c65f7)

## Test result summary
total: 254275, pass: 231555, fail: 5974, skip: 16209, xfail: 537

## Build Summary
* arc: 5 total, 5 passed, 0 failed
* arm: 139 total, 137 passed, 2 failed
* arm64: 57 total, 56 passed, 0 failed, 1 skipped
* i386: 18 total, 18 passed, 0 failed
* mips: 34 total, 33 passed, 1 failed
* parisc: 4 total, 4 passed, 0 failed
* powerpc: 40 total, 40 passed, 0 failed
* riscv: 25 total, 23 passed, 2 failed
* s390: 22 total, 21 passed, 1 failed
* sh: 5 total, 5 passed, 0 failed
* sparc: 4 total, 3 passed, 1 failed
* x86_64: 49 total, 47 passed, 0 failed, 2 skipped

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
* rt-tests-cyclicdeadline
* rt-tests-pi-stress
* rt-tests-pmqtest
* rt-tests-rt-migrate-test
* rt-tests-signaltest

--
Linaro LKFT
https://lkft.linaro.org
