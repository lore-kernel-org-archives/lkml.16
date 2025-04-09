Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B885C15382E
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 11:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744196417; cv=none; b=gw9OPKcg7Q3SucgMzDdlF11kn0bihmXKlBAJ5Q/0hb3jaqa+qXXg1WeeI6Bmwg4AYCDBgMaYWB259qsik5Mqv/hOgQrOceL+/faZQYBGAMPrFGApaF3KVHw8d5FlLa7hRPwUNSCZgTkufJfpHCdp/eKYyd/bGhJUbtutuqiQDcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744196417; c=relaxed/simple;
	bh=09N9lr2hL1uBA0J9A1onZI1++O5r/bZidfTgoStsh3U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u3Z3DX+/RMURJMEdAZ4a1IvzjAjsZseHf5RdIYUwmBBZb6fGODCmzYEJlDFJwg5rk2PgSgIj7A1cDjgp7XiG7M85OJzgFHx6kw3erFOM2aGWfPSMRcH7jpSUq1FAC6LQT9UfQf0TeG+Nbysk8IY20r81NUe9kCdlHuXc6TtZyWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SPmnHTW3; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SPmnHTW3"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-873a2ba6f7cso1840592241.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 04:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744196414; x=1744801214; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/r+UtYo/qU1HvE/h/9g29MK3UmN/8EOwDnMaNEnDOrU=;
        b=SPmnHTW3mK3eY8av1Y6NOTjiHbY/tmw/3FA+ZWxkDUR9c4TBc3S+AvqezCGZQ/WIKb
         +jtci9KM3JhwelDIQwX3Bty0qy6zt3UwyMfedFsO0Z0njxRmFuJO/0G3K/uUyuS7lg//
         7eB5WkanG/wCzYU6SCAlDnJQaiHt/koJEy5p0zVMkEAShn5N71oNmximyHNTXeDSJGwr
         +m28x1IWaNqs8pIcn+Nd84JIpfYj8nyzn8pe2NARB8Qr2KkzVDZ36jNKRscPq6ucVXn5
         fBl9vRGF+F6zN+Rb3DnwaFg4eER7r5mwQZKZ8QUTxr70Qqrg53e1XHmTbiBeeEYsUrKt
         ORrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744196414; x=1744801214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/r+UtYo/qU1HvE/h/9g29MK3UmN/8EOwDnMaNEnDOrU=;
        b=C16V87yx4i/clFaklcyM5qIuoMeXOkiPOl8Hu2P6RIVA1eQE+ssUpasCUQzmKyul7Y
         VJDCtPgDhfGT0/Zasz0qBKnUv6y4VONjAID86y6kLzRGA29a1FgOdtNgaZwbXOzhphrq
         AdG7QRv7jzfTxjcytYOQubrFxSL9F59J8cloONoxJaL2XCgaHneYChUweQzXPIdWdCQ0
         f5ek6TUzkdOpdFhm0qWEFDH39T7jRj9PtFecxWBanwxMCKGw9g7zpX01PryB4TsokSw8
         D3OugfJclXvdf8lNctb6rR3CquSKqf0Ue5Dfn/U69UKGCG79fufa6nRgW35nUWvv8yUc
         9Q4g==
X-Forwarded-Encrypted: i=1; AJvYcCUnkMGdx1eGQNqg3rvEs//Ftu87+t8Q4+mlbYW6+QJYONXUpPPk1OMga56Or/HoovaNm/vUCuJrFSgEjE8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy65bUMztH0sK68O4y/oQTRxy1pVCUSYGgt1U/hPgGjUYo/neEM
	wvqjh9jz98CjCRfBxK8RC4ycIoat7AJhqTcMsIxCEYDYHdIrFa640L6vdIruicRU96b/ZCGOlkM
	BTVVWkTAxzhpYdoDV2qgDBVxJIRKDH7erCuYvHQ==
X-Gm-Gg: ASbGncuIdjrNw87fE/mLP23DELUUiMJJiR2mXqxRQRYHfnnPebrhBIcB1TbcsIwgBhx
	6Wa5M0jVmZW2ZNMWmn58ONs+7EqK01MppkapK+Y7k0lpcOmGmQZgs5nwThR9loQz7xDzHxROqVo
	0x6kMAODjg0E5bxur+hD2rxdSXrjf4lj6poFai7MLecpuX33ASfDQda00v5GtdxKkr6g==
X-Google-Smtp-Source: AGHT+IGo9sv2kAp6E1TzReXRQThxB1ji5GcAkSOodvJZOJWIQxm7smQrGCs22c3dVXAkmC4M67oP2TT6jxzy9gzqXgU=
X-Received: by 2002:a05:6102:801b:b0:4c3:858:f07c with SMTP id
 ada2fe7eead31-4c9c41bac11mr1541584137.14.1744196414562; Wed, 09 Apr 2025
 04:00:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408104815.295196624@linuxfoundation.org>
In-Reply-To: <20250408104815.295196624@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 9 Apr 2025 16:30:02 +0530
X-Gm-Features: ATxdqUEbbqVQnyWqpGGFNxrrvwRlgHPDQwMWHgCjswzOhAlFJNCxt03hbe9eXSc
Message-ID: <CA+G9fYstSS6rg2GZPROMq9QRGcN21v-Lv4ED06+WsvSOXqf=Eg@mail.gmail.com>
Subject: Re: [PATCH 5.4 000/154] 5.4.292-rc1 review
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

On Tue, 8 Apr 2025 at 17:33, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 5.4.292 release.
> There are 154 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Thu, 10 Apr 2025 10:47:53 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-=
5.4.292-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-5.4.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Results from Linaro=E2=80=99s test farm.
No regressions on arm64, arm, x86_64, and i386.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build
* kernel: 5.4.292-rc1
* git: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-=
rc.git
* git commit: 7a5af469195f5d6a1ee88a8cbe2529477317d901
* git describe: v5.4.291-155-g7a5af469195f
* test details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-5.4.y/build/v5.4.2=
91-155-g7a5af469195f

## Test Regressions (compared to v5.4.290-329-gfb482243c16e)

## Metric Regressions (compared to v5.4.290-329-gfb482243c16e)

## Test Fixes (compared to v5.4.290-329-gfb482243c16e)

## Metric Fixes (compared to v5.4.290-329-gfb482243c16e)

## Test result summary
total: 38270, pass: 24396, fail: 3248, skip: 10469, xfail: 157

## Build Summary
* arc: 5 total, 5 passed, 0 failed
* arm: 133 total, 131 passed, 2 failed
* arm64: 33 total, 31 passed, 2 failed
* i386: 20 total, 14 passed, 6 failed
* mips: 25 total, 25 passed, 0 failed
* parisc: 3 total, 0 passed, 3 failed
* powerpc: 26 total, 24 passed, 2 failed
* riscv: 9 total, 3 passed, 6 failed
* s390: 6 total, 6 passed, 0 failed
* sh: 10 total, 10 passed, 0 failed
* sparc: 6 total, 6 passed, 0 failed
* x86_64: 29 total, 29 passed, 0 failed

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
