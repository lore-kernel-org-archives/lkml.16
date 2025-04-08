Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35464A21
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 23:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744153580; cv=none; b=AiYAWbizpJp5OwSPiuS1FzDRlHwlmwVT8GZ4uVrygkWAuYRLp0jSfkwepVXn81PvOGpcKWWbSCg96Ew+iClHxRz7kQMLvLbEkue5653SZwO5wIssOI4Ut8fixmbbq14jEOOkt0i4eSBbe+3FieDLlKpwUCZAwImTVHyjxs7cRmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744153580; c=relaxed/simple;
	bh=hcnelevem89FmxHBSmyPa6ReWv18Xw5OglrRd1c5rKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mkl+fv+Yl5CNFzvRY24NcdssWJSfLGRnzyQXB9q0xhv9DiEePcy2iIU6n9Tgy6AGin2t2mJfKJSzqS/+/njGEg6janH61VJhWc0gWms3aqUKA/Rvpr2JzDQXBcFtoNKkEOOCNoF9K4gZiRWhb5dI7jPq5vSZXw5vju6Gk9RGRIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L3+VMhFe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L3+VMhFe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CD54C4CEE5;
	Tue,  8 Apr 2025 23:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744153580;
	bh=hcnelevem89FmxHBSmyPa6ReWv18Xw5OglrRd1c5rKQ=;
	h=From:To:Cc:Subject:Date:From;
	b=L3+VMhFe/JniwX7dzT4gvn+AIVThdRaekKEiW7bLriYN47BPvVWgVsqZr7SjBO9zd
	 ksvt9HgGNIfLm/1aaVMtU7LqEaCPYmj3Z8UFignXqWBjZ/aBQvNPmVmPHzpu0Az3zK
	 mf8FP2w+huc/cZHuP50xVI/2XZuQBsH4Qp6CBsyS0YNhCgDwHdQ15fV3FoKGq4cmS8
	 X0wj+pAaT9stCL0stZnsafqMTSS7u9rZbyCt6s7q1caOhvPTr/LZxSb+gV4LPW2ZIH
	 Pu1BfqkFx4wj5k5Jg5e+WcAFmIZw8l/h+NA6wipK4wIxKNNfsNt0qHtwBL9xuYNri0
	 U4+db0Uc5/2pg==
From: Tejun Heo <tj@kernel.org>
To: void@manifault.com,
	arighi@nvidia.com,
	multics69@gmail.com
Cc: linux-kernel@vger.kernel.org,
	sched-ext@meta.com
Subject: [PATCHSET sched_ext/for-6.16] sched_ext: Reduce usage of static_keys
Date: Tue,  8 Apr 2025 13:06:00 -1000
Message-ID: <20250408230616.2369765-1-tj@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sched_ext uses static_keys to optimize branches on ops flags and which ops
are implemented. Some of those branches aren't that hot and while others are
hotter, they are unlikely to cause meaningful overhead difference given
everything else that's going on. static_keys were used more because there
was no reason not to use static_keys. However, the planned multiple
hierarchical scheduler support won't work with global static_keys as these
branches would have to be based on the specific ops instance.

This patchset replaces static_key usages with tests on ops.flags and a
bitmap tracking which operation is implemented. I couldn't see performance
difference in numerous hackbench runs on a Ryzen 3990x machine before and
after the patchset.

This patchset contains the following five patches:

 0001-sched_ext-Indentation-updates.patch
 0002-sched_ext-Remove-scx_ops_enq_-static_keys.patch
 0003-sched_ext-Remove-scx_ops_cpu_preempt-static_key.patch
 0004-sched_ext-Remove-scx_ops_allow_queued_wakeup-static_.patch
 0005-sched_ext-Make-scx_has_op-a-bitmap.patch

and is also available in the following git branch:

 git://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git scx-remove-static_keys

diffstat follows. Thanks.

 kernel/sched/ext.c |   91 +++++++++++++++++++++++------------------------------
 kernel/sched/ext.h |    8 ----
 2 files changed, 42 insertions(+), 57 deletions(-)

--
tejun

