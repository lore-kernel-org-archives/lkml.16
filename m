Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A46248F49
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 12:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747831184; cv=none; b=eDnyQWohevIH2cQklRZrNR9vXRfBq+AmmdCC1gP4hx3BiuiMZroMaax0yjjqQOZsn8tQjUJUjY97XzR2DEGM4vLQVpElMJsPoXk1xwL4aO+HtScvA7gGf/bGEU0mhJXXR21XOFLRqIX1FLlF3EwczrtyFz9AH5ViKGViECnZbVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747831184; c=relaxed/simple;
	bh=Ol3SYDgilOShW+o1WFJFj1f/kRmxH278HUmeGyLC5/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IUmi/ELRGa8w8fh8nPPv7cyr8j1YImq87fcgc8r+y5YuM5Oi9o1PXtZjgAAaswmg+CrfdS3QVcOFqJyuQL2xjvnmEVbrb2XpycOLuYi7fMp06ejpg4Se7UAIw0pfMP5i4w+/ZcLmEa4+DsKg+Dz9JglG/fol/K/1J6nuxBL3MVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rF2tkgVu; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rF2tkgVu"
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4e14dd8abdaso1763098137.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 05:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747831180; x=1748435980; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oKupp8/Fu+Q/fXSbeFEKEO8KyFhdMTZOQBPN0yqnh3Y=;
        b=rF2tkgVuNlIGuPbc10/0hEZqnKW4titCvFI6AbVnRVo0N9UypDAkK4/velMZ//mW1L
         P8WV5RDPUMM2vK+mwq1HnIMCA652uMWPkoz5uE+OXKTVTepI60TzXJe8rcbJZF/IF6D+
         8Hmy4kk8IB0FGhuh/selvU6m73tjlTLUZ57jL1ul0Absx7aUpUl0Hn2+nxeF4dX++AvN
         mjfloecx8P6cn9706sVE5BjDsdM7uLZVcNBtXzRVBV5CRpi++uXZx9Cg46HxhSSVnQCG
         lJ0A1ix6o0le7u2khXMxJNCVwavT1I2fOFGIMAnr+XqO+2iL1GypFpO8CeRdfayf9JI2
         kMOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747831180; x=1748435980;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oKupp8/Fu+Q/fXSbeFEKEO8KyFhdMTZOQBPN0yqnh3Y=;
        b=KSfNUScWVxPGCo6MZIHrJReeJQrrXLJlMct3LA4V5CkQ11yK1W1Q77nea/T/yDIS+4
         Gz2jW4jhJOcCmgJA55OXEzn2kMP+rpJvAJjhJx4EgAj/hzKokAPuNlJidnm+gMt53kAF
         tG3okKXF5xjgEUgtXWq4njUt9MKIWLhyhLXPUdEK6rF9kxNupeNFu3SnuB0VKCHID9GW
         BJhUF/ZS2ihvMgbnboO/jwPz1ZxmJ/e4z4n/sapbMOCkz1gtEaRL7TJR40xCBr4h9cun
         GbIFTuUcafMgmC9NNdbr6Z3MiYnjg2KiUiv0lKqpBTuH7vfBOg4BF0pstlS/YaJHfurS
         QmhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsFyTH4Sve6OZO8PFyKrcetz1sXUdzqpnyRSOZ7ubtTUSyZJUjrRjSMystMEt2YMRy6mBQ7ucEIXszUc0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrpkMOqTWTM8F3Y/farNO156g9P9aPhu6onJOPUSTx04gL18f0
	M7pm9PRrBeIGPQ6M4SjexG2hVf2LJ4MWwpPQx6IiSadBhb7XeqhFNiKHHmQATXQ69hIMidPhehu
	bt+QtNPHQ/ZBrrTUyRFQw4XS7Hj46JjEXgRD5jAL1IA==
X-Gm-Gg: ASbGncseQq46Lc2sDq/j4iIl9UTaL07kz2SZgPWC57slavaGoigAG+Su8L/hgrX2gfe
	+Pq0duIfMYW8DzROIsxUZHqN1e1Nab4HczFk1JRKzRrxjfeEdfMcvHpN7gkjopZB8iVSispK2bA
	0HBKYSFb4aIEEcGrOjT10zc6MpSN7OdHa91bZ8y3tVmTDV61cS2gkLxaxZI80Ic2FDDA==
X-Google-Smtp-Source: AGHT+IG+EBWrQ9MFOPu2a53gcTca8fxH4g1iNDKit/DXzpT0QHLt9dTkLmNlN0hCtGWDXBUx7uKx49arXcF4HdQ2RIE=
X-Received: by 2002:a05:6102:1593:b0:4c4:fdb9:2ea with SMTP id
 ada2fe7eead31-4e049d5c1ecmr20292772137.7.1747831180485; Wed, 21 May 2025
 05:39:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520125753.836407405@linuxfoundation.org>
In-Reply-To: <20250520125753.836407405@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 21 May 2025 18:09:29 +0530
X-Gm-Features: AX0GCFu6fLUPi2-ImLv8oVSMddRz_eslZAtfN0laHVarrqF2gfvQcjhr5N7sgAI
Message-ID: <CA+G9fYtpC-uB9wCf=ZYRDF-YrP5WGMU1Y-4TcR+PKjNa97o5Ug@mail.gmail.com>
Subject: Re: [PATCH 5.15 00/59] 5.15.184-rc1 review
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

On Tue, 20 May 2025 at 19:23, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 5.15.184 release.
> There are 59 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Thu, 22 May 2025 12:57:37 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-=
5.15.184-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-5.15.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Results from Linaro=E2=80=99s test farm.
No regressions on arm64, arm, x86_64, and i386.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build
* kernel: 5.15.184-rc1
* git: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-=
rc.git
* git commit: ba6ee53cdfadb92bab1c005dfb67a4397a8a7219
* git describe: v5.15.183-60-gba6ee53cdfad
* test details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-5.15.y/build/v5.15=
.183-60-gba6ee53cdfad

## Test Regressions (compared to v5.15.182-55-g5aa355897d1b)

## Metric Regressions (compared to v5.15.182-55-g5aa355897d1b)

## Test Fixes (compared to v5.15.182-55-g5aa355897d1b)

## Metric Fixes (compared to v5.15.182-55-g5aa355897d1b)

## Test result summary
total: 60301, pass: 46648, fail: 2204, skip: 11039, xfail: 410

## Build Summary
* arc: 5 total, 5 passed, 0 failed
* arm: 101 total, 101 passed, 0 failed
* arm64: 28 total, 28 passed, 0 failed
* i386: 18 total, 18 passed, 0 failed
* mips: 22 total, 22 passed, 0 failed
* parisc: 3 total, 3 passed, 0 failed
* powerpc: 22 total, 22 passed, 0 failed
* riscv: 8 total, 8 passed, 0 failed
* s390: 9 total, 9 passed, 0 failed
* sh: 10 total, 10 passed, 0 failed
* sparc: 6 total, 6 passed, 0 failed
* x86_64: 24 total, 24 passed, 0 failed

## Test suites summary
* boot
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
* kselftest-livepatch
* kselftest-membarrier
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
