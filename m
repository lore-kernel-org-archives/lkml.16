Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3B81E570A
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 15:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738338599; cv=none; b=jxOGaUQKd7ECC3abhy7pYhle8LUtzpzc2/X/jU1i/lfhKrX/rSuXMW0lhckNzcD30sQgjCb2lPv4kKe1PaViBmt+LWrtsBMOh62C3VD++Yo20jR41ZAPnD/wOvz8A0kj6BvnudLaBHlFgWt4uAL4P6Fo6RLTz0gnzqS89XlIssw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738338599; c=relaxed/simple;
	bh=o2eVme6LWBzp3TARLj8ZVEg5e8/pMmtAadvIJSWcjeo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JTueb7bx60ZEyBI0azxoz4bNO9DHdkEHS2Br9dC8gYEw+PLi8XXnhZqAdSIDCDKLyxdV8vL0w5KZ86mlbf1VvW+ud3v6VThG5gran1Ju9FjZHmybEUi6DYyvW38FJP5+4kih7/L4/BJOIrtyieA31Qp39Trn0o7VJhKE6IZhNeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n+WGp4Qc; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n+WGp4Qc"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4b2c0a7ef74so1241106137.2
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 07:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738338597; x=1738943397; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VWixQrVCIAlgNIcS80jNJtJK73gPxHWL9wIx8DKe7MA=;
        b=n+WGp4QchKTP6avem8Qd1pgafJsWegPVFcBJp97TvIIga/3QzY/JYL4FWzShjUh2M+
         zkbKYL92zNVV5TGJKZuOF/OM3VZBDxgNLProTkOaUCn7Wit+ApeOO1hxlLZv7LXTEiu+
         CDIbvfh2oWtiYzHm4mF88tLhI1YbAjbi8pjOXO1opPDWHCD/zj0yyidsJQzCEh5LCVfg
         ySGusWIYsRYBe8jzfl9zPMFiv4hhiYgvLzQuDHoK1e+jkpiMi8YjUaIyau+gFSUGuEEN
         LQ8QyPYxjWLPXLcoA2oZRoqGvn9v2VH5vfhMWXMqYxZ7k9haYD3pNcFDx/oyx+ihhhku
         GQRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738338597; x=1738943397;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VWixQrVCIAlgNIcS80jNJtJK73gPxHWL9wIx8DKe7MA=;
        b=EZ4u6naYUG76ctkc8QVrjcaU87NVKc6NBLkXL9WE0TQhDeOttjTNTztx9reXV//CHM
         /twJizydXEGtKUeojATXNAsNKiKEjtnkuvI6a/Xau20nxhXvXwKx3sW+p6fH6KbZfiD3
         Mm00uMwigFM06ZnKXzcA+siLHorhEXF1u9P5bjTTStbDKzcnKgX3ZjW1tOrhSpOjW0eo
         RLCUflpyw8+05rimEFLq1ROoZktR1EeyLwCfe+vHaPOi4Uba3cj1hxDjq/Pa2AP3JpzM
         sCDI7Otk89BFjbfXQMk2Xxjxjjsuxypn8rb7w/bPZ3wtEzgLZdNgzhauHj76+G1x/x3G
         BhxA==
X-Forwarded-Encrypted: i=1; AJvYcCUOFOHsITiImjXhWdrabRyqWY/6ImOCAj1yFtHsUdOiefb5Xrf6omLP5Lx+VPuaLusveFnynyHnphyJxd0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOcdWU6rtKnU+zKGZWqAuC4u0bIMDNmQxUwmTT6hUV6lsRSv9s
	bhud2Q3FZtGx3mJOOPO5yWhp2fEYSvph4h6wIbLAmUk74iDYB4mYz7y+U2DuxIY42mfoGjRlmTS
	QhLBYb77u47N/PNyW8XYFQng+D/omgwmf8ujTqQ==
X-Gm-Gg: ASbGncs4/epVUIpw7mDnKgAXG+coB4yT0w9S0SHKVgApx3WUb+mfAEOunp3BZqyVSpP
	JbkYDRslvmaDivkyX01eOvITUYZzWTCJ7fV61OxjG4OutIShCGzW5GcGUI+4weqsYTtHjfCnJg5
	NKGThj9TRm46wNlEQckUf49cGWWBL+MA==
X-Google-Smtp-Source: AGHT+IEmU+ide+wPljEknjlPcnDS70VvV4gNHBQPkhRPBxsv4r+mkc3GijgB/cew2sz29EmYjuvDKwtPUTAI7Moscco=
X-Received: by 2002:a05:6102:510d:b0:4b9:bc4a:bf48 with SMTP id
 ada2fe7eead31-4b9bc4ac3b0mr5004678137.21.1738338595383; Fri, 31 Jan 2025
 07:49:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250130133456.914329400@linuxfoundation.org>
In-Reply-To: <20250130133456.914329400@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 31 Jan 2025 21:19:43 +0530
X-Gm-Features: AWEUYZmgHq21FJCqLUpH2YZWV0iYRhsBr_y3qwk_JndElOm_h0vSyasAEF7Z5l4
Message-ID: <CA+G9fYtJjEoVvJtg=DMXZGOaAXhiwYzGRu0JFkWpDpBSZhDmjA@mail.gmail.com>
Subject: Re: [PATCH 6.13 00/25] 6.13.1-rc1 review
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

On Thu, 30 Jan 2025 at 19:29, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.13.1 release.
> There are 25 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Sat, 01 Feb 2025 13:34:42 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-=
6.13.1-rc1.gz
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
* kernel: 6.13.1-rc1
* git: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-=
rc.git
* git commit: 65a3016a79e2da6e613c74c51e580ff1b3ad1225
* git describe: v6.13-26-g65a3016a79e2
* test details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.13.y/build/v6.13=
-26-g65a3016a79e2

## Test Regressions (compared to v6.13)

## Metric Regressions (compared to v6.13)

## Test Fixes (compared to v6.13)

## Metric Fixes (compared to v6.13)

## Test result summary
total: 142397, pass: 92519, fail: 31182, skip: 18696, xfail: 0

## Build Summary
* arc: 6 total, 5 passed, 1 failed
* arm: 143 total, 132 passed, 11 failed
* arm64: 58 total, 56 passed, 2 failed
* i386: 22 total, 19 passed, 3 failed
* mips: 38 total, 33 passed, 5 failed
* parisc: 5 total, 3 passed, 2 failed
* powerpc: 44 total, 41 passed, 3 failed
* riscv: 27 total, 24 passed, 3 failed
* s390: 26 total, 23 passed, 3 failed
* sh: 6 total, 5 passed, 1 failed
* sparc: 5 total, 3 passed, 2 failed
* x86_64: 50 total, 49 passed, 1 failed

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
* ltp-filecaps
* ltp-fs
* ltp-fs_bind
* ltp-fs_perms_simple
* ltp-hugetlb
* ltp-ipc
* ltp-math
* ltp-mm
* ltp-np[
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
