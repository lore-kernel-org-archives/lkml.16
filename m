Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1041B3925
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 10:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743761752; cv=none; b=YeKFssY3+Bxs8cTnNmixGD0pbJk/hSj/LCKOev5zpNX4M7Pdd7+MBDT8JSdVDd1xVYDE96dam53wzaZrqpODGYJlrLpY4aFcD72rImI9dkg0yoFW1f+KS057H/dgFYMlLHYiNWb0IW0CTpuvXLbY3l9jU/r3HiLk7t3+PG80oR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743761752; c=relaxed/simple;
	bh=R2BR0qqO3PePUpH1S4THnCm5i4BVGs4eFwUy+ZzQMvc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iryF7DneRWY7i+KjenmX6ophdLn2BrD0DSKeanPYhhInzzzKagr0UsELqfPxtSHCdkgefXW07UJNX70qgCvj0itaT8kbOdXPWFcmie1/ySJxesGK9gwlJ5y79bqRBz5/5kFbgSt+fj3ZZWNdyY6Q3W0cxhxK1trBDuhKuxkblBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gt4fVU0a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gt4fVU0a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D370C4CEDD;
	Fri,  4 Apr 2025 10:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743761751;
	bh=R2BR0qqO3PePUpH1S4THnCm5i4BVGs4eFwUy+ZzQMvc=;
	h=From:To:Cc:Subject:Date:From;
	b=Gt4fVU0aDRIkqL8Dl5z6AQHLUPpAsigzVkvUCY5cll+L1ziG+l/tE4ZjpHyzgBZbz
	 SSXCzER9wOrWMTvPP/ZESRjYYofjjDzLWzxfolFBWoYUwZtFSBxsFndhcPWZcSU+2a
	 5MYO6w1X1EjWPzoinjx0d8OUmzu/fJKXESM++YhwdCnZu/f08G2XvX/QVDIfE1J327
	 pC5jAFUfglLzqgEQ5qXHVW9DtrErVIhuTQRqW53KeaZ4WdpZlCp0eSDoQWG2g7Ct1W
	 NBP/BW/3KT1tmMPAoXxUHse/NhDOEEqFnTTyaeklnQTn+tljmvYBy0hmu7cspToyRe
	 0tRrO6noP8EVA==
From: Philipp Stanner <phasta@kernel.org>
To: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	Philipp Stanner <phasta@kernel.org>
Subject: [PATCH v2] workqueue: Better document teardown for delayed_work
Date: Fri,  4 Apr 2025 12:15:44 +0200
Message-ID: <20250404101543.74262-2-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

destroy_workqueue() does not ensure that non-pending work submitted with
queue_delayed_work() gets cancelled. The caller has to ensure that
manually.

Add this information about delayed_work in destroy_workqueue()'s
docstring.

Add a TODO for destroy_workqueue() to wait for all delayed_work.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
Changes in v2:
  - Make it explicit what the problem is and tell the user what to do to
    work around it. (Tejun)
  - Add a TODO for handling delayed_work in the future. (Me)
---
 kernel/workqueue.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index bfe030b443e2..a4d23c102f9f 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -5837,6 +5837,17 @@ static bool pwq_busy(struct pool_workqueue *pwq)
  * @wq: target workqueue
  *
  * Safely destroy a workqueue. All work currently pending will be done first.
+ *
+ * This function does NOT guarantee that non-pending work that has been
+ * submitted with queue_delayed_work() and similar functions will be done
+ * before destroying the workqueue. The fundamental problem is that, currently,
+ * the workqueue has no way of accessing non-pending delayed_work. delayed_work
+ * is only linked on the timer-side. All delayed_work must, therefore, be
+ * canceled before calling this function.
+ *
+ * TODO: It would be better if the problem described above wouldn't exist and
+ * destroy_workqueue() would cleanly cancel all pending and non-pending
+ * delayed_work.
  */
 void destroy_workqueue(struct workqueue_struct *wq)
 {
-- 
2.48.1

