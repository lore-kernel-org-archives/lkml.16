Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F85E1F1303
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 20:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743108884; cv=none; b=c5w+syqd2/63p2IMdO1agKGGJhnzOQWvRQ2K/D8dNNe83xIVLb4coJHsv5DovxJClgI25LqDCZ9MDlAih1IKE6AMrHqxZIKiCWWKP9b9eixYckZ6uDw8ZImP10XmhwCWJ3c6BU0PnJzzKvtHq2huQRfIGN8shb47RQluA/MPnFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743108884; c=relaxed/simple;
	bh=DTKzPUx/8uXv0sHiySN+14mvolGDMo9UYku+RfJ/RL0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y+fu3MU+9D3MvOAdFlocNJIt1HtMm0dF2MOWZ7aXeDZ8Jwo2z7htI2i3EoTSgG7LMx5S+HqRlydtL2mbANOFxfrZaHwQK5RxaXufbFY/I4Qos63Q54osjUDpgKA62AazidVieZ+E/kXliNVZzrnpo127bEEVMnhCSIK0CUY502s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iCUplbT4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iCUplbT4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD4EAC4CEED;
	Thu, 27 Mar 2025 20:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743108883;
	bh=DTKzPUx/8uXv0sHiySN+14mvolGDMo9UYku+RfJ/RL0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iCUplbT4H109ZdwWADHUYErja3QlUzv3M6ohr/9bqj+PRI6iciGcjXSdFT/zdZcsY
	 +YeXWpNW+ExAeL42NVkn9bts0y4GVjBcAYhMey66MvqODPNZV9buElCYuGhUNiP+c4
	 wj00t6oNvwOtKqcsB03YtK/Hqqi+ri50KNMf/hZzsqXfFL5UQZXfgWTMpi0NhDrReu
	 6nrFQUE3NOCf5iryZ9KFSs+ClVsqs8gajr9ZNZYgeXx+q0R68LAO6RMPsHuMD877Pa
	 lPzBWgxrYv3CXxKtBLGlpf56sS5wCSh949bYGT2fPLNKqO7fAdFeK2ymXHeUNeRoh0
	 zxQud2nO8Qjqg==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 18/41] x86/alternatives: Rename 'struct int3_patching_desc' to 'struct text_poke_int3_vec'
Date: Thu, 27 Mar 2025 21:53:31 +0100
Message-ID: <20250327205355.378659-19-mingo@kernel.org>
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

Follow the INT3 text-poking nomenclature, and also adopt the
'vector' name for the entire object, instead of the rather
opaque 'descriptor' naming.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 62aead1bd671..84c26d037f05 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2466,17 +2466,17 @@ struct text_poke_int3_loc {
 	u8 old;
 };
 
-struct int3_patching_desc {
+struct text_poke_int3_vec {
 	struct text_poke_int3_loc *vec;
 	int nr_entries;
 };
 
 static DEFINE_PER_CPU(atomic_t, int3_refs);
 
-static struct int3_patching_desc int3_desc;
+static struct text_poke_int3_vec int3_desc;
 
 static __always_inline
-struct int3_patching_desc *try_get_desc(void)
+struct text_poke_int3_vec *try_get_desc(void)
 {
 	atomic_t *refs = this_cpu_ptr(&int3_refs);
 
@@ -2512,7 +2512,7 @@ static __always_inline int patch_cmp(const void *key, const void *elt)
 
 noinstr int text_poke_int3_handler(struct pt_regs *regs)
 {
-	struct int3_patching_desc *desc;
+	struct text_poke_int3_vec *desc;
 	struct text_poke_int3_loc *tp;
 	int ret = 0;
 	void *ip;
-- 
2.45.2

