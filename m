Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F46C1EEE6
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 22:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738190426; cv=none; b=BHE7pnoyeoGeBhBdQO45rJ9u9HxohB5FQZHMbiv/me8w91jWTC2cl78v6Cf3mNxVqTMff0JQDVu3GYd54wmGKZCo4PNnE396+HbhpT7XYRfDGk0AVtlg257PDK3JMUApxvWFvGRh4u9KPCg6aW2VIEv1ezwkWpR6YHGyMrLzUyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738190426; c=relaxed/simple;
	bh=IP/Wi2HHwLUlMN9hBi9LGNJOEJtrouDH0OqNp3GSzy8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cRpMGcTFda6ioiLgcm3SY6R8iqOW4Ay7kS495THAQetq6gZaYwb/YGD7xU2wbIZ9Po33MzWXCjP/ZXSF0jVegWmyCKT4NCaQS+t2Yi3kxQ06hA0sWmTcGapZcPoLsHJQjNCc1dsYiZdLKZRgDq+CZxnjHqo5lTTbG+oI0+DEXnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IR7yG2T6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IR7yG2T6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738190423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fVaFpiKtEiRpV7WAuYEpE2JjeRbW/Fp6sesWk9LoBhw=;
	b=IR7yG2T67DRCdwOz9GKBaRhZ5XZ1PTOxc89x9PpqhLkmrHtBceR6lVlfEiVqkydGWIQgg+
	4Wk4S/G9rLzr8Tsto9LG4zNRmwkJ2I8owxSihUQnPB6Ggg4OJyuwOVa7Cz86Of7z32YPaR
	N117P5UYUF76PWo+mEXX4xTcpmVkYwM=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-319-Mm-b-k4tPZyVAQkLJALqaw-1; Wed,
 29 Jan 2025 17:40:20 -0500
X-MC-Unique: Mm-b-k4tPZyVAQkLJALqaw-1
X-Mimecast-MFC-AGG-ID: Mm-b-k4tPZyVAQkLJALqaw
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9214A19560A3;
	Wed, 29 Jan 2025 22:40:18 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.westford.csb (unknown [10.22.64.23])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 61FA61800267;
	Wed, 29 Jan 2025 22:40:15 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: John Stultz <jstultz@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Feng Tang <feng.tang@intel.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	Waiman Long <longman@redhat.com>
Subject: [PATCH v3 1/2] clocksource: Use pr_info() for "Checking clocksource synchronization" message
Date: Wed, 29 Jan 2025 17:40:00 -0500
Message-ID: <20250129224001.430506-1-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

The "Checking clocksource synchronization" message is normally printed
when clocksource_verify_percpu() is called for a given clocksource if
both the CLOCK_SOURCE_UNSTABLE and CLOCK_SOURCE_VERIFY_PERCPU flags
are set. It is an informational message and so pr_info() should be used
instead of pr_warn().

Signed-off-by: Waiman Long <longman@redhat.com>
Acked-by: John Stultz <jstultz@google.com>
Reviewed-by: Paul E. McKenney <paulmck@kernel.org>
---
 kernel/time/clocksource.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/time/clocksource.c b/kernel/time/clocksource.c
index 7304d7cf47f2..77d9566d3aa6 100644
--- a/kernel/time/clocksource.c
+++ b/kernel/time/clocksource.c
@@ -382,7 +382,8 @@ void clocksource_verify_percpu(struct clocksource *cs)
 		return;
 	}
 	testcpu = smp_processor_id();
-	pr_warn("Checking clocksource %s synchronization from CPU %d to CPUs %*pbl.\n", cs->name, testcpu, cpumask_pr_args(&cpus_chosen));
+	pr_info("Checking clocksource %s synchronization from CPU %d to CPUs %*pbl.\n",
+		cs->name, testcpu, cpumask_pr_args(&cpus_chosen));
 	for_each_cpu(cpu, &cpus_chosen) {
 		if (cpu == testcpu)
 			continue;
-- 
2.48.1

