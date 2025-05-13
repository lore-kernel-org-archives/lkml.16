Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D81F1CEE90
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 16:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747153059; cv=none; b=htGKZz1beGkZSQQStpVmh83x5U05Zck2n6FF2mHg5paEcRIF9qTqUoMVllGtGG6sq5Pn1f/2TtpXsxQhA135ua28dZu4fAdVg5Ndm7+wa1WzBTZtTA/ewCnBX7pNN1WHekF8ecjhXWBG2XChAC6rtj6CD/kPDRdouBnOfkQEgTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747153059; c=relaxed/simple;
	bh=/k6EH3Fc/zb3rtylgyq4u/RSFENEtTcwHkK59WGtR7U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GBsqA2ym+QvOp/tO6iS19ZzPElO40kg/nNogImYMK77PbRmeBZDrSxMYAiQYYG8WK+tPOXBCk1/+NJeVGntwFrUajqyx5WlkRkucSjQ3I9+5dUdaq7srnqESrFdEQW3a5z+mhJvz2HGMrFAbsEU30aJVMAc0+Tm304RHVYbW36s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jMoBck57; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jMoBck57"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c9376c4dbaso1599085a.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 09:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747153056; x=1747757856; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6KYGCCD9QtETURvM4SFF+hSR2hHupYk+lugy2F+Fvto=;
        b=jMoBck57sukqpYRvY82oGZGa5/vrnitDfQqhjivr02Qg5g4zlKZIyxIk+fooTp8FvI
         DwC1dGfNErVCm8OtubgYgeq3pNV6jsoBctKozKs2Rhqd3jQB9Ev4cjvC51QhB8s8aB0m
         3CKXV0yoeJdz6N9K/PtdS8PSrHwL/Grl/+w3tTocAm1gdGmPgMcPBKgw6RNQjNR28RyN
         FfqRu08OnGpPcuScFXx34FkciQQttJsyk0zmtn1dvf1UNcMbPupHYpCtuSkYELmUQeoZ
         L83ZUItYPk9pbz00dF+APnkVgmSfjqbOlnfw/ExYTaXohAvGS88UEKKkfdLdQTCtD2gj
         gC5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747153056; x=1747757856;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6KYGCCD9QtETURvM4SFF+hSR2hHupYk+lugy2F+Fvto=;
        b=BNRZ/RvIi+Hf1qRltXivda5TBThXthpdMqaXrp0WnMOKCrBFi79Rq/16j9eKJcyQwB
         ti3foGMHpXCpcT+auGJ+CJVt1FO28mHxRs9RwzsHCcLFtx+qCtqYyflSCY9U00aAu3MN
         BT5FTrJY4ejGnqp9Lu9qyNDGlqrgtQow/SMUdeCsAlw116J2wYCeSGqo4xhpfbvGTGqQ
         ZIZybxa/OnlfRRlH5ub2qOgLmFGVpfWio+FKm/TJGM4a1dFDXx0KdR3VixKvmHU/pH99
         HQmdnp4Ebd7R5+nkEV5tVl79Id2P3Yry0UWZrTHOvPiNpszktgVCwQwLBobFM43sdt7a
         6x0A==
X-Forwarded-Encrypted: i=1; AJvYcCXTuRXboKd4O84LXo87ut1MS0cxYxqq8MmB83mX3uFoWzT24aM65zYvCO8HkoKwQk7KTdRVF5IhvpUhv2s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzgyhIHY9eup6xixaKmZu/Whfy182682thHuqxQ8x8oG6zOSH6
	VfKOzbd3pfZ/HQbOkUiO+2YI0x0c5F4nAi7Xc6BhSX6a7o8cdLwz/LrqQRYbarvaD9qDrNvkGjB
	+2y9ZWCwEfweKK9LL6950Cq0GADo9bTjQifUEVw==
X-Gm-Gg: ASbGncv/0hdaCdvdMaMDqAQmaVa0+3JT/gPs/NxykoyRmIToqQ/JFkhXqXQplFIyTum
	wGrTaI/oFEHc6Dkrz/B7pWgic2X3naxj51jvfdMfhw1wkjTsoy39dtZvOhgZ5BfRiQrQfwBnoeM
	tEsJ1GLhq94y044bYIjTf8el7/hP+OeO0=
X-Google-Smtp-Source: AGHT+IGYtyQXfctZatQi1ETEYQsyfcieEa/w22127hAJNNi/hZ6sMfmmqVsyG0iIkzuDvFKRJBUHtQq63iAMg8rxyso=
X-Received: by 2002:a05:620a:6006:b0:7be:73f6:9e86 with SMTP id
 af79cd13be357-7cd1debe7e7mr658324285a.20.1747153056207; Tue, 13 May 2025
 09:17:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250512172015.643809034@linuxfoundation.org>
In-Reply-To: <20250512172015.643809034@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 13 May 2025 17:17:25 +0100
X-Gm-Features: AX0GCFv7Gkug46vmMqzunGkj5qmL-HDap1Yz3dTHGpAw2W-izrUW9GWapqpKAMs
Message-ID: <CA+G9fYtR4d2AF4BGDJ+7iYS8kA26J0sQWmUTJjj4DWdX4wFBGw@mail.gmail.com>
Subject: Re: [PATCH 5.15 00/54] 5.15.183-rc1 review
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

On Mon, 12 May 2025 at 18:31, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 5.15.183 release.
> There are 54 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Wed, 14 May 2025 17:19:58 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-=
5.15.183-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-5.15.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Results from Linaro=E2=80=99s test farm.
No regressions on arm64, arm, x86_64, and i386.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build
* kernel: 5.15.183-rc1
* git: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-=
rc.git
* git commit: 5aa355897d1bc9d3ec5947e4242c939d117e9f3d
* git describe: v5.15.182-55-g5aa355897d1b
* test details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-5.15.y/build/v5.15=
.182-55-g5aa355897d1b

## Test Regressions (compared to v5.15.181-56-g364c50bdd7d2)

## Metric Regressions (compared to v5.15.181-56-g364c50bdd7d2)

## Test Fixes (compared to v5.15.181-56-g364c50bdd7d2)

## Metric Fixes (compared to v5.15.181-56-g364c50bdd7d2)

## Test result summary
total: 60455, pass: 46917, fail: 2089, skip: 11091, xfail: 358

## Build Summary
* arc: 5 total, 5 passed, 0 failed
* arm: 101 total, 101 passed, 0 failed
* arm64: 28 total, 28 passed, 0 failed
* i386: 20 total, 18 passed, 2 failed
* mips: 22 total, 22 passed, 0 failed
* parisc: 3 total, 3 passed, 0 failed
* powerpc: 22 total, 22 passed, 0 failed
* riscv: 8 total, 8 passed, 0 failed
* s390: 9 total, 9 passed, 0 failed
* sh: 10 total, 10 passed, 0 failed
* sparc: 6 total, 6 passed, 0 failed
* x86_64: 24 total, 24 passed, 0 failed

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
* perf
* rcutorture

--
Linaro LKFT
https://lkft.linaro.org
