Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4744628030E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 08:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748938052; cv=none; b=XfaP4CoSrsysCghlFObMqWJyOsUylqjyiShRfqqlNEdtZbNL/0h2v1eRm4EFEZpqIetuszgY0V+s3aR/M8Pc1YDB52Fn5pl3N3CGR6DX3ym3Z1oPZ4UuHUvxKBLC6hLZg6MATCKtnw6G0ljxMycQPko3h52iZuaUE2eY8l4iAYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748938052; c=relaxed/simple;
	bh=a0efNbPkFoFMZQuJlsXwZa0OvWZ5LKfKa8oXf/iTQGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u9dmJo2NeTM3we7EwszZuo1nC+CM0Tri0kuk2fYkHfeW+DZf9OGNdppnYh80M7axeU550/8RYXbXhRcXmfgt85YcNlPcHxkg4bJFdX3HRQcUm116WyT6XC55kW9omcvDypKkCTK22Yany83PWWSeABt9WVsC+QFZIS00sgcnP5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hPM5t7yA; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hPM5t7yA"
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-87dfe906a87so1381589241.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 01:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748938048; x=1749542848; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fDGBSduyXbHQ46IAjI466E3jzdFbbBUSkhtvK40jR68=;
        b=hPM5t7yAAZuB2ayIUYULDnTRUOiTFCttHUSGROS2Muv5mPAIR9pSlHxoKC3vGOT9eH
         NAAJyxXH1N+4tSPkDSfoIFVCbBLD95PiR43r+7pHItIBUe5iJRTKsgaHpCwCe6vZmNCw
         nZWpLRyFINUvUOC+TgBTCxCAzavZoEdSgcJ7rqQmfKA9qJvU30Gpq9miJ+QIf8d3PbBs
         utwEq8X2GkAbNNpBHVmqLc+BRmgvSHvRu3qoOC9nXQQ7mbzS4VhoeU0lDDi0TRiaac/s
         +llVJt86Vhw6DLRiAimj2/iLNbE7S/5IISYle3ceIr5HGSyej15IHd0TVzrbNdAovqAh
         lUag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748938048; x=1749542848;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fDGBSduyXbHQ46IAjI466E3jzdFbbBUSkhtvK40jR68=;
        b=OUyBC9+uZUBOf+kynORoVsYKtXj88zu84a4aaPzBMkepwUR8S0dpbKGDTwQfBucZiq
         BMewT8ryHeEciNAk16pjiFF8tl2wbSguDGO5iBSxDAbb31EVpKUxKHj/chtlpu/ywbLP
         sJkrnBPv21r7LBi2NmSsE+l6eqXs01E6bsSJ4JXJKPbbHnhhVlcq/MjNI+0Qr2KJvNsT
         yfWyUivHststTwHHr63vLm8jVG0jat7yWeQllLjw8Agp24fJjCmNS1yq3aUJ6yZTWmDo
         IaHlfrgYFWeDaHbFKmuLoNNkKImlwHMYMHSgXmQd/nweKgC1RmaIVJDSW70VTNmIbEee
         eRmw==
X-Forwarded-Encrypted: i=1; AJvYcCUrWiTmNRiBLsIKLgyDy7Vzk8L3RDQkbccsOBdC7DMLYxYbNQUm8S5BNcdDx17JkvlFzfi5xjlMM6v6Qtg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb0lQ5F3UHljFW/aAoypLghd2dJJO54XQgG9yIPrjvDaNoHHZS
	GB2AzqAdqrKieBEGo2V4U1WEe/2Yq9B2fogzR8nSO4RHDFCy6CIuz/6L0vfKfGB5QhpdzEqaYyk
	0skyWgWD+npXhextaiODiahtYZkPfF9lHcAZzcpt7Bg==
X-Gm-Gg: ASbGncvW+OAUOIXr6BspuPD1A6XrksYoiECEmmI7GlnBcUIaLUrda13Ux/6CY9GZWyy
	sITRBkrNyIWOkQDnlVNfMdqm8FDo4iB+RJoh9VkVzaohHsleK8fRVjgruVHBPtPMNhhHzOJGrFr
	95827+VGRre2YFVQrp6srrQhWlKdkp+jdEdj/a1WJL2cMeg5EcNPnT
X-Google-Smtp-Source: AGHT+IGyYkGVv3WmXmsTELKM5fLdDqlySf6QWUPXvdaCbaMbtPacfL3f8TZdtRnc1C4HVxQDJTCAbW/51uVvOY57VPk=
X-Received: by 2002:a05:6102:a47:b0:4e5:ac0f:582c with SMTP id
 ada2fe7eead31-4e6ece33e74mr11898093137.13.1748938048053; Tue, 03 Jun 2025
 01:07:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250602134255.449974357@linuxfoundation.org>
In-Reply-To: <20250602134255.449974357@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 3 Jun 2025 13:37:16 +0530
X-Gm-Features: AX0GCFvDqmMU1x0jRj0cXE5UtEj8pF1EDN8rIh8q3pvOM5Nfh8pK7cZocZqKyDk
Message-ID: <CA+G9fYt_vx2f+3SG4Y7RfXnw6NDMJJuP2Mt1fNCEBBCBbxigKw@mail.gmail.com>
Subject: Re: [PATCH 5.4 000/204] 5.4.294-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev, 
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, 
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, 
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de, 
	jonathanh@nvidia.com, f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, 
	srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, 
	broonie@kernel.org, Steven Rostedt <rostedt@goodmis.org>, 
	Jeongjun Park <aha310510@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2 Jun 2025 at 19:56, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 5.4.294 release.
> There are 204 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Wed, 04 Jun 2025 13:42:20 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-=
5.4.294-rc1.gz
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

NOTE:
As other reported,
Here is the build warning on arm with clang-20 and gcc-12

kernel/trace/trace.c:6334:8: warning: comparison of distinct pointer
types ('typeof ((size_t)trace_seq_used(&iter->seq)) *' (aka 'unsigned
int *') and 'typeof (((1UL) << 12)) *' (aka 'unsigned long *'))
[-Wcompare-distinct-pointer-types]
 6334 |
min((size_t)trace_seq_used(&iter->seq),
      |
^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 6335 |                                                   PAGE_SIZE));
      |                                                   ~~~~~~~~~~

This build warning is due to,
  tracing: Fix oob write in trace_seq_to_buffer()
  commit f5178c41bb43444a6008150fe6094497135d07cb upstream.

## Build arm log
Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2xxMDrYn=
M37m3B0qZbAdLmnoeQ6/
Build config: https://storage.tuxsuite.com/public/linaro/lkft/builds/2xxMDr=
YnM37m3B0qZbAdLmnoeQ6/config

## steps to reproduce
 - tuxmake --runtime podman --target-arch arm --toolchain clang-20
--kconfig vexpress_defconfig LLVM=3D1 LLVM_IAS=3D0

## Build
* kernel: 5.4.294-rc1
* git: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-=
rc.git
* git commit: dbf9e583326d679bc41fbbee9302d2f0ec8e01b2
* git describe: v5.4.293-205-gdbf9e583326d
* test details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-5.4.y/build/v5.4.2=
93-205-gdbf9e583326d

## Test Regressions (compared to v5.4.292-180-gd5e62da0f6d5)

## Metric Regressions (compared to v5.4.292-180-gd5e62da0f6d5)

## Test Fixes (compared to v5.4.292-180-gd5e62da0f6d5)

## Metric Fixes (compared to v5.4.292-180-gd5e62da0f6d5)

## Test result summary
total: 45395, pass: 32893, fail: 2231, skip: 10140, xfail: 131

## Build Summary
* arc: 5 total, 5 passed, 0 failed
* arm: 131 total, 131 passed, 0 failed
* arm64: 31 total, 29 passed, 2 failed
* i386: 18 total, 13 passed, 5 failed
* mips: 25 total, 25 passed, 0 failed
* parisc: 3 total, 0 passed, 3 failed
* powerpc: 26 total, 26 passed, 0 failed
* riscv: 9 total, 3 passed, 6 failed
* s390: 6 total, 6 passed, 0 failed
* sh: 10 total, 10 passed, 0 failed
* sparc: 6 total, 6 passed, 0 failed
* x86_64: 27 total, 27 passed, 0 failed

## Test suites summary
* boot
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
* lava
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
