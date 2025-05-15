Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C670D29A9F2
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 12:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747310867; cv=none; b=DzJXl97BHb0iXzjTJhzJNqlE+tByTW224l93ebwoJSV8EnU+sFYQ2XEurbQDMTTxMvGOAqC0k2SIsjqazNU1+hax+RxBIgTBr000ZORxYOEhOLwP7kHPSU4yEVjrgWmsE6tct98z8w2titmdsVNthSyx6YvdQEW+JEQaMfDeY9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747310867; c=relaxed/simple;
	bh=sGCEBmgaCgK4XJ/4Qqqaf2NGqfrh7owWZSkkh47w4Lg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b6WxVmdkaHe9qpkWB+jffgIuN1VE/ACEZ2Z1Q8G606oSnVsjrLMgFZXWSDBkcnH3hoynQmCAVUXAxDfO7u+8sZJ6uwZtTi1GG7SiG3uRB2k30vuYuVNT4m2deNfgvGAneRLV73CRUeNxtrnCuQp3kumLTnn8B3HpBOcB882H7FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f5aoeI08; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f5aoeI08"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A19A3C4CEEF;
	Thu, 15 May 2025 12:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747310867;
	bh=sGCEBmgaCgK4XJ/4Qqqaf2NGqfrh7owWZSkkh47w4Lg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f5aoeI08UKyZnNhnSRI8bac4X8+UphK0F5S2UxU2vlUjUORQtW/tBrc1yibnEzcWm
	 6QLO88/J/StmMvEZbIGBqF2ftJCWG0c3QKC9hyBH62oqWd2nVzPMeSliHOfsrWrqoD
	 PQXb6cthjX5upZVT40+tXPqYleaJVgBYpNlXSs9wIz1LYfzqaaj6i8lfjQFw44kVfZ
	 qF0KO2ngy/WBcHp1eZSC6vlrssqIhGn5sxsuY5eW9zGNinqQfi/vpgOmn8sWlgmjZv
	 rdoq6dhJ9E72g7tVrLMr/yPW8YCUVdGchE4iyxb0HU6dPsnYLJsclVjER4H4Q3QicT
	 X22xaqoKFfHSA==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Ingo Molnar <mingo@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Kees Cook <keescook@chromium.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: [PATCH 32/32] x86/boot/e820: Move index increments outside accessors in e820__update_table()
Date: Thu, 15 May 2025 14:05:48 +0200
Message-ID: <20250515120549.2820541-33-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250515120549.2820541-1-mingo@kernel.org>
References: <20250515120549.2820541-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This kind of code:

	change_point[chg_idx++]->entry  = &entries[idx];

Can be a bit confusing to human readers, and GCC-15 started
warning about these patterns.

Move the index increment outside the accessor.

Suggested-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: David Woodhouse <dwmw@amazon.co.uk>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/kernel/e820.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
index 10c6e7dc72d7..afb312620c82 100644
--- a/arch/x86/kernel/e820.c
+++ b/arch/x86/kernel/e820.c
@@ -421,9 +421,11 @@ __init int e820__update_table(struct e820_table *table)
 	for (idx = 0; idx < table->nr_entries; idx++)	{
 		if (entries[idx].size != 0) {
 			change_point[chg_idx]->addr	= entries[idx].addr;
-			change_point[chg_idx++]->entry	= &entries[idx];
+			change_point[chg_idx]->entry	= &entries[idx];
+			chg_idx++;
 			change_point[chg_idx]->addr	= entries[idx].addr + entries[idx].size;
-			change_point[chg_idx++]->entry	= &entries[idx];
+			change_point[chg_idx]->entry	= &entries[idx];
+			chg_idx++;
 		}
 	}
 	chg_nr = chg_idx;
-- 
2.45.2

