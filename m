Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9794220E700
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 09:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744623694; cv=none; b=kI0Iw06Dc4KfHEsJYF4XVMI2zxHpu1tjycxdN+b1XBjukBWezy7UECWTnRT3vSrQ+JaNMG+o9yCYSnhl+DmuNbkbp183LehWSa/IP5tNgcP6GnO5fuS4EFlaU5inWk8Z+W/q/30MFeS02SqqhlPM0Jfikl3UzguZAIkdWKCS940=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744623694; c=relaxed/simple;
	bh=BzLPisJeIY6KA0RuS8yKmqWGDBADlzEOY6B4ll9BP/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DIc5J4B4psGycXAnVQyjoS7PqmurMto2OJIaoO301l7xxsLbLONi3Dc+b7ZJn1LCZXkqtisYtBZi68gdsMTa6aK+9pTV9Ypi4xlRUMp6Wa2O6671eN3bCiPKqifX0qqlsC0CfHhvAharoief5Uxbh3s25BtwiFgh1h5X9FDaT2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O8zGwczu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O8zGwczu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 316E0C4CEE5;
	Mon, 14 Apr 2025 09:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744623694;
	bh=BzLPisJeIY6KA0RuS8yKmqWGDBADlzEOY6B4ll9BP/Y=;
	h=From:To:Cc:Subject:Date:From;
	b=O8zGwczuoLmbUFzt1xlRb674Exg9WVF94F+2MMgXwQPTc9FjKPR6XYSWgi4DGFcml
	 2aFQx2+gBW/VNJsyt5zLD7a3f/NS6sM9EzFrByGts0/kEeqJiz1im+md3356dqMzTF
	 oThG/GafIkrhQ8bRgLbL4mb8aWQMhu34ukx3piEjVXM879QkL7Ks5Tt00WqbQTfO/v
	 eJu8rvNgpD19+GqclrN3VT49Y2YNef0jC6pNn8A7iOZl5sXGLTZWtKKUBI5DsoOwZj
	 trHZsfCfxrpy9LrupZbaiAgUQSLi6zDj7mEP3Pim51Oa2Zg6JfRSYyafmOUdkhTpEQ
	 x1YkrPDQyjG3A==
From: Borislav Petkov <bp@kernel.org>
To: X86 ML <x86@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	"Borislav Petkov (AMD)" <bp@alien8.de>
Subject: [PATCH] x86/cpuid: Align macro linebreaks vertically
Date: Mon, 14 Apr 2025 11:41:29 +0200
Message-ID: <20250414094130.6768-1-bp@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Borislav Petkov (AMD)" <bp@alien8.de>

Align the backspaces vertically again, after recent cleanups.

No functional changes.

Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
---
 arch/x86/include/asm/cpuid/api.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/cpuid/api.h b/arch/x86/include/asm/cpuid/api.h
index bf75c6267311..bf76a1706d02 100644
--- a/arch/x86/include/asm/cpuid/api.h
+++ b/arch/x86/include/asm/cpuid/api.h
@@ -36,9 +36,9 @@ static inline void native_cpuid(u32 *eax, u32 *ebx,
 }
 
 #define NATIVE_CPUID_REG(reg)					\
-static inline u32 native_cpuid_##reg(u32 op)	\
+static inline u32 native_cpuid_##reg(u32 op)			\
 {								\
-	u32 eax = op, ebx, ecx = 0, edx;		\
+	u32 eax = op, ebx, ecx = 0, edx;			\
 								\
 	native_cpuid(&eax, &ebx, &ecx, &edx);			\
 								\
-- 
2.43.0

