Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A722C2054F6
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 08:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744273046; cv=none; b=KvFYav29ufJs6nlYvYOGLBBxG9sBSx/7pMy5up3Gqcto+wWPXQW4inwgGol3FwFLa0WD4TNDCzEvq9o3GKQpWUO/8aIk0gjgMAgoliEDeor1USRaNomfnz0q8HefeMOHLq3g+G5j9BfqyQxSZSdjFNE2q3szgeSocq9w2VJ+nrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744273046; c=relaxed/simple;
	bh=ZLcmmENHK9I78N/ZoLIYuu5eIALMt9hcSonTzDWpags=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bi4k9uCTfX40jz3XcEYJ7j6zuKk4xi4ZAL0QQhS129WgjJwopLcVnUZrLyDUVnwJ3nLyFlfaIP4yhu0FGVU7tor2qmv5ITUnyVOTqS70nRFM3YB+LX6OFyo3q8Ck+g/XYtSxeJCtFrXqOlf7bVF1q5Iyoee6eRKC/kZ0yiwljII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XLhY6sF3; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XLhY6sF3"
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-523f721bc63so1470763e0c.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 01:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744273042; x=1744877842; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hz2/30ujTnM2RywGQJtfm+6zAc4LPWg0AjzlYlcqIsI=;
        b=XLhY6sF3of6Mt0uOtcLbcm/oOu7ZQkYkK/ep07Mkt3cHvB88j0ekFaEHpA0xw/vfwL
         OCU1WmNlzH81NRxGKjJtaG5QisXu2GKYDFvHy8r82uiSjRuVOf6NxcFnr7aDIHRT7NWc
         q5HKUQSON7NAPWFS5o7k3Z2l1ln6Ua7rQyu+2F5VBOkkXyKTOZuZQEHhi+AfCBo0K+Tm
         MTeAG43A2QWDKQw/r2DJi/Oqh6QS+zXIf2hRFlBh9NeUr5URVUJiieBHhLTYrEOTe07K
         eVFBIb6Q3jeTE5qpRzlhr9aIJYTipIb0kZZP4E/vXtH+kTtnbDA+SJjU51ddGWVW9xpB
         6BCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744273042; x=1744877842;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hz2/30ujTnM2RywGQJtfm+6zAc4LPWg0AjzlYlcqIsI=;
        b=B448VTkcOl3BsiM65p3q4dkIpMdLmNCsFzl6l9z16jQAPwDQhyYGMni2HVelwzqeOH
         zHrQ8uK1yUffHOxts3aTFcwmwfLXJgFbRb6eTYWQY4N6fvcWHAzteRLfAMIepeOeVN0E
         y2VXQlCVbc0QzqEl3d1PfAItzSrN0ueXLhSJIrqsiz0xkxCtR2V+G47XAv/K+nsv/06D
         wRNjbv5RSM+f/SZOW1UkrnUe0qMAsSIMFeVilf4Y3ivn1wmekM4ZA7kpxpVja04vsf5m
         5Vg3oYQ47JEKYzFY/ZLDupvsViNXnD1Jp3hXfytaqpgMnEaPyALaPyu09vF3XT09z1xu
         HdrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFjZs2yZ6woac8VERM0j0bN02O+OMyL0NH2bcHMRxNKz/7xnUETYPu7/PmW1HpbIHMduEU9tbr+LDcfKE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQDb0/9jqZVhPStLsZtg2drs0DUwDwvDBBhjUAEXrjkWNSpvIp
	Y8w04NEeUl8UAY2RQoslIVrH7wD/Og+rnnA7U017z6W8v0m6c1fO0IgIekE1iAwMEEBj3HKfT5G
	KEfLEu/F5t804B3PjXUoxnn2C1pHXokYMkStpqw==
X-Gm-Gg: ASbGncuJYIW1XMlrpfpzmYKs3fFO2SKdcr+oZ3v+Bi0MWEg2m29hV69H3LM3ORnav8F
	twAOXH6SRmqe8HXUVg46yMSVnoabuSVReFzGrSklUR39CKTL7QhCG5OneHH2wqBGY1u6QvAc/lK
	lDZ782l6bv3UdKF6XfiVApE1b4LOPZq0hh4kJ11B7yVQrK1j32tJJk94E=
X-Google-Smtp-Source: AGHT+IHPpFYAe6A+1jMMPXw0/yyYAd7u/uou13jq78+PmrhjxYftImbCHegQjV348L5FGWikiPaVIFeeK7u2FWPsIDQ=
X-Received: by 2002:a05:6122:490c:b0:523:dbd5:4e7f with SMTP id
 71dfb90a1353d-527b5e9ff0cmr1050942e0c.3.1744273042466; Thu, 10 Apr 2025
 01:17:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409115832.610030955@linuxfoundation.org>
In-Reply-To: <20250409115832.610030955@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 10 Apr 2025 13:47:10 +0530
X-Gm-Features: ATxdqUG_owECl_MM0l9MR7VxhK156lg-AbsNKBugatEKoiMadE4h0QstB6tsPA8
Message-ID: <CA+G9fYsuLSobC2_MAHsr_JQtSwPEzhWJ4CjKavnBkmbn82Wo2w@mail.gmail.com>
Subject: Re: [PATCH 6.1 000/205] 6.1.134-rc2 review
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
> This is the start of the stable review cycle for the 6.1.134 release.
> There are 205 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Fri, 11 Apr 2025 11:58:02 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-=
6.1.134-rc2.gz
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
* kernel: 6.1.134-rc2
* git: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-=
rc.git
* git commit: b0bb7355f83e01b7f94937c29b088febc825ec39
* git describe: v6.1.133-206-gb0bb7355f83e
* test details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.1.y/build/v6.1.1=
33-206-gb0bb7355f83e

## Test Regressions (compared to v6.1.131-221-g819efe388d47)

## Metric Regressions (compared to v6.1.131-221-g819efe388d47)

## Test Fixes (compared to v6.1.131-221-g819efe388d47)

## Metric Fixes (compared to v6.1.131-221-g819efe388d47)

## Test result summary
total: 86727, pass: 65519, fail: 4647, skip: 16211, xfail: 350

## Build Summary
* arc: 5 total, 5 passed, 0 failed
* arm: 135 total, 133 passed, 2 failed
* arm64: 43 total, 42 passed, 1 failed
* i386: 27 total, 23 passed, 4 failed
* mips: 26 total, 25 passed, 1 failed
* parisc: 4 total, 4 passed, 0 failed
* powerpc: 32 total, 29 passed, 3 failed
* riscv: 11 total, 11 passed, 0 failed
* s390: 14 total, 12 passed, 2 failed
* sh: 10 total, 10 passed, 0 failed
* sparc: 7 total, 7 passed, 0 failed
* x86_64: 35 total, 35 passed, 0 failed

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
