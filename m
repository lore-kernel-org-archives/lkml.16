Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2283F202F67
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747298691; cv=none; b=dpNsebh95q2Wp4A+t/eIXFM5Vhz8WXwpL8tZxRhmW+iPY+nLZBRW/+qnul12wYxZWa+UoIBtPrQ0auHIrP2TTi/L9lfSg9II8G+vWH6h72qiBkLqRuQec4cjpsAkcYrsFg5s/A1PRRE0fqUy/M5La6o5bSvSJblMJGembeBLSxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747298691; c=relaxed/simple;
	bh=Xo2SRw2A4bD2f6Uhv08ysreCT+n6tRqi+U4bDd6L9uU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bY62wziUfa9f/cW/vhoX72T3IDn8waFI7cpz5x695+pdv2S44fvX+hswIZfxNSQBDiMjh2OAhRRetKPXuHrwmge4TMvU3FRvvF392Eq8466FZErC4CRp555Xz70+SRwcGk49tiP8K0VsB6Hc26l1vFFwPuRv2umM1vtXUMPHOac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=OsIbPiBo; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="OsIbPiBo"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7423fadbe77so668562b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 01:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1747298687; x=1747903487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VhHmyZbMTo2sbKx2W59Hr1f+gzuxwkICtc+JRuVj7a8=;
        b=OsIbPiBoCJRXjR1FxI1irmgi9059c+qRLKtTyKOCeCiTMrVTK0Ab4eq/+a9dNTby9y
         Hehd+mRPAxJOWWW0kwRccCBFzAdt3Kh+ZMQpSOjR2OsIC/IOrJay+D4sl/6fxGyMFXXE
         DcIrTDQ/JZeV4cgJDZ9wj0iPoelzZukhWnGix9Hm+Nq/fSkDZlmYEE6Zsqpw+YUdb8bJ
         fuYJ6sESAIPx2nqBZQq0gEvEzI2ILK3zBtlSQhn9ha1kaqiVdxFO6zef/Yhuak623Cw0
         D3K/0cX25v5h757Y25aTKwLAbKhzsh42gIk5LD21CrNFJVwxIOLnsvVUcWvg3Z8yjBje
         lS/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747298687; x=1747903487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VhHmyZbMTo2sbKx2W59Hr1f+gzuxwkICtc+JRuVj7a8=;
        b=EDfFBhWKCXGsyMc8fhxprXwo1CVwZ7qXic/Fy0MJnFh3v3LHSRthQWmTLdzSEN30J/
         M/uKsoDFjSLzdGdUyyD3REz1nn4zlOMTM3qN8cIEMoymrw5WK10KNAxhSYmM6awpqf4o
         x3wfm855/y/CoTm9zykSKRpl2A5A99g8HUd4X/rXqv3AOSCZifLnKqHZ5B/LXjqAzEcy
         6728sbtuqXrOjOVWcLecyrJHgZf5OYbjHJFpK1mW8ZBF6kNXEo6h2QyYo0VAjEM830dn
         PiHdD6fAdAx4tLEzTUoya3Q8nEiKMCxGqGWEky761dartJ0VEeF0JwgkE80tJC/ECloX
         6hcg==
X-Forwarded-Encrypted: i=1; AJvYcCU0iVS5uf8HKovDK9ojR5cy7laUHJgoirr3js9P0lDVJx6z4IxT1w8ADF1os6muKnkRAq7Zg8wlssBYs1Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YznNraA1RhNjVpO8NqGDVep7Na6ASKVVtEc9HFFH27G43Mc+etR
	l3sknTUGz40KDasMC8NxKzqScmYgcRSiz8/IjS22FYALYoXT4rvJ0/IcoXDSNo8=
X-Gm-Gg: ASbGncsD4BmSU7TI0sAd+Em341lRPey6AZFlSwVD1kI+O+qswp07FGZ4XtZglTk3/0V
	s8p5kbXlFdY5n8sFPazjojbz5uUGOgfJE5fs6FQ3KJkwHR1sEKERzqlcny0DKkKbHCmZNREP+3L
	Grui2zvGxp8b2I/EVNCMcmoAQgRT6as3JgesblIhhZpHr7oHacTxaIypDMdF+QPO0i477GL7+kv
	yNw2t6M5Sp9P+gCWCtBdcdygvPawitNQ9NaKNXuDYPMvkMLwn9RvL7IMcW9vCeZVxUG/RufLJJy
	6ZN5ZdmGXYXuv6G0t/TQXH1mVKy/IzBU7McpxaxG2MopSBrf18a8WOO9VRO0l6ZmJyaEMz8U3q+
	cexUHoR4PNGRutEtD9kUFvWc8iA9F1SuLQqcyR6jDLlo=
X-Google-Smtp-Source: AGHT+IFzUOEfaBvL5eMWUGGYP7iU4mKgWs84O9+M/gf+YEsnk0IJJ0j2jvVnRtfiBNyBkTU80DY2RA==
X-Received: by 2002:a05:6a20:2d06:b0:1f5:7280:1cf2 with SMTP id adf61e73a8af0-2161152b045mr2161115637.12.1747298687202;
        Thu, 15 May 2025 01:44:47 -0700 (PDT)
Received: from localhost.localdomain (59-120-179-172.hinet-ip.hinet.net. [59.120.179.172])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237704025sm11234247b3a.13.2025.05.15.01.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 01:44:46 -0700 (PDT)
From: Chiang Brian <chiang.brian@inventec.com>
To: chiang.brian@inventec.com
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	corbet@lwn.net,
	jdelvare@suse.com,
	linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux@roeck-us.net,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com
Subject: Re: [PATCH v7 2/2] hwmon: (pmbus/tps53679) Add support for TPS53685
Date: Thu, 15 May 2025 16:37:06 +0800
Message-Id: <20250515083706.1554823-1-chiang.brian@inventec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250515081449.1433772-3-chiang.brian@inventec.com>
References: <20250515081449.1433772-3-chiang.brian@inventec.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 14/03/2025 07:11, Chiang Brian wrote:
>
> On 14/03/2025 04:28, Chiang Brian wrote:
> > Add undocumented tps53685 into compatible in dt-bindings
> > 
> > Signed-off-by: Chiang Brian <chiang.brian@inventec.com>
> > ---
> >  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
> > index fadbd3c041c8..c98d69facb48 100644
> > --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> > +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> > @@ -380,6 +380,8 @@ properties:
> >            - ti,tps53676
> >              # TI Dual channel DCAP+ multiphase controller TPS53679
> >            - ti,tps53679
> > +            # TI Dual channel DCAP+ multiphase controller TPS53685 with AMD-SVI3
> > +          - ti,tps53685
>
> There is no user of such compatible, so how can it be undocumented?

The following link is the patch which I would like to add support tps53685,
and I think it is the user of the compatible:
https://lore.kernel.org/lkml/20250314033040.3190642-1-chiang.brian@inventec.com/

On Thu, May 14, 2025 at 03:30:38AM GMT, Chiang Brian wrote:
> v6 -> v7:
>	 1. Modify the type of device_id from u16 to char *
>	 2. Run make.cross with ARCH nios2, powerpc, and riscv
>	 - Link to v6: https://lore.kernel.org/all/20250424132538.2004510-2-chiang.brian@inventec.corp-partner.google.com/

Here are the results of compiling with mentioned architectures

nios2:
~/linux$ COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-13.3.0 ~/lkp-tests/kbuild/make.cross W=1 O=build_dir ARCH=nios2 SHELL=/bin/bash drivers/hwmon/pmbus/
Compiler will be installed in /home/docker-brian/0day
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
make --keep-going CONFIG_OF_ALL_DTBS=y CONFIG_DTC=y CROSS_COMPILE=/home/docker-brian/0day/gcc-13.3.0-nolibc/nios2-linux/bin/nios2-linux- --jobs=256 KCFLAGS= -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 O=build_dir ARCH=nios2 SHELL=/bin/bash drivers/hwmon/pmbus/
make[1]: Entering directory '/home/docker-brian/linux/build_dir'
  SYNC    include/config/auto.conf.cmd
  GEN     Makefile
  GEN     Makefile
  HOSTCC  scripts/dtc/dtc.o
  HOSTCC  scripts/dtc/flattree.o
  HOSTCC  scripts/dtc/fstree.o
  HOSTCC  scripts/dtc/data.o
  HOSTCC  scripts/dtc/livetree.o
  HOSTCC  scripts/dtc/treesource.o
  HOSTCC  scripts/dtc/srcpos.o
  HOSTCC  scripts/dtc/checks.o
  HOSTCC  scripts/dtc/util.o
  LEX     scripts/dtc/dtc-lexer.lex.c
  YACC    scripts/dtc/dtc-parser.tab.[ch]
  HOSTCC  scripts/dtc/libfdt/fdt.o
  HOSTCC  scripts/dtc/libfdt/fdt_ro.o
  HOSTCC  scripts/dtc/libfdt/fdt_wip.o
  HOSTCC  scripts/dtc/libfdt/fdt_sw.o
  HOSTCC  scripts/dtc/libfdt/fdt_rw.o
  HOSTCC  scripts/dtc/libfdt/fdt_strerror.o
  HOSTCC  scripts/dtc/libfdt/fdt_empty_tree.o
  HOSTCC  scripts/dtc/libfdt/fdt_addresses.o
  HOSTCC  scripts/dtc/libfdt/fdt_overlay.o
  HOSTCC  scripts/dtc/fdtoverlay.o
  WRAP    arch/nios2/include/generated/uapi/asm/ucontext.h
  WRAP    arch/nios2/include/generated/uapi/asm/auxvec.h
  WRAP    arch/nios2/include/generated/uapi/asm/bitsperlong.h
  WRAP    arch/nios2/include/generated/uapi/asm/bpf_perf_event.h
  WRAP    arch/nios2/include/generated/uapi/asm/errno.h
  WRAP    arch/nios2/include/generated/uapi/asm/fcntl.h
  WRAP    arch/nios2/include/generated/uapi/asm/ioctl.h
  WRAP    arch/nios2/include/generated/uapi/asm/ioctls.h
  WRAP    arch/nios2/include/generated/uapi/asm/ipcbuf.h
  WRAP    arch/nios2/include/generated/uapi/asm/mman.h
  WRAP    arch/nios2/include/generated/uapi/asm/msgbuf.h
  WRAP    arch/nios2/include/generated/uapi/asm/param.h
  WRAP    arch/nios2/include/generated/uapi/asm/poll.h
  WRAP    arch/nios2/include/generated/uapi/asm/posix_types.h
  WRAP    arch/nios2/include/generated/uapi/asm/resource.h
  WRAP    arch/nios2/include/generated/uapi/asm/sembuf.h
  WRAP    arch/nios2/include/generated/uapi/asm/setup.h
  UPD     include/generated/compile.h
  WRAP    arch/nios2/include/generated/uapi/asm/shmbuf.h
  WRAP    arch/nios2/include/generated/uapi/asm/siginfo.h
  WRAP    arch/nios2/include/generated/uapi/asm/socket.h
  WRAP    arch/nios2/include/generated/uapi/asm/sockios.h
  WRAP    arch/nios2/include/generated/uapi/asm/stat.h
  WRAP    arch/nios2/include/generated/uapi/asm/statfs.h
  WRAP    arch/nios2/include/generated/uapi/asm/termbits.h
  WRAP    arch/nios2/include/generated/uapi/asm/termios.h
  WRAP    arch/nios2/include/generated/uapi/asm/types.h
  SYSHDR  arch/nios2/include/generated/uapi/asm/unistd_32.h
  HOSTCC  scripts/dtc/dtc-lexer.lex.o
  HOSTCC  scripts/dtc/dtc-parser.tab.o
  WRAP    arch/nios2/include/generated/asm/cmpxchg.h
  WRAP    arch/nios2/include/generated/asm/extable.h
  WRAP    arch/nios2/include/generated/asm/kvm_para.h
  WRAP    arch/nios2/include/generated/asm/mcs_spinlock.h
  WRAP    arch/nios2/include/generated/asm/spinlock.h
  WRAP    arch/nios2/include/generated/asm/user.h
  WRAP    arch/nios2/include/generated/asm/text-patching.h
  WRAP    arch/nios2/include/generated/asm/atomic.h
  WRAP    arch/nios2/include/generated/asm/archrandom.h
  WRAP    arch/nios2/include/generated/asm/barrier.h
  WRAP    arch/nios2/include/generated/asm/bitops.h
  WRAP    arch/nios2/include/generated/asm/bug.h
  WRAP    arch/nios2/include/generated/asm/cfi.h
  WRAP    arch/nios2/include/generated/asm/compat.h
  WRAP    arch/nios2/include/generated/asm/current.h
  WRAP    arch/nios2/include/generated/asm/device.h
  WRAP    arch/nios2/include/generated/asm/div64.h
  WRAP    arch/nios2/include/generated/asm/dma-mapping.h
  WRAP    arch/nios2/include/generated/asm/dma.h
  WRAP    arch/nios2/include/generated/asm/emergency-restart.h
  WRAP    arch/nios2/include/generated/asm/exec.h
  WRAP    arch/nios2/include/generated/asm/ftrace.h
  WRAP    arch/nios2/include/generated/asm/futex.h
  WRAP    arch/nios2/include/generated/asm/hardirq.h
  WRAP    arch/nios2/include/generated/asm/hw_irq.h
  WRAP    arch/nios2/include/generated/asm/irq_regs.h
  WRAP    arch/nios2/include/generated/asm/irq_work.h
  WRAP    arch/nios2/include/generated/asm/kdebug.h
  WRAP    arch/nios2/include/generated/asm/kmap_size.h
  WRAP    arch/nios2/include/generated/asm/kprobes.h
  WRAP    arch/nios2/include/generated/asm/local.h
  WRAP    arch/nios2/include/generated/asm/local64.h
  WRAP    arch/nios2/include/generated/asm/mmiowb.h
  WRAP    arch/nios2/include/generated/asm/module.h
  WRAP    arch/nios2/include/generated/asm/module.lds.h
  WRAP    arch/nios2/include/generated/asm/msi.h
  WRAP    arch/nios2/include/generated/asm/pci.h
  WRAP    arch/nios2/include/generated/asm/percpu.h
  WRAP    arch/nios2/include/generated/asm/rqspinlock.h
  WRAP    arch/nios2/include/generated/asm/preempt.h
  WRAP    arch/nios2/include/generated/asm/runtime-const.h
  WRAP    arch/nios2/include/generated/asm/rwonce.h
  WRAP    arch/nios2/include/generated/asm/sections.h
  WRAP    arch/nios2/include/generated/asm/serial.h
  WRAP    arch/nios2/include/generated/asm/simd.h
  WRAP    arch/nios2/include/generated/asm/softirq_stack.h
  WRAP    arch/nios2/include/generated/asm/topology.h
  WRAP    arch/nios2/include/generated/asm/trace_clock.h
  WRAP    arch/nios2/include/generated/asm/vermagic.h
  WRAP    arch/nios2/include/generated/asm/vga.h
  WRAP    arch/nios2/include/generated/asm/word-at-a-time.h
  WRAP    arch/nios2/include/generated/asm/video.h
  WRAP    arch/nios2/include/generated/asm/xor.h
  SYSTBL  arch/nios2/include/generated/asm/syscall_table_32.h
  HOSTLD  scripts/dtc/fdtoverlay
  HOSTLD  scripts/dtc/dtc
  HOSTCC  scripts/kallsyms
  HOSTCC  scripts/asn1_compiler
  HOSTCC  scripts/mod/mk_elfconfig
  CC      scripts/mod/empty.o
  CC      scripts/mod/devicetable-offsets.s
  UPD     scripts/mod/devicetable-offsets.h
  MKELF   scripts/mod/elfconfig.h
  HOSTCC  scripts/mod/modpost.o
  HOSTCC  scripts/mod/file2alias.o
  HOSTCC  scripts/mod/sumversion.o
  HOSTCC  scripts/mod/symsearch.o
  HOSTLD  scripts/mod/modpost
  CC      kernel/bounds.s
  CHKSHA1 ../include/linux/atomic/atomic-arch-fallback.h
  CHKSHA1 ../include/linux/atomic/atomic-instrumented.h
  CHKSHA1 ../include/linux/atomic/atomic-long.h
  UPD     include/generated/bounds.h
  CC      arch/nios2/kernel/asm-offsets.s
  UPD     include/generated/asm-offsets.h
  CALL    ../scripts/checksyscalls.sh
  CC      drivers/hwmon/pmbus/pmbus_core.o
  CC      drivers/hwmon/pmbus/adm1275.o
  CC      drivers/hwmon/pmbus/adp1050.o
  CC      drivers/hwmon/pmbus/bpa-rs600.o
  CC      drivers/hwmon/pmbus/ina233.o
  CC      drivers/hwmon/pmbus/inspur-ipsps.o
  CC      drivers/hwmon/pmbus/ir35221.o
  CC      drivers/hwmon/pmbus/ir36021.o
  CC      drivers/hwmon/pmbus/isl68137.o
  CC      drivers/hwmon/pmbus/lm25066.o
  CC      drivers/hwmon/pmbus/ltc3815.o
  CC      drivers/hwmon/pmbus/ltc4286.o
  CC      drivers/hwmon/pmbus/max15301.o
  CC      drivers/hwmon/pmbus/max16601.o
  CC      drivers/hwmon/pmbus/max8688.o
  CC      drivers/hwmon/pmbus/mp2856.o
  CC      drivers/hwmon/pmbus/mp2888.o
  CC      drivers/hwmon/pmbus/mp2891.o
  CC      drivers/hwmon/pmbus/mp5023.o
  CC      drivers/hwmon/pmbus/mp9941.o
  CC      drivers/hwmon/pmbus/mpq7932.o
  CC      drivers/hwmon/pmbus/mpq8785.o
  CC      drivers/hwmon/pmbus/pm6764tr.o
  CC      drivers/hwmon/pmbus/stpddc60.o
  CC      drivers/hwmon/pmbus/tda38640.o
  CC      drivers/hwmon/pmbus/tps25990.o
  CC      drivers/hwmon/pmbus/tps40422.o
  CC      drivers/hwmon/pmbus/tps53679.o
  CC      drivers/hwmon/pmbus/tps546d24.o
  CC      drivers/hwmon/pmbus/ucd9200.o
  CC      drivers/hwmon/pmbus/xdp710.o
  CC      drivers/hwmon/pmbus/xdpe152c4.o
  CC      drivers/hwmon/pmbus/pim4328.o
  CC      drivers/hwmon/pmbus/crps.o
  AR      drivers/hwmon/pmbus/built-in.a
make[1]: Leaving directory '/home/docker-brian/linux/build_dir'

powerpc:
~/linux$ COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang-21 ~/lkp-tests/kbuild/make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/hwmon/pmbus/
Compiler will be installed in /home/docker-brian/0day
PATH=/home/docker-brian/0day/clang-21/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
make --keep-going CONFIG_OF_ALL_DTBS=y CONFIG_DTC=y LLVM=1 CROSS_COMPILE=powerpc64-linux- --jobs=256 KCFLAGS= -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/hwmon/pmbus/
make[1]: Entering directory '/home/docker-brian/linux/build_dir'
  GEN     Makefile
  HOSTCC  scripts/basic/fixdep
  SYSHDR  arch/powerpc/include/generated/uapi/asm/unistd_32.h
  SYSHDR  arch/powerpc/include/generated/uapi/asm/unistd_64.h
  SYSTBL  arch/powerpc/include/generated/asm/syscall_table_32.h
  SYSTBL  arch/powerpc/include/generated/asm/syscall_table_64.h
  SYSTBL  arch/powerpc/include/generated/asm/syscall_table_spu.h
  HOSTCC  scripts/dtc/dtc.o
  HOSTCC  scripts/dtc/flattree.o
  HOSTCC  scripts/dtc/fstree.o
  HOSTCC  scripts/dtc/data.o
  HOSTCC  scripts/dtc/livetree.o
  HOSTCC  scripts/dtc/treesource.o
  HOSTCC  scripts/dtc/srcpos.o
  HOSTCC  scripts/dtc/checks.o
  HOSTCC  scripts/dtc/util.o
  LEX     scripts/dtc/dtc-lexer.lex.c
  YACC    scripts/dtc/dtc-parser.tab.[ch]
  HOSTCC  scripts/dtc/libfdt/fdt.o
  HOSTCC  scripts/dtc/libfdt/fdt_ro.o
  HOSTCC  scripts/dtc/libfdt/fdt_wip.o
  HOSTCC  scripts/dtc/libfdt/fdt_sw.o
  HOSTCC  scripts/dtc/libfdt/fdt_rw.o
  HOSTCC  scripts/dtc/libfdt/fdt_strerror.o
  HOSTCC  scripts/dtc/libfdt/fdt_empty_tree.o
  HOSTCC  scripts/dtc/libfdt/fdt_addresses.o
  HOSTCC  scripts/dtc/libfdt/fdt_overlay.o
  HOSTCC  scripts/dtc/fdtoverlay.o
  HOSTCC  scripts/dtc/dtc-lexer.lex.o
  HOSTCC  scripts/dtc/dtc-parser.tab.o
  HOSTLD  scripts/dtc/fdtoverlay
  HOSTLD  scripts/dtc/dtc
  HOSTCC  scripts/kallsyms
  HOSTCC  scripts/sorttable
  HOSTCC  scripts/asn1_compiler
  HOSTCC  scripts/mod/mk_elfconfig
  CC      scripts/mod/empty.o
  CC      scripts/mod/devicetable-offsets.s
  MKELF   scripts/mod/elfconfig.h
  HOSTCC  scripts/mod/modpost.o
  HOSTCC  scripts/mod/sumversion.o
  HOSTCC  scripts/mod/symsearch.o
  HOSTCC  scripts/mod/file2alias.o
  HOSTLD  scripts/mod/modpost
  CC      kernel/bounds.s
  CHKSHA1 ../include/linux/atomic/atomic-arch-fallback.h
  CHKSHA1 ../include/linux/atomic/atomic-instrumented.h
  CHKSHA1 ../include/linux/atomic/atomic-long.h
  CC      arch/powerpc/kernel/asm-offsets.s
  CALL    ../scripts/checksyscalls.sh
  LDS     arch/powerpc/kernel/vdso/vdso32.lds
  VDSO32A arch/powerpc/kernel/vdso/sigtramp32-32.o
  VDSO32A arch/powerpc/kernel/vdso/gettimeofday-32.o
  VDSO32A arch/powerpc/kernel/vdso/datapage-32.o
  VDSO32A arch/powerpc/kernel/vdso/cacheflush-32.o
  VDSO32A arch/powerpc/kernel/vdso/note-32.o
  VDSO32A arch/powerpc/kernel/vdso/getcpu-32.o
  VDSO32A arch/powerpc/kernel/vdso/getrandom-32.o
  VDSO32A arch/powerpc/kernel/vdso/vgetrandom-chacha-32.o
  VDSO32C arch/powerpc/kernel/vdso/vgettimeofday-32.o
  VDSO32C arch/powerpc/kernel/vdso/vgetrandom-32.o
  VDSO32A arch/powerpc/kernel/vdso/crtsavres-32.o
  VDSO32L arch/powerpc/kernel/vdso/vdso32.so.dbg
  VDSO32SYM include/generated/vdso32-offsets.h
  LDS     arch/powerpc/kernel/vdso/vdso64.lds
  VDSO64A arch/powerpc/kernel/vdso/sigtramp64-64.o
  VDSO64A arch/powerpc/kernel/vdso/gettimeofday-64.o
  VDSO64A arch/powerpc/kernel/vdso/datapage-64.o
  VDSO64A arch/powerpc/kernel/vdso/cacheflush-64.o
  VDSO64A arch/powerpc/kernel/vdso/note-64.o
  VDSO64A arch/powerpc/kernel/vdso/getcpu-64.o
  VDSO64A arch/powerpc/kernel/vdso/getrandom-64.o
  VDSO64A arch/powerpc/kernel/vdso/vgetrandom-chacha-64.o
  CC      arch/powerpc/kernel/vdso/vgettimeofday-64.o
  CC      arch/powerpc/kernel/vdso/vgetrandom-64.o
  VDSO64L arch/powerpc/kernel/vdso/vdso64.so.dbg
  VDSO64SYM include/generated/vdso64-offsets.h
  CC      drivers/hwmon/pmbus/pmbus_core.o
  CC      drivers/hwmon/pmbus/adm1275.o
  CC      drivers/hwmon/pmbus/adp1050.o
  CC      drivers/hwmon/pmbus/bpa-rs600.o
  CC      drivers/hwmon/pmbus/ina233.o
  CC      drivers/hwmon/pmbus/inspur-ipsps.o
  CC      drivers/hwmon/pmbus/ir35221.o
  CC      drivers/hwmon/pmbus/ir36021.o
  CC      drivers/hwmon/pmbus/isl68137.o
  CC      drivers/hwmon/pmbus/lm25066.o
  CC      drivers/hwmon/pmbus/ltc3815.o
  CC      drivers/hwmon/pmbus/ltc4286.o
  CC      drivers/hwmon/pmbus/max15301.o
  CC      drivers/hwmon/pmbus/max16601.o
  CC      drivers/hwmon/pmbus/max8688.o
  CC      drivers/hwmon/pmbus/mp2856.o
  CC      drivers/hwmon/pmbus/mp2888.o
  CC      drivers/hwmon/pmbus/mp2891.o
  CC      drivers/hwmon/pmbus/mp5023.o
  CC      drivers/hwmon/pmbus/mp9941.o
  CC      drivers/hwmon/pmbus/mpq7932.o
  CC      drivers/hwmon/pmbus/mpq8785.o
  CC      drivers/hwmon/pmbus/pm6764tr.o
  CC      drivers/hwmon/pmbus/tda38640.o
  CC      drivers/hwmon/pmbus/stpddc60.o
  CC      drivers/hwmon/pmbus/tps25990.o
  CC      drivers/hwmon/pmbus/tps40422.o
  CC      drivers/hwmon/pmbus/tps53679.o
  CC      drivers/hwmon/pmbus/tps546d24.o
  CC      drivers/hwmon/pmbus/ucd9200.o
  CC      drivers/hwmon/pmbus/xdp710.o
  CC      drivers/hwmon/pmbus/xdpe152c4.o
  CC      drivers/hwmon/pmbus/pim4328.o
  CC      drivers/hwmon/pmbus/crps.o
  AR      drivers/hwmon/pmbus/built-in.a
make[1]: Leaving directory '/home/docker-brian/linux/build_dir'

riscv:
~/linux$ COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-8.5.0 ~/lkp-tests/kbuild/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__ -fmax-errors=unlimited -fmax-warnings=unlimited' O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kernel/vendor_extensions/ drivers/acpi/apei/ drivers/hwmon/pmbus/ drivers/mfd/
Compiler will be installed in /home/docker-brian/0day
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
make --keep-going CONFIG_OF_ALL_DTBS=y CONFIG_DTC=y CROSS_COMPILE=/home/docker-brian/0day/gcc-8.5.0-nolibc/riscv64-linux/bin/riscv64-linux- --jobs=256 KCFLAGS= -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef C=1 CF=-fdiagnostic-prefix -D__CHECK_ENDIAN__ -fmax-errors=unlimited -fmax-warnings=unlimited O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kernel/vendor_extensions/ drivers/acpi/apei/ drivers/hwmon/pmbus/ drivers/mfd/
make[1]: Entering directory '/home/docker-brian/linux/build_dir'
  SYSHDR  arch/riscv/include/generated/uapi/asm/unistd_32.h
  GEN     Makefile
  SYSHDR  arch/riscv/include/generated/uapi/asm/unistd_64.h
  HOSTCC  scripts/basic/fixdep
  SYSTBL  arch/riscv/include/generated/asm/syscall_table_32.h
  SYSTBL  arch/riscv/include/generated/asm/syscall_table_64.h
  HOSTCC  scripts/dtc/dtc.o
  HOSTCC  scripts/dtc/flattree.o
  HOSTCC  scripts/dtc/fstree.o
  HOSTCC  scripts/dtc/data.o
  HOSTCC  scripts/dtc/livetree.o
  HOSTCC  scripts/dtc/treesource.o
  HOSTCC  scripts/dtc/srcpos.o
  HOSTCC  scripts/dtc/checks.o
  HOSTCC  scripts/dtc/util.o
  LEX     scripts/dtc/dtc-lexer.lex.c
  YACC    scripts/dtc/dtc-parser.tab.[ch]
  HOSTCC  scripts/dtc/libfdt/fdt.o
  HOSTCC  scripts/dtc/libfdt/fdt_ro.o
  HOSTCC  scripts/dtc/libfdt/fdt_wip.o
  HOSTCC  scripts/dtc/libfdt/fdt_sw.o
  HOSTCC  scripts/dtc/libfdt/fdt_rw.o
  HOSTCC  scripts/dtc/libfdt/fdt_strerror.o
  HOSTCC  scripts/dtc/libfdt/fdt_empty_tree.o
  HOSTCC  scripts/dtc/libfdt/fdt_addresses.o
  HOSTCC  scripts/dtc/libfdt/fdt_overlay.o
  HOSTCC  scripts/dtc/fdtoverlay.o
  HOSTCC  scripts/dtc/dtc-lexer.lex.o
  HOSTCC  scripts/dtc/dtc-parser.tab.o
  HOSTLD  scripts/dtc/fdtoverlay
  HOSTLD  scripts/dtc/dtc
  HOSTCC  scripts/kallsyms
  HOSTCC  scripts/sorttable
  HOSTCC  scripts/asn1_compiler
  HOSTCC  scripts/mod/mk_elfconfig
  CC      scripts/mod/empty.o
  CC      scripts/mod/devicetable-offsets.s
  CHECK   ../scripts/mod/empty.c
  MKELF   scripts/mod/elfconfig.h
  HOSTCC  scripts/mod/modpost.o
  HOSTCC  scripts/mod/file2alias.o
  HOSTCC  scripts/mod/sumversion.o
  HOSTCC  scripts/mod/symsearch.o
  HOSTLD  scripts/mod/modpost
  CC      kernel/bounds.s
  CHKSHA1 ../include/linux/atomic/atomic-arch-fallback.h
  CHKSHA1 ../include/linux/atomic/atomic-instrumented.h
  CHKSHA1 ../include/linux/atomic/atomic-long.h
  CC      arch/riscv/kernel/asm-offsets.s
  CALL    ../scripts/checksyscalls.sh
  LDS     arch/riscv/kernel/vdso/vdso.lds
  AS      arch/riscv/kernel/vdso/rt_sigreturn.o
  CC      arch/riscv/kernel/vdso/vgettimeofday.o
  AS      arch/riscv/kernel/vdso/getcpu.o
  AS      arch/riscv/kernel/vdso/flush_icache.o
  CC      arch/riscv/kernel/vdso/hwprobe.o
  AS      arch/riscv/kernel/vdso/sys_hwprobe.o
  AS      arch/riscv/kernel/vdso/note.o
  CHECK   ../arch/riscv/kernel/vdso/vgettimeofday.c
  CHECK   ../arch/riscv/kernel/vdso/hwprobe.c
  VDSOLD  arch/riscv/kernel/vdso/vdso.so.dbg
  VDSOSYM include/generated/vdso-offsets.h
  LDS     arch/riscv/kernel/compat_vdso/compat_vdso.lds
  VDSOAS  arch/riscv/kernel/compat_vdso/rt_sigreturn.o
  VDSOAS  arch/riscv/kernel/compat_vdso/getcpu.o
  VDSOAS  arch/riscv/kernel/compat_vdso/flush_icache.o
  VDSOAS  arch/riscv/kernel/compat_vdso/note.o
  VDSOLD  arch/riscv/kernel/compat_vdso/compat_vdso.so.dbg
  VDSOSYM include/generated/compat_vdso-offsets.h
make[4]: Nothing to be done for 'drivers/acpi/apei/'.
  CC      drivers/mfd/88pm860x-core.o
  CC      arch/riscv/kernel/vendor_extensions/andes.o
  CC      arch/riscv/kernel/vendor_extensions/thead.o
  CC      drivers/mfd/88pm860x-i2c.o
  CC      arch/riscv/kernel/vendor_extensions/thead_hwprobe.o
  CC      drivers/mfd/88pm800.o
  CC      drivers/mfd/88pm80x.o
  CC      drivers/mfd/88pm805.o
  CC      drivers/hwmon/pmbus/pmbus_core.o
  CC      drivers/hwmon/pmbus/adm1275.o
  CC      drivers/mfd/88pm886.o
  CC      drivers/hwmon/pmbus/adp1050.o
  CC      drivers/mfd/act8945a.o
  CC      drivers/hwmon/pmbus/bpa-rs600.o
  CC      drivers/mfd/sm501.o
  CC      drivers/hwmon/pmbus/ina233.o
  CC      drivers/mfd/bcm590xx.o
  CC      drivers/hwmon/pmbus/inspur-ipsps.o
  CC      drivers/mfd/bd9571mwv.o
  CC      drivers/hwmon/pmbus/ir35221.o
  CC      drivers/mfd/cs42l43.o
  CC      drivers/hwmon/pmbus/ir36021.o
  CC      drivers/hwmon/pmbus/isl68137.o
  CC      drivers/mfd/cs42l43-i2c.o
  CC      drivers/hwmon/pmbus/lm25066.o
  CC      drivers/mfd/exynos-lpass.o
  CC      drivers/hwmon/pmbus/ltc3815.o
  CC      drivers/hwmon/pmbus/ltc4286.o
  CC      drivers/mfd/gateworks-gsc.o
  CC      drivers/hwmon/pmbus/max15301.o
  CC      drivers/mfd/lp87565.o
  CC      drivers/hwmon/pmbus/max16601.o
  CC      drivers/hwmon/pmbus/max8688.o
  CC      drivers/mfd/ti_am335x_tscadc.o
  CC      drivers/hwmon/pmbus/mp2856.o
  CC      drivers/mfd/stmpe.o
  CC      drivers/hwmon/pmbus/mp2888.o
  CC      drivers/hwmon/pmbus/mp2891.o
  CC      drivers/mfd/stmpe-i2c.o
  CC      drivers/hwmon/pmbus/mp5023.o
  CC      drivers/hwmon/pmbus/mp9941.o
  CC      drivers/mfd/sun6i-prcm.o
  CC      drivers/hwmon/pmbus/mpq7932.o
  CC      drivers/mfd/tc3589x.o
  CC      drivers/hwmon/pmbus/mpq8785.o
  CC      drivers/hwmon/pmbus/pm6764tr.o
  CC      drivers/hwmon/pmbus/stpddc60.o
  CC      drivers/hwmon/pmbus/tda38640.o
  CC      drivers/hwmon/pmbus/tps25990.o
  CC      drivers/mfd/tqmx86.o
  CC      drivers/hwmon/pmbus/tps40422.o
  CC      drivers/hwmon/pmbus/tps53679.o
  CC      drivers/hwmon/pmbus/tps546d24.o
  CC      drivers/mfd/lochnagar-i2c.o
  CC      drivers/hwmon/pmbus/ucd9200.o
  CC      drivers/hwmon/pmbus/xdp710.o
  CC      drivers/hwmon/pmbus/xdpe152c4.o
  CC      drivers/hwmon/pmbus/pim4328.o
  CC      drivers/mfd/arizona-core.o
  CC      drivers/hwmon/pmbus/crps.o
  CC      drivers/mfd/arizona-irq.o
  CC      drivers/mfd/wm8997-tables.o
  CC      drivers/mfd/arizona-spi.o
  CC      drivers/mfd/wm8400-core.o
  CC      drivers/mfd/wm831x-core.o
  CC      drivers/mfd/wm831x-irq.o
  CC      drivers/mfd/wm831x-otp.o
  CC      drivers/mfd/wm831x-auxadc.o
  CC      drivers/mfd/wm831x-i2c.o
  CC      drivers/mfd/wm8350-core.o
  CC      drivers/mfd/wm8350-regmap.o
  CC      drivers/mfd/wm8350-gpio.o
  CC      drivers/mfd/wm8350-irq.o
  CC      drivers/mfd/wm8350-i2c.o
  CC      drivers/mfd/madera-core.o
  CC      drivers/mfd/cs47l85-tables.o
  CC      drivers/mfd/cs47l90-tables.o
  CC      drivers/mfd/cs47l92-tables.o
  CC      drivers/mfd/madera-i2c.o
  CHECK   ../arch/riscv/kernel/vendor_extensions/thead_hwprobe.c
  CC      drivers/mfd/madera-spi.o
  CC      drivers/mfd/tps6105x.o
  CC      drivers/mfd/tps6507x.o
  CC      drivers/mfd/tps65219.o
  CHECK   ../arch/riscv/kernel/vendor_extensions/andes.c
  CC      drivers/mfd/tps65910.o
  CHECK   ../arch/riscv/kernel/vendor_extensions/thead.c
  CC      drivers/mfd/tps65912-core.o
  CC      drivers/mfd/tps65912-spi.o
  CC      drivers/mfd/tps6594-core.o
  CC      drivers/mfd/tps6594-i2c.o
  CC      drivers/mfd/tps6594-spi.o
  CC      drivers/mfd/fsl-imx25-tsadc.o
  CC      drivers/mfd/mc13xxx-core.o
  CC      drivers/mfd/mc13xxx-spi.o
  CC      drivers/mfd/mfd-core.o
  CC      drivers/mfd/da9052-irq.o
  CC      drivers/mfd/da9052-core.o
  CC      drivers/mfd/da9052-spi.o
  CC      drivers/mfd/da9052-i2c.o
  CC      drivers/mfd/lp8788.o
  AR      arch/riscv/kernel/vendor_extensions/built-in.a
  CC      drivers/mfd/lp8788-irq.o
  CC      drivers/mfd/ti-lmu.o
  CC      drivers/mfd/da9055-core.o
  CC      drivers/mfd/da9055-i2c.o
  CC      drivers/mfd/da9062-core.o
  CC      drivers/mfd/da9063-core.o
  CC      drivers/mfd/da9063-irq.o
  CC      drivers/mfd/da9063-i2c.o
  CC      drivers/mfd/max14577.o
  CC      drivers/mfd/max77620.o
  CC      drivers/mfd/max77650.o
  CC      drivers/mfd/max77686.o
  CC      drivers/mfd/max77693.o
  CC      drivers/mfd/max77705.o
  CC      drivers/mfd/max77843.o
  CC      drivers/mfd/max8925-core.o
  CC      drivers/mfd/max8925-i2c.o
  CC      drivers/mfd/max8997.o
  CC      drivers/mfd/max8997-irq.o
  CC      drivers/mfd/mp2629.o
  CC      drivers/mfd/mt6360-core.o
  CC      drivers/mfd/mt6370.o
  CC      drivers/mfd/rz-mtu3.o
  CC      drivers/mfd/abx500-core.o
  CC      drivers/mfd/adp5520.o
  CC      drivers/mfd/adp5585.o
  CC      drivers/mfd/kempld-core.o
  CC      drivers/mfd/wl1273-core.o
  CC      drivers/mfd/si476x-cmd.o
  CC      drivers/mfd/si476x-prop.o
  CC      drivers/mfd/si476x-i2c.o
  CC      drivers/mfd/omap-usb-host.o
  CC      drivers/mfd/omap-usb-tll.o
  CC      drivers/mfd/qcom-pm8xxx.o
  CC      drivers/mfd/ssbi.o
  CC      drivers/mfd/atmel-smc.o
  CC      drivers/mfd/ntxec.o
  CC      drivers/mfd/rc5t583.o
  CC      drivers/mfd/rc5t583-irq.o
  CC      drivers/mfd/rk8xx-core.o
  CC      drivers/mfd/rk8xx-i2c.o
  CHECK   ../drivers/mfd/exynos-lpass.c
  CHECK   ../drivers/mfd/sun6i-prcm.c
  CC      drivers/mfd/rn5t618.o
  CC      drivers/mfd/sec-core.o
  CHECK   ../drivers/hwmon/pmbus/inspur-ipsps.c
  CC      drivers/mfd/sec-irq.o
  CHECK   ../drivers/hwmon/pmbus/max15301.c
  CHECK   ../drivers/mfd/88pm805.c
  CC      drivers/mfd/syscon.o
  CHECK   ../drivers/mfd/stmpe-i2c.c
  CHECK   ../drivers/hwmon/pmbus/ltc3815.c
  CC      drivers/mfd/lm3533-core.o
  CHECK   ../drivers/mfd/88pm80x.c
  CHECK   ../drivers/hwmon/pmbus/ir36021.c
  CHECK   ../drivers/mfd/88pm860x-i2c.c
  CHECK   ../drivers/hwmon/pmbus/adp1050.c
  CHECK   ../drivers/hwmon/pmbus/mpq7932.c
  CHECK   ../drivers/hwmon/pmbus/crps.c
  CHECK   ../drivers/mfd/act8945a.c
  CHECK   ../drivers/hwmon/pmbus/max16601.c
  CHECK   ../drivers/hwmon/pmbus/tps40422.c
  CHECK   ../drivers/mfd/cs42l43-i2c.c
  CHECK   ../drivers/hwmon/pmbus/mp9941.c
  CHECK   ../drivers/mfd/88pm800.c
  CHECK   ../drivers/hwmon/pmbus/ina233.c
  CHECK   ../drivers/mfd/88pm886.c
  CHECK   ../drivers/hwmon/pmbus/xdpe152c4.c
  CHECK   ../drivers/mfd/bcm590xx.c
  CHECK   ../drivers/hwmon/pmbus/ltc4286.c
  CHECK   ../drivers/mfd/ti_am335x_tscadc.c
  CHECK   ../drivers/hwmon/pmbus/lm25066.c
  CHECK   ../drivers/mfd/bd9571mwv.c
  CHECK   ../drivers/mfd/gateworks-gsc.c
  CHECK   ../drivers/hwmon/pmbus/isl68137.c
  CHECK   ../drivers/mfd/lp87565.c
  CC      drivers/mfd/retu-mfd.o
  CC      drivers/mfd/lm3533-ctrlbank.o
  CHECK   ../drivers/mfd/sm501.c
  CHECK   ../drivers/hwmon/pmbus/mp2888.c
  CC      drivers/mfd/as3711.o
  CHECK   ../drivers/hwmon/pmbus/bpa-rs600.c
  CHECK   ../drivers/hwmon/pmbus/ir35221.c
  CC      drivers/mfd/as3722.o
  CHECK   ../drivers/hwmon/pmbus/max8688.c
  CC      drivers/mfd/stw481x.o
  CC      drivers/mfd/hi6421-spmi-pmic.o
  CHECK   ../drivers/hwmon/pmbus/mp5023.c
  CHECK   ../drivers/hwmon/pmbus/pm6764tr.c
  CHECK   ../drivers/hwmon/pmbus/mpq8785.c
  CHECK   ../drivers/hwmon/pmbus/tda38640.c
  CHECK   ../drivers/hwmon/pmbus/stpddc60.c
  CHECK   ../drivers/hwmon/pmbus/tps25990.c
  CHECK   ../drivers/mfd/wm831x-i2c.c
  CHECK   ../drivers/hwmon/pmbus/tps546d24.c
  CHECK   ../drivers/mfd/wm8350-gpio.c
  CHECK   ../drivers/hwmon/pmbus/xdp710.c
  CHECK   ../drivers/hwmon/pmbus/mp2856.c
  CHECK   ../drivers/mfd/wm8400-core.c
  CHECK   ../drivers/mfd/wm831x-auxadc.c
  CHECK   ../drivers/mfd/ti-lmu.c
  CHECK   ../drivers/hwmon/pmbus/ucd9200.c
  CHECK   ../drivers/hwmon/pmbus/pim4328.c
  CHECK   ../drivers/mfd/tps65912-core.c
  CC      drivers/mfd/hi655x-pmic.o
  CC      drivers/mfd/dln2.o
  CHECK   ../drivers/mfd/88pm860x-core.c
  CC      drivers/mfd/rt4831.o
  CHECK   ../drivers/hwmon/pmbus/tps53679.c
  CHECK   ../drivers/mfd/lochnagar-i2c.c
  CHECK   ../drivers/mfd/tqmx86.c
  CHECK   ../drivers/mfd/wm8997-tables.c
  CHECK   ../drivers/mfd/arizona-spi.c
  CHECK   ../drivers/mfd/wm831x-core.c
  CHECK   ../drivers/mfd/tc3589x.c
  CHECK   ../drivers/mfd/wm831x-otp.c
  CHECK   ../drivers/mfd/tps65912-spi.c
  CC      drivers/mfd/rt5120.o
  CC      drivers/mfd/sky81452.o
  CC      drivers/mfd/stpmic1.o
  CHECK   ../drivers/mfd/wm8350-irq.c
  CC      drivers/mfd/sun4i-gpadc.o
  CC      drivers/mfd/stm32-lptimer.o
  CC      drivers/mfd/mxs-lradc.o
  CHECK   ../drivers/mfd/wm8350-i2c.c
  CHECK   ../drivers/mfd/tps6507x.c
  CC      drivers/mfd/stm32-timers.o
  CHECK   ../drivers/hwmon/pmbus/mp2891.c
  CHECK   ../drivers/mfd/arizona-irq.c
  CC      drivers/mfd/sprd-sc27xx-spi.o
  CHECK   ../drivers/mfd/wm8350-core.c
  CHECK   ../drivers/mfd/wm8350-regmap.c
  CHECK   ../drivers/mfd/tps6594-core.c
  CHECK   ../drivers/mfd/fsl-imx25-tsadc.c
  CHECK   ../drivers/mfd/tps6594-spi.c
  CHECK   ../drivers/mfd/da9052-irq.c
  CHECK   ../drivers/mfd/da9052-spi.c
  CHECK   ../drivers/mfd/da9055-core.c
  CHECK   ../drivers/mfd/da9063-irq.c
  CC      drivers/mfd/rohm-bd71828.o
  CC      drivers/mfd/rohm-bd718x7.o
  CC      drivers/mfd/rohm-bd96801.o
../drivers/mfd/sm501.c:1148:29: sparse: warning: cast to non-scalar
../drivers/mfd/sm501.c:1148:29: sparse: warning: cast from non-scalar
../drivers/mfd/sm501.c:1152:29: sparse: warning: cast to non-scalar
../drivers/mfd/sm501.c:1152:29: sparse: warning: cast from non-scalar
  CHECK   ../drivers/hwmon/pmbus/adm1275.c
  CC      drivers/mfd/khadas-mcu.o
  CHECK   ../drivers/mfd/stmpe.c
  CHECK   ../drivers/mfd/arizona-core.c
  CHECK   ../drivers/mfd/madera-core.c
  CHECK   ../drivers/mfd/tps6105x.c
  CHECK   ../drivers/mfd/madera-spi.c
  CHECK   ../drivers/mfd/da9052-core.c
  CHECK   ../drivers/mfd/lp8788.c
  CHECK   ../drivers/mfd/da9063-core.c
  CHECK   ../drivers/mfd/atmel-smc.c
  CC      drivers/mfd/qcom-pm8008.o
  CC      drivers/mfd/simple-mfd-i2c.o
  CC      drivers/mfd/smpro-core.o
  CC      drivers/mfd/atc260x-core.o
  CHECK   ../drivers/mfd/mc13xxx-core.c
  CHECK   ../drivers/mfd/tps65219.c
  CC      drivers/mfd/atc260x-i2c.o
  CHECK   ../drivers/mfd/madera-i2c.c
  CHECK   ../drivers/mfd/cs47l92-tables.c
  CHECK   ../drivers/mfd/cs47l90-tables.c
  CHECK   ../drivers/mfd/cs42l43.c
  CHECK   ../drivers/mfd/tps65910.c
  CHECK   ../drivers/mfd/wm831x-irq.c
  CHECK   ../drivers/mfd/tps6594-i2c.c
  CHECK   ../drivers/mfd/mc13xxx-spi.c
  CHECK   ../drivers/mfd/lp8788-irq.c
  CHECK   ../drivers/mfd/da9055-i2c.c
  CHECK   ../drivers/mfd/da9063-i2c.c
  CHECK   ../drivers/mfd/cs47l85-tables.c
  CHECK   ../drivers/mfd/da9052-i2c.c
  CHECK   ../drivers/mfd/da9062-core.c
  CHECK   ../drivers/mfd/max77650.c
  CHECK   ../drivers/mfd/kempld-core.c
  CHECK   ../drivers/mfd/max14577.c
  CHECK   ../drivers/mfd/mfd-core.c
  CHECK   ../drivers/mfd/mp2629.c
  CHECK   ../drivers/mfd/max77843.c
  CHECK   ../drivers/mfd/max77705.c
  CHECK   ../drivers/mfd/max77693.c
  CHECK   ../drivers/mfd/max8925-i2c.c
  CHECK   ../drivers/mfd/max77686.c
  CHECK   ../drivers/mfd/rz-mtu3.c
  CHECK   ../drivers/mfd/abx500-core.c
  CHECK   ../drivers/mfd/ssbi.c
  CHECK   ../drivers/mfd/max8997-irq.c
  CHECK   ../drivers/mfd/mt6370.c
  CHECK   ../drivers/mfd/wl1273-core.c
  CHECK   ../drivers/mfd/max8997.c
  CHECK   ../drivers/mfd/adp5585.c
  CHECK   ../drivers/mfd/mt6360-core.c
  CHECK   ../drivers/mfd/max77620.c
  CHECK   ../drivers/mfd/adp5520.c
  CHECK   ../drivers/mfd/omap-usb-tll.c
  CHECK   ../drivers/mfd/max8925-core.c
  CHECK   ../drivers/mfd/si476x-prop.c
  CHECK   ../drivers/mfd/rc5t583-irq.c
  CHECK   ../drivers/mfd/syscon.c
  CHECK   ../drivers/mfd/qcom-pm8xxx.c
  CHECK   ../drivers/mfd/sec-irq.c
  CHECK   ../drivers/mfd/lm3533-ctrlbank.c
  CHECK   ../drivers/mfd/rc5t583.c
  CHECK   ../drivers/mfd/rn5t618.c
  CHECK   ../drivers/mfd/rk8xx-core.c
  CHECK   ../drivers/mfd/omap-usb-host.c
  CHECK   ../drivers/mfd/si476x-i2c.c
  CHECK   ../drivers/mfd/rk8xx-i2c.c
  CHECK   ../drivers/hwmon/pmbus/pmbus_core.c
../drivers/mfd/max77705.c:162:1: sparse: warning: symbol 'max77705_pm_ops' was not declared. Should it be static?
  CHECK   ../drivers/mfd/ntxec.c
  CHECK   ../drivers/mfd/hi6421-spmi-pmic.c
  CHECK   ../drivers/mfd/stw481x.c
  CHECK   ../drivers/mfd/lm3533-core.c
  CHECK   ../drivers/mfd/mxs-lradc.c
  CHECK   ../drivers/mfd/retu-mfd.c
  CHECK   ../drivers/mfd/si476x-cmd.c
  CHECK   ../drivers/mfd/as3711.c
  CHECK   ../drivers/mfd/as3722.c
  CHECK   ../drivers/mfd/sec-core.c
  CHECK   ../drivers/mfd/stm32-lptimer.c
  CHECK   ../drivers/mfd/rt5120.c
  CHECK   ../drivers/mfd/stm32-timers.c
  CHECK   ../drivers/mfd/hi655x-pmic.c
  CHECK   ../drivers/mfd/sun4i-gpadc.c
  AR      drivers/hwmon/pmbus/built-in.a
  CHECK   ../drivers/mfd/khadas-mcu.c
  CHECK   ../drivers/mfd/sky81452.c
  CHECK   ../drivers/mfd/rohm-bd71828.c
  CHECK   ../drivers/mfd/rt4831.c
  CHECK   ../drivers/mfd/rohm-bd718x7.c
  CHECK   ../drivers/mfd/atc260x-core.c
  CHECK   ../drivers/mfd/atc260x-i2c.c
  CHECK   ../drivers/mfd/dln2.c
  CHECK   ../drivers/mfd/stpmic1.c
  CHECK   ../drivers/mfd/smpro-core.c
  CHECK   ../drivers/mfd/qcom-pm8008.c
  CHECK   ../drivers/mfd/rohm-bd96801.c
  CHECK   ../drivers/mfd/sprd-sc27xx-spi.c
  CHECK   ../drivers/mfd/simple-mfd-i2c.c
  AR      drivers/mfd/built-in.a
make[1]: Leaving directory '/home/docker-brian/linux/build_dir'

Best Regards,
Brian Chiang
