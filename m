Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E4F38DD8
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 06:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743834568; cv=none; b=pqwNVNKaYAlsXKLsuQo76+3eVOB+uBviOljtdKozIl6sEScdsKmfi4bBkqsQECynidOv19wwqYGQiU2gNaEOUeRdXPS3RqYxH+IzlEKLd7IzhOWR0xaN9Y5q40efVEB3x5z/ytjZfrTE5b8YXtq6hpi0qUcp8SQ7xLj6jq0FNTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743834568; c=relaxed/simple;
	bh=9vqzDp7O4j3L84uAFcZIhXsaZQIhBtiKkwykBM4JOPA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i/N0dVF+OeFNoP8MFhkxSh7wK08kzW04ZXRco1WWR9jfD+QOgdUHTiIpDFchSrQv7NRtSEUa8wbab8pjQ9EYyYjsqrbSzbTLl103pDjk1YSH/0kX55f+6F5ZXjB5OxYitYmKPxogpNSM5hZPfKd6tC+4z1uYLofJlmi6BD8UYuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gi9EkIXW; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gi9EkIXW"
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-86f9c719d63so1194707241.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 23:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743834565; x=1744439365; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9Utl2AdZNCkcBOhv0fIljE/ZFO1pXanNvtL1Clfabdg=;
        b=gi9EkIXW0vuxK/3N3QduQMHU3pNcc4ZH5GDezTnCNaGCAVRmclu9GM8vxRic1C+0ji
         wCNMRZGsKNHH7JQOglmYFd9SgRqwm9bZVIhLAF99zNUcdDgymmBd9KedUFrc87K1icuX
         AG6qLQgKuBiTzdWm00PFqrDeKjJ40Dg8QkrP4LcOyBhEdL5/atWge9/HjziiaP6K8pix
         IwSTteAVrRUHLOQRnT/gpd9gEWEFLsF3CSMQIh8REOYdP1aXBcd/ylkSWBqoIuqay436
         gE43cTVCIAfPgI9CWFuRTqa9aIw+13VhW25A7viJ/e1tMk+pZo9oap2cAf+T93FDz2ob
         IM6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743834565; x=1744439365;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Utl2AdZNCkcBOhv0fIljE/ZFO1pXanNvtL1Clfabdg=;
        b=e3au7IQLmxv6MfYEzfLiITczhCeWAzf5+qW7I5Tnmx9E5DgDV6bgRUww26SIvPyVkO
         L1lM2n2tpeKOP9xsR4cIwJIXP/WLZgv8p93cM6KUQC7mZvme4QuHJPj0md7kcCBcyPyC
         tnpcFswXMCqGZwjGM+KTevlXPCszGcKDW3LxlA0qwCDcf/u+PEXsXIeOs/kwLS26vakX
         OaTZY8Pyzqd+v+GVDsHy8/D/br5dstkQaCP8X2HtxE+GjmuuSClZSvCubkC1yjcXSNY6
         +ASVPh03wNTPFbOd7vVMMPNU/v8qcaUa63CWq4gTV/oguQQmDdpsDSIwKO3stf8Xd6J5
         sgag==
X-Forwarded-Encrypted: i=1; AJvYcCX6M6MUQwQQNniim6j1H49sZCMUaChGK/C7Tuzo4qGstYJ8kpdGl3scoPgNvBE/+rxXCGJt1klUgPwpal0=@vger.kernel.org
X-Gm-Message-State: AOJu0YypjcjcDiXfb9JwPjufz6nkjdZ/bHMgKZRAvpeBmg4lSEDQapWi
	GxoFXR5nF+DA9qZVSDdMakp0rJpop3HgE3wBCoosE8E0dxxqdZpXB2RFgOiyXmr3AlZAw4+9bag
	I5aeoVMgk5n4OiqYsbxhrkDH07V8ifZYHR/Yc3wkrx8ttwVRpDE4=
X-Gm-Gg: ASbGnctXLxAg9+RcJeX7oWSaItyTlDrGV1CgBs2s4cd1b546LB/h1VkQcu3Pu8chaMi
	F7cJExp7EOB6WXHshWKrjNOXnTA845Mhz7F+GECdLiPmLnOJpPdE8g7cZyPzzLa7JkW3OWj0hAA
	S4C59VCN4pTY0WIQZ3iXvx0A3fNWbMpbGtTv5MteNU5jAqhdaFC4HPoBkbq3VO
X-Google-Smtp-Source: AGHT+IHjXtMM0/lND/4C1YfN6pB+FvxG5xBPA1G5va8pDe8hv0DRy+KV2tjV00P9S2pdXpa/LiAKD8WE3wYP6F9oc10=
X-Received: by 2002:a05:6102:f88:b0:4c3:858:f07c with SMTP id
 ada2fe7eead31-4c856901e0dmr4370458137.14.1743834565101; Fri, 04 Apr 2025
 23:29:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403151622.055059925@linuxfoundation.org>
In-Reply-To: <20250403151622.055059925@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Sat, 5 Apr 2025 11:59:13 +0530
X-Gm-Features: ATxdqUHtD8sJUPfm4UnmmdIUVFWTMvUomKqZ9daRtLxETGEWitzM1tdtNWpRJ2E
Message-ID: <CA+G9fYvN1TRaX4Wdu2zWcJpTJ-2FzONKdLZsamXXXpufzenakQ@mail.gmail.com>
Subject: Re: [PATCH 6.12 00/22] 6.12.22-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev, 
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, 
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, 
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de, 
	jonathanh@nvidia.com, f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, 
	srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, 
	broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Apr 2025 at 20:55, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.12.22 release.
> There are 22 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Sat, 05 Apr 2025 15:16:11 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.12.22-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.12.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Regressions on arm, arm64 and x86_64.

1)
The selftests rseq failed across the boards and virtual environments.
These test failures were also noticed on Linux mainline and next.

We will bisect these lists of regressions and get back to you.

* kselftest-rseq
  - rseq_basic_percpu_ops_mm_cid_test
  - rseq_basic_percpu_ops_test
  - rseq_basic_test
  - rseq_param_test
  - rseq_param_test_benchmark
  - rseq_param_test_compare_twice
  - rseq_param_test_mm_cid
  - rseq_param_test_mm_cid_benchmark
  - rseq_param_test_mm_cid_compare_twice

2)
 The clang-nightly build issues reported on mainline and next.

 * S390, powerpc, build
  - clang-nightly-defconfig
  - clang-nightly-lkftconfig-hardening
  - clang-nightly-lkftconfig-lto-full
  - clang-nightly-lkftconfig-lto-thing

 clang-nightly: ERROR: modpost: "wcslen" [fs/smb/client/cifs.ko] undefined!
  - https://lore.kernel.org/all/CA+G9fYuQHeGicnEx1d=XBC0p1LCsndi5q0p86V7pCZ02d8Fv_w@mail.gmail.com/

3)
 The clang-nightly boot regressions with no console output have been
 reported on mainline and next.

 * boot
  - clang-nightly-lkftconfig-hardening
  - clang-nightly-lkftconfig-kselftest
  - clang-nightly-lkftconfig-lto-full
  - clang-nightly-lkftconfig-lto-thing
  - gcc-13-lkftconfig-debug

  v6.14-12245-g91e5bfe317d8: Boot regression: rk3399-rock-pi-4b
     dragonboard-410c dragonboard-845c no console output
  - https://lore.kernel.org/all/CA+G9fYve7+nXJNoV48TksXoMeVjgJuP8Gs=+1br+Qur1DPWV4A@mail.gmail.com/

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build
* kernel: 6.12.22-rc1
* git: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
* git commit: 03f13769310a6563393c6bbbf9466936b50d5b0e
* git describe: v6.12.19-371-g03f13769310a
* test details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.12.y/build/v6.12.19-371-g03f13769310a

## Test Regressions (compared to v6.12.19-348-gf5ef0867777d)
* arm, build
  - clang-nightly-nhk8815_defconfig

* dragonboard-410c, boot
  - clang-nightly-lkftconfig-hardening
  - clang-nightly-lkftconfig-lto-full
  - clang-nightly-lkftconfig-lto-thing
  - gcc-13-lkftconfig-no-kselftest-frag

* dragonboard-410c, kselftest-rseq
  - rseq_basic_percpu_ops_mm_cid_test
  - rseq_basic_percpu_ops_test
  - rseq_basic_test
  - rseq_param_test
  - rseq_param_test_benchmark
  - rseq_param_test_compare_twice
  - rseq_param_test_mm_cid
  - rseq_param_test_mm_cid_benchmark
  - rseq_param_test_mm_cid_compare_twice

* dragonboard-845c, boot
  - clang-nightly-lkftconfig-hardening
  - clang-nightly-lkftconfig-lto-full
  - clang-nightly-lkftconfig-lto-thing
  - gcc-13-lkftconfig-debug

* dragonboard-845c, kselftest-rseq
  - rseq_basic_percpu_ops_mm_cid_test
  - rseq_basic_percpu_ops_test
  - rseq_basic_test
  - rseq_param_test
  - rseq_param_test_benchmark
  - rseq_param_test_compare_twice
  - rseq_param_test_mm_cid
  - rseq_param_test_mm_cid_benchmark
  - rseq_param_test_mm_cid_compare_twice

* e850-96, kselftest-rseq
  - rseq_basic_percpu_ops_mm_cid_test
  - rseq_basic_percpu_ops_test
  - rseq_basic_test
  - rseq_param_test
  - rseq_param_test_benchmark
  - rseq_param_test_compare_twice
  - rseq_param_test_mm_cid
  - rseq_param_test_mm_cid_benchmark
  - rseq_param_test_mm_cid_compare_twice

* powerpc, build
  - clang-nightly-defconfig
  - clang-nightly-lkftconfig-hardening
  - clang-nightly-lkftconfig-lto-full
  - clang-nightly-lkftconfig-lto-thing
  - clang-nightly-ppc64e_defconfig

* rk3399-rock-pi-4b, boot
  - clang-nightly-lkftconfig-hardening
  - clang-nightly-lkftconfig-lto-full
  - clang-nightly-lkftconfig-lto-thing

* x86, kselftest-rseq
  - rseq_basic_percpu_ops_mm_cid_test
  - rseq_basic_percpu_ops_test
  - rseq_basic_test
  - rseq_param_test
  - rseq_param_test_benchmark
  - rseq_param_test_compare_twice
  - rseq_param_test_mm_cid
  - rseq_param_test_mm_cid_benchmark
  - rseq_param_test_mm_cid_compare_twice

* x86_64, build
  - clang-nightly-allyesconfig

## Metric Regressions (compared to v6.12.19-348-gf5ef0867777d)

## Test Fixes (compared to v6.12.19-348-gf5ef0867777d)

## Metric Fixes (compared to v6.12.19-348-gf5ef0867777d)

## Test result summary
total: 126487, pass: 100173, fail: 7402, skip: 18837, xfail: 75

## Build Summary
* arc: 5 total, 5 passed, 0 failed
* arm: 139 total, 136 passed, 3 failed
* arm64: 57 total, 54 passed, 3 failed
* i386: 18 total, 18 passed, 0 failed
* mips: 34 total, 33 passed, 1 failed
* parisc: 4 total, 3 passed, 1 failed
* powerpc: 40 total, 35 passed, 5 failed
* riscv: 25 total, 23 passed, 2 failed
* s390: 22 total, 17 passed, 5 failed
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
