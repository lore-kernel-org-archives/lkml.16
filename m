Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDF5214A8E
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 10:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743156111; cv=none; b=E67QcpL4wLoK0+MLxcPDWteEp4UpBSoZ0gIO7hCAuPh1P4r+PaiEm7lW/QzDAOhXDWalW1iB6yXcRQNHl6G9J/7TIzNw8xZ+NeKrzgE4y/RsA7Nu4hfDBjB7oxgjqWw3Yma9FQw3ixD5bzMSBH2m1kAzYVyV0sh3bZHJKo964w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743156111; c=relaxed/simple;
	bh=TAEdwrUyn9kPBfK7OOZcmsCuGPNnNLkqPPkNDGTKkj4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rWCYsUmaIHyZFyumLS/m80wzanz67/S8dDRsuycFKMB/1z982UwY/Zj0li9AgqqDLC/w/d4hZPkZDnjClYHxSG5Awv+uWsrYHJcu+FRercJJIhoQENGGJXXPzEc1TWfjyRI5j8jw2sDuVIPJwjIFeqA9kbR4exYWxuRO7c6bZsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t5Y4EiYp; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t5Y4EiYp"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5241abb9761so811962e0c.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 03:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743156108; x=1743760908; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hy0b3ef7tRBEX4cJpPaVoQh3iegxY1zj0tUH/YADkAI=;
        b=t5Y4EiYpssz1FNrQrXeG1sd9JqYMT8D5AOgv7w01mn4EjPoFt4X57z4br08yGTroVe
         UG/H5AgY18v2fNAryLK5y2QecShi/+njzlB7WYkkHmrAE/sUqMZ0jWK4jurqSsgev3oH
         TrNAvbhrLQCTGkV6XE/j6F7JgghwXfQyOwrg6t7l2PizKU8ZDyi5uGyM7IY5YoCLN7mj
         7btNz+X4Z/7A3r7s+hn4vaghXYyqHwdMNQ7D72F7c0LRk6FEjYyZ1/elKC2urKcvLv+1
         Y040reCV0QLCo395vQQ9YjGkvU1i7hODBClqPDHa3ToPYwrjxRG6UI5bu4J7nauO3tDz
         DrAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743156108; x=1743760908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hy0b3ef7tRBEX4cJpPaVoQh3iegxY1zj0tUH/YADkAI=;
        b=ZbFiOsahty/3PEg976J/4+HXQdWhaLKeJX22g+IKgFofPE+ZCon4Tq7/eyszJPz+0q
         FbulVI4/NfjtIKo/BwOeJY7E/yQw6/iDT3i+eRWVCGhpA7qilqdxZVkcKZH3Jym7T8rJ
         uQeXNLI8qh6kYzi7pV4Y9ifJ16L+tNWm1wVgTACxkhpJJMWjwqu9lsKDX1/Ogy112g5B
         S+ccr0nSGXFhI5U/zX03gW7jhv2xWdEa/UeenUeoAl/kUHiaTz58YRFPy4vfJi4a6kM6
         tRnyzVWJQyKWiNYNnM41Ythn9zwB3z/qxjA3qusMZedapDLQ6MoQ5O+ULfTs15OLWxQo
         M4Vg==
X-Forwarded-Encrypted: i=1; AJvYcCW9QfjBqKgACmJ5cmqfmlEW9+rjJpgO30maUqaXe6E8J/SgRawnPb05G/ZRAmn9VKSH/zjx8cYjf4825wQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+K02kL9slZAfUB4lIF5fMxCvdX9ky2efXUGKGmKHpaGS+3/Dk
	hd0NpNBoi9FrWKYnalfhzPb002eYuJ9tPP5HT/8WEw/EBA4Opp1DXA0ZWcyp0QAPaBtO6JywmTf
	TdCGDVjW6kVwnp19Uq9zcUrnrUQxheMGv34ngYg==
X-Gm-Gg: ASbGncvY267GqzEgemYY7h0l64cxGoQuC/BbIA+ASVZjVIeMiwFpZWLPCiqTSphs0T+
	+LF9BKXsm7wRMUyICdgZvn3W3WGN0eUtMBNzp0DIc+HLs88Eq+n24YlVGjuYBEWt+bmSHWiU5dV
	xWXWhXfLTF9FcRrzQCq7LHOYoivUiFIam1gUEE0bncTuqZdZ4NUy9HIpnDRCk=
X-Google-Smtp-Source: AGHT+IFtROEWRg79IGDLc0rRT+rbEMKi8ZlgwalunWQkzYQSnh9mC3YGIgViI3XB5GGoj5M99BwEITd7NGTa0RHkaLA=
X-Received: by 2002:a05:6122:3d0e:b0:523:9ee7:7f8e with SMTP id
 71dfb90a1353d-526009144f9mr5547735e0c.4.1743156107633; Fri, 28 Mar 2025
 03:01:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250326154546.724728617@linuxfoundation.org>
In-Reply-To: <20250326154546.724728617@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 28 Mar 2025 15:31:35 +0530
X-Gm-Features: AQ5f1JpQB4dRotLGNTjOBzHAHFolf1GRaUeE_3Fa2NXTiSNL3tVJxULU2L8PMXA
Message-ID: <CA+G9fYvqdsfwnPNaP1rGoDV=KayU0ivo9=3ixPao01FSr-YGjQ@mail.gmail.com>
Subject: Re: [PATCH 6.12 000/115] 6.12.21-rc2 review
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

On Wed, 26 Mar 2025 at 21:17, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.12.21 release.
> There are 115 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Fri, 28 Mar 2025 15:45:30 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-=
6.12.21-rc2.gz
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
* kernel: 6.12.21-rc2
* git: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-=
rc.git
* git commit: f5ef0867777d85f346f9f134c67999eda52c7611
* git describe: v6.12.19-348-gf5ef0867777d
* test details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.12.y/build/v6.12=
.19-348-gf5ef0867777d

## Test Regressions (compared to v6.12.19-232-g981e6790e185)

## Metric Regressions (compared to v6.12.19-232-g981e6790e185)

## Test Fixes (compared to v6.12.19-232-g981e6790e185)

## Metric Fixes (compared to v6.12.19-232-g981e6790e185)

## Test result summary
total: 130475, pass: 107490, fail: 4077, skip: 18846, xfail: 62

## Build Summary
* arc: 6 total, 5 passed, 1 failed
* arm: 143 total, 137 passed, 6 failed
* arm64: 58 total, 54 passed, 4 failed
* i386: 22 total, 19 passed, 3 failed
* mips: 38 total, 33 passed, 5 failed
* parisc: 5 total, 3 passed, 2 failed
* powerpc: 44 total, 43 passed, 1 failed
* riscv: 27 total, 24 passed, 3 failed
* s390: 26 total, 16 passed, 3 failed, 7 skipped
* sh: 6 total, 5 passed, 1 failed
* sparc: 5 total, 3 passed, 2 failed
* x86_64: 50 total, 49 passed, 1 failed

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
