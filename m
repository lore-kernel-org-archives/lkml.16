Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34F925C6EE
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 18:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747333409; cv=none; b=ZiZFAanoAVi+CMJUcSjTMCSlkH7i3V9Cpd80SzcGz0qYHjhYC9Wq34AFPaPj5raOG9O1fzYapUKI/kRltAciRKzG2rrnCvZ1qOdE5CzX77cI4s4wYHraLOkWfgjJikjKWUJSihZd5/vgwMhtGYKrzkhA9vBtna1Q8BNsQXr2y3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747333409; c=relaxed/simple;
	bh=AV1mdLMhttAbVzj/bEmj7uxlWqhHoC7CT2QcgUdf6KA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=Q0cZo6cChfJ/ywjk0nHhh7ttpIVzRzmkN1rJU3JBYbUfYWpmowlB4+ixysr3lQDTp6INIeNTMx4UGFbWFUL9mW1XCbUkhCvXJm59hLd+LCMFkJ9AG5kmlqDhbBw3bY18z85V7YyxCwynk5rmQagYMhu5F4b60/MZ1+Dubs/C96Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=A50TEbb8; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="A50TEbb8"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c9376c4bddso142065185a.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 11:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1747333406; x=1747938206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=A0jheAFoxaIUcUfzIFzIBnTjDodf4OGSNMDK16pdaY4=;
        b=A50TEbb8iLZf6b/jde0hVvOvy/AKPzFinoQ2AaOrv95EA9d4J5ElfyzoG8Vo/ifheW
         XbV2qEOaCkIqXPOC458G79nPDIjAQ5AWNUZJKL3H+gapWfmlQh7CKYPfDYRI6Xz4VAdW
         Ca3s/KP0sTiPNF4dYpCTM732pLVczHDjbclQPxLidsDrQFPVPu9sYVu24BlFbCc2fKUk
         mnit44OpInCv81nkwwbquP3P7zsbIVQApTXT07mL0fUIOnmR+GNDLNl7V5WiFQ3l9+DW
         8S2JE4qgMxw4ErKi9CSc4KsvKHKOsH2vGKsxg27scNBor80cZGU2X1bek3XQqcyImLJx
         qe9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747333406; x=1747938206;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A0jheAFoxaIUcUfzIFzIBnTjDodf4OGSNMDK16pdaY4=;
        b=DS1Fnf84ON2wReRL/NrS6Cndn6+C1TL2OQv2kIJpgoklBf+9PVHhqG3arHxwT5KfOw
         Z1CeRmC8V7MQvHQbclnM2JeFt8/rrMEwXSrVm5vfyQLyNpF2vDejQ1DfXNMZZxh80LSn
         1p1g4Ja+qnsphWuMhkjLA+dl99fBpKMccKR0BfKFDaBLoAEUmu04rseZjEIYXetHlKOU
         mA1/QGEPAWdSw24J72gtBgAnd2Mib5dDj3koXdUJ/gRRhlOPRAEskrahnUbW3QN9zQEV
         MP/pRIEkkhnBl9uNsWxSmHw89+U4rz1gXYcpCSRc59bGsIhEy2SGaxS+ejXbJjOasFyQ
         MFbg==
X-Forwarded-Encrypted: i=1; AJvYcCX82T+ZbCY3366B2ywJxXLegYotxjtJQoMQlJ1p931m0xWB41qEj4xdWgrKDNOR5ftTkVjS1JNpCttlUFg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBjdfjLjqda2BKUSmteIpOeMJ0NRf+phUKYpFqR787LWt5jlhz
	lQ/HijYg8H21XVD4diiHkBcRGi2exQh3sMKVX3/7byFXDE50Y+H6pJGzkoulYcmcyTg=
X-Gm-Gg: ASbGncuh3KlppkMGcMbuprop85wJ3AKUnH8Vtjd/jWgffX+tCWegM5jSCyLgXQs9xjw
	16SsyBikkis861EGa76cqvRYkuIibXuqhTIzqS017yT0v4Fee9yiklpWgL42ncv6LV9C3V7Aijk
	dGVS2JFmDEVFY7SQtKiY0RgY7APuobN2qzfib9hcQACFAQPBZFM/u5Jy2WJ2UUT+DEWRLPtDpI0
	O+HhLVLWUMil1foJfTOC4OqrdXAio/W8rMKlWsTRsK57ADS23YGTfFfprfOAoo73fWmi1PPdDgd
	hGli1Jb4l6h+1Ff5Py0n65RQ7/WphvYreQa0NqafMh+g4Tq4ALDK0Yh+EV/xb4aHspCKoGRo2/A
	UseDEtIkdaZDFxBZOiqQRWOKM8A0TpkJRu/zCtSg9+FAn
X-Google-Smtp-Source: AGHT+IGaP37dLC0NYarBXoAi3DGllHD5VhY+J/RcWIfEL0jL4jdfyJMjPFWTgN13G/j982eFmRP46g==
X-Received: by 2002:a05:620a:3199:b0:7c9:6707:b466 with SMTP id af79cd13be357-7cd46718950mr63091585a.11.1747333406587;
        Thu, 15 May 2025 11:23:26 -0700 (PDT)
Received: from soleen.c.googlers.com.com (138.200.150.34.bc.googleusercontent.com. [34.150.200.138])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd466fc2afsm18218685a.0.2025.05.15.11.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 11:23:26 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: pratyush@kernel.org,
	jasonmiu@google.com,
	graf@amazon.com,
	changyuanl@google.com,
	pasha.tatashin@soleen.com,
	rppt@kernel.org,
	dmatlack@google.com,
	rientjes@google.com,
	corbet@lwn.net,
	rdunlap@infradead.org,
	ilpo.jarvinen@linux.intel.com,
	kanie@linux.alibaba.com,
	ojeda@kernel.org,
	aliceryhl@google.com,
	masahiroy@kernel.org,
	akpm@linux-foundation.org,
	tj@kernel.org,
	yoann.congal@smile.fr,
	mmaurer@google.com,
	roman.gushchin@linux.dev,
	chenridong@huawei.com,
	axboe@kernel.dk,
	mark.rutland@arm.com,
	jannh@google.com,
	vincent.guittot@linaro.org,
	hannes@cmpxchg.org,
	dan.j.williams@intel.com,
	david@redhat.com,
	joel.granados@kernel.org,
	rostedt@goodmis.org,
	anna.schumaker@oracle.com,
	song@kernel.org,
	zhangguopeng@kylinos.cn,
	linux@weissschuh.net,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	gregkh@linuxfoundation.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	rafael@kernel.org,
	dakr@kernel.org,
	bartosz.golaszewski@linaro.org,
	cw00.choi@samsung.com,
	myungjoo.ham@samsung.com,
	yesanishhere@gmail.com,
	Jonathan.Cameron@huawei.com,
	quic_zijuhu@quicinc.com,
	aleksander.lobakin@intel.com,
	ira.weiny@intel.com,
	andriy.shevchenko@linux.intel.com,
	leon@kernel.org,
	lukas@wunner.de,
	bhelgaas@google.com,
	wagi@kernel.org,
	djeffery@redhat.com,
	stuart.w.hayes@gmail.com,
	ptyadav@amazon.de
Subject: [RFC v2 00/16] Live Update Orchestrator
Date: Thu, 15 May 2025 18:23:04 +0000
Message-ID: <20250515182322.117840-1-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This v2 series introduces the LUO, a kernel subsystem designed to
facilitate live kernel updates with minimal downtime,
particularly in cloud delplyoments aiming to update without fully
disrupting running virtual machines.

This series builds upon KHO framework [1] by adding programmatic
control over KHO's lifecycle and leveraging KHO for persisting LUO's
own metadata across the kexec boundary. The git branch for this series
can be found at:
https://github.com/googleprodkernel/linux-liveupdate/tree/luo/rfc-v2

Changelog from v1:
- Control Interface: Shifted from sysfs-based control
  (/sys/kernel/liveupdate/{prepare,finish}) to an ioctl interface
  (/dev/liveupdate). Sysfs is now primarily for monitoring the state.
- Event/State Renaming: LIVEUPDATE_REBOOT event/phase is now
  LIVEUPDATE_FREEZE.
- FD Preservation: A new component for preserving file descriptors.
  Subsystem Registration: A formal mechanism for kernel subsystems
  to participate.
- Device Layer: removed device list handling from this series, it is
  going to be added separately.
- Selftests: Kernel-side selftest hooks and userspace selftests are
  now included.
KHO Enhancements:
- KHO debugfs became optional, and kernel APIs for finalize/abort
  were added (driven by LUO's needs).
- KHO unpreserve functions were also added.

What is Live Update?
Live Update is a specialized reboot process where selected kernel
resources (memory, file descriptors, and eventually devices) are kept
operational or their state preserved across a kernel transition (e.g.,
via kexec). For certain resources, DMA and interrupt activity might
continue with minimal interruption during the kernel reboot.

LUO v2 Overview:
LUO v2 provides a framework for coordinating live updates. It features:
State Machine: Manages the live update process through states:
NORMAL, PREPARED, FROZEN, UPDATED.

KHO Integration:

LUO programmatically drives KHO's finalization and abort sequences.
KHO's debugfs interface is now optional configured via
CONFIG_KEXEC_HANDOVER_DEBUG.

LUO preserves its own metadata via KHO's kho_add_subtree and
kho_preserve_phys() mechanisms.

Subsystem Participation: A callback API liveupdate_register_subsystem()
allows kernel subsystems (e.g., KVM, IOMMU, VFIO, PCI) to register
handlers for LUO events (PREPARE, FREEZE, FINISH, CANCEL) and persist a
u64 payload via the LUO FDT.

File Descriptor Preservation: Infrastructure
liveupdate_register_filesystem, luo_register_file, luo_retrieve_file to
allow specific types of file descriptors (e.g., memfd, vfio) to be
preserved and restored.

Handlers for specific file types can be registered to manage their
preservation and restoration, storing a u64 payload in the LUO FDT.

Example WIP for memfd preservation can be found here [2].

User-space Interface:

ioctl (/dev/liveupdate): The primary control interface for
triggering LUO state transitions (prepare, freeze, finish, cancel)
and managing the preservation/restoration of file descriptors.
Access requires CAP_SYS_ADMIN.

sysfs (/sys/kernel/liveupdate/state): A read-only interface for
monitoring the current LUO state. This allows userspace services to
track progress and coordinate actions.

Selftests: Includes kernel-side hooks and userspace selftests to
verify core LUO functionality, particularly subsystem registration and
basic state transitions.

LUO State Machine and Events:

NORMAL:   Default operational state.
PREPARED: Initial preparation complete after LIVEUPDATE_PREPARE
          event. Subsystems have saved initial state.
FROZEN:   Final "blackout window" state after LIVEUPDATE_FREEZE
          event, just before kexec. Workloads must be suspended.
UPDATED:  Next kernel has booted via live update. Awaiting restoration
          and LIVEUPDATE_FINISH.

Events:
LIVEUPDATE_PREPARE: Prepare for reboot, serialize state.
LIVEUPDATE_FREEZE:  Final opportunity to save state before kexec.
LIVEUPDATE_FINISH:  Post-reboot cleanup in the next kernel.
LIVEUPDATE_CANCEL:  Abort prepare or freeze, revert changes.

[1] https://lore.kernel.org/all/20250509074635.3187114-1-changyuanl@google.com
    https://github.com/googleprodkernel/linux-liveupdate/tree/luo/kho-v8
[2] https://github.com/googleprodkernel/linux-liveupdate/tree/luo/memfd-v0.1

RFC v1: https://lore.kernel.org/all/20250320024011.2995837-1-pasha.tatashin@soleen.com

Changyuan Lyu (1):
  kho: add kho_unpreserve_folio/phys

Pasha Tatashin (15):
  kho: make debugfs interface optional
  kho: allow to drive kho from within kernel
  luo: luo_core: Live Update Orchestrator
  luo: luo_core: integrate with KHO
  luo: luo_subsystems: add subsystem registration
  luo: luo_subsystems: implement subsystem callbacks
  luo: luo_files: add infrastructure for FDs
  luo: luo_files: implement file systems callbacks
  luo: luo_ioctl: add ioctl interface
  luo: luo_sysfs: add sysfs state monitoring
  reboot: call liveupdate_reboot() before kexec
  luo: add selftests for subsystems un/registration
  selftests/liveupdate: add subsystem/state tests
  docs: add luo documentation
  MAINTAINERS: add liveupdate entry

 .../ABI/testing/sysfs-kernel-liveupdate       |  51 ++
 Documentation/admin-guide/index.rst           |   1 +
 Documentation/admin-guide/liveupdate.rst      |  62 ++
 .../userspace-api/ioctl/ioctl-number.rst      |   1 +
 MAINTAINERS                                   |  14 +-
 drivers/misc/Kconfig                          |   1 +
 drivers/misc/Makefile                         |   1 +
 drivers/misc/liveupdate/Kconfig               |  60 ++
 drivers/misc/liveupdate/Makefile              |   7 +
 drivers/misc/liveupdate/luo_core.c            | 547 +++++++++++++++
 drivers/misc/liveupdate/luo_files.c           | 664 ++++++++++++++++++
 drivers/misc/liveupdate/luo_internal.h        |  59 ++
 drivers/misc/liveupdate/luo_ioctl.c           | 203 ++++++
 drivers/misc/liveupdate/luo_selftests.c       | 283 ++++++++
 drivers/misc/liveupdate/luo_selftests.h       |  23 +
 drivers/misc/liveupdate/luo_subsystems.c      | 413 +++++++++++
 drivers/misc/liveupdate/luo_sysfs.c           |  92 +++
 include/linux/kexec_handover.h                |  27 +
 include/linux/liveupdate.h                    | 214 ++++++
 include/uapi/linux/liveupdate.h               | 324 +++++++++
 kernel/Kconfig.kexec                          |  10 +
 kernel/Makefile                               |   1 +
 kernel/kexec_handover.c                       | 343 +++------
 kernel/kexec_handover_debug.c                 | 237 +++++++
 kernel/kexec_handover_internal.h              |  74 ++
 kernel/reboot.c                               |   4 +
 tools/testing/selftests/Makefile              |   1 +
 tools/testing/selftests/liveupdate/.gitignore |   1 +
 tools/testing/selftests/liveupdate/Makefile   |   7 +
 tools/testing/selftests/liveupdate/config     |   6 +
 .../testing/selftests/liveupdate/liveupdate.c | 440 ++++++++++++
 31 files changed, 3933 insertions(+), 238 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-kernel-liveupdate
 create mode 100644 Documentation/admin-guide/liveupdate.rst
 create mode 100644 drivers/misc/liveupdate/Kconfig
 create mode 100644 drivers/misc/liveupdate/Makefile
 create mode 100644 drivers/misc/liveupdate/luo_core.c
 create mode 100644 drivers/misc/liveupdate/luo_files.c
 create mode 100644 drivers/misc/liveupdate/luo_internal.h
 create mode 100644 drivers/misc/liveupdate/luo_ioctl.c
 create mode 100644 drivers/misc/liveupdate/luo_selftests.c
 create mode 100644 drivers/misc/liveupdate/luo_selftests.h
 create mode 100644 drivers/misc/liveupdate/luo_subsystems.c
 create mode 100644 drivers/misc/liveupdate/luo_sysfs.c
 create mode 100644 include/linux/liveupdate.h
 create mode 100644 include/uapi/linux/liveupdate.h
 create mode 100644 kernel/kexec_handover_debug.c
 create mode 100644 kernel/kexec_handover_internal.h
 create mode 100644 tools/testing/selftests/liveupdate/.gitignore
 create mode 100644 tools/testing/selftests/liveupdate/Makefile
 create mode 100644 tools/testing/selftests/liveupdate/config
 create mode 100644 tools/testing/selftests/liveupdate/liveupdate.c

-- 
2.49.0.1101.gccaa498523-goog

