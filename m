Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1862921129A
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 10:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743071407; cv=none; b=hdLPbS7vdHqzrFl9RwzfODFMR5TU0W5zSc89TL65OWBsxh55PPhfuwlAhJSB6m+hD3KWKnCI+iTyhkMK4X+KkTEYkBJAjs+zHqXoQ6LDc8i6ZQZ5zlnHvJ4q8k6+ha4k9Iupo/MWWNvp765jOOtjXvTbpSFOrVYOa+i5RkzO170=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743071407; c=relaxed/simple;
	bh=v63/wEjVZ21rpDvd+eA4iuuSMVSV/g81NATswursLNI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VxEPVFYsltBjjvbffPxLlB7AnQnlxUDSYUGiIvHbcoq+RtTUh13XSSn7tHs9xzHlmXTh7MxpPeD4i/TLo8Ky8AOvYwu31Au5x6rBajVCY+lVGHdlXDNcT+QENEsZ1VfSB/cgk+WDsEC8IznrBGr/JsfRFCiwCLjvioJKIQE9C7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sRsrwCAy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sRsrwCAy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B54B5C4CEDD;
	Thu, 27 Mar 2025 10:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743071407;
	bh=v63/wEjVZ21rpDvd+eA4iuuSMVSV/g81NATswursLNI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sRsrwCAyCS4By0EDGYFw0TIzlBWWJatscWmWfWhvcJr85PxByorvPJ9f4ytOX0wGE
	 eDKADyw+J1Fv0EIwaNRIhwDB3naVxpWAY0M1WgkzNGpzF6waZ9pZQm1ZcAjUH+tKkg
	 s0VyV3ErhGZpa1UrdsaAW803kUdn6ZaF1LHZYlPTW9jwDVoQwPIA4dh865i3VD7y8P
	 Z5NW3kwvPflHUf8WlqyuDQqxsAcVdukqIME8qPlUsvEXF4xCxCGnE7mPNC3dIg4noA
	 m4CsaIPX+DCHEhogLLrPXLGWncYgrZf8SAbNSQqIsjP3DvKYSHIpRVl26cfnQCF0xX
	 dlK1xr7GTYWeQ==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH 03/14] bugs/x86: Extend _BUG_FLAGS() with the 'cond_str' parameter
Date: Thu, 27 Mar 2025 11:29:42 +0100
Message-ID: <20250327102953.813608-4-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250327102953.813608-1-mingo@kernel.org>
References: <20250327102953.813608-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Just pass down the parameter, don't do anything with it yet.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: <linux-arch@vger.kernel.org>
---
 arch/x86/include/asm/bug.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/asm/bug.h b/arch/x86/include/asm/bug.h
index 413b86b876d9..aff1c6b7a7f3 100644
--- a/arch/x86/include/asm/bug.h
+++ b/arch/x86/include/asm/bug.h
@@ -39,7 +39,7 @@
 
 #ifdef CONFIG_DEBUG_BUGVERBOSE
 
-#define _BUG_FLAGS(ins, flags, extra)					\
+#define _BUG_FLAGS(cond_str, ins, flags, extra)				\
 do {									\
 	asm_inline volatile("1:\t" ins "\n"				\
 		     ".pushsection __bug_table,\"aw\"\n"		\
@@ -57,7 +57,7 @@ do {									\
 
 #else /* !CONFIG_DEBUG_BUGVERBOSE */
 
-#define _BUG_FLAGS(ins, flags, extra)					\
+#define _BUG_FLAGS(cond_str, ins, flags, extra)				\
 do {									\
 	asm_inline volatile("1:\t" ins "\n"				\
 		     ".pushsection __bug_table,\"aw\"\n"		\
@@ -74,7 +74,7 @@ do {									\
 
 #else
 
-#define _BUG_FLAGS(ins, flags, extra)  asm volatile(ins)
+#define _BUG_FLAGS(cond_str, ins, flags, extra)  asm volatile(ins)
 
 #endif /* CONFIG_GENERIC_BUG */
 
@@ -82,7 +82,7 @@ do {									\
 #define BUG()							\
 do {								\
 	instrumentation_begin();				\
-	_BUG_FLAGS(ASM_UD2, 0, "");				\
+	_BUG_FLAGS("", ASM_UD2, 0, "");				\
 	__builtin_unreachable();				\
 } while (0)
 
@@ -96,7 +96,7 @@ do {								\
 do {								\
 	__auto_type __flags = BUGFLAG_WARNING|(flags);		\
 	instrumentation_begin();				\
-	_BUG_FLAGS(ASM_UD2, __flags, ANNOTATE_REACHABLE(1b));	\
+	_BUG_FLAGS(cond_str, ASM_UD2, __flags, ANNOTATE_REACHABLE(1b)); \
 	instrumentation_end();					\
 } while (0)
 
-- 
2.45.2

