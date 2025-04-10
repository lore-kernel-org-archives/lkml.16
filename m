Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8CD202F61
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 06:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744266339; cv=none; b=FHuwFksjz3Htb0aCGvxrI8TniYKnOmExfCqj0Oz9xf6Aq+znBywG0hJ4qgrOrmB536ntRwrfsk5jM+Xmjm4WPsTZ2FqQ58Bsc1/YTHrad9cBWQPo6bxxN0tW+nmXvSXhAuiZeUBh5qklWdWPOwghxGTnpK1ynhqEw0MjsQ3TswY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744266339; c=relaxed/simple;
	bh=aGpkY4O/3TbhmrBDujSrzkv1VCnxkOFYrMxit4qRUFw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nu82EBKW4n1HF8xrdfjIRqLjk23eohWbQtYfLZ2M1RzyU0mUYNWbEJoAhGXNyNjtT2qaVrD+hhYAyRTUrShTb50rSr89VE1bIVgWrXaHgcC3PAeV0ql4mjuqnC/vxnn0Ir64Z8RJ9ZXTK3dQ2v+YCVD/802mzZnz092T/YywyIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fkP2VXxH; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fkP2VXxH"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-86ba07fe7a4so406981241.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 23:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744266336; x=1744871136; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zyNWqPKOQ9/3oQt9wRtOOs4tLD3TZ787ZZ5Pjy8pmfA=;
        b=fkP2VXxHMwWrp53nFCp5fb+U+XrjZTBpQbrhRs4ZTYkfyjKpei1JFRusgaSXQO7cKP
         +ZsroYOgAFns1mu9Lvq8iCITkaOB5Pb555HeSrGqAWb0ogvyKtQURLBp7BODz9E9Wv9+
         0tM1sxGqyFBhbPT9Dl4X3e38KuXdWJTCL9hn3fHGnsrEvwDrJCUamBxFNFxWpHrvYoEo
         Nl6qHpc5ZGgOJRf89jrwi9BUdOLV1/h54adKjXJBrRSgx5D/fu/FdoXBlRMVVINIJ1XL
         OQzxpIH2Ki5wzwSOsNKYeXYkD7/PMSqO277/wKbwD/gLEXk7Wys1BD7oPL02SgbNaMM2
         SqJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744266336; x=1744871136;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zyNWqPKOQ9/3oQt9wRtOOs4tLD3TZ787ZZ5Pjy8pmfA=;
        b=pLVRX8vCxDLjbIxzp/UkHeXTwLxXlwNtRikNLbTiQ4OKHjvyYAwP8VLJsohELabnLI
         QiiZOZhYkb/8/PYS/y9EUkJXZOMxi712A/dplTAUSHbXZKp9PUezIqdNfgVlnJBaq66v
         WHbws61ZtzBb1nbmlQF8fCS0M+PPuE8CkfTk7XkLTqfWwgAgjwaBA0rKhBoTHVYF9wKz
         AdDtdcTnQ88YxGBlkDE/Qr9sENESpccDTrkKkhQugET26OqiMoBtQKOqjd06fnMpGRQa
         rnTVm2g/Y+ZhlC/bGOyq+w4/FXg8NXNNhWwUbHMnCz4R8YANIeRWpQSs3scSdLoFbCI+
         iCnA==
X-Forwarded-Encrypted: i=1; AJvYcCUTwkcE4DiYM9ahe+Cavsi/ZxXxZzL/SNXiT40mDiJAvI0MJTwuWPYHURO+uuV1pK1huY+yPRN2JLtBvuk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/kQ8ps5DOpUeleTtg5p/kZRBrn0OWPGErvUT4Wvl0Mwu+6hiv
	VMIrGZasBr+S9U/ckWmG4P+n3s0H0erVNNffveyepxGqQkd02sW7S2g2LJFpwYMIQCMUFTnZhWI
	4LwyBKJMtHBeLc4oydqOaUgbvCrh2qd3/CFP1UQ==
X-Gm-Gg: ASbGncs0sHTu50WJ0AoUB/S6lvJHWBKStaa1ZDfWXVjtkm48yhyI+z0KMbm5Fmw0SKC
	NLp3ZiE0m+r1e61gycV5G6Vr24gwbEJHLxCBveZDfBT+bDCGlP78pL7oQWY04L3RVfF/L05IywF
	Wds+quV9nSh6k9Q8qMldtBCAT6Ki4ObQY5BNCjEpuDBARttqdR4DnsDjpSJR3U9/WsFQ==
X-Google-Smtp-Source: AGHT+IG2aNdsOXAjNvzpg7zSgl4b9ctMJGLb+z8eiGPuyFdtc8URMDmcUMZ8aMiJWyf0izLJvmAFLXZo1jsBoBoZ+OI=
X-Received: by 2002:a05:6102:5615:b0:4c1:83c4:8562 with SMTP id
 ada2fe7eead31-4c9d629409bmr371847137.13.1744266336159; Wed, 09 Apr 2025
 23:25:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409115907.324928010@linuxfoundation.org>
In-Reply-To: <20250409115907.324928010@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 10 Apr 2025 11:55:24 +0530
X-Gm-Features: ATxdqUGwvc_wcV22L39WBJ0l-_5Wti_pClWG4Nk2KEj2x_9XnIDbIyGu4SQml3A
Message-ID: <CA+G9fYt18c-W0d2aZOt3_=pryrmp211F-HFUdmHNb-Ew8DQjWg@mail.gmail.com>
Subject: Re: [PATCH 6.13 000/502] 6.13.11-rc3 review
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

On Wed, 9 Apr 2025 at 17:34, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.13.11 release.
> There are 502 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Fri, 11 Apr 2025 11:58:07 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-=
6.13.11-rc3.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-6.13.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Results from Linaro=E2=80=99s test farm.
No regressions on arm64, arm, x86_64, and i386.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build
* kernel: 6.13.11-rc3
* git: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-=
rc.git
* git commit: b51363104424dfb8b160270333b1af3057374b28
* git describe: v6.13.10-503-gb51363104424
* test details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.13.y/build/v6.13=
.10-503-gb51363104424

## Test Regressions (compared to v6.13.7-385-g8cbfaadfa0ec)

## Metric Regressions (compared to v6.13.7-385-g8cbfaadfa0ec)

## Test Fixes (compared to v6.13.7-385-g8cbfaadfa0ec)

## Metric Fixes (compared to v6.13.7-385-g8cbfaadfa0ec)

## Test result summary
total: 130642, pass: 103832, fail: 6766, skip: 19617, xfail: 427

## Build Summary
* arc: 5 total, 5 passed, 0 failed
* arm: 139 total, 136 passed, 3 failed
* arm64: 57 total, 56 passed, 1 failed
* i386: 18 total, 18 passed, 0 failed
* mips: 34 total, 33 passed, 1 failed
* parisc: 4 total, 4 passed, 0 failed
* powerpc: 40 total, 35 passed, 5 failed
* riscv: 25 total, 23 passed, 2 failed
* s390: 22 total, 18 passed, 4 failed
* sh: 5 total, 5 passed, 0 failed
* sparc: 4 total, 3 passed, 1 failed
* x86_64: 49 total, 48 passed, 1 failed

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
* rt-tests-cyclicdeadline
* rt-tests-pi-stress
* rt-tests-pmqtest
* rt-tests-rt-migrate-test
* rt-tests-signaltest

--
Linaro LKFT
https://lkft.linaro.org
