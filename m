Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1234624BC04
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 16:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745945122; cv=none; b=eJHWSkqtg1Fa7AmKUhWTmBAex5zY28kGxSwE+pCzXMDd+C1wteURXC7ckcCHGqi1qAzs7lrbZYUfSgIgEAf5jRq3rlUz1m1+SiiSTXUhbwdHTQrWC2hzgELO6MIy/WbaH4KAY1acWIFt/C/TyZbuSp1FslSsTqv8iqE689XyBqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745945122; c=relaxed/simple;
	bh=dLT1+0GKhKxrYcniloaHh94nznCqQy65KWvfOLGDkEs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZB5wtRwhzFCq1pkuFE1LxqUXI1CF8TJXzLkoDidhg+h7CfjzxXua4tJHfY1LlxG25NvzsCjaU+yY6AYyPX5BJ50T1MjpuFL3DrN8yvgWa0fb6TvdrM99Z3VPi62zjDUB8JEUvMGuwnPxdNCV0zkqLj6VTViyLBwbE47paa53wLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y8Y4FB3z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y8Y4FB3z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70D96C4CEE3;
	Tue, 29 Apr 2025 16:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745945121;
	bh=dLT1+0GKhKxrYcniloaHh94nznCqQy65KWvfOLGDkEs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y8Y4FB3z8SR4PFSf6QPg86VmWnBdUybnUTqEwTi+H9FkZcSEBYQZh8jjl0MMJhmce
	 AH+IQCkUs08IPLU5AfVv6UQAmpI/GSQedJOMQf+0RsMsxUW5pyGsccTWY79ZUfecQX
	 3/A8brNId5iep9n5mY2DE7a6wJnfvU+UeKsyGmbGPElcdLt4wYLMoWROdXjUN53s+4
	 mKir+L+ddLcjJgUZjCItXyICYErSK0VEjIqU/V2PWCVbliZ1/jmsJ3Tv86yLhjr7d0
	 OaBmEAHZETB+Du+y1nez2jfDn0Un6oJidZAHgrDgbUPVnko5v2fJiL8J9E3k3BQEKK
	 yGG8V4wwUkVDA==
From: carlos.bilbao@kernel.org
To: tglx@linutronix.de,
	seanjc@google.com,
	jan.glauber@gmail.com
Cc: bilbao@vt.edu,
	pmladek@suse.com,
	akpm@linux-foundation.org,
	jani.nikula@intel.com,
	linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org,
	takakura@valinux.co.jp,
	john.ogness@linutronix.de,
	Carlos Bilbao <carlos.bilbao@kernel.org>
Subject: [PATCH v3 2/2] x86/panic: Add x86_panic_handler as default post-panic behavior
Date: Tue, 29 Apr 2025 10:06:38 -0500
Message-ID: <20250429150638.1446781-3-carlos.bilbao@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250429150638.1446781-1-carlos.bilbao@kernel.org>
References: <20250429150638.1446781-1-carlos.bilbao@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Carlos Bilbao <carlos.bilbao@kernel.org>

Add function x86_panic_handler() as the default behavior for x86 for
post-panic stage via panic_set_handling(). Instead of busy-wait loop, it
will halt if there's no console to save CPU cycles.

Signed-off-by: Carlos Bilbao (DigitalOcean) <carlos.bilbao@kernel.org>
Reviewed-by: Jan Glauber (DigitalOcean) <jan.glauber@gmail.com>
---
 arch/x86/kernel/setup.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index 9d2a13b37833..abca4a9b5e0a 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -16,6 +16,7 @@
 #include <linux/initrd.h>
 #include <linux/iscsi_ibft.h>
 #include <linux/memblock.h>
+#include <linux/panic.h>
 #include <linux/panic_notifier.h>
 #include <linux/pci.h>
 #include <linux/root_dev.h>
@@ -837,6 +838,20 @@ static void __init x86_report_nx(void)
 	}
 }
 
+/*
+ * Halt the CPU to save resources after panic is handled. If
+ * console_trylock() succeeds, no other CPU is currently writing to the
+ * console
+ *
+ */
+static void x86_panic_handler(void)
+{
+	if (console_trylock()) {
+		console_unlock();
+		safe_halt();
+	}
+}
+
 /*
  * Determine if we were loaded by an EFI loader.  If so, then we have also been
  * passed the efi memmap, systab, etc., so we should use these data structures
@@ -1252,6 +1267,8 @@ void __init setup_arch(char **cmdline_p)
 #endif
 
 	unwind_init();
+
+	panic_set_handling(x86_panic_handler, 0);
 }
 
 #ifdef CONFIG_X86_32
-- 
2.47.1

