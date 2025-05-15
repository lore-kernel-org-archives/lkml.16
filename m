Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C18F29A9F2
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 12:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747310864; cv=none; b=Ic/Oj2XCyJ+4i+0i6MCZ1oRi0jqQhzkBZ8oC1uhUJwpLQ1Ps/oi28fpjhrqLttjB07v8eLcvPtX7AU/zICRdAY0jjkmGIqZg01Pc+RRKvYN/U5oBtNNEKc8qqTYRAVUzRyY8z2yiZnUfHTYNxRkmSqkLQ9iJEmJVeIRiB9WHdTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747310864; c=relaxed/simple;
	bh=ghtJHtFBHkIc5taAz+aoDzaw9paxhJ7baLkAGjJxESM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JsHhc/7n/eSsu0hDTcCkbMEP6MbubLBzmvOsPVnfD+VW7y3k006RqD5QLyYpqSWNlUyLDmVGRjXXPeBXl0VxfTWWLjRriOAOxVSHfRze4/L44T41ANb4Z2NOjf+l+6gpoSgIB2AnIWOeHFgnpPwpkeNEtlirvEs5ca5TNpElnTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I6tsl2e0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I6tsl2e0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B9CFC4CEE7;
	Thu, 15 May 2025 12:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747310864;
	bh=ghtJHtFBHkIc5taAz+aoDzaw9paxhJ7baLkAGjJxESM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I6tsl2e0BtwlIABsxFkH4+de/9MkVa52951kTA98b0FvfP+kuK8APHvccYPEwxmRw
	 ea2ammW/HYTQEOjMqpEqo1Gd6AbgR8avFp/0xCRykDbsKT9dJbLV3OZC9oQGqCsnwT
	 YwmWUqSwgRLpED5Qqbp7/kG74wL4ft2YQw+shveyjRkKmPdGhlPwE/PGXBS0oSYs6k
	 hDlOBawijZdFmc4ifsf2PaMN6Qd7xrZYqcxMKoUu7/M16gbYozPWKuCYIWzNfJWJyY
	 1sK2vSiWUuSVMydbZJyD44NCIh9nEbS2wZRSqERmlRxGX1GWgjPoiis9iQXgBMx24R
	 jHENEjKq9MFLw==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Ingo Molnar <mingo@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Kees Cook <keescook@chromium.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: [PATCH 31/32] x86/boot/e820: Unify e820_print_type() and e820_type_to_string()
Date: Thu, 15 May 2025 14:05:47 +0200
Message-ID: <20250515120549.2820541-32-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250515120549.2820541-1-mingo@kernel.org>
References: <20250515120549.2820541-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use e820_type_to_string() to derive e820_print_type(),
and unify the messages:

 - Don't Capitalize Words Within Sentences Randomly

 - Use 'Device reserved' instead of 'Reserved'

Suggested-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: David Woodhouse <dwmw@amazon.co.uk>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
---
 arch/x86/kernel/e820.c | 50 ++++++++++++++++++++------------------------------
 1 file changed, 20 insertions(+), 30 deletions(-)

diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
index fe3e078a4064..10c6e7dc72d7 100644
--- a/arch/x86/kernel/e820.c
+++ b/arch/x86/kernel/e820.c
@@ -68,6 +68,26 @@ unsigned long pci_mem_start = 0xaeedbabe;
 EXPORT_SYMBOL(pci_mem_start);
 #endif
 
+__init static const char * e820_type_to_string(enum e820_type type)
+{
+	switch (type) {
+	case E820_TYPE_RAM:		return "System RAM";
+	case E820_TYPE_ACPI:		return "ACPI tables";
+	case E820_TYPE_NVS:		return "ACPI non-volatile storage";
+	case E820_TYPE_UNUSABLE:	return "Unusable memory";
+	case E820_TYPE_PRAM:		return "Persistent memory (legacy)";
+	case E820_TYPE_PMEM:		return "Persistent memory";
+	case E820_TYPE_RESERVED:	return "Device reserved";
+	case E820_TYPE_13:		return "Type 13";
+	default:			return "Unknown E820 type";
+	}
+}
+
+__init static void e820_print_type(enum e820_type type)
+{
+	pr_cont(" %s", e820_type_to_string(type));
+}
+
 /*
  * This function checks if any part of the range <start,end> is mapped
  * with type.
@@ -186,21 +206,6 @@ __init void e820__range_add(u64 start, u64 size, enum e820_type type)
 	__e820__range_add(e820_table, start, size, type);
 }
 
-__init static void e820_print_type(enum e820_type type)
-{
-	switch (type) {
-	case E820_TYPE_RAM:		pr_cont(" System RAM");				break;
-	case E820_TYPE_RESERVED:	pr_cont(" device reserved");			break;
-	case E820_TYPE_SOFT_RESERVED:	pr_cont(" soft reserved");			break;
-	case E820_TYPE_ACPI:		pr_cont(" ACPI data");				break;
-	case E820_TYPE_NVS:		pr_cont(" ACPI NVS");				break;
-	case E820_TYPE_UNUSABLE:	pr_cont(" unusable");				break;
-	case E820_TYPE_PMEM:		/* Fall through: */
-	case E820_TYPE_PRAM:		pr_cont(" persistent RAM (type %u)", type);	break;
-	default:			pr_cont(" type %u", type);			break;
-	}
-}
-
 /*
  * Print out the size of a E820 region, in human-readable
  * fashion, going from KB, MB, GB to TB units.
@@ -1065,21 +1070,6 @@ __init void e820__finish_early_params(void)
 	}
 }
 
-__init static const char * e820_type_to_string(enum e820_type type)
-{
-	switch (type) {
-	case E820_TYPE_RAM:		return "System RAM";
-	case E820_TYPE_ACPI:		return "ACPI Tables";
-	case E820_TYPE_NVS:		return "ACPI Non-volatile Storage";
-	case E820_TYPE_UNUSABLE:	return "Unusable memory";
-	case E820_TYPE_PRAM:		return "Persistent Memory (legacy)";
-	case E820_TYPE_PMEM:		return "Persistent Memory";
-	case E820_TYPE_RESERVED:	return "Reserved";
-	case E820_TYPE_13:		return "Type 13";
-	default:			return "Unknown E820 type";
-	}
-}
-
 __init static unsigned long e820_type_to_iomem_type(struct e820_entry *entry)
 {
 	switch (entry->type) {
-- 
2.45.2

