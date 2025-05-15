Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F71529B8FC
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 12:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747310843; cv=none; b=gPVFkFAlDQsSZmI7NPNo9qvMlrliwHJBipTIgJjtNe4lqdjRaCdnpKbOG8mczvj99CecWtiDC0gXtFLxwdKBSLULzLG5g9ObfEx7+5B6CLrayxq9lDhUWAKApn7rpjoLJWB4aKQjXxktinvfPrMrMVVjVpP0S2T0d+7aq6jjXQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747310843; c=relaxed/simple;
	bh=DxdXzcctVDPHawDRTusyFP68wroNBy7P8vzDdxb6Rss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ElchncxG/s/YygmTHaMrUWXcxhpI1oqyYUZoPLxNNmSJ0mG1lVAIj2TZiE3VWpQ4D/Ie5hHk1Cg7Be6+2Smv/PnzWlX5aUANtfM57ptyTE9UCtH7DlbGjD4il0iDr+acsYUjScQRXmievOrl2Yfg9LzYOnogKOaIllsFTYLct1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=air0cQzs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="air0cQzs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39F08C4CEE7;
	Thu, 15 May 2025 12:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747310843;
	bh=DxdXzcctVDPHawDRTusyFP68wroNBy7P8vzDdxb6Rss=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=air0cQzsw2ix/Xr0SDm6fxPDzNB5cu/NBea58XceGh6zwajwJ37a4WXuN40KLFX1T
	 9o4JsYp8N4681T3OZtLU6Y0ykXy11e61QY7IXpmp/oxOALEcLkGdmhSfARSgcOO3mK
	 TlkWSjul6IAtsrRcS7IsXf7CkyDsIpwGYuxv75FBPZhz9aBQdrwVw0Aa/g7O3OCLUp
	 yR64i3Ey36L6GtFHhiXPo+Ow6iWDycq5wSRd6zwyGmwkrTyfyuqgNczEtbXHF/Uu7p
	 TNY/V4PNuU1Uyc2XVkabegv7LAajbyDKnAMbXaEFjKQNyBzSlfsIJBzw1N9Mi+JOMa
	 rhjkhTEPTHLwQ==
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
Subject: [PATCH 25/32] x86/boot/e820: Simplify append_e820_table() and remove restriction on single-entry tables
Date: Thu, 15 May 2025 14:05:41 +0200
Message-ID: <20250515120549.2820541-26-mingo@kernel.org>
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

So append_e820_table() begins with this weird condition that checks 'nr_entries':

    static int __init append_e820_table(struct boot_e820_entry *entries, u32 nr_entries)
    {
            /* Only one memory region (or negative)? Ignore it */
            if (nr_entries < 2)
                    return -1;

Firstly, 'nr_entries' has been an u32 since 2017 and cannot be negative.

Secondly, there's nothing inherently wrong with single-entry E820 maps,
especially in virtualized environments.

So remove this restriction and remove the __append_e820_table()
indirection.

Also:

 - fix/update comments
 - remove obsolete comments

This shrinks the generated code a bit as well:

   text       data        bss        dec        hex    filename
   7549      44072          0      51621       c9a5    e820.o.before
   7533      44072          0      51605       c995    e820.o.after

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: David Woodhouse <dwmw@amazon.co.uk>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/kernel/e820.c | 35 +++++++++++------------------------
 1 file changed, 11 insertions(+), 24 deletions(-)

diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
index 447f8bbb77b8..22bfcad7b723 100644
--- a/arch/x86/kernel/e820.c
+++ b/arch/x86/kernel/e820.c
@@ -483,17 +483,22 @@ __init int e820__update_table(struct e820_table *table)
 	return 0;
 }
 
-__init static int __append_e820_table(struct boot_e820_entry *entries, u32 nr_entries)
+/*
+ * Copy the BIOS E820 map into the kernel's e820_table.
+ *
+ * Sanity-check it while we're at it..
+ */
+__init static int append_e820_table(struct boot_e820_entry *entries, u32 nr_entries)
 {
 	struct boot_e820_entry *entry = entries;
 
 	while (nr_entries) {
 		u64 start = entry->addr;
-		u64 size = entry->size;
-		u64 end = start + size - 1;
-		u32 type = entry->type;
+		u64 size  = entry->size;
+		u64 end   = start + size-1;
+		u32 type  = entry->type;
 
-		/* Ignore the entry on 64-bit overflow: */
+		/* Ignore the remaining entries on 64-bit overflow: */
 		if (start > end && likely(size))
 			return -1;
 
@@ -505,24 +510,6 @@ __init static int __append_e820_table(struct boot_e820_entry *entries, u32 nr_en
 	return 0;
 }
 
-/*
- * Copy the BIOS E820 map into a safe place.
- *
- * Sanity-check it while we're at it..
- *
- * If we're lucky and live on a modern system, the setup code
- * will have given us a memory map that we can use to properly
- * set up memory.  If we aren't, we'll fake a memory map.
- */
-__init static int append_e820_table(struct boot_e820_entry *entries, u32 nr_entries)
-{
-	/* Only one memory region (or negative)? Ignore it */
-	if (nr_entries < 2)
-		return -1;
-
-	return __append_e820_table(entries, nr_entries);
-}
-
 __init static u64
 __e820__range_update(struct e820_table *table, u64 start, u64 size, enum e820_type old_type, enum e820_type new_type)
 {
@@ -796,7 +783,7 @@ __init void e820__memory_setup_extended(u64 phys_addr, u32 data_len)
 	entries = sdata->len / sizeof(*extmap);
 	extmap = (struct boot_e820_entry *)(sdata->data);
 
-	__append_e820_table(extmap, entries);
+	append_e820_table(extmap, entries);
 	e820__update_table(e820_table);
 
 	memcpy(e820_table_kexec, e820_table, sizeof(*e820_table_kexec));
-- 
2.45.2

