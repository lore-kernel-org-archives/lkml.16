Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C32820C02A
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 11:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746443413; cv=none; b=MuTKdqJ9yVvV0v4JMkhdpI3hr8DXt3tud3oGdsHDnbgojQOZildHE1Q2R0VL7OW31dR23Oh10k4sxWaMSm6Bl/cKLVYtN01ugG7E92vBY4f1v6GiPkToS+2xbmjarB5Iv4kV035Jryij1lIbkyN/Byhch/Y2m4oJ+Trovz95R/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746443413; c=relaxed/simple;
	bh=MA5YI8z/iGWOl3p8sOB/lvDqAGhCyqXI6W1Vls0V+d8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MRBmvfUxqbY0On+cnlKRSq2vrvTUl1DsfFRB7wPFQ7kojInet219CeL0vBH0BGCst2YVylCDaHrhyft9bAhBThvupBo22CoTb/n9JZOAezj0/WQ9q0gTdDjqPzT2JxtFOciD5koq+83TD+mlT0YUorg5/8QWs45+Wek3g3Qh59U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P/p0pL+c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P/p0pL+c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB005C4CEE9;
	Mon,  5 May 2025 11:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746443412;
	bh=MA5YI8z/iGWOl3p8sOB/lvDqAGhCyqXI6W1Vls0V+d8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P/p0pL+ct1/MYMYIGogvSZv3dl9rLoMu2U+OzpBAtHnkJdmjjYGoeTc3kYvsofRTd
	 YZUFDwQ6uIO5Xo1JXbYgaN3CrT4JvMwcochUYK09vH9NGrGBu4SXkaYxYyO2cxNXnp
	 ErBQx369CZlh1IZuNQGlG6lcyUrBRF6kW8jy000Vq8mcII+qdnvYXiZESNjJy+0hpM
	 6lB8Oj3xfqIn5ljZS+1shCwmJkL5kb3MnEO2x9pXdQKLOQB8TBO3uy1iItvrivadg8
	 U9OqVVZvnf8sci28mJ1SPpASuWRkNBlYebFaF5CVpA/Eml3fhzw1yv90aY35zg3i7H
	 30Mjt7jezdtxQ==
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
Subject: [PATCH 07/15] x86/tools: insn_sanity.c: Emit standard build success messages
Date: Mon,  5 May 2025 13:09:38 +0200
Message-ID: <20250505110946.1095363-8-mingo@kernel.org>
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

