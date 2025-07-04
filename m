Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31789246798
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 11:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751629696; cv=none; b=LBr9cdbgeE4KxJekzNgubshxl0ka2c9kmnfXg0cv61P1B0zuPAYyskL1JaOgP6Abd1wbBaJDOre7O1Yg4IO482OKiaWcB8fzORuEsWF9svyLYVFAVOR4wz3UBhA10JPIgAvD3tgbgyIcShzgNMT+GdSVZsEMT1z8M+t5p1A4hhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751629696; c=relaxed/simple;
	bh=BLt2e4gYJDfFUIoqp0C1xUglnvplbIMHK+j3HeEZ7T4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ItL1vVuC2LupOawxuHgqgOVctUetWnWAcWjGe/WdKOBjuuAR/a3UriE16EXWWYcasjshEjJObmCig4WiMv1fWbLc+AfkDD2MjlqAJm6K5s/0ccryJNyGTiRNMwSzsM87EKgSUAugMDfUoLuZGJOV25F2+4I5TRb0eXPQ12OZGxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BlG1Vrf9; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BlG1Vrf9"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-23636167afeso8884575ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 04:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751629692; x=1752234492; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DUjN4QXidtuC9MgKWPzYZIK3wmGJF/NB5v4vy9SsyI4=;
        b=BlG1Vrf9tGgk1tePNmN9bb4jCzj6fFSEmKSMelUb5FA1tQjuoNLaT5IDg0Hv1C5Fp8
         sHUTZM80WWHFJIitWvMgC1Qc8fB0gH7PzQNDlmPykoq5Bx4y/aFdMtQZAES5zxuLhklY
         /MFwu7Zh+WJVgtvHxXVzKiuqVNMSXzNmkz+OmUEacM6jMjLfZF5T7cq8AEvuSKz9Wjbs
         vAdQUNVB5RpuaNWPCQDeSlhHj6c1dZoFhBr4XhxhMVkOg0Og9mHetwfzHBzwvzGCu6Lk
         13NAZq5g+6HxPC2gLzW5Efm2h3KqlnjkK/NIRtgKKE4o17vGkgSJ8l6XEeCfk+PwNWFB
         hd1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751629692; x=1752234492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DUjN4QXidtuC9MgKWPzYZIK3wmGJF/NB5v4vy9SsyI4=;
        b=ZVOiAzEl77pNI+DAmOJXSjewL5P7QzVpu6x3OTonlUpxn9X9+uwmC6oclZ4PIQHB2j
         M9uw+ZIOVh0m6unmxGbD04VPheMBmBtqvXCjdLog6UPBppJacZWVcLIrk2WZx+/6xpR1
         5wMxRfuh70BimUbp42V7pYy+BfSMMO/jwfZgml74pZWshzKJ+UcvGMuCi7aJN/78EODc
         AhLWWkDANhPGY8aIpYvXtJvS0KNU0QsocyjJM04/1fgt4+BsQEGKpG57j0XKXQ685pmE
         +5v2hQpc32hTrUT1Kckeu3cN/LBhvDLkgE0TSi7CqbhnHMqh4mKYvToR54PP608vfoWq
         n6uw==
X-Forwarded-Encrypted: i=1; AJvYcCWQuUSKv1HvYiESGYgW0Kq3HbOLiKYX5kh3TZSwwnH7HAfQMUzjEbIAk46wtKECME6qRgwM7j7x/zlEn5o=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmy7/WRA3YfbBoQ/f2HQLVPE+uMwalcRTtw/VcGbCkE/qWeWJc
	mgidFETIugbV/bKWNnQ6VDBDjwiVeqSawC9T8ytcitSRuh7ThI/DaGZLQtRwPtDkbhBWDU0pF6o
	ikk2qANlvWuD9Q0WC7fG6z09dJrY3F5vT/N7o/AUo9g==
X-Gm-Gg: ASbGncscJUv8RDp13hn9hZJq4dOmO0ePf3AtsYgPQJJbfZ39qfKOo9PzxfpS6UqUgSs
	45uxPk1XOWb0Jcnpf3O46esSPwaFZp0Fl3J79SIc7bACtC6upqoZMt9+lgRKUdRhPmKu3bXxZja
	ZSnRfRA9Gt/WeQmpIfQPR4cCF9VB8/ZK4SWHFwBkyCzqlTWOUkhN07yn3BQsU3gB0pXMvUlRRb1
	Y/m
X-Google-Smtp-Source: AGHT+IEZP3iwLGUJFpqwoWWIOW6UVQ23gWdyxZYmObiHJnJt2wQd7+1nwt5UYR1/ti449dFIgpH/kWfqiz/Bd7UHlwQ=
X-Received: by 2002:a17:903:3d0d:b0:234:dd3f:80fd with SMTP id
 d9443c01a7336-23c87465293mr33713885ad.2.1751629692416; Fri, 04 Jul 2025
 04:48:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250703144004.276210867@linuxfoundation.org>
In-Reply-To: <20250703144004.276210867@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 4 Jul 2025 17:18:00 +0530
X-Gm-Features: Ac12FXybOZIGHC5PyPBUj4nRBTvqSKaPmqw6NTEjvBZOrsk-eVQnQskIsVP5bTI
Message-ID: <CA+G9fYuk8=yLbdUv7ngQ0b5_p2-w21D6JdOYDcsdx7XUK-aQ=A@mail.gmail.com>
Subject: Re: [PATCH 6.15 000/263] 6.15.5-rc1 review
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

On Thu, 3 Jul 2025 at 20:27, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.15.5 release.
> There are 263 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Sat, 05 Jul 2025 14:39:10 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-=
6.15.5-rc1.gz
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
* kernel: 6.15.5-rc1
* git: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-=
rc.git
* git commit: d5e6f0c9ca48c1efb86783db4a2b4e457118c27b
* git describe: v6.15.4-264-gd5e6f0c9ca48
* test details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.15.y/build/v6.15=
.4-264-gd5e6f0c9ca48

## Test Regressions (compared to v6.15.3-590-gd93bc5feded1)

## Metric Regressions (compared to v6.15.3-590-gd93bc5feded1)

## Test Fixes (compared to v6.15.3-590-gd93bc5feded1)

## Metric Fixes (compared to v6.15.3-590-gd93bc5feded1)

## Test result summary
total: 261397, pass: 239055, fail: 6046, skip: 16296, xfail: 0

## Build Summary
* arc: 5 total, 5 passed, 0 failed
* arm: 139 total, 136 passed, 1 failed, 2 skipped
* arm64: 57 total, 49 passed, 0 failed, 8 skipped
* i386: 18 total, 18 passed, 0 failed
* mips: 34 total, 27 passed, 7 failed
* parisc: 4 total, 4 passed, 0 failed
* powerpc: 40 total, 39 passed, 1 failed
* riscv: 25 total, 25 passed, 0 failed
* s390: 22 total, 22 passed, 0 failed
* sh: 5 total, 5 passed, 0 failed
* sparc: 4 total, 3 passed, 1 failed
* x86_64: 49 total, 48 passed, 0 failed, 1 skipped

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
