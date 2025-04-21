Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463AC1EDA2E
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 18:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745261581; cv=none; b=GxELh1QIhx+PFFl99fU2wuL+xf1f0wz9nLYhHQ0aw2fEkPjL9Oc3tFt0H2IW+Acd2x0mYvOq066tSexX6MwUq5aA3Dyzhlq9f/VNQ1ZvpQl1H5lhDC802/S/S8VB90HERhb+8houT+fWDRG/SDv5Uxp76VH4BbrzUNm0bg1bj2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745261581; c=relaxed/simple;
	bh=q+soH/bpaCN4JUzwBw1Mkp8BHHdljs6ht02P+bNLL1k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JXFKMUb7ypbdCEe3mh/Hkt93nKiTDLqbmvy5cfYg3eLd7LsuVenx5Ikt7WxfGRWgrPOx0CT+NJq/xjm/ogw+ZIBzWuc414bM+dzyE+P91szDak4AfwewhUy2a4PyDnEb0J1aACTyq5aD+DzicqeZFIfbnS9LcCCU+ojFS9gsjPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nGFRPans; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nGFRPans"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54391C4CEEB;
	Mon, 21 Apr 2025 18:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745261580;
	bh=q+soH/bpaCN4JUzwBw1Mkp8BHHdljs6ht02P+bNLL1k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nGFRPansVRtRL48staVCN2BA1d6N5jLKpP4uD2Jb+h4medbE/UiJuxkZ4nXFczAt0
	 UgjTlyyu0e24VcHvYasorJCMFX2faCTx+6CMHwFM31t+UqU8yP0Uf8aLmiSA9O98Ld
	 Bj3BX2Xf4hx/8u7kJnMC3B4ek2jeDwPyHzuUlduMAMv1szH2/XitRAsRvxhyEMYFGm
	 cCQh5B4FxAI7onl1PRWiFTkFGGAOnoih2RnYonwfNaiGWWrLpI5sGO6h43XTab1IME
	 wFa56sFTWNz/XxptV06SnvCnI/AqVz4rk71TJ5NVkpCIzuFzgC7dd4vnC6CNCLHpCU
	 qtM/6gAgv5EiQ==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andy@kernel.org>,
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
	Ingo Molnar <mingo@kernel.org>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: [PATCH 04/29] x86/boot/e820: Mark e820__print_table() static
Date: Mon, 21 Apr 2025 20:51:44 +0200
Message-ID: <20250421185210.3372306-5-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250421185210.3372306-1-mingo@kernel.org>
References: <20250421185210.3372306-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are no external users of this function left.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: David Woodhouse <dwmw@amazon.co.uk>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/include/asm/e820/api.h | 1 -
 arch/x86/kernel/e820.c          | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/e820/api.h b/arch/x86/include/asm/e820/api.h
index c83645d5b2a8..54427b77bc19 100644
--- a/arch/x86/include/asm/e820/api.h
+++ b/arch/x86/include/asm/e820/api.h
@@ -19,7 +19,6 @@ extern u64  e820__range_update(u64 start, u64 size, enum e820_type old_type, enu
 extern u64  e820__range_remove(u64 start, u64 size, enum e820_type old_type, bool check_type);
 extern u64  e820__range_update_table(struct e820_table *t, u64 start, u64 size, enum e820_type old_type, enum e820_type new_type);
 
-extern void e820__print_table(char *who);
 extern int  e820__update_table(struct e820_table *table);
 extern void e820__update_table_print(void);
 
diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
index b1a30bca56cd..4244b6d53fd0 100644
--- a/arch/x86/kernel/e820.c
+++ b/arch/x86/kernel/e820.c
@@ -199,7 +199,7 @@ static void __init e820_print_type(enum e820_type type)
 	}
 }
 
-void __init e820__print_table(char *who)
+static void __init e820__print_table(const char *who)
 {
 	int i;
 
-- 
2.45.2

