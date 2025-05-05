Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782E821171C
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 11:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746443427; cv=none; b=BYI4fNg9t3jjzdpSQNcvWJdG16TKcIOzWYINtCoLLRgN8aQLDd2nnoyomsimHUM2TwoVKwTcswFZrP+se2RKTm8OpDpjAKguKag+lAFlUyxj79YQ2rJQQx+ulcJxXPvbkjwsLPYORF1UFzXAVsPrQkuX/f4mNl5QBKXeJS4YKio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746443427; c=relaxed/simple;
	bh=5vtxFt+FDAMG+JqSjXdeN35WJXJGmK1U4No98GdjhRw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eu1ezBVMrBeAyoSh8KOjFElHYwIqGiL5qr/jWBJTr1jeFLbSgsYh5aQsltUEXXXGxUU7hEfb/NzqaV9AgGp5NpqCkXPGWrnuTwLvRWrs857dyUmzpNPtPrLyanu9YTH6Gf23KKtRzpDJoSyFBAy4GQneaMLAlrXEG3qGW937lIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nf92LAKq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nf92LAKq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D712C4CEEF;
	Mon,  5 May 2025 11:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746443427;
	bh=5vtxFt+FDAMG+JqSjXdeN35WJXJGmK1U4No98GdjhRw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nf92LAKqTIV3bCKzPkfjX9f+PlO33a2wILVwiJ/sad8ws8znrVYey2XmpDW3szBGZ
	 cckgU0q1V1FrCF9dAu0+O8D3PeYTRLQgk9NiQatwhJaGuCuSZ0efhJiuODvTc/xWG/
	 wEb+QknCQybxYQW5sRJ/2LqtQFR+xZYZbRVFKMVc/pv1H3eWE6C0eqYBeDknpKfwA/
	 tHIZNNGvZgdVOs1RaO5zgdP/0yA6wtReu5jbTs8V5BTOK0tPBouK6LoPgQVapF2Vgt
	 5aPp3nXIhDD4y8qKVHKUlAJUxfb2ebey3dAuAtPCfLMIj+Oa1I/p22L3/Jb5ezgaRM
	 ZJIJ/qpCxqi4Q==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Michal Marek <michal.lkml@markovi.net>,
	Rik van Riel <riel@surriel.com>
Subject: [PATCH 11/15] x86/kconfig/64: Enable popular MM options in the defconfig
Date: Mon,  5 May 2025 13:09:42 +0200
Message-ID: <20250505110946.1095363-12-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250505110946.1095363-1-mingo@kernel.org>
References: <20250505110946.1095363-1-mingo@kernel.org>
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
 arch/x86/configs/defconfig.x86_64 | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/x86/configs/defconfig.x86_64 b/arch/x86/configs/defconfig.x86_64
index 9961742fe78c..4f2fab465196 100644
--- a/arch/x86/configs/defconfig.x86_64
+++ b/arch/x86/configs/defconfig.x86_64
@@ -58,6 +58,7 @@ CONFIG_HIBERNATION=y
 CONFIG_PM_DEBUG=y
 CONFIG_PM_TRACE_RTC=y
 CONFIG_ACPI_DOCK=y
+CONFIG_ACPI_HOTPLUG_MEMORY=y
 CONFIG_ACPI_BGRT=y
 CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE=y
 CONFIG_CPU_FREQ_GOV_ONDEMAND=y
@@ -77,7 +78,26 @@ CONFIG_BLK_CGROUP_IOLATENCY=y
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

