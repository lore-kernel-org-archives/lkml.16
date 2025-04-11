Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3934C27D797
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744350120; cv=none; b=px41ePt1bWO5UrJOO9o2zezn4t6xsKbQlkeT60Z7wK3f85T8w95oavIP6b79/MSfPCY+bQpaLTK6hCBX8k7JvUrhj55HS5q9k4fGez/Oqyeum4oHGGOf2EJof/hpFEKEFgd/fk16yCbf4sDpNjnXPTf3iSbqszsXYMib9ULJ9GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744350120; c=relaxed/simple;
	bh=1TfzjV65Vu98Mi2aJPbWFVq8Ym9PXjl/pxflZuUinfg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UGDYvAO6UbvNaP6ZMflIpXxz+MsUsIjk6RRyPpoxdqU1FzNgvrc5i31RRyy/r4Ru3UfCvKcoBNQvTGvJ2ugohQl0befnuhp3z2snxfZxfSrP9KbmGmM86mAGcO4VnK8AoXPQc8Y+S5ctosuTTiLuRMOX9ENvKAskaKy+leAeJRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I/bvONuz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I/bvONuz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32EACC4CEE2;
	Fri, 11 Apr 2025 05:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744350120;
	bh=1TfzjV65Vu98Mi2aJPbWFVq8Ym9PXjl/pxflZuUinfg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I/bvONuz2pjRT8xXmuRhAcCA6HMAa/N9lGQy7zL7Rx0ZhYFSb/mdsEhiC5IJuoIGX
	 zu0+sMln/7BU/0etZE5K5OrCtrUE8SSx8K6N5EtEYdaF2zCm/NWwut+6d6vI9plrDJ
	 1z2piMN03JpUmKUk08GH+Q5WHtX279BDEF+1WpjPWATBYZJr3rL9R4Ar6nDC1v5l36
	 sMqZNGn+SpUvwxcAGrbKCuAdh97s8PRtpvYbk7yNnUP6S3lMq0Q8BmIjgAjwxdy50Z
	 zC1BOP4vBwOmFxAhg/E3BA5DwdqBRd/B4CYJt0OIYN72X0UgqS1UAleQIrI8gSZI8Q
	 kvoazOijnndFQ==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 20/53] x86/alternatives: Rename 'int3_desc' to 'int3_vec'
Date: Fri, 11 Apr 2025 07:40:32 +0200
Message-ID: <20250411054105.2341982-21-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250411054105.2341982-1-mingo@kernel.org>
References: <20250411054105.2341982-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index ca4599ef44f3..cb1723730f1e 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2473,7 +2473,7 @@ struct text_poke_int3_vec {
 
 static DEFINE_PER_CPU(atomic_t, int3_refs);
 
-static struct text_poke_int3_vec int3_desc;
+static struct text_poke_int3_vec int3_vec;
 
 static __always_inline
 struct text_poke_int3_vec *try_get_desc(void)
@@ -2483,7 +2483,7 @@ struct text_poke_int3_vec *try_get_desc(void)
 	if (!raw_atomic_inc_not_zero(refs))
 		return NULL;
 
-	return &int3_desc;
+	return &int3_vec;
 }
 
 static __always_inline void put_desc(void)
@@ -2522,7 +2522,7 @@ noinstr int smp_text_poke_int3_handler(struct pt_regs *regs)
 
 	/*
 	 * Having observed our INT3 instruction, we now must observe
-	 * int3_desc with non-zero refcount:
+	 * int3_vec with non-zero refcount:
 	 *
 	 *	int3_refs = 1		INT3
 	 *	WMB			RMB
@@ -2625,12 +2625,12 @@ static void smp_text_poke_batch_process(struct smp_text_poke_loc *tp, unsigned i
 
 	lockdep_assert_held(&text_mutex);
 
-	int3_desc.vec = tp;
-	int3_desc.nr_entries = nr_entries;
+	int3_vec.vec = tp;
+	int3_vec.nr_entries = nr_entries;
 
 	/*
 	 * Corresponds to the implicit memory barrier in try_get_desc() to
-	 * ensure reading a non-zero refcount provides up to date int3_desc data.
+	 * ensure reading a non-zero refcount provides up to date int3_vec data.
 	 */
 	for_each_possible_cpu(i)
 		atomic_set_release(per_cpu_ptr(&int3_refs, i), 1);
-- 
2.45.2

