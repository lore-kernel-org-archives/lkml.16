Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FEE71E284B
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 15:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738337194; cv=none; b=MmAP52K2K8n20w34saq1tXqqhiy8NWt3+rrPZK17MfssIj+Z9IvHf3FD+vYUvk3jwkvdG081TH+8I2GrY4sT4ltl59Psiq1qnxyT2YHXpab7PYJ22NLUh1FAzDwGRc3RkHzBmpUACp074Dl9SyvmEpTH45Vh6gXldI8BrctDqJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738337194; c=relaxed/simple;
	bh=3/0Z77qweBYXBX/5/H9DIfK+cyaNahHPlntmh0VmQWI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=orxifjAkZ28Wk457PRniQpaKADGwy+gO/fet8O32lPnAGL5imYa0A+Wqb/4+7a6U9zvQmh0u3pbnbFheDzlc+bQd4BJ8k4hes2PIcaX9CskIzqXwFC30J/Ahws4Tiw8uCxQ2BAbL4M7V2eHE+Hj3WCcZDmo8DP6fuUbOWLAzFFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xGlNyWcW; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xGlNyWcW"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5174d53437eso1286543e0c.2
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 07:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738337191; x=1738941991; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oP02GWgqIHMyU6iy1+uU8QTBLlREt7y8gx/+g2WeozM=;
        b=xGlNyWcWMTqRfKtXOLP1mTg3NJX1v1ytiNfnZORjaz3wkO94xpN1DuTpv2GCdXplt7
         vHqREv6MvQ5PY8K3vMkoxwN3ISRmypDR7/Vv/MQ/zFD0Xn7j1fvBplo/VTkij90KB/BA
         czkxy0vNOPltEGd72tR1Q1sgTwDMdg92RPUYOIT3fVxwlWpWieJNiVxdYHkkUPwiLFUZ
         ckjYnO7uebUvXBiFpbzJ/AMwNMYmShZmKnrB9tCNeEqBGA+uBCZaUYpz76VnsVAc6yr0
         mYgnKqIFeNJ2Ds6/+Lvy/NdWBOqfBp83/CZcVaJ4htAvF3047rNTscHoyh3A0mH0/F2R
         a08A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738337191; x=1738941991;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oP02GWgqIHMyU6iy1+uU8QTBLlREt7y8gx/+g2WeozM=;
        b=M6tAaPx8D2th/n2rG7toGmvvq+cy0fBoD2h97lqQSZaIFuoFAj7pYtq+fQnlZOnQRI
         lZLbW2pR1dzLLNOJkEgArcuzHL1FIgrvkj+OyURr4chor1QJh601iJ31RVb85/s8EI0H
         Q+SLZReoi3pttX7yzfeLQ4yp2FLsMJ3Xa3RsWP/BxURgq3lydg+3YW2ArAVlM15eEHs8
         iBpDkplNdBRba3ah8I+LbhzsmHS9xDhaY+77BvQfFxktCPFAW3ueU19Lff0hrHxSVwdf
         oLp8j21ynxywtEFIzNk1pY6TBKliO01QyFBm7Z2EvaIJNPLWWhCOrvGobSWXSa+ng8nk
         NMkA==
X-Forwarded-Encrypted: i=1; AJvYcCUBBn5Ge4huMN5223egREUz3SzCl+skzaESnutFEVV3RH92oXiaZ9f3MRyunhJZkVQvmDEe6eqUPmYBu70=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzi9cGgQrqxfBEchItKz4zRfY573iRYAZrzepZk+yyjUWW4+JG
	Ayp0EDxh+2HFaKY9jyVkaMAsSlJq+qEO0SnDxV1h7qcYdWkH6tLx2jc4QuXejCa58rcNQDR57v3
	frP2ABXyWWnGGir6wVhMsrkUw0796P08vkPW46w==
X-Gm-Gg: ASbGncsisRqUF5nddA0Fe/l1WY2nKyDQW1st2U6wMu2XlBOVueP/yuA+CsNLAHeMeTk
	DkxxSWs510kMroPnlaNfuulhjRYrswOBr1YYcisKVYfjjeU2lKnk+MswBH8Fgvl3K+OVfhylx6p
	TfRvysgbsFENfBxq6E0IBHoK2wSeLG1w==
X-Google-Smtp-Source: AGHT+IFgSGqRhIR5UDkU4uXh2hescc5V5Oe2OHITJF+o8P44rEboqOBh7//gL+OkBKaqq4UvEZ+nHMcZU6F/+DOPZa0=
X-Received: by 2002:a05:6122:3181:b0:51b:8949:c9a7 with SMTP id
 71dfb90a1353d-51e9e5161abmr9914263e0c.8.1738337191443; Fri, 31 Jan 2025
 07:26:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250130140133.825446496@linuxfoundation.org>
In-Reply-To: <20250130140133.825446496@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 31 Jan 2025 20:56:20 +0530
X-Gm-Features: AWEUYZmkQ1oz6UEbIN2VKYgUkkC8BVz0VFI7lE0Z7qDu76LAGPpLTFiEEL0CivQ
Message-ID: <CA+G9fYtVGFBb0tZzOYSuF_V7xmij7GUZi5Sk6L_h0nOh4G7MNg@mail.gmail.com>
Subject: Re: [PATCH 6.1 00/49] 6.1.128-rc1 review
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

On Thu, 30 Jan 2025 at 20:00, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.1.128 release.
> There are 49 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Sat, 01 Feb 2025 14:01:16 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-=
6.1.128-rc1.gz
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
* kernel: 6.1.128-rc1
* git: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-=
rc.git
* git commit: da19df6ebb6c09ded78f67e201f202979c1a5727
* git describe: v6.1.127-50-gda19df6ebb6c
* test details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.1.y/build/v6.1.1=
27-50-gda19df6ebb6c

## Test Regressions (compared to v6.1.126-65-gad6747190c53)

## Metric Regressions (compared to v6.1.126-65-gad6747190c53)

## Test Fixes (compared to v6.1.126-65-gad6747190c53)

## Metric Fixes (compared to v6.1.126-65-gad6747190c53)

## Test result summary
total: 108475, pass: 71884, fail: 19274, skip: 16867, xfail: 450

## Build Summary
* arc: 6 total, 5 passed, 1 failed
* arm: 139 total, 139 passed, 0 failed
* arm64: 46 total, 44 passed, 2 failed
* i386: 31 total, 27 passed, 4 failed
* mips: 30 total, 25 passed, 5 failed
* parisc: 5 total, 5 passed, 0 failed
* powerpc: 36 total, 33 passed, 3 failed
* riscv: 14 total, 13 passed, 1 failed
* s390: 18 total, 17 passed, 1 failed
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
