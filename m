Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0EBB2550B3
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 15:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746028258; cv=none; b=qgjtCBFRbj3KWlJPGusHqE/6JGdyUNHw5nxZQ7rSuRczwdv/YrfiFMEspkW8MhX1+2DUMWSZMIFz6v8Y3P7/9tqdE0lutKYuV7gQy7kyJct1QGzGCNv7ZsvJ53delMefMDo8foQ8LZB7HF9T/hT+GvDHIqi8ZW0Fxjk4ichT978=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746028258; c=relaxed/simple;
	bh=1mCRoSl/WXj9EpqFdvrhBKzBNrOH0XyKXi5WpfLxlMY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mm6OgzIi2a1/squ+VF12gbd/iferWC1/JqZehtFDBMcSlzFWOrE9u2HtVCf25LcOxM18f3IiwV1eFtuB/mn6AO8fXikdzLaRR7yIG9VDi3hufkxheN4T92nk2kTya41nc6wVc0GfGMbDzfXfhECs02rUzQxwpbYMoQTt86VRwwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VIQdTAVB; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VIQdTAVB"
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-86d5e42c924so6810607241.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 08:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746028256; x=1746633056; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uJAx/WqHCy0T5aZ2CQVyjJWgqdYiF6JZTKOjqwwgqJM=;
        b=VIQdTAVBtDVI7YIZD3cKaQhlGq0Js46Ssbf+QBafTsrXlJTy4017gCuFPrky/NHyi9
         5Fx1H/KgJLAvuzqj5x9W3cUWg5u1wFbKXLROg8tWk0kBfhLPBWVxuEYrbccG6qI7x/jN
         iPulFNnRKGB9h3ys/OxhfG9McnW/1fyc3AoRhCS8w5Bg3Q7yF/O76Ji00mbpQQERPgqz
         wF1LepOvQAMhtdIf+3f798BcjVQLnu1coI93eBocj1z+xpJwRUcpptNQxEhejTPBYOxt
         OBfJTzciF+YhYLwrRH56NI16t6/g9RSGGtCubSQNvGpmxaqaUQC2BGGO+qqCUtg7/C7L
         HXxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746028256; x=1746633056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uJAx/WqHCy0T5aZ2CQVyjJWgqdYiF6JZTKOjqwwgqJM=;
        b=KHgWdS6k88XXswNmCW4bSETVU/CJNmDWi5PqBSBtH8BRGlKybZF2u3Ek8rRDOM7MXB
         oc4z6xsKnhm1bW1HJIQ3gmXRIN+CXFx7FwkgjSRteTXi285euczyIkaVZ5xVRDtgUPnF
         i0FHob5TudpzAV947EgR7Y3+KhbCjNyWDOpZ8UVaTEANf800i80BFNqDVq5omfxekxcO
         O0c2Vs9VjIEk0GsTXqa7wdOzzclyC1/gX+1EWcAKbmfewhl1ASXxCi7P6Iat6/8KBtml
         RQIia91CCxBQMwFLNFpS0tHSs3JBClBgpnHozQhQ7TE5JCdDJ8ZMK57XvKmenLHJQL5T
         pxkg==
X-Forwarded-Encrypted: i=1; AJvYcCWj028lWxMKo63NnKQv1Hl8km78Jhl2+JIwabI8S7Wxq2vRLiXT75zy/+6btrNb7galnw4p3hnN6CSdl0U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFYLj3XtnPO4Z+TwJuTB9IhnRUovHpTJzKG8i+nvr6L5mn1y8b
	IjqhGmVuhgFxiVd1I6n9ik04NDqxnh93UWYI/SmhWMLn0aSlVHmN6FRu7hTEEknFiJjTqGgidYm
	m8owGiTVr8ZSbVwQdBfAkawIBfC17zkly2msdjg==
X-Gm-Gg: ASbGnct0/RYYWKkaubBSF+OkXMOP+ZAoq0oAXOW5Sy0MLIwZrBJN8NsvD8rvdRdZKja
	qGw54qafHxcRiOqgL0DMmneCQ42YtgJPk0+WoyF7gb1/VjrVcgEy07MwPYKSA8uaFqcGfEbEodu
	8ErSg14grrURdcJDllZ5jOgDQwnYsnOhjjDfGo1xuep/hmFj8eCNb/ofQ=
X-Google-Smtp-Source: AGHT+IGGsdPw3RT8avgBXabu5//S4MiovS5cVHy8pMESNsoOOlpTQkhJUXpjjxf/3yA7TyQdDfUlJPcOKqFKVhOhzFg=
X-Received: by 2002:a05:6102:2ac7:b0:4c1:71b6:6c with SMTP id
 ada2fe7eead31-4dad359944emr3077320137.7.1746028255694; Wed, 30 Apr 2025
 08:50:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429161107.848008295@linuxfoundation.org>
In-Reply-To: <20250429161107.848008295@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 30 Apr 2025 21:20:44 +0530
X-Gm-Features: ATxdqUFMXca-djiqqc25Inw-41HaeAOh1iaxf6BhFyDDx8VbrmE3g622gxZ0Igc
Message-ID: <CA+G9fYtGFVgM+RFNZnOWyvkCq3iZvOj4Npo6Pxnt=5f=EHhgvw@mail.gmail.com>
Subject: Re: [PATCH 5.10 000/286] 5.10.237-rc1 review
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

On Tue, 29 Apr 2025 at 22:41, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 5.10.237 release.
> There are 286 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Thu, 01 May 2025 16:10:15 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-=
5.10.237-rc1.gz
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
* kernel: 5.10.237-rc1
* git: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-=
rc.git
* git commit: ce0fd5a9f1a4e7c9d2c59cffe033ca7d1d7e1688
* git describe: v5.10.236-287-gce0fd5a9f1a4
* test details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-5.10.y/build/v5.10=
.236-287-gce0fd5a9f1a4

## Test Regressions (compared to v5.10.235-229-g5b68aafded4a)

## Metric Regressions (compared to v5.10.235-229-g5b68aafded4a)

## Test Fixes (compared to v5.10.235-229-g5b68aafded4a)

## Metric Fixes (compared to v5.10.235-229-g5b68aafded4a)

## Test result summary
total: 45273, pass: 32910, fail: 3086, skip: 9042, xfail: 235

## Build Summary
* arc: 5 total, 5 passed, 0 failed
* arm: 102 total, 102 passed, 0 failed
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
