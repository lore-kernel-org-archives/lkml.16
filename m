Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D53D21CFFF
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 07:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745480074; cv=none; b=bFqqqR1W/1a+pqHnaba4Grb/wNXKQtcakCOzABGwvCUTSvoQbF0jhArI42Z5G5pcADpVm+cTBAX6zR8J58dk63xznHxb4tE5vNfm3wIaMe7m2emUBxnHc5pSAgISyr4gNJIHRHLH2GqBRgFI6YisZ3GE7jeuKbmBQX2wwMlJF5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745480074; c=relaxed/simple;
	bh=Dj1Lv1vYfLYfue1RADdfX9+Lvh8P7qLve8owX8a0Zq4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=srhANDRVAh0rDdMlXikQt0EG2bulKV2ObBEYi4tWbDK4igizJj1NB9kaZiAbMeyj98++r6K/l3CPLk7SyXk1bp8cZArvwrhh/J/lJCVVQMKAWAYM7Y5/PThW5XMvC5WYQDie80CAT++xZFtg7wFG/RbtVSZ+otQGCQ7J0Tlgq7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GKGa1ROO; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GKGa1ROO"
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5240764f7c1so294104e0c.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 00:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745480070; x=1746084870; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hg1fJUqFPUmaQAIOsB514eMr/+6dxVQ5q9mfZaUqhwI=;
        b=GKGa1ROODnysSVQ4zmsUObNjIU8w1tiKFlKx4ole+tgDlSUFroaNivVQrAzl+6d6zY
         racDe/XhMUQnUH1CiW0nEw8WFYwUwhej+fEZIp43mY/jfzVjrmnA9SgbJJ5qMUxNrH+e
         iBQPT9d15G9rdipVJLMCrgtWHHx3q335rY6QIWIqq7WtRJrKHlZtDk2Rv4qILtRv+n3D
         NCE5AjscL4tJunumOeZVF/0ZIyZaSNeuqpO7z4aaMGvcfWwpkbzu9aliIXvXAqg7WXlx
         93YxTxb0gs4vEb4aWIccy81ATsBhWaPDf9aBhFAdKRigvRnQVOP7iEywCd5+KV+h8PLM
         1I0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745480070; x=1746084870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hg1fJUqFPUmaQAIOsB514eMr/+6dxVQ5q9mfZaUqhwI=;
        b=l+LE4ZIAs8G8C49dF2T7ZzyGXkagvJ1ARxatwRRMoPH2PF+WU7SogIouUtcFQlBw7l
         LI9L9TILHzVqYWgU9oHbHadmZ+rIAv+ELV3yhq0WqIpRBOzbx/cIFJZPmtXH0aqINC2m
         aXnGHUqmhN3OkNpgDJfrmeG0EcqIO0qwmeMNGQPpl93Lvt4Uvar/gAFSZRJMP4dTxUd6
         GxPGlE3rrE/uearTbWT38+Jf9rctXF1dpTUw58+aIyIX+oD9c3yeXHgQpYT4TY3yCJ1s
         8KSpG3uq/z2dMQlpLq2+WdJgFPbrD9MCxtsoxyW0W3svXWO+qxv98EQhSuE3fJuNeaZl
         GeMA==
X-Forwarded-Encrypted: i=1; AJvYcCWkihKBE9lWEKqOzTUKrFC6MdHeAgaXR6KAhOz+XfM6a84/Rjl2/iD6Wwq9B43aRBD1UochIaBqdi83Pr8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yztm26MJc7/GLANuKHDExr9nCsa1Hm++QlSAzzpVtxleHyqhV87
	oamPBJkU4VQaamaglXMOgzxQDm84Jf5Y4ywUBMpBayvUKUxTlxRWldipakrv1zboQH+O+qFm4v+
	jEvLc2s6PwhcnvYwX6pp0M485Z5ivtFhl89MkgQ==
X-Gm-Gg: ASbGncsF1IlXqcsJTYblJ5xekDRpOx7D0irir/2fPHoKKsRmbJixsmDwhmqZkg4E3+J
	OXYIJ6aKhUufrqhejcQM5Myi3aXPdkwlNd5BIuhFgOGZCKYInCCGY6Oal1GcntQu65AE2NYTVwg
	21Jd+5oQKPQbu2Wn+NypyVtokyZkFOG6B/h/UMNgpr7Oll2yZs8ju4aMY/
X-Google-Smtp-Source: AGHT+IH+AZQn/RXsq4aIiZBGFx6kcOfNTWST3Ud9lzCO1h/OKWqCizwpNOX6zINAICkkJCKhYFL2SJd/kzv5SZujIxg=
X-Received: by 2002:a05:6122:1353:b0:526:2210:5b64 with SMTP id
 71dfb90a1353d-52a7840b1e6mr978639e0c.9.1745480070478; Thu, 24 Apr 2025
 00:34:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423142617.120834124@linuxfoundation.org>
In-Reply-To: <20250423142617.120834124@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 24 Apr 2025 13:04:18 +0530
X-Gm-Features: ATxdqUF7KMwodSuA0qtPO12X0tglypY1DQaBNL6jLImWiASW8rwygFekJbp9zOU
Message-ID: <CA+G9fYtT4eEO8Bz54gsvhA-rLp2yP=LDFV-evO2Dacm45zHX9w@mail.gmail.com>
Subject: Re: [PATCH 6.12 000/223] 6.12.25-rc1 review
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
> This is the start of the stable review cycle for the 6.12.25 release.
> There are 223 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Fri, 25 Apr 2025 14:25:27 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-=
6.12.25-rc1.gz
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
* kernel: 6.12.25-rc1
* git: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-=
rc.git
* git commit: 56d2398227a26c9827858b438ba125e54ae8b9f2
* git describe: v6.12.24-224-g56d2398227a2
* test details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.12.y/build/v6.12=
.24-224-g56d2398227a2

## Test Regressions (compared to v6.12.23-393-g7b7562936f80)

## Metric Regressions (compared to v6.12.23-393-g7b7562936f80)

## Test Fixes (compared to v6.12.23-393-g7b7562936f80)

## Metric Fixes (compared to v6.12.23-393-g7b7562936f80)

## Test result summary
total: 126085, pass: 105995, fail: 3148, skip: 16539, xfail: 403

## Build Summary
* arc: 5 total, 5 passed, 0 failed
* arm: 139 total, 137 passed, 2 failed
* arm64: 57 total, 57 passed, 0 failed
* i386: 18 total, 18 passed, 0 failed
* mips: 34 total, 33 passed, 1 failed
* parisc: 4 total, 4 passed, 0 failed
* powerpc: 40 total, 40 passed, 0 failed
* riscv: 25 total, 23 passed, 2 failed
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
* rt-tests-cyclicdeadline
* rt-tests-pi-stress
* rt-tests-pmqtest
* rt-tests-rt-migrate-test
* rt-tests-signaltest

--
Linaro LKFT
https://lkft.linaro.org
