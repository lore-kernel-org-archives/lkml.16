Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6877225C70B
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 09:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744192264; cv=none; b=AVnCN3dTf2+Gd4+AYK/EO/JrXY15h+YIv5hwmdfJguHcljXCva0MIg9iYzeiZBGjD+XkUaT40EulXNcLt4Ag95WccyWDGNsIMe0B2Nk6iZGzZlBFRuewNu5bI2jnPfYs5GhIt1UHejDs6sIemmNPj6mbS2oXbP6t0EMrgxqpQKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744192264; c=relaxed/simple;
	bh=DpUkIKGDpIBV3cYAXbEup5OjKbfXtLEX/LwSCYEclE8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aBOGCzkyLR2OzYCXxIKjC3BrC3rFBw2Ye7oIsJucD+RmNG15+sGnI3dhv6Jggz4r43Qnxthj2oq8SKlX7KUDnKGjIry3PD7My2wNiPnLf7s0V8Tn70Lq7R5ZtxiTxBVddfILkNlXTobdy9ePMIc/f3VbLtSwwsaLUph2tLSDnyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n/mXTtzP; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n/mXTtzP"
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-52403e39a23so5205856e0c.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 02:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744192260; x=1744797060; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1njNObE6GIJqOAUn6DtRc5r3V4Q5XV6eVkgK12erEv4=;
        b=n/mXTtzPLQGerKvlRcpBFBjJb/WS639fjIVNzGQUqR6egcxs8mSi7bbSGNJOAOQam7
         8XNaDo2tUGNhAVDE18HMejiyv8gvtoGnlRGZfhzUTXsJS9A7Rs+qXziA01kj9gD4IUXu
         UR4xV8Aty/ZfMyXlhJh6kTYs1/EG63m06nqo/gPrJFkJ1NWGrP7eYQpJn3+VOODaqWFl
         0rQp/WyuL47Yc+4IaBQwAXuM0KsynVc9kcrKnI/7zLPsT0LccxFq0Dwi+t4Zr5J8VAM1
         PGeql7h7+ZH+L3+cep4W/85P/PFf25CNLfbYQntJevEIZTsINhcRLnPUYkAcjuhL5wnV
         xg2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744192260; x=1744797060;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1njNObE6GIJqOAUn6DtRc5r3V4Q5XV6eVkgK12erEv4=;
        b=l/8wVfkUDdfXmro2mRqSlzcS6VpTOpkrTFK1m47fhwuhnD11PIgr7WYref1mycltF7
         40NLJJWd1MJ9/53VDmozoMAuaWoZ5o7eUjwswLzu8wvImaXd5lE0SjqY8eI6ZtVSwUgK
         +rpXqfUV6DMIF4gpdK/pVL4gUDhcm7u43m30xQnP1m7KphVUOI2wIenofVWBpLVQ89NF
         VR+2//i9IiG15CvjElNeHAHuJRo6mjjxqWWzG714DKns1c016nWq0nETxiCzpPzlWM5d
         441gCRd/FIyGH2Y+Z6IqM4N/vYhVDc2qYWWNWDQlgLG/3zZyOCWPOm+tcXYBCVn8r18K
         qkiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoGyqdDcBmg4f0Dc0QzwKmGWRWf6kglqbWubokj9inFjTzq3qAaE8EWmOdnWuRLxuQNpLj1WlooiDOn5c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLZ4zcbZiOAwwBfvLsh/1hh+ho/yMUk3axyu3IhFDcKiVRECNl
	rH95SyngwaiY9WZKPYXSfDYKco4j5fSkNG2d6BWTGm7DH6FPl1B1tADhjNENTEpfBlPkslU7GG0
	m+f+d/BG8FS6BoDtDaAgxG3y1pdPI5e3e8kiPDw==
X-Gm-Gg: ASbGnctS8ye0TetPBdNYqHKw4duoVwQXJ1geMU7j2PWLhHaMdF5ShbWvimUVF3bXHtl
	OBXOU5XWxqCgdG7jxLScXm0V+igLQOSIXqVUuD44SyGqKmX4mH+rAvZP1YOzP8gxNuD9EziJk21
	99u9ew5I36gLg2spKpD9S8QDK9SFKhBrilQqP2F3zc4ZOpAwROICJU5Mk=
X-Google-Smtp-Source: AGHT+IHsG0WKPLT9y5IYgBaUgVr1z4LIH9R6xpKkJTuJ5byGHhHn7WE9slVfaWZ/SR14YCSc7WcOvPakH+olVCjROHA=
X-Received: by 2002:a05:6102:570f:b0:4bb:e80b:473d with SMTP id
 ada2fe7eead31-4c9c41848f6mr1465104137.6.1744192260230; Wed, 09 Apr 2025
 02:51:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408104820.353768086@linuxfoundation.org>
In-Reply-To: <20250408104820.353768086@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 9 Apr 2025 15:20:48 +0530
X-Gm-Features: ATxdqUHXBcjtcqSTk0bz5Hn75TBoEbSUnr0VzKiWJ8WGDtcsvBL0fc7wW3KoqtA
Message-ID: <CA+G9fYty2+wHZUUVBWposQB1uDV+Z-b3+5HgsJP-a=z3pjEseQ@mail.gmail.com>
Subject: Re: [PATCH 5.10 000/227] 5.10.236-rc1 review
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

On Tue, 8 Apr 2025 at 16:26, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 5.10.236 release.
> There are 227 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Thu, 10 Apr 2025 10:47:53 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-=
5.10.236-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-5.10.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h


Results from Linaro=E2=80=99s test farm.
No regressions on arm64, arm, x86_64, and i386.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build
* kernel: 5.10.236-rc1
* git: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-=
rc.git
* git commit: 327fc1af5609fca2b091894de2ee904fa6391306
* git describe: v5.10.235-228-g327fc1af5609
* test details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-5.10.y/build/v5.10=
.235-228-g327fc1af5609

## Test Regressions (compared to v5.10.234-463-g92c950d96187)

## Metric Regressions (compared to v5.10.234-463-g92c950d96187)

## Test Fixes (compared to v5.10.234-463-g92c950d96187)

## Metric Fixes (compared to v5.10.234-463-g92c950d96187)

## Test result summary
total: 39096, pass: 26647, fail: 2806, skip: 9346, xfail: 297

## Build Summary
* arc: 5 total, 5 passed, 0 failed
* arm: 101 total, 101 passed, 0 failed
* arm64: 30 total, 30 passed, 0 failed
* i386: 22 total, 22 passed, 0 failed
* mips: 22 total, 22 passed, 0 failed
* parisc: 3 total, 0 passed, 3 failed
* powerpc: 21 total, 21 passed, 0 failed
* riscv: 9 total, 9 passed, 0 failed
* s390: 9 total, 9 passed, 0 failed
* sh: 10 total, 10 passed, 0 failed
* sparc: 6 total, 6 passed, 0 failed
* x86_64: 26 total, 26 passed, 0 failed

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
