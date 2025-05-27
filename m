Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F131217663
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 22:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748384594; cv=none; b=bJv5ZqtnutBP9uo+ii4dN8X2xkB4oWH6smr1xtSz4qw+TP3NQvhHOgx1iRZdkQowxvv1NBhCNhL7Chh7z1B5sqZRduncjvOXOJAuqOFCVD0iu/1iwvvx//3louthUfDKh9odRG//HY2/Nh3ld/9rUgiAG2gDoghe2tRrW4woRtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748384594; c=relaxed/simple;
	bh=DhNE6lF14CPdGsZE0KobLqxwSQt0aNL4B193ePPpRQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OigLziFEMleD8EVTpoknSDUsCbaESPTL4R/MAyZNxI2PTSHLdi5Inn89sTDKrfC6VI2vBfZWuPUMh/j5xrFJ4ITLi8z+d+Nu3vjctZcqNCZ3QiuR70GTqmYBE0XzD8cKeauAyn/jALmf0YxBgeVPzxFHK+nXGHiYmswdMiw6C9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CiPBvl6b; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CiPBvl6b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748384591;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o1D/dLQQvIMU1jnPqA8TcYF0yBodWfuRo9ocdMJdqcc=;
	b=CiPBvl6bAXl7aBSiqryVo6G+W2+bSkkqiWQNaFGeLFJKviVQx2KyMOwIG5apsCAHDBfGSC
	WIbL9k1MJ0Np070vvz8L/WdbmjOflwRIcJ2PxRhQw/0SBLxM91Xsucu9aggPewNhM4Pwcp
	nu11iAUO9l+3SKK/KdaGNO3yA8Bu5P4=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-302-40AAxw4SN0G-Ou-nYyE32g-1; Tue,
 27 May 2025 18:23:08 -0400
X-MC-Unique: 40AAxw4SN0G-Ou-nYyE32g-1
X-Mimecast-MFC-AGG-ID: 40AAxw4SN0G-Ou-nYyE32g_1748384586
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C2FA51955DAD;
	Tue, 27 May 2025 22:23:05 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.105])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A4C03180047F;
	Tue, 27 May 2025 22:23:01 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: rust-for-linux@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Boqun Feng <boqun.feng@gmail.com>,
	linux-kernel@vger.kernel.org,
	Daniel Almeida <daniel.almeida@collabora.com>
Cc: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>
Subject: [RFC RESEND v10 01/14] preempt: Introduce HARDIRQ_DISABLE_BITS
Date: Tue, 27 May 2025 18:21:42 -0400
Message-ID: <20250527222254.565881-2-lyude@redhat.com>
In-Reply-To: <20250527222254.565881-1-lyude@redhat.com>
References: <20250527222254.565881-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

From: Boqun Feng <boqun.feng@gmail.com>

In order to support preempt_disable()-like interrupt disabling, that is,
using part of preempt_count() to track interrupt disabling nested level,
change the preempt_count() layout to contain 8-bit HARDIRQ_DISABLE
count.

Note that HARDIRQ_BITS and NMI_BITS are reduced by 1 because of this,
and it changes the maximum of their (hardirq and nmi) nesting level.

Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 include/linux/preempt.h | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/include/linux/preempt.h b/include/linux/preempt.h
index b0af8d4ef6e66..809af7b57470a 100644
--- a/include/linux/preempt.h
+++ b/include/linux/preempt.h
@@ -17,6 +17,7 @@
  *
  * - bits 0-7 are the preemption count (max preemption depth: 256)
  * - bits 8-15 are the softirq count (max # of softirqs: 256)
+ * - bits 16-23 are the hardirq disable count (max # of hardirq disable: 256)
  *
  * The hardirq count could in theory be the same as the number of
  * interrupts in the system, but we run all interrupt handlers with
@@ -26,29 +27,34 @@
  *
  *         PREEMPT_MASK:	0x000000ff
  *         SOFTIRQ_MASK:	0x0000ff00
- *         HARDIRQ_MASK:	0x000f0000
- *             NMI_MASK:	0x00f00000
+ * HARDIRQ_DISABLE_MASK:	0x00ff0000
+ *         HARDIRQ_MASK:	0x07000000
+ *             NMI_MASK:	0x38000000
  * PREEMPT_NEED_RESCHED:	0x80000000
  */
 #define PREEMPT_BITS	8
 #define SOFTIRQ_BITS	8
-#define HARDIRQ_BITS	4
-#define NMI_BITS	4
+#define HARDIRQ_DISABLE_BITS	8
+#define HARDIRQ_BITS	3
+#define NMI_BITS	3
 
 #define PREEMPT_SHIFT	0
 #define SOFTIRQ_SHIFT	(PREEMPT_SHIFT + PREEMPT_BITS)
-#define HARDIRQ_SHIFT	(SOFTIRQ_SHIFT + SOFTIRQ_BITS)
+#define HARDIRQ_DISABLE_SHIFT	(SOFTIRQ_SHIFT + SOFTIRQ_BITS)
+#define HARDIRQ_SHIFT	(HARDIRQ_DISABLE_SHIFT + HARDIRQ_DISABLE_BITS)
 #define NMI_SHIFT	(HARDIRQ_SHIFT + HARDIRQ_BITS)
 
 #define __IRQ_MASK(x)	((1UL << (x))-1)
 
 #define PREEMPT_MASK	(__IRQ_MASK(PREEMPT_BITS) << PREEMPT_SHIFT)
 #define SOFTIRQ_MASK	(__IRQ_MASK(SOFTIRQ_BITS) << SOFTIRQ_SHIFT)
+#define HARDIRQ_DISABLE_MASK	(__IRQ_MASK(SOFTIRQ_BITS) << HARDIRQ_DISABLE_SHIFT)
 #define HARDIRQ_MASK	(__IRQ_MASK(HARDIRQ_BITS) << HARDIRQ_SHIFT)
 #define NMI_MASK	(__IRQ_MASK(NMI_BITS)     << NMI_SHIFT)
 
 #define PREEMPT_OFFSET	(1UL << PREEMPT_SHIFT)
 #define SOFTIRQ_OFFSET	(1UL << SOFTIRQ_SHIFT)
+#define HARDIRQ_DISABLE_OFFSET	(1UL << HARDIRQ_DISABLE_SHIFT)
 #define HARDIRQ_OFFSET	(1UL << HARDIRQ_SHIFT)
 #define NMI_OFFSET	(1UL << NMI_SHIFT)
 
-- 
2.49.0

