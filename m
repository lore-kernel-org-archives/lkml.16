Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8030735977
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 07:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743234584; cv=none; b=usc044/kqiMYnXCinfsBtvLWhr3n46chCgYE5P1WBba0D/FrPTiBa7GYc6aXD2UyedC+DVOyrxWfh1i7tlHpJPJ17jI9gjY/V7ua+dXCexi2seiiZwrra5IdEWY6ahEVK57GIPB8KAoO1RmGC/4yyZe7yyaqDjMaSIprAY4vEHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743234584; c=relaxed/simple;
	bh=MHHRWUXC0T3tGXItDSQMukJjIL8/ZiY7+/F3ZN8HeOQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IGX7KzVDQQ4oZjFzSQlpTJ5z29tdqAB86H/GGjS+/FUgshEV+CdzVqGJGdxKn5v3nsLVvG5EWfq+Zz22s8g904MH2sq1f6LNOst18P6kcni7CEkbOiGf6bCQL2sA5Xba2RI7EfBsYsfA8oAM7GO/u81WpRb4svjflenj25audsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L2PDGXlz; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L2PDGXlz"
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-52446b21cfdso1282967e0c.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 00:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743234581; x=1743839381; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3C2zpjI32ZH68ExPTYzRVA/xIOTUen94tCifkIcqHY8=;
        b=L2PDGXlzgfCGTyhRHXaHhko7e8o65jacAEgCZU2toO4OsO4MAj+1OWQ09KMYwvioh+
         N36Is/VkRQN88shAsqReIOFC/HNCCpdspqbIXZNRiUTN6w48ecWsf7Ht8FzhQPNW6T9p
         f8/CMMX4ydmZnrGKanmP6zkKjp8yhpTAZkxUx6eHq8WRzamT289gX2UVOda3+vu2C/Py
         Mti1iNr0czFYuttHt663o5UDX0IcSaLy+K8hf0T6KogHlUdaBU2f6qINjWV7mDSDKKYh
         Cyhr7gyykNeEnUv142GVVOyw49a4uoXD+wdufz9qh/TrVsDN7zUmV7oIp61gvXIbI94J
         /pjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743234581; x=1743839381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3C2zpjI32ZH68ExPTYzRVA/xIOTUen94tCifkIcqHY8=;
        b=g8EnpJhEf4LHaB1YqZEecswwwH6J19ixULzTWm0t2SSAzBP+DN1PY9wIJHJzJwH8u5
         TG/IgnvXIKnHjQS3gXo5IrhHe7DXJnPh/7ztgu0p4b5mUoLawVEplRxsOWxEbVZLIAvc
         Qe9hEngK9AaRPEa/wFfRZCQdGK6ZaPR9HajH8sMjuquO9bWuB0Y5vXH7ZbVTK8/skmEl
         IXfa9Azj7Cdh0TPiMibBMQss6ZQ1SG1JWtlp4psqXYReSV+QEIl4NdMCReEXtEFGOyQm
         zgiNH4cwo0oPbU6WnDnz2ScFVZUjUvA/VdDbTFcFEzKQRrUPdSBiQcZp7wV2QLMrcC9o
         cvEw==
X-Forwarded-Encrypted: i=1; AJvYcCVO9NyVBOOlJHal/9N5IKvoJKoTwueTiuljnMdFohf1YIR0vZ4RNng0agvvYerGr4ssoNb21uxuimeGbII=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6KJ0N6CxeAivAnBELNs0BQz0TnC/i2suXoulWmEJOl9HUsXsC
	LO1ROnNN4hAWxJrJG+zruBXBvIPxtnquz+yrIPI+VuYEp6d0aXjN3yZLI8LZMX+VvjxduhOKEz0
	2aO+1DLKL8FnX31XrWb2ZIU0fV6H2uyuiamHGhQ==
X-Gm-Gg: ASbGncuEcN8ntZO0HsM9U5BrPmKHXBhUEWyfVuB7e91fr4m9yZos6ofRn/2xduNz6bj
	m9ByxhnqvJFm5pbtwIutC3ye/D9u+Xku7qA2Jcb4+fqA6ucGPY8WOBsDUZI4dqUYjxJrOG8p6+d
	drTkdGcyO6cF3BtqaVllnkSTPq5AJhLsvRQTC/MH7urLbQZTiC2YDjusWZo6M=
X-Google-Smtp-Source: AGHT+IEjxd3QzrvH+Pg9A2NoNz2kh0BR0YjkJNSydoZFwQZzM8b49otZVjs3S4/pPOgfbZ58TTgNgeYQCStbEnP22Ec=
X-Received: by 2002:a05:6122:3d0e:b0:523:8230:70db with SMTP id
 71dfb90a1353d-5261d4e0e18mr1295865e0c.10.1743234581158; Sat, 29 Mar 2025
 00:49:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250328074420.301061796@linuxfoundation.org>
In-Reply-To: <20250328074420.301061796@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Sat, 29 Mar 2025 13:19:29 +0530
X-Gm-Features: AQ5f1Jo6C5mPNw0OZrMB7VjXrQqsCNSD0uiLzOh0vpRmVRtg_TkWKb_6VsjrOAk
Message-ID: <CA+G9fYsydn0Y=UMSdDagnnT4Xsb-MP0vfStYaqK8uxDUACsUUg@mail.gmail.com>
Subject: Re: [PATCH 6.1 000/197] 6.1.132-rc3 review
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

On Fri, 28 Mar 2025 at 13:18, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.1.132 release.
> There are 197 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Sun, 30 Mar 2025 07:43:56 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-=
6.1.132-rc3.gz
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

## Build
* kernel: 6.1.132-rc3
* git: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-=
rc.git
* git commit: 0c858fc73636037dc5394a03850eac9083de1dea
* git describe: v6.1.131-198-g0c858fc73636
* test details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.1.y/build/v6.1.1=
31-198-g0c858fc73636

## Test Regressions (compared to v6.1.130-110-g5ccfb4c1075f)

## Metric Regressions (compared to v6.1.130-110-g5ccfb4c1075f)

## Test Fixes (compared to v6.1.130-110-g5ccfb4c1075f)

## Metric Fixes (compared to v6.1.130-110-g5ccfb4c1075f)

## Test result summary
total: 105955, pass: 82570, fail: 4156, skip: 18738, xfail: 491

## Build Summary
* arc: 6 total, 5 passed, 1 failed
* arm: 139 total, 139 passed, 0 failed
* arm64: 46 total, 42 passed, 4 failed
* i386: 31 total, 25 passed, 6 failed
* mips: 30 total, 25 passed, 5 failed
* parisc: 5 total, 5 passed, 0 failed
* powerpc: 36 total, 33 passed, 3 failed
* riscv: 14 total, 13 passed, 1 failed
* s390: 18 total, 15 passed, 3 failed
* sh: 12 total, 10 passed, 2 failed
* sparc: 9 total, 8 passed, 1 failed
* x86_64: 38 total, 38 passed, 0 failed

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
