Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D9D1EE7B6
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 18:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745261632; cv=none; b=bGrFFPL5xMFIv+xr9r8ljDfcON1LDxxQ/fj59tgjTL6or38KQIiW8c5DA53HAx+L/tuFZ3JEmKHeDIP0YJPWz01x9eDePwULSNKg867aD7kn/gQpYYpK93Sws1Oc7QSEOaotVsDli05dQj08bpg2DjMSHTSH+Hb5kiznp/21q08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745261632; c=relaxed/simple;
	bh=+W2xcK4KRppKgZobQ6197LwwjgbCSohCG6OneLrFvBg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ewsykacwAbC7VhgEPw7yx2KmH6by8AcMyXREyoLnho/PRYcQsoLzSRcxdphoXwbnQEajD3XTu1uLjQeAdqPW7NQ07b8y6hbumtAsRiIx0s5Lp6yLiEszxb6LTtCqsie0ViS6onMuV8OYH6kl913UqhPFwEHfx0XDyCcijXjUalw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZW6j092e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZW6j092e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 037F2C4CEEC;
	Mon, 21 Apr 2025 18:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745261631;
	bh=+W2xcK4KRppKgZobQ6197LwwjgbCSohCG6OneLrFvBg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZW6j092ecUjNK8cF5IYnvN1E1awBi0ymcmxTX3D47+cTVSRvmR6G7nQEejWDKICeT
	 SOytESFySz+QE4EIjjhxbV3Mj88Crjz1GG5QCz5lQ+WD98ca3XMEGwZ2TqfKijezpB
	 oDosCbN1qDMnSOV4zN6GuMiuC4UqrwKt+U936zIB6c9BujEI+iggq3NlywjxUdk9wG
	 f45k9joBowS6oL8zO4r/phDl/fdyCACco8dUOHcTe1KiUgNXnm8bFcmFtwBbGILgWW
	 0BkA4FtCORvWlj3Wu2STyvYvmnIAqiz1Kss+zbxkSRxWNarmUhvEuoRSxIMX2REZvI
	 NrpPienY9q25g==
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
Subject: [PATCH 22/29] x86/boot/e820: Rename gap_start/gap_size to max_gap_start/max_gap_start in e820_search_gap() et al
Date: Mon, 21 Apr 2025 20:52:02 +0200
Message-ID: <20250421185210.3372306-23-mingo@kernel.org>
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

The PCI gap searching functions pass around pointers to the
gap_start/gap_size variables, which refer to the maximum
size gap found so far.

Rename the variables to say so, and disambiguate their namespace
from 'current gap' variables.

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
index 24b2e8a93853..d0f9c544a14c 100644
--- a/arch/x86/kernel/e820.c
+++ b/arch/x86/kernel/e820.c
@@ -680,7 +680,7 @@ static void __init e820__update_table_kexec(void)
 /*
  * Search for a gap in the E820 memory space from 0 to MAX_GAP_END (4GB).
  */
-static int __init e820_search_gap(unsigned long *gap_start, unsigned long *gap_size)
+static int __init e820_search_gap(unsigned long *max_gap_start, unsigned long *max_gap_size)
 {
 	u64 last = MAX_GAP_END;
 	int idx = e820_table->nr_entries;
@@ -697,9 +697,9 @@ static int __init e820_search_gap(unsigned long *gap_start, unsigned long *gap_s
 		if (last > end) {
 			unsigned long gap = last - end;
 
-			if (gap > *gap_size) {
-				*gap_size = gap;
-				*gap_start = end;
+			if (gap > *max_gap_size) {
+				*max_gap_size = gap;
+				*max_gap_start = end;
 				found = 1;
 			}
 		}
@@ -719,29 +719,29 @@ static int __init e820_search_gap(unsigned long *gap_start, unsigned long *gap_s
  */
 __init void e820__setup_pci_gap(void)
 {
-	unsigned long gap_start, gap_size;
+	unsigned long max_gap_start, max_gap_size;
 	int found;
 
-	gap_size = 0x400000;
-	found  = e820_search_gap(&gap_start, &gap_size);
+	max_gap_size = 0x400000;
+	found  = e820_search_gap(&max_gap_start, &max_gap_size);
 
 	if (!found) {
 #ifdef CONFIG_X86_64
-		gap_start = (max_pfn << PAGE_SHIFT) + 1024*1024;
+		max_gap_start = (max_pfn << PAGE_SHIFT) + 1024*1024;
 		pr_err("Cannot find an available gap in the 32-bit address range\n");
 		pr_err("PCI devices with unassigned 32-bit BARs may not work!\n");
 #else
-		gap_start = 0x10000000;
+		max_gap_start = 0x10000000;
 #endif
 	}
 
 	/*
 	 * e820__reserve_resources_late() protects stolen RAM already:
 	 */
-	pci_mem_start = gap_start;
+	pci_mem_start = max_gap_start;
 
 	pr_info("[gap %#010lx-%#010lx] available for PCI devices\n",
-		gap_start, gap_start + gap_size - 1);
+		max_gap_start, max_gap_start + max_gap_size - 1);
 }
 
 /*
-- 
2.45.2

