Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1302EB5DF
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 17:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750959887; cv=none; b=LigiHK4XUBOhfYyHtoAR233ruq6pt7mt9P17EDvrgtf7FMdIm1EIey7vkGuP7xhpsgLyptqSs6bGqEMtEH2afxIK0p7fC30Dfq9pshM1zBUY8eLfdGEVwVrDvLg2Na537poHAs5gs4SX6s4Bx0EjafAwdHBIAB+tOMW8aZnReIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750959887; c=relaxed/simple;
	bh=zqUO0sW+cNaKMWzNEDMI98mGQvarDe1iRGXhZ+Veqss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TND+CRfpzLDCv3Dg+7WcO6AOM0t7+UinXgflensaZ7j0qpIIxjCq6/kT2DYPuJv9v0XI/wE5v5Pd3JcY/JzrHNyLAPfr/ocQt/Eua2RHayIzr7Us+7gGebQbdGxxLhY0EadykDv50BZ1px9YYeVmnrifkBQKuTyyaUKHJnPjm5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FBCtn/ro; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FBCtn/ro"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3138b2f0249so1176591a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 10:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750959885; x=1751564685; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=awzZr2qt61hMaORaAhilI11J4L+Y4ATtUQ36+lUSj4E=;
        b=FBCtn/ron0kYEA+/6EO/VYIzRzGisMQFV58vimNt/6bM7W6wxjx6gsubpxGhEKkJVL
         T3AVg4enXNe1axnDBJE95/1riYSFdrUdzhjd/EsBEb7A57vx+K/rV6Zk/gqydGcMFud9
         Li7bz+8ejPqwGbf0QM7/X9SDwS1HHImJP08nlgtaTW6ibxssJAobas8tLvE5qTVK3gcj
         qV1lRcSQBMOuE+3Dl2y1uUT960/ZxGaCDNCghHvOJ6mtZPQ7uYzfwNbQb70Gjwt3JlES
         CgPvqUFRYw/TEuqtj3HpKKqKRCGmFF6v4Spl/EzrqdfS2fvSSrEB10KbSoe6/0y1tZwa
         b8Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750959885; x=1751564685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=awzZr2qt61hMaORaAhilI11J4L+Y4ATtUQ36+lUSj4E=;
        b=dXARvsxbJqKxHxrsdzG6WF+OfZv/Vp5izGKsMzTEcpvdK92N+IFYn8yp811Sz3rc+j
         VU13wuQUN9A8h6uBQkGtQO9XxGFsD02JUzS7ogj6kjtegQrZJfwyKKdo1YYvIGLnZZHr
         bZu7AybEh0U03UH08lx9/KrKr6YnfR5uoIOeuhH82phfeOlRIY57XGy0egpaon4EppwD
         x+QaK8bSTtQIn34THbPWQtstDaLic05FPi2fPHVRGtkmKko/muZHvyj+MsA8rvO+gMzG
         Je0pvHtLD6r3/5PuNul5sK68fJU+rSc6cwzV87pe9XXrdrTq/f0/5nvlgYW8+qrVQ4gZ
         sNjQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8DzvGutAwxd4WmRk0GO+5p5HZzkLcsHmCraM4XAbekgE6ry7YeAPFIi2IuBhr6pABoKYpX19l2EyeSXM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGumT7/pN2mB7dM5nxyHOuqQUxfXAB6nJ5EA+5VHrHfoagYh/P
	Odn6YcEo21A0M42LfUv5mv/8/pG2G+pRV8a2Acys4lFkqpUWBa+6XaVV7a70oaQerrMZ2HqfrNi
	jdd/AktXO38Yn2EIIjMUfWsz3rIoHb7ZsL3DWVDpyBg==
X-Gm-Gg: ASbGncuKMksKCfBSKoNfq7PpKyKDi44SY3n4vU7dq9iO6C0cRuf3vQIehsYRjq3nKKE
	TzN5g1OBVn5vWDgXqKAnwsBHcWPQVW0TzJ0ibmgsMTU/d34BHhIEQzzAEx/SCvceKpR9Uq+2Hh4
	F3d3gi2pAd+b/cFih98uoDLCRprL56fu+1uPAqUjKg4R130a1GsZtdOlSxo8+ZTk5At5M45QWjB
	Py8
X-Google-Smtp-Source: AGHT+IEFPPEqV7DtiqEA1oE1/fKrctRNlSpnteTT9tcvCUfZIlkuK+VPMsW7r1iS1qPSXO31ZrE+Ng7a60BAXQEdGNk=
X-Received: by 2002:a17:90b:3cd0:b0:311:d258:3473 with SMTP id
 98e67ed59e1d1-316158cc4d5mr6717061a91.13.1750959885262; Thu, 26 Jun 2025
 10:44:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250626105243.160967269@linuxfoundation.org>
In-Reply-To: <20250626105243.160967269@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 26 Jun 2025 23:14:33 +0530
X-Gm-Features: Ac12FXycaF7oeRJLnS3XeYXVpdhngxsyXODthsn8k9cqqTJDz0BHwpoRhfHoX6U
Message-ID: <CA+G9fYunftA3YqTxm-2GMN1fpQ_PVviBpDOnGznUo4YSW9pmSA@mail.gmail.com>
Subject: Re: [PATCH 6.15 000/589] 6.15.4-rc3 review
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

On Thu, 26 Jun 2025 at 16:26, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.15.4 release.
> There are 589 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Sat, 28 Jun 2025 10:51:38 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-=
6.15.4-rc3.gz
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

NOTE:
The reported regressions on 6.15.4-rc1 / rc2 LTP syscalls readahead01 has
been fixed on this 6.15.4-rc3.

## Build
* kernel: 6.15.4-rc3
* git: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-=
rc.git
* git commit: d93bc5feded1181a1f0de02e38b4634a7a76b549
* git describe: v6.15.3-590-gd93bc5feded1
* test details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.15.y/build/v6.15=
.3-590-gd93bc5feded1

## Test Regressions (compared to v6.15.1-816-gd878a60be557)

## Metric Regressions (compared to v6.15.1-816-gd878a60be557)

## Test Fixes (compared to v6.15.1-816-gd878a60be557)

## Metric Fixes (compared to v6.15.1-816-gd878a60be557)

## Test result summary
total: 270887, pass: 246235, fail: 6441, skip: 18211, xfail: 0

## Build Summary
* arc: 5 total, 5 passed, 0 failed
* arm: 139 total, 137 passed, 2 failed
* arm64: 56 total, 56 passed, 0 failed
* i386: 18 total, 18 passed, 0 failed
* mips: 33 total, 27 passed, 6 failed
* parisc: 4 total, 4 passed, 0 failed
* powerpc: 40 total, 39 passed, 1 failed
* riscv: 25 total, 25 passed, 0 failed
* s390: 22 total, 22 passed, 0 failed
* sh: 5 total, 5 passed, 0 failed
* sparc: 4 total, 3 passed, 1 failed
* x86_64: 49 total, 49 passed, 0 failed

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
