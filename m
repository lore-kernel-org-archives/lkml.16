Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27A92DE1F6
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 15:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750433066; cv=none; b=S4Itv9YZINJ1htyA1n4gRc7KCFCjerEE9uq9Aw348mHCYR1A9NppFCBGw75URkQhWUWdDLBXReDbuZUtPIhxr3ku4PhY7g83Yz76z3NSEmt/hmr4ejxRksyYiRFTHReTkcFFROmrkL4skC8OMZi5Aw2d1ZYaCsFjlG6X7ZBU99w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750433066; c=relaxed/simple;
	bh=FkUNWsMflMl5tLznIKDkBisS5Q1eWoqBcZohsw2Uy7U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RGn9WfSrRDamjNlF1J4J9U/M7C4Id/P31vc6l7O8y3u47+MLFpBZSaq1UzDn/nFY2GdjkU6lHap5HkdBZqSaDlN3XeJeQP82WLi+kMV8yF9qMG4q6lNN64QUxWELM0IYaUgpkwqAZRjIu+bavY+ziIU5thITl4S2y+HPe1nXkmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jil0UiD/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jil0UiD/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7CE0C4CEF2;
	Fri, 20 Jun 2025 15:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750433066;
	bh=FkUNWsMflMl5tLznIKDkBisS5Q1eWoqBcZohsw2Uy7U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jil0UiD/f/N7lgmuVUH+zt4aQwr40Ej1Ju1mPR87ZzCW7ykTl+MsnjZwrK/YD94KU
	 OAimXSulkjaAStmnOcwrrfnMwUnKU2FqHQv1inCGJnFrRizSeamphgpOwNMtqbLgIr
	 d3l6NL5s/fwMn5Ouc2CwUkLPVtU6evu8HIUcdjzB6rK27XIw1tN/FS5cxiX/36Ed5O
	 pCLQnOVHP6Gi6/ldFj59qBGkfYqVZXALXJMCdnJt9hRir39wGsZr1I58fi2FxWgZYI
	 nSmcyR662++GghJbrTsCd7aghBEITgx8cggvMOVPVOcsPtXGmkp9wW/6BDnw8Zww1H
	 WEBW1zPriEYgw==
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
Subject: [PATCH 27/27] kthread: Comment on the purpose and placement of kthread_affine_node() call
Date: Fri, 20 Jun 2025 17:23:08 +0200
Message-ID: <20250620152308.27492-28-frederic@kernel.org>
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

It may not appear obvious why kthread_affine_node() is not called before
the kthread creation completion instead of after the first wake-up.

The reason is that kthread_affine_node() applies a default affinity
behaviour that only takes place if no affinity preference have already
been passed by the kthread creation call site.

Add a comment to clarify that.

Reported-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/kthread.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/kthread.c b/kernel/kthread.c
index 8c1268c2cee9..85e29b250107 100644
--- a/kernel/kthread.c
+++ b/kernel/kthread.c
@@ -454,6 +454,10 @@ static int kthread(void *_create)
 
 	self->started = 1;
 
+	/*
+	 * Apply default node affinity if no call to kthread_bind[_mask]() nor
+	 * kthread_affine_preferred() was issued before the first wake-up.
+	 */
 	if (!(current->flags & PF_NO_SETAFFINITY) && !self->preferred_affinity)
 		kthread_affine_node();
 
-- 
2.48.1

