Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D45518BC3B
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 13:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747315659; cv=none; b=HijdMg5XesLYbikETwG6/Vm03un8i1R+xfX1PjW/AXFEVQC673Mv0opZulGeJSR6exKFvCcvnJBD2kSNq6p78J1ZGdwbj0qI5Z7Ka/PdlB67X9kIz8oaiuTEyDbEVUyl3V0Wz31wdCPlCSlMSLCPYtJoXP9Ef4ktcBYgepMAYII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747315659; c=relaxed/simple;
	bh=n16jQOi/Rv/VysZ+tnvcUnyGBHA4GQKdR3n6dwxGyEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nfIEkfv6TetzJ59uoydhFPELkvu2oUbxB+7XkFpjP4Emoin+tgjRBGueAE1bzrbM7HcZGAg6Bphokml7iktSfElPzgnE8i/jKs8bBEJn7ZiMDiTpbdWunvZJTWiTiGtWPOxsa3/oDIB5G3WVOB7FhEKbYlJL3t3i3e2+AFRYmbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SHRBSOsm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SHRBSOsm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF13FC4CEEF;
	Thu, 15 May 2025 13:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747315658;
	bh=n16jQOi/Rv/VysZ+tnvcUnyGBHA4GQKdR3n6dwxGyEQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SHRBSOsm8PpW2NV7LwRPAUs1MCy+IvdpS7eaa7pRuyEx+S51d6r4kLOYlZLXBnk9Z
	 +SAR5fqp/A/bl/B0zK6HyIN6PW+NARgnt2kntJEcpEG9P6qqjFo5WRZDsJ2Tpkn6jh
	 R6yTinuzxNvZ48qg3wStr85P/KecC8Q1GzA79cGPOmUdguZ1NKEPbm6Xzf67xVgw4g
	 gXpDaUxj3n96jsJs1PxkFWGiPcMjMVxyTSjclhG4Hy99VkfSE6mlq3V3er+iDXR3Nb
	 NP3b6JWgMkbR3SPe/KrhY1AkkJnm+qTBpp5gEZJZEDl/etQDYvXCl8Hxec3+cFLd83
	 O03R3R7sobsRQ==
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
Subject: [PATCH 04/13] x86/tools: insn_decoder_test.c: Emit standard build success messages
Date: Thu, 15 May 2025 15:27:10 +0200
Message-ID: <20250515132719.31868-5-mingo@kernel.org>
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

