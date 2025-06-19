Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5390821D3F0
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 01:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750295103; cv=none; b=MLIMfPQbwgzw6cz/ZkoUuZXghWhds18ZeZmHwKeQwdbnZJYbwUFSaKmK2S7gxTTi6uPxJ3lKp4hoKnzb+aOiJ6vpX+7kIKKyHEvgyYM1MoTk4D9iPk9ncNU4o/PWNP/EF433tQbk0wET56QtfUECk/fkUvOc/98VAoc4hPPXvA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750295103; c=relaxed/simple;
	bh=ZCQ+sWv+kQaZZrdKs3rCAYePM6dCyF/eP1qin3deuM8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kn3xApLkqJqMgFRXOwr0MR0axi4nvJrjvWcUBdR7oHu23AiwDNmBri4jU4AC+erLqXTVwaxIkhgbxnAniINCRBs4gTLLM1KqO3Ge/NXxLe10ZOpxajMxdTuTE0mqB7+Rz5n4hlTCNvhK3kH7PhvVeLFIZBlZnDJi9ccRw/+4veM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GPEBCXdu; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GPEBCXdu"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-234bfe37cccso4447165ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 18:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750295100; x=1750899900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h4TaMBScWlO5o6sQQ8rBV8o4/7whbCNqAJF2fPQ5Lds=;
        b=GPEBCXduR7XRIeiZK9/e2v+VPc+cBdTorNqQ2ZRE68PgF2dUrVmCCJajIDDfETIh9Y
         AL6YzsUiG32TVK5g/WigRHMOmOIvE09HUHxvN/9HC80TQPiQHyfVo+BcgHgY7+FEAtXk
         uJuknZMMteYCHphbjNeI89V03Z+StM+sHPYKk4SkH98+HrpawLRUAfoXBuQMlx1i7QC6
         zahpJRZpRa4C/geKeqQMz1K8qpGeYdapNJrlMS6kTp5ivg7NUVOSE/6bimNshSLi8x5W
         660fVjZDhCwJ6NlQfAlul5gLqNQJ16lcEXQVODoSPsJtMljBhxTFR/9DlgOFzD/hAI/d
         bc8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750295100; x=1750899900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h4TaMBScWlO5o6sQQ8rBV8o4/7whbCNqAJF2fPQ5Lds=;
        b=fBWbg360HUyp0bxpyTB2q4bQgl+aRClQNV5lnmeVxQsiWRPIpEYcN2pBKGKRvLKLQ/
         maRCk7/cD6GHd1jlUkqMuLDz0Z+Rsd0VXvbSX8eaKcIaSaLzJ+wXg77XRwiZNKohWZYT
         xgqx7vDb1E7tUQlj0kbsmXZt+g4vm0xloIjX03pFH+lX0797YRvFjOaFk52xVBXUSsOv
         G0+MnaVWxuFIadztiDvKeJVVIwLsZSQ5eoPDFI1Yvqrl8laLab9C754rxXFJuTeugAZi
         pJhboo5OgqcG4seuLtIHFdAziXnchVe0DB0R7nEfrlyXdAWzMP/k46seLZVtUd0CxlXr
         9g8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXIkw+yXM6gXOreDMmCJXrjmH4U1kUBI5G0vpFAhbCltaRybSjrRQqu97roAKw11EE3aej6otOAjkaISA0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRxtdaGFbXBva7ZrMHapa015r8ycgjxl38GxexoD226YJVSwKy
	GnLyOQWEUFfjxeBmcNAq3Vr7CPdMBIG7gIKSpdERKVGkFlYTT5AXUnJB48zgUA==
X-Gm-Gg: ASbGnctuifMtisChuptgcsJkStA3s6QyHVfW7+sCPfs3zIo0M/+VgzhKA0B/3c4+J7V
	CaGkfkQEQaLQ0tXKgUrpaSL7mZ3/hvZLZ/wqgdQRGNbAUN7fLTUlRrmm3EEGp5cQCxleY94r0I+
	hCef2WKM5ZOTdNr+rMAaIyIIHRF3DlYxl+Oqa4fO08F+EKz2ZQ+OXUpjS++DCgN0CbEjtXKvVKz
	Po9MhpHCwdwpBJND+LPhB3EhStoTLL6KRfqtSKV72xC97pqQJI6AMsQsUBMQ3RwxhvykyuLOKHU
	lfWz30AiRRotbKRYek8fNAnRAFT36v9QWC1+uiruyJIm06x261IYG2mwTxIzdjfRi7PuDhI6ubL
	qr3jM08NJfVe9Wh1j2FtdR3PmIHdsBdN/
X-Google-Smtp-Source: AGHT+IHEfEf0xDbJiz2jaCicc177c2yJr3e0LtxHwGoglzOoG3x2iUoBfgOElxhGTXsOdLYdWMv4lA==
X-Received: by 2002:a17:903:2ace:b0:234:9068:ed99 with SMTP id d9443c01a7336-2366b14d37amr314881505ad.24.1750295100386;
        Wed, 18 Jun 2025 18:05:00 -0700 (PDT)
Received: from ikb-h07-29-noble.in.iijlab.net ([202.214.97.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365e0cffe6sm107190415ad.245.2025.06.18.18.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 18:04:59 -0700 (PDT)
Received: by ikb-h07-29-noble.in.iijlab.net (Postfix, from userid 1010)
	id 6DB93ED6540; Thu, 19 Jun 2025 10:04:57 +0900 (JST)
From: Hajime Tazaki <thehajime@gmail.com>
To: linux-um@lists.infradead.org
Cc: thehajime@gmail.com,
	ricarkol@google.com,
	Liam.Howlett@oracle.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 12/13] um: nommu: add documentation of nommu UML
Date: Thu, 19 Jun 2025 10:04:16 +0900
Message-ID: <220f0cc76f3dca8e6958c107e77976f255e096e1.1750294482.git.thehajime@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750294482.git.thehajime@gmail.com>
References: <cover.1750294482.git.thehajime@gmail.com>
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

