Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A471A01B0
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 08:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743669149; cv=none; b=a/FhYjz619cSmY/3+3SrcUXaUmUjxn5ReyR2Fy3sPTUTlreH1kD4fwp7i5QVW1NW54mDPT3pju6Qvir68a3+Wb133gN1H2CQR6D1VxI9CD7JYknZplKjMFXMEIIHXmbjvGWhYR2pnvEl63ZSDMJU/jg4oyMNODC3q0If8C28yVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743669149; c=relaxed/simple;
	bh=YC+EQZIchApApc1dXKqQzl7nk2vPDFNBQd9WdIJcgUE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KP64Q+6sRGh4FVbbtik+YPOtO64WCf5KgePBWdSRtnMKa//JnHdlHqcJoRZTqUeoETCN9PAEj8KhkHruQLl+qN4lUGHDQ/6sRRvBAM7WBKet4I/a5OT6ua2oxPY4qshwVxWc0aNSi05tHxXmYndzp1Ts4bsm3mJnBZfMIxJCGbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DicvtzOI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DicvtzOI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BD3AC4CEE3;
	Thu,  3 Apr 2025 08:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743669149;
	bh=YC+EQZIchApApc1dXKqQzl7nk2vPDFNBQd9WdIJcgUE=;
	h=From:To:Cc:Subject:Date:From;
	b=DicvtzOI7byhfJWhWkbsE8UdjVQ/cKjSpFA3a2oiS2B6NU73WffrOt/TAXOZnitIP
	 ReMSQ45KXZ8gBLddpMbG4igYUZbVBu6uYdbAbvMJPS0z7vznrPerQsyj9CT7LN3UGM
	 sJmZl1v8dce2pJ2R+9zI5lRlXEYvGpTvmalidH5DE4V6EeuUfnGyjrMY3LFureOMGx
	 ILQYg0DCkJxEWGmbP+J5eUAY8+fV4kY6j334MDLXgwb3wtmp0d3fIiLk8DBKV8Y4Gt
	 UYtVrkJN18sRJFUL5x1bB5cj5o2wgGvSruGbQfnX7nskjAVydxd1MOBd2d3g9IFpKi
	 xjw7TLYGYxo9g==
From: Philipp Stanner <phasta@kernel.org>
To: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	Philipp Stanner <phasta@kernel.org>
Subject: [PATCH] workqueue: Better document teardown for delayed_work
Date: Thu,  3 Apr 2025 10:31:56 +0200
Message-ID: <20250403083155.37931-2-phasta@kernel.org>
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

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
Hi,

I have seen this WARN_ON [1] fire in my code for testing the DRM GPU
Scheduler, where a (non-delayed) work_item from workqueue A submits
delayed_work to workqueue B [2].

From my experience so far and reading the documentation, I didn't expect
this to happen.

Assuming this is wanted behavior (?), I propose documenting this more
explicitly. Or could it be possible to modify destroy_workqueue() so
that it takes care of submitted delayed_work()?

Greetings,
P.

[1] https://elixir.bootlin.com/linux/v6.14-rc6/source/kernel/workqueue.c#L2257
[2] https://gitlab.freedesktop.org/pstanner/schedleaker/-/blob/goodmemmodell/schedleaker.c?ref_type=heads#L291
---
 kernel/workqueue.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index bfe030b443e2..5a30efe7ddeb 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -5837,6 +5837,9 @@ static bool pwq_busy(struct pool_workqueue *pwq)
  * @wq: target workqueue
  *
  * Safely destroy a workqueue. All work currently pending will be done first.
+ * This does not apply to non-pending work that was submitted with
+ * queue_delayed_work(). Such work must be cancelled manually before calling
+ * this function.
  */
 void destroy_workqueue(struct workqueue_struct *wq)
 {
-- 
2.48.1

