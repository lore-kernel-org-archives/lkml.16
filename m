Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761BA285418
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 17:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746551392; cv=none; b=bSuyUvA16S8RLmhM/Be2UgLHL/lqfULoUa3F0FUnDt0tc9757knupLmPZWLE96HvBj9S7FKZZuDzXJCEUuaJV9OYt5T/pB7AEx6clWjOErYPDeSdcPELa6Ge0WLUV04m+GNLSf5jipogh/K7K2PEvHuRDExZpbfkn2uSbY+WG34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746551392; c=relaxed/simple;
	bh=MA5YI8z/iGWOl3p8sOB/lvDqAGhCyqXI6W1Vls0V+d8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DlG/ZcSkKnX9uoRDOJrflQ21Y8FrFIlmBClKzIApBSXFwXTUqmTzXfCrPcOTSi1kJox/UBEFLiViWRaQCXa97YI4bM9O8v11YqK+cbU3IHmlMG8GDmmmMIlWQ0GZc7sqD4s1FaGOTBL1zjMhuWvP9lad9IYI+PLaZRxSOUFQibw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XfOUMI7d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XfOUMI7d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17805C4CEE4;
	Tue,  6 May 2025 17:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746551391;
	bh=MA5YI8z/iGWOl3p8sOB/lvDqAGhCyqXI6W1Vls0V+d8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XfOUMI7dwzeL8d2vC5bpEJF+80UZWAUbqRYIOdrUeW9BGpHFDChoYmis4ZBEsVi+G
	 pwQCwQN+vX9YLjlpD1o5Ik7Btrud5XQNmmi1JBECm1nMqhsWk7N8DXNOUE0za6gEXp
	 EMBKL6UYX1msLnwT5xuuwa3PHuRaVEsqRKFplbj/+XCdn/apFqo40/HoURQWTqQ41R
	 2ks2qzRtZd8+mLs7ajWIKcDRH49xV2Rvkw7Mp4qKluGWpHG9KcBUbm1k4MktjxjR/+
	 4sR9PTi0TtPvZZ2vZNogifkTMboq1GcZbf7ufRKqRy0uj7a3KPN/z6uN8vvZipvEK4
	 WNTYNI0lbz+ag==
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
Subject: [PATCH 07/15] x86/tools: insn_sanity.c: Emit standard build success messages
Date: Tue,  6 May 2025 19:09:16 +0200
Message-ID: <20250506170924.3513161-8-mingo@kernel.org>
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

