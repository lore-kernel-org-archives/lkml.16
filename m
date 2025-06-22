Received: from out187-4.us.a.mail.aliyun.com (out187-4.us.a.mail.aliyun.com [47.90.187.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BAE86349
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 09:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.90.187.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750585936; cv=none; b=eqZtelvpXNk56hmXDYCy8IOjW4GMTcJ0S027usp4+9YLZ5zBXWuhcsniYxsNjyWhxzp+PYs+T1pQyRYup8PQHrbRS/OalgwFOOTc9GbhNGLKzYuBzZPQj7d4jSogHSYc0U77GKweDs859A/8Wsy1t2z0O73VwDs4qmhtjhf5/94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750585936; c=relaxed/simple;
	bh=tn4ctrA+Ql5qlX8LCziOLYbqWSA2PszJ6T8t+I5JtEk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LkTRcMAjWR5RuuI/3yZ0r1gdWQhfmRvNjhoit8qDQ0NzQzbNrqv3iMkHLWyar0td0gvXBgQli1RmAJCdRLSFHsFkRqw45AcpiJwGza8tmIpvJ2D7Jtq8KACOyf7bc16eOZQGTdAN6iZ/25qNaBo6bcTDHUmvKDD4838rsFwTbtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antgroup.com; spf=pass smtp.mailfrom=antgroup.com; dkim=pass (1024-bit key) header.d=antgroup.com header.i=@antgroup.com header.b=O1MyAE00; arc=none smtp.client-ip=47.90.187.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antgroup.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antgroup.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antgroup.com header.i=@antgroup.com header.b="O1MyAE00"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=antgroup.com; s=default;
	t=1750585921; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=YZ0WrFk9y/8LcKmpn+H6dmv5YneL/+xqjv3QHshdfdk=;
	b=O1MyAE00jr7Hmj3ER3E/3OpiU9nNL4/qNYiDvO1GWfwJOfUoYer6rBGUlYAwO+2x9vKVovOWoznGLw9yibkwWNLuIqQQqWkypWcED81fP8MLvTqG/gyxuJ+fKV/ilcqPqwBMWE/PpzKTS5RB1hUmahcfiEJLxiWfYE80Cb3zhvM=
Received: from localhost(mailfrom:henry.hj@antgroup.com fp:SMTPD_---.dTG5lZl_1750584987 cluster:ay29)
          by smtp.aliyun-inc.com;
          Sun, 22 Jun 2025 17:36:28 +0800
From: "Henry Huang" <henry.hj@antgroup.com>
To: changwoo@igalia.com,
	arighi@nvidia.com,
	tj@kernel.org,
	void@manifault.com
Cc: "=?UTF-8?B?6LCI6Ym06ZSL?=" <henry.tjf@antgroup.com>,
  "=?UTF-8?B?WWFuIFlhbihjYWlsaW5nKQ==?=" <yanyan.yan@antgroup.com>,
   <linux-kernel@vger.kernel.org>,
   <sched-ext@lists.linux.dev>,
  "Henry Huang" <henry.hj@antgroup.com>
Subject: [PATCH v1] include SCX_OPS_TRACK_MIGRATION
Date: Sun, 22 Jun 2025 17:36:20 +0800
Message-ID: <20250622093621.1669-1-henry.hj@antgroup.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In our environment, we need track task migrations to update per-cpu
map.
Implementing fentry(on enqueue_task_scx & dequeue_task_scx)
is a feasible solution. But there are some limitations:
1. Can't modify p->scx.xxx
2. enqueue_task_scx & dequeue_task_scx can't have some
special compilation optimizations.
3. Has more overhead compared to struct_ops
So we include SCX_OPS_TRACK_MIGRATION to support tracking task
migrations.
If SCX_OPS_TRACK_MIGRATION is set, runnable/quiescent
would be called whether task is doing migration or not.

Henry Huang (1):
  sched_ext: include SCX_OPS_TRACK_MIGRATION

 kernel/sched/ext.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

-- 
Henry

