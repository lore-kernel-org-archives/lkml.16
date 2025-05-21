Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A7921C19E
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 11:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747825316; cv=none; b=NGin+r/xSdU/DEqdIX4yMFxzhHvgV0CtYUVvKA5u8o8Vr35rsNCuJmuma55l5RnXNGo7kRz6vmiraYtfLCd2UCmZNa1mF3HJI4WM6dlBc5EXPfRT/0eWcqgWk++5OYx1dcONHgWKrZ6Jm+vi9YYmX1KXVul/byG5Mkc50LYPuDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747825316; c=relaxed/simple;
	bh=hrPT87P41+vrV3EBb2pUefmNFAnv+YMPlt7UIo0NouY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z9E8k3iYYITeMi/egfDXYiLSXWxo+9wLCL6lI4pnm9OMNMXyG7NPeZu4I/aeAtSkqkgVkQMZGFFCrnpnPweSff2AZfbJbBpDNVKekDwjaXdEtzMY7TZtNeGgwblFlGNVeRhJt3fil7g5oh3TapFrMRp3mMRBWuU8U5HrLdbiZ94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n1Y9LeyB; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n1Y9LeyB"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-742c5eb7d1cso4827179b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 04:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747825314; x=1748430114; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/l6K3jbuz4XRmGqwQxxGityewoLKvt8MNkQScorN3NQ=;
        b=n1Y9LeyB9MjaMt1V+3rHFCJnYJWSOQLBwv4cB6N+uLBR5kcrXnhV1WlRopkmouq5qh
         jX3ARAx0Rg0zq2YclNM3hpzDCzX91IY1fF5AWfhxGWnLPiTXfarVlRhQ6ikwWjOu/cYG
         +0tfZ2w7kLtyiTxhFc3wE/1rZZIdvLeJVXL1cXsXH8TEOMRn2NnkoCI5QUOQzzqGtRBh
         31kHajar72fb1UB1ADLFSltDShBRziUkcTosuFvHQDlU9100Iqxk6dcmlUrnxXzk5Oqf
         Avxtwil0yZ/guELlxLsxiJFyeMY/Zbhc97YT6bRB36hEOVZLTAZPfwNqVpq4S3WFo7+m
         DipQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747825314; x=1748430114;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/l6K3jbuz4XRmGqwQxxGityewoLKvt8MNkQScorN3NQ=;
        b=IIxJGteZ7W2Mm7UwnvLKIG+3aWGtkenYj0OVB7DFIkT6XxIH13ol33NKkXqTHqrVG4
         ba7wIzDIqQpTlEyLdEmIOsfpVSZTMzTLN1QzLHEtwDGApDkxuPA62R/CxBY5KgN8uHXH
         9+JVU6EcVFgFhoYva3x30yNIhjYnnrckUF5FfoKov/op1tVAMElx5cVCrrzv6WRn6Cdv
         VRn8hsB3WiVOS2HJMdFBNCGJL/TlVq7PxQ9mWEfn+IAjMrFb8kifcSYLLxp6ivghFg9S
         mJ1lqf5EzfUTuxgPBZVcQNPDuMAcewE/u/yBhaKRhxhQFKaLvrlbVM+frXpfGyAlRugH
         zOFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVE+Z6tYVNwM0lBHNwHTfo6ZaUB11PkdOqX/iJeRwabwqKYa/smmbS348c8C7SGuKiaSCsbdflDaaptnMw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxY7A8YzjxtrtmGoiM93ZmeHiMYlI4VudaiB7v3U3962GTB7anx
	yR7Q6BHRVA6SJgMaejd/z0OKQBc22t6dMcO/vRtrUSNcSl5+We/2LLT+QMXCFB/wcSAl2m2xyEG
	ZXdepZBcXTwf+kfkS9VJ0ybiiFjYUNjkshH6n7JhPGAO8uBKkOsI6cz8=
X-Gm-Gg: ASbGncvOSXBdVoLCchIpTPzoiJxOtw3R4bTd7Rn8jj0c3+E9eIPRGBYakCVE8HVw+7T
	whI010VE6N7bcAvSLKPEiL/LqmDdqlXQZZEMsTcLHasR5bDh7+/a3M+T58qN7fntuTfjPQDKIBa
	UnD3O09AkzGCBZi/ORVwi1UpBVJa8pk6HAgkfPlDihdAaQfukFWdQHeSENcPsxIY5BSQ==
X-Google-Smtp-Source: AGHT+IFtPnW8AoQGtwyutR1H47pYRQ/umAxXPwEtqvL0Csvl2g3kWlnp4aaxIBqaK5FczC06PPS+55VKgNqfiL+W/1E=
X-Received: by 2002:a05:6122:1ac1:b0:52a:c143:4faf with SMTP id
 71dfb90a1353d-52dba845512mr18483479e0c.5.1747825302812; Wed, 21 May 2025
 04:01:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520125800.653047540@linuxfoundation.org>
In-Reply-To: <20250520125800.653047540@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 21 May 2025 16:31:31 +0530
X-Gm-Features: AX0GCFtamnilUZjJWuCos6TbCcPgap8DnQbDAmOeiCR-1gj2mb5T7pmYkLby90Q
Message-ID: <CA+G9fYu8+PxraN6QUkQuFVHyTkfeJC_B_WZxybNP2dcaaUyRMg@mail.gmail.com>
Subject: Re: [PATCH 6.1 00/97] 6.1.140-rc1 review
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

On Tue, 20 May 2025 at 19:26, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.1.140 release.
> There are 97 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Thu, 22 May 2025 12:57:37 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-=
6.1.140-rc1.gz
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
* kernel: 6.1.140-rc1
* git: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-=
rc.git
* git commit: 1fb2f21fca7786e898e99a8b92606fa61519c261
* git describe: v6.1.139-98-g1fb2f21fca77
* test details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.1.y/build/v6.1.1=
39-98-g1fb2f21fca77

## Test Regressions (compared to v6.1.138-97-g03bf4e168bff)

## Metric Regressions (compared to v6.1.138-97-g03bf4e168bff)

## Test Fixes (compared to v6.1.138-97-g03bf4e168bff)

## Metric Fixes (compared to v6.1.138-97-g03bf4e168bff)

## Test result summary
total: 159745, pass: 140741, fail: 4152, skip: 14627, xfail: 225

## Build Summary
* arc: 5 total, 5 passed, 0 failed
* arm: 133 total, 133 passed, 0 failed
* arm64: 41 total, 41 passed, 0 failed
* i386: 21 total, 19 passed, 2 failed
* mips: 26 total, 22 passed, 4 failed
* parisc: 4 total, 4 passed, 0 failed
* powerpc: 32 total, 31 passed, 1 failed
* riscv: 11 total, 11 passed, 0 failed
* s390: 14 total, 14 passed, 0 failed
* sh: 10 total, 10 passed, 0 failed
* sparc: 7 total, 7 passed, 0 failed
* x86_64: 33 total, 31 passed, 2 failed

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
