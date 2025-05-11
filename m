Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1168D156F28
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 17:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746985599; cv=none; b=D0meE2oysJAzaXnfO2pMpWrwyVNtE5CqdSrch0AX/mjLxUbn/pjKnjRQRMLI5EIVCSQ6PTXvxPOhy8bO4mZOSDlJ5F6OHehuEIyth4qNjhqx1p9MKFa+7FDWxOGCa6qP80lm8UZpH7a1emLVxfeuyhcGq8vHWdV4qv2QxAvoAdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746985599; c=relaxed/simple;
	bh=8OwMFLhhIArPMkXspYwNl3MrKVbZe0hfpWIx92ZBjpA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JJt4jNKz3Me3w4pUhuXIHfJvCZMsHDnTeQlMGcaN8cS2eaT30kHwsY+mbuGpQdYZhtRFs7eVXnsoniWgYCD2rIp4RYNrKr5tXipPG6GrWnSoDIKYpAHaDMmDD0tWlCeo5Iy4koPdJsz2z0/zWRuN8GvdMuOvT172QTQQ7s2Lf8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EExrEJDC; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EExrEJDC"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so26431745e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 10:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746985595; x=1747590395; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=71Yr4Tj5FXklh2M1YhEvgAExOFERp4o4g1avjYW/63k=;
        b=EExrEJDCMaBSdxxnT4M3QzrsZf/8ReX4+X7DVHS+KTdP/pGc7z92CBbbAwhJMGaNGk
         8Y0IDMfxYgHM/fc9bHiq0sboq3qzDTqbF7a9008ioHBwMNrXR2pcd3su0MSNTcjjfYbc
         76bm7F0RAJJhYOJCYNEbTy+yKFfglbWpEfiJCrXYFWO6iXwITmvDy9sMsSI5wnPRIVN8
         ObOL5svSqK4gHlyF3PmrolbN2SgGG/UEivcCbpR0kSiFMC/bV7WfFKo1YpVXbUdnelzf
         P+HZXFFWLAeqPJIr9pyL984LbIbHhMbJeivGOfGaNQr9q2oRk2ccc4BDw5P2gfq2TkKj
         xDEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746985595; x=1747590395;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=71Yr4Tj5FXklh2M1YhEvgAExOFERp4o4g1avjYW/63k=;
        b=DwrCVMNq6OHkJw7p7ujjwpeHjfuvBmC9QWl/Ld1EvkKSYmmIcld9gppwydt1pJpTAI
         tdDufkaaUUCXrMKTE2clBx6FPISDF86kAxCTcXCrMRXDZRkJ4xDY2ux2mNePkm76+kXv
         CCN3zhAxHSzsezluU6s8a8iCF7w9Ccgk/H9f/Hq2PpCWen3vXw2jKW6SjnrPqO2tb48r
         E2ZZuEcJP3CVPxYb62UysNJW8imFHk33SDvOcCY1AcbmiRYveLU5hQKCUmUjnW2UUnpg
         1rO9RMB3lsnKfV59uTaGI6Fr1ERXEO/4cbXsVT04jxWfrQuo1eoj/2eP0YwMrt5N6cQR
         4uhw==
X-Forwarded-Encrypted: i=1; AJvYcCXUfq5V74cqlyJxYW8a8mAEi57zHucMdTLFotV2YrRYsXszQSR6UNGPDIbhialBF0uOkxISVv1nsHQdmJI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTM14qaq4N5phOmIORlZFVjbJiKZuU+nPqb2aduHkGkftHlRa9
	/HcKsLuH5gX0cY8CA/Lb8p8/adgKNDA3WPmnEOTvg485TIu17K3qTZZ0xx7dht8=
X-Gm-Gg: ASbGncsxt6TS6hQhPojAQGROuOvp9BwltXnHyqV5wc2rlRI1w10jhdIWWsp/5d16E0M
	vtRHasYtBXTy5mNcf+6yMsOirELWUZvs0n6Bl3NAoPSb01Rra8WFlVNeBXilHWpeAO6WTAYdFpV
	88WycO0lYG0iuYtcmWAP4BAw7PtJHFpy0vvuzE/IQ0T7UYhZ2WSa3KdPrycfCCM6ywRiCfg2+Lm
	uRTrfq4iEUoFpTYYsJ/1f+ztTZeeDs4xeJAbatPFGzNc2vMvF1CXUSQrT7nMeV9YYMRbaGj2GRr
	iz+1kasKIUol6Yzpg18Pb5UDz8OXx7/eOxj/vAvOWhS/tvu2MlgQSA==
X-Google-Smtp-Source: AGHT+IE8IsDzl9+c2njAtHrivPeEXcUCgMYEQX14/fVv7Y4VnuVvC558uuC8GvC4j0Fr4IRA4QuPdg==
X-Received: by 2002:a5d:64ab:0:b0:3a1:f635:1133 with SMTP id ffacd0b85a97d-3a1f64220b7mr8846248f8f.7.1746985595204;
        Sun, 11 May 2025 10:46:35 -0700 (PDT)
Received: from [192.168.1.3] ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ecb46sm9977125f8f.30.2025.05.11.10.46.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 May 2025 10:46:34 -0700 (PDT)
Message-ID: <95bd54bf-09b7-4444-94a7-87ab9a3035e6@linaro.org>
Date: Sun, 11 May 2025 18:46:33 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: make -C tools/perf build-test failing on aarch64
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
 Namhyung Kim <namhyung@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Ian Rogers <irogers@google.com>, Jiri Olsa <jolsa@kernel.org>,
 Kan Liang <kan.liang@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-perf-users@vger.kernel.org
References: <aB6vFFcRErPVt7p9@x1>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aB6vFFcRErPVt7p9@x1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/05/2025 2:42 am, Arnaldo Carvalho de Melo wrote:
> Hi,
> 
> 	I noticed that upstream is failing on aarch64:
> 
> acme@raspberrypi:~/git/perf-tools-next $ uname -a
> Linux raspberrypi 6.12.25+rpt-rpi-2712 #1 SMP PREEMPT Debian 1:6.12.25-1+rpt1 (2025-04-30) aarch64 GNU/Linux
> acme@raspberrypi:~/git/perf-tools-next $ grep -m1 Model /proc/cpuinfo
> Model		: Raspberry Pi 5 Model B Rev 1.1
> acme@raspberrypi:~/git/perf-tools-next $
> acme@raspberrypi:~/git/perf-tools-next $ git log --oneline -1 ; time make -C tools/perf build-test
> cd17a9b1a779 (HEAD -> perf-tools-next, number/perf-tools-next, number/HEAD) perf test demangle-ocaml: Switch to using dso__demangle_sym()
> make: Entering directory '/home/acme/git/perf-tools-next/tools/perf'
> - tarpkg: ./tests/perf-targz-src-pkg .
> make[1]: *** [tests/make:351: tarpkg] Error 2
> make: *** [Makefile:109: build-test] Error 2
> make: Leaving directory '/home/acme/git/perf-tools-next/tools/perf'
> 
> real	0m12.130s
> user	0m12.653s
> sys	0m2.091s
> acme@raspberrypi:~/git/perf-tools-next $
> 
> I noticed that it is using some files from outside tools/, i.e. kernel
> files, so I tried adding those (and its dependencies) to the
> tools/perf/MANIFEST, but stumbled at this point:
> 
> acme@raspberrypi:~/git/perf-tools-next $ git diff
> diff --git a/tools/perf/MANIFEST b/tools/perf/MANIFEST
> index 364b55b00b48..3fe627c4b599 100644
> --- a/tools/perf/MANIFEST
> +++ b/tools/perf/MANIFEST
> @@ -28,3 +28,6 @@ scripts/bpf_doc.py
>   tools/bpf/bpftool
>   kernel/bpf/disasm.c
>   kernel/bpf/disasm.h
> +scripts/Kbuild.include
> +scripts/Makefile.asm-headers
> +include/uapi/asm-generic/Kbuild
> acme@raspberrypi:~/git/perf-tools-next $
> 
> To test it directly:
> 
> acme@raspberrypi:~/git/perf-tools-next $ sh -x tools/perf/tests/perf-targz-src-pkg tools/perf
> + set -e
> + PERF=tools/perf
> + cd tools/perf/../..
> + make perf-targz-src-pkg
>    ARCHIVE perf-6.15.0-rc5.tar.gz
> + ls -rt perf-6.15.0-rc5.tar.gz
> + TARBALL=perf-6.15.0-rc5.tar.gz
> + mktemp -d
> + TMP_DEST=/tmp/tmp.wzVpK2Gmvw
> + tar xf perf-6.15.0-rc5.tar.gz -C /tmp/tmp.wzVpK2Gmvw
> + rm -f perf-6.15.0-rc5.tar.gz
> + cd -
> + make -C /tmp/tmp.wzVpK2Gmvw/perf-6.15.0-rc5/tools/perf
> make: Entering directory '/tmp/tmp.wzVpK2Gmvw/perf-6.15.0-rc5/tools/perf'
>    BUILD:   Doing 'make -j4' parallel build
> 
> Auto-detecting system features:
> ...                                   libdw: [ on  ]
> ...                                   glibc: [ on  ]
> ...                                  libelf: [ on  ]
> ...                                 libnuma: [ on  ]
> ...                  numa_num_possible_cpus: [ on  ]
> ...                                 libperl: [ on  ]
> ...                               libpython: [ on  ]
> ...                               libcrypto: [ on  ]
> ...                             libcapstone: [ on  ]
> ...                               llvm-perf: [ on  ]
> ...                                    zlib: [ on  ]
> ...                                    lzma: [ on  ]
> ...                               get_cpuid: [ OFF ]
> ...                                     bpf: [ on  ]
> ...                                  libaio: [ on  ]
> ...                                 libzstd: [ on  ]
> 
>    PERF_VERSION = 6.15.rc5.gcd17a9b1a779
>    GEN     common-cmds.h
>    GEN     /tmp/tmp.wzVpK2Gmvw/perf-6.15.0-rc5/tools/perf/arch/arm64/include/generated/asm/sysreg-defs.h
>    CC      jvmti/libjvmti.o
>    GEN     perf-archive
>    GEN     perf-iostat
>    CC      dlfilters/dlfilter-test-api-v0.o
>    CC      dlfilters/dlfilter-test-api-v2.o
>    CC      dlfilters/dlfilter-show-cycles.o
>    CC      jvmti/jvmti_agent.o
>    CC      jvmti/libstring.o
>    CC      jvmti/libctype.o
>    MKDIR   /tmp/tmp.wzVpK2Gmvw/perf-6.15.0-rc5/tools/perf/libapi/fd/
>    CC      /tmp/tmp.wzVpK2Gmvw/perf-6.15.0-rc5/tools/perf/libapi/fd/array.o
> make[4]: *** No rule to make target '/tmp/tmp.wzVpK2Gmvw/perf-6.15.0-rc5/tools/perf/libperf/arch/arm64/include/generated/uapi/asm/unistd_64.h'.  Stop.
> make[3]: *** [Makefile:108: uapi-asm-generic] Error 2
> make[2]: *** [Makefile.perf:973: /tmp/tmp.wzVpK2Gmvw/perf-6.15.0-rc5/tools/perf/libperf/libperf.a] Error 2
> make[2]: *** Waiting for unfinished jobs....
>    INSTALL /tmp/tmp.wzVpK2Gmvw/perf-6.15.0-rc5/tools/perf/libapi/include/api/cpu.h
>    MKDIR   /tmp/tmp.wzVpK2Gmvw/perf-6.15.0-rc5/tools/perf/libapi/fs/
>    MKDIR   /tmp/tmp.wzVpK2Gmvw/perf-6.15.0-rc5/tools/perf/libapi/fs/
>    CC      /tmp/tmp.wzVpK2Gmvw/perf-6.15.0-rc5/tools/perf/libapi/fs/fs.o
>    CC      /tmp/tmp.wzVpK2Gmvw/perf-6.15.0-rc5/tools/perf/libapi/fs/tracing_path.o
>    LD      jvmti/jvmti-in.o
>    CC      /tmp/tmp.wzVpK2Gmvw/perf-6.15.0-rc5/tools/perf/libapi/cpu.o
>    LD      /tmp/tmp.wzVpK2Gmvw/perf-6.15.0-rc5/tools/perf/libapi/fd/libapi-in.o
>    CC      /tmp/tmp.wzVpK2Gmvw/perf-6.15.0-rc5/tools/perf/libapi/debug.o
>    INSTALL /tmp/tmp.wzVpK2Gmvw/perf-6.15.0-rc5/tools/perf/libapi/include/api/debug.h
>    INSTALL /tmp/tmp.wzVpK2Gmvw/perf-6.15.0-rc5/tools/perf/libapi/include/api/io.h
>    INSTALL /tmp/tmp.wzVpK2Gmvw/perf-6.15.0-rc5/tools/perf/libapi/include/api/io_dir.h
>    MKDIR   /tmp/tmp.wzVpK2Gmvw/perf-6.15.0-rc5/tools/perf/libapi/fs/
>    CC      /tmp/tmp.wzVpK2Gmvw/perf-6.15.0-rc5/tools/perf/libapi/fs/cgroup.o
>    CC      /tmp/tmp.wzVpK2Gmvw/perf-6.15.0-rc5/tools/perf/libapi/str_error_r.o
>    INSTALL /tmp/tmp.wzVpK2Gmvw/perf-6.15.0-rc5/tools/perf/libapi/include/api/fd/array.h
>    INSTALL /tmp/tmp.wzVpK2Gmvw/perf-6.15.0-rc5/tools/perf/libapi/include/api/fs/fs.h
>    INSTALL /tmp/tmp.wzVpK2Gmvw/perf-6.15.0-rc5/tools/perf/libapi/include/api/fs/tracing_path.h
>    INSTALL libapi_headers
>    LD      /tmp/tmp.wzVpK2Gmvw/perf-6.15.0-rc5/tools/perf/libapi/fs/libapi-in.o
>    LD      /tmp/tmp.wzVpK2Gmvw/perf-6.15.0-rc5/tools/perf/libapi/libapi-in.o
>    AR      /tmp/tmp.wzVpK2Gmvw/perf-6.15.0-rc5/tools/perf/libapi/libapi.a
> make[1]: *** [Makefile.perf:290: sub-make] Error 2
> make: *** [Makefile:76: all] Error 2
> make: Leaving directory '/tmp/tmp.wzVpK2Gmvw/perf-6.15.0-rc5/tools/perf'
> acme@raspberrypi:~/git/perf-tools-next $
> 
> I think this is related to:
> 
> commit bfb713ea53c746b07ae69fe97fa9b5388e4f34f9 (perf-tools)
> Author: James Clark <james.clark@linaro.org>
> Date:   Thu Apr 17 14:55:50 2025 +0100
> 
>      perf tools: Fix arm64 build by generating unistd_64.h
> 
> Can you please take a look?
> 
> Thanks a lot,
> 
> - Arnaldo

Hmm yeah looks like it's caused by that. I'm travelling tomorrow but 
I'll try to take a look.

Thanks
James

