Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4952D1F8908
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 20:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743108908; cv=none; b=MuZoGM5mR8xG8Lr2QSTd7YMoIlUqsquafailycpA3fg381PxqKZmuX3LF40Fp+QU4Gr//RMht5OaGnhab+W5p6N9tmnXGO9nuQHW6mkHQimwN4jpx3mKUr5p+eW9BSWfTtnfWbGjOSDWtJtyoGKJ7cd/LdMirBoxY5KPoUgXCKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743108908; c=relaxed/simple;
	bh=QMoqbm619+cOnBL7LihbZxCj1fqr6rQXTP8fguEZuoA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rc2E+9IhuOcMKf+CNrNeJF03XQ/2+/x+EBtKjIaYT3dOwX4VCK3dY79hvZL8R0FX4dZtaJLnknPlOfg0kLrsApl+Ij1MmklymWw4YwB+FtrXG45FiP341+GEeBtg0je/3EGORy8Os0fjbQc2DeLmUqjNk26MpNfdrk2i2Bb/3dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hWm3rxVg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hWm3rxVg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8D18C4CEEE;
	Thu, 27 Mar 2025 20:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743108907;
	bh=QMoqbm619+cOnBL7LihbZxCj1fqr6rQXTP8fguEZuoA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hWm3rxVgWeJTd10oVyFZMMZrHgpbmW+4A8j6D7Puu0V4hC5LgTr1UDwUlnB3SFzu4
	 4pjU2ivsMqab+ADydjcwsGsirkX5QGpQOwdooZUvkumuaXAxhbnaMonGikTRqbnuoR
	 +/bS1+8Uegbv9AriN/nEaRZfsN7dPrH9SSavM9pj0vgCLy+dJ5wlSEloyglIgdXdMB
	 oJ8rxw4sXSdpYgFWYArOOLh+MT/QCKl5hVAktzJEOQFCXzr7f7APJKw9jQkmt8zHID
	 MY0fnBMfQO87Zo+QJBk1WSuqyimVXlTCxV96OZgdnYrxhe3RTSoUnKK4Pky+P2kLFX
	 EqRDG8XQAbr7g==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 28/41] x86/alternatives: Rename 'try_get_desc()' to 'try_get_tp_array()'
Date: Thu, 27 Mar 2025 21:53:41 +0100
Message-ID: <20250327205355.378659-29-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250327205355.378659-1-mingo@kernel.org>
References: <20250327205355.378659-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This better reflects what the underlying code is doing,
there's no 'descriptor' indirection anymore.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 3baef1827f3c..4b5ab9002e07 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2476,7 +2476,7 @@ static struct text_poke_int3_array {
 static DEFINE_PER_CPU(atomic_t, int3_refs);
 
 static __always_inline
-struct text_poke_int3_array *try_get_desc(void)
+struct text_poke_int3_array *try_get_tp_array(void)
 {
 	atomic_t *refs = this_cpu_ptr(&int3_refs);
 
@@ -2530,7 +2530,7 @@ noinstr int text_poke_int3_handler(struct pt_regs *regs)
 	 */
 	smp_rmb();
 
-	desc = try_get_desc();
+	desc = try_get_tp_array();
 	if (!desc)
 		return 0;
 
@@ -2627,7 +2627,7 @@ static void text_poke_int3_batch(struct text_poke_int3_loc *tp, unsigned int nr_
 	WARN_ON_ONCE(nr_entries != tp_array.nr_entries);
 
 	/*
-	 * Corresponds to the implicit memory barrier in try_get_desc() to
+	 * Corresponds to the implicit memory barrier in try_get_tp_array() to
 	 * ensure reading a non-zero refcount provides up to date tp_array data.
 	 */
 	for_each_possible_cpu(i)
-- 
2.45.2

