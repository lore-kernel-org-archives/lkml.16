Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFF2286D48
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 17:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746551389; cv=none; b=gNa5+1SPFZEpgJRQsBspfG2hRHA7/+9x0nzhVYKHpIu072JUWdpxeZPgbGOtG+CDBVwZQ3FxnuMICccKb5WGllOmnQ7MYHVrwfNUpypjMvW1LPerj/6JLeX16E26wzxbRddGK8XyZSrCOItrlw4czR7R24XixhY4/lAIsmiPBvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746551389; c=relaxed/simple;
	bh=n16jQOi/Rv/VysZ+tnvcUnyGBHA4GQKdR3n6dwxGyEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YJLjXpWfvKPlhXpTep6DdGDlbIhZsiSjrNJcBXvNAMFSGuSk+uOY0cmQO1qWSA3f36KHlzyQkyTHqWo5ea/WYo5IYdEjPuieVnr8sqGq+oiwHg/hhPBHF27tuBvBluwMbO1nJ6ivN8uEQ48z0zK1YmASMW3hCqN7Y7nsutMvVFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rOWLr7pc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rOWLr7pc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB612C4CEEB;
	Tue,  6 May 2025 17:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746551388;
	bh=n16jQOi/Rv/VysZ+tnvcUnyGBHA4GQKdR3n6dwxGyEQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rOWLr7pcopmm/sidY4oA4mElLMitiSWJr5OtkGED+NMo+d3yxYd9YHM0JV53Orz24
	 0AiVdWtnrc6FJcq2QoIiMLR1QIf7HENIiZJJXjNQQ2dmGRpm8aqFk+oSq7Df6dakZS
	 +uj7mjdt+6EfGBLPfWjUk3UwyO8P3Chug+m80O227lzBSGlttTpsteTF5Ml4pqPWlk
	 9ZVRQgZeZQJBPo1Pga7zaofhtS9z78BC6JNpoqB4GDgejYkDnaU7h/T6N3VzyW3QWY
	 t/EaR/jhOa0ygfpOUG7DF4CXoU4UAuav6xW47bIXmH219u1uRIULBr/LO4xmj4ry1O
	 UY+rvZXXK6U/Q==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Ingo Molnar <mingo@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH 06/15] x86/tools: insn_decoder_test.c: Emit standard build success messages
Date: Tue,  6 May 2025 19:09:15 +0200
Message-ID: <20250506170924.3513161-7-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250506170924.3513161-1-mingo@kernel.org>
References: <20250506170924.3513161-1-mingo@kernel.org>
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

