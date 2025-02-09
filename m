Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF342236E0
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 21:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739135077; cv=none; b=WTcg7+eKU+PvOzRoR5ljPxyXaJZ+Ru83gi2Rya9uS1dHqzOv5Gh5LgQ7FQaEzpeQW884iKJxTDfENU3eUVrX0engR9NYMyRc3Yw5IV10UiUxx64TZmYmnnDBPCgrdxhvfVtcxOSXdyBkQqN6oGhcWHYiwwi3vC0jThUE9H3S1Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739135077; c=relaxed/simple;
	bh=xtn9X8L9b8Xb18z4TysEAIfQI+RE3To0yIZLw3xlGWE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HJbaziMe8YgTNjcnoE8HQcQw/qdzQQqjdqjQYRujQdCv6FWvqwNCP2ZW6o4WAQXNOhj0I43dwLIio3RNJ5Fs9g/DmOfRzthbkvDiVrRClM5jbO/XV81DPInEnXGzDsjxjw5BtQh2FZhh129obREbnUERRCs5Avv/B9y5ovmndCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jtvGaH3j; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jtvGaH3j"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739135072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iB21UBxBOf2HmOoZFVaLygQOGx5XhPpZsQkqJBOlnkg=;
	b=jtvGaH3j0GLir1ybiLxDQl6qINnr7M/fsKYJw2E0yqsrj4/fKn3E8+pFQIeTyJpxkCvFmE
	rPF97HGL3A8m8IjvSY5mL0FvLGoUpXMEz3YwKxDaK9HaWbS4A1HONLJdH2NUKjO1CpcW9a
	eFAxoNGYZ+65DOftah/+ziRbK4a204I=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] x86/apic: Use str_disabled_enabled() helper in print_ipi_mode()
Date: Sun,  9 Feb 2025 22:03:32 +0100
Message-ID: <20250209210333.5666-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Remove hard-coded strings by using the str_disabled_enabled() helper.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/x86/kernel/apic/ipi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/apic/ipi.c b/arch/x86/kernel/apic/ipi.c
index 5da693d633b7..942168da7195 100644
--- a/arch/x86/kernel/apic/ipi.c
+++ b/arch/x86/kernel/apic/ipi.c
@@ -3,6 +3,7 @@
 #include <linux/cpumask.h>
 #include <linux/delay.h>
 #include <linux/smp.h>
+#include <linux/string_choices.h>
 
 #include <asm/io_apic.h>
 
@@ -23,7 +24,7 @@ __setup("no_ipi_broadcast=", apic_ipi_shorthand);
 static int __init print_ipi_mode(void)
 {
 	pr_info("IPI shorthand broadcast: %s\n",
-		apic_ipi_shorthand_off ? "disabled" : "enabled");
+		str_disabled_enabled(apic_ipi_shorthand_off));
 	return 0;
 }
 late_initcall(print_ipi_mode);
-- 
2.48.1

