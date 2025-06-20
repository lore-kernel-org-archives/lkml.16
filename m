Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FB52EF2B0
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 15:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750433061; cv=none; b=uytM7mKZGbTQV1/bWcWSqNsAYNBjpBdNnPO6a7sfO/P1611sv5afa384HwWb1mo0U5oPRjyN7phv/IfRqv9WL17JTtFw2GBcVj7ha4tTD0kdr7Pbdzvw+U98PQuaEba7tHPk4DJ26xfcD/nR1/z7syUNljJwrgRng3ILmraqTIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750433061; c=relaxed/simple;
	bh=K5NmiuLK/ABSDoPkESRn/wBApzEKeov/t7f19NS3wSg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GCQEsgmewlWYU/XdiM5bRQ3VVn4QGwJT9/FkQQ9w1F4c2F34gN8XiF/+DUsHlRSE3Odq320f8bUneVfVk4wgWP7jygNWCI2qYUhWA++3jfkdM94HrmwcdtgU+BoTeNdalidU/AIJ+vbWcZS+rJpevX8gK+tXMahvAipD32kyero=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e/U0cgJR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e/U0cgJR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C958C4CEF1;
	Fri, 20 Jun 2025 15:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750433061;
	bh=K5NmiuLK/ABSDoPkESRn/wBApzEKeov/t7f19NS3wSg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e/U0cgJRyMi91O3AcZBEVd/rp/Ohq8cZAp9X5yy+7dXaAMnfIvymRPoloYFKxMTQ5
	 TM+hCwDh6kJkYOHAMx17+5tT7LLWf9JZL+cydKzVBGdtzGO7nKK5EbLiIQEFz4AAZC
	 bnnYzQ5xP52JMY8kUqdp7itx8Y34gYl6EI+YteJRTWPU59+u1MJdwxmNdoPNERi1V8
	 MkRI7nBuwaOeWgsVIooUBnR88KVVHGvMlU2sMoKX68vSdvIU9a29VgwmFoC8Ja4arN
	 aYcRQp8u1G6LPnmki6lkfQHMW7dYlImE4OoM88nSxi21mrMORtN0a81q72FzpFq2ee
	 EATtrtmiBfjHA==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Tejun Heo <tj@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>,
	Waiman Long <longman@redhat.com>
Subject: [PATCH 25/27] sched: Switch the fallback task allowed cpumask to HK_TYPE_DOMAIN
Date: Fri, 20 Jun 2025 17:23:06 +0200
Message-ID: <20250620152308.27492-26-frederic@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250620152308.27492-1-frederic@kernel.org>
References: <20250620152308.27492-1-frederic@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tasks that have all their allowed CPUs offline don't want their affinity
to fallback on either nohz_full CPUs or on domain isolated CPUs. And
since nohz_full implies domain isolation, checking the latter is enough
to verify both.

Therefore exclude domain isolation from fallback task affinity.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 include/linux/mmu_context.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mmu_context.h b/include/linux/mmu_context.h
index ac01dc4eb2ce..ed3dd0f3fe19 100644
--- a/include/linux/mmu_context.h
+++ b/include/linux/mmu_context.h
@@ -24,7 +24,7 @@ static inline void leave_mm(void) { }
 #ifndef task_cpu_possible_mask
 # define task_cpu_possible_mask(p)	cpu_possible_mask
 # define task_cpu_possible(cpu, p)	true
-# define task_cpu_fallback_mask(p)	housekeeping_cpumask(HK_TYPE_TICK)
+# define task_cpu_fallback_mask(p)	housekeeping_cpumask(HK_TYPE_DOMAIN)
 #else
 # define task_cpu_possible(cpu, p)	cpumask_test_cpu((cpu), task_cpu_possible_mask(p))
 #endif
-- 
2.48.1

