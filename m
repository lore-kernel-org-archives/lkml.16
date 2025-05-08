Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851A528E17
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 06:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746684706; cv=none; b=Z8BJgoU1HqOOskJ6cbSDKV02dRRiI8lLW1gEpAx+RjcAxNgwmZkFetwcBeLJQthk293ghUYc9ZcQMlY2OVe5+ie6AFpLgTxEL3Ip+6l6esG4h+oAaIBlba1AHXMhA6vYqNBEsb88yy0lHVl87jbVDBBtU/o1Z6IQP7DmjH/QdbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746684706; c=relaxed/simple;
	bh=HNlrRjCNOjc5GdSXFJpo7t8flSSy3sbT8m43LZIPYi4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VOxXxRvCH2XXYnN+u6N0oDH8I4r5veDkMenF4aYLoL8yrUYmAkeg8Sc1c9t12mALYhosoAk6qtHAlIY30Uw1WrTocPg4UfEg4gsscAM5t0vipK09Mx1DRAfCRfD+9f1RzE+D0be8oELd4tS0vIf/RhayvysnL7dXux6RNoOD1aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dg+4dTfp; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dg+4dTfp"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-52413efd0d3so203756e0c.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 23:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746684702; x=1747289502; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ggMc/YSVOlg35VFXf+FUJX550Oig9VDbKmjq2DpIEkc=;
        b=Dg+4dTfp4Q6OaQc7A2Q/OjtPBgSZGG23OGqfSwfEdhvXYHX7+ah/SJkE2kIZm7lYho
         aTbOvi3iimWlaWZtX4lXz3jsV9kv8lBmQZGvTeEU5KX0aeKB+jQVMsog/Lxs6ZFJNK3m
         w12W1finm3weTsXnBmppicpnkD2B6vPcQwTmRJJdSA288DFXpDC/Sm6h/Zx3R6FLZ9Xi
         V9hVu70ObTa4mZLv3UdIvdf+8utj8apP3HjY2+r75riIibTZ4UhMrDHo/OF6chxLSiAs
         jQ4ru/TiNuGGiKWfmYCK7lgwHRa/xgEXcsSijYUzXFhmBD1j/LvJnXp8LSWe1i9Stri2
         sNkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746684702; x=1747289502;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ggMc/YSVOlg35VFXf+FUJX550Oig9VDbKmjq2DpIEkc=;
        b=CVBDuC3TEL3aep8ksSzNUw0E8XpNHnS5bMDlOAOKKgDWE0dBWabtqmVEV4CepmeJ5Z
         qUZ8FMCARCOxVJWrGJj68O8KpVPHE3rMRyTeWpTyn5PlEb0limFB9N2zu4nUQ/uMhmrr
         8kcaOd+lE+PGnVS/gMHetuX3B/2IuQSDkJ+8rZQEbntHeY7rNEJqJlnr19DC0Xzr66v2
         NCrL1ZW1isVGVwHTdlGF3EM7AjLtByBSozTTXQDC/2fSeneHhphuC3MrmBVLYhu00SHS
         qqSRlpP5vCIxXqXw/S80L0BGvdh0vJRaKviqW/s/p9LmwwIUOL5ybfoiU/tT9lZepOZr
         pEuw==
X-Forwarded-Encrypted: i=1; AJvYcCWN2NsNdvUlWbwZ9tLsyX5+XbzxlbIw6G2TFgrQ/Fou6qGuC9jSfEmBWr4KCzU5n2nb8qy3TmMVjEOEugI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlOh1uBqyOLbB9jhtNHWYrCKnGYrf0Jkiick5fgzLsta/zg13M
	w7mhZYeVUl9FzOhIEEkl7++N+GPeQOqR7u43wnZHNkTj9BAmOF0d+LJibgFAR5FvTKh3XWv0MFT
	CkKwYxVVMLQaeLy+MD5PcqPIMfs7tsEJMjW11og==
X-Gm-Gg: ASbGncvp6A3dAFkaQBjQFAnc6aiETmDhjMSG+iC3RstFCcJK1eASdNyFDtfKK0VQprz
	Uf+dC9N0M7iOXRDfZQirl1rROHVTR41skVjxqQodtxeeH4c7lUduhJJ2KOkL5OB0uy8vTohxtgG
	CU3GAh1rmruLFWvw5Pei1z+VWkHMaLThCGTbHHsC3rOcNcmFJomdcFE/w=
X-Google-Smtp-Source: AGHT+IHh1VPsRTRDZ2dn9jqEZVR7nhxOdrq9O1N3MFuKEl9DNw9pdy3hMg0M/QVEHJaNyq7CBuGIzNYaFBmzdy7XPLM=
X-Received: by 2002:a05:6122:da2:b0:50a:c70b:9453 with SMTP id
 71dfb90a1353d-52c37ad82c4mr3961698e0c.10.1746684702342; Wed, 07 May 2025
 23:11:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507183824.682671926@linuxfoundation.org>
In-Reply-To: <20250507183824.682671926@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 8 May 2025 11:41:29 +0530
X-Gm-Features: ATxdqUFiT7jV4WQv4sxEiShVmVt-yfuXvsnQMML01LrKbK5pYcwqRGc7voz-_xU
Message-ID: <CA+G9fYt-o_p7hYKsAyC5j5kX7zOmCn3UX8njkAMQco5ARUmGuA@mail.gmail.com>
Subject: Re: [PATCH 6.14 000/183] 6.14.6-rc1 review
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

On Thu, 8 May 2025 at 00:20, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.14.6 release.
> There are 183 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Fri, 09 May 2025 18:37:41 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-=
6.14.6-rc1.gz
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
* kernel: 6.14.6-rc1
* git: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-=
rc.git
* git commit: a33747967783a6e6a8ab7c22905712408f5b8eef
* git describe: v6.14.5-184-ga33747967783
* test details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.14.y/build/v6.14=
.5-184-ga33747967783

## Test Regressions (compared to v6.14.3-550-g25b40e24731f)

## Metric Regressions (compared to v6.14.3-550-g25b40e24731f)

## Test Fixes (compared to v6.14.3-550-g25b40e24731f)

## Metric Fixes (compared to v6.14.3-550-g25b40e24731f)

## Test result summary
total: 138622, pass: 114363, fail: 5571, skip: 18324, xfail: 364

## Build Summary
* arc: 5 total, 5 passed, 0 failed
* arm: 139 total, 137 passed, 2 failed
* arm64: 56 total, 55 passed, 1 failed
* i386: 18 total, 16 passed, 2 failed
* mips: 34 total, 33 passed, 1 failed
* parisc: 4 total, 4 passed, 0 failed
* powerpc: 40 total, 40 passed, 0 failed
* riscv: 25 total, 22 passed, 3 failed
* s390: 22 total, 22 passed, 0 failed
* sh: 5 total, 5 passed, 0 failed
* sparc: 4 total, 3 passed, 1 failed
* x86_64: 49 total, 42 passed, 7 failed

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
