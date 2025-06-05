Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 302C9D2FB
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 15:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749137471; cv=none; b=hPY33R8+/51UU6LInQcIAt/3HGIoSxEfyrssDf2hdAyw29SzkKvICnwPqtbln8K4unLCkB+O36G9OTHK8EREq0sz0IbP6WUaz2oYyQxZOsYyQimDAH1pDeQh1BZAE1+kGf+eaInFmNCrUi9PY3trmOTZgosfUrcsKXux7wV/D7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749137471; c=relaxed/simple;
	bh=Jym7lk/oSgwE4tz+jvDCQ8xqwEfvepBU4SoGDQKSfPs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=R6MnSylDO+DyXfvcHwR+2HGAyGaAl3jY1ED6YgSDF2umHmVxvmviPxki6lmo6TKGZDrYRjB5U49PCe5VcUAG6Dx7m5dBQjICDQixE/PlXio1vIgAMIoOdiFPNfG1oyGVReB0h09y4tK568EvzwJe4QMj/H27LcmjQ5S1rpptX6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=leUfAjHb; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="leUfAjHb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=+y
	6VvsbVmqneb311jvnWeFAbGAGtv2coKXCpEg0kG+o=; b=leUfAjHbos+3eDCX0f
	bnlCMmJNZFeJHJMEZXrly6STuk5qpud5JxP21oAtP27/c0gYpr/2Z3IIBi7WV2QO
	iQ1rOvS83jGtUna4QvAjadD3cy7FS5/JSIKZQIWvFaEwbs4JHzd350GT+01cIULL
	VMf5xNAWj+YeAO66iV7G48/EY=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgDX3jHit0Fo6mfbBQ--.23948S2;
	Thu, 05 Jun 2025 23:29:39 +0800 (CST)
From: wang wei <a929244872@163.com>
To: peterz@infradead.org,
	linux-kernel@vger.kernel.org
Cc: mingo@redhat.com,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	wang wei <a929244872@163.com>
Subject: [PATCH] sched/eevdf:Correct the comment in place_entity
Date: Thu,  5 Jun 2025 23:29:31 +0800
Message-Id: <20250605152931.22804-1-a929244872@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgDX3jHit0Fo6mfbBQ--.23948S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gw1xZr1xAFyDZr1DZw1DZFb_yoWxZrg_G3
	WUCr4Ygr10qr1F9ry7C392gFyrta4F9FWfC3yxuay5JFWUtFZxAF95GFyfGr93tr1xAF1D
	X3ZYgrZ8Wr429jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRNtxhDUUUUU==
X-CM-SenderInfo: jdzsmjiuuylji6rwjhhfrp/1tbiUgdjpmhBtVA6QQABsm

Correct "l" to "vl_i".

Signed-off-by: wang wei <a929244872@163.com>
---
 kernel/sched/fair.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 7a14da539..83157de5b 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -5253,7 +5253,7 @@ place_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
 		 *   V' = (\Sum w_j*v_j + w_i*v_i) / (W + w_i)
 		 *      = (W*V + w_i*(V - vl_i)) / (W + w_i)
 		 *      = (W*V + w_i*V - w_i*vl_i) / (W + w_i)
-		 *      = (V*(W + w_i) - w_i*l) / (W + w_i)
+		 *      = (V*(W + w_i) - w_i*vl_i) / (W + w_i)
 		 *      = V - w_i*vl_i / (W + w_i)
 		 *
 		 * And the actual lag after adding an entity with vl_i is:
-- 
2.25.1

