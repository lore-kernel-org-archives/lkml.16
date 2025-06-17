Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A0B1AAA1E
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 04:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750135346; cv=none; b=WGGpEklwDJeHFBsTKuMpZPC7hD4kdlTxETbCzCzJZi6hLtlnw7Y1YQXOWGXQ6kPDwO7beoo3nCubCmXyzs40OkGqsYQtxFuFg5iugaWsJKSgn1ZakNl98Os9tY8T8+P0kF/vCCCOXDGpi+/piqaO1jA+22YJtHsc6LkFPqstYTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750135346; c=relaxed/simple;
	bh=hr404kzPDe8Owm76VuP9q1oKcEakBCSKpUEsbbtUAn8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YVa55aq7Ti3phFSev62Jpi30W7++934CLk8VDASZotkcUMb8Pu0EGGciMEfgmoL3lgr+bIc1PipwLa/tDCSjhhZAmYAEIMD4oCw0Z/lgfRxXSLZcTLko/u82vbzpGF3owXlG/Sz3QYe8Xv6j+47SLO1gVybCwJ2h0zf7Z1RLXyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=AYSyfp/R; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="AYSyfp/R"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7406c6dd2b1so5495267b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 21:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1750135344; x=1750740144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y2rbp/xHpsECuajCieUCZ6YFdAuutZzHczcuCt91Or8=;
        b=AYSyfp/RdUGx1nadeaGN4w8ndbhSc02UhQEnBzEevze1dNnS0uU6sZKvdjE99KnvBq
         457UtQcxDtib+RsMWqBV8t1eF3VfEIHfSAMi/VHQTPpdy1EUc+7xxt5n1fffgtr94IY+
         DRVO/udNjr104Z0ZTqoEnE5yX6gNArpd/b5FGJCpd5Hf8rh4b4cdivVDjYbIbgUuVKvq
         yy4iLhcrsT+++UpHnKr2ejLunvpOgSO9pJKQ4fq9qsnrGbeusfjtTAi9wyI8qM/MJy7n
         t/eG73HqPAqbDGQ/HIQXcnPFlQ9x4QKwEvgg/oAZoOZRSRb0KowKE9HBtcjvPME7B3Sk
         xL2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750135344; x=1750740144;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y2rbp/xHpsECuajCieUCZ6YFdAuutZzHczcuCt91Or8=;
        b=MAeBvrgjmWSP4LavGgxNJXGeVKfmEv1ChwbTbQi1ongENW6XgPK03gIBAisU2iDSky
         61JLvHASJtqZRqXKEtEUAooqAMkov+qEaLUnC/HTDCJO3XjxqucFKQkKxqDkcqPtwnTo
         bHGsKiko7AKjnlm48upnxYIle01QrcCf5GQ9ov66oSONVu6lj7O+iBI/jsl5O6nTewWP
         yezTq4muW+v2cSWd09daC3rShCJ7uP6cZMjjMQEtgKpAOSgMPWDv9alWZdzO+zjQC0pb
         HcXMhJSPaApB1j8cjMQukjAVUHPoOcJV+kqV6/YDI43xwWpQsUfYTC1LZvVBoNgaHCqk
         9fKw==
X-Gm-Message-State: AOJu0Yw0H3ThmQZj6Ll8iW3os+eRjzuuEC4Amaow/eR4sc8V1lIA2Auw
	UMj4pHOrxQ7bGSVKrmCLWoNDR3auGcKldVe382t24ZkS5BVhJyoDCNp35wv3Bp/RwFw=
X-Gm-Gg: ASbGnctgh9X01UrDkXCvPlY5sji5LP0R8AbZhfiaCJYH1GwGHv29kvdCgyLryuWHygH
	3eDNxN68Or1FVc5fSLT6JdCTlQhFsk7QJXwbZbB1eIPZBv/f0xuEGc/4eNBXXwZ9gVFnnXrpQo2
	GOas3vDfiYX7pXCe26VaCqVvhESkSwpJqZPDS6o1RnWXENi/pp9BN30wuGuF7Sqh+OVBiOSxz6m
	JQZ2Ump3f9iSONa2DDX/gupJca62WUC7bSsP0V7spw4astvxdqO5yaYpdeenCYXk4iZhtzYucTz
	suSRuC08ghxtZzlnBwnVDhhA2lIPqziA2OHZ5S8Tb1uLlcmA9BqHpwbFNWFrbQCVhas7Anl0lNm
	tVo0fY+duIG4Mw4Q=
X-Google-Smtp-Source: AGHT+IE9cLKrNS3kafE0yZUFrEdzhnD1JZ1UZvN2mpdr+EofQ/bhI+kucIugajtIHGhPTwqolykcDw==
X-Received: by 2002:a05:6a20:9f8b:b0:21f:7497:9f93 with SMTP id adf61e73a8af0-21fbc62cc1cmr20849001637.4.1750135343760;
        Mon, 16 Jun 2025 21:42:23 -0700 (PDT)
Received: from n37-019-243.byted.org ([115.190.40.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7488ffee587sm8081477b3a.16.2025.06.16.21.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 21:42:23 -0700 (PDT)
From: Chuyi Zhou <zhouchuyi@bytedance.com>
To: longman@redhat.com,
	tj@kernel.org,
	jiangshanlai@gmail.com
Cc: linux-kernel@vger.kernel.org,
	Chuyi Zhou <zhouchuyi@bytedance.com>
Subject: [PATCH] workqueue: Initialize wq_isolated_cpumask in workqueue_init_early()
Date: Tue, 17 Jun 2025 12:42:16 +0800
Message-Id: <20250617044216.1401878-1-zhouchuyi@bytedance.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now when isolcpus is enabled via the cmdline, wq_isolated_cpumask does
not include these isolated CPUs, even wq_unbound_cpumask has already
excluded them. It is only when we successfully configure an isolate cpuset
partition that wq_isolated_cpumask gets overwritten by
workqueue_unbound_exclude_cpumask(), including both the cmdline-specified
isolated CPUs and the isolated CPUs within the cpuset partitions.

Fix this issue by initializing wq_isolated_cpumask properly in
workqueue_init_early().

Fixes: fe28f631fa94 ("workqueue: Add workqueue_unbound_exclude_cpumask() to exclude CPUs from wq_unbound_cpumask")
Signed-off-by: Chuyi Zhou <zhouchuyi@bytedance.com>
---
 kernel/workqueue.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 97f37b5bae669..9f91480758288 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -7767,7 +7767,8 @@ void __init workqueue_init_early(void)
 		restrict_unbound_cpumask("workqueue.unbound_cpus", &wq_cmdline_cpumask);
 
 	cpumask_copy(wq_requested_unbound_cpumask, wq_unbound_cpumask);
-
+	cpumask_andnot(wq_isolated_cpumask, cpu_possible_mask,
+						housekeeping_cpumask(HK_TYPE_DOMAIN));
 	pwq_cache = KMEM_CACHE(pool_workqueue, SLAB_PANIC);
 
 	unbound_wq_update_pwq_attrs_buf = alloc_workqueue_attrs();
-- 
2.20.1

