Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D71C2BF00A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 10:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750848864; cv=none; b=A/gN+gl9qtR2JMorLt86kS+kY9/Ndn+io7c5uHWqz36vE8dKtHEprDFKlk5baPhs85gjRflus22wOuk0HHlBIyr9XBbf6hDFyZSo8aOVK9gt6TE5wqzlCzozPMKu8gJnKq9V+YmMggFs7WYQvJaojdRowYy5IzTI0HUCeLQD+uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750848864; c=relaxed/simple;
	bh=oWw3YvvIIyZMO9LMr45beiGm0PsyuB9vcsoRXkosJKM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CqaY/CdsN27LzhYjKmCvxlTcvFXuASfpDkBZpYXDLHwaISawmVnUG74Y0eUjHEtlF5/vrJ9jNtA5eBvlBJ6eIS6Ex/LqKdJvkst5PU+Gs+mycOZwYBY8x5VORX3DrYkNsx0pp12RbaJhI8h+H5Mcl0yz3C3ksSNcfb86IWLZqes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aT0USNZ9; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aT0USNZ9"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b31d8dd18cbso1880133a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 03:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750848862; x=1751453662; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fMQOsT+mdqoi8lnfK5N5XyAR9UzojfvCMCTObb86FVk=;
        b=aT0USNZ9ShDL/4pPXa6PzRTtQNlnpQmOFm/3u1w0msLeBHMotUl8fZ+okNois4hm7t
         YidGfb0Sbf3GlLqY6bdDbZAe9+OMSwGY7XZYVxMJE+qAenBVsOPLu/cQa1V3Hpt+qRtx
         RTeCyPHAibwQ1b5IenmXVjuhTpq41SAFnSuXUfsttAAo5tehnzD+bCLO6NT9JA5R90e4
         9gW5hb31f4QZfoZh4hCpnlWojQNp7Jn3ao/aaQ0Oajnz9rCHMYfKpE7dUsuAswJih03Y
         R1O0CDuQYr4aclSfVNSucr2SenWRpv1yHlNUhhFfqBUvIuSV8LvCwjQ3habQ2fyl2wCj
         s7sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750848862; x=1751453662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fMQOsT+mdqoi8lnfK5N5XyAR9UzojfvCMCTObb86FVk=;
        b=Z1BaBKxYgoa6dJdTC1Q0OqZuxS35WcMacC3CbPruwNtxvBQteYSKoEDAdEm2Yhmcta
         KBDYKJAvCAhH0+nciLCjuLALWxs+pRRw03Oofhw16iCRKeQ6BKBRzNmpqOWr1M9doK0c
         9dI90KZPPPUdP+TiPlPzLCMb1g2v/21gDqnNbTI9cZlCEF4+A2EK2bA9GvA8uuA3HSOP
         VcQ/8zIXOreN8jhovyBeDV+EZJAhYwC/NtmBjh7IonL3KDfNeqy2V1/JwBNNHoDW848G
         jwF2cUD9amCTm26TAWuECDS5vczMoA8K7x0/TBPijQSe9yagUblSFnc+tzplsQByPRoP
         GeFw==
X-Forwarded-Encrypted: i=1; AJvYcCXHXgcyv+MD9xoSR5fWNpM2ccoDzKiqGMynU4KSe5UvjruZ1Vp78RxDNIQgr+XzhayVBR5VuqBRBWRp1XE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzv0hJFgrhNENPYiqbLbhXLCKXbLaDP3X3k9JKhOZZfX4UvbJ7
	3kdPYtdv7tQ4lHJCKWc0plVhn3z5FmbMDJZj7fSxBBr1nD8c8GbaVcd3Hzjl7h0O2m+b5lZZfBg
	1iIlpBsgz3ToHsqx+wjG+6bUoXgv5dvG84ouK/RCSvg==
X-Gm-Gg: ASbGncsHNzJHXhXjfr5a7NWSFKcWtfMVtajU6niKGba39wNgUwn5ROSn5w2Q38IHOw3
	bO3hjYKGXc2PKwjCEWO+ZIo9dKRHnbKgcWmrgiAsJB5+9VwQdvFHCRH7aFZNZwVQaIvAV4dLPMy
	rQZTwmU52CIr5oFHkd/Zx2Z1aE6hVQJvC4mOynfa2czGeEPlu4yQTg906KC/6uW8o7hYoYjvzwW
	AOC
X-Google-Smtp-Source: AGHT+IHiEEGI2cB5HHq+2rW2I162fZGpGjKdx9vFcpygnRYRBtx9ITlyUhy0ssBTVpCEGfR518CwQjoRlvHR7iSKwUs=
X-Received: by 2002:a17:90b:1d05:b0:311:9c1f:8516 with SMTP id
 98e67ed59e1d1-315f26192efmr4507300a91.15.1750848861645; Wed, 25 Jun 2025
 03:54:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624121409.093630364@linuxfoundation.org>
In-Reply-To: <20250624121409.093630364@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 25 Jun 2025 16:24:10 +0530
X-Gm-Features: Ac12FXz97GBM2balbdrYLnqrqpEMD_cJZ26q0A3b3jEWkftx66qzM1sifzdDU30
Message-ID: <CA+G9fYt_Z-Vtoan2z-OEoArWuNy=A9wwAoTyRF=G8zobZBaDvA@mail.gmail.com>
Subject: Re: [PATCH 6.6 000/288] 6.6.95-rc2 review
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

On Tue, 24 Jun 2025 at 17:59, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.6.95 release.
> There are 288 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Thu, 26 Jun 2025 12:13:28 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-=
6.6.95-rc2.gz
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
* kernel: 6.6.95-rc2
* git: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-=
rc.git
* git commit: 33e06c71265b793ab2b3f3358952f6995d09e793
* git describe: v6.6.94-289-g33e06c71265b
* test details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.6.y/build/v6.6.9=
4-289-g33e06c71265b

## Test Regressions (compared to v6.6.93-357-g7ef12da06319)

## Metric Regressions (compared to v6.6.93-357-g7ef12da06319)

## Test Fixes (compared to v6.6.93-357-g7ef12da06319)

## Metric Fixes (compared to v6.6.93-357-g7ef12da06319)

## Test result summary
total: 233901, pass: 212419, fail: 5723, skip: 15315, xfail: 444

## Build Summary
* arc: 5 total, 5 passed, 0 failed
* arm: 129 total, 128 passed, 0 failed, 1 skipped
* arm64: 44 total, 41 passed, 0 failed, 3 skipped
* i386: 23 total, 23 passed, 0 failed
* mips: 26 total, 25 passed, 1 failed
* parisc: 4 total, 4 passed, 0 failed
* powerpc: 32 total, 30 passed, 1 failed, 1 skipped
* riscv: 15 total, 14 passed, 0 failed, 1 skipped
* s390: 14 total, 12 passed, 1 failed, 1 skipped
* sh: 10 total, 10 passed, 0 failed
* sparc: 7 total, 7 passed, 0 failed
* x86_64: 37 total, 37 passed, 0 failed

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

--
Linaro LKFT
https://lkft.linaro.org
