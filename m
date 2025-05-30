Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE94C230BE8
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 14:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748614896; cv=none; b=kO7s5CI0m/7Ca15lqIgz1g4VuXxQBHPg/5a5+nWyMmHxscsmLisS7oWnk0V1L55MzKGdKXtsyDcXCP+tm58HuYSiYAifyoNindQG5Y9Q1QZQk1pRRExJkkwjKNmszukNk1/0CvhFwTMl/ZblLdVbhBekZ+hbeVjxDucC6bnWzOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748614896; c=relaxed/simple;
	bh=2r+ai2x7VLUVZxihBUTVsWqhgUDElI28Kw+ZCl/jX48=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jgghI1ztbtM/r+2MxETE2WdJBrItWsTtIMzSUZk4kXsmhEqqSxNRboPXNmuNXEoJAzRDvaTdgaZJW+pqcn0KKcNq/4iwArlRbdq7cZSvunf62OHxrPZi81SvB4iN/ndMbreNpnfIhHY4XBULMAgz6WJhq0g4bpRgkyK4kBUdmbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Iucuuk4a; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Iucuuk4a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748614893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kKwp7iz1+wrQvq1IugChVlL10tKuo/2JPWBotNxH1S0=;
	b=Iucuuk4avNBDJmVdj3N3opKsy8ZrMCWP0cJ8TOZ/euzEXq7MeW1xJqmu0beEjE7r22Q4MZ
	TWV42uJrOVW/if2mZOER0FqiiPBv07QCKzQbuSHm4FTD1lr+KUEHEfuN2bO671qtFjm3p/
	ZEXgb1O+joWDnQPhhUS+iGvNcJEvgMI=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-5-hpEHG0rGOcCah4yC41Yyvw-1; Fri,
 30 May 2025 10:21:32 -0400
X-MC-Unique: hpEHG0rGOcCah4yC41Yyvw-1
X-Mimecast-MFC-AGG-ID: hpEHG0rGOcCah4yC41Yyvw_1748614891
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4DFCF1800115;
	Fri, 30 May 2025 14:21:31 +0000 (UTC)
Received: from gmonaco-thinkpadt14gen3.rmtit.com (unknown [10.44.33.197])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6DA0F30002C0;
	Fri, 30 May 2025 14:21:28 +0000 (UTC)
From: Gabriele Monaco <gmonaco@redhat.com>
To: linux-kernel@vger.kernel.org,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Waiman Long <longman@redhat.com>
Cc: Gabriele Monaco <gmonaco@redhat.com>
Subject: [PATCH v6 4/6] sched/isolation: Force housekeeping if isolcpus and nohz_full don't leave any
Date: Fri, 30 May 2025 16:20:29 +0200
Message-ID: <20250530142031.215594-5-gmonaco@redhat.com>
In-Reply-To: <20250530142031.215594-1-gmonaco@redhat.com>
References: <20250530142031.215594-1-gmonaco@redhat.com>
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
index 81bc8b329ef17..b3b348427d2b8 100644
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

