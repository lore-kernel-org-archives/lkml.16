Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8641DE2B4
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 04:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743481653; cv=none; b=ZvgcV5fFhtB0ajk4mvApYjfIOAyOLEJIllK9oKhtzOF7yIsZVbNc65Br2jKVg4d4rVFcOVG4wHFLcgtt22HPsdnhD8L3Gn6jRRwOPKeYAREjHmnFxW51VkTSR4Cizr1f0R5HWXcgaUvVX39I+cVknQgJAGksuImRvYuC8F0wcxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743481653; c=relaxed/simple;
	bh=HeWAUSvi+fwdMfowwn5h8IBT9PJLR48hdAQU93J1RUA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NqHktrlsrgRQTmad9Y4wbmLKPIiq7mDDgMBeTT3HNrgB921k8q1FuL24lqkv0STnZTI1n6ci39B2siJUv6/0pwmHN4zdONkqB5oG7K5qZBboj2xHUo1LIqaBtgDPUPvchrhle3LULHCY8NCWmbyuTJ1cyuuhuzDNHYQJV7DjQNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jJwz+Yjj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jJwz+Yjj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89B7EC4AF0B;
	Tue,  1 Apr 2025 04:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743481653;
	bh=HeWAUSvi+fwdMfowwn5h8IBT9PJLR48hdAQU93J1RUA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jJwz+YjjZ3n2NINPqZd7bqchTRWrBBlJ4/AbvrvCkycIud/afDX4LvIHwxxkf2Giv
	 BLkRf7yqLz5YiAlcuBAoLra8SZYhhdg3znMea6X96y2HIoj8Gvgf3zasGBpEgQQtDX
	 SCDSO4we5JOMaKhJy8JX74bYIxN73r3OCp2EUUieZ/aGhMBZU9hsRpMi6slR2pftXN
	 nysd0nJa0OYikbylhoIBJ13S3Fo79ssOQoZogOz9UTOZZEHMBD/6aX3p7Hz5u5LKRw
	 czbWq758uK+2HGvUvOQ6dmLLNxy1jO1qsbP8g1kFz8xg9sg4whmU82NK9Qe1uou21V
	 talnLzJdzZzmA==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	David Laight <david.laight.linux@gmail.com>
Subject: [PATCH 07/11] objtool: Fix verbose disassembly if CROSS_COMPILE isn't set
Date: Mon, 31 Mar 2025 21:26:42 -0700
Message-ID: <b931a4786bc0127aa4c94e8b35ed617dcbd3d3da.1743481539.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1743481539.git.jpoimboe@kernel.org>
References: <cover.1743481539.git.jpoimboe@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: David Laight <david.laight.linux@gmail.com>

In verbose mode, when printing the disassembly of affected functions, if
CROSS_COMPILE isn't set, the objdump command string gets prefixed with
"(null)".

Somehow this worked before.  Maybe some versions of glibc return an
empty string instead of NULL.  Fix it regardless.

[ jpoimboe: Rewrite commit log. ]

Fixes: ca653464dd097 ("objtool: Add verbose option for disassembling affected functions")
Signed-off-by: David Laight <david.laight.linux@gmail.com>
Link: https://lore.kernel.org/r/20250215142321.14081-1-david.laight.linux@gmail.com
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/check.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index ff83be1aab1d..4a1f6c3169b3 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -4523,6 +4523,8 @@ static void disas_funcs(const char *funcs)
 	char *cmd;
 
 	cross_compile = getenv("CROSS_COMPILE");
+	if (!cross_compile)
+		cross_compile = "";
 
 	objdump_str = "%sobjdump -wdr %s | gawk -M -v _funcs='%s' '"
 			"BEGIN { split(_funcs, funcs); }"
-- 
2.48.1

