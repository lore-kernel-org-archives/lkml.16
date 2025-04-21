Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA231EF090
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 18:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745261587; cv=none; b=nT6wQJNFlqqR8isk6QlWe99pV8fo1JVFaIM5Vz/ypWiEWLm5/W/ZrJkzaN/95+Y65jlXWOWF0O0tNY7a+7IIy/IjkeSB4cDqxmkdqDxfZ0mBz/Tx5CZ1mcLO9fFQHnxYAr8pVLQzLEd8q1l6vrnutm4lfwsNDqtpMYHXuwtUUNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745261587; c=relaxed/simple;
	bh=/oChyhJXj9qTCsKml/iiupq76etcChjDOXm8WSw66hU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dMlwJjXgsqcbgZy3q5Bh8513HDMHuSqe+gDvFsGIDhf0JPEaDv4ZjXWzlqKs0/PKEgiCF27HtpRoeOg2YY9A0oagt2inVCIlPgMR2zxk0qGx3k16oyB5FRx5hVHW4mr+nmbbRNoIZ8N5Ca0B090UOdEjYr0dlbtiiqQj+ZLRCzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TPEvzuVJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TPEvzuVJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0089CC4CEEF;
	Mon, 21 Apr 2025 18:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745261586;
	bh=/oChyhJXj9qTCsKml/iiupq76etcChjDOXm8WSw66hU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TPEvzuVJqXEUFuM5KP3zXL/pxchgZdxWY5Cxe/uN4fSM+lB7qE4iFIdt5u3O2UZl5
	 1p6z55aHrOm/3ZQ6QyAzRtgCgIf+jaMCcTH5xjnBMTm8oOzypdvY0FEyEaPtiNVW4P
	 qnN4ozp+K0KCi2K4wSVwCdHoHVceFUamDZzXXNGWHhu667Q9QIBQzEnOGdIYkFPSxq
	 3QLMs5EpmXBVVAgge0YfhiUvbABykDuXBSqVe4oT1UfRXhRY1BJ6tpN7+NDNnhSShu
	 OWZOMWfXT3JRGVah+VMyFKAeAfSR1JjiLZpk6eSn/Kc79XqPWSgWCvK/YesiwSBRpS
	 mwB0+Wviz5/mA==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andy@kernel.org>,
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
	Ingo Molnar <mingo@kernel.org>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: [PATCH 06/29] x86/boot/e820: Make the field separator space character part of e820_print_type()
Date: Mon, 21 Apr 2025 20:51:46 +0200
Message-ID: <20250421185210.3372306-7-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250421185210.3372306-1-mingo@kernel.org>
References: <20250421185210.3372306-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We are going to add more columns to the E820 table printout,
so make e820_print_type()'s field separator (space character)
part of the function itself.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: David Woodhouse <dwmw@amazon.co.uk>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/kernel/e820.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
index a8edfa375fbd..10bd10bd5672 100644
--- a/arch/x86/kernel/e820.c
+++ b/arch/x86/kernel/e820.c
@@ -187,15 +187,15 @@ void __init e820__range_add(u64 start, u64 size, enum e820_type type)
 static void __init e820_print_type(enum e820_type type)
 {
 	switch (type) {
-	case E820_TYPE_RAM:		pr_cont("usable");			break;
-	case E820_TYPE_RESERVED:	pr_cont("reserved");			break;
-	case E820_TYPE_SOFT_RESERVED:	pr_cont("soft reserved");		break;
-	case E820_TYPE_ACPI:		pr_cont("ACPI data");			break;
-	case E820_TYPE_NVS:		pr_cont("ACPI NVS");			break;
-	case E820_TYPE_UNUSABLE:	pr_cont("unusable");			break;
+	case E820_TYPE_RAM:		pr_cont(" usable");			break;
+	case E820_TYPE_RESERVED:	pr_cont(" reserved");			break;
+	case E820_TYPE_SOFT_RESERVED:	pr_cont(" soft reserved");		break;
+	case E820_TYPE_ACPI:		pr_cont(" ACPI data");			break;
+	case E820_TYPE_NVS:		pr_cont(" ACPI NVS");			break;
+	case E820_TYPE_UNUSABLE:	pr_cont(" unusable");			break;
 	case E820_TYPE_PMEM:		/* Fall through: */
-	case E820_TYPE_PRAM:		pr_cont("persistent (type %u)", type);	break;
-	default:			pr_cont("type %u", type);		break;
+	case E820_TYPE_PRAM:		pr_cont(" persistent (type %u)", type);	break;
+	default:			pr_cont(" type %u", type);		break;
 	}
 }
 
@@ -491,9 +491,9 @@ __e820__range_update(struct e820_table *table, u64 start, u64 size, enum e820_ty
 		size = ULLONG_MAX - start;
 
 	end = start + size;
-	printk(KERN_DEBUG "e820: update [mem %#010Lx-%#010Lx] ", start, end - 1);
+	printk(KERN_DEBUG "e820: update [mem %#010Lx-%#010Lx]", start, end - 1);
 	e820_print_type(old_type);
-	pr_cont(" ==> ");
+	pr_cont(" ==>");
 	e820_print_type(new_type);
 	pr_cont("\n");
 
@@ -568,7 +568,7 @@ u64 __init e820__range_remove(u64 start, u64 size, enum e820_type old_type, bool
 		size = ULLONG_MAX - start;
 
 	end = start + size;
-	printk(KERN_DEBUG "e820: remove [mem %#010Lx-%#010Lx] ", start, end - 1);
+	printk(KERN_DEBUG "e820: remove [mem %#010Lx-%#010Lx]", start, end - 1);
 	if (check_type)
 		e820_print_type(old_type);
 	pr_cont("\n");
-- 
2.45.2

