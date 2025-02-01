Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA8B1C1F22
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 15:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738422910; cv=none; b=RGuEIF6SGf8/YdWNqrcFVUDxcyXOQKj2eN2GfedNVovblqFk8uh6vAMGXNBDPkCj69Rqs60h7+pQgMj800b61bpcCMDA7+o8ap94m+zE6zVVdxM9Msg1zJ2rUhER6TxlwgqY4fkjTfeLpuyMBM5AfIUN4l8AbyEvYM4ILkidyFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738422910; c=relaxed/simple;
	bh=grZzjOTp5UoxSAJdG19Iv5CHEy0RSryjcZZhcpUC39c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nh5LOSDgJ5rsmKtibGStOXEy5vbuaJO3Aa6LEn3UMn0n5mdzRrQyQA+6g/Q8qEApnPY3IcvXlwZc2uLIlrKWoFUc1+oLHq/EXu6cQ3SRoHbcv6JaSB+uDGGKRFrmWoulXPDN2VqmmuaxykmcvzzrldhOJkxwbZq1IOsKBCkzpiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xv6HSZu/; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xv6HSZu/"
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4b11a11a4f0so916582137.3
        for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 07:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738422907; x=1739027707; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QqUogr6li+EQcK4KgEU6JhksjMQU+YKI3tRfrBxh9Ck=;
        b=Xv6HSZu/bJQ2J773V55XHI7ei7s3MqsY1mD8IJ5LvVGjW5HZWG7EQs0uR/Z9ksNRjP
         MUopZdBrJ64ko5saQ3MtIEPXXnZlxwDGgjjaO0tjE4CLTLK7+XORf0FL/04A9Nvv4fIK
         +U9ufVpKSHqCZ9yP/byjHy2vALocYSjn8SUquu+XdtLYsJ7CMObXGDjt9oe3CEEpBv/3
         HrJKWI9kOMo/ETempNpwG2Sl7QH3ExVvG/AwCuIztLzejLb5pf6Fgh9cVHffyar/bsxd
         XGseNLbgMpSY/ynZoEM4hU9QeKhfQ4qRffoM+bSHD4uzepZYL4riOLlBhNgwdjGPcHIT
         yypQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738422907; x=1739027707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QqUogr6li+EQcK4KgEU6JhksjMQU+YKI3tRfrBxh9Ck=;
        b=ozo2tC9kk4EP4XK7gGfaja18XdoufjNMJxhM40scsXxjx64sbmYftXGdfipKDbqHb3
         pyLnD2ujYgpLWMNmWlFKtSdsM96+VGUADlZDwHEnuIfQk7Mg+Qpsdn8Xv+kCISvnjD0v
         +ToMXV2+8cegsr6RRiKe6apfcwd1Iu4BHP8vbsql+ZNjZE7y1qY2qwp7UCYzDCZRlv7h
         E2eTcH1e5oCKipuO/IKGr05ziUgyBrdhfzZZn4JbphzCE0i3/gNp+WQRL4UUUx1cZS0f
         3HLmXr98mk8f2QIfLCVpn3uN2G3wi+OOT7/sZ04XXlzq02WRBOSoDhzFewoqhjpmGcDE
         BOog==
X-Forwarded-Encrypted: i=1; AJvYcCVoixziA/f+FJT5U7Vg3qSsvPZZrXrPFJPX2t5MzjUE7Z22D0KvkxU41XtI0MV0r2TPD7HSs3q4Koklheo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHqDyhpx0Ts8gbx9YH55wzUxhcwkasx/KoidN2BPfgxZli2Qi8
	Ie6EYudoGbUm547C+VAvqVKkCny/A14FPk4nkKr9PEVnLI7vhOUCWXeOggFO+e+b/PU5ksJjhiF
	x3Avv9N3DVGCPkJAVSDRjg4M3uImEKvIE4Q2OXg==
X-Gm-Gg: ASbGncsI/uuK0xtAIQWWIb1hIr7+NRPUnxbXIRjFK5TjNdmI1uqaVGP//hWkRDn2++h
	GucnZtPLsAuUTeGkXfOsX4BHBoKZ8Mp1Rw8n9HmoiXq3yQBYL2Aaa+kdGVpmTlvlyO3TUdELvD3
	4=
X-Google-Smtp-Source: AGHT+IEaV7VfecG2k91AzuNc19uCZEV/4HVYuQHZQcoKg7q1LxaxbqmhJg4rOW4rp8U1tUb5bA/SK4fZn79dgHO+50s=
X-Received: by 2002:a05:6102:3e15:b0:4af:ba51:a25f with SMTP id
 ada2fe7eead31-4b9a5233a2bmr12955902137.20.1738422907554; Sat, 01 Feb 2025
 07:15:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250131112129.273288063@linuxfoundation.org>
In-Reply-To: <20250131112129.273288063@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Sat, 1 Feb 2025 20:44:56 +0530
X-Gm-Features: AWEUYZn186bX7d-ejOshMMFJpRDXth8s7NIOuvjxj2MaiDp-6eYGDEBP2ddGFag
Message-ID: <CA+G9fYtW7_LA+ZZ4=bw0m7V-UiSyQaztCw0YY4X45Efcjq5f1g@mail.gmail.com>
Subject: Re: [PATCH 5.10 000/136] 5.10.234-rc2 review
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

On Fri, 31 Jan 2025 at 16:52, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 5.10.234 release.
> There are 136 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Sun, 02 Feb 2025 11:21:01 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-=
5.10.234-rc2.gz
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
* kernel: 5.10.234-rc2
* git: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-=
rc.git
* git commit: 99689d3bdd980ed74fed764babc35d90522391ac
* git describe: v5.10.233-137-g99689d3bdd98
* test details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-5.10.y/build/v5.10=
.233-137-g99689d3bdd98

## Test Regressions (compared to v5.10.232-139-ge0db650ec963)

## Metric Regressions (compared to v5.10.232-139-ge0db650ec963)

## Test Fixes (compared to v5.10.232-139-ge0db650ec963)

## Metric Fixes (compared to v5.10.232-139-ge0db650ec963)

## Test result summary
total: 103553, pass: 67752, fail: 13776, skip: 21285, xfail: 740

## Build Summary
* arc: 12 total, 10 passed, 2 failed
* arm: 210 total, 210 passed, 0 failed
* arm64: 64 total, 64 passed, 0 failed
* i386: 50 total, 50 passed, 0 failed
* mips: 50 total, 44 passed, 6 failed
* parisc: 8 total, 0 passed, 8 failed
* powerpc: 48 total, 46 passed, 2 failed
* riscv: 24 total, 24 passed, 0 failed
* s390: 24 total, 24 passed, 0 failed
* sh: 22 total, 20 passed, 2 failed
* sparc: 16 total, 14 passed, 2 failed
* x86_64: 58 total, 58 passed, 0 failed

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
* kselftest-filesystems
* kselftest-filesystems-binderfs
* kselftest-filesystems-epoll
* kselftest-firmware
* kselftest-fpu
* kselftest-ftrace
* kselftest-futex
* kselftest-gpio
* kselftest-intel_pstate
* kselftest-ipc
* kselftest-kcmp
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
* ltp-filecaps
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
