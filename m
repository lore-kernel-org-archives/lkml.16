Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6714A299954
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 12:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747310805; cv=none; b=lk0AFoCmVszHfo8UTeI7bQtaVrSNDkTqKSQTHjqq8EEOy1nm0QVRTJ783ZBt7IVEYPPXt+jPHK0SNRjbAEcsebPohWE6N5K8eWseDiuzusNT+vGLGml6e2L5UynAs36DkMahWfNcicCgiwuQqBMjvI0PhLBmA/SnmvNtFB/uSqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747310805; c=relaxed/simple;
	bh=ehARHVg+NKSKLZPZhfgP0czrXJ6DMdIeOGpKIsrqthk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f/QXb5f8wq5XqA06WwYT03oPKM3GxSk6q5Hi6fgxjn1Z3ukWEpUj1b6/yI8yZwYcYs7/dBTgH7WD7LLBZkPbJxJl9eVG5YrJFtLqFM2A1B+nHs4mtnYE6ePlcUcDkVx/f1mS/Sdqq+qsgL+WDruQOQNTSjykPNPyOBeM4qeQbgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hXZiV7oV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hXZiV7oV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA482C4CEE7;
	Thu, 15 May 2025 12:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747310804;
	bh=ehARHVg+NKSKLZPZhfgP0czrXJ6DMdIeOGpKIsrqthk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hXZiV7oVcgCes40cp1uhYZlbG23rpKcFNwukDBDBE3KDFUbtAdJq+ygSnHSy80iMu
	 mHtWiU9p+8LBQ/Yp18RbGJYvQZqca4fjodzRJLvj65bj1afONWYcBOZnEAhIg5OhM7
	 1fQvA33TnmrYloeG90hQbNvo3GnIRkLw5krYKyGxg2kJmlqbJsBNeWLgEl0NMzXzqb
	 2SyNi+PI103IqKrkfvKwIsMZFsDl9L45EY9ZnPACnQPTGXpEhAqT0A8iVP1M5wo7aY
	 nr1FTi0zpnACDimsETPLV1ZXo3YFQzPHpnYTM3SKzs9mFUdDXk96HcI2Yv8WfdQowL
	 N55hCLjmZajeA==
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
Subject: [PATCH 14/32] x86/boot/e820: Clean up __e820__range_add() a bit
Date: Thu, 15 May 2025 14:05:30 +0200
Message-ID: <20250515120549.2820541-15-mingo@kernel.org>
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

 - Use 'idx' index variable instead of a weird 'x'
 - Make the error message E820-specific
 - Group the code a bit better

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: David Woodhouse <dwmw@amazon.co.uk>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/kernel/e820.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
index 6cb1e23dfc89..ba4e6e6bb0a5 100644
--- a/arch/x86/kernel/e820.c
+++ b/arch/x86/kernel/e820.c
@@ -165,17 +165,18 @@ int e820__get_entry_type(u64 start, u64 end)
  */
 static void __init __e820__range_add(struct e820_table *table, u64 start, u64 size, enum e820_type type)
 {
-	int x = table->nr_entries;
+	int idx = table->nr_entries;
 
-	if (x >= ARRAY_SIZE(table->entries)) {
-		pr_err("too many entries; ignoring [mem %#010llx-%#010llx]\n",
-		       start, start + size - 1);
+	if (idx >= ARRAY_SIZE(table->entries)) {
+		pr_err("too many E820 table entries; ignoring [mem %#010llx-%#010llx]\n",
+		       start, start + size-1);
 		return;
 	}
 
-	table->entries[x].addr = start;
-	table->entries[x].size = size;
-	table->entries[x].type = type;
+	table->entries[idx].addr = start;
+	table->entries[idx].size = size;
+	table->entries[idx].type = type;
+
 	table->nr_entries++;
 }
 
-- 
2.45.2

