Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5F2225785
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 21:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750628027; cv=none; b=dvdllrqQXCgTN0s+Amc0ChFHjjHZdkH7BFpoafbkQjYrmh3IhHb6DCeGWFutue0olr6ljGTn63Sj1/lRuXF6CfD7HQAn/AqyDLWWFi0uttpQAeSs+TgWxFzIx73Ydkx4FmbNrm5e9ps3LIs+8dkOqIHtQrXMWC6t1rE24wl5sDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750628027; c=relaxed/simple;
	bh=ZCQ+sWv+kQaZZrdKs3rCAYePM6dCyF/eP1qin3deuM8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MQTMAP78w7NYfhjaVJWRj+eJAZ6+x4wxnhwE3wYTSTQ5a1F1eedddBhL1Cr3cUQJWPBVGiPPtD/yBgkS/twJ+2ubwgJRIPxSIhvvQ4vp2Mlv9lSQPZZ4KhETES9a/BNwad844GMLTYL+OI0xmqmlwDaL8UzuJei6kxqjNkfV3Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C/FY/529; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C/FY/529"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2366e5e4dbaso28060535ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 14:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750628024; x=1751232824; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h4TaMBScWlO5o6sQQ8rBV8o4/7whbCNqAJF2fPQ5Lds=;
        b=C/FY/529uo6fJFymmIfiuAZG7a8JiXV5VJIFtPHGK/TaRQjWhnnEhytwUK69GT1FVb
         FV/37N6iJgFOrYt/0Yez8EOT1+XjCMXITJxZF4cdMHD5as9p+FeZtspkwwK0+ttcj2Gk
         ZFKfFhhDUmZqQG46FYdfWXxvhVbPw85i1f8WBU0oQ7v0r4FeSVqSAX95gEh4uMM+NrXu
         r9lA98vnSv0qfrk2qcRmLtIMfEWM+GGCDnT5TlOFqhOUdnUfKe6oAO72hSz27mferfkK
         ne7WV3UL2fa92AfHudK8O4vrOugBpTn88meH7haSed88DHHBmyP0z8b7zrXXT5NCp8+1
         S3lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750628024; x=1751232824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h4TaMBScWlO5o6sQQ8rBV8o4/7whbCNqAJF2fPQ5Lds=;
        b=Z55wbL9QxYBEN/Zn6FAj0XeGasfl20cBVVGu3BGAlDqZUdh4VOhn1UWSJa+q7X8x9t
         mkHVyBuccUT12il1J7wF5fbxHA1vKYhX3TZPsqHRTzCY86pAgh4xZA09mh1ivyTL9Tkq
         BRkqWjr0bmvWQxubgh5yp29YWbILhEQY8yTY6uPpXuLbtMuTD94uHVb38jqX6b+S4whW
         HbPLNTaVzICoWZ7LewLAjTxQYzfbhU2vPXwKO035YldBD1fwFSPX/63VK+4GCAvwBhOK
         F6raGtJhaT5HnGEgytSh61tOK5zmpXCXJkD9Lr0CBKTvQQ76WyELgwEK4znptlyrXFqW
         g+Qg==
X-Forwarded-Encrypted: i=1; AJvYcCW1sSy6P40JHW24V5xY8KJJeJF4UskyFhx6Ooko0ujTqZXMQh9dF7owVx8xHeSMelDanyh1E0Qw6Dn335Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFaBGbZ1XpU8xpK0Gg+6e4qXbU0Lg/nypIp7V9Xh5zVT1rzQX0
	uBXeX2MdZtBL7cSp3xodcRHycpPBANoetkd+zeHFcm5JEK0f56Ro5pjeUu3I1Q==
X-Gm-Gg: ASbGnctI/ir1V989711FpA99rezKH/pnNylAixGksPoCzZ0t/YRAZ4ebz12WbBCMDB3
	SDB6KdZFw6HE8Zp3ztRRA8E95qn68egEo74PZV8QvORwSfrn9twGTG44DT0li9Wm2M8OfLEEyPA
	KGSvrucAp/zbhF4uYNez7dp8Kw6348V3dbiGH2+Fhgb/vBsSsBg5RuVW7EswAVo1GIiTncOcRWs
	/GlcozaVFUrmyqmT0cYhkb/666EpOB/le6oRYh31yXBIa1hTf79bYnGdjNedlMr0cUEKYvMJ53h
	LJqB/exJwj1xuOb/yPzXhLNN6DK+/LDYFwilSr6x9IcObVrQ59NRqCebVN1gJzEEgoZhnRvegcB
	MTqaaE1iF0szaejP8vnxXlxPhJWba0X3k
X-Google-Smtp-Source: AGHT+IFIxUQ0/YD9Herz6BdBG99RUQWTSP01WOOdLGUJBk0F001Qhh8PYbENqSOqfVF9ZR/sOn/VmQ==
X-Received: by 2002:a17:902:edc6:b0:237:e3bc:7691 with SMTP id d9443c01a7336-237e3bc76bbmr88766475ad.13.1750628024337;
        Sun, 22 Jun 2025 14:33:44 -0700 (PDT)
Received: from ikb-h07-29-noble.in.iijlab.net ([202.214.97.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83955a3sm66601295ad.36.2025.06.22.14.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 14:33:43 -0700 (PDT)
Received: by ikb-h07-29-noble.in.iijlab.net (Postfix, from userid 1010)
	id C1671EF1EBC; Mon, 23 Jun 2025 06:33:41 +0900 (JST)
From: Hajime Tazaki <thehajime@gmail.com>
To: linux-um@lists.infradead.org
Cc: thehajime@gmail.com,
	ricarkol@google.com,
	Liam.Howlett@oracle.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 12/13] um: nommu: add documentation of nommu UML
Date: Mon, 23 Jun 2025 06:33:10 +0900
Message-ID: <8da6d6a802e2bd4573594aedda3d1f827d86517a.1750594487.git.thehajime@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750594487.git.thehajime@gmail.com>
References: <cover.1750594487.git.thehajime@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit adds an initial documentation for !MMU mode of UML.

Signed-off-by: Hajime Tazaki <thehajime@gmail.com>
---
 Documentation/virt/uml/nommu-uml.rst | 180 +++++++++++++++++++++++++++
 MAINTAINERS                          |   1 +
 2 files changed, 181 insertions(+)
 create mode 100644 Documentation/virt/uml/nommu-uml.rst

diff --git a/Documentation/virt/uml/nommu-uml.rst b/Documentation/virt/uml/nommu-uml.rst
new file mode 100644
index 000000000000..1a988253bef8
--- /dev/null
+++ b/Documentation/virt/uml/nommu-uml.rst
@@ -0,0 +1,180 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+UML has been built with CONFIG_MMU since day 0.  The patchset
+introduces the nommu mode on UML in a different angle from what Linux
+Kernel Library tried.
+
+.. contents:: :local:
+
+What is it for ?
+================
+
+- Alleviate syscall hook overhead implemented with ptrace(2)
+- To exercises nommu code over UML (and over KUnit)
+- Less dependency to host facilities
+
+
+How it works ?
+==============
+
+To illustrate how this feature works, the below shows how syscalls are
+called under nommu/UML environment.
+
+- boot kernel, install seccomp filter if ``syscall`` instructions are
+  called from userspace memory based on the address of instruction
+  pointer
+- (userspace starts)
+- calls ``vfork``/``execve`` syscalls
+- ``SIGSYS`` signal raised, handler calls syscall entry point ``__kernel_vsyscall``
+- call handler function in ``sys_call_table[]`` and follow how UML syscall
+  works.
+- return to userspace
+
+
+What are the differences from MMU-full UML ?
+============================================
+
+The current nommu implementation adds 3 different functions which
+MMU-full UML doesn't have:
+
+- kernel address space can directly be accessible from userspace
+  - so, ``uaccess()`` always returns 1
+  - generic implementation of memcpy/strcpy/futex is also used
+- alternate syscall entrypoint without ptrace
+- alternate syscall hook
+  - hook syscall by seccomp filter
+
+With those modifications, it allows us to use unmodified userspace
+binaries with nommu UML.
+
+
+History
+=======
+
+This feature was originally introduced by Ricardo Koller at Open
+Source Summit NA 2020, then integrated with the syscall translation
+functionality with the clean up to the original code.
+
+Building and run
+================
+
+::
+
+   make ARCH=um x86_64_nommu_defconfig
+   make ARCH=um
+
+will build UML with ``CONFIG_MMU=n`` applied.
+
+Kunit tests can run with the following command::
+
+   ./tools/testing/kunit/kunit.py run --kconfig_add CONFIG_MMU=n
+
+To run a typical Linux distribution, we need nommu-aware userspace.
+We can use a stock version of Alpine Linux with nommu-built version of
+busybox and musl-libc.
+
+
+Preparing root filesystem
+=========================
+
+nommu UML requires to use a specific standard library which is aware
+of nommu kernel.  We have tested custom-build musl-libc and busybox,
+both of which have built-in support for nommu kernels.
+
+There are no available Linux distributions for nommu under x86_64
+architecture, so we need to prepare our own image for the root
+filesystem.  We use Alpine Linux as a base distribution and replace
+busybox and musl-libc on top of that.  The following are the step to
+prepare the filesystem for the quick start::
+
+     container_id=$(docker create ghcr.io/thehajime/alpine:3.20.3-um-nommu)
+     docker start $container_id
+     docker wait $container_id
+     docker export $container_id > alpine.tar
+     docker rm $container_id
+
+     mnt=$(mktemp -d)
+     dd if=/dev/zero of=alpine.ext4 bs=1 count=0 seek=1G
+     sudo chmod og+wr "alpine.ext4"
+     yes 2>/dev/null | mkfs.ext4 "alpine.ext4" || true
+     sudo mount "alpine.ext4" $mnt
+     sudo tar -xf alpine.tar -C $mnt
+     sudo umount $mnt
+
+This will create a file image, ``alpine.ext4``, which contains busybox
+and musl with nommu build on the Alpine Linux root filesystem.  The
+file can be specified to the argument ``ubd0=`` to the UML command line::
+
+  ./vmlinux ubd0=./alpine.ext4 rw mem=1024m loglevel=8 init=/sbin/init
+
+We plan to upstream apk packages for busybox and musl so that we can
+follow the proper procedure to set up the root filesystem.
+
+
+Quick start with docker
+=======================
+
+There is a docker image that you can quickly start with a simple step::
+
+  docker run -it -v /dev/shm:/dev/shm --rm ghcr.io/thehajime/alpine:3.20.3-um-nommu
+
+This will launch a UML instance with an pre-configured root filesystem.
+
+Benchmark
+=========
+
+The below shows an example of performance measurement conducted with
+lmbench and (self-crafted) getpid benchmark (with v6.15-rc0 uml/next
+tree).
+
+.. csv-table:: lmbench (usec)
+  :header: ,native,um,um-mmu(s),um-nommu(s)
+
+  select-10    ,0.5224,28.3882,27.2839,3.0046
+  select-100   ,1.5641,30.3775,28.8091,3.8546
+  select-1000  ,11.6922,38.2021,32.5367,12.2568
+  syscall      ,0.1635,27.8278,24.8049,2.6957
+  read         ,0.3063,29.0073,23.5953,2.8127
+  write        ,0.2531,29.6342,26.3339,2.7932
+  stat         ,1.8827,41.2546,34.6495,3.3199
+  open/close   ,3.2548,67.5806,62.4781,6.4189
+  fork+sh      ,1108.8000,5618.0000,3604.6667,456.0476
+  fork+execve  ,519.1579,2242.8000,1425.7500,138.1316
+
+.. csv-table:: do_getpid bench (nsec)
+  :header: ,native,um,um-mmu(s),um-nommu(s)
+
+  getpid , 162 , 27049 , 24444 , 2696
+
+(um-nommu(s) is with seccomp syscall hook, um-mmu(s) is SECCOMP mode,
+respectively)
+
+Limitations
+===========
+
+generic nommu limitations
+-------------------------
+Since this port is a kernel of nommu architecture so, the
+implementation inherits the characteristics of other nommu kernels
+(riscv, arm, etc), described below.
+
+- vfork(2) should be used instead of fork(2)
+- ELF loader only loads PIE (position independent executable) binaries
+- processes share the address space among others
+- mmap(2) offers a subset of functionalities (e.g., unsupported
+  MMAP_FIXED)
+
+Thus, we have limited options to userspace programs.  We have tested
+Alpine Linux with musl-libc, which has a support nommu kernel.
+
+supported architecture
+----------------------
+The current implementation of nommu UML only works on x86_64 SUBARCH.
+We have not tested with 32-bit environment.
+
+
+Further readings about NOMMU UML
+================================
+
+- NOMMU UML (original code by Ricardo Koller)
+ - https://static.sched.com/hosted_files/ossna2020/ec/kollerr_linux_um_nommu.pdf
diff --git a/MAINTAINERS b/MAINTAINERS
index ac8ccc837bab..822efc04bbe1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25753,6 +25753,7 @@ USER-MODE LINUX (UML)
 M:	Richard Weinberger <richard@nod.at>
 M:	Anton Ivanov <anton.ivanov@cambridgegreys.com>
 M:	Johannes Berg <johannes@sipsolutions.net>
+M:	Hajime Tazaki <thehajime@gmail.com>
 L:	linux-um@lists.infradead.org
 S:	Maintained
 W:	http://user-mode-linux.sourceforge.net
-- 
2.43.0

