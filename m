Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D09450FE
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 10:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744195999; cv=none; b=SGOOjlys8iQz+UiUuCIFqnylqYhSn3qii3Rdxg6sn63T6wpb7IcO+0v5ScfLvUKeAxWQ/ko0sGolrVsT1074mEmshXnyg/KNxQupCmNATzrsaHZfgOuDA880gaQslH38ZAx27G4VHKZLiJLEth3DTWXroeMebjApDUI+crndfKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744195999; c=relaxed/simple;
	bh=Rx3deIVSJsCpMffhYe0+mXtPcPwYju8RaKlb1UWGh0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OJRcKWBdAdc2mBxHIibLWDT3yIWJuaVdRBamZ59S0ebpG4Rgu2K+AhDdnW1lkWY6Bsjn17280z8nPR9Cx+XvbAQ4SFwjtU+Y9cxrLsCS6P0rOugN4VUJShvgUTQBXH3Zm2tF/92VLaaKXGwsXQBAK3ub0fncCPxZrwWNsrCH5X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q6UdqjmS; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q6UdqjmS"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-86f9c719d63so2781218241.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 03:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744195996; x=1744800796; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eiSuolfqjKUCKmLZlhGjwnD6UU5gFbBKHX8f8BQoFeg=;
        b=q6UdqjmS/3IGyai85xmAtycP9eoerN4F4QCV6iAUQvodGtEuLIa8vf+b2biLHLW9E2
         K8k+p6vf7rvjXnK92jXV8NP9qlfMEuleLhefKmZQJzogLM9EmLtSIQ80HnDrGljfmq6s
         lUjMHkAMLXmDQ/v4g56YCa+HNIkqcPZn/JiR3/NhYwmt/M+ntp8cPjPF7Cvv+3k2tKG4
         haMQby+H97g9qgIDS/A5WQ3+cIHPld+QamLp0Q3wAMi7MtV9XfSaNkf1Yru/B8kIfjRa
         YmX+hdS7Wr/ERH/zsBBMcAP46d6PBSICtwkVs4uMue7u9jENgCJvJR+ErHg8dhcUfARH
         HvOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744195996; x=1744800796;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eiSuolfqjKUCKmLZlhGjwnD6UU5gFbBKHX8f8BQoFeg=;
        b=H1fx1LqrtA2r6Ye79LHWXoW80/Pn6xZULDJlU1ONm1g0oXhjkR+WAo+g9g4CHn1C5e
         HHhfM6Ks/hp0Slw4XtBKzquK3fbIzgkvRt2JPsHUCk2KUCdvcqMls/HresO3OgUWp5ey
         /b7lETzDfhOewKcIhXXBZ2YhumiaEUR2P2ohnVINHmNeCqtm3rH/dpDX8KS5dCEljmuR
         DyvRzWxZQ88wNpXidFD2hBgQbFWngLeuOcBxN2snrutdgsGBLyZAiGciB9+eOltJ0JbX
         U5ilqfzsIJVtWPA+wfWOhlGKBzn9AJ2fKebrbEz3ApLRN8AcMVLP+OE6hS3mcUmkCcL/
         yKOA==
X-Forwarded-Encrypted: i=1; AJvYcCWxhTGV7jeMavuMtzIXq/0Vpt8YrB15/JyijCjiRlMiZIT3w5QTMGqO336C+fCMpR/oNiGUhKPUYYRSMHs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXlzLsGlAGUoCYJzQlBVi8k6NhI5Dtn01qbIlzUhsBze4jWO75
	iBoHABg5nAZ/dtUm7q6qMIVlrtKg+XoN6l1WzyYnIjbWX5hJFe1OeMbPUmDuNKrsoFh5XMms1fx
	p0ewfLytiiJ+VgFhok0Nq5WkJEqbu7Py2Zp4v/Q==
X-Gm-Gg: ASbGncs9GW8VwYnJXUL+/23I9P+LxEOTheYvxO0qkuNBIc4xf7K5fH1eoqReEi8hJyj
	tgcVmvv9rx6sMXhNYQFran7AzU1nx9QAR8pbmBVvejmy39nxdltO8lviiIGVmVB2+zfnZn6h6LM
	V/FCEB875kM2WyCkIh7trd60WG4EEdCgKi6WI258rIF+gP1le25htrAlM=
X-Google-Smtp-Source: AGHT+IHUUDx6l8u13RcSCGLZYeTwydGM6vMjR+/x4CWrRBmQ0Xu18i8GLar6TCKnKPo4jFCSrfqJUH+ol6sLG0X2aoY=
X-Received: by 2002:a05:6102:3310:b0:4c1:9738:820d with SMTP id
 ada2fe7eead31-4c9c4175156mr1513729137.6.1744195995808; Wed, 09 Apr 2025
 03:53:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408104826.319283234@linuxfoundation.org>
In-Reply-To: <20250408104826.319283234@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 9 Apr 2025 16:23:04 +0530
X-Gm-Features: ATxdqUEwK9jEVkiLJOSPz0AkhU_UIpO5zjMmuDtWqiV45Powfno279jQC9NPjCw
Message-ID: <CA+G9fYtQnkt4vJ_e5GkxSCn5=sgO2MK+cms4pitkmnveY9M2cg@mail.gmail.com>
Subject: Re: [PATCH 5.15 000/279] 5.15.180-rc1 review
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

On Tue, 8 Apr 2025 at 17:09, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 5.15.180 release.
> There are 279 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Thu, 10 Apr 2025 10:47:53 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-=
5.15.180-rc1.gz
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
* kernel: 5.15.180-rc1
* git: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-=
rc.git
* git commit: 0b4857306c618d2052f6455b90747ef1df364ecd
* git describe: v5.15.179-280-g0b4857306c61
* test details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-5.15.y/build/v5.15=
.179-280-g0b4857306c61

## Test Regressions (compared to v5.15.178-617-g4372970bf866)

## Metric Regressions (compared to v5.15.178-617-g4372970bf866)

## Test Fixes (compared to v5.15.178-617-g4372970bf866)

## Metric Fixes (compared to v5.15.178-617-g4372970bf866)

## Test result summary
total: 51097, pass: 36064, fail: 2716, skip: 11897, xfail: 420

## Build Summary
* arc: 5 total, 5 passed, 0 failed
* arm: 102 total, 102 passed, 0 failed
* arm64: 30 total, 30 passed, 0 failed
* i386: 22 total, 20 passed, 2 failed
* mips: 22 total, 22 passed, 0 failed
* parisc: 3 total, 3 passed, 0 failed
* powerpc: 22 total, 22 passed, 0 failed
* riscv: 8 total, 8 passed, 0 failed
* s390: 9 total, 9 passed, 0 failed
* sh: 10 total, 10 passed, 0 failed
* sparc: 6 total, 6 passed, 0 failed
* x86_64: 26 total, 26 passed, 0 failed

## Test suites summary
* boot
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
