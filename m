Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42D1215F7F
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 09:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744277087; cv=none; b=FanSwNNLSKJvb1+MgV+NZYTJvb9aO7u7MeE61DYioooV8duZeuTOrPJwYW182Zzp2eSKTqoSOeHHsnY/GahAaxWpkagQGRQ3EuqaxCl7rAa6zdf8P5C3CYg6RmdigkdbKS5nw/Oiyx2X78XSVjyKDUHD2e8BtgkfA3GPd2gYhLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744277087; c=relaxed/simple;
	bh=PbDhGkzquJrqYI/6wUXbKMcD1qZhasVialAXVfJ/YPg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UkusR9zjcX9mgHTHOM1LbJEbAmHRf5EDFt65JTRJHu05eeVSw6RADkZJ4nfo2isbKNBfTSC0OlVnZmWYUtiXefT2YytuPqA0o8q8Qc1LUqyqJoCDRtaOlk/FoIAgZfQsNtXyNb5LIOp290JH4Y/CPxsRdFxcbftNhOdIj9vhgxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FEflj/nA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FEflj/nA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49627C4CEE3;
	Thu, 10 Apr 2025 09:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744277087;
	bh=PbDhGkzquJrqYI/6wUXbKMcD1qZhasVialAXVfJ/YPg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FEflj/nAewXKCN/6QKq0FnGfuTI/Ruy3/WKcI3nV31yyN2I/9TXQ7MMXbtAa5MnSx
	 MyR6tIWEeNpfMzZE8ofsrLsRkOURP+YF2NRRhizwpWRq/3n7KjxFm82+ZcDm2W8dx8
	 DuT1ln7H3L6ThtNVc8pT1W1RMQxBhZwhA76NyCov+/PwjP36oTp2+OI/4beRzFohkA
	 eNtWOh6EXlV8XjUVymtOfVrZZthqxcntVIwzXD/ZPjiNdw2Hx2JvGfZuTqjBU+oJdM
	 CSTJ+IPH/r3j6tavU20XBuWuOwAvSgjHwQ+n2nPwB/XH7PqW4RIkSyTazgQpoPFsme
	 MgaA+LdPQDsFQ==
From: alexs@kernel.org
To: 
Cc: linux-kernel@vger.kernel.org,
	Alex Shi <alexs@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Waiman Long <longman@redhat.com>,
	Frederic Weisbecker <frederic@kernel.org>
Subject: [PATCH 2/4] sched/isolation: clean up housekeeping_cpu
Date: Thu, 10 Apr 2025 17:24:17 +0800
Message-ID: <20250410092423.9831-2-alexs@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250410092423.9831-1-alexs@kernel.org>
References: <20250410092423.9831-1-alexs@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alex Shi <alexs@kernel.org>

housekeeping_test_cpu will check 'housekeeping_overridden' again in
itself so we don't need do it again outside. just call
housekeeping_test_cpu is fine.

Signed-off-by: Alex Shi <alexs@kernel.org>
Cc: Peter Zijlstra  <peterz@infradead.org>
Cc: Waiman Long <longman@redhat.com>
Cc: Frederic Weisbecker <frederic@kernel.org>
---
 include/linux/sched/isolation.h | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/include/linux/sched/isolation.h b/include/linux/sched/isolation.h
index d8501f4709b5..231bc5766f76 100644
--- a/include/linux/sched/isolation.h
+++ b/include/linux/sched/isolation.h
@@ -63,11 +63,7 @@ static inline void housekeeping_init(void) { }
 
 static inline bool housekeeping_cpu(int cpu, enum hk_type type)
 {
-#ifdef CONFIG_CPU_ISOLATION
-	if (static_branch_unlikely(&housekeeping_overridden))
-		return housekeeping_test_cpu(cpu, type);
-#endif
-	return true;
+	return housekeeping_test_cpu(cpu, type);
 }
 
 static inline bool cpu_is_isolated(int cpu)
-- 
2.47.1

