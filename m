Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0698A20AF87
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 11:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746443410; cv=none; b=VdboGKwExDdyJV2cHmj2PiKGA0bs7RZpi/KpjSDGr2lT2Z7nArDYHQ6XNFfJ/2RMOt46vFtKL8Sc4IeEZ3+4yTtuRwta3t2kGuMQDNydsdzFBQWFW0At9V6lcgKMWv/rh0wZZnNNXai3RYq8d0ORmAVin0O82JurqyD4cCvPWD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746443410; c=relaxed/simple;
	bh=n16jQOi/Rv/VysZ+tnvcUnyGBHA4GQKdR3n6dwxGyEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rtrkibBLL/xejG/GhrIDSLkNq0+KEbQNa5+YruyA097UxLhfJqlV+IejJhU0KldQ9DYxBX/lC0lAbXPcz8qeg3R/9oPTsPOCYJZyiIqmAfngm2yDmGgIKCczqqf4DmSkKqKcHuMqID6YkyfU2zfPw2uZ1d9jzsVk1vTBdqJeBGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cZhRbUSD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cZhRbUSD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2E85C4CEE4;
	Mon,  5 May 2025 11:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746443409;
	bh=n16jQOi/Rv/VysZ+tnvcUnyGBHA4GQKdR3n6dwxGyEQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cZhRbUSDCapbMEuKxBcUT8iuwPNQRHnEuL9z98OuDSnbEVUkytxXkSv7UKrR3wgW7
	 Wbxvux52qPr/49eUO2XGW1RTRQaUEvq6ILhmMR9pj1YjYjBt1LLt18XItxBkD9oXpR
	 iqjQOw8j5+aQlSMKbGST3kSb8JwlTg1SScUpqXPJByxTV5q+GwcyadMu/Uqxz83CQ5
	 uxojEpexnoNR6FpcVwOjmyWbpGTExZmkjBn7rTNtUgFX2Lt1ijyIwo5YG/3nonqTBz
	 2pfsNnPA7mDYCgNIpaH30E5PAvCg7+8RpOKJywj67U9L6INKLSfSgSYy0Q3yKfAPTa
	 NZLOak73+8tuQ==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH 06/15] x86/tools: insn_decoder_test.c: Emit standard build success messages
Date: Mon,  5 May 2025 13:09:37 +0200
Message-ID: <20250505110946.1095363-7-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250505110946.1095363-1-mingo@kernel.org>
References: <20250505110946.1095363-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The standard 'success' output of insn_decoder_test spams build logs with:

  arch/x86/tools/insn_decoder_test: success: Decoded and checked 8258521 instructions

Prefix the message with the standard '  ' (two spaces) used by kbuild to denote
regular build messages, making it easier for tools to filter out
warnings and errors.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: David Woodhouse <dwmw@amazon.co.uk>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>
---
 arch/x86/tools/insn_decoder_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/tools/insn_decoder_test.c b/arch/x86/tools/insn_decoder_test.c
index 08cd913cbd4e..8bf15c4aefa9 100644
--- a/arch/x86/tools/insn_decoder_test.c
+++ b/arch/x86/tools/insn_decoder_test.c
@@ -167,7 +167,7 @@ int main(int argc, char **argv)
 		pr_warn("Decoded and checked %d instructions with %d "
 			"failures\n", insns, warnings);
 	else
-		fprintf(stdout, "%s: success: Decoded and checked %d"
+		fprintf(stdout, "  %s: success: Decoded and checked %d"
 			" instructions\n", prog, insns);
 	return 0;
 }
-- 
2.45.2

