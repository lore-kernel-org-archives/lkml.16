Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89821A55
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 06:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749365597; cv=none; b=CN3nWMDhd8VupJ4okIqDgHAGyLQANpkwldPVvs9P2ZC+QoBKtUUAwGp/DpueAfu7t6KZglhc39QelwBq0ypRErahVi7R0QbeN4BSvkyna+4hl0W3zaj4/3nGg+HXZwyWFwirG/xqVT1ltLuxQCPtZNHGGxumQ+oee17NuUPE1Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749365597; c=relaxed/simple;
	bh=fltpmOTVj6/s+N4xDOFhIyaKZHFzGfdIvwoqzO3sESQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E/P5AEyEV/EpVr5ILw5Rl4Xmt4mBVIOuKZGdM3oOul2Yajf8Woan8in+p4MxvnaNZZJTI/0YyQeiZNz4EfhGEMzi2JMz7HGgwoK70rSdLVkK/ZdQCAyZT4G/3JaWm3RhnFXbRRy7Mwo4nIRrOd9XazjWto2Jto00RnpahIQ1qts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mWUDl/ZA; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mWUDl/ZA"
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4e7561d3466so1065820137.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 23:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749365594; x=1749970394; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xNwcX+iuw1rpN6EnNjGPjmJquCREC1cuVweFhZ3D+PE=;
        b=mWUDl/ZAIOzawpToKtnyMcUAKddGQ+huvQ2zLn6RvC9fEuwwsjD0IwFKll5i/55viG
         BUWpU2GzuAWbZlegg8q8rv10X3iuqRYqIV5HW0Z8yuQc7IeQn+YrLzROge7XZAze6KAa
         bxOgaqoHQ2eXKXwsH+Np90wTBXa/aSjqkZMqahrgAsxzI5yBoed4jzD4R4O+hJk6zM0l
         JszsJevRvnCIXrW2NvXTMX3ryWzYmMcrNxiMLsRSc34zFlQwCCkXKDxxKiYFX8K/BPOy
         Jl0UuRm6UIXwh1IHV+fRO40asGwrr23+hzRbWvFm0DZ4RTd6ZHwH79OnQTRHkI5/n3yq
         IDOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749365594; x=1749970394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xNwcX+iuw1rpN6EnNjGPjmJquCREC1cuVweFhZ3D+PE=;
        b=wPkD51cA/sJ7OScf64eGr496JV13Xp8W1hEQSJD+wNAUHHwC0NjlW5mT6zcgqBoWdR
         duvrXs6NPqrfdZcLhb5DC/h0nvrmnchPxxeAPTKN4iIpP78y/XZx5Xex8GKm0hYCbekG
         hn0z3wmHxfl6VcKkyhZMqz1NQ7MTiSqFTxwcDSmXYIeWjQxSGzKMY6LwJgngFBJoKCtP
         m1szkTXtkTegIg9TDFKiJxgb4JTjrwcElvWFqpFkw7cRIbn4xhvLa2Yp4J2WLgBZHRXR
         8+IOn7o+ONPnz/rJSwIMCp/vSx5k3twuwnpuBnxxtEIdQj9pLxl8mB6bsqNIZYciI7vB
         rJfw==
X-Forwarded-Encrypted: i=1; AJvYcCVuD33pyJ+mbkef6pg/gxDXk3pU3NBr1NT9CaaqMeFmEzu6r5sSnvL9vEKkFIWC7Yv7WnH8wmMHzYMaGUo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxM7n/+6O0/PvZqx1dxjdZ6Yx8RkSk5rJZZK3LO0O0XmpPhTKJn
	gwtbsI2ky2mNE2PKur/1bKA8f9VlpQ5WWNSgSPwFgvx6hivzqFI64mBjIS3F8cyUDdkx4mbDXRs
	qvlwFMPRk140kzTiQpJ/4tHTkJFR7by7mwufMuqQjqw==
X-Gm-Gg: ASbGncvGAQoOEPO8wSvskK3PDKrt+RyZHSq3rd+DxzgIzg/W+UZVzBtnVjzGDR4tpgt
	UJqMS0MTpD0JkGTqQxH2d/mp5xP7to0MkWnk49I1BUkTH0no+bTk7HA8W3ac6oet0/q/CF6PFku
	9tEZX6Mx8Uu9BdQ7cMmD23Whh8dj5s7hMT40U2O6MdG0dVmIf41IPe/ftavyQe/8mV7URkS/V8o
	tXUZbbGWUeKin0=
X-Google-Smtp-Source: AGHT+IFhy6gwvqP26SFAPg0/upYqeLloMafe7Q+koiMk1eAonxrLWGLo+Ayjz6xIWKvXVlmT3KOFHOuAYOJZQuH2YUw=
X-Received: by 2002:a05:6102:41a7:b0:4e6:ddd0:96ea with SMTP id
 ada2fe7eead31-4e7728badc8mr7428119137.10.1749365594500; Sat, 07 Jun 2025
 23:53:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250607100719.711372213@linuxfoundation.org>
In-Reply-To: <20250607100719.711372213@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Sun, 8 Jun 2025 12:23:03 +0530
X-Gm-Features: AX0GCFuv5wsl2DecrYyVr5gO-RMH1Fhhv5VPgjaw7xqi6ZCYvhnLsAAHIWDZfgk
Message-ID: <CA+G9fYva8JzG5iWMuJ70Rj8sz4Kq7nX__D2JkrpHviwo+5-woA@mail.gmail.com>
Subject: Re: [PATCH 6.15 00/34] 6.15.2-rc1 review
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

On Sat, 7 Jun 2025 at 15:41, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.15.2 release.
> There are 34 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Mon, 09 Jun 2025 10:07:05 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-=
6.15.2-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-6.15.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h


Results from Linaro=E2=80=99s test farm.
No regressions on arm64, arm, x86_64, and i386.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build
* kernel: 6.15.2-rc1
* git: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-=
rc.git
* git commit: 04e133874a24969592ae14d2839d4f0040da5ac1
* git describe: v6.15.1-35-g04e133874a24
* test details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.15.y/build/v6.15=
.1-35-g04e133874a24

## Test Regressions (compared to v6.15-50-g86677b94d603)

## Metric Regressions (compared to v6.15-50-g86677b94d603)

## Test Fixes (compared to v6.15-50-g86677b94d603)

## Metric Fixes (compared to v6.15-50-g86677b94d603)

## Test result summary
total: 255351, pass: 233351, fail: 4991, skip: 17009, xfail: 0

## Build Summary
* arc: 5 total, 5 passed, 0 failed
* arm: 139 total, 136 passed, 3 failed
* arm64: 57 total, 56 passed, 1 failed
* i386: 18 total, 18 passed, 0 failed
* mips: 34 total, 27 passed, 7 failed
* parisc: 4 total, 4 passed, 0 failed
* powerpc: 40 total, 39 passed, 1 failed
* riscv: 25 total, 25 passed, 0 failed
* s390: 22 total, 22 passed, 0 failed
* sh: 5 total, 5 passed, 0 failed
* sparc: 4 total, 3 passed, 1 failed
* x86_64: 49 total, 46 passed, 3 failed

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
* kselftest-rust
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
