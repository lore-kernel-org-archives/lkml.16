Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3DD209F38
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 10:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749291632; cv=none; b=UVUHtwuB+X8Rfzsv0q0OKa7RjGU4P4WO/U9A8rP0oH2z/J4Q9K8fhyqxQunWYdlCNVjPbcIyrfQ1Bgz6dzQxtDo9U5BWbIvEvsEOLf3SF9fS+WPLH+BN3vwkzfkKz6Lrc7DxE5alG4JtPNLhF+lWLj8k9f0JlCSW8at25zGOqGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749291632; c=relaxed/simple;
	bh=sh9beUAbIuorf1w+V3JI/MqIYcQqK9+9r0fObvWZ0h0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CNpFLgxt9x5jwuw1mehVSv7AJ0hZOWztYcNj43pM8/WgEyXK7ke533Ek3h4NMR6PLoJQPA9Em2pI2HSTbvvxntiVldo8COBIxzZUGOJMizP7Quxapj7Gp4RNQYr9frhq2/UP/n3wHGuuPOJadDIeYbbx/d4m0OF4a3uwwsrfeCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jFAmJS/U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jFAmJS/U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6287EC4CEE4;
	Sat,  7 Jun 2025 10:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749291631;
	bh=sh9beUAbIuorf1w+V3JI/MqIYcQqK9+9r0fObvWZ0h0=;
	h=From:To:Cc:Subject:Date:From;
	b=jFAmJS/UyNsfXfaorEpuD0R6fH6cidqEDXXXMjB/CIuz6Eq3BtqYPvKPaS2kZiGut
	 Bf2sDj0isVcFBE2tBd+fQ7E+XDZpaY8K5Q6V+TePXiX/fosCU+xGYrOV/nwKYKiY4A
	 a/N5OJij5HmSRegpp+Poo46fSCJth0g49D0o5l3exYFfaInBOWGdIA0VKghEi7BUkr
	 4cgLnHnjQdaSMYsgskNj5lq7b7WkX9qsBAcmDnwymU+MVDe/mFwwxPgs8HBaJe0YDZ
	 B+yIJSA8cYRrjAHuV6/kEnnh1FgjGKNteaaQ3O4qpD18N0hBkQ+tDggQjPo4G+dMb/
	 R1CSxpwGv/oXw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	linuxppc-dev@lists.ozlabs.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc: unify two CONFIG_POWERPC64_CPU entries in the same choice block
Date: Sat,  7 Jun 2025 19:13:51 +0900
Message-ID: <20250607102005.1965409-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are two CONFIG_POWERPC64_CPU entries in the "CPU selection"
choice block.

I guess the intent is to display a different prompt depending on
CPU_LITTLE_ENDIAN: "Generic (POWER5 and PowerPC 970 and above)" for big
endian, and "Generic (POWER8 and above)" for little endian.

I stumbled on this tricky use case, and worked around it on Kconfig with
commit 4d46b5b623e0 ("kconfig: fix infinite loop in sym_calc_choice()").
However, I doubt that supporting multiple entries with the same symbol
in a choice block is worth the complexity - this is the only such case
in the kernel tree.

This commit merges the two entries. Once this cleanup is accepted in
the powerpc subsystem, I will proceed to refactor the Kconfig parser.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/powerpc/platforms/Kconfig.cputype | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 613b383ed8b3..7b527d18aa5e 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -122,16 +122,11 @@ choice
 	  If unsure, select Generic.
 
 config POWERPC64_CPU
-	bool "Generic (POWER5 and PowerPC 970 and above)"
-	depends on PPC_BOOK3S_64 && !CPU_LITTLE_ENDIAN
+	bool "Generic 64 bits powerpc"
+	depends on PPC_BOOK3S_64
+	select ARCH_HAS_FAST_MULTIPLIER if CPU_LITTLE_ENDIAN
 	select PPC_64S_HASH_MMU
-
-config POWERPC64_CPU
-	bool "Generic (POWER8 and above)"
-	depends on PPC_BOOK3S_64 && CPU_LITTLE_ENDIAN
-	select ARCH_HAS_FAST_MULTIPLIER
-	select PPC_64S_HASH_MMU
-	select PPC_HAS_LBARX_LHARX
+	select PPC_HAS_LBARX_LHARX if CPU_LITTLE_ENDIAN
 
 config POWERPC_CPU
 	bool "Generic 32 bits powerpc"
-- 
2.43.0

