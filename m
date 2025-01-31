Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2134A1E5020
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 15:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738337482; cv=none; b=PCa3VP/88kFxLsrGgf34sGMFRMlX7sKSiPJQsjIeQ4aXMi7h9PSjgZqwz6z0Rmce5EhvuP/QFbg7MZVp8RpfTqRPiRd3VWantkKFmhXOEY6r0Lnyxew5mLKm3W7wzlM2mbwSLGk/8RY7wX5ld2704Lvn/tqh3Nad4k+t9u0E2tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738337482; c=relaxed/simple;
	bh=QMlDGojvzkRCZR7kbIOQ8E4cO6o4dvPj6U6h454M/mk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IInSlCWZQMh1LsutBun1Ek8I8wb7BeC9Tb3bywmEDF6pmx+kEzw9NuD/shCkAOeGXqwJCy66D9KQl9j2GlUtexAfHjTwmplym8J3RCRaj84K3nb92rwu7WIRkgq1c3GUEWkkw4qLeILCtBo5IEFHC2Ma8cH8o7Ss++7lxNrt6vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LzT6XR1C; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LzT6XR1C"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5188c6f260cso678515e0c.1
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 07:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738337480; x=1738942280; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OSLcjznXwcawPjtIwU5BGombRntUt4OgkySxl9N1PhM=;
        b=LzT6XR1CHXCAf2rOD/SQvsN1qa17dekbzy6Brgqw5E2RRlfhq3NM9BckVojwFBbQ/8
         KoBM0h8LykFwFnwaJWxQK3GuVn7hTclt9ZX1zrsEy5Cn/DgQvnRYiTz4OXze4rVbX4IH
         Mtj09ypj+48L7TiJs4+Fs0nLGHrIxQFnhpj7+IzsVdF7nkgazW4PKTapsw9u+R6DGkiR
         4+5OIZUfaRkRjlqc8WHWlhGwf9bk5kmWcQqM+GXghub6+SJvfsDnxpl+HqpB6RcqMVFM
         6M5v5D+qFXDPjRldpYHfk5smHC3HHqekJwN2V1sNG2arJ8wkypLf9LDPUk8wfMw87TUE
         gDmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738337480; x=1738942280;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OSLcjznXwcawPjtIwU5BGombRntUt4OgkySxl9N1PhM=;
        b=llu3xnmfke7X7o2BKvq9jxpeoqa/hHl57YH5yBqmdRxzjBnL4rRKJpUCiaeArEOcfJ
         fALIg9qsqCwL4ZwUg787JFDGuGuTC1uzVOWRXJa+60uFhvAaugzYOPDZdTAHcuGCcwz4
         HgXikrwdU52l+8tSWaY/6y9b5f/jcwn7HQrgLaJcwcbnePyRGj8+8RGTTjQOGTHRPuR/
         e3sf3d57noWBIaUziJd0exOmaJcKLTvjWNsdzoHU10JjmmS8iChMLQumQEDoTJ8bRrsD
         vNbQN9HorS+VZtSIiW3X5SWpo8rgy9RQ2CEM08HKQeauwqkEjE6HowAU809bbvvVunge
         aoSA==
X-Forwarded-Encrypted: i=1; AJvYcCUvEnJAVCWvC+DT4XLaDNBJ5BGUkYow4glpBvcMzltiCjf1KbIlsszXXJ52D5DLY2+qslvLs2VOg9drIwY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwP7Z5tsHa6kd4YZiVTQcHdciWpAExD2F79/0ZlOKS8FOsj1DJ9
	+dJn0/FOV2Nc0B1CqSnW7ndmoqt402AhQhk3zJU9ZwhJ7xDJQ0xUhRBPmAtal4oNCN9in4nj0dz
	LHIzlTSusIjl3O4vRCkcgyVsFIr6aUmFfSRFvqw==
X-Gm-Gg: ASbGncuSXOHuN26Y7Qhwo7c2A3IlD7lZ7Z4S0pMY0SQ+Ltg8X1Wx4+vI7KSDDtvx933
	Kv3rUshM1yP5hSZqjqxFhixWSrxX9oi+UQEBijdvOCphlarX9VVe9nlg6ZiDjYySoR/IdlZWK7V
	FjrR0Mqd35gLwanK99OU7XCLn+dyjVsA==
X-Google-Smtp-Source: AGHT+IHFRUS+MsNhqfxUXH+pmZt2MZ0qsI4i9mos4varzgd6PPfcrhXV9glJArwj7pFf+4scVbf+KZcnIil//YmXdcY=
X-Received: by 2002:a05:6122:887:b0:515:5008:118b with SMTP id
 71dfb90a1353d-51e9e3e3e21mr9512155e0c.1.1738337479787; Fri, 31 Jan 2025
 07:31:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250130133458.903274626@linuxfoundation.org>
In-Reply-To: <20250130133458.903274626@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 31 Jan 2025 21:01:07 +0530
X-Gm-Features: AWEUYZlxMqIJhC8ANbN2_8EU752o33FdmUNaGxshpQUfK6TFP0r1OcuJMY6slaU
Message-ID: <CA+G9fYtfp=LANXpkohb0m=EDTG+N442Mrr8ZvmvKiDyPbvDrug@mail.gmail.com>
Subject: Re: [PATCH 6.6 00/43] 6.6.75-rc1 review
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

On Thu, 30 Jan 2025 at 19:45, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.6.75 release.
> There are 43 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Sat, 01 Feb 2025 13:34:42 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-=
6.6.75-rc1.gz
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
* kernel: 6.6.75-rc1
* git: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-=
rc.git
* git commit: 2c44b59139a8bd89a50d82ca7f695ca18d867362
* git describe: v6.6.74-44-g2c44b59139a8
* test details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.6.y/build/v6.6.7=
4-44-g2c44b59139a8

## Test Regressions (compared to v6.6.71-130-g6a7137c98fe3)

## Metric Regressions (compared to v6.6.71-130-g6a7137c98fe3)

## Test Fixes (compared to v6.6.71-130-g6a7137c98fe3)

## Metric Fixes (compared to v6.6.71-130-g6a7137c98fe3)

## Test result summary
total: 125925, pass: 88948, fail: 18749, skip: 17735, xfail: 493

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
* kselftest-filesystems
* kselftest-filesystems-binderfs
* kselftest-filesystems-epoll
* kselftest-firmware
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
