Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1009712A177
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 13:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747315664; cv=none; b=Dx/6faNIGAn6Ti1yBScJbAw9V063T44lHI3hXlGAJC6sMMQACCfIj/kQ27MzXYblGSuFrAHwJW9PZ1DxhMpLCPNGhdYK6RSL8bT4mt4hMHw3hctXn3Wu9mfWXH+8Xlz9/SXu9J9EYF8/eXH6+kJloRNPWwmrJILHEG74n56CJPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747315664; c=relaxed/simple;
	bh=MA5YI8z/iGWOl3p8sOB/lvDqAGhCyqXI6W1Vls0V+d8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mBJ3X00s+udwW9QihzK4qLBLDKXG8i4bBK9K3iekkS1skTrhcpxF05HdbSmxTsgOYftfVokyrppv87WsxPinNiAxmVjjH055Nz5sWY/x5EMUQrWPwMR2y6VfsGzJ15ld8cl/lzBhObPJxtK3j7AFf4cLU3bdKXylABWlhLcp88o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pOvrFuDW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pOvrFuDW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66DF7C4CEEB;
	Thu, 15 May 2025 13:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747315662;
	bh=MA5YI8z/iGWOl3p8sOB/lvDqAGhCyqXI6W1Vls0V+d8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pOvrFuDW6TNT0umpSjVgPQ0BzDNqM3UkyYA37+cE3azgsaC0lh0ttfRZnHmjqDyki
	 QEKBnDinVWgtn9QP+//A7jMaFdT5byteRBRDHiTKv8AqJNgaNlcYrI+WUEIVm3QVsz
	 JQtGn6u8eZY6bZopTJo+VvBHPS2Ymc8oejvuMtUyFrULvMxj/GpF5KAf66ScGF7uyL
	 SYgnyVxpH4APic31qGVrPGViQp5VZOZo5nLB8gexG92ghs50eYJvlgXEY8TlmVMaEm
	 w7DBAcXAyzg6lRfYrnJE9WNStW4xc+XSZobMn4OJob7q/YjQ+KLMSTlbk79+dVHrHJ
	 /KsqkMt7pCQQA==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Ingo Molnar <mingo@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	=?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH 05/13] x86/tools: insn_sanity.c: Emit standard build success messages
Date: Thu, 15 May 2025 15:27:11 +0200
Message-ID: <20250515132719.31868-6-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250515132719.31868-1-mingo@kernel.org>
References: <20250515132719.31868-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The standard 'success' output of insn_decoder_test spams build logs with:

  arch/x86/tools/insn_sanity: Success: decoded and checked 1000000 random instructions with 0 errors (seed:0x2e263877)

Prefix the message with the standard '  ' (two spaces) used by kbuild
to denote regular build messages, making it easier for tools to
filter out warnings and errors.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: David Woodhouse <dwmw@amazon.co.uk>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>
---
 arch/x86/tools/insn_sanity.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/tools/insn_sanity.c b/arch/x86/tools/insn_sanity.c
index 213f35f94feb..e743f0ea01ee 100644
--- a/arch/x86/tools/insn_sanity.c
+++ b/arch/x86/tools/insn_sanity.c
@@ -253,9 +253,9 @@ int main(int argc, char **argv)
 	}
 
 	fprintf((errors) ? stderr : stdout,
-		"%s: %s: decoded and checked %d %s instructions with %d errors (seed:0x%x)\n",
+		"  %s: %s: Decoded and checked %d %s instructions with %d errors (seed:0x%x)\n",
 		prog,
-		(errors) ? "Failure" : "Success",
+		(errors) ? "failure" : "success",
 		insns,
 		(input_file) ? "given" : "random",
 		errors,
-- 
2.45.2

