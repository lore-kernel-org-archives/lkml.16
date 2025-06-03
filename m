Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1D1280321
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 08:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748938264; cv=none; b=eI5bWv+gzuP0qFHZAHmcwWvV61/EjhZdN0gnio74JcNkJsOm9R14gS396+MHnbElNHZx7/muQk4CrUNsj9/Uw4NV85Pqp/ZYZVdhePLyV+7emXKFaFiqv3EVTCffyiPiUmqngE2VvnYibgk+d0cH/kQ8bs+aSyYTQBXYgtAejiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748938264; c=relaxed/simple;
	bh=jUmM6kwyLUdPbLKXSy2k6sMf1vokiKUNKs1IpfSBBNw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iOnaPb962TpV1YxsjsALPnrDCxVJudsDCYUC8Qd8Wc2/74AI7gQjwi+b/j5ojW2NUdGbzPjeI1CJ/6B+lM623UTnl5a0wckJhZwNMPRupWEykQe8RZjMl9lrCYTvxbtrAjB1vtRO8VSHEdQhzG4twGLaE6qiWyl2o6Mnc2d2EO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LVOUcXeh; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LVOUcXeh"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-87def342791so979844241.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 01:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748938260; x=1749543060; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iJvNtw55BnHmyAVpfP1EHOhy3chABBvF/TrseOesELs=;
        b=LVOUcXeh7ILkQMLU1An71mgxeJGV57ApJuMa7O6Y8e5P8P2ZDdBXgFQSFITff5jUZT
         IKN2il3YM1bNgJEvt9HQg8FYBIK6P00dXQ9/htTRab08rPQA1y/7nO0TW6ZDv7uw7fEq
         fhU3O3UFOHeQu8uoFcRoYngPGu2JdKPlcChiSm196yNhOEhsbN+wVA5/gEt85pdAmlzu
         lgytb0x0kB40XjYykx4PGGfpORtJxkwCrhb0CvCWciBjdQQhjuwYlWMINnwTD8F3/x16
         WCbO16Fm9G5LEw3oR5c8KaTEPfVKGk6Sl6iXnEoFUzU/Uznx76dO4BJr3EX48PxFlTWM
         w/cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748938260; x=1749543060;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iJvNtw55BnHmyAVpfP1EHOhy3chABBvF/TrseOesELs=;
        b=qC/H6xeeOGA6n+jIcQB0FAWg3QMBBsTohhKS9o7rJLo63rx961KFp+e2J3OtuiTcSZ
         eiwNaJsCzv7HDHSiBZfxhMjj0zsIENW3qQQ2vfRsGcB292ATgttXjYGfPz2WDZd6RExB
         MYnFyYW1gaKJGHhfK04R4JvZ7ewfX8kFq3gHHov/3NeFABFkH0nTbsCfxpu3AToYPk8B
         ZAPsx599cQDglI4NXNhNEaR0i/I0jlDLBt3vYfrpHc5bHAlTp57fyh/GWrW5CYat++qp
         3ozzRQXEMhHR3l6aiPhCVLDQo24i0PpijX+xRkjRkx50r0byX5PvQVGQjbxtFa6FCWEs
         vDvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWU+Ge3NXjD+lSGUMg6+zJk78cqKUIIAe0xiPdCmxcy1qSEIQ5I1E1oZuNe0Vfx9MfqLHJ266mCCCnpYGs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhenMgfHmS9qwnWHzBOtelLPGm2fU3Df3sTlemol+lNNLTF24k
	/kgNYyb9eeCdwrSmd8hMIx2ljKuiip30ndnVwCwuSTQERwtw1ywjrZIp7fQAhZeevQylikav4kx
	d3jbWiNp79pSSeiIUuU0LwkEJVuhxY2FPGOaxCklRjg==
X-Gm-Gg: ASbGncv8MsROaKkcAu9ENXhOsGAEu0Ft0afYyeDmTekMeRm9fy9fAhipGJl79pe+Pn6
	v0Prn13PGu/1Nj0ccba+/pD083ahPYpJh+B36sxBrM8hIyfAzgSsAwQrTMV7uo/yHVSQ8xxM1Y0
	8joUU2a/raPLindvdTFAKJ6SVNvLLNvik=
X-Google-Smtp-Source: AGHT+IGCjVs4dMM3MqoDJk9DJ8c8U+dd/1B+c44BJ3TUOdOFILG4zbRELFKWajaB/m4NX5D1opMnugTamOsgMmdpw2k=
X-Received: by 2002:a05:6102:290a:b0:4de:d08f:6727 with SMTP id
 ada2fe7eead31-4e6e410aefcmr12879939137.13.1748938260246; Tue, 03 Jun 2025
 01:11:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250602134319.723650984@linuxfoundation.org>
In-Reply-To: <20250602134319.723650984@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 3 Jun 2025 13:40:48 +0530
X-Gm-Features: AX0GCFvaxqWfgagp1ffOVYDvYD0c_wS9sizPQ3RqMcYEeBwQFBqHVjlDChAbOcU
Message-ID: <CA+G9fYse-qFqJDg17B_syP--b60iHbi4jH7=E6c8R_=F2Pkonw@mail.gmail.com>
Subject: Re: [PATCH 6.1 000/325] 6.1.141-rc1 review
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

On Mon, 2 Jun 2025 at 20:33, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.1.141 release.
> There are 325 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Wed, 04 Jun 2025 13:42:20 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-=
6.1.141-rc1.gz
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
* kernel: 6.1.141-rc1
* git: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-=
rc.git
* git commit: 1c3f3a4d0cca7742a95419a6c91fff4326a2de1c
* git describe: v6.1.140-326-g1c3f3a4d0cca
* test details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.1.y/build/v6.1.1=
40-326-g1c3f3a4d0cca

## Test Regressions (compared to v6.1.139-98-g1fb2f21fca77)

## Metric Regressions (compared to v6.1.139-98-g1fb2f21fca77)

## Test Fixes (compared to v6.1.139-98-g1fb2f21fca77)

## Metric Fixes (compared to v6.1.139-98-g1fb2f21fca77)

## Test result summary
total: 219869, pass: 201359, fail: 3409, skip: 14877, xfail: 224

## Build Summary
* arc: 5 total, 5 passed, 0 failed
* arm: 133 total, 133 passed, 0 failed
* arm64: 41 total, 41 passed, 0 failed
* i386: 21 total, 21 passed, 0 failed
* mips: 26 total, 25 passed, 1 failed
* parisc: 4 total, 4 passed, 0 failed
* powerpc: 32 total, 31 passed, 1 failed
* riscv: 11 total, 11 passed, 0 failed
* s390: 14 total, 14 passed, 0 failed
* sh: 10 total, 10 passed, 0 failed
* sparc: 7 total, 7 passed, 0 failed
* x86_64: 33 total, 33 passed, 0 failed

## Test suites summary
* boot
* commands
* kselftest-arm64
* kselftest-breakpoints
* kselftest-capabilities
* kselftest-clone3
* kselftest-core
* kselftest-cpu-hotplug
* kselftest-exec
* kselftest-fpu
* kselftest-futex
* kselftest-intel_pstate
* kselftest-kcmp
* kselftest-kvm
* kselftest-livepatch
* kselftest-membarrier
* kselftest-mincore
* kselftest-mqueue
* kselftest-openat2
* kselftest-ptrace
* kselftest-rseq
* kselftest-rtc
* kselftest-sigaltstack
* kselftest-size
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
* rcutorture

--
Linaro LKFT
https://lkft.linaro.org
