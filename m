Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9CC2BE7AF
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 10:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750849084; cv=none; b=qYHnRw7TC9DxuI7uUtm0oLeb7+FypZyoCWjMfwVQ7ybRIUz95OPxhU7ctG73ist9IC+5t4PyqNnFBc9R7LQ8XAYt4h18T8wwIuh/MNt7WG1w17Kp76q51/xheJay0YXOUN5GDRN2vm1PtCy8MMDXtpdk1GmCpWXHsd7Mh1bwm6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750849084; c=relaxed/simple;
	bh=D72mDsP1erYv+cbvWDuoheOFU4iq9ltrX5rHkzuOLfc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qulD1rKsg5kwv/S9e+KqRTawFWhVe4riNsNjfIAurFtnE5YXpdvTQCo1g+FN5CcP4exZ/ZpbtCFyrra0e8Drl2V5z7kK9iWmMFQ2+2cUnVwO8xw4I7saVmmkgm0RsFoJfRn8b9rwCOaTHmil/wlDhVcdnYRp+euoROfUZ5mcKFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M4fCyjnQ; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M4fCyjnQ"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-31223a4cddeso5017956a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 03:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750849082; x=1751453882; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ILAX6gSRE6kdPqfm5GXpanQ56vn1GjYg9ehEVWFYiQ=;
        b=M4fCyjnQAKlXjnmRn/DwRupjoo8gMO/AfRBPaJgisrOyDs1p39DAA/3s9ZO+6W7Rml
         SxOis94VFQhcewc4+qb2PUHIJMcQI6wJ2i80TYfXbtaR51247xmrKeJSP7LxN6Nv6/G1
         oL1yS6cWDDQ+uAKy9j5kZBEjD/ubKcuDnFarfQ6kYJRe7FNJOd9RXUPIu8zXxDlYcKA8
         f8TYHladTdiCsY8QmYkOEwNYgXr3z3qxfJQwB2Hlm2P4QB/z79yxgCRI9HBJTQIX+NoK
         2XRTwNEAsI+Q/TqvBhL0QqKy00s9x4DWHiNDNPPZWpL91yHxKXeYpwVeL73cRk92ngoU
         uirw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750849082; x=1751453882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ILAX6gSRE6kdPqfm5GXpanQ56vn1GjYg9ehEVWFYiQ=;
        b=aVWqFBIyQ0+z0rrNeDJW7XhR+cDVD1UZcBpU7FVoRB+0nCpAl88nAVzX5BmYTeSEV1
         kvEsoccb9QuFNtrCcHqebza/FX+IXgmX8gELdca6ZRGxTCAeWcsJomzKBi/UYM8aiXYr
         KL9h9v7Z94qRTsWl9aaE2P6fbu1xY29JzL1LohetJK3nOfJBkte/1V+2sPlC26tFnJL+
         CltaO2OlgdAulDTYAUzchy1FY76gLCku+BGmLTVsFlLRjIm0LCNRenjrsfoIkS97gh9F
         PK4iEdjOYLtfBMV48GLXYTtaPhrARPWgZ+z6SLYejoWdZRA994Zf3s1GjuUTEB13LKbP
         6Cbw==
X-Forwarded-Encrypted: i=1; AJvYcCVY1IzQkQYTojXMlnlF2ZSfsnBR595dWf8ETVKEKbh+FZeBdhioe+lA5EuW4acwNGce6h+9BjHnhipbcug=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5gyB790Vc5LM22LaLtswLG/oA4Lm+4Ay1BT/mWdmFwulge+Cs
	K/dTVBfUISQqDshtY8SNdpWfHlUUHgoqYV8QCT0w7ZBg+a53SUgCuHYUB/kRt3v56KQiIsYsfzy
	5AzPXd9C5rWMP0Jdc09fVyz7wJeXday+2tIv4XzpNWQ==
X-Gm-Gg: ASbGncuinARfUjpj4AhSFZVfbS7eeIP09wUxbj5LBmoBQppehszU3KgZCtv/emMq/Ry
	yfxBkg9m2zcSvqkmMi2Xjw0sddfbF2RdQf/CHOyVVetEEYIIn/0DVrYNNGGPpne0RIc0+xh3/T/
	Uj4rDplbBTSIVjp0yU3zpKKUBRYmSJth1b0x8VVLo4xooY0imNMueiASd0VkjPqQlbkWAfgeR8Q
	CW6
X-Google-Smtp-Source: AGHT+IGwRsFj0UhDLAKL9Lzvr4zJw7vlaSrihVLKeOijg8pRtuJpuGoGsVMTxmEHUYJc8eXh0Y+cl5E9ZF4JKiRvruI=
X-Received: by 2002:a17:90a:d60d:b0:313:f6fa:5bb5 with SMTP id
 98e67ed59e1d1-315f26893d4mr4206266a91.18.1750849082440; Wed, 25 Jun 2025
 03:58:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624123036.124991422@linuxfoundation.org>
In-Reply-To: <20250624123036.124991422@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 25 Jun 2025 16:27:47 +0530
X-Gm-Features: Ac12FXx3_t-mGX_V8J9UvgTrbHLe7MKYtXoHtEecv2RZNbjg-T01cSYHtYXBEO8
Message-ID: <CA+G9fYvY-KeV9yfas8S0ZU46BwQdk5pGEowLVkEgXo-9BTXQEw@mail.gmail.com>
Subject: Re: [PATCH 6.1 000/507] 6.1.142-rc2 review
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

On Tue, 24 Jun 2025 at 18:01, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.1.142 release.
> There are 507 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Thu, 26 Jun 2025 12:29:38 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-=
6.1.142-rc2.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-6.1.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Results from Linaro=E2=80=99s test farm.
No regressions on arm64, arm, x86_64, and i386.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build
* kernel: 6.1.142-rc2
* git: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-=
rc.git
* git commit: 6d3c6e22f526bb03b148d94dc2848088c4a89c6e
* git describe: v6.1.141-508-g6d3c6e22f526
* test details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.1.y/build/v6.1.1=
41-508-g6d3c6e22f526

## Test Regressions (compared to v6.1.140-326-g1c3f3a4d0cca)

## Metric Regressions (compared to v6.1.140-326-g1c3f3a4d0cca)

## Test Fixes (compared to v6.1.140-326-g1c3f3a4d0cca)

## Metric Fixes (compared to v6.1.140-326-g1c3f3a4d0cca)

## Test result summary
total: 134454, pass: 118781, fail: 3766, skip: 11722, xfail: 185

## Build Summary
* arc: 5 total, 5 passed, 0 failed
* arm: 133 total, 131 passed, 0 failed, 2 skipped
* arm64: 41 total, 37 passed, 0 failed, 4 skipped
* i386: 21 total, 21 passed, 0 failed
* mips: 26 total, 25 passed, 1 failed
* parisc: 4 total, 4 passed, 0 failed
* powerpc: 32 total, 31 passed, 1 failed
* riscv: 11 total, 11 passed, 0 failed
* s390: 14 total, 14 passed, 0 failed
* sh: 10 total, 10 passed, 0 failed
* sparc: 7 total, 7 passed, 0 failed
* x86_64: 33 total, 33 passed, 0 failed

## Test suites summary
* boot
* commands
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
* kselftest-kvm
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

--
Linaro LKFT
https://lkft.linaro.org
