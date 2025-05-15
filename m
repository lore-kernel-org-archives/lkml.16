Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8999F2253B5
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 12:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747310780; cv=none; b=qlWpJ4iTbedJOhtOou8rr923Ok+eFbh/wuKvraH+bZalJHsqKF4/lDitcEpKgw9+AK/lrd0g85Sax590ucF9afiOWH7gbHqItnB8xbKt2ybz/Da4ulkUHMXaITcu2Rkl4++oWieA1bI3n0VcI3OHIPX/Dqsded8QWhm0tIm12hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747310780; c=relaxed/simple;
	bh=7J39RAUo56IzYFcoL3Vhi/KBYwcP/BbcQYyfAPFNzKs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e7o12I0DSdTFHzlTe2iGj8UohHBv/h1cEG+3JgY++7fq4NIXtx+F8jGxK7y381y9soJ/iAbWlHSTmZc0eEjcZAJv4eSUp5lnVmyODANsAOfYuisxrsOn0qrgudHUrk1OfCHB0eC12UWAoer2RBAyJeQFYhQt+zsSupJrw342Bmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qJUYDHVH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qJUYDHVH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05456C4CEE9;
	Thu, 15 May 2025 12:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747310777;
	bh=7J39RAUo56IzYFcoL3Vhi/KBYwcP/BbcQYyfAPFNzKs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qJUYDHVHj8sGWtDCGYau/lbAiX4Qs1JCWFHYQXmyUn8tqTK+c3oGg0uSEM/ay2FkQ
	 3wENwq6snu9Kfqzf2vagaY970wpdMMaY74VN5ojCCwfdfACr4s6A6xAXxcrS5B8s7u
	 DrOVRBEHx9cx7Z89r8++4c3bKvHlAXrjSu8/PoAfpBP+ylUCjJKb0jOYB2gYuqLWwJ
	 7RF/EaxNf8+WnYD3RKJTtzjGa3FwTv0g2wPz9bFPVkhK7AwhcLNYc4UF33C6IJSGNH
	 D8R91Ab2AY0w2SZGj6ZCJuXNnStO3lGmqRdRdDnQeV6v6yVkK/uXoYtYpaJPg2v6f2
	 lhFFK5EFPIdjA==
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
Subject: [PATCH 06/32] x86/boot/e820: Make the field separator space character part of e820_print_type()
Date: Thu, 15 May 2025 14:05:22 +0200
Message-ID: <20250515120549.2820541-7-mingo@kernel.org>
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
index c8833ac9cbf9..b5895b142707 100644
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

