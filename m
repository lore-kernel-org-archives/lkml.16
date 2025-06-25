Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F4E27FD74
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 10:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750847000; cv=none; b=MD8EOQL5ePCCfCpnpmQKcIL1JbaxpZhLJjHV/hm6UEs7cn3GZfFBp9z7Ef21hyk70/bm5E/o2h6nuure0wxjd6dWUHD49xryLa8BuEwDoUPV8nhN12ewPHfUlycW01yM8cWQEgGLBj+JSWaVkITTb63scCOftj1XCZfw+0AjCjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750847000; c=relaxed/simple;
	bh=sLOlO6Ct98dqJEhk/xCShrWRV5yesUPYrAQDpxALhR8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RXWVNVROnzpfLQnLm+Sc3ffD169nhR7Hqooc8g0Est4izdQARcasfApJaf/B5kTQjLZlew+y4ahhUaZSUqpkTCKmRY1bILiGsVk+TD44f2PY0Pp2xE+FKx9fcY7An1SZBQnvo9Mv6r+t8guzlD/YNwbVIoltXkltsT93zQeUVng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xiGP9DgZ; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xiGP9DgZ"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-313bb9b2f5bso1709136a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 03:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750846998; x=1751451798; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lov9+Zjt7YEZlzXRaxLC1dZ0shHTHM8AduhB9Li5azE=;
        b=xiGP9DgZC2SU9JfhZYywZ1eNvzpqic6ftLKPCEFNO7uTNt9K9BAD7j4vc90tOHjId0
         g35L5FOgQyC1v67IbBTqcsDbmCrirG9/E55NrlJ9WhtDGps96sK8UcC2J0ydvSOWeYCD
         TIs5XVJDjVA/DKX7ThZw4vqYKg0VdXMt1aDBhxG/vdDqcvRrG6/AOQjUpegPF1fc+U1w
         fHr6C3vSBrDkWg702Xi4SIzNKVlTtYdqGyk23FVPOtLioOEd1cKnhHIOF9v8eQm2WaWi
         q6Tk0/Lh158M60g7ULZheL2c7oHs3Zd9owEOV/lZ0EaWBBLXrkL5T9JTkk5wPgd8Fvb4
         MH+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750846998; x=1751451798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lov9+Zjt7YEZlzXRaxLC1dZ0shHTHM8AduhB9Li5azE=;
        b=MJxIOx6BsczeFwYp08yGc+SVeX9sCsRnZQaIxGuWvl+6+6lR++939S0WY7MQ2Zkgcz
         9GBmr5Y0ObwobzILgxXWnVGJb0S/I8EbmpaS1cb7WllOf8yqkkfDV3eE/yhrncqJsOdx
         oG/yLPA1ezeK/2EHo6Er0lEa4sZ37CGHubf3Rq7wRjnFU5/o1yB60Xnk8+8pThPaUupd
         pZLtxB0HT6zo4U+VHaZ5cdjbZNYk1Wgn2yhWrMQgw6GIBqUHMB+ba1ox95h8yWP8CuQN
         LMw2Q4PtxJzFCZCZsUVaVDsEA2Ql8AeSfrQt/woCe1+oIWq39o37wEGeNtyb+KbgLm+5
         mDDw==
X-Forwarded-Encrypted: i=1; AJvYcCWMbueEvHu3OBKQrKEE5uRqGwKMgIqvrL042x7k87/VKiA6mrAojULYuwltCQw4yYqrSWXuJE7RK3t9ON4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfyFoLfJPoiRdu+e01Ruh/Sd4aVxJJqWzahkD9MjhzxKlHNt7p
	KKhm4i+4KiHmhPi5j7G3r0Gcjx7wDBFKbA3RL8shqI8/qstL2Mr1lPFZuMdWfExOdyGWCV+U4fa
	NoDkmP38cBIzg+vNDOuEb8Nxg6IDSh72X9pkL/FZ1gw==
X-Gm-Gg: ASbGncvBuQcj3OKMm5crd9xtJmUrpQ6IS/LvBClAiU0ulcCELzc3lh4+KgBAnmU/MhW
	2nUoqexJ82EAdf8d0t3XckTf9/1nytHCf1+2oVSIjWPgLhSbus7XijU8Nodt72fxsC1jpeJeFgO
	jcelVGvR1HOW2znCqmS0ShUr/5alwByI3FB1xv9XVyrLDnnRAGgqoh5dSnIUq/2j3J7Xypg6Uyl
	KYL
X-Google-Smtp-Source: AGHT+IH8cFi7RC794dO0rUm/Wn+Xr5iwFFDk6akyxaGbFcCJoypTD1oROTeezbQ4/XAXXAvVlHuTWvMZwirdDT+JzDc=
X-Received: by 2002:a17:90b:2c85:b0:30e:8c5d:8ed with SMTP id
 98e67ed59e1d1-315f2671f79mr3611427a91.19.1750846998623; Wed, 25 Jun 2025
 03:23:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624121426.466976226@linuxfoundation.org>
In-Reply-To: <20250624121426.466976226@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 25 Jun 2025 15:53:07 +0530
X-Gm-Features: Ac12FXzbsG8H9f0gjBaNzcKx6GHqgVhEAS62P31OdpnQXr-HJ4E-WlndR7XAnXE
Message-ID: <CA+G9fYuQBPF6C1oJLWrrcjvn6FNqjh0oxcJqJNxe85XtrDNSjA@mail.gmail.com>
Subject: Re: [PATCH 6.12 000/413] 6.12.35-rc2 review
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

On Tue, 24 Jun 2025 at 18:00, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.12.35 release.
> There are 413 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Thu, 26 Jun 2025 12:13:28 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-=
6.12.35-rc2.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-6.12.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Results from Linaro=E2=80=99s test farm.
No regressions on arm64, arm, x86_64, and i386.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build
* kernel: 6.12.35-rc2
* git: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-=
rc.git
* git commit: 7ea56ae300ce5b67804c356ef4c7dbac6b00241b
* git describe: v6.12.34-414-g7ea56ae300ce
* test details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.12.y/build/v6.12=
.34-414-g7ea56ae300ce

## Test Regressions (compared to v6.12.32-538-g519e0647630e)

## Metric Regressions (compared to v6.12.32-538-g519e0647630e)

## Test Fixes (compared to v6.12.32-538-g519e0647630e)

## Metric Fixes (compared to v6.12.32-538-g519e0647630e)

## Test result summary
total: 218983, pass: 198252, fail: 5262, skip: 15116, xfail: 353

## Build Summary
* arc: 5 total, 5 passed, 0 failed
* arm: 139 total, 134 passed, 2 failed, 3 skipped
* arm64: 57 total, 46 passed, 0 failed, 11 skipped
* i386: 18 total, 18 passed, 0 failed
* mips: 34 total, 33 passed, 1 failed
* parisc: 4 total, 4 passed, 0 failed
* powerpc: 40 total, 40 passed, 0 failed
* riscv: 25 total, 21 passed, 2 failed, 2 skipped
* s390: 22 total, 21 passed, 1 failed
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
* rt-tests-cyclicdeadline
* rt-tests-pi-stress
* rt-tests-pmqtest
* rt-tests-rt-migrate-test
* rt-tests-signaltest

--
Linaro LKFT
https://lkft.linaro.org
