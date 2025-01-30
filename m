Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C391A83FF
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 22:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.167.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738275123; cv=none; b=ENMtnroMzi39Aj1LbUsaKsZ8zGUNNBFY8ZydAIAMhJn7MzQaa0PMtfWjfj0KG0Sy+kEUYpWTzCg3T5Psys1vD/Re1x2ruONwXI9hROnt/0RaNkWdvc7JNxKf0hEpS66HaIFo6PrC0Qp6HXjfgZf3Lu/hXib9XUUjUqJMm0lYROc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738275123; c=relaxed/simple;
	bh=hVdEI3K+9jxptba0BRAj97ATiuGcVgl1mXqLZ5xJMEw=;
	h=Date:From:To:Cc:Message-ID:Subject:MIME-Version:Content-Type; b=KAQzy5eYAqnaXZXEzQOLQ1X71O07rcHWSoAUPmp5g9UmfAQiDxmc+ZeUwG3rM12OY8OVuMWH5NT8UX0mAKMHlpK6BgyuP7afkJf1Ncf4Exg2lq6mhgWy8Zx7xsGcxI5xDrdtJLMijLz7rH7bj8I95XgoXz1jB4EAKhK8DMSck2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at; spf=fail smtp.mailfrom=nod.at; arc=none smtp.client-ip=116.203.167.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id B30762D99A1;
	Thu, 30 Jan 2025 23:11:58 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id T4gBdwkU6e-S; Thu, 30 Jan 2025 23:11:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 55B9F2D99A3;
	Thu, 30 Jan 2025 23:11:58 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id CiQBvjWkWIkJ; Thu, 30 Jan 2025 23:11:58 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 3460F2D99A1;
	Thu, 30 Jan 2025 23:11:58 +0100 (CET)
Date: Thu, 30 Jan 2025 23:11:58 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: torvalds <torvalds@linux-foundation.org>
Cc: linux-um <linux-um@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <1821733080.304331864.1738275118129.JavaMail.zimbra@nod.at>
Subject: [GIT PULL] UML changes for v6.14
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF133 (Linux)/8.8.12_GA_3809)
Thread-Index: v88nChWzqiiR35i8gNV/Qi+JAxAQgQ==
Thread-Topic: UML changes for v6.14

Linus,

The following changes since commit fc033cf25e612e840e545f8d5ad2edd6ba613ed5:

  Linux 6.13-rc5 (2024-12-29 13:15:45 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/uml/linux.git tags/uml-for-linus-6.14-rc1

for you to fetch changes up to 2d2b61ae38bd91217ea7cc5bc700a2b9e75b3937:

  um: Remove unused asm/archparam.h header (2025-01-13 17:19:43 +0100)

----------------------------------------------------------------
This pull request contains the following changes for UML:

- hostfs: Convert to writepages
- Many cleanups: Removal of dead macros, missing __init

----------------------------------------------------------------
Benjamin Berg (1):
      um: rtc: use RTC time when calculating the alarm

Matthew Wilcox (Oracle) (1):
      hostfs: Convert to writepages

Tiwei Bie (14):
      um: Remove unused MODULES_LEN macro
      um: Remove obsolete fixmap support
      um: Count iomem_size only once in physmem calculation
      um: Mark parse_host_cpu_flags as __init
      um: Mark parse_cache_line as __init
      um: Mark get_top_address as __init
      um: Mark set_stklim as __init
      um: Mark install_fatal_handler as __init
      um: Mark setup_env_path as __init
      um: Remove unused PGD_BOUND macro
      um: Remove unused THREAD_NAME_LEN macro
      um: Remove unused user_context function
      um: Include missing headers in asm/pgtable.h
      um: Remove unused asm/archparam.h header

 arch/um/drivers/rtc_kern.c         |  7 +++--
 arch/um/include/asm/fixmap.h       | 56 --------------------------------------
 arch/um/include/asm/pgtable.h      |  7 ++---
 arch/um/kernel/mem.c               | 15 +++-------
 arch/um/kernel/process.c           |  8 ------
 arch/um/kernel/um_arch.c           | 12 ++++----
 arch/um/os-Linux/main.c            |  8 ++----
 arch/x86/um/asm/archparam.h        | 20 --------------
 arch/x86/um/shared/sysdep/ptrace.h |  2 --
 fs/hostfs/hostfs_kern.c            | 54 +++++++++++++++++-------------------
 10 files changed, 46 insertions(+), 143 deletions(-)
 delete mode 100644 arch/um/include/asm/fixmap.h
 delete mode 100644 arch/x86/um/asm/archparam.h
