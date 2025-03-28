Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B664821C9F1
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168487; cv=none; b=c9Cs6CU4SlocWgGvsuuLcYc6Fabhi2xE18ZttlOj57j7eSuk9Fasrp9bMBRGeXKcyCHDGXkX1mtYDb59xKefugLtewyKMBOyONuq8LM2uVR3gEAFpIVWS6lUBxXf5BkbO10BBHD23xES0duhskXBif0GlKy4wn/fvjhRLUGdz20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168487; c=relaxed/simple;
	bh=2tfunCb0ARRC7tOe0TGa/+kvokaSGZAYYEpTpB7gGKU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AMZBjeJgvxftJFprlztKp5Cr1G8EBDfrEQfIEStTF/ssazmll8b9RCcQyuhVyYPO/R9fWJg483v8gdkAzJC5o1TqPdyBcBt7PBMgAwT5HqgwQGr2aQVSZixNyao1ZZ5kXq+g/PAFQFwGs96S25DtW2UluxLVRcYPCPHOTtfkoDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jfLi1gOA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jfLi1gOA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40146C4CEE4;
	Fri, 28 Mar 2025 13:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743168487;
	bh=2tfunCb0ARRC7tOe0TGa/+kvokaSGZAYYEpTpB7gGKU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jfLi1gOANRfVgpRsCKMICsx+f8TwJUtrnJ5BTiH8mEuTg0AnDZpcM/Zy94lKkhTFD
	 GiY4dTa4U4xCrupzYy0AEsNhNBZs4msSIkMUoYpL7yoTnsHFURS7x1RdUr9K+6DLQC
	 JyiDYpzS6Qbvrf1gM4beTrhp/jOWZIyGfhw8l7VfxE9uRLqlT9wvlOjbBerBDVn5sb
	 6ohGK03I6/cwQuq4id07WYHjTz7UumWAJI8oDrDayARecW+F2O/RUVzuiHnUvGOqMy
	 Cotj+nfqLq2qxIKdUf/Am90WWVycrvXn8JK2x9C0ZVzi1WDcWit5pzC7AADZarZGFO
	 cl0VjP8ue7KUQ==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 18/49] x86/alternatives: Rename 'int3_desc' to 'int3_vec'
Date: Fri, 28 Mar 2025 14:26:33 +0100
Message-ID: <20250328132704.1901674-19-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250328132704.1901674-1-mingo@kernel.org>
References: <20250328132704.1901674-1-mingo@kernel.org>
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
index db5b06ea08d0..be836d1f6d99 100644
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
@@ -2522,7 +2522,7 @@ noinstr int smp_text_poke_int3_trap_handler(struct pt_regs *regs)
 
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

