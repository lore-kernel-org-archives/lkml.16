Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7B31E5B90
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 04:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745987287; cv=none; b=h498WGSPm0QSyxLv7WxWn6uUWqROQ8pPZtk/9p0uw0ks23wGfIdSgQvNfCjREHj1y/z0MveMwji+Qhf6Lq30lyq3DqWC9v7dMIXl27q6dYnRtF9Q67+x+Mt+VKurqLmArGti7V5rbdnVYoqJh4wlkgLXWHGFOIqRrHexHZnQ+p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745987287; c=relaxed/simple;
	bh=beQjAzIY4tbRs0TEUdmxjkrngcffOTKEdMuKtlPYk+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dj+c4RbGdsG0QCWmTutnLbSZFo99oS6ioDCtfXD/nGPTJbCFb/Iq5kXHGgjS2HVMO6jIXkRz7azrmMt5Proilx/GbItk7Zt2X6wXa9QCnpmanvBW+r6bfvFgCobidWI7RUYXEJyz+YMHcIogJKmhXMgQgxv/sdFF9D/kcT4qFyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V4d6/OYF; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V4d6/OYF"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-73712952e1cso7192555b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 21:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745987285; x=1746592085; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hHaVuq4Zwe9gLJutKzuA+VGXPhun5t5NN63IcV8lR68=;
        b=V4d6/OYFo9bvk4TUTx5oU8Cl4Vcx3fAdVAM6Mtomk/ctThNDLrG+M926EcJ0QR5AVO
         0ovG3x2xBtbERnYo9ZHX8pOZdOb7zzfawwwaXfLses6URlkSXqKXn9EeK6bFiD66LNCC
         LOegteog3JM7ub+xh7zJshJsOIMSkMWvAi8ofeCbY3I43S56KQfjRDCuXDp06ltDQQ++
         9fMBpusBA56ssbL8BC5z8k6WScRvrYJFVr5BBumF01kuLWbuALP9TupnbvokGTOL5wlN
         8TpLK60VhwdbqL4KQWmTJgHeHgNfUWsvaY/uazV5mvqRjsHxW+XM6GYjTaw8hxlJ4Rnn
         m7bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745987285; x=1746592085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hHaVuq4Zwe9gLJutKzuA+VGXPhun5t5NN63IcV8lR68=;
        b=Ayy+bpBWB0ncUXhNxn6u+6t23zUAqH/HDrLpO90kbFIpMzzxwqhvJRkj2lu7QnvMw9
         TwxHq9NLA58LWTI6Z0SFub0L4kdTeH0Jcg/Yx/Ek89SeEgTxzRHA3VMy9iKwJUKOuyLK
         r2R/ogSHRM1KoGd4FbAI8jEo0lpWKjr8PvPz37gx6xlqXurEyMLohu4qckLf4zxIXt9O
         Tmu8Uc2I0aXHUxL8eeTjdTIeZRoQMsajK4LQydannx5RUczDXk3+TcBFGIjBaCGdh6E3
         DaN0oeWgKtZsGvJFKcZcORDAXqUy5VjGQl80D9u0DMO5QN9g6pMp90TiEMI7L/kG6nYq
         Dihw==
X-Forwarded-Encrypted: i=1; AJvYcCUI2jgtwuhvmsxQkt21WD1qisa8Au1Yva8HJAfJNpxH+HDfaYdkctMHd7mb9XonRNMqiNKM7ofbiggKdR0=@vger.kernel.org
X-Gm-Message-State: AOJu0YywDbDVKL9wMoQBvuoiX13yrSjv9khKWiO93NA5+lIcUUG90iI7
	saND+P9iIvHc1O7LUpqz6b1KNrF8k6RE81d1zC0a0g+X7PeoxHwG
X-Gm-Gg: ASbGncsoAwyA2GsMnvTOUmI94P4jXhtmpja0hSJ7tpho0j1k/QsjjBZszNCd/14ps1Y
	rkF8GBZI8fcpzk+4DBdB/aQO6EwHKPJ+FwSjzLFpgE5pe5pTzHN75lQqAc2tmYC539snvxjgQXi
	C8LcMMxFTibXOvAeTIcdixoWgFE9FVG2iG19Uc5wi4tXrPLKMTyt2LGAcldvyMpbjU8d47nia8f
	0HHkkwSh7m8d50vW5kthHXmDqrROZqK9riD6AD7ad+FTrcUZJ11Uq3m3KyUONMp0SwiATig2fyG
	Wkmo2lWBIIRIW/ZAYVYFoqeW1Om4JLhyc4a+rX/EdunrUdDniFUUUDGh5yGRTf0VVR5y2U9TTuY
	kOtVPKZj0W4U=
X-Google-Smtp-Source: AGHT+IFcLglsLp35fpVY5aAm/RiBDEo8ho6SSo1+56LkhDY+q9Ov9DaIySaSK81WgYdSZ4+KxLTB2A==
X-Received: by 2002:a05:6a00:22d4:b0:736:8c0f:7758 with SMTP id d2e1a72fcca58-7403a784350mr1721050b3a.10.1745987285190;
        Tue, 29 Apr 2025 21:28:05 -0700 (PDT)
Received: from ikb-h07-29-noble.in.iijlab.net ([202.214.97.5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740399230e6sm648218b3a.68.2025.04.29.21.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 21:28:04 -0700 (PDT)
Received: by ikb-h07-29-noble.in.iijlab.net (Postfix, from userid 1010)
	id 798A2E94828; Wed, 30 Apr 2025 13:28:02 +0900 (JST)
From: Hajime Tazaki <thehajime@gmail.com>
To: linux-um@lists.infradead.org
Cc: thehajime@gmail.com,
	ricarkol@google.com,
	Liam.Howlett@oracle.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 11/12] um: nommu: add documentation of nommu UML
Date: Wed, 30 Apr 2025 13:27:17 +0900
Message-ID: <254209f7e93f7fcdbc16853cad9f0a0ab34c8032.1745980082.git.thehajime@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745980082.git.thehajime@gmail.com>
References: <cover.1745980082.git.thehajime@gmail.com>
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
 Documentation/virt/uml/nommu-uml.rst | 177 +++++++++++++++++++++++++++
 MAINTAINERS                          |   1 +
 2 files changed, 178 insertions(+)
 create mode 100644 Documentation/virt/uml/nommu-uml.rst

diff --git a/Documentation/virt/uml/nommu-uml.rst b/Documentation/virt/uml/nommu-uml.rst
new file mode 100644
index 000000000000..2034ba4d397a
--- /dev/null
+++ b/Documentation/virt/uml/nommu-uml.rst
@@ -0,0 +1,177 @@
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
+lmbench and (self-crafted) getpid benchmark (with v6.13-rc5 uml/next
+tree).
+
+.. csv-table:: lmbench (usec)
+  :header: ,native,um,um-nommu(s)
+
+  select-10    ,0.5569,27.0149,2.9772
+  select-100   ,2.3964,26.9242,3.8947
+  select-1000  ,20.8101,39.6842,12.8161
+  syscall      ,0.1735,25.7706,2.6997
+  read         ,0.3488,25.7922,2.7923
+  write        ,0.2861,26.5560,2.7961
+  stat         ,1.9171,36.2893,3.2678
+  open/close   ,3.8475,62.2847,6.3909
+  fork+sh      ,1159.0000,5230.3333,409.1786
+  fork+execve  ,535.3000,2075.8333,135.4074
+
+.. csv-table:: do_getpid bench (nsec)
+  :header: ,native,um,um-nommu(s)
+
+  getpid, 172 , 24979 , 2691
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
index 8e0736dc2ee0..6738c3fc1256 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24743,6 +24743,7 @@ USER-MODE LINUX (UML)
 M:	Richard Weinberger <richard@nod.at>
 M:	Anton Ivanov <anton.ivanov@cambridgegreys.com>
 M:	Johannes Berg <johannes@sipsolutions.net>
+M:	Hajime Tazaki <thehajime@gmail.com>
 L:	linux-um@lists.infradead.org
 S:	Maintained
 W:	http://user-mode-linux.sourceforge.net
-- 
2.43.0

