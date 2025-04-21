Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D401EB197
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 18:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745261575; cv=none; b=jdOv0Nn06tPDccFLOZLw9FIDUlgTsCOXR7Ej6jc+wMWbXTwgOHNcHlqMdYtXGEEK0dmE+KeeMjpfwZYMsMrXNZ2qAYARXIPn5chjqmbBDyD2HhfnDXKmV7X/v6NEFRor6WaKxvscv+486Fb8dU9Id0+HHvstigG4Wxz3ZMc/q6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745261575; c=relaxed/simple;
	bh=3Oy+Xg5BKgF+D8WcFy2vULMkJbA8RYiQNkOgq9/P6sY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aYMyiD6rwzw0Mx4FA2WfYwx54K4MjBi1X2PJzHlzZ4WlQT5R1ZHc0ALrU7a0MBK6ukS3566WWaFMQ5Q7S9MSXHM476cqxtJZOZQdOYR4QwT0pXU1u+O1DQU4M5JvDpsCkEIxyNfPlmN6jchvO9IFTRpJrRuoADi+AHH6qoqqto0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ARjfHlyg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ARjfHlyg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE902C4CEF4;
	Mon, 21 Apr 2025 18:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745261575;
	bh=3Oy+Xg5BKgF+D8WcFy2vULMkJbA8RYiQNkOgq9/P6sY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ARjfHlygYBsc3vPdtEEqjq8hIVhRD1Gz7idNum8B4GK6nP6Fy5I++b1710Oq3ZowA
	 /1WTVijB0+MeUSFlv4lcgqkkBz3URxVH0BFo4bgronyu1qXca/5uhbI4EURrCBftON
	 oW9BOC+0Aq44TVdescXdM8ffB3s1rMPicBTPEwqZSmf8EhvEVneto2xDFv1XAT2Uyt
	 v/Khwthj0ckzF5vunC8knEF+NGe3fCrHVj1MqL9/Y5cY3GiAbxtnVb1dJ50KN8PvwR
	 z31MouJxS9233LG+JJxhDRM2q1KSndOsqqCTDSmmC3NI3BN32QrKtDV/dorS/Bm2dw
	 8LdJ8zV47nkTw==
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
Subject: [PATCH 02/29] x86/boot/e820: Simplify e820__print_table() a bit
Date: Mon, 21 Apr 2025 20:51:42 +0200
Message-ID: <20250421185210.3372306-3-mingo@kernel.org>
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

Introduce 'entry' for the current table entry and shorten
repetitious use of e820_table->entries[i].

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: David Woodhouse <dwmw@amazon.co.uk>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/kernel/e820.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
index 4a81f9e94137..b1a30bca56cd 100644
--- a/arch/x86/kernel/e820.c
+++ b/arch/x86/kernel/e820.c
@@ -204,12 +204,14 @@ void __init e820__print_table(char *who)
 	int i;
 
 	for (i = 0; i < e820_table->nr_entries; i++) {
+		struct e820_entry *entry = e820_table->entries + i;
+
 		pr_info("%s: [mem %#018Lx-%#018Lx] ",
 			who,
-			e820_table->entries[i].addr,
-			e820_table->entries[i].addr + e820_table->entries[i].size - 1);
+			entry->addr,
+			entry->addr + entry->size-1);
 
-		e820_print_type(e820_table->entries[i].type);
+		e820_print_type(entry->type);
 		pr_cont("\n");
 	}
 }
-- 
2.45.2

