Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6CB298CC3
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 12:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747310860; cv=none; b=HoYv4goj3ASWHZbaU90mgavr8MrR8RLWbzfWdjKfMmpgLFqu73DOLtvzEwAUINRTvRfg2VP7HzVCfnzdLT0Y7wklXQ+cOFq0bnWhA67yd55w3XgO290tIIk6g3h/IYUjlA1ZvGGvlBTqTD9vH0DH6/mU56IBSxlhOzHus0qZOck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747310860; c=relaxed/simple;
	bh=RCTt96afOHkt8Yji9prljEO9r3H1m8J4rPEJXzCe2ZU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HhuymLfYYQLKEXAm/A0Tp51jlGsurokzLTcVfDWc45uTrtG8L/a9IKr1s4lw2Ynrr7UV92tvVPXPfJ8q/SlES8PxKM11AtVO7GQ4Lq63czmJbLJW49JRpuzsIlCAIlrpVDHIp7PqXDS4xFpsxIO+ioAi99xDlb6vb9HbMLFOnsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hCcaECx6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hCcaECx6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6635C4CEE7;
	Thu, 15 May 2025 12:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747310860;
	bh=RCTt96afOHkt8Yji9prljEO9r3H1m8J4rPEJXzCe2ZU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hCcaECx6K5+wd1QH05dKxLJV1gFdwV9OtHNcCp/olfzFU6VOV2zQbMOEb0ii6vkiE
	 /cYFCXn06aLj4lhzjWBr5eOsE9WkOmpEPCydFc8UgY+t5Th+W8Msaw7aTpvmDoaSS/
	 v+cyDoQhJT+Kugp8zuz2qhjIDgoaDwydfpZsZF/KI24CFSwkapMZWhR9GwExs/0mcq
	 1fH5+/Qy6I8NLlJolCbGmRJyRyXHh3aKD5KkDOJOrID1wBi9H17X9HU/WNFsMzf74z
	 24q+sE4aznsSL+wCWj8ZCOEZwjeuT6elM35ADdM71CDRRxsg2EH9Q5cWNGjecUcioZ
	 oPN8Gty2q4A6g==
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
Subject: [PATCH 30/32] x86/boot/e820: Change e820_type_to_string() to take a 'type' parameter
Date: Thu, 15 May 2025 14:05:46 +0200
Message-ID: <20250515120549.2820541-31-mingo@kernel.org>
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

Simplify the e820_type_to_string() interface by changing it
to take a 'enum e820_type type' parameter.

This is going to allow the unification of the e820_type_to_string()
and e820_print_type() functions.

No change in functionality intended.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: David Woodhouse <dwmw@amazon.co.uk>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/kernel/e820.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
index 6c9c00ce8db9..fe3e078a4064 100644
--- a/arch/x86/kernel/e820.c
+++ b/arch/x86/kernel/e820.c
@@ -1065,9 +1065,9 @@ __init void e820__finish_early_params(void)
 	}
 }
 
-__init static const char * e820_type_to_string(struct e820_entry *entry)
+__init static const char * e820_type_to_string(enum e820_type type)
 {
-	switch (entry->type) {
+	switch (type) {
 	case E820_TYPE_RAM:		return "System RAM";
 	case E820_TYPE_ACPI:		return "ACPI Tables";
 	case E820_TYPE_NVS:		return "ACPI Non-volatile Storage";
@@ -1175,7 +1175,7 @@ __init void e820__reserve_resources(void)
 		}
 		res->start = entry->addr;
 		res->end   = end;
-		res->name  = e820_type_to_string(entry);
+		res->name  = e820_type_to_string(entry->type);
 		res->flags = e820_type_to_iomem_type(entry);
 		res->desc  = e820_type_to_iores_desc(entry);
 
@@ -1195,7 +1195,7 @@ __init void e820__reserve_resources(void)
 	for (idx = 0; idx < e820_table_kexec->nr_entries; idx++) {
 		struct e820_entry *entry = e820_table_kexec->entries + idx;
 
-		firmware_map_add_early(entry->addr, entry->addr + entry->size, e820_type_to_string(entry));
+		firmware_map_add_early(entry->addr, entry->addr + entry->size, e820_type_to_string(entry->type));
 	}
 }
 
-- 
2.45.2

