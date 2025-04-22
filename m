Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF0927C14C
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 11:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745321547; cv=none; b=aEfT7tPcZnyzRKTY+/EWVbUn2iPHubwfJACW1RuqqX+YOVRWYLjQI/u1r3EzslgAqa89QFIBNELiOA6Zkw4tNE3sVeuKYqPodwzQDxI/vBHH3iyDLMvKV/IPAkf5qA06RDbWNJW5of5hYQ4Z0brM86W6cKyS/Y4wpsr9sLUOHdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745321547; c=relaxed/simple;
	bh=4jPx8WFc9syd9FZTvpteAC1u4ZAz1jUbRb8VNBeqebI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZvMnzPmQlCfboMZinS8mRN8lMWaMyls8rAOs2eoynk01C9r5mWivcwcwLv+3Vfbd0on8r1R0uj1Yz4KC5Xq5BprUwt3X8Pp1E6r51yE3+svvQLrj5/pjmIwzmrGD5ugvIzIgrn8hFq/5Cu4kkvSUMulolGbH/IXlLI72HAgo0Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B1a7hL/R; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B1a7hL/R"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43ed8d32a95so43437585e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 04:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745321544; x=1745926344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=05bSEWwjsFQoObkjxJQo+JCFAb3Ry4oW7GBGxZnV2N0=;
        b=B1a7hL/RbR/mHHAwFin0SsqhT35t2zsp1Y10DdcQWhryPS3mHpR8CoHFA8mlw8WsCN
         vKoGwMxR/qQuaLoxGXhUoUYhpkC9i4C1q7ElszkIvXaWHBYlukDORSeMYqIn8/5A7IXq
         abmubrCtkWqJjwFtog7f9V2TPf43ijQnS1GlOn57q6gGK7nxMwVoJpAj01dQ8xGnVvoD
         KNQ+BWNNMKEBt1R881SJ4NFO7NXIhd1u0RGlyG6KFCWp3PZFiMQvcd+NKrJaW/Gw46M6
         g0g3Po+yUsAaDaH4fdA7NcjsMe6LIoCSynAELyecJnwuMuDqeL8GH7+QZVF24dofPRmP
         DcCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745321544; x=1745926344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=05bSEWwjsFQoObkjxJQo+JCFAb3Ry4oW7GBGxZnV2N0=;
        b=E6zKtD9DPicjx1qRL6svvCbqpXCW7zdyo2VpZE0QGEnMx9jVeaw+Eg8X+c3V+qKwfF
         zcaoSzVOipIa51KnyrUTK+Qi5vW1rguH6jv4FW0QnCuV0j8y0q3X4REUceFK1YS6yPg9
         SYW5y21jRkV4sgdiKM4Jh+jD8ARXBEPKF/d2EOifIxg2UVA/kkmcIaVzSmv6QYdlr3FR
         dRMaz/Fvx/QJF4aFWATOaMhVmH/WgOE8Jq4EZQ9il3bkXCv4QeLwsmIha1X8KmZ8RFk6
         kVLUNtvlddTUGulSSJYi8Cus9vIfSs2GqaBgWZN0wAVXx2QflqIUhL498OUOmCD9diq8
         VXXQ==
X-Gm-Message-State: AOJu0Yz67lJy0TiVcujpTqEkPGHBkQ+NbFdZ9TeEcS7+yXXFnadIjtfn
	hI91qBhGGdwiNPxWNFMvS4SucDsNLotZC9pGKJz+p/fLnoDo/u70HYI3+BXrxHc+r63Knh/xFqC
	7
X-Gm-Gg: ASbGncswc/qu/inTtUGhBwImQmqKxU24AtxcXTAJ7WoX6xns9o2pN6cJNRvk5ZK/gq+
	3cV55sKhM0vvA5mEymTMP126nXfdCjM6dz+g6zlyCeWmtu/Z0mEwlu0EO17wYdePSfhwgrtPxdR
	7anxnpy6mUvvKg5uE14FOCfeSECZIHHH2RmJYELHa0tDQE3dF/XZZpZPXWLc6106WcnuLPiOeBq
	eJUgVmHjVN8y9elhQpuyIKxr0VwU5IFyNJgpMF8Rsg5cJ5NKmXfQnp7vGic5Z1V4OM5resLQZVC
	Tg8zggGJdmIPVw/sQFUg2X7ujxb0QEOCWAIh+cyTASux17r7om0o
X-Google-Smtp-Source: AGHT+IGsfI8qZKkHCIu00QTSDHfliRxo6YWhSw3Jfq+3jp8jtX+qjyzyKnnSEeessnTrVraohm79QQ==
X-Received: by 2002:a05:600c:3d08:b0:43b:cc3c:60bc with SMTP id 5b1f17b1804b1-4406aba7ecdmr157805795e9.15.1745321543774;
        Tue, 22 Apr 2025 04:32:23 -0700 (PDT)
Received: from eugen-station.. ([2a02:2f0a:131e:0:1820:da87:73b1:d80c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa49312fsm14907887f8f.70.2025.04.22.04.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 04:32:23 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	andersson@kernel.org
Cc: linux-doc@vger.kernel.org,
	corbet@lwn.net,
	tglx@linutronix.de,
	mingo@redhat.com,
	rostedt@goodmis.org,
	john.ogness@linutronix.de,
	senozhatsky@chromium.org,
	pmladek@suse.com,
	peterz@infradead.org,
	mojha@qti.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	vincent.guittot@linaro.org,
	konradybcio@kernel.org,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	eugen.hristev@linaro.org
Subject: [RFC][PATCH 09/14] genirq: add irq_kmemdump_register
Date: Tue, 22 Apr 2025 14:31:51 +0300
Message-ID: <20250422113156.575971-10-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422113156.575971-1-eugen.hristev@linaro.org>
References: <20250422113156.575971-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add function to register irq info into kmemdump.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 include/linux/irqnr.h | 1 +
 kernel/irq/irqdesc.c  | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/include/linux/irqnr.h b/include/linux/irqnr.h
index e97206c721a0..136f0572ad78 100644
--- a/include/linux/irqnr.h
+++ b/include/linux/irqnr.h
@@ -9,6 +9,7 @@ unsigned int irq_get_nr_irqs(void) __pure;
 unsigned int irq_set_nr_irqs(unsigned int nr);
 extern struct irq_desc *irq_to_desc(unsigned int irq);
 unsigned int irq_get_next_irq(unsigned int offset);
+void irq_kmemdump_register(void);
 
 #define for_each_irq_desc(irq, desc)                                      \
 	for (unsigned int __nr_irqs__ = irq_get_nr_irqs(); __nr_irqs__;   \
diff --git a/kernel/irq/irqdesc.c b/kernel/irq/irqdesc.c
index 287830739783..ae29165b1f1f 100644
--- a/kernel/irq/irqdesc.c
+++ b/kernel/irq/irqdesc.c
@@ -12,6 +12,7 @@
 #include <linux/export.h>
 #include <linux/interrupt.h>
 #include <linux/kernel_stat.h>
+#include <linux/kmemdump.h>
 #include <linux/maple_tree.h>
 #include <linux/irqdomain.h>
 #include <linux/sysfs.h>
@@ -164,6 +165,12 @@ unsigned int irq_set_nr_irqs(unsigned int nr)
 }
 EXPORT_SYMBOL_GPL(irq_set_nr_irqs);
 
+void irq_kmemdump_register(void)
+{
+	kmemdump_register("irq", (void *)&nr_irqs, sizeof(nr_irqs));
+}
+EXPORT_SYMBOL_GPL(irq_kmemdump_register);
+
 static DEFINE_MUTEX(sparse_irq_lock);
 static struct maple_tree sparse_irqs = MTREE_INIT_EXT(sparse_irqs,
 					MT_FLAGS_ALLOC_RANGE |
-- 
2.43.0

