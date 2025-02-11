Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3115234
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 00:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739233381; cv=none; b=s4dIzAGzF0lI1hefSV3huyPA593Ym09A9qcGgsWzuQqiUwOCQDMD/2fLhS4SzaO+Ylrk4ko2G6/+NGt3O2azl7/ZJBCnfAQn4rsvRWOiM12HXX4+72HtAvZfRgOI8p+MXxABgM4Z/S8LgsQmBUhsPbXq639T1CXZ8rVGsJ7o1zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739233381; c=relaxed/simple;
	bh=dAKuwdL16XcNqoJaxp8kyfzXAtfxR5fJrNBiEInTIzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZP6IF5HIAvm6rxRupV3tRWgPKgjLRBVZre29iYSnyqxHZjz2ybk732VjAism/+K7a+57Oz2dtxbnp4nyZiEzMaCOIbGdAinId5s8JuZAYnwlpKmdv/I09PE+tyjoxjDDrdg+DSoCjoghBo5o3jtndcFmwNuNDFOMEvhAeIfs/Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=zTr/fiWd; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="zTr/fiWd"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e5b3dbd6732so3945182276.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 16:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739233378; x=1739838178; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XgRW+jb8xL/yqaf5dv4uBNprZKUbytiPaosPPzbYj8o=;
        b=zTr/fiWdZiZ07q8r3ZULEQu1FO1A6fPazAH352d+G+u2Gsow3fxyEDYy6mC9JXEuBX
         SveWZs3hNRHfBo7xhNrdRCfMUae7DDKys0UicjTXaI5sGOS0we51sXaTNR67+Ly6ZAti
         O+yGszuSVm7pScS7pqyG0+m03JiDbKA6CVAr7wDpO8yMp/vC+IbF8pno/gQCSjES97D0
         enWOuL9DAbpRra5aMbXFqkxp/+E6FA95ulWeleqXp15kVhbDb04u+q1tIy9vxgjMQKnt
         xue2A2uPrXzcbJfaKEBDBkYmN0Y71sJNbY9VLBRwgmnPTvrWBrR43PW6VSReDewY6y6S
         XiNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739233378; x=1739838178;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XgRW+jb8xL/yqaf5dv4uBNprZKUbytiPaosPPzbYj8o=;
        b=s8uO8LbPDiAJfi6AXdeX1ueovYckJ+pQJZWvFqVRm0gxT0N5p1GtAvsDRM3tM2PM7D
         aEZarUoU4nBc2ivmSOAAEf6CRam7r0DVV0enuaKSKIrCbaZIWiMhzjmB7Uql+7H31DzX
         yXRplJr3FNAP+wAiQeDef/e/hwXE9SPYDKOeywVgKUS14QRIkRNiuGs6B8Wci6xzYIIV
         NWdPOJcIot1tHJgKHza/+pb7mMhatrLSm+RRiymeUSy1vM7wSqZPaEfKzrZ6/iE/egib
         gq/O4mppDz/NEZyMCSPj/4cEaq3D2/HCjdAV1PqnYKlwkV3siHVgdnohGrqk5oyYixy+
         hkUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzCDMLi+de3pmQgYRYjZ9Q/86FbsIZjLhowxAGA7TZjHzemwNVn/OZytjON7uz8mLrUHU+3R8yMcMPSdI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr78HFusjjeo/pjJ4VvjWcqb3wcc9OyVhXHIL6aasLvU8k3e5K
	PF/3YrSKrTODl8KWcp8IuM7kf0Q7lyuux+2DTwool8G/Klieh1/ePZnQbjugsJw=
X-Gm-Gg: ASbGncuVZsklF/QvYxgfgLGIrCtFSNlU7ajw6zCj+yrGli8pnFq/AXxqKxoSyI39Bo1
	xqpOEY8tM1tFRUkXyFsMXfYKrFcdF2Qexef1msycAvUaILQVChlNmlSOLhRDIntrhWKHt/Cux6e
	OvBQZKZOgg6m+tK9S2AEEXeHit/KSn9sPJCM7LuMcgDtog6mueTH77jZpDrdcMWrnbBjAOLz9Xz
	tQY5Zt7qc7Pmv9Cb56Q+1Mz3olWWOompzIZID+TWXhPNBdq+yn1OYYn4eMCmr3SzCu0EdN3gL16
	3Aw=
X-Google-Smtp-Source: AGHT+IET3XuWodAlagrxm8iuDillEgUV/nx7D30be+H1DPXeFO6mBrllo5/7tZ9E22QdIf5EyggISw==
X-Received: by 2002:a05:6902:1b01:b0:e5a:b05e:4da5 with SMTP id 3f1490d57ef6-e5b46292799mr13270555276.43.1739233378411;
        Mon, 10 Feb 2025 16:22:58 -0800 (PST)
Received: from ghost ([50.146.0.9])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e5b3a0f5353sm2917617276.0.2025.02.10.16.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 16:22:57 -0800 (PST)
Date: Mon, 10 Feb 2025 16:22:56 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Guo Ren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Bibo Mao <maobibo@loongson.cn>,
	Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Howard Chu <howardchu95@gmail.com>, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 5/7] perf trace beauty: Add syscalltbl.sh generating
 all system call tables
Message-ID: <Z6qYYC3LqXNZ6hMc@ghost>
References: <20250210165108.95894-1-irogers@google.com>
 <20250210165108.95894-6-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210165108.95894-6-irogers@google.com>

On Mon, Feb 10, 2025 at 08:51:06AM -0800, Ian Rogers wrote:
> Rather than generating individual syscall header files generate a
> single trace/beauty/generated/syscalltbl.c. In a syscalltbls array
> have references to each architectures tables along with the
> corresponding e_machine. When the 32-bit or 64-bit table is ambiguous,
> match the perf binary's type. For ARM32 don't use the arm64 32-bit
> table which is smaller. EM_NONE is present for is no machine matches.
> 
> Conditionally compile the tables, only having the appropriate 32 and
> 64-bit table. If ALL_SYSCALLTBL is defined all tables can be
> compiled.

Is there somewhere that the ALL_SYSCALLTBL could be documented? I talk
about this more in patch 7, but if this also could help perf report
display the correct syscall names, then ALL_SYSCALLTBL maybe should be
the default?

> 
> Signed-off-by: Ian Rogers <irogers@google.com>
> Reviewed-by: Howard Chu <howardchu95@gmail.com>
> ---
>  tools/perf/Makefile.perf              |   9 +
>  tools/perf/trace/beauty/syscalltbl.sh | 274 ++++++++++++++++++++++++++
>  2 files changed, 283 insertions(+)
>  create mode 100755 tools/perf/trace/beauty/syscalltbl.sh
> 
> diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
> index 55d6ce9ea52f..793e702f9aaf 100644
> --- a/tools/perf/Makefile.perf
> +++ b/tools/perf/Makefile.perf
> @@ -559,6 +559,14 @@ beauty_ioctl_outdir := $(beauty_outdir)/ioctl
>  # Create output directory if not already present
>  $(shell [ -d '$(beauty_ioctl_outdir)' ] || mkdir -p '$(beauty_ioctl_outdir)')
>  
> +syscall_array := $(beauty_outdir)/syscalltbl.c
> +syscall_tbl := $(srctree)/tools/perf/trace/beauty/syscalltbl.sh
> +syscall_tbl_data := $(srctree)/tools/scripts/syscall.tbl \
> +	$(wildcard $(srctree)/tools/perf/arch/*/entry/syscalls/syscall*.tbl)
> +
> +$(syscall_array): $(syscall_tbl) $(syscall_tbl_data)
> +	$(Q)$(SHELL) '$(syscall_tbl)' $(srctree)/tools $@
> +
>  fs_at_flags_array := $(beauty_outdir)/fs_at_flags_array.c
>  fs_at_flags_tbl := $(srctree)/tools/perf/trace/beauty/fs_at_flags.sh
>  
> @@ -878,6 +886,7 @@ build-dir   = $(or $(__build-dir),.)
>  
>  prepare: $(OUTPUT)PERF-VERSION-FILE $(OUTPUT)common-cmds.h archheaders \
>  	arm64-sysreg-defs \
> +	$(syscall_array) \
>  	$(fs_at_flags_array) \
>  	$(clone_flags_array) \
>  	$(drm_ioctl_array) \
> diff --git a/tools/perf/trace/beauty/syscalltbl.sh b/tools/perf/trace/beauty/syscalltbl.sh
> new file mode 100755
> index 000000000000..635924dc5f59
> --- /dev/null
> +++ b/tools/perf/trace/beauty/syscalltbl.sh
> @@ -0,0 +1,274 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Generate all syscall tables.
> +#
> +# Each line of the syscall table should have the following format:
> +#
> +# NR ABI NAME [NATIVE] [COMPAT]
> +#
> +# NR       syscall number
> +# ABI      ABI name
> +# NAME     syscall name
> +# NATIVE   native entry point (optional)
> +# COMPAT   compat entry point (optional)
> +
> +set -e
> +
> +usage() {
> +       cat >&2 <<EOF
> +usage: $0 <TOOLS DIRECTORY> <OUTFILE>
> +
> +  <TOOLS DIRECTORY>    path to kernel tools directory
> +  <OUTFILE>            output header file
> +EOF
> +       exit 1
> +}
> +
> +if [ $# -ne 2 ]; then
> +       usage
> +fi
> +tools_dir=$1
> +outfile=$2
> +
> +build_tables() {
> +	infile="$1"
> +	outfile="$2"
> +	abis=$(echo "($3)" | tr ',' '|')
> +	e_machine="$4"
> +
> +	if [ ! -f "$infile" ]
> +	then
> +		echo "Missing file $infile"
> +		exit 1
> +	fi
> +	sorted_table=$(mktemp /tmp/syscalltbl.XXXXXX)
> +	grep -E "^[0-9]+[[:space:]]+$abis" "$infile" | sort -n > "$sorted_table"
> +
> +	echo "static const char *const syscall_num_to_name_${e_machine}[] = {" >> "$outfile"
> +	# the params are: nr abi name entry compat
> +	# use _ for intentionally unused variables according to SC2034
> +	while read -r nr _ name _ _; do
> +		echo "	[$nr] = \"$name\"," >> "$outfile"
> +	done < "$sorted_table"
> +	echo "};" >> "$outfile"
> +
> +	echo "static const uint16_t syscall_sorted_names_${e_machine}[] = {" >> "$outfile"
> +
> +	# When sorting by name, add a suffix of 0s upto 20 characters so that
> +	# system calls that differ with a numerical suffix don't sort before
> +	# those without. This default behavior of sort differs from that of
> +	# strcmp used at runtime. Use sed to strip the trailing 0s suffix
> +	# afterwards.
> +	grep -E "^[0-9]+[[:space:]]+$abis" "$infile" | awk '{printf $3; for (i = length($3); i < 20; i++) { printf "0"; }; print " " $1}'| sort | sed 's/\([a-zA-Z1-9]\+\)0\+ \([0-9]\+\)/\1 \2/' > "$sorted_table"
> +	while read -r name nr; do
> +		echo "	$nr,	/* $name */" >> "$outfile"
> +	done < "$sorted_table"
> +	echo "};" >> "$outfile"
> +
> +	rm -f "$sorted_table"
> +}
> +
> +rm -f "$outfile"
> +cat >> "$outfile" <<EOF
> +#include <elf.h>
> +#include <stdint.h>
> +#include <asm/bitsperlong.h>
> +#include <linux/kernel.h>
> +
> +struct syscalltbl {
> +       const char *const *num_to_name;
> +       const uint16_t *sorted_names;
> +       uint16_t e_machine;
> +       uint16_t num_to_name_len;
> +       uint16_t sorted_names_len;
> +};
> +
> +#if defined(ALL_SYSCALLTBL) || defined(__alpha__)
> +EOF
> +build_tables "$tools_dir/perf/arch/alpha/entry/syscalls/syscall.tbl" "$outfile" common,64 EM_ALPHA
> +cat >> "$outfile" <<EOF
> +#endif // defined(ALL_SYSCALLTBL) || defined(__alpha__)
> +
> +#if defined(ALL_SYSCALLTBL) || defined(__arm__) || defined(__aarch64__)
> +EOF
> +build_tables "$tools_dir/perf/arch/arm/entry/syscalls/syscall.tbl" "$outfile" common,32,oabi EM_ARM
> +build_tables "$tools_dir/perf/arch/arm64/entry/syscalls/syscall_64.tbl" "$outfile" common,64,renameat,rlimit,memfd_secret EM_AARCH64
> +cat >> "$outfile" <<EOF
> +#endif // defined(ALL_SYSCALLTBL) || defined(__arm__) || defined(__aarch64__)
> +
> +#if defined(ALL_SYSCALLTBL) || defined(__csky__)
> +EOF
> +build_tables "$tools_dir/scripts/syscall.tbl" "$outfile" common,32,csky,time32,stat64,rlimit EM_CSKY
> +cat >> "$outfile" <<EOF
> +#endif // defined(ALL_SYSCALLTBL) || defined(__csky__)
> +
> +#if defined(ALL_SYSCALLTBL) || defined(__mips__)
> +EOF
> +build_tables "$tools_dir/perf/arch/mips/entry/syscalls/syscall_n64.tbl" "$outfile" common,64,n64 EM_MIPS
> +cat >> "$outfile" <<EOF
> +#endif // defined(ALL_SYSCALLTBL) || defined(__mips__)
> +
> +#if defined(ALL_SYSCALLTBL) || defined(__hppa__)
> +#if __BITS_PER_LONG != 64
> +EOF
> +build_tables "$tools_dir/perf/arch/parisc/entry/syscalls/syscall.tbl" "$outfile" common,32 EM_PARISC
> +echo "#else" >> "$outfile"
> +build_tables "$tools_dir/perf/arch/parisc/entry/syscalls/syscall.tbl" "$outfile" common,64 EM_PARISC
> +cat >> "$outfile" <<EOF
> +#endif //__BITS_PER_LONG != 64
> +#endif // defined(ALL_SYSCALLTBL) || defined(__hppa__)
> +
> +#if defined(ALL_SYSCALLTBL) || defined(__powerpc__) || defined(__powerpc64__)
> +EOF
> +build_tables "$tools_dir/perf/arch/powerpc/entry/syscalls/syscall.tbl" "$outfile" common,32,nospu EM_PPC
> +build_tables "$tools_dir/perf/arch/powerpc/entry/syscalls/syscall.tbl" "$outfile" common,64,nospu EM_PPC64
> +cat >> "$outfile" <<EOF
> +#endif // defined(ALL_SYSCALLTBL) || defined(__powerpc__) || defined(__powerpc64__)
> +
> +#if defined(ALL_SYSCALLTBL) || defined(__riscv)
> +#if __BITS_PER_LONG != 64
> +EOF
> +build_tables "$tools_dir/scripts/syscall.tbl" "$outfile" common,32,riscv,memfd_secret EM_RISCV
> +echo "#else" >> "$outfile"
> +build_tables "$tools_dir/scripts/syscall.tbl" "$outfile" common,64,riscv,rlimit,memfd_secret EM_RISCV
> +cat >> "$outfile" <<EOF
> +#endif //__BITS_PER_LONG != 64
> +#endif // defined(ALL_SYSCALLTBL) || defined(__riscv)
> +#if defined(ALL_SYSCALLTBL) || defined(__s390x__)
> +EOF
> +build_tables "$tools_dir/perf/arch/s390/entry/syscalls/syscall.tbl" "$outfile" common,64,renameat,rlimit,memfd_secret EM_S390
> +cat >> "$outfile" <<EOF
> +#endif // defined(ALL_SYSCALLTBL) || defined(__s390x__)
> +
> +#if defined(ALL_SYSCALLTBL) || defined(__sh__)
> +EOF
> +build_tables "$tools_dir/perf/arch/sh/entry/syscalls/syscall.tbl" "$outfile" common,32 EM_SH
> +cat >> "$outfile" <<EOF
> +#endif // defined(ALL_SYSCALLTBL) || defined(__sh__)
> +
> +#if defined(ALL_SYSCALLTBL) || defined(__sparc64__) || defined(__sparc__)
> +#if __BITS_PER_LONG != 64
> +EOF
> +build_tables "$tools_dir/perf/arch/sparc/entry/syscalls/syscall.tbl" "$outfile" common,32 EM_SPARC
> +echo "#else" >> "$outfile"
> +build_tables "$tools_dir/perf/arch/sparc/entry/syscalls/syscall.tbl" "$outfile" common,64 EM_SPARC
> +cat >> "$outfile" <<EOF
> +#endif //__BITS_PER_LONG != 64
> +#endif // defined(ALL_SYSCALLTBL) || defined(__sparc64__) || defined(__sparc__)
> +
> +#if defined(ALL_SYSCALLTBL) || defined(__i386__) || defined(__x86_64__)
> +EOF
> +build_tables "$tools_dir/perf/arch/x86/entry/syscalls/syscall_32.tbl" "$outfile" common,32,i386 EM_386
> +build_tables "$tools_dir/perf/arch/x86/entry/syscalls/syscall_64.tbl" "$outfile" common,64 EM_X86_64
> +cat >> "$outfile" <<EOF
> +#endif // defined(ALL_SYSCALLTBL) || defined(__i386__) || defined(__x86_64__)
> +
> +#if defined(ALL_SYSCALLTBL) || defined(__xtensa__)
> +EOF
> +build_tables "$tools_dir/perf/arch/xtensa/entry/syscalls/syscall.tbl" "$outfile" common,32 EM_XTENSA
> +cat >> "$outfile" <<EOF
> +#endif // defined(ALL_SYSCALLTBL) || defined(__xtensa__)
> +
> +#if __BITS_PER_LONG != 64
> +EOF
> +build_tables "$tools_dir/scripts/syscall.tbl" "$outfile" common,32 EM_NONE
> +echo "#else" >> "$outfile"
> +build_tables "$tools_dir/scripts/syscall.tbl" "$outfile" common,64 EM_NONE
> +echo "#endif //__BITS_PER_LONG != 64" >> "$outfile"
> +
> +build_outer_table() {
> +       e_machine=$1
> +       outfile="$2"
> +       cat >> "$outfile" <<EOF
> +       {
> +	      .num_to_name = syscall_num_to_name_$e_machine,
> +	      .sorted_names = syscall_sorted_names_$e_machine,
> +	      .e_machine = $e_machine,
> +	      .num_to_name_len = ARRAY_SIZE(syscall_num_to_name_$e_machine),
> +	      .sorted_names_len = ARRAY_SIZE(syscall_sorted_names_$e_machine),
> +       },
> +EOF
> +}
> +
> +cat >> "$outfile" <<EOF
> +static const struct syscalltbl syscalltbls[] = {
> +#if defined(ALL_SYSCALLTBL) || defined(__alpha__)
> +EOF
> +build_outer_table EM_ALPHA "$outfile"
> +cat >> "$outfile" <<EOF
> +#endif // defined(ALL_SYSCALLTBL) || defined(__alpha__)
> +
> +#if defined(ALL_SYSCALLTBL) || defined(__arm__) || defined(__aarch64__)
> +EOF
> +build_outer_table EM_ARM "$outfile"
> +build_outer_table EM_AARCH64 "$outfile"
> +cat >> "$outfile" <<EOF
> +#endif // defined(ALL_SYSCALLTBL) || defined(__arm__) || defined(__aarch64__)
> +
> +#if defined(ALL_SYSCALLTBL) || defined(__csky__)
> +EOF
> +build_outer_table EM_CSKY "$outfile"
> +cat >> "$outfile" <<EOF
> +#endif // defined(ALL_SYSCALLTBL) || defined(__csky__)
> +
> +#if defined(ALL_SYSCALLTBL) || defined(__mips__)
> +EOF
> +build_outer_table EM_MIPS "$outfile"
> +cat >> "$outfile" <<EOF
> +#endif // defined(ALL_SYSCALLTBL) || defined(__mips__)
> +
> +#if defined(ALL_SYSCALLTBL) || defined(__hppa__)
> +EOF
> +build_outer_table EM_PARISC "$outfile"
> +cat >> "$outfile" <<EOF
> +#endif // defined(ALL_SYSCALLTBL) || defined(__hppa__)
> +
> +#if defined(ALL_SYSCALLTBL) || defined(__powerpc__) || defined(__powerpc64__)
> +EOF
> +build_outer_table EM_PPC "$outfile"
> +build_outer_table EM_PPC64 "$outfile"
> +cat >> "$outfile" <<EOF
> +#endif // defined(ALL_SYSCALLTBL) || defined(__powerpc__) || defined(__powerpc64__)
> +
> +#if defined(ALL_SYSCALLTBL) || defined(__riscv)
> +EOF
> +build_outer_table EM_RISCV "$outfile"
> +cat >> "$outfile" <<EOF
> +#endif // defined(ALL_SYSCALLTBL) || defined(__riscv)
> +
> +#if defined(ALL_SYSCALLTBL) || defined(__s390x__)
> +EOF
> +build_outer_table EM_S390 "$outfile"
> +cat >> "$outfile" <<EOF
> +#endif // defined(ALL_SYSCALLTBL) || defined(__s390x__)
> +
> +#if defined(ALL_SYSCALLTBL) || defined(__sh__)
> +EOF
> +build_outer_table EM_SH "$outfile"
> +cat >> "$outfile" <<EOF
> +#endif // defined(ALL_SYSCALLTBL) || defined(__sh__)
> +
> +#if defined(ALL_SYSCALLTBL) || defined(__sparc64__) || defined(__sparc__)
> +EOF
> +build_outer_table EM_SPARC "$outfile"
> +cat >> "$outfile" <<EOF
> +#endif // defined(ALL_SYSCALLTBL) || defined(__sparc64__) || defined(__sparc__)
> +
> +#if defined(ALL_SYSCALLTBL) || defined(__i386__) || defined(__x86_64__)
> +EOF
> +build_outer_table EM_386 "$outfile"
> +build_outer_table EM_X86_64 "$outfile"
> +cat >> "$outfile" <<EOF
> +#endif // defined(ALL_SYSCALLTBL) || defined(__i386__) || defined(__x86_64__)
> +
> +#if defined(ALL_SYSCALLTBL) || defined(__xtensa__)
> +EOF
> +build_outer_table EM_XTENSA "$outfile"
> +cat >> "$outfile" <<EOF
> +#endif // defined(ALL_SYSCALLTBL) || defined(__xtensa__)
> +EOF
> +build_outer_table EM_NONE "$outfile"
> +cat >> "$outfile" <<EOF
> +};
> +EOF
> -- 
> 2.48.1.502.g6dc24dfdaf-goog
> 
