Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDE926463C
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 08:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744100489; cv=none; b=JdSOiXveqEX/or1kfvPeXlAv9PoH1fZL7x9QC+vivlgEBHUd+uFxCHYyklyH6j3HUiHns8igyu34sU7UYRqhIzmCZvjJYcKlU35A7seMvS7GSRpoX5kjK4Elu85eu4EJXbXJF9TITSX/bA3DqpFQ9cbcOnSTQq0YdEjkNeXa70g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744100489; c=relaxed/simple;
	bh=DNXe2cltquMRMBaAJp3jzbgLWlgty9WIo+JVZVQJGRw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KKC8WFy5JRlljfbITSWjnhYIHLTb4xsH5ZiIkMEcIYjZMCut1jMRUPPBoxyyArezYX92vivyWb6MZou8r/oMsSzorFgb4yHcHq6qaVGhd0poUFPTyTIGuCZtLO4BcuCEWSU0IcwW5yYXz8upal5TOX+kVpA81GbqU1icjxcs+vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GL8Itij/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GL8Itij/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F9D8C4CEE9;
	Tue,  8 Apr 2025 08:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744100488;
	bh=DNXe2cltquMRMBaAJp3jzbgLWlgty9WIo+JVZVQJGRw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GL8Itij/tMPdirFnEzoi2iZQFWDbWE7hFWFboPu5By7aM7rYb6Uj4uhAPJ/F1zW6i
	 f8fBPuNpvaPlg94Yq1516mJMbjcP002LVRU+CPevhx4KVclswWTFMXvLF9NR0KOqFg
	 pYuiiB/A+qIQfRxzgD1kdskgTgHSU4ainhZ4sgtwnOrkERaAu/wjxOTgxcCAHDhVGP
	 aZf8oDNYWDNfpzusHDaIsKUskBGTAw+6dNrsmHYwBc0GGgUPdYoJUjt54F1ruPhKlX
	 BacHRKJgSJZBZmBtVDOM/HHf42ifzvCPaaw4eBPOYMIvGdfwkUY8m1JTpNGKgL7cjk
	 YKaEG94Hwj4FA==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH RFC 4/5] x86/alternative: Improve code generation readability
Date: Tue,  8 Apr 2025 01:21:17 -0700
Message-ID: <35ae5c17e8cc88506b5ae8f3b06d9491f7ef319c.1744098446.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1744098446.git.jpoimboe@kernel.org>
References: <cover.1744098446.git.jpoimboe@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Improve the readability and compactness of alternatives code.

---------------------
ALTERNATIVE() before:
---------------------

  	# ALT: oldinstr
  771:
  	rep movsb
  772:
  # ALT: padding
  .skip -(((775f-774f)-(772b-771b)) > 0) * ((775f-774f)-(772b-771b)),0x90
  773:
  .pushsection .altinstructions,"a"
   .long 771b - .
   .long 774f - .
   .4byte (((1 << 0) << 16) | ((18*32+ 4)))
   .byte 773b-771b
   .byte 775f-774f
  .popsection
  .pushsection .altinstr_replacement, "ax"
  # ALT: replacement
  774:
  	call rep_movs_alternative
  775:
  .popsection

--------------------
ALTERNATIVE() after:
--------------------

 # <ALTERNATIVE>
 771:	rep movsb
 772:	.skip -(((775f-774f)-(772b-771b)) > 0) * ((775f-774f)-(772b-771b)),0x90
 773:
 # ALT ENTRY:
 .pushsection .altinstructions,"a";  .long 771b - .;  .long 774f - .;  .4byte (((1 << 0) << 16) | ((18*32+ 4)));  .byte 773b-771b;  .byte 775f-774f; .popsection
 # ALT REPLACEMENT:
 .pushsection .altinstr_replacement, "ax"
 774:	call rep_movs_alternative
 775:
 .popsection
 # </ALTERNATIVE>

-----------------------
ALTERNATIVE_2() before:
-----------------------

 	# ALT: oldinstr
 771:
 	# ALT: oldinstr
 771:
 	jmp 6f
 772:
 # ALT: padding
 .skip -(((775f-774f)-(772b-771b)) > 0) * ((775f-774f)-(772b-771b)),0x90
 773:
 .pushsection .altinstructions,"a"
  .long 771b - .
  .long 774f - .
  .4byte ( 3*32+21)
  .byte 773b-771b
  .byte 775f-774f
 .popsection
 .pushsection .altinstr_replacement, "ax"
 # ALT: replacement
 774:
 	jmp .L4	#
 775:
 .popsection

 772:
 # ALT: padding
 .skip -(((775f-774f)-(772b-771b)) > 0) * ((775f-774f)-(772b-771b)),0x90
 773:
 .pushsection .altinstructions,"a"
  .long 771b - .
  .long 774f - .
  .4byte 297	#
  .byte 773b-771b
  .byte 775f-774f
 .popsection
 .pushsection .altinstr_replacement, "ax"
 # ALT: replacement
 774:

 775:
 .popsection

----------------------
ALTERNATIVE_2() after:
----------------------

 # <ALTERNATIVE_2>
 771:
 771:	jmp 6f
 772:	.skip -(((775f-774f)-(772b-771b)) > 0) * ((775f-774f)-(772b-771b)),0x90
 773:
 # ALT ENTRY:
 .pushsection .altinstructions,"a";  .long 771b - .;  .long 774f - .;  .4byte ( 3*32+21);  .byte 773b-771b;  .byte 775f-774f; .popsection
 # ALT REPLACEMENT:
 .pushsection .altinstr_replacement, "ax"
 774:	jmp .L4	#
 775:
 .popsection
 772:	.skip -(((775f-774f)-(772b-771b)) > 0) * ((775f-774f)-(772b-771b)),0x90
 773:
 # ALT ENTRY:
 .pushsection .altinstructions,"a";  .long 771b - .;  .long 774f - .;  .4byte 297;  .byte 773b-771b;  .byte 775f-774f; .popsection	#
 # ALT REPLACEMENT:
 .pushsection .altinstr_replacement, "ax"
 774:
 775:
 .popsection
 # </ALTERNATIVE_2>

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/x86/include/asm/alternative.h | 88 +++++++++++++++++++++---------
 1 file changed, 63 insertions(+), 25 deletions(-)

diff --git a/arch/x86/include/asm/alternative.h b/arch/x86/include/asm/alternative.h
index 4a37a8bd87fd..6472d53625dc 100644
--- a/arch/x86/include/asm/alternative.h
+++ b/arch/x86/include/asm/alternative.h
@@ -151,46 +151,84 @@ static inline int alternatives_text_reserved(void *start, void *end)
 #define alt_rlen		"775f-774f"
 
 #define OLDINSTR(oldinstr)						\
-	"# ALT: oldinstr\n"						\
-	"771:\n\t" oldinstr "\n772:\n"					\
-	"# ALT: padding\n"						\
-	".skip -(((" alt_rlen ")-(" alt_slen ")) > 0) * "		\
-		"((" alt_rlen ")-(" alt_slen ")),0x90\n"		\
+	"771:" oldinstr "\n"						\
+	"772:\t.skip -(((" alt_rlen ")-(" alt_slen ")) > 0) * "		\
+		      "((" alt_rlen ")-(" alt_slen ")),0x90\n"		\
 	"773:\n"
 
-#define ALTINSTR_ENTRY(ft_flags)					      \
-	".pushsection .altinstructions,\"a\"\n"				      \
-	" .long 771b - .\n"				/* label           */ \
-	" .long 774f - .\n"				/* new instruction */ \
-	" .4byte " __stringify(ft_flags) "\n"		/* feature + flags */ \
-	" .byte " alt_total_slen "\n"			/* source len      */ \
-	" .byte " alt_rlen "\n"				/* replacement len */ \
+#define ALTINSTR_ENTRY(ft_flags)					\
+	"# ALT ENTRY:\n"						\
+	".pushsection .altinstructions,\"a\"; "				\
+	" .long 771b - .; "			/* label           */	\
+	" .long 774f - .; "			/* new instruction */	\
+	" .4byte " __stringify(ft_flags) "; "	/* feature + flags */	\
+	" .byte " alt_total_slen "; "		/* source len      */	\
+	" .byte " alt_rlen "; "			/* replacement len */	\
 	".popsection\n"
 
-#define ALTINSTR_REPLACEMENT(newinstr)		/* replacement */	\
+#define ALTINSTR_REPLACEMENT(newinstr)					\
+	"# ALT REPLACEMENT:\n"						\
 	".pushsection .altinstr_replacement, \"ax\"\n"			\
-	"# ALT: replacement\n"						\
-	"774:\n\t" newinstr "\n775:\n"					\
-	".popsection\n"
+	"774:\t" newinstr "\n"						\
+	"775:\n"							\
+	".popsection"
 
-/* alternative assembly primitive: */
-#define ALTERNATIVE(oldinstr, newinstr, ft_flags)			\
+
+#define __ALTERNATIVE(oldinstr, newinstr, ft_flags)			\
 	OLDINSTR(oldinstr)						\
 	ALTINSTR_ENTRY(ft_flags)					\
 	ALTINSTR_REPLACEMENT(newinstr)
 
-#define ALTERNATIVE_2(oldinstr, newinstr1, ft_flags1, newinstr2, ft_flags2) \
-	ALTERNATIVE(ALTERNATIVE(oldinstr, newinstr1, ft_flags1), newinstr2, ft_flags2)
+#define __ALTERNATIVE_2(oldinstr,					\
+			newinstr1, ft_flags1,				\
+			newinstr2, ft_flags2)				\
+	__ALTERNATIVE("\n"						\
+		      __ALTERNATIVE(oldinstr,				\
+				    newinstr1, ft_flags1),		\
+		      newinstr2, ft_flags2)
+
+#define __ALTERNATIVE_3(oldinstr,					\
+			newinstr1, ft_flags1,				\
+			newinstr2, ft_flags2,				\
+			newinstr3, ft_flags3)				\
+	__ALTERNATIVE("\n"						\
+		      __ALTERNATIVE_2(oldinstr,				\
+				      newinstr1, ft_flags1,		\
+				      newinstr2, ft_flags2),		\
+		      newinstr3, ft_flags3)
+
+
+#define ALTERNATIVE(oldinstr, newinstr, ft_flags)			\
+	"\n# <ALTERNATIVE>\n"						\
+	__ALTERNATIVE("\t" oldinstr, newinstr, ft_flags)		\
+	"\n# </ALTERNATIVE>\n"
+
+#define ALTERNATIVE_2(oldinstr,						\
+		      newinstr1, ft_flags1,				\
+		      newinstr2, ft_flags2)				\
+	"\n# <ALTERNATIVE_2>\n"						\
+	__ALTERNATIVE_2("\t"						\
+			oldinstr,					\
+			newinstr1, ft_flags1,				\
+			newinstr2, ft_flags2)				\
+	"\n# </ALTERNATIVE_2>\n"
+
+#define ALTERNATIVE_3(oldinstr,						\
+		      newinstr1, ft_flags1,				\
+		      newinstr2, ft_flags2,				\
+		      newinstr3, ft_flags3)				\
+	"\n# <ALTERNATIVE_3>\n"						\
+	__ALTERNATIVE_3("\t"						\
+			oldinstr,					\
+			newinstr1, ft_flags1,				\
+			newinstr2, ft_flags2,				\
+			newinstr3, ft_flags3)				\
+	"\n# </ALTERNATIVE_3>\n"
 
 /* If @feature is set, patch in @newinstr_yes, otherwise @newinstr_no. */
 #define ALTERNATIVE_TERNARY(oldinstr, ft_flags, newinstr_yes, newinstr_no) \
 	ALTERNATIVE_2(oldinstr, newinstr_no, X86_FEATURE_ALWAYS, newinstr_yes, ft_flags)
 
-#define ALTERNATIVE_3(oldinstr, newinstr1, ft_flags1, newinstr2, ft_flags2, \
-			newinstr3, ft_flags3)				\
-	ALTERNATIVE(ALTERNATIVE_2(oldinstr, newinstr1, ft_flags1, newinstr2, ft_flags2), \
-		      newinstr3, ft_flags3)
-
 /*
  * Alternative instructions for different CPU types or capabilities.
  *
-- 
2.49.0

