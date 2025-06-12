Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FD623D284
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 13:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749735237; cv=none; b=t73NuUAU0hZB2jWRi1bO2U9SZk5N2lM7hvrceEFDFIqasosDRQTdvOv3IH4OpGl11VyWgw1oeYoGWqrVml6v5LhbN9VO3vhct/80MQYiM/RAbdXzyRtQ/phZcYSmoC91Y/rUeGYgpUwcCrAcuI978XU5jAP2u2siJyXoZWTE3/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749735237; c=relaxed/simple;
	bh=tLbPoPnRW0rdPQUBzg2TyznGxUv67v8X6d5+AGG7jj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u8wBSjbUdo+RKnJeLMH/AX7f6mV7G+2kylyMwzxw85Q1UQhuMZ/yZK8p/I/UWapXBlnBgEwhL3EWTOksPy+tUTBmkaa4I2UdL3Tkc4YlFRit6p1m8FcCywo9ozd3+Gxf6SZkn83aTWIu9PuQ3hG2vOEuJn0cgClR9jep4aNjUR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TdvUCEwN; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TdvUCEwN"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-451ebd3d149so6219865e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 06:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749735234; x=1750340034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lPUZPI4tBuk4J3QMbJJf2HlNXfqlGDxMUfNoYa/lU9E=;
        b=TdvUCEwNsDfD3TdKqjBdovSYEPbSA6W5OhzWAaCCbAED+iGIwRU7JuzSZckRdSOeaO
         YvgHgs/IkF5lOLeG0HJru5bbPQUxYAiwlSYUJWiuv4vrbTqHLWZSfy+Yvlm9k58skWuL
         pi8TPb7ezFjQoqLbfYqj9VLOZbzif95DrvIrIwbrTtNtTCPt3KeQI9JIfTETkl1CFZ8i
         n60Qvy+uL83sjsNj438i09I0wBbPO/jgzjBSGmR46AFu5iYM2w0AmwWc/KdKkAxHjDnB
         B4+52pl5IRt/SIWhc7LogI0d0lSv8Nu0rkF7ayDZEuDVZGrH3FF16/ZBZ+NipwYDhnlO
         pkuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749735234; x=1750340034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lPUZPI4tBuk4J3QMbJJf2HlNXfqlGDxMUfNoYa/lU9E=;
        b=elXFtDLV+819ibtlxWQIzjhmtKuw21/8qpnimoLZTk5ZHoSRBhEkBudY0nNCQcATrx
         j6r/ghPNWJHGE8kX06uBrjMadfgnrNXxv1Oc/gKOoZxaWTgyWGGecOBXGyG5pg33DNmq
         +hN0NO735GPEqa++B4zQy/Yh3dG8O4PJdEIJ2a3+/G4OBdr1kNoH3QOUb81dyhRyHrWQ
         Ni4scdAuU/e+GKt8YHzB8TBU6B4v2XFSCMA+P7WGVmJdMj9h+I15nN0i7Nxm1St5eO1x
         UfNZJs3JQcDIIf9TiQUaMJoywZSVn0eBj87H44T6YEpcNBMKJcrULjgCO6pUzzB/d9U/
         S1AQ==
X-Gm-Message-State: AOJu0YyZ6qEfNgrrJH9PGg54dZbDYuxQOuAtPgkybUd4tls30nyxF9vE
	Ol4j0N8UxdgWSs1XbbnGiudu19Nm1WxN20OcDPY+Qmr2w2EDV4b7X779o6fr2EJPj0OCP9BjfWJ
	C/jOjmyQ=
X-Gm-Gg: ASbGnct0v1+6hDPOBeruVybtspSjft/BihYpYGak9YmOtcF96o8AhWxxZU5OQPQpE0n
	5GYRjS1CgSauW3O/Des5XLj3W2xXbqkjeXSbO5Alqn+EGQb0FDLzUJbKLsiBjySBXDFbq3x0/dp
	0OAlgrho6Ez33W5WTeM3x15d2Tg1IAnqYTvztoQaaUT4ZZEhrBtrdJRQg6RGlBCo4CFfdkpBY1c
	fpczWc2s87j7DHISBjxy95RwFTZKaqJ0vitdHtIihXbhqjn98wlJD2iHVhCQUirNJbOrOhuK0KZ
	BedvbhvXRPj/TXuVicpstiaYhyptIdCxGwBtYE51jCQNKKPgnoQ6z2IKrIYmc8uG7C+7CfeYR4Y
	pF1U6TuNX
X-Google-Smtp-Source: AGHT+IFep9JCYUbxVpiH9RuWO4OxYgUGckAndZmGihNIlnDposOd00Ys+i/hBLIJuF9SM7GWWtRuGg==
X-Received: by 2002:a5d:64ed:0:b0:3a4:d0fe:42b2 with SMTP id ffacd0b85a97d-3a56130a211mr2245810f8f.19.1749735233575;
        Thu, 12 Jun 2025 06:33:53 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532de8c64esm21693285e9.7.2025.06.12.06.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:33:53 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>
Subject: [PATCH v4 3/3] [Doc] Workqueue: add WQ_PERCPU
Date: Thu, 12 Jun 2025 15:33:35 +0200
Message-ID: <20250612133335.788593-4-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612133335.788593-1-marco.crivellari@suse.com>
References: <20250612133335.788593-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Workqueue documentation upgraded with the description
of the new added flag, WQ_PERCPU.

Also the WQ_UNBOUND flag documentation has been integrated

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 Documentation/core-api/workqueue.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/core-api/workqueue.rst b/Documentation/core-api/workqueue.rst
index e295835fc116..ae63a648a51b 100644
--- a/Documentation/core-api/workqueue.rst
+++ b/Documentation/core-api/workqueue.rst
@@ -183,6 +183,12 @@ resources, scheduled and executed.
   BH work items cannot sleep. All other features such as delayed queueing,
   flushing and canceling are supported.
 
+``WQ_PERCPU``
+  Work items queued to a per-cpu wq are bound to that specific CPU.
+  This flag it's the right choice when cpu locality is important.
+
+  This flag is the complement of ``WQ_UNBOUND``.
+
 ``WQ_UNBOUND``
   Work items queued to an unbound wq are served by the special
   worker-pools which host workers which are not bound to any
@@ -200,6 +206,10 @@ resources, scheduled and executed.
   * Long running CPU intensive workloads which can be better
     managed by the system scheduler.
 
+  **Note:** This flag will be removed in future and all the work
+  items that dosen't need to be bound to a specific CPU, should not
+  use this flags.
+
 ``WQ_FREEZABLE``
   A freezable wq participates in the freeze phase of the system
   suspend operations.  Work items on the wq are drained and no
-- 
2.49.0

