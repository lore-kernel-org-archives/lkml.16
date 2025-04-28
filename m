Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CC8215073
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 23:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745883925; cv=none; b=EWDFrKp+f7HlhXJGjfvp/WeeHH8prH0Dc44BCB5zgFso2Ualj9eHWLY2FM161PUzatxg3ecR8A/uL8ySg6X73m760uFsf27gdlPVInxv9UNXnvMhK+X7+ISvAHdauRgYbS2TiQl1ic3fJfJuSy54XfIHlG0o9wpikHD6gSYIqFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745883925; c=relaxed/simple;
	bh=HGh6UoyV9o1OozQau9FxeVCn04i8eEsHlhqP5cfL5L8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LJfn2/IKpdHvSHI2XtxeAmaO7GysmHlFmt65GoD22gtlXZd3w8F94tU4ExdExPu0q+a5XFRy/g04GDMCVujUOrh50M7f5ISNHSJgosT5mkzzYSgdEOJ4afoDvc/fXMrfHE2N0eSXCHJ/FnyQRspyAdLkWu2g2xJwAbI3aWLutoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EfKHgSJz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EfKHgSJz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B770C4CEEA;
	Mon, 28 Apr 2025 23:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745883924;
	bh=HGh6UoyV9o1OozQau9FxeVCn04i8eEsHlhqP5cfL5L8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EfKHgSJzbhlUMH04Y7HbnPoF3Mwr5dDp4Xbaq6hjK9zd0t811PJdO+YPTz6Rt3PQn
	 1n5Zqi168uPefCmTfg9Ox/SFGNzqy0fZWpN/UBTP/KCn9WLcQF0ntFogQJXLE2rZtX
	 4Gs5wLkd56dui5jY/5FI3hNscOiHPSUW7Mg8ySU7BSyl9vvYRrExytwhFauTT+KoXP
	 cfP0YUwI9vGP1B5QW1WB5gdnrY0Ag8J+qkoZFCaWLhJvhmJxOs2NwANVMyR7K7QQF4
	 h7VgssZdNK/6evgn6YjlTFDnoctdyWMe/Or4vXd/9jQJLuNZb5YlNT5qWm76kS5AVD
	 foSDZTw/DeaFQ==
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
Subject: [PATCH v2 2/2] x86/panic: Add x86_panic_handler as default post-panic behavior
Date: Mon, 28 Apr 2025 16:59:52 -0500
Message-ID: <20250428215952.1332985-3-carlos.bilbao@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250428215952.1332985-1-carlos.bilbao@kernel.org>
References: <20250428215952.1332985-1-carlos.bilbao@kernel.org>
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
---
 arch/x86/kernel/setup.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index 9d2a13b37833..3bfef55e9adb 100644
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
@@ -837,6 +838,15 @@ static void __init x86_report_nx(void)
 	}
 }
 
+
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
@@ -1252,6 +1262,8 @@ void __init setup_arch(char **cmdline_p)
 #endif
 
 	unwind_init();
+
+	panic_set_handling(x86_panic_handler, 1);
 }
 
 #ifdef CONFIG_X86_32
-- 
2.47.1

