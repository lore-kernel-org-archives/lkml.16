Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A10A1FCFEF
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 16:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746720147; cv=none; b=lJ279vZJ52L/VJyuFSGb4Td8oxG2hwRqjcBCFgK47NYx9GO+oHF6Yl0T4LWS7F6riHeUQkyHttvHxJU+TLO/A86bzZkrpNMf0aWi5Bafkj8wYBkbiY62VAf1u+qKg/NdOXXw7R4jN2OD1vcVOKLitzi6008wtLx2UX1DOmvw1R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746720147; c=relaxed/simple;
	bh=XaLX+EH+cjL4P9o15Zyjx1Vk2yuv/XqGmQvdiYIWb7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JHhLp7oVR68AabdRtPk7NOTF1rfqgJhUNfuwZMhRBOe8pG2ngBKzD9BZUnZIZBjn/spmfrAbJz5+eSHYzoEweLvzM/zk+C8P6xZvoy9RG5LTLcChmhboGaNnI2YKoRHYa7zHxg6Zrief/7Eu9thSKURwPm3LOcEKjnYHN26Aon0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tWfSUmpz; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tWfSUmpz"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7304efb4b3bso722054a34.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 09:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746720145; x=1747324945; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z38mnBmRkxkRddtM6glxuD7U8+je5cn7ew22HMMDKOk=;
        b=tWfSUmpziaD0/U0+ARgzL5q8A+fz6KTh6HAa1RVnsoNhgjbUB74VYa9X6TrdSE/vYv
         wH/j8Gc9nBVbbUhpOxq/qzKCI2pt8MIJX3uB+JaXZQBl/MWO6SS1eBo6O9js5pIIvNz9
         jSMdlUIz3MWgSLfsVY9LWIRFZyqs4G5+S4egbyGaYlNwVkP/ESFGGMnV/z6KYA7ybfm1
         +AXhqMM4ct5JbyjL96UBgHT8XVyRiLTDAJ0rOC7hLWjhc2c4JWoPqa9qAXGr70J9HGzw
         Rqz1E8qaLKkGamhU/8pni8yS2gnncn2z4ybYMdLua/6hbRKDAepOI6BGgGPzPpHMFP3p
         1SBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746720145; x=1747324945;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z38mnBmRkxkRddtM6glxuD7U8+je5cn7ew22HMMDKOk=;
        b=GatMMZGHeWjFzGPHOQAwqpGaQ+dAyzxGAnQ+wbzyDYTToDeXCSeLVokJNsNhlDGwcF
         lx10/YrvF7LMXuHXYBGjafswR1c9NJTp9zSlzJ+yANpKataHHM7BpQ3i3CDcOngf7nFg
         CeI0tbgEIp7EhinW9633yrMNIDUCuikp1Z8W1/q2sxd/XQ3StyUeAiEWaokvZuuy0QHY
         p/y+eLe+zO3UkeWAAdCapJLdisjDvOaLLvs4ob4dtoERfJg2M61yUTAc6PGTdVJJWKEA
         WI0f0qI6WDXKRsdfFkMxdvFyO+C8wUBDaKIFJmi+M9gnrnQLQ5q/vnHhqVrbaZF1wz4Q
         oAfg==
X-Forwarded-Encrypted: i=1; AJvYcCWmtZeKADm4v+qk+YWnoW6ZdS7lqZAXvArFXp+Y2GRGTMAJ2s15+KO8Tw9Zz4DllBbXVxsf0GrbG7asieU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrqfxPRc/xIa4DXaKKCPFcl7QeFNSsFyMaFwEbXosQl0SRF2ot
	LBAXam1W7eSRQxTO1ExAGuqDnbuPSY0hEJnnlPXzjxg3pdNhRPCbVOuiDoBqingrUhybHpRSDmZ
	Tr0Z74YN8xa+2ZWxUk+GnjnoT3puVnVYLxgdRwA==
X-Gm-Gg: ASbGncvmYwKkXJnyvSX1zdmDesn2VppmMpPrWAkWWzHWbRFEMQI3Oocye/57sbfDjAs
	O+ZQ6i7zocRvbEGFG6om1OrEGguS/Q7l4BdeTiRJ11/+vbt+16k0RY65vA9q4vpL/juXePKkmF3
	9gUuHJxEXDGtRGluT36iLX1SbLK7Y/1hD0p/bXQJBS4Av9TEiUDebXY6o=
X-Google-Smtp-Source: AGHT+IHQV7olZh1aiWWFaD+aGYoDJx58pftLhIvXe69fIrYjKdcP+ttiAXHsdv2ktPGpik2h9tPub6LGWsoRbPvdHDQ=
X-Received: by 2002:a05:6830:6186:b0:72b:a175:2f1d with SMTP id
 46e09a7af769-73226b3090amr144279a34.23.1746720145073; Thu, 08 May 2025
 09:02:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250508112559.173535641@linuxfoundation.org>
In-Reply-To: <20250508112559.173535641@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 8 May 2025 21:32:13 +0530
X-Gm-Features: AX0GCFslT05Q7sUXFhXMzpJL8JH0JP1bseRENR7DTeD19wSzrM2wd6ZSEU6mODM
Message-ID: <CA+G9fYsoE9P1HhAc-Yi3n3xDRV9bbpr0y_uujp7huf23dCfpSg@mail.gmail.com>
Subject: Re: [PATCH 5.15 00/55] 5.15.182-rc2 review
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

On Thu, 8 May 2025 at 17:00, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 5.15.182 release.
> There are 55 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Sat, 10 May 2025 11:25:42 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-=
5.15.182-rc2.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-5.15.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h


Results from Linaro=E2=80=99s test farm.
No regressions on arm64, arm, x86_64, and i386.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build
* kernel: 5.15.182-rc2
* git: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-=
rc.git
* git commit: 364c50bdd7d289a0ac440f198b3dd2af3fdbacee
* git describe: v5.15.181-56-g364c50bdd7d2
* test details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-5.15.y/build/v5.15=
.181-56-g364c50bdd7d2

## Test Regressions (compared to v5.15.180-369-g85e697938eb0)

## Metric Regressions (compared to v5.15.180-369-g85e697938eb0)

## Test Fixes (compared to v5.15.180-369-g85e697938eb0)

## Metric Fixes (compared to v5.15.180-369-g85e697938eb0)

## Test result summary
total: 58495, pass: 44233, fail: 2661, skip: 11236, xfail: 365

## Build Summary
* arc: 5 total, 5 passed, 0 failed
* arm: 102 total, 102 passed, 0 failed
* arm64: 30 total, 30 passed, 0 failed
* i386: 22 total, 20 passed, 2 failed
* mips: 22 total, 22 passed, 0 failed
* parisc: 3 total, 3 passed, 0 failed
* powerpc: 22 total, 22 passed, 0 failed
* riscv: 8 total, 8 passed, 0 failed
* s390: 9 total, 9 passed, 0 failed
* sh: 10 total, 10 passed, 0 failed
* sparc: 6 total, 6 passed, 0 failed
* x86_64: 26 total, 26 passed, 0 failed

## Test suites summary
* boot
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

--
Linaro LKFT
https://lkft.linaro.org
