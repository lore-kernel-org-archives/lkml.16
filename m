Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA2F1DDC1A
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 13:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747315679; cv=none; b=sPjSn+q4zv3Z6YHuD+2de19efU/fZfl2C3lWodBdyvCsSfPXw0R7fAFk/cXHO9rNlozZHuN7l3TFSnvCQ216v0r3m8cH8tLIFb8Lu1lCUzSMlQSOxVZj5f5AttmqC/iQE51gM12G/ShhdQGK5IQ8p6vAnXGcK/GjCNayayx/R48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747315679; c=relaxed/simple;
	bh=qshEA44pbyQ2ZLjJMguIuT/vMeoXg9Wt66BkR3pkp50=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V6cD1AOrBl2qzgFZGry8ns6vyHvHTBnHCsc4wHyYA16SoEyxL0Ymq9dTTdYTNJHnKRr9+6Z336jqDkTm+ai/zFciLye20F3B7/LzhO62qWS3F6UaIqbr8hb3QXyqEB2JTPEmkvOwpBlW48EsbAxpQnu/RRTKW66SG8jQipi/1wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jHpmeqs6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jHpmeqs6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFCA0C4CEE7;
	Thu, 15 May 2025 13:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747315679;
	bh=qshEA44pbyQ2ZLjJMguIuT/vMeoXg9Wt66BkR3pkp50=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jHpmeqs6kw5u7Do4049AbwQJxY1C3QTeqHt9/pv7WDFqeW57kFKfHwep5XU0gnmqF
	 +7tF60EJ/4O7e2zTAloBGLrjPoMkxbr495BwFf2rll0M6ml1UQXq/JOsiQgSolKsce
	 s4+HYMb6lqndofg+ifRF5u/iypH0h708n112d28ubGwghVPlifIcv4K3pWYtjT/m36
	 6pIv/TSC3g8KjPj4HhzmlhS+NkNFv/6PHU2Tq+4lshYBgr8PGkFMr2UXLwIU1riUkJ
	 7ca3v3UerVWGCH2wB2LmLwv7rm8q0IFKdej2hiXjk5cKStWncTkyYFo/rgOnRjAfE9
	 dZIQYKRdeD7qQ==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Ingo Molnar <mingo@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	=?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Michal Marek <michal.lkml@markovi.net>,
	Rik van Riel <riel@surriel.com>
Subject: [PATCH 09/13] x86/kconfig/64: Enable popular MM options in the defconfig
Date: Thu, 15 May 2025 15:27:15 +0200
Message-ID: <20250515132719.31868-10-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250515132719.31868-1-mingo@kernel.org>
References: <20250515132719.31868-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since the x86 defconfig aims to be a distro kernel work-alike with
fewer drivers and a shorter build time, enable the following
MM options that are typically enabled on major Linux distributions:

- ACPI_HOTPLUG_MEMORY, ZSWAP, SLAB hardening, MEMORY_HOTPLUG,
  MEMORY_HOTREMOVE, PAGE_REPORTING, KSM, higher DEFAULT_MMAP_MIN_ADDR,
  MEMORY_FAILURE, HWPOISON_INJECT, TRANSPARENT_HUGEPAGE,
  TRANSPARENT_HUGEPAGE_MADVISE, IDLE_PAGE_TRACKING, ZONE_DEVICE
  DEVICE_PRIVATE, ANON_VMA_NAME, USERFAULTFD, multi-gen LRU.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: David Woodhouse <dwmw@amazon.co.uk>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Rik van Riel <riel@surriel.com>
---
 arch/x86/configs/x86_64_defconfig | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/x86/configs/x86_64_defconfig b/arch/x86/configs/x86_64_defconfig
index a32ed372e5bd..02c4ba79946b 100644
--- a/arch/x86/configs/x86_64_defconfig
+++ b/arch/x86/configs/x86_64_defconfig
@@ -57,6 +57,7 @@ CONFIG_HIBERNATION=y
 CONFIG_PM_DEBUG=y
 CONFIG_PM_TRACE_RTC=y
 CONFIG_ACPI_DOCK=y
+CONFIG_ACPI_HOTPLUG_MEMORY=y
 CONFIG_ACPI_BGRT=y
 CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE=y
 CONFIG_CPU_FREQ_GOV_ONDEMAND=y
@@ -76,7 +77,26 @@ CONFIG_BLK_CGROUP_IOLATENCY=y
 CONFIG_BLK_CGROUP_IOCOST=y
 CONFIG_BLK_CGROUP_IOPRIO=y
 CONFIG_BINFMT_MISC=y
+CONFIG_ZSWAP=y
+CONFIG_SLAB_FREELIST_RANDOM=y
+CONFIG_SLAB_FREELIST_HARDENED=y
 # CONFIG_COMPAT_BRK is not set
+CONFIG_MEMORY_HOTPLUG=y
+CONFIG_MEMORY_HOTREMOVE=y
+CONFIG_PAGE_REPORTING=y
+CONFIG_KSM=y
+CONFIG_DEFAULT_MMAP_MIN_ADDR=65536
+CONFIG_MEMORY_FAILURE=y
+CONFIG_HWPOISON_INJECT=y
+CONFIG_TRANSPARENT_HUGEPAGE=y
+CONFIG_TRANSPARENT_HUGEPAGE_MADVISE=y
+CONFIG_IDLE_PAGE_TRACKING=y
+CONFIG_ZONE_DEVICE=y
+CONFIG_DEVICE_PRIVATE=y
+CONFIG_ANON_VMA_NAME=y
+CONFIG_USERFAULTFD=y
+CONFIG_LRU_GEN=y
+CONFIG_LRU_GEN_ENABLED=y
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_XFRM_USER=y
-- 
2.45.2

