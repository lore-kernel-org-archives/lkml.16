Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12102741C2
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 05:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744694308; cv=none; b=TTKEcavA74RvTM5GgjKtlNkzudFgp1lMKWX7T2Jilyawu1DOubYh9bpouAX5PxpW1tRAuv9Jeg69ORxjLtl9Uyn1YMs+2XGIN0sOTwGBd1WpNu8m+FsSev5q3xusbn0ebKgXu0Yqpg4aQnijJ2wwQq5h5GNhAr7Po9Q4a57FwFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744694308; c=relaxed/simple;
	bh=TzFuC9zTtfYZrrp+cUV0md+A75jRyy6klYJ2kVhLEuw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iMXumCD4u1U3VvxZegCVNOu01UWX4Ilv8+r0OphaAzmLpeuu7aBuCISppd3JsQWq1K5J6Nceck8rikHSvvCw+ROheufb1ZhY8klxYX8e2+vWvAhe76YbGEWy8UFrDSIa7ly4hFrkE7DRFvPvTcPlONdL5HwFuKv+6/E/Ki5S68E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FKZFHfEC; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FKZFHfEC"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2279915e06eso54223975ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 22:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744694306; x=1745299106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vI76QAcxqNzjywFLS0qo0pBVDITySnFHR3quT+EiiHU=;
        b=FKZFHfECHIeF5+75frfFzDMRTiVSxa3PT/g7Sf9OCGH3S5EJPFgms5SxnAORs1NtR1
         Fi5zQbYTCJSUvuJXC2vYietrnHssrnwpv9d48/h/7uiPXLWP8nVVkXd2gopNhbYDuAm2
         WM4q1GcYXuRd/fJOrQZHqBUNVfCAQuDT4vjBCvjcs4N8XVVruMGHe2r81ST2f7zqzIu3
         lep5sWNBAfBDokRY4M7Qt+MK1oVE3wKHI8VC/71XPcV+t1N8426yVvKubabBxSMwSGzY
         SxJ1nFFPdazC3I+rNjIfos+ZaM48w92Sq4x/LdHxGtDtrrz17P4SQbJK6DTzR4hjcxX2
         asvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744694306; x=1745299106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vI76QAcxqNzjywFLS0qo0pBVDITySnFHR3quT+EiiHU=;
        b=eHCdjaLJJolrCMxQfuySSg56gBBxikX/yw7FJtiKgMneM9zNNJAj4N1NjwNHBQl5wQ
         gY2+kod9AgluiNiNmNJgOTEakifK3Zfma46M9d4F1JtuvwuDi4MXOEiKMNfZD0cnYnTx
         Uh2RIF2hep8zzLb4PcvTArYEXRLM/8jAVA2ikciC8Ihfg6kRVCCYocR6MIzk/33WpN4x
         NyoBddMoCnSbpXy2LgbhLCaSiJ1mAUuJt9HvyIjPCGSCpBl5AxYgFi2sTkWNdd1/tYNM
         GayZ5L9/R01dXcF9zjXkjHB/da2+ed+K3k6psmoLxHiXEn3Z8ffaOP+ps0liFmb/FJRg
         P8Xg==
X-Gm-Message-State: AOJu0YymL8gJo1Lq/r9onkB3k1Gk+SaaeX3qQBL7rIR0bJWP5z24DtK8
	zzBIxpbexSxt2bZbcVXL239l9CfNV9LGu/4EIwBEFoIhs0vuevSw
X-Gm-Gg: ASbGncsr/nkB3xML6VO8vT1hE/ni0YIzJn0xFmT3p2KV2UB11PkkvYNSaaHN9BDY8A+
	6fVZI1mHJcc+HYf/t01r36atlL9EE15OMu8WpQjvsiO0+xkuOaiDBC8yg6vV6r++UCplKBzFhjy
	DFI6VIEAz40cz+m742CKmL1LMXP7kp0evSbz6BXYvvm7sPk0HHyNf2sR3XwjCttA4ZLTwAMK2yG
	EBlabKj/7/+1P5soCe8WZOxXv81S5jvEVpVMRNTxF2ZjgTkCdhJtvyGWK1Hr7jfa0JsbwEW0R/r
	HNx7g9ytpudNzNqIwbR/Gj83aqotxBpIuDz0QiJvvuc91WVKcX8=
X-Google-Smtp-Source: AGHT+IHmzWyny0cRPPo46EzSAicI+hvTsIHybybAfvZel9Sp0MwXpEYdkTjuqOPptMMvCHcUx+yUJA==
X-Received: by 2002:a17:902:d550:b0:224:194c:694c with SMTP id d9443c01a7336-22bea4bf56cmr240245735ad.28.1744694306193;
        Mon, 14 Apr 2025 22:18:26 -0700 (PDT)
Received: from cs20-buildserver.lan ([2402:7500:400:be8d:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306df4011e6sm12127760a91.44.2025.04.14.22.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 22:18:25 -0700 (PDT)
From: Stanley Chu <stanley.chuys@gmail.com>
X-Google-Original-From: Stanley Chu <yschu@nuvoton.com>
To: frank.li@nxp.com,
	miquel.raynal@bootlin.com,
	alexandre.belloni@bootlin.com,
	linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	tomer.maimon@nuvoton.com,
	kwliu@nuvoton.com,
	yschu@nuvoton.com
Subject: [PATCH v1 2/2] i3c: master: svc: Emit STOP asap in the IBI transaction
Date: Tue, 15 Apr 2025 13:18:08 +0800
Message-Id: <20250415051808.88091-3-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250415051808.88091-1-yschu@nuvoton.com>
References: <20250415051808.88091-1-yschu@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stanley Chu <yschu@nuvoton.com>

Queuing the IBI request does not need to be done earlier than emitting
the STOP. Emitting STOP immediately after receiving the IBI request can
complete the IBI transaction earlier and return the bus to idle.

Signed-off-by: Stanley Chu <yschu@nuvoton.com>
---
 drivers/i3c/master/svc-i3c-master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index 7ceaf3ec45bb..9b23239ad8db 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -577,11 +577,11 @@ static void svc_i3c_master_ibi_isr(struct svc_i3c_master *master)
 	/* Handle the non critical tasks */
 	switch (ibitype) {
 	case SVC_I3C_MSTATUS_IBITYPE_IBI:
+		svc_i3c_master_emit_stop(master);
 		if (dev) {
 			i3c_master_queue_ibi(dev, master->ibi.tbq_slot);
 			master->ibi.tbq_slot = NULL;
 		}
-		svc_i3c_master_emit_stop(master);
 		break;
 	case SVC_I3C_MSTATUS_IBITYPE_HOT_JOIN:
 		svc_i3c_master_emit_stop(master);
-- 
2.34.1

