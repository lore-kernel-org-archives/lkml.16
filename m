Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867911DEFFE
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 20:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743108924; cv=none; b=OAHdGgEVbUycM+YJnigrXmJzz4+t/yORTArMV+9vNAnH2hrXRtpp7/B8VdOE5Uz5SRfCGl1BswVZR6uBl6h7qsNlr9rQRqyIiTkC5xlYeFZBEUN1k2j25e10nyPnjInDlo8XSGEJ5n4XOujUxAomby22TsSCsNk3ni1a4J8n8xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743108924; c=relaxed/simple;
	bh=qY3C88Lx9VqUBrjdw5WfnBOZxPia3jDyA6h+eQRXizw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J0E8jDQtyP3bckj5iodkCTzMCsXms6eaGVVIhwdsJfotHaIX8OVHhOTy6JCSkO1eZRougxQTsuN+3dgcpVyekXDlMhYdq0MGbpLQeKAsH0pgoISKM7KvhGf42DOXpbt8ZxBS4DTnzHuNHP/aGD+kh5MGl0oQv2wyI3/TEBu2fyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MUUsMFSM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MUUsMFSM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E7EAC4CEE8;
	Thu, 27 Mar 2025 20:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743108924;
	bh=qY3C88Lx9VqUBrjdw5WfnBOZxPia3jDyA6h+eQRXizw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MUUsMFSM+ig41Oj0aKGoITrfewFfH6/TJL0+jrMTpPQFRBeSDkMnx5xPNRxUfyPHO
	 nTtk3E+rv/wrLgTUjcYpkewO5KH3SewrjXM0Ic65IcrX5bZepFFl6iRyyHtiZtp7Xx
	 5ia+kVEl/puT7oZussppiTLxlFDTqd2avObt/5opFJybeqi782BkaYvDh+i70CD8Js
	 sL37V/aCODEdX0sIutddhMGbGhWsipu91PZDWHT8TQ2HCPtvJLgjI1l2g3uMYoYjzh
	 hbx+Ja0l3RyqrkclTCzyEGC8vpFXmh0Dj+ALE2kAVOSs6bsaosJyxx4bcCFqtRTFX0
	 pz9f2XS0jxIQQ==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 35/41] x86/alternatives: Move the tp_array manipulation into text_poke_int3_loc_init() and rename it to text_poke_int3_loc_add()
Date: Thu, 27 Mar 2025 21:53:48 +0100
Message-ID: <20250327205355.378659-36-mingo@kernel.org>
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

This simplifies the code and code generation a bit:

   text	   data	    bss	    dec	    hex	filename
  14802	   1029	   4112	  19943	   4de7	alternative.o.before
  14784	   1029	   4112	  19925	   4dd5	alternative.o.after

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 3ab40b0f5245..e1cc3e109feb 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2752,12 +2752,14 @@ static void text_poke_int3_batch_process(void)
 	}
 }
 
-static void text_poke_int3_loc_init(struct text_poke_int3_loc *tp, void *addr,
-			       const void *opcode, size_t len, const void *emulate)
+static void text_poke_int3_loc_add(void *addr, const void *opcode, size_t len, const void *emulate)
 {
+	struct text_poke_int3_loc *tp;
 	struct insn insn;
 	int ret, i = 0;
 
+	tp = &tp_array.vec[tp_array.nr_entries++];
+
 	if (len == 6)
 		i = 1;
 	memcpy((void *)tp->text, opcode+i, len-i);
@@ -2873,12 +2875,9 @@ static void text_poke_int3_flush(void *addr)
 
 void __ref text_poke_int3_queue(void *addr, const void *opcode, size_t len, const void *emulate)
 {
-	struct text_poke_int3_loc *tp;
-
 	text_poke_int3_flush(addr);
 
-	tp = &tp_array.vec[tp_array.nr_entries++];
-	text_poke_int3_loc_init(tp, addr, opcode, len, emulate);
+	text_poke_int3_loc_add(addr, opcode, len, emulate);
 }
 
 /**
@@ -2894,13 +2893,10 @@ void __ref text_poke_int3_queue(void *addr, const void *opcode, size_t len, cons
  */
 void __ref text_poke_int3(void *addr, const void *opcode, size_t len, const void *emulate)
 {
-	struct text_poke_int3_loc *tp;
-
 	/* Batch-patching should not be mixed with single-patching: */
 	WARN_ON_ONCE(tp_array.nr_entries != 0);
 
-	tp = &tp_array.vec[tp_array.nr_entries++];
-	text_poke_int3_loc_init(tp, addr, opcode, len, emulate);
+	text_poke_int3_loc_add(addr, opcode, len, emulate);
 
 	text_poke_int3_finish();
 }
-- 
2.45.2

