Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37A1149E17;
	Fri, 16 May 2025 16:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747411544; cv=none; b=FmXGe0hjrvD1YSjSR0NvidpG7nuxyNF8oy49seMjPZc4auMKw8/NEFEOHZCuyDVLdyaY4faPPDSH0crkbO1Fp752OnrFCp8k6jaxlfbQfPeR+Ew7j2gPpJfsaDLB4Ne9jcBZFAA/7zJHjU9owjWL13KdLD1Yix/eM0gUA/FEH1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747411544; c=relaxed/simple;
	bh=Oh4p2T4rJVRiwnDIB2UdYEBdLIkgjeM2RZkYzY86X8c=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=OcHdcmI6pBcL83rgoPiUr2KrMgiiGY7YS3OOisX4Xhs6z5OOjDdrVOHuIyoGTd7NeznAHj4Y3WVq3Nv2To3GLyFGeWoy1WWmGpIsog4KgXuMi+OkovjIVW75EHG82NDJcxQQoHiHz0RxTV1jjRGyD6dH6Gi9a0mW2gYMBWY234s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=fTQSutUL; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jF4/4po5; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fTQSutUL";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jF4/4po5"
Date: Fri, 16 May 2025 16:05:37 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747411539;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1FqTa/4PKJJzA5SWxU0ImVtUEK3atLiNtBrileBJpbI=;
	b=fTQSutULWgf0hTG5kqn6TPz8LtDocfEIvdJW6ybHh/TNvP3lGUWoLa16unNlDm1OmgAx2Z
	wyExeIWw5rEAg+MwJcdJ2srw8NHm4kG0joCsvI5bY3CRoBDC9/S9B/TO1R65uKB2mH+sUl
	lz1UlNfF8IJINfrrQbp3ddIsdJj+BrxPoaTwcwFMbdHkvxOwHUUsC4x8T9MV6L1F04pgPi
	EQdoySDgLSp/TI3f+8Rz4VhX1Cv8739bklNswAYhXhDhsh09jWV56YZ3y79ghl/gDx2GTa
	Sf8pGJjhORPPAgypr2PrjdI/zBF8cAOgJV19V92zEar6r6mF3kOLaiRXCVk/fg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747411539;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1FqTa/4PKJJzA5SWxU0ImVtUEK3atLiNtBrileBJpbI=;
	b=jF4/4po5CTcy/rpUirbP7N6YhlPy6kS+rISWXY1w1eKXUrBQ0TOJLYLCdgPjRk6dFaKIlg
	+IcyVPVF2UC0k/CA==
From: "tip-bot2 for Changbin Du" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: perf/core] perf/x86/intel/ds: Remove redundant assignments to
 sample.period
Cc: Changbin Du <changbin.du@huawei.com>, Ingo Molnar <mingo@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20250506094907.2724-1-changbin.du@huawei.com>
References: <20250506094907.2724-1-changbin.du@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <174741153788.406.17877575431461411128.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@linutronix.de> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The following commit has been merged into the perf/core branch of tip:

Commit-ID:     75a9001bab36f0456f6aae1ab0aa487db456464a
Gitweb:        https://git.kernel.org/tip/75a9001bab36f0456f6aae1ab0aa487db456464a
Author:        Changbin Du <changbin.du@huawei.com>
AuthorDate:    Tue, 06 May 2025 17:49:07 +08:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Fri, 16 May 2025 17:53:53 +02:00

perf/x86/intel/ds: Remove redundant assignments to sample.period

The perf_sample_data_init() has already set the period of sample, so no
need to do it again.

Signed-off-by: Changbin Du <changbin.du@huawei.com>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Link: https://lore.kernel.org/r/20250506094907.2724-1-changbin.du@huawei.com
---
 arch/x86/events/intel/ds.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/x86/events/intel/ds.c b/arch/x86/events/intel/ds.c
index 61ee698..319d0d4 100644
--- a/arch/x86/events/intel/ds.c
+++ b/arch/x86/events/intel/ds.c
@@ -1831,8 +1831,6 @@ static void setup_pebs_fixed_sample_data(struct perf_event *event,
 
 	perf_sample_data_init(data, 0, event->hw.last_period);
 
-	data->period = event->hw.last_period;
-
 	/*
 	 * Use latency for weight (only avail with PEBS-LL)
 	 */
@@ -2085,7 +2083,6 @@ static void setup_pebs_adaptive_sample_data(struct perf_event *event,
 	sample_type = event->attr.sample_type;
 	format_group = basic->format_group;
 	perf_sample_data_init(data, 0, event->hw.last_period);
-	data->period = event->hw.last_period;
 
 	setup_pebs_time(event, data, basic->tsc);
 
