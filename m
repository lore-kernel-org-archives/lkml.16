Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B0D279903
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 16:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744648121; cv=none; b=Fk2Z2sf5GXxpVuqKbjDZZ7zHJ2EXTp7aiakYJuZ9l3gwaxMFuXGJDy6BCiDMmwFcNTDKQT7isANABefGhb/CXHYnslEN8WfP1qk/OYDZMbidoJin4MYM7E7HaNQPuC9TVbM6n0MkezS0gNdHPEncZp7lbKDfr82wV3FZnI9Swz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744648121; c=relaxed/simple;
	bh=EAvviy7NYDzPXrtTpDrit4MXQHLdNiBY+08kfb3anYo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FN+ZJY5nWrb924piMVNNydOpNJUb0CDOS49pd+SWdHAbzuLTQJprof2alnWkCIx081N1DnfdTYEz1VbZg5Wxm7LTDngFRgkQW7cq1fLoSuqSXK3xCC1fy/WU8ndwXsnem9c3YR/SYaL932Eib18PFuMpMr+t9LZfxCGp9r7TIhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P31sX87L; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P31sX87L"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso34636965e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 09:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744648118; x=1745252918; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qTKO9vAqmynoPPCZdzu4Se732LpKeln0OCtsTh96Cx8=;
        b=P31sX87Lhoi8LdU+H8lkr14Ib1qIIlKAfsOFz6gdv8FmJg1IgsmPAfujxRCgK/hx4I
         6N4ACyqyARY3Hf7jY0lvxyOuyJ9LPfeUTDAFsa2afFaBDsnqZSXhxhIRu7DHBfMQovM1
         idLH/LN13q7DY3HjlHnX/pdMzzWdOFXTz8gd8bdKHz3GBwMY/Ng+J7/LdFGGzqcFcpTd
         BI2rqUxrlGhaZk+tIz3WvGQpAgMYsUrveZg+rojaJLSXnP+G1HeuATIydxPcSXX37OlR
         XoRUkhBzMJQCn/tMk5i6CsOCKPBmagdSJzNuHV0y+00zXb1KWNya3FFcpBVJb1a08i3g
         t1tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744648118; x=1745252918;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qTKO9vAqmynoPPCZdzu4Se732LpKeln0OCtsTh96Cx8=;
        b=PFdkUFd8/9D0poXDH6wMAFhEtYrZZrLgGSfjN+ucc7072uCPMjJ5uruwQNuQokCqAn
         RVF26XX6kX6PvNP5IusEqAXeKU8b2zJwdN20K6HsL+NyZBc4/1bCnqAyS5h7BQCaex9s
         d7XWAhm1eIh0crGFYLsG3MMkdbglI6tbrH+RKXcJTpMt8IHeY3cDY5w0ickdEVGv5orF
         KtX+AjTMksDpDt4frxRG2319ax+FIR3AgTzIcW4zo+Qx3f0LfkwvaAU1JGQAa/HOWFbU
         CbYwNkdy3qz7PqS8RrCOsiXS8ZnGYXoVHRH8dbex+gI38aBgkNpF7/SfVgttEgnZCIEs
         9OGw==
X-Forwarded-Encrypted: i=1; AJvYcCXvuijsHOcd1CjzOZ5nRxKxy6RgKIx9mMaSlc8muM9U8rkMZ4J3L0OZX1wfbW1r1lnTruKW12HSU5/LBJI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBMESMKHtPnTElHLBxMFS+7yG8mbUXSex1WBMOCeYREcnH2gGj
	YaO3ZjxE+CoE9uEply4Ou+e2UPaNfCACPDWYaCXNoTfqM6awuIT4Nrx31y/lMCc=
X-Gm-Gg: ASbGnctzspzFv4Ay9Uosxi5OXArrUqP5jgcMdGWu7d6cZSXQKLv1F9UUBcFvTkUoY81
	XMWlzi1MdwAmTg//IYmNgN1YP8o92w8mVW3eCXj1Pbzn4ohO8jyTAOHqSkDaPRYEiC4zTf8Ym74
	LQNBgwTqBBgI/Y+XU98RnxTcpYnI4Ba/jAfW2Qr7zrucQ5v4Pe/arM2FKFkfIFuaK5zgT/uSGTj
	L3FUczgHveOvP8S4PTUI0p+0e8UzdIveg0Rfby6h7Hv6kXXvlaUDePxiTwaE9QVjALfTWHkiZoV
	4d+pvi9D53eEwhcV5wCYODGbH0oPespr3jqqpfCnflk=
X-Google-Smtp-Source: AGHT+IHomYBkrfRArIbBujX/I3y2mxJugC6/rOr7PZ7x4MMpTarYPx/m2CKQvVHOZS3ocFeJW5iO+A==
X-Received: by 2002:a05:600c:b90:b0:43d:fa58:8377 with SMTP id 5b1f17b1804b1-43f3a9afb11mr111404215e9.32.1744648117820;
        Mon, 14 Apr 2025 09:28:37 -0700 (PDT)
Received: from [192.168.1.3] ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43cdfdsm11702585f8f.61.2025.04.14.09.28.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 09:28:37 -0700 (PDT)
Message-ID: <f950fe96-34d3-4631-b04d-4a1584f4c2f1@linaro.org>
Date: Mon, 14 Apr 2025 17:28:36 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] tools headers: Update the syscall table with the
 kernel sources
To: Namhyung Kim <namhyung@kernel.org>, Arnd Bergmann <arnd@linaro.org>
Cc: Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-perf-users@vger.kernel.org,
 linux-arch@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Ian Rogers <irogers@google.com>, Kan Liang <kan.liang@linux.intel.com>
References: <20250410001125.391820-1-namhyung@kernel.org>
 <20250410001125.391820-6-namhyung@kernel.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250410001125.391820-6-namhyung@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/04/2025 1:11 am, Namhyung Kim wrote:
> To pick up the changes in:
> 
>    c4a16820d9019940 fs: add open_tree_attr()
>    2df1ad0d25803399 x86/arch_prctl: Simplify sys_arch_prctl()
>    e632bca07c8eef1d arm64: generate 64-bit syscall.tbl
> 
> This is basically to support the new open_tree_attr syscall.  But it
> also needs to update asm-generic unistd.h header to get the new syscall
> number.  And arm64 unistd.h header was converted to use the generic
> 64-bit header.
> 
> Addressing this perf tools build warning:
> 
>    Warning: Kernel ABI header differences:
>      diff -u tools/scripts/syscall.tbl scripts/syscall.tbl
>      diff -u tools/perf/arch/x86/entry/syscalls/syscall_32.tbl arch/x86/entry/syscalls/syscall_32.tbl
>      diff -u tools/perf/arch/x86/entry/syscalls/syscall_64.tbl arch/x86/entry/syscalls/syscall_64.tbl
>      diff -u tools/perf/arch/powerpc/entry/syscalls/syscall.tbl arch/powerpc/kernel/syscalls/syscall.tbl
>      diff -u tools/perf/arch/s390/entry/syscalls/syscall.tbl arch/s390/kernel/syscalls/syscall.tbl
>      diff -u tools/perf/arch/mips/entry/syscalls/syscall_n64.tbl arch/mips/kernel/syscalls/syscall_n64.tbl
>      diff -u tools/perf/arch/arm/entry/syscalls/syscall.tbl arch/arm/tools/syscall.tbl
>      diff -u tools/perf/arch/sh/entry/syscalls/syscall.tbl arch/sh/kernel/syscalls/syscall.tbl
>      diff -u tools/perf/arch/sparc/entry/syscalls/syscall.tbl arch/sparc/kernel/syscalls/syscall.tbl
>      diff -u tools/perf/arch/xtensa/entry/syscalls/syscall.tbl arch/xtensa/kernel/syscalls/syscall.tbl
>      diff -u tools/arch/arm64/include/uapi/asm/unistd.h arch/arm64/include/uapi/asm/unistd.h
>      diff -u tools/include/uapi/asm-generic/unistd.h include/uapi/asm-generic/unistd.h
> 
> Please see tools/include/uapi/README for further details.
> 
> Cc: linux-arch@vger.kernel.org
> Signed-off-by: Namhyung Kim <namhyung@kernel.org>
> ---
>   tools/arch/arm64/include/uapi/asm/unistd.h    | 24 +------------------
>   tools/include/uapi/asm-generic/unistd.h       |  4 +++-
>   .../perf/arch/arm/entry/syscalls/syscall.tbl  |  1 +
>   .../arch/mips/entry/syscalls/syscall_n64.tbl  |  1 +
>   .../arch/powerpc/entry/syscalls/syscall.tbl   |  1 +
>   .../perf/arch/s390/entry/syscalls/syscall.tbl |  1 +
>   tools/perf/arch/sh/entry/syscalls/syscall.tbl |  1 +
>   .../arch/sparc/entry/syscalls/syscall.tbl     |  1 +
>   .../arch/x86/entry/syscalls/syscall_32.tbl    |  3 ++-
>   .../arch/x86/entry/syscalls/syscall_64.tbl    |  1 +
>   .../arch/xtensa/entry/syscalls/syscall.tbl    |  1 +
>   tools/scripts/syscall.tbl                     |  1 +
>   12 files changed, 15 insertions(+), 25 deletions(-)
> 
> diff --git a/tools/arch/arm64/include/uapi/asm/unistd.h b/tools/arch/arm64/include/uapi/asm/unistd.h
> index 9306726337fe005e..df36f23876e863ff 100644
> --- a/tools/arch/arm64/include/uapi/asm/unistd.h
> +++ b/tools/arch/arm64/include/uapi/asm/unistd.h
> @@ -1,24 +1,2 @@
>   /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> -/*
> - * Copyright (C) 2012 ARM Ltd.
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License version 2 as
> - * published by the Free Software Foundation.
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> - * GNU General Public License for more details.
> - *
> - * You should have received a copy of the GNU General Public License
> - * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> - */
> -
> -#define __ARCH_WANT_RENAMEAT
> -#define __ARCH_WANT_NEW_STAT
> -#define __ARCH_WANT_SET_GET_RLIMIT
> -#define __ARCH_WANT_TIME32_SYSCALLS
> -#define __ARCH_WANT_MEMFD_SECRET
> -
> -#include <asm-generic/unistd.h>
> +#include <asm/unistd_64.h>

Hi Namhyung,

Since we're not including the generic syscalls here anymore we now need 
to generate the syscall header file for the Perf build to work (build 
error pasted at the end for reference).

I had a go at adding the rule for it, but I saw that we'd need to pull 
in quite a bit from the kernel so it was blurring the lines about the 
separation of the tools/ folder. For example this file has the arm64 defs:

  arch/arm64/kernel/Makefile.syscalls

To make this common part of the makefile work:

  scripts/Makefile.asm-headers

Maybe we can just copy or reimplement Makefile.syscalls, but I'm not 
even sure if Makefile.asm-headers will work with the tools/ build 
structure so maybe that has to be re-implemented too. Adding Arnd to see 
what he thinks.

As far as I can tell this is a separate issue to the work that Charlie 
and Ian did recently to build all arch's syscall numbers into Perf to 
use for reporting, as this is requires a single header for the build.

Thanks
James

---

In file included from /usr/include/aarch64-linux-gnu/sys/syscall.h:24,
                  from evsel.c:4:
/home/jamcla02/workspace/linux/linux/tools/arch/arm64/include/uapi/asm/unistd.h:2:10: 
fatal error: asm/unistd_64.h: No such file or directory
     2 | #include <asm/unistd_64.h>
       |          ^~~~~~~~~~~~~~~~~



