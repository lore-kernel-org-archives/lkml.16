Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0674B5AE;
	Sun,  4 May 2025 09:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746351245; cv=none; b=RYYg6ewuPPyfVQTPcPPBLyXxAE/e8CDLJi/L7dqzHeGgZQRHvspyLKPCIX7muXEBOBXWNImFy8fdoMUJli67PYWNjbpgs+nLnc0RKbb6JcXsdHabTpXS8frkQILOItT4obBCWyBzMjpT/2IbCxT22Wk0QOndOirx5Oq7h7eWeB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746351245; c=relaxed/simple;
	bh=N1ft1MCs11AqOF3ScLkba3Ks9VBNPAuD5bz4Yit63z0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eQqi2a1xVlPyrN9i36/RjNgplnECDJMVAMxivjIK5NWz2pJSBCvX2DZfCOeFHpnmnWM1+AdyzoKVtuwmwK6dQ5DdaowWT+RAHGni6bCUcXWyMG0N3o8pLPnTGVWX+pa5bvGIJZ8ZBxk0+OyGRlhT6cYB2OAGaXSLO4O/p1JHWJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dIdjWZsp; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dIdjWZsp"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-af91fc1fa90so3189708a12.0;
        Sun, 04 May 2025 02:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746351243; x=1746956043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dZ5089g5fcxDtK8RW4HG6ld5BJ4Ih76RBmbnYmG1YBs=;
        b=dIdjWZsp6A/xdVAEdB5NWB6LPCyWQbfiFmvZd49awdh0ISlaVj42WvNdDxIENm4Cof
         0rovPs1RJ7ZVf8MQvGmog13/HrmE0ZBoK7NpAkMjh/ZDfKW2lp4ONv+UAClmfha9nOOQ
         Rqy+IPqaeUqjoC1vP2IHxarwTiEwa4qK2UAFXQiFDohXjMpCEOq9OjsG7gJgWK2IKar/
         ALfSD9Mw2aEoBEUJavV553RFUI3JHj2Os+yn+XQKBeId0+Yox5QQEJRtcYNqqI1YRg5g
         nc5i8iw2JZeKtpw6GHNMG6GYxpvgXkP9Wp3y42TBF0WlyziRpT6Pykn0lTs/e3l138id
         CBcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746351243; x=1746956043;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dZ5089g5fcxDtK8RW4HG6ld5BJ4Ih76RBmbnYmG1YBs=;
        b=MYoUJGknMqDM9ef78jkoprn3JtekkX4MqNbtuPcw50XoXz6fk6nVSRNF9mGQ5OUMAu
         AMqBmglWFk3h7A1ERNXR5nZPFVy41rkyilLn6IV9MNWykA9aJODZcZgouvX82PW9kbrV
         MDeDJnUB4RRs1ZjBE5YzaSTMn3SGFqCBlBabsDnuM5p7Q1xVwZSLJ/WRNeDD2ndZUj2g
         PT7ovO+hUMgugeNO21f6K8EcCtqt+ZCUdLe40kPY3LdR182vQ/qPzq3w06/uPCAs6OLT
         UMCeTP3hkLdqV+ANA9Dn56p9OiRBQTNRHCz1Q/raBbgPErDRxU8Ec4agW7sx6gU14Vq6
         rdtA==
X-Forwarded-Encrypted: i=1; AJvYcCVUELOkeC+v0X2aQpECPa/IdopUiuJeD0V6xdSYpkFoerrvRsJKidSOA4x9+4dTMxrmASrulO3l1Eap+VqA@vger.kernel.org, AJvYcCVpsUmzGuDQXXzjWXfOQUEFoy1pq/K10NydnsPuLxBSgtwUXnwqHT3D7lhs6Sacu91gIqo/gmkaDiA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkTicnhkxpn6d1D4XHQ0zrJ3Er/urSXvLzXFm6zKQGF0o3h13I
	auXFa9iZn1BZqpJ8+qGRLzx9xvHW0VWP3Z/RnauQbgTXsG+Mqh+Q
X-Gm-Gg: ASbGncssdZWls/c4eou4C1dgqara0Ee/tPBeSi4ke0Xp47nEtbRs4XiT2Cbu2HCcYYW
	K9XShem6iv+i+yqJz1iLuCX/sIKeSjxv70e8Pvn5TEkOC0Aq311P2kF+veMArn5p9GASrsSaO4x
	nWuCPYQy49diNwu+XqcHSUFn0IPDNc5o4Z2hI98T2UttqqxU6/QWkjsKVT5cP5qEBEbUcrlPRBe
	9WTvgOcsbts0HRSBTapQMh0qXHRFZzduTltvjmEjpW1DLngmrFcSLqIcwd6LYsHH06SD+YP43O+
	CCLG/qycPhNkjn7YQTVmf1SfaiT3iE9+a24J3Qw8cnRIVb3c6NMB
X-Google-Smtp-Source: AGHT+IEyoioyuSNbzsVqWaizBJYUUeem0i8MooKEc8VNT6CrCZ+ApzlxcSj0Cio63XjsOz73XKsmgg==
X-Received: by 2002:a17:90a:ac16:b0:30a:5b12:db16 with SMTP id 98e67ed59e1d1-30a5b12db68mr5990474a91.1.1746351242903;
        Sun, 04 May 2025 02:34:02 -0700 (PDT)
Received: from localhost.localdomain ([104.28.249.218])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a3471f005sm9165905a91.5.2025.05.04.02.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 02:34:02 -0700 (PDT)
From: Jesung Yang <y.j3ms.n@gmail.com>
To: corbet@lwn.net
Cc: workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jesung Yang <y.j3ms.n@gmail.com>
Subject: [PATCH] docs: align with scripts/syscall.tbl migration
Date: Sun,  4 May 2025 18:33:51 +0900
Message-ID: <20250504093351.2134552-1-y.j3ms.n@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the documentation to reflect the migration of the following
architectures to the centralized syscall table format:

  arc, arm64, csky, hexagon, loongarch, nios2, openrisc, riscv

As of commit 3db80c999debbad ("riscv: convert to generic syscall table"),
these architectures no longer rely on include/uapi/asm-generic/unistd.h.
Instead, syscall table headers (syscall_table_{32,64}.h) are generated by
scripts/syscalltbl.sh based on entries in scripts/syscall.tbl, with ABIs
specified in arch/*/kernel/Makefile.syscalls.

For the convenience of developers working with older kernel versions, the
original documentation is fully retained, with new sections added to
cover the scripts/syscall.tbl approach.

Verified with `make htmldocs`.

Signed-off-by: Jesung Yang <y.j3ms.n@gmail.com>
Link: https://lore.kernel.org/lkml/20240704143611.2979589-1-arnd@kernel.org
---

I have tested all the listed architectures except hexagon and nios2.

Hexagon was skipped because no system-level emulator appears to be
available.

For nios2, QEMU removed support for both user and system emulation as of
version 9.1. With older versions (9.0.4 and 5.2.0), the kernel appears to
boot but gets stuck alternating between `get_cycles` and `__const_udelay`
during execution. Additionally, I could not find sufficient documentation
to enable runtime testing for nios2.

Any guidance on how to proceed with testing for hexagon or nios2 would be
appreciated.

Testing Summary:

- Linux kernel: 6.15.0-rc4-next-20250501
- System call number: 468
- System call name: xyzzy
- System call implementation:
    SYSCALL_DEFINE1(xyzzy, u64, d)
    {
    	printk("Hi, SYSCALL_DEFINE1\n");
    	return d;
    }

    COMPAT_SYSCALL_DEFINE2(xyzzy, compat_arg_u64_dual(d))
    {
    	printk("Hi, COMPAT_SYSCALL_DEFINE2\n");
    	return compat_arg_u64_glue(d);
    }
- Test userspace program:
    #include <unistd.h>
    int main(void) {
        long r = syscall(468, 17, 39);
        return 0;
    }

Each architecture was tested using the following steps:
  - Add the following entry to scripts/syscall.tbl:
      468	common	xyzzy			sys_xyzzy		compat_sys_xyzzy
  - Compile the kernel with the new syscall implementation
  - Verify that arch/*/include/generated/uapi/asm/unistd_*.h contains:
      #define __NR_xyzzy 468
  - Verify that arch/*/include/generated/asm/syscall_table_*.h contains:
      __SYSCALL_WITH_COMPAT(468, sys_xyzzy, compat_sys_xyzzy)
  - Boot the kernel under QEMU
  - Invoke sys_xyzzy() using the test program

Detailed Results:

1. arc
  - Kernel config: haps_hs_defconfig
  - QEMU target: qemu-system-arc -M virt -cpu archs
    - Src: https://github.com/foss-for-synopsys-dwc-arc-processors/qemu
    - Commit hash: 76e0fa9053b4184a29c9077959d484047eefe521
    - Version: 7.0.0
  - Result:
    - The following files were correctly generated
      - arch/arc/include/generated/asm/syscall_table_32.h
      - arch/arc/include/generated/uapi/asm/unistd_32.h
    - The system call was successfully invoked with output:
        "Hi, SYSCALL_DEFINE1\n"
    - The above output is expected due to a macro override in
      arch/arc/kernel/sys.c:
        #define __SYSCALL_WITH_COMPAT(nr, native, compat) \
                __SYSCALL(nr, native)
  - Notes:
    - Modified arch/arc/Makefile:
        - tune-mcpu-def-$(CONFIG_ISA_ARCV2)	:= -mcpu=hs38
        + tune-mcpu-def-$(CONFIG_ISA_ARCV2)	:= -mcpu=archs

2. arm64
  - Kernel config: defconfig
  - QEMU target: qemu-system-aarch64 -M virt -cpu cortex-a53
    - Src: https://github.com/qemu/qemu
    - Commit hash: a17976b04f2117e1bab64358f873b36fe4561520
    - Version: 9.0.4
  - Result:
    - The following files were correctly generated
      - arch/arm64/include/generated/asm/syscall_table_32.h
      - arch/arm64/include/generated/asm/syscall_table_64.h
      - arch/arm64/include/generated/asm/unistd_32.h
      - arch/arm64/include/generated/asm/unistd_compat_32.h
        - contains #define __NR_compat32_xyzzy 468
      - arch/arm64/include/generated/uapi/asm/unistd_64.h
    - 32-bit userspace process successfully invoked the system call with
      output:
        "Hi, COMPAT_SYSCALL_DEFINE2\n"
    - 64-bit userspace process successfully invoked the system call with
      output:
        "Hi, SYSCALL_DEFINE1\n"

3. csky
  - Kernel config: defconfig
  - QEMU target: qemu-system-cskyv2 -M virt -cpu ck807
    - Src: https://github.com/XUANTIE-RV/qemu/tree/xuantie-qemu-9.0
    - Commit hash: e0ace167effcd36d1f82c7ccb4522b3126011479
    - Version: 8.2.94
  - Result:
    - The following files were correctly generated
      - arch/csky/include/generated/asm/syscall_table_32.h
      - arch/csky/include/generated/uapi/asm/unistd_32.h
    - The system call was successfully invoked with output:
        "Hi, SYSCALL_DEFINE1\n"
    - The above output is expected due to a macro override in
      arch/csky/kernel/syscall_table.c:
        #define __SYSCALL_WITH_COMPAT(nr, native, compat) \
                __SYSCALL(nr, native)

4. hexagon
  - Kernel config: defconfig
  - QEMU target: N/A
  - Result:
    - The following files were correctly generated
      - arch/hexagon/include/generated/asm/syscall_table_32.h
      - arch/hexagon/include/generated/uapi/asm/unistd_32.h

5. loongarch
  - Kernel config: loongson3_defconfig
  - QEMU target: qemu-system-loongarch64 -machine virt -cpu la464
    - Src: https://github.com/qemu/qemu
    - Commit hash: a17976b04f2117e1bab64358f873b36fe4561520
    - Version: 9.0.4
  - Result:
    - The following files were correctly generated
      - arch/loongarch/include/generated/asm/syscall_table_64.h
      - arch/loongarch/include/generated/uapi/asm/unistd_64.h
    - The system call was successfully invoked with output:
        "Hi, SYSCALL_DEFINE1\n"
    - The above output is expected due to a macro override in
      arch/loongarch/kernel/syscall.c:
        #define __SYSCALL_WITH_COMPAT(nr, native, compat) \
                __SYSCALL(nr, native)

6. nios2
  - Kernel config: 10m50_defconfig
  - QEMU target: qemu-system-nios2 -machine 10m50-ghrd
    - Src: https://github.com/qemu/qemu
    - Commit hash (9.0.4): a17976b04f2117e1bab64358f873b36fe4561520
    - Commit hash (5.2.0): 553032db17440f8de011390e5a1cfddd13751b0b
    - Version: 9.0.4, 5.2.0
  - Result:
    - The following files were correctly generated
      - arch/nios2/include/generated/asm/syscall_table_32.h
      - arch/nios2/include/generated/uapi/asm/unistd_32.h

7. openrisc
  - Kernel config: virt_defconfig
  - QEMU target: qemu-system-or1k -machine virt -cpu or1200
    - Src: https://github.com/qemu/qemu
    - Commit hash: a17976b04f2117e1bab64358f873b36fe4561520
    - Version: 9.0.4
  - Result:
    - The following files were correctly generated
      - arch/openrisc/include/generated/asm/syscall_table_32.h
      - arch/openrisc/include/generated/uapi/asm/unistd_32.h
    - The system call was successfully invoked with output:
        "Hi, SYSCALL_DEFINE1\n"
    - The above output is expected due to a macro override in
      arch/openrisc/kernel/sys_call_table.c:
        #define __SYSCALL_WITH_COMPAT(nr, native, compat) \
                __SYSCALL(nr, native)

8. riscv (32-bit)
  - Kernel config: defconfig + 32-bit.config
  - QEMU target: qemu-system-riscv32 -M virt -cpu rv32
    - Src: https://github.com/qemu/qemu
    - Commit hash: a17976b04f2117e1bab64358f873b36fe4561520
    - Version: 9.0.4
  - Result:
    - The following files were correctly generated
      - arch/riscv/include/generated/asm/syscall_table_32.h
      - arch/riscv/include/generated/uapi/asm/unistd_32.h
    - The system call was successfully invoked with output:
        "Hi, SYSCALL_DEFINE1\n"
    - The above output is expected due to a macro override in
      arch/riscv/kernel/syscall_table.c:
        #define __SYSCALL_WITH_COMPAT(nr, native, compat) \
                __SYSCALL(nr, native)

9. riscv (64-bit)
  - Kernel config: defconfig + 64-bit.config
  - QEMU target: qemu-system-riscv64 -M virt -cpu rv64
    - Src: https://github.com/qemu/qemu
    - Commit hash: a17976b04f2117e1bab64358f873b36fe4561520
    - Version: 9.0.4
  - Result:
    - The following files were correctly generated
      - arch/riscv/include/generated/asm/syscall_table_32.h
      - arch/riscv/include/generated/asm/syscall_table_64.h
      - arch/riscv/include/generated/uapi/asm/unistd_32.h
      - arch/riscv/include/generated/uapi/asm/unistd_64.h
    - 32-bit userspace process successfully invoked the system call with
      output:
        "Hi, COMPAT_SYSCALL_DEFINE2\n"
    - 64-bit userspace process successfully invoked the system call with
      output:
        "Hi, SYSCALL_DEFINE1\n"

 Documentation/process/adding-syscalls.rst | 84 +++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/Documentation/process/adding-syscalls.rst b/Documentation/process/adding-syscalls.rst
index 906c47f1a9e5..fc0b0bbcd34d 100644
--- a/Documentation/process/adding-syscalls.rst
+++ b/Documentation/process/adding-syscalls.rst
@@ -248,6 +248,52 @@ To summarize, you need a commit that includes:
  - fallback stub in ``kernel/sys_ni.c``
 
 
+.. _syscall_generic_6_11:
+
+Since 6.11
+~~~~~~~~~~
+
+Starting with kernel version 6.11, general system call implementation for the
+following architectures no longer requires modifications to
+``include/uapi/asm-generic/unistd.h``:
+
+ - arc
+ - arm64
+ - csky
+ - hexagon
+ - loongarch
+ - nios2
+ - openrisc
+ - riscv
+
+Instead, you need to update ``scripts/syscall.tbl`` and, if applicable, adjust
+``arch/*/kernel/Makefile.syscalls``.
+
+As ``scripts/syscall.tbl`` serves as a common syscall table across multiple
+architectures, a new entry is required in this table::
+
+    468   common   xyzzy     sys_xyzzy
+
+Note that adding an entry to ``scripts/syscall.tbl`` with the "common" ABI
+also affects all architectures that share this table. For more limited or
+architecture-specific changes, consider using an architecture-specific ABI or
+defining a new one.
+
+If a new ABI, say ``xyz``, is introduced, the corresponding updates should be
+made to ``arch/*/kernel/Makefile.syscalls`` as well::
+
+    syscall_abis_{32,64} += xyz (...)
+
+To summarize, you need a commit that includes:
+
+ - ``CONFIG`` option for the new function, normally in ``init/Kconfig``
+ - ``SYSCALL_DEFINEn(xyzzy, ...)`` for the entry point
+ - corresponding prototype in ``include/linux/syscalls.h``
+ - new entry in ``scripts/syscall.tbl``
+ - (if needed) Makefile updates in ``arch/*/kernel/Makefile.syscalls``
+ - fallback stub in ``kernel/sys_ni.c``
+
+
 x86 System Call Implementation
 ------------------------------
 
@@ -353,6 +399,41 @@ To summarize, you need:
    ``include/uapi/asm-generic/unistd.h``
 
 
+Since 6.11
+~~~~~~~~~~
+
+This applies to all the architectures listed in :ref:`Since 6.11<syscall_generic_6_11>`
+under "Generic System Call Implementation", except arm64. See
+:ref:`Compatibility System Calls (arm64)<compat_arm64>` for more information.
+
+You need to extend the entry in ``scripts/syscall.tbl`` with an extra column
+to indicate that a 32-bit userspace program running on a 64-bit kernel should
+hit the compat entry point::
+
+    468   common     xyzzy     sys_xyzzy    compat_sys_xyzzy
+
+To summarize, you need:
+
+ - ``COMPAT_SYSCALL_DEFINEn(xyzzy, ...)`` for the compat entry point
+ - corresponding prototype in ``include/linux/compat.h``
+ - modification of the entry in ``scripts/syscall.tbl`` to include an extra
+   "compat" column
+ - (if needed) 32-bit mapping struct in ``include/linux/compat.h``
+
+
+.. _compat_arm64:
+
+Compatibility System Calls (arm64)
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+On arm64, there is a dedicated syscall table for compatibility system calls
+targeting 32-bit (AArch32) userspace: ``arch/arm64/tools/syscall_32.tbl``.
+You need to add an additional line to this table specifying the compat
+entry point::
+
+    468   common     xyzzy     sys_xyzzy    compat_sys_xyzzy
+
+
 Compatibility System Calls (x86)
 --------------------------------
 
@@ -575,3 +656,6 @@ References and Sources
  - Recommendation from Linus Torvalds that x32 system calls should prefer
    compatibility with 64-bit versions rather than 32-bit versions:
    https://lore.kernel.org/r/CA+55aFxfmwfB7jbbrXxa=K7VBYPfAvmu3XOkGrLbB1UFjX1+Ew@mail.gmail.com
+ - Patch series revising system call table infrastructure to use
+   scripts/syscall.tbl across multiple architectures:
+   https://lore.kernel.org/lkml/20240704143611.2979589-1-arnd@kernel.org
-- 
2.43.0

