Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799A984A35
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 06:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749365103; cv=none; b=as3UnGc/pKKwLFNCcXyBTfm0XRXVqwno86ftJfP1BcXhLE7V3iiDDwA/AWaJu74J60xhUd/IW1qBoyU0Nopfqd0rjB0ay76t0enyuJFGlXTWrLJgqhIAPZSnzqd/qJmad61jkhVrjsVQBL7RuayILTu+i4oXk5oJwp1SCJh7H/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749365103; c=relaxed/simple;
	bh=C+RNxggqN2QjbPJ9FTlgd8P1BsnmUQvdpu2uGyhkwQA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M4oFkdnp3Ve/yfTmbL+SEnY1VPFumx+DRyUz68l1WM+u6Qn/EsEbSMNsAI0FjdwFicgcbc7SbqItJXBAd5RSzMAQ+LPae34Ub/znuJfTOZ0fAZtR2JqceOFItWIYOJi87O5wO4kw5/1ikw3zZjaRNcgm5QuLzC8SEE2EcfYT4AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w/sj0v4r; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w/sj0v4r"
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-4e592443229so1106243137.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 23:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749365099; x=1749969899; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5+TMvdbUNerpyH8sJEZRNYZgyFmQavgKhbR7MC4e4Bc=;
        b=w/sj0v4rKIPz+ESLggj7WzChIe36ikRWdVDyogw/EdxasT/Xl6+p152dHUkef7BtWM
         2b1kAcosBCd+yq12YsQJ+1Up/VlApqYBWYoqcVl6MJ3safPq564X7lRwIxgaCX3WBZSv
         qro6aFv/zHrC9eVfgr1OE4r+sCPQ7ynTSk5YxhveUYJcBc+Xe0vZth6W2GBcaXXWxuL+
         0OZqg/sopLMiHc2coBeRkhxlAfBJj/5yDDucWBPm8fzgII4YN3Idppckjn7yFf3TkWXP
         eK/wi+DCQWRDHFHg8cSUIMcRSKL8jcrL9LKFdZBEu9zgRoZq21V+RmDCdbaF51/puArs
         EzKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749365099; x=1749969899;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5+TMvdbUNerpyH8sJEZRNYZgyFmQavgKhbR7MC4e4Bc=;
        b=m3jWUeSjR6JburkpP9ChARllZ58q5qAgjDY2ykejQkAqOZ4Gm6XmtVPx3+TRQQN92h
         rKxEBOqK85+AQg4OarcCcg3PBNwPM0AHOqIuasU72CO34KX2Ww6qWdJC0cDRiu9xPg94
         QxBAlxvyU5n5kxK+PKKJrc1zvgbMJLx5Rqf1PU1j5EZfbfHArRuixc8wCR8ozUfDciK1
         fyvRs54gmsGetv9pWNYSDbgSmbvZC9I63SL5uW1ckgjNbciU8gsrlK1UjrX4Ie7I1Ze3
         kkMkBfawxcKYJ/EzV4zB2KtH90XXfwH2u1RgAd+sEg+RBOTehojAjrRV/l5AE8gYG3x3
         f/lA==
X-Forwarded-Encrypted: i=1; AJvYcCUuOudnA1mawn4V69ZRDZRNPvaJs3Htuj4zByMpQQ4l39C7b9tAeRhsogVEuAy2upLPF1++dI1sKl3f+DU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq0Mjr+kKrdLOTAT7Us2/VxwQJkLHqzzbDhK9+XJ357VYF1fu3
	Hai9+d/FgZc2f+Ip7nQzeaMGA895+OTx2aLXjWHrCIB8Yt1ZwjlLs5kngP0GYjC5kF7FuW4IRxz
	u2Svgt6fWPsksppm8QvUuYopvdUlRiVDlyogsEpdcqw==
X-Gm-Gg: ASbGncthIcCtc0/mQ9AcFjj3e5bAOj6DcyOzbxgMJQiB8DEjHpzdQQsh1UU7NagmHA+
	MkMU89uSMdQNdar5cetDSlNKsDcTVQ0+POZDYkpJKDKzuFcynXCmRtp9XIcwvf9gXvClymwv/8G
	y9Sdwq4U7r9lUfMINy+cD2phM5fdYi/O8RuPb9JBZ/I4rZdw6WOyNeUPodHo0aceWvqZ/6riqO7
	W3T
X-Google-Smtp-Source: AGHT+IHLa/yHhkPSfcyx1hKMa6syQe3C0UX3pgVWBFkb1l/f8WChidJTzsKbqoK0sorDh7BtZ1JkYL+c0MZNTNe9gP0=
X-Received: by 2002:a05:6102:a4d:b0:4e6:f86b:a715 with SMTP id
 ada2fe7eead31-4e7729dc77emr7919545137.13.1749365099319; Sat, 07 Jun 2025
 23:44:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250607100717.706871523@linuxfoundation.org>
In-Reply-To: <20250607100717.706871523@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Sun, 8 Jun 2025 12:14:48 +0530
X-Gm-Features: AX0GCFs4rHgJPJiFvVM86gqPeYrxTo-ECIBTxC4hkOtMqhkYsoHvI40OXDuMNTk
Message-ID: <CA+G9fYsY7DFXk6=L93QasmVR_3-FsyPMWjv-hMbW3HcnZEHifw@mail.gmail.com>
Subject: Re: [PATCH 6.14 00/24] 6.14.11-rc1 review
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

On Sat, 7 Jun 2025 at 15:39, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.14.11 release.
> There are 24 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Mon, 09 Jun 2025 10:07:05 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-=
6.14.11-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-6.14.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Results from Linaro=E2=80=99s test farm.
No regressions on arm64, arm, x86_64, and i386.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build
* kernel: 6.14.11-rc1
* git: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-=
rc.git
* git commit: 1927b72132dad3de52539a325870bb7257258f73
* git describe: v6.14.10-25-g1927b72132da
* test details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.14.y/build/v6.14=
.10-25-g1927b72132da

## Test Regressions (compared to v6.14.9-74-gd9764ae24926)

## Metric Regressions (compared to v6.14.9-74-gd9764ae24926)

## Test Fixes (compared to v6.14.9-74-gd9764ae24926)

## Metric Fixes (compared to v6.14.9-74-gd9764ae24926)

## Test result summary
total: 256049, pass: 234537, fail: 3929, skip: 17018, xfail: 565

## Build Summary
* arc: 5 total, 5 passed, 0 failed
* arm: 139 total, 137 passed, 2 failed
* arm64: 57 total, 56 passed, 1 failed
* i386: 18 total, 18 passed, 0 failed
* mips: 34 total, 33 passed, 1 failed
* parisc: 4 total, 4 passed, 0 failed
* powerpc: 40 total, 40 passed, 0 failed
* riscv: 25 total, 22 passed, 3 failed
* s390: 22 total, 22 passed, 0 failed
* sh: 5 total, 5 passed, 0 failed
* sparc: 4 total, 3 passed, 1 failed
* x86_64: 49 total, 48 passed, 1 failed

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
