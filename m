Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273952BD59B
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 11:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751025126; cv=none; b=P5aUwoA5bMD1ecL3QilSwcv5w5grYlPFNScB1Ddgi+94FVhNqkTTLFBKLiZtqBQv+lF6LBFnylClKJ2ZnDwvXRqTLKDDlUlW0QUeKwzwosFz13rtagdu0R6fRDQFDuIyKfBYIHrUVg742l0qaGhYo5oV0tyXGsQQAclItTZJDQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751025126; c=relaxed/simple;
	bh=eLabGndv5WbLVWZBWuCa784Nl9PyS/LDkKRTF1WtRSc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pv7CgNJ6lYUyMUfa5CGfl0Gzw8ZMVBsL/pXedKVaF4lNm7WlQwvxIVsuTSTfpHUsaBn7FXgMsJn7zs5/u+S63LLRrfSTBz03zz0Nw3oP5lYYhHx/mcpNz7vZ1nhyiQNrIiTqdVAXdtspKBc2Dvs6s6nPfSV8K6gz5m0YNBBQfbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a1N4YoGN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a1N4YoGN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751025124;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OYPEz3mUS07c5nVCrOLOsn4ePZ2xxtEuXLNx/SjYWkQ=;
	b=a1N4YoGNxPtn6AevYODb0O106jXBzVaEk42lBYWLo7NuF25DJQOWmtCT8GY7D57W2gXk+C
	UCVxtAUD0O6yxgdB4AGGLL72NwEer0G3tH8VHa5YUIpOMOrcLnYALauFaFhDGgGEMG1LH0
	bz9MIwqEF8qFriXz4NcyssQwrrQxu6I=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-618-UTx3Z_1INq-JNb5Xn6jw_A-1; Fri,
 27 Jun 2025 07:52:02 -0400
X-MC-Unique: UTx3Z_1INq-JNb5Xn6jw_A-1
X-Mimecast-MFC-AGG-ID: UTx3Z_1INq-JNb5Xn6jw_A_1751025121
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 764A418011DF;
	Fri, 27 Jun 2025 11:52:00 +0000 (UTC)
Received: from jlelli-thinkpadt14gen4.remote.csb (unknown [10.44.32.84])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C98DA19560A7;
	Fri, 27 Jun 2025 11:51:54 +0000 (UTC)
From: Juri Lelli <juri.lelli@redhat.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <llong@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	Marcel Ziswiler <marcel.ziswiler@codethink.co.uk>,
	Luca Abeni <luca.abeni@santannapisa.it>,
	Juri Lelli <juri.lelli@redhat.com>
Subject: [PATCH 2/5] sched/deadline: Reset extra_bw to max_bw when clearing root domains
Date: Fri, 27 Jun 2025 13:51:15 +0200
Message-ID: <20250627115118.438797-3-juri.lelli@redhat.com>
In-Reply-To: <20250627115118.438797-1-juri.lelli@redhat.com>
References: <20250627115118.438797-1-juri.lelli@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

dl_clear_root_domain() doesn't take into account the fact that per-rq
extra_bw variables retain values computed before root domain changes,
resulting in broken accounting.

Fix it by resetting extra_bw to max_bw before restoring back dl-servers
contributions.

Fixes: 2ff899e351643 ("sched/deadline: Rebuild root domain accounting after every update")
Reported-by: Marcel Ziswiler <marcel.ziswiler@codethink.co.uk>
Signed-off-by: Juri Lelli <juri.lelli@redhat.com>
---
 kernel/sched/deadline.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index c1f223f372968..7a3b556d45a99 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -2907,7 +2907,14 @@ void dl_clear_root_domain(struct root_domain *rd)
 	int i;
 
 	guard(raw_spinlock_irqsave)(&rd->dl_bw.lock);
+
+	/*
+	 * Reset total_bw to zero and extra_bw to max_bw so that next
+	 * loop will add dl-servers contributions back properly,
+	 */
 	rd->dl_bw.total_bw = 0;
+	for_each_cpu(i, rd->span)
+		cpu_rq(i)->dl.extra_bw = cpu_rq(i)->dl.max_bw;
 
 	/*
 	 * dl_servers are not tasks. Since dl_add_task_root_domain ignores
-- 
2.49.0

