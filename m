Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE7D2609D2
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 10:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747824756; cv=none; b=d2mtOjeyn9oodLG9rb5TqfC4Q6wYPwYXxU0YdH4mkgd/hkGjgRqE8JOW1fst+lJbt8rxx6jTJybdNPZJXcq+xIGbNT1kpNK69ll1IUk95s30kcxImSv8M3ffF1TX6kQ9szISWOdA9FVEfaa2ZF2Z7HIeBKU8fqHKC1maa4rTQuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747824756; c=relaxed/simple;
	bh=4BFLWPUAMSInPQdAE9fgzFRSdzO/MJE0QCcVjoTiJko=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D2w1DIX3+m40PUkSN3CbJzSQbE/mRxfUqthEopV2BMXDHIXBbptuom95ApPryevRNY08rRCFy8rlZ/0rq66DzWzWzoiHthJxq7KDY6M1hyqkVClFNiVF4WfkR5P9maubLy66ntSfFka0IdbK4S9InZFfYC2PQwnTokm6TXK/i60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Au9vurJ5; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Au9vurJ5"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5259327a93bso2134234e0c.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 03:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747824753; x=1748429553; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dZHVJ3+0s5VJ9SAEbzNjGpliuVaCZn6/g9D/MgHcJ80=;
        b=Au9vurJ5+bsLZI7KBAZ3jbQJVUwB3tFEs1zFiyFUyfWMitAFXtjU2JDZl4OgR2ogUh
         WWJyWmHfkB/dqcfrJ+fNkXOg+AZUcEzfCvv02W2NIGXHKT3RwcHbAyGJyuUzMpS5bY11
         iWEuNPOC5Rb2Dzhnv/xPraMMLeKNEln2BlHsKX80HGNSOEHcFVBHrJUiZ9q8k7Wvdnbe
         G6Mh/SIJ9PigKFajkbJhlKt9MaCtms2P43USHI9o94brNBaTxnfDKyvWk2phrP6CFJlK
         Vv+vf47AV+vL+cgbp7M9u/4gpyxkOW3qqx6GUVwUDcQCe4n46gD3zz5cxpzXTtzSQGH3
         Z/Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747824753; x=1748429553;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dZHVJ3+0s5VJ9SAEbzNjGpliuVaCZn6/g9D/MgHcJ80=;
        b=SdgcWxG+pnyfiw3ZPAlmqrUE0o1IrhyWqLnAVjw56PI6KLW5OtjwaQL3EbfPXZXs0W
         iYfyxV98xSMRbNevtzE/CosQHfUJ9C6v326B9TJ2acXYBUad9TG12unB8GdKPm3Hpmyo
         S9F+HA2/6DxWeBX6VasbrqI+vzkU3XjIIhYprau7U17A7pre8bnPEwVEmuvLdaZAQ036
         zOTUxFyepMZPqHqyUd1BoXyp+6ak6cFaU3kamANTPxlUJG28O/QE9Bt71GnWRyD6M2aO
         LQmq/ffUxVqYT8N9a59WuTNG9yKE83ZNBBCWcEeLYv6XXiWWODSsqWmg0wlA6HkNSt3A
         LVbA==
X-Forwarded-Encrypted: i=1; AJvYcCUgjSGbs3xNLgxZ6RnnkPj4GnCxlk7kIyEB5Pa19UOiKBsUfBsugChIKIe22iZC4EBRs1XgmvALFCrE+0w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNaFcfWLTR/tX/7q205LcxqpKj+N6nwKbLbzyhAMs2fQNAlE+Y
	sgGPafDP6IQ+Gc2JIRBrSsUtngB8Yp87CdJNDsVVdO0jxy91AIca5rwe/nIrS63ACFnSt6HPeI4
	dnm2Vr0+8RnYUq4+CvVa+ze4DsdLTP8f/seDHXHNJ2Q==
X-Gm-Gg: ASbGncvgqL6pb7QEk0XE5+u9eITAdNKaGHP2zGwLUsCPYYw9Gt4MY0VwhUy46ohJZjj
	r4YaBjrUjs9PrZ8uG74NJr/4G6O7ivCLfbGpA2soy+kbJd/vTz1nmRnT1oxUf9S7lmXfXOF5Yeh
	RpvWpjr3aemtwrOxRSe/5GxFzcUBg02a5sdQfJrYn3D3S7NpDtGKr273bik3jU/TCGfQ==
X-Google-Smtp-Source: AGHT+IGTpet3tvuo4dVQk5bLwsNjz4FVi9021yTbDrQQwYKO6Ii2Esq7EdmHZdrJDV4Fl+4399BvnJRaMflLdZbEFEg=
X-Received: by 2002:a05:6122:4317:b0:520:6773:e5bf with SMTP id
 71dfb90a1353d-52dba800001mr15970869e0c.1.1747824753137; Wed, 21 May 2025
 03:52:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520125803.981048184@linuxfoundation.org>
In-Reply-To: <20250520125803.981048184@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 21 May 2025 16:22:20 +0530
X-Gm-Features: AX0GCFu9JDvT9DPHZ1453In-RQsb-9FyVMa4i9tTQ2pJYOokOVyHxxYrKkbN7O8
Message-ID: <CA+G9fYvDbn66=pss5UeMtjU5rYTG27nr-s5EV3Z7U3TfxSkhWg@mail.gmail.com>
Subject: Re: [PATCH 6.6 000/117] 6.6.92-rc1 review
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

On Tue, 20 May 2025 at 19:31, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.6.92 release.
> There are 117 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Thu, 22 May 2025 12:57:37 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-=
6.6.92-rc1.gz
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
* kernel: 6.6.92-rc1
* git: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-=
rc.git
* git commit: 18952a1fc4ac790deb4faa116f18310d7010a9fb
* git describe: v6.6.91-118-g18952a1fc4ac
* test details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.6.y/build/v6.6.9=
1-118-g18952a1fc4ac

## Test Regressions (compared to v6.6.90-114-g477cfead3566)

## Metric Regressions (compared to v6.6.90-114-g477cfead3566)

## Test Fixes (compared to v6.6.90-114-g477cfead3566)

## Metric Fixes (compared to v6.6.90-114-g477cfead3566)

## Test result summary
total: 236734, pass: 211762, fail: 5845, skip: 18530, xfail: 597

## Build Summary
* arc: 5 total, 5 passed, 0 failed
* arm: 129 total, 129 passed, 0 failed
* arm64: 44 total, 44 passed, 0 failed
* i386: 23 total, 20 passed, 3 failed
* mips: 26 total, 22 passed, 4 failed
* parisc: 4 total, 4 passed, 0 failed
* powerpc: 32 total, 31 passed, 1 failed
* riscv: 20 total, 20 passed, 0 failed
* s390: 14 total, 13 passed, 1 failed
* sh: 10 total, 10 passed, 0 failed
* sparc: 7 total, 7 passed, 0 failed
* x86_64: 37 total, 33 passed, 4 failed

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
* modules
* perf
* rcutorture

--
Linaro LKFT
https://lkft.linaro.org
