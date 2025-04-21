Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048AB1EBFE0
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 18:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745261609; cv=none; b=o9S2+6FOJIg63MU0cVcl+BsdgwbAEkWNSLzQc3gzbr9gxQxalpRQkK5KiezfnBJLiv47b9DdWyRoBbO99QS9bqqTrlvP4Zvc7mycVWOB+smtm69y5xT001dz2iMw5Tpvm+PzqZc43wTiRkPZ/ksNfHjLzjTCwYBcXooLWqFOwcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745261609; c=relaxed/simple;
	bh=fup/Ks0ZisKAHfo7PloZj7/wqfacxOjMZEqtnF76wu8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lATl3SpOd1lU5q+D6pqbVtvpoI8mP1ggayNArV9jzDtouBglyMJbwDzf57OiyCQt2Uzhl5m0+Wm/aHtXi2xbk2eoSXUMs7DxBAJdbbvd8i222UrxMj39F4deJxTy+8agmF9chqnaBKantiQd8U2gGEgG6VBGcoHQuRg269pnbxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=to9pPqu8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="to9pPqu8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 706AAC4CEEC;
	Mon, 21 Apr 2025 18:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745261608;
	bh=fup/Ks0ZisKAHfo7PloZj7/wqfacxOjMZEqtnF76wu8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=to9pPqu8EgLQYxybK31paryTYUn2m7VMYPB2IUtH0nBMJsGP1eSo+Rwks1XUDTENc
	 Zn3D9eqz0hpRcBT0hO2NCA/WLtZx2W1swTR4Vlkf4OEzOixuhhBDE9e2G0eODnK67w
	 ThG5p3vYgJGd4qIbyqBBIUKP0WNah5I8W7ckTKFvh57tLru85CrzTHpOFiWM7vYGE8
	 WVscDhE060+FFtZtpB/GVwvoinqwqYdowzVERhDxA/LFtO5xPzZ1NNiS6ntVwCAVQq
	 fLYREFLA2xbZSvvFykPzK9VbmJz32eMtVwL+N+70nZQRht6VBYT+PIIKpp7R6l8nuh
	 LRpMUK+ezMYHQ==
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
Subject: [PATCH 14/29] x86/boot/e820: Clean up __e820__range_add() a bit
Date: Mon, 21 Apr 2025 20:51:54 +0200
Message-ID: <20250421185210.3372306-15-mingo@kernel.org>
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
index ae05161896d4..6e626c4a3817 100644
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

