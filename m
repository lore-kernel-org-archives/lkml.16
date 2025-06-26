Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8AF11CBA
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 11:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750938731; cv=none; b=mCDeQsYcZZXcsHW68tZkT/+bofBDoIFs0un6W206tKVSh4/YxBEt+JCk45U7EZHzeikjys9dMQAu3fEZ2i9KAm2CP2BnCCBjyQ+mFozFkmom0aqiYlUQ/FgJzxxlzsHFi3XZlt5o8ZVtfezE46I84TQj7Yj1vfGof2okLEeKrx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750938731; c=relaxed/simple;
	bh=Z2/gv7+X0ZzMXLFEamI/2p1sv1Pl42iZ+vozv6HjU24=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pbLZji+3a0NDOiAknvlKa0/H8KOOXr3T9D+SNgoJFIG/zUNGyFxyebUYxUy/LuvzFRtLv8iBeR2ll7nJZrXLuK8LsM+ltI7chtr8j6u1YVrClQTc1rTN29MZJDubrmVcijVIeWJXsuAoAPx1Mm4C6tE/02Iusxd03U7tR0VRq7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=e48SAGMD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e48SAGMD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750938728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HrL7UX5+CVWiMYZZfXK6ZU+JevGICkJqG7WxaABDFlA=;
	b=e48SAGMDdCO7Htyew/0AQK485IJs6uMCs62U79mG1qiMzL+oK9aUZtuakEXrkAJbSgPnW3
	0HAOAddB4O4+7Y3lJ/1eGDw20QjVmmqB5/v8USDpDe5KvrdTNGL2ZdG9hHHduZfdYMGQUs
	LmIkwMW5zSDDfse1N+yp+ZH4kmyxGqw=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-661-3n6Az5-_O461PxD7QRGXbw-1; Thu,
 26 Jun 2025 07:52:06 -0400
X-MC-Unique: 3n6Az5-_O461PxD7QRGXbw-1
X-Mimecast-MFC-AGG-ID: 3n6Az5-_O461PxD7QRGXbw_1750938725
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 601AC1809C96;
	Thu, 26 Jun 2025 11:52:05 +0000 (UTC)
Received: from gmonaco-thinkpadt14gen3.rmtit.com (unknown [10.45.226.174])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id AE3A230002C5;
	Thu, 26 Jun 2025 11:52:02 +0000 (UTC)
From: Gabriele Monaco <gmonaco@redhat.com>
To: linux-kernel@vger.kernel.org,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Waiman Long <longman@redhat.com>
Cc: Gabriele Monaco <gmonaco@redhat.com>
Subject: [PATCH v7 5/7] sched/isolation: Force housekeeping if isolcpus and nohz_full don't leave any
Date: Thu, 26 Jun 2025 13:48:58 +0200
Message-ID: <20250626114900.106061-6-gmonaco@redhat.com>
In-Reply-To: <20250626114900.106061-1-gmonaco@redhat.com>
References: <20250626114900.106061-1-gmonaco@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Currently the user can set up isolcpus and nohz_full in such a way that
leaves no housekeeping CPU (i.e. no CPU that is neither domain isolated
nor nohz full). This can be a problem for other subsystems (e.g. the
timer wheel imgration).

Prevent this configuration by invalidating the last setting in case the
union of isolcpus and nohz_full covers all CPUs.

Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>
---
 kernel/sched/isolation.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
index 93b038d48900a..0019d941de683 100644
--- a/kernel/sched/isolation.c
+++ b/kernel/sched/isolation.c
@@ -165,6 +165,18 @@ static int __init housekeeping_setup(char *str, unsigned long flags)
 			}
 		}
 
+		/* Check in combination with the previously set cpumask */
+		type = find_first_bit(&housekeeping.flags, HK_TYPE_MAX);
+		first_cpu = cpumask_first_and_and(cpu_present_mask,
+						  housekeeping_staging,
+						  housekeeping.cpumasks[type]);
+		if (first_cpu >= nr_cpu_ids || first_cpu >= setup_max_cpus) {
+			pr_warn("Housekeeping: must include one present CPU neither "
+				"in nohz_full= nor in isolcpus=, ignoring setting %s\n",
+				str);
+			goto free_housekeeping_staging;
+		}
+
 		iter_flags = flags & ~housekeeping.flags;
 
 		for_each_set_bit(type, &iter_flags, HK_TYPE_MAX)
-- 
2.49.0

