Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B802ED858
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 15:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750433050; cv=none; b=cQYI5DqnCX0jMPW1Ots1xp3AQQXx3Y6TvJBie+QTGVFnduYKHh6k2ZoXBz1b3Zd9i2+5GUI48iyoFSm+e3cjeaa9LlAIRw6WjERA+kz3cIg3P5w6luHYw3B4wSSy6K/u2zM2eEu5CrotHYjzSJhQb4ZCBKCr1cy2InG57mn8sGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750433050; c=relaxed/simple;
	bh=Jw9wHfu0A4TsY4rYKLYQ+jzBCiVyP6zlxbiDxEx+J6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KJ717cLC9WlNCH0eoLoIbuax3hDQjThmTV/++iY/T9k1KyBUfsvuoSegbfpbVgFQJ++Po8NcepvSx+RLDHPTnRVvXCIhYcDld1AyiaHJLXlTRhbnsEDAlzrywoIsb+hegZjdy9hJyS+zGjV2LWt3D+2uepEY8tMQbUASdspJQ7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T1iTSF8w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T1iTSF8w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E57CAC4CEFB;
	Fri, 20 Jun 2025 15:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750433049;
	bh=Jw9wHfu0A4TsY4rYKLYQ+jzBCiVyP6zlxbiDxEx+J6c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T1iTSF8wzOBLkmU2HCPT4Xt4zSx5uKxpbG1+QhuvvucvndUmg8qJ6hQiyljFBoWHi
	 uW0xKVBdArhMA93UMBBp/iCFkcItGI2mfpeMBEN0Rpp6VU/PwHVWs516VLp7iC8wmJ
	 MUU91zxBjdHPZuqw1QyV16aDoT8te5fup5TQIk4x/qAcvMBL89JwiwtzRiimyrWHic
	 JoeNoa4s93KHLTfpVIK3J7DR6c49sSSDkvqtMk9LylxivYBJ40GdtWsAtPP6tMRXqo
	 bfB1eq6Zbnfg51QGvXOVqRJNL2J59Nl9DtQgHW9jnZCMH+gQ+rMArfI7H9NeVtTuJy
	 xb+ocq0ImKgsw==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Tejun Heo <tj@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>,
	Waiman Long <longman@redhat.com>
Subject: [PATCH 20/27] sched/isolation: Remove HK_TYPE_TICK test from cpu_is_isolated()
Date: Fri, 20 Jun 2025 17:23:01 +0200
Message-ID: <20250620152308.27492-21-frederic@kernel.org>
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

It doesn't make sense to use nohz_full without also isolating the
related CPUs from the domain topology, either through the use of
isolcpus= or cpuset isolated partitions.

And now HK_TYPE_DOMAIN includes all kinds of domain isolated CPUs.

This means that HK_TYPE_KERNEL_NOISE (of which HK_TYPE_TICK is only an
alias) implies HK_TYPE_DOMAIN and therefore checking the latter is
enough to deduce the former.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 include/linux/sched/isolation.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/linux/sched/isolation.h b/include/linux/sched/isolation.h
index 9f039dfb5739..46677e8edf76 100644
--- a/include/linux/sched/isolation.h
+++ b/include/linux/sched/isolation.h
@@ -88,8 +88,7 @@ static inline void housekeeping_init(void) { }
 
 static inline bool cpu_is_isolated(int cpu)
 {
-	return !housekeeping_test_cpu(cpu, HK_TYPE_DOMAIN) ||
-	       !housekeeping_test_cpu(cpu, HK_TYPE_TICK);
+	return !housekeeping_test_cpu(cpu, HK_TYPE_DOMAIN);
 }
 
 DEFINE_LOCK_GUARD_0(housekeeping, housekeeping_lock(), housekeeping_unlock())
-- 
2.48.1

