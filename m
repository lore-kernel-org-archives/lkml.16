Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AEE927817A
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 09:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746522981; cv=none; b=gnrgTf8h3VYYwoEUSD1sH6tSfdbOgefMB0hEHQ+B4W962+3UiK6wHXTzz4jhORmsVb01nRRPNhbO4wBkpvWxLljeOxvc6XX6Gt5Wuzxjxbkv5cM4QP7T5Dl5rLnFJK4Vmh1hJkR8TGFvew1xTVNj1LTSB816lHAIAOfP/OneMmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746522981; c=relaxed/simple;
	bh=d7e4SY3eBR4nbUQC7DkP59mThg+oNjjxuxhDS9pJDuU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RDjlLOfp0H8LkqaXPsidmqKyS0wGuhBbB7VRFJZ9Xj2kE5W4KQzjtbrSgFTwIO7tGfkacqO5UHxoVlXKoodrPdLVA55cFxZUv/IT1WsLZgUiHCqqis/6Ryjorzv8VyKDqK6ihZN0SmnuFQt8rVIyDDTD1kG3qALLdpL2vJ9SlU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BpA/4tqJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BpA/4tqJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746522976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hzGfxZzb+LEZ7cGAFGG9fsxDMPaEkbSDyL6czA2CMzY=;
	b=BpA/4tqJJZxVyXqNjY4b+0yXPrJdElk3GmaIiwuBxgtzsqozU8OiJFMaCSnt3A4zpuv2rR
	ekxWRBaMkk7IjCmRT0SgfzQ3NFdt3pr+emlZXcEQqLUSy7yPAQD4556nVfUbQjDtllQ1uZ
	iFClCdOO3+8PHPiYWZdDk1PTnBWX17I=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-549--9YHFMNHMoiM8zn7pO3WDA-1; Tue,
 06 May 2025 05:16:14 -0400
X-MC-Unique: -9YHFMNHMoiM8zn7pO3WDA-1
X-Mimecast-MFC-AGG-ID: -9YHFMNHMoiM8zn7pO3WDA_1746522974
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DBEE4195607B;
	Tue,  6 May 2025 09:16:13 +0000 (UTC)
Received: from gmonaco-thinkpadt14gen3.rmtit.com (unknown [10.45.224.215])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 65921195608D;
	Tue,  6 May 2025 09:16:11 +0000 (UTC)
From: Gabriele Monaco <gmonaco@redhat.com>
To: linux-kernel@vger.kernel.org,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Waiman Long <longman@redhat.com>
Cc: Gabriele Monaco <gmonaco@redhat.com>
Subject: [PATCH v4 4/5] timers: Add timer_base_remote_is_idle to query from remote cpus
Date: Tue,  6 May 2025 11:15:39 +0200
Message-ID: <20250506091534.42117-11-gmonaco@redhat.com>
In-Reply-To: <20250506091534.42117-7-gmonaco@redhat.com>
References: <20250506091534.42117-7-gmonaco@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

The function timer_base_is_idle allows to query if the current CPU's
timer base is set to idle. There's currently no way to get the same
information for a remote CPU.

Add timer_base_remote_is_idle that given a CPU number returns the timer
base idle state of that CPU.

Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>
---
 kernel/time/tick-internal.h |  1 +
 kernel/time/timer.c         | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/kernel/time/tick-internal.h b/kernel/time/tick-internal.h
index faac36de35b9..75580f7c69c6 100644
--- a/kernel/time/tick-internal.h
+++ b/kernel/time/tick-internal.h
@@ -167,6 +167,7 @@ extern void fetch_next_timer_interrupt_remote(unsigned long basej, u64 basem,
 extern void timer_lock_remote_bases(unsigned int cpu);
 extern void timer_unlock_remote_bases(unsigned int cpu);
 extern bool timer_base_is_idle(void);
+extern bool timer_base_remote_is_idle(unsigned int cpu);
 extern void timer_expire_remote(unsigned int cpu);
 # endif
 #else /* CONFIG_NO_HZ_COMMON */
diff --git a/kernel/time/timer.c b/kernel/time/timer.c
index 4d915c0a263c..f7fbd3b3cb83 100644
--- a/kernel/time/timer.c
+++ b/kernel/time/timer.c
@@ -2162,6 +2162,17 @@ bool timer_base_is_idle(void)
 	return __this_cpu_read(timer_bases[BASE_LOCAL].is_idle);
 }
 
+/**
+ * timer_base_remote_is_idle() - Return whether timer base is set idle for cpu
+ * @cpu:	Remote CPU
+ *
+ * Returns value of local timer base is_idle value for remote cpu.
+ */
+bool timer_base_remote_is_idle(unsigned int cpu)
+{
+	return per_cpu(timer_bases[BASE_LOCAL].is_idle, cpu);
+}
+
 static void __run_timer_base(struct timer_base *base);
 
 /**
-- 
2.49.0

