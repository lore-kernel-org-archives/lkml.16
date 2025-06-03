Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38C92B2CF
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 12:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748952879; cv=none; b=Cbl0/Jp6rhiypD1syyXLUMwG+g6r6UKnX2Juti7y0bW8FAyEomLZtdj/oXRbNCp2gt9SyfxJGDLTbCob3SqAdt4rB1pF4hnSwdMEXvBmEbK8XYYM0sIkQ9pkJMfHtC2EmOavDAuoBBbUbhNScqq6MunifIK1dTvvrUrnO0JNjvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748952879; c=relaxed/simple;
	bh=t6VACjOwekeSdoTcNJF/T+YgRqCVuvNSNERLhcOem5Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d2O4dC9mc9pfMPLg3MaH4MH7L6GA/UBHQYJRNzJgKloyv587MSKt8OqPHm3s9/kzL06aCe6833Dos58ZSicfvEU1S5K2CoILjtaZ+0FsrA0VPm+vsqMji6OGXjz18rGGqU6lOFQaPxvvNkKekvBot5i2DzdmvPssjrXpa7GUHNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zmrjhwnb; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zmrjhwnb"
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-86d587dbc15so3835348241.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 05:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748952876; x=1749557676; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ekMu844lc62J2cT/hTWiYp5z39/Arp1wDxCaIiaTRQ8=;
        b=zmrjhwnbIC8jDqKguWd79ZZt5Rfd5iAz+Q2oE/EFV5q+9+iMat/rJd6lB3u9KvRjQw
         /vAiuricHwaqE6SbIzx2q6gBigRzxhrD4EAioZH2mv9xH8TrA6ABu8Z+/Z6pYa8vR4VJ
         OoqDltDCGVgvhgO3Q/5oXpc8THLcAiBT+jl5qWf6zbgRE2IbxoS7n5FIKkXQPpnFjqnn
         6gDd0Zp6vKW0V+pTicj1/B3rWLIFb6WsMevIivsTnxwelklO72fIfpNWFVcSpLUhJ9yc
         IpF8NY0Cvlg3mj840gNE6s6PXfeU6qqYXQShltmmPnDHzdZE5a2hBsCv57zPHP1fMkMN
         u85A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748952876; x=1749557676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ekMu844lc62J2cT/hTWiYp5z39/Arp1wDxCaIiaTRQ8=;
        b=k65qkVROdQR9Bmr5sunXP3Jibbu2MyUdJKBh0qYn/f5rP6ObuZKM3g4oHS2bJAz0V2
         2W2DZxg9oMo8pMNyDDcLE4VF7h7lTV7vyVsD9DcHrUsqqx1y8f1b4UKB9stHZX9N6huK
         9uQoQm3vbvlhraFcrTPUupKhdgjdKls9gPZsRtdFhxNxGJDNcPRQsMoKL8IxNJY2gOS/
         swCxrx2gz/4MvTxcFxpdbn0ZEz4POwDYrKjv8K/sCmfm5vWGfMybNTFYrku0q5K5mT0W
         arufwKpGupVBYayl8/ZuycLxFtyu7erkBIGCoHqupC0NjL4AQfZvkbrWB28gHYwwU7+Q
         xYVw==
X-Forwarded-Encrypted: i=1; AJvYcCV3B18H3Y5G4ZsBm9dUfDB4yaKL0IjjSBYYeWv8XkSRjazYv1eSlq3VSIfgvRy2sMKhyXdoeIOy8bFUdkA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTSQoopV9FzeDJ8hvf1XV2cd2FiXlNnHPRXZH397XKwaAcMpgf
	QPqG4fbA9/EJyEiNlQr/zxezNk+CR9COwj8Gsr7wkCGHRj1AngOniKL2CbZ/W/hutwiUqaFnfBp
	sraKtZ1PVUeIYtD3RERMcudbAsVxFraFSYNPImxiGFQ==
X-Gm-Gg: ASbGncvUcb8IJSZCg/4D2qhDdSdV8i18yIvhMv297ogrpd4FcFo5nRmbsZO9F5akEpA
	XULIbG0vdWOPoATH5D+wMapOAAkrHHZsU6oBaN2UmbSeFGFauGgHjPJeMs5VX2R/pdFbDSBwzY7
	gFtvbKXm55CQNNMSxixSS1ZI1A+MTdGfNHKm9sehJQKg==
X-Google-Smtp-Source: AGHT+IHiguH/q/uOG6AU4kDV0YQqPceDg6Ud9t4FMNb+4rqbBbm2F1nz7LfKFd2Q4SlCoMcQHCIYagI1s9WlCBukVG0=
X-Received: by 2002:a67:eb0f:0:b0:4e1:441d:be9f with SMTP id
 ada2fe7eead31-4e736014deamr1157543137.2.1748952876505; Tue, 03 Jun 2025
 05:14:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250602134237.940995114@linuxfoundation.org>
In-Reply-To: <20250602134237.940995114@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 3 Jun 2025 17:44:25 +0530
X-Gm-Features: AX0GCFtcVR-C4Oy5JyTm99FTojQYH7IOaO2ypXBtQVxYm4_OVJOIEFtSBGiuXhg
Message-ID: <CA+G9fYtv6GPx0guY03DXBwoCcM-VdWHwUy5mScP=cP2g7zzo0g@mail.gmail.com>
Subject: Re: [PATCH 6.15 00/49] 6.15.1-rc1 review
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

On Mon, 2 Jun 2025 at 19:19, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.15.1 release.
> There are 49 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Wed, 04 Jun 2025 13:42:20 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-=
6.15.1-rc1.gz
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
* kernel: 6.15.1-rc1
* git: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-=
rc.git
* git commit: 86677b94d603c727f6b88b4b77bfce2601aa4465
* git describe: v6.15-50-g86677b94d603
* test details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.15.y/build/v6.15=
-50-g86677b94d603

## Test Regressions (compared to v6.15)

## Metric Regressions (compared to v6.15)

## Test Fixes (compared to v6.15)

## Metric Fixes (compared to v6.15)

## Test result summary
total: 321892, pass: 296354, fail: 6075, skip: 19463, xfail: 0

## Build Summary
* arc: 5 total, 5 passed, 0 failed
* arm: 139 total, 136 passed, 3 failed
* arm64: 57 total, 55 passed, 1 failed, 1 skipped
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
* ltp-ipc
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
* rcutor[
* rcutorture
* rt-tests-cyclicdeadline
* rt-tests-pi-stress
* rt-tests-pmqtest
* rt-tests-rt-migrate-test
* rt-tests-signaltest

--
Linaro LKFT
https://lkft.linaro.org
