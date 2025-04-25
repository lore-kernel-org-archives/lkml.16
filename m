Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9766F21348
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 04:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745554753; cv=none; b=UTA+NwJ7dhPbgRs4VVV8XA4S2SRHr79n6nuuFNj8OhyHnhe6ifOIa5rEegiECXFriIfVE7pmeNNxrpj26hDo/vW6HDzwC2NPI81HhOy/fdzSN9qCMyI+XJ7qZecAiWPjm8MlCM+cyrGM48+Tnnvw4jMXoxX3YJ8YCRY9t6C8b7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745554753; c=relaxed/simple;
	bh=MkDiSjZZ/0iAAfFOyK6j0IGGc6Y3lJb9LactDURdW4g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EgcWo4m9liHTN2yWJZYgUTbIg/6/4bjzofMjn0iZyDHvUD6ddx81mzq7zpXsCqiCYXhgoVnscgpNFbUYt2tbxx1weZy+2VBKUqwvEbX/yt6JxgAzH1EqvJaDAAVhM83YlJoGDJbQ69yFwtnVB4pQaSnW+D7MAHVXTbCl9cTc8sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MxnPg5ko; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MxnPg5ko"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-524125f6cadso1622648e0c.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 21:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745554750; x=1746159550; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t3kk9yJMheVJ5fcTPuvXjKALo6qxlbGvpYZFmOVqtbw=;
        b=MxnPg5koBIT36OifPcjthU/antwTzkKa1J6Ct9xgmpuj7s/6RTxOvuynH4CkdBPBwK
         xaXrjFbH8ubEWxgZZpuFg6GfmTRLZGuTdjoHibe28gmlDpthHiNEGHfViZzvYShCMiKK
         nog27xnb0pZ1S//dzfxKg+cEP2wmsTsbeoEYwl4f4H507UBgg20mxp4uvZtId16kotxR
         WtlDLJ5/jtojnM78ew/gylbklca1/engGOAefA0nfBh7jMszMorevbGwdG0s/p1GdwsJ
         G9NYlIFfxMcWuKlx6Y5bJ8A4j/EeuumyifKlRAQuY5AJQZTsiz6Rwu0dVYJ662axFjPP
         lgRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745554750; x=1746159550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t3kk9yJMheVJ5fcTPuvXjKALo6qxlbGvpYZFmOVqtbw=;
        b=gp0XJSNVoXIC8CtKGuNGfJk2lttg8VlO5Vkm7PVLIDsHSRKSXoXVqLcPGXCVSR8zx9
         +Tv5XAmaJA8VkGQKWmjH/dCKlAZPIvdhcY3Au6dVaQnPJchIgHBhI9d36XbBuxVSRSKY
         7Ww+/u2edo6e+DDZu+hc+nEdkY4Ic7CgxhNjhqAj2+u1buoCEoGblg/08PLxVAvODLN1
         9QEMzQoM52NcQH5dnMbN0acytOKEtPGLgF6cuMQ13tfbA8Pj2VjwxEtB6ng6Ng9h/zkF
         P5/IiQxUgv9zKoMd22+iiBDKVLj9rKGeeKG6jjDfwfez34ptYK5OSO0gGnHv1+uHr55E
         Cm8A==
X-Forwarded-Encrypted: i=1; AJvYcCUVbj8pZ56pcXBxe1mHsl19ff2rHT1NzcN26XFp3YIEdsyxkTViE001mrvdscA4nyFAzkSq0D62vqKGkYI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9UScUjVTmhnclte/tFA8/WVhQnzwRUnF/ei3xOUVpvxg7F51B
	owEa+t2irQE/evZ2Ow2QSYKExw2NtfQvxk8+5fSwpHXUynDJAhzdjooREi/mcc0xoUePCMzR3wk
	McukFqb2MYzuHlWBCogbyMBA/XcQultj8EHu5gw==
X-Gm-Gg: ASbGnctFu2v+09Kl1hlA9xM4rVjT7/qKUTHjo0zOLA1RGSejKLWYrf587/ix8pIpErG
	evbqK+CxpevNxS8evxjZF/gjjbDHjb/OnMCoGyw0wgUjdqBl3KhwbI0W2rz1nMJXr1SOWXtnQvx
	PrUkJZJDKJZdwX6drhQ8TG2Vx7ugCY8WmUilklYB2fsT1FrFwIiBkbRlkNvO1OMJhcO2I=
X-Google-Smtp-Source: AGHT+IFIYRceIoCnN621cqMGlWwEG92deWxJ9yoaz0m5Oi2fzhMnTvsvMOdi2oQRc8SZ+44d4Y/vnujmBeCgUrJlFFo=
X-Received: by 2002:a05:6102:3ca8:b0:4c1:71b6:6c with SMTP id
 ada2fe7eead31-4d543ac5dd6mr275821137.7.1745554750320; Thu, 24 Apr 2025
 21:19:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423142643.246005366@linuxfoundation.org>
In-Reply-To: <20250423142643.246005366@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 25 Apr 2025 09:48:58 +0530
X-Gm-Features: ATxdqUG5VErkrlfJIDEFZLkqsJY9LmUOuwtsoWkPAPv80HHqYIoYzj0mTCfuYsM
Message-ID: <CA+G9fYtRbNtqBB5d6w=exBkWa+KgYqB0qA-2qXd_LhHsx-G_5A@mail.gmail.com>
Subject: Re: [PATCH 6.6 000/393] 6.6.88-rc1 review
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

On Wed, 23 Apr 2025 at 20:15, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.6.88 release.
> There are 393 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Fri, 25 Apr 2025 14:25:27 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-=
6.6.88-rc1.gz
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
* kernel: 6.6.88-rc1
* git: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-=
rc.git
* git commit: 2b9f423a149b8cc7f21741efb02e56cac442bb92
* git describe: v6.6.87-394-g2b9f423a149b
* test details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.6.y/build/v6.6.8=
7-394-g2b9f423a149b

## Test Regressions (compared to v6.6.87-1-g268d2a7e4698)

## Metric Regressions (compared to v6.6.87-1-g268d2a7e4698)

## Test Fixes (compared to v6.6.87-1-g268d2a7e4698)

## Metric Fixes (compared to v6.6.87-1-g268d2a7e4698)

## Test result summary
total: 123381, pass: 103202, fail: 3126, skip: 16595, xfail: 458

## Build Summary
* arc: 5 total, 5 passed, 0 failed
* arm: 129 total, 129 passed, 0 failed
* arm64: 44 total, 44 passed, 0 failed
* i386: 27 total, 23 passed, 4 failed
* mips: 26 total, 25 passed, 1 failed
* parisc: 4 total, 4 passed, 0 failed
* powerpc: 32 total, 31 passed, 1 failed
* riscv: 20 total, 20 passed, 0 failed
* s390: 14 total, 13 passed, 1 failed
* sh: 10 total, 10 passed, 0 failed
* sparc: 7 total, 7 passed, 0 failed
* x86_64: 37 total, 36 passed, 0 failed, 1 skipped

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
