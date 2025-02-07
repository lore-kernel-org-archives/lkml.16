Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5271417AE1D
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 03:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738898059; cv=none; b=uglGvGISBIu8rjgiaMItF10cNtEMC+CPi3Qu/+liKJE8XeEMYNKLWH/vuYYWl6QW1L2uvuSNyKDkbfti6whOPKnbc98ULu8vNAv8E2ogeGAWeZ80m52atS3vAxMn7wCNpcSMecm5FOG0PH93MeBEfWdX0pRTTF6lzaBrmuugP5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738898059; c=relaxed/simple;
	bh=PNzDsfeijeX0pwcQrXxAbqck9LLmdaMAxHm8ASHiEu0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UtOtJkYUzbY7728aoDS1Eibzeiza/Tcf/kkeBtqpHmT3zh1s6tUpIkEK8kubrNPHcXgR/3Wu5/14ie4vaJqVpjT7YnbNVqe4oNyJFdihNOys2I0gl5q02iQRGNi+JTKt/2H4ErR1PzfVAsClpBcpXlvfyfZk5d+nFzK3ZatbAjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=UI/VrQZG; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="UI/VrQZG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=QQvtVw+9grQyes+NSrofVuvHU9QmOMCgSpiNXKMLte8=; b=UI/VrQZG1zbnbFr+BERhenX5dV
	j4iILVKIHvfw+196iYcvOc456zOCii2KkLjwRXf9b3POZhyN41DX0+rM35X3G/a+dpUoJgw7TN1En
	AzU8W+P9kwAAG4y27Pf0NhByWgbhxlKB5rgbOXEmOl9EvJrDuPZvbJLVLPttH60895RUUNCERQ3/Q
	93OS5h1/WsJDSaV7ulCPMHgzBg8of39vb4Socgaelu2dlXx1OYwp5s8V7XCiTnqhSIiKtKDKQscgv
	rE/VcXLkyW15jpGX0bSgUeaRcypn688Mzx1V1VwbEkJB9vssKwtuxD2Qcaqg/W57yGH4b5pKgSBQc
	nYPrxnsA==;
Received: from [58.29.143.236] (helo=localhost)
	by fanzine2.igalia.com with utf8esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1tgEoc-005Yd1-A7; Fri, 07 Feb 2025 04:14:08 +0100
From: Changwoo Min <changwoo@igalia.com>
To: tj@kernel.org,
	void@manifault.com,
	arighi@nvidia.com
Cc: kernel-dev@igalia.com,
	linux-kernel@vger.kernel.org,
	Changwoo Min <changwoo@igalia.com>
Subject: [PATCH 2/2] sched_ext: Print an event, SCX_EV_ENQ_SLICE_DFL, in scx_qmap/central
Date: Fri,  7 Feb 2025 12:13:38 +0900
Message-ID: <20250207031338.393045-3-changwoo@igalia.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250207031338.393045-1-changwoo@igalia.com>
References: <20250207031338.393045-1-changwoo@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Modify the scx_qmap and scx_celtral schedulers
to print the SCX_EV_ENQ_SLICE_DFL event every second.

Signed-off-by: Changwoo Min <changwoo@igalia.com>
---
 tools/sched_ext/scx_central.bpf.c | 2 ++
 tools/sched_ext/scx_qmap.bpf.c    | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/tools/sched_ext/scx_central.bpf.c b/tools/sched_ext/scx_central.bpf.c
index 376c14d5dd0d..907a844723c1 100644
--- a/tools/sched_ext/scx_central.bpf.c
+++ b/tools/sched_ext/scx_central.bpf.c
@@ -305,6 +305,8 @@ static int central_timerfn(void *map, int *key, struct bpf_timer *timer)
 			   scx_read_event(&events, SCX_EV_DISPATCH_KEEP_LAST));
 		bpf_printk("%35s: %llu\n", "SCX_EV_ENQ_SKIP_EXITING",
 			   scx_read_event(&events, SCX_EV_ENQ_SKIP_EXITING));
+		bpf_printk("%35s: %llu\n", "SCX_EV_ENQ_SLICE_DFL",
+			   scx_read_event(&events, SCX_EV_ENQ_SLICE_DFL));
 		bpf_printk("%35s: %llu\n", "SCX_EV_BYPASS_DURATION",
 			   scx_read_event(&events, SCX_EV_BYPASS_DURATION));
 		bpf_printk("%35s: %llu\n", "SCX_EV_BYPASS_DISPATCH",
diff --git a/tools/sched_ext/scx_qmap.bpf.c b/tools/sched_ext/scx_qmap.bpf.c
index 5edb79742e37..7d9d1e5d2358 100644
--- a/tools/sched_ext/scx_qmap.bpf.c
+++ b/tools/sched_ext/scx_qmap.bpf.c
@@ -784,6 +784,8 @@ static int monitor_timerfn(void *map, int *key, struct bpf_timer *timer)
 		   scx_read_event(&events, SCX_EV_DISPATCH_KEEP_LAST));
 	bpf_printk("%35s: %llu\n", "SCX_EV_ENQ_SKIP_EXITING",
 		   scx_read_event(&events, SCX_EV_ENQ_SKIP_EXITING));
+	bpf_printk("%35s: %llu\n", "SCX_EV_ENQ_SLICE_DFL",
+		   scx_read_event(&events, SCX_EV_ENQ_SLICE_DFL));
 	bpf_printk("%35s: %llu\n", "SCX_EV_BYPASS_DURATION",
 		   scx_read_event(&events, SCX_EV_BYPASS_DURATION));
 	bpf_printk("%35s: %llu\n", "SCX_EV_BYPASS_DISPATCH",
-- 
2.48.1

