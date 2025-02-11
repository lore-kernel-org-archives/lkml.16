Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093752566D9
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 16:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739291814; cv=none; b=DgK6NSzmgUQfxkLfOaUnIi7NApOxkm+7iJKGNKbJ84uYqWiWnH4pK67MVIkJQq/ubkT5VEtR8rLjI+myRhIKOO0s2iwzKJ1mrHk7IkiISsiEWmlIFNL5RsIBIkGHuMIM6AbQ95PcM5wPsrq5SCNWyTCuRLL67etWbQB+Q4elrTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739291814; c=relaxed/simple;
	bh=wosn00B4pxMkJctTKQf3+5j8AEOueZxZUqlh/A18SV8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HIeZPb6UGMg+gVY3p3tuLYParj3MiOQbZb4Vjd3Xv43ncS+zPpNRhkyUi3emYoAWfELKSbPZFaSVgfnbu3+01CO2ZgfLHUj/QzJWOfWUfSmBhV7LfhYpCSjyhwrhhBsuYPHRCEk4EM63BUQ7q7HPfj/7NCJDNxu6Pmz/K2FW/Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RAD1/ky6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RAD1/ky6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B828C4CEE7;
	Tue, 11 Feb 2025 16:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739291813;
	bh=wosn00B4pxMkJctTKQf3+5j8AEOueZxZUqlh/A18SV8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RAD1/ky65sJj8CTrtOO/HvQPNPgHFVKFnD7Qik3Q4NP6GHZX4NmkZq8rBG7RlovsT
	 rQwG7BR9tImIHrbk7cWgiyOEVZaTQwCKEIawchQBUKpWQRJ43ijKCz8wGbENVcbhU9
	 gq56XLtLyHd+GFOoUPdRygSEgrnmNOK/P4u/VSa8378UyKecFL9Ja2gNPyExdJk7R9
	 DR8c3PCG24KhO3XYCX5YPgUF6ebQgJu+njyUhbAi0gdLJplT19m6s+hIaxyf8Q9L+g
	 yHG5W8pHj2xEjUPCupjOgkbXwzZ14RAkE0PD5YnWLaRqSpshXFsBEIQz+GnuIvTVjm
	 23tcTFePQe6YQ==
From: Borislav Petkov <bp@kernel.org>
To: X86 ML <x86@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	"Borislav Petkov (AMD)" <bp@alien8.de>
Subject: [PATCH 1/5] x86/microcode/AMD: Remove ugly linebreak in __verify_patch_section() signature
Date: Tue, 11 Feb 2025 17:36:44 +0100
Message-ID: <20250211163648.30531-2-bp@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250211163648.30531-1-bp@kernel.org>
References: <20250211163648.30531-1-bp@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Borislav Petkov (AMD)" <bp@alien8.de>

No functional changes.

Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
---
 arch/x86/kernel/cpu/microcode/amd.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/x86/kernel/cpu/microcode/amd.c b/arch/x86/kernel/cpu/microcode/amd.c
index a5dac7f3c0a0..4a62625c311a 100644
--- a/arch/x86/kernel/cpu/microcode/amd.c
+++ b/arch/x86/kernel/cpu/microcode/amd.c
@@ -246,8 +246,7 @@ static bool verify_equivalence_table(const u8 *buf, size_t buf_size)
  * On success, @sh_psize returns the patch size according to the section header,
  * to the caller.
  */
-static bool
-__verify_patch_section(const u8 *buf, size_t buf_size, u32 *sh_psize)
+static bool __verify_patch_section(const u8 *buf, size_t buf_size, u32 *sh_psize)
 {
 	u32 p_type, p_size;
 	const u32 *hdr;
-- 
2.43.0

