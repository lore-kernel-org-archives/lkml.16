Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4ABD20FAA1
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 10:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743071421; cv=none; b=C91Jx0me/hfKOW/vI5LL4lU3Ky9YonYgA6V5ndaowMUqGCnXjPGb+eoxpWI/bO98fRmq3knXo84xJgM6+Lexae7qi0+lJJnNMXCEmtypSqUWJF2AJrp40TBAkPiPEDf9Zz1D6PNzEinGf6TT6fv3ZQmxLB5e5/EgQJf4tdmPoas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743071421; c=relaxed/simple;
	bh=/BxY/YKk2UJG2lxI/lsTF++98Em3QYZhD/GUPXzzoTU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FzwtzP7Fg7qnu0E2V3qUSU5j3P0tledlIpning6hT9sBGUDUSrQefvZlkNOeDSg9W8sNVBSG/zX0CLPGlyFjpVm2H/KZ4BIKNlUtx1keN3DqiolXQlcc+LuTk3D9c6oq11E0BCiRkh9eKcaeR4s4RTeKU+38LaRFG/1fYOWdGfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=abDo4WDm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="abDo4WDm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87995C4CEEA;
	Thu, 27 Mar 2025 10:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743071420;
	bh=/BxY/YKk2UJG2lxI/lsTF++98Em3QYZhD/GUPXzzoTU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=abDo4WDm+tn863zPF5fd5i5/oIqBOiwzHKnliAAp7veihfherq8+aXuQcKLPlJasV
	 clPBh2H7EQAsZ+VNELPL4HTgz1wDPGq34bLuHqtYMFqrfnBbyJwGdUzEHP1pvSvXC/
	 oOuDRUPs1rYUcyZrtF1HSAq4dKB/pcA5wCXsQuDCaQ/k4ZN+xS6HM77nVQW/l1Xivr
	 4nfE+Y00q0TrQn9saZUnk8bQlyTfGd4zYQma+xN/UfwHyHU78A7041zWCn/4qYV7jL
	 /+r+eO/QUxrFgx1ycpUmQ1/CbTOtx0y8BAV+byNp7LeM12t6vZl1uCwryC/71NMd1M
	 W/cev/gTJOx1A==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH 11/14] bugs/riscv: Concatenate 'cond_str' with '__FILE__' in __BUG_FLAGS(), to extend WARN_ON/BUG_ON output
Date: Thu, 27 Mar 2025 11:29:50 +0100
Message-ID: <20250327102953.813608-12-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250327102953.813608-1-mingo@kernel.org>
References: <20250327102953.813608-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend WARN_ON and BUG_ON style output from:

  WARNING: CPU: 0 PID: 0 at kernel/sched/core.c:8511 sched_init+0x20/0x410

to:

  WARNING: CPU: 0 PID: 0 at [idx < 0 && ptr] kernel/sched/core.c:8511 sched_init+0x20/0x410

Note that the output will be further reorganized later in this series.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org
Cc: <linux-arch@vger.kernel.org>
---
 arch/riscv/include/asm/bug.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/bug.h b/arch/riscv/include/asm/bug.h
index feaf456d465b..6278523dd2d1 100644
--- a/arch/riscv/include/asm/bug.h
+++ b/arch/riscv/include/asm/bug.h
@@ -61,7 +61,7 @@ do {								\
 			".org 2b + %3\n\t"                      \
 			".popsection"				\
 		:						\
-		: "i" (__FILE__), "i" (__LINE__),		\
+		: "i" (cond_str __FILE__), "i" (__LINE__),	\
 		  "i" (flags),					\
 		  "i" (sizeof(struct bug_entry)));              \
 } while (0)
-- 
2.45.2

