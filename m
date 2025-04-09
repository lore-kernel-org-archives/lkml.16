Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F28525EFBB
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 12:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744200526; cv=none; b=U0bFJUbGbebfUsnODyRCucBvSJmGfgWYw6uKt2BjTd7AjUB12y24wgGOAXEp2Y0v8Lra3hFgYxoK8exAqOYMLzb7W+429c+efAuRcseO/WspxV+Jw8+QdNxBE/jDeEc0V7iL7PesUE+KKpdkBCZih8icKJ1t5+/FgQ41MzYW0Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744200526; c=relaxed/simple;
	bh=VHD94vTP3h36PXRN9S/T2DGKvXNCp6OibQRG2wjgNhM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QXBCheol6YgkOBtlsPG2aDL7e2jc3xDrd+9apFxaV07nZ7LnUhMZ0LoL+gIVk3F8eplyr8iCCbgmL+gtkFO5GVY1Euy4vWgJn3BBOCQwzzzspPsgI+pRiPM7r11aFPD5iOoNpGHIdw7QPZodV09VcDPk9tvljwkRxEuHL6xODpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=exVHbkSb; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="exVHbkSb"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-224019ad9edso85667595ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 05:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1744200524; x=1744805324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PbSUkVrVD3xkDETpxNaGhOsnTSGzGK+aEYnf85XWEQg=;
        b=exVHbkSb3WUVLSDC9QJHaaeBvZRgn2HWoflZNTwCc7ZQomeZ05KB9Mvs3ORWcd5A3d
         wrLaOTdQIpWtZC0ZqjshVpbbImRL1oBlHyzeHdwZEB8Q1qMsxjB2RJaecy6a2zbQVb8e
         2E80U1/FoPCbahf4SAy5HTXXSARcX/BZkPXSTXSUETaX7gmRSeCFv95S4tVoG1DyC6Xw
         XBW6mg+Ppjt+gc+3FYpc/AgPxtYvcjygSwrzF8GCEkGFJpENjCoGCaRavb2syV2zsVId
         v5/XB2evxykSJpUagjkrdtg95OagWNQKsxUjP+DwvotXobMJiwExkUNSMI2xfiXmweAL
         hSVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744200524; x=1744805324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PbSUkVrVD3xkDETpxNaGhOsnTSGzGK+aEYnf85XWEQg=;
        b=BTvd2CzrzXWYtmACOKLRhme2mjfCOZelOmvRU8VozyVw8AzN8snwyui66kPEcBiS24
         BX7LjfVjQDvJqmti4nTK5EPR7suEOlmQBly4NlQ6LIP9eli9/Y02o4DYDvHOx7bt8V3d
         tAUqx5TchpEbulCZ/F36RlKK7uh51ieYerhj/ge95ra1yZ2s/fvL9ntOEWm+z300hrf8
         /yc/KC1GuzzD/eNvx3NKJXtYCy2JfGftToA6Bw43RPiV8YqyS2Pz9zARfAvYUdQE2Q0L
         k5LTkiF1f7jN2X1KAAt9yTGxjTSDwsnNrljU/NHqDbCeh08RW2xfP25SYMfjOmpqM32Q
         ujcA==
X-Gm-Message-State: AOJu0YxrX9x7DxxhTLZydfNDEz3IomAPqHspEZQJgHGfstrihMhNtKY0
	IePAAVKoVsDVQAKt7qDtyc3kmQH991bafT/ZrMOyHDXCxufqoQi9RgpqvMXJxg==
X-Gm-Gg: ASbGnctWpbsu/QfMnqs6a/7+W5DnSGkBNJZ/nk9HVC3wRPxhNQUZk1VgMPsRrf3471h
	R+Sy3SKOHf4GOV+oJmkuHifkjS5X2ipr/giSNbbKzunfYdf+oOCi4nmJG0Dve4LewkMNaDvtJ9G
	oi06nukfSYzXLfTnpix8OC8hfm2dyVH6ukAt33+yXHzyIoBRWec+7miZIx6h4jZ3v613R/1YvPA
	9ymbBSv1d7uEGZaT+swM6u9Vj9W5qXM/J71ulIY1SkQ49XKud8IfXPDdM3YxY81vSY07GXK73DD
	VFWkGJK7y6dFeFp1e1S5LpYwSsgXZOvFuNiueRxNj6bGsQ4vKkeET0+F
X-Google-Smtp-Source: AGHT+IFGi48zBlxcV6VWNk6dcWklyh3y8HBTbpxff65QH9XfTXe4esKetVuI3F8se06ilEs9xXpCaA==
X-Received: by 2002:a17:903:1905:b0:223:6744:bfb9 with SMTP id d9443c01a7336-22ac2a20495mr50055855ad.41.1744200524548;
        Wed, 09 Apr 2025 05:08:44 -0700 (PDT)
Received: from n37-107-136.byted.org ([115.190.40.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b8c62dsm10017875ad.95.2025.04.09.05.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 05:08:44 -0700 (PDT)
From: Aaron Lu <ziqianlu@bytedance.com>
To: Valentin Schneider <vschneid@redhat.com>,
	Ben Segall <bsegall@google.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Don <joshdon@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Xi Wang <xii@google.com>
Cc: linux-kernel@vger.kernel.org,
	Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mel Gorman <mgorman@suse.de>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Chuyi Zhou <zhouchuyi@bytedance.com>,
	Jan Kiszka <jan.kiszka@siemens.com>
Subject: [RFC PATCH v2 6/7] sched/fair: fix h_nr_runnable accounting with per-task throttle
Date: Wed,  9 Apr 2025 20:07:45 +0800
Message-Id: <20250409120746.635476-7-ziqianlu@bytedance.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250409120746.635476-1-ziqianlu@bytedance.com>
References: <20250409120746.635476-1-ziqianlu@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Task based throttle does not adjust cfs_rq's h_nr_runnable on throttle
anymore but relies on standard en/dequeue_entity(), so there is no need
to take special care of h_nr_runnable in delayed dequeue operations.

Signed-off-by: Aaron Lu <ziqianlu@bytedance.com>
---
 kernel/sched/fair.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index ff4252995d677..20471a3aa35e6 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -5406,8 +5406,6 @@ static void set_delayed(struct sched_entity *se)
 		struct cfs_rq *cfs_rq = cfs_rq_of(se);
 
 		cfs_rq->h_nr_runnable--;
-		if (cfs_rq_throttled(cfs_rq))
-			break;
 	}
 }
 
@@ -5428,8 +5426,6 @@ static void clear_delayed(struct sched_entity *se)
 		struct cfs_rq *cfs_rq = cfs_rq_of(se);
 
 		cfs_rq->h_nr_runnable++;
-		if (cfs_rq_throttled(cfs_rq))
-			break;
 	}
 }
 
-- 
2.39.5

