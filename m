Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E67253923
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 12:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747310780; cv=none; b=j6XpBdrZpCr0R3++QzpYQnuGKQ4ryFIyA77otpg/82QUmOjW6pYa8lyEjcM41vSoRAghaXxd/S5AeLDyChQveCDgBKbs23a2wiyFk4B4skQSusoQlMoQIuD8b0wTN5utX3JUtni5Gt3SEllVEXgFtwi8Y1hRvlg4AeHnwrtXdwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747310780; c=relaxed/simple;
	bh=/hqQLt0YCUGR5KS01ppLduzN+UlLPP94cAlEHdbjuc4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qGTL6pip/uEjfHGMdEvDJsOdl4CtUTds00CqCgBsOI9Bht8cRzTDA1DjAcUh8e2BQCWDFWW6WLmKr43iQDrmPkMQ5hd2bZslcJmTdJHO09OPmXzLwdBTBVZ9QVsBP/npnmboYbHlCpVbfKrOolgC2xgZxxxvVWFSvWM8wLnuN+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DMDx/jWb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DMDx/jWb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79011C4CEE7;
	Thu, 15 May 2025 12:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747310780;
	bh=/hqQLt0YCUGR5KS01ppLduzN+UlLPP94cAlEHdbjuc4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DMDx/jWbLjQpOVlojez//DCtJIqN7xFso4dJUanEmpuDeoJOKt64Qco7MxV0QAmq4
	 uOL+ICthgIg/5xvlIAPNHOeilYZNWGtoPrUZ7dADDIVi1TmghkweXvqeu6WTY5my4D
	 3LF4LkPJLzMGwDDdcEyP+uGT4ttP/l1HwpDUar4Gwc2fkitCopi5PqUs68nByWf+1A
	 asRR6qm9UJoYbtNplORG7lyy5d0nOSQugt+/FZBXudOMNCojz9xkdj61wewFp8vfXV
	 AcYvo9SiNROYpa/qgIH4A+gVdBeJmAojYexl+0s7ZWfvz9EI1aTuR3ny++BmPmCoiB
	 OgEHdq99i/b/Q==
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
Subject: [PATCH 07/32] x86/boot/e820: Print out sizes of E820 memory ranges
Date: Thu, 15 May 2025 14:05:23 +0200
Message-ID: <20250515120549.2820541-8-mingo@kernel.org>
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

Before:

        BIOS-provided physical RAM map:
        BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] usable
        BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff] reserved
        BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff] reserved
        BIOS-e820: [mem 0x0000000000100000-0x000000007ffdbfff] usable
        BIOS-e820: [mem 0x000000007ffdc000-0x000000007fffffff] reserved
        BIOS-e820: [mem 0x00000000b0000000-0x00000000bfffffff] reserved
        BIOS-e820: [mem 0x00000000fed1c000-0x00000000fed1ffff] reserved
        BIOS-e820: [mem 0x00000000feffc000-0x00000000feffffff] reserved
        BIOS-e820: [mem 0x00000000fffc0000-0x00000000ffffffff] reserved
        BIOS-e820: [mem 0x000000fd00000000-0x000000ffffffffff] reserved

After:

	BIOS-provided physical RAM map:
	BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff]  639   KB kernel usable RAM
	BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff]    1   KB reserved
	BIOS-e820: [gap 0x00000000000a0000-0x00000000000effff]  320   KB ...
	BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff]   64   KB reserved
	BIOS-e820: [mem 0x0000000000100000-0x000000007ffdbfff]    1.9 GB kernel usable RAM
	BIOS-e820: [mem 0x000000007ffdc000-0x000000007fffffff]  144   KB reserved
	BIOS-e820: [gap 0x0000000080000000-0x00000000afffffff]  768   MB ...
	BIOS-e820: [mem 0x00000000b0000000-0x00000000bfffffff]  256   MB reserved
	BIOS-e820: [gap 0x00000000c0000000-0x00000000fed1bfff] 1005.1 MB ...
	BIOS-e820: [mem 0x00000000fed1c000-0x00000000fed1ffff]   16   KB reserved
	BIOS-e820: [gap 0x00000000fed20000-0x00000000feffbfff]    2.8 MB ...
	BIOS-e820: [mem 0x00000000feffc000-0x00000000feffffff]   16   KB reserved
	BIOS-e820: [gap 0x00000000ff000000-0x00000000fffbffff]   15.7 MB ...
	BIOS-e820: [mem 0x00000000fffc0000-0x00000000ffffffff]  256   KB reserved
	BIOS-e820: [gap 0x0000000100000000-0x000000fcffffffff] 1008   GB ...
	BIOS-e820: [mem 0x000000fd00000000-0x000000ffffffffff]   12   GB reserved

Note how a 1-digit precision field is printed out if a range is
fractional in its largest-enclosing natural size unit.

So the "256 MB" and "12 GB" fields above denote exactly 256 MB and
12 GB regions, while "1.9 GB" signals the region's fractional nature
and it being just below 2GB.

Printing E820 maps with such details visualizes 'weird' ranges
at a glance, and gives users a better understanding of how
large the various ranges are, without having to perform hexadecimal
subtraction in their minds.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: David Woodhouse <dwmw@amazon.co.uk>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mike Rapoport (Microsoft) <rppt@kernel.org>
(cherry picked from commit d1ac6b8718575a7ea2f0a1ff347835a8879df673)
---
 arch/x86/kernel/e820.c | 47 +++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 45 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
index b5895b142707..7f600d32a999 100644
--- a/arch/x86/kernel/e820.c
+++ b/arch/x86/kernel/e820.c
@@ -199,6 +199,41 @@ static void __init e820_print_type(enum e820_type type)
 	}
 }
 
+/*
+ * Print out the size of a E820 region, in human-readable
+ * fashion, going from KB, MB, GB to TB units.
+ *
+ * Print out fractional sizes with a single digit of precision.
+ */
+static void e820_print_size(u64 size)
+{
+	if (size < SZ_1M) {
+		if (size & (SZ_1K-1))
+			pr_cont(" %4llu.%01llu KB", size/SZ_1K, 10*(size & (SZ_1K-1))/SZ_1K);
+		else
+			pr_cont(" %4llu   KB", size/SZ_1K);
+		return;
+	}
+	if (size < SZ_1G) {
+		if (size & (SZ_1M-1))
+			pr_cont(" %4llu.%01llu MB", size/SZ_1M, 10*(size & (SZ_1M-1))/SZ_1M);
+		else
+			pr_cont(" %4llu   MB", size/SZ_1M);
+		return;
+	}
+	if (size < SZ_1T) {
+		if (size & (SZ_1G-1))
+			pr_cont(" %4llu.%01llu GB", size/SZ_1G, 10*(size & (SZ_1G-1))/SZ_1G);
+		else
+			pr_cont(" %4llu   GB", size/SZ_1G);
+		return;
+	}
+	if (size & (SZ_1T-1))
+		pr_cont(" %4llu.%01llu TB", size/SZ_1T, 10*(size & (SZ_1T-1))/SZ_1T);
+	else
+		pr_cont(" %4llu   TB", size/SZ_1T);
+}
+
 static void __init e820__print_table(const char *who)
 {
 	u64 range_end_prev = 0;
@@ -215,14 +250,22 @@ static void __init e820__print_table(const char *who)
 		if (range_start < range_end_prev)
 			pr_info(FW_BUG "out of order E820 entry!\n");
 
+		/* Print gaps, if any: */
 		if (range_start > range_end_prev) {
-			pr_info("%s: [gap %#018Lx-%#018Lx]\n",
+			u64 gap_size = range_start - range_end_prev;
+
+			pr_info("%s: [gap %#018Lx-%#018Lx]",
 				who,
 				range_end_prev,
 				range_start-1);
+
+			e820_print_size(gap_size);
+			pr_cont(" ...\n");
 		}
 
-		pr_info("%s: [mem %#018Lx-%#018Lx] ", who, range_start, range_end-1);
+		/* Print allocated ranges: */
+		pr_info("%s: [mem %#018Lx-%#018Lx]", who, range_start, range_end-1);
+		e820_print_size(entry->size);
 		e820_print_type(entry->type);
 		pr_cont("\n");
 
-- 
2.45.2

