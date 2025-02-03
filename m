Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97FA1FAC3D
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 09:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738576622; cv=none; b=lI7xlUw7F6AmUMTjDeHMG1c5Srn6AC7xitqPfMg+1gV9FKHXEttWlxN+vPr6xERQ/cL0lhOetKtmkDiIULPnNP5HbJ7nqlOJqxeKHQMMoZaOuows/q3jp8EN1hnUEMX6KY7OPvBSYiEe/PCVkJYDIYYUj9x+xJgZDsmfef3/RAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738576622; c=relaxed/simple;
	bh=P6ZIjOcrVGSddzFqkeN9Se9GTO1nq5yLuU1kZ4p08iM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=I4vJVFASjXcywDyJ6ORsGZc9Px2ZxYeP7g+LM6Uf+IBKR0j4PABWaY74gjTPlFbA6msTXdx2o8H/N5Wt6OLuN38Mf/8uGa1ExoPrIBIjStpUxLv8abRR0wa2wH9a+q4uoStTx4XHhIHZ3VPraaa6qPnu+akv4uxCqkV6UKctKiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--keyz.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=F+KMRBdI; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--keyz.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="F+KMRBdI"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6f27dd44f86so45186167b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 01:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738576620; x=1739181420; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2Dv5Ac6SPOdtGgS0tmgxnxoVXUMjLjqcjHEmAbg0F2U=;
        b=F+KMRBdI48ZkM0Dy7obIzY0L73/vD/h9yeGChz3IX/QgNaMC8lIjba7R6t5uuvj5OB
         ZYYTaMNOv90ghPTkeHuLp0503WGmMAsugmA/aI7xVIR1BG8TP2ZF5MUJkhrM9NbQqdGj
         rhuZtXkw4382EHZAD3bmB7VNSawDHTwfmpc8j9lPOY+hxxCFHhl2q8OlYLq5W0cTgfdt
         oz+h1MggL8QgDY0kmMlINiyA76PoF0iNfC4O2MTtbxU1zcOnL6QxZSRFwZ+Fm344j51k
         IWQTs1WdcmVmW9Ir5jKRsg9ELYhstS+JHATXZR+LrVwem2UrDJaXi/d+Gmcmp6vkP/qn
         EQEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738576620; x=1739181420;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2Dv5Ac6SPOdtGgS0tmgxnxoVXUMjLjqcjHEmAbg0F2U=;
        b=CUp3pH6F9V8Bim7Lha3WanH81CQ/Z+Wm+U4Lv84bbOBSpdJxguNrxAv4j7BYOShJcd
         PR6cFetpVmrQjpIYG37n2HLhiO027bPrPB2dlmJdo1fqo2pCQ9x+01Oww8cBe0xP/sbf
         FKDTookXRm/aSB/w37y0FsCCHQ7dAWCDlJ06xXFaJqSGlV2a+7biEvtZCYVmLLpTMv4X
         QgIXTdOAA4kmHSowyjj9t9J973QejoY3J49MCllVo37JNLBs8mLX3bIQlB4l3/0BsK90
         MBA35jH04VCbdXZr3a9VhtIKXsoLMgTT9v9qTYyU6YJRMFclEOaa6/1TYfgjsydN6HE5
         UHDA==
X-Gm-Message-State: AOJu0YzQ4faNl5os3Tk7f0wix4pIhmRPNXIaDYVwnL+W0HsIKRv6QaQN
	zpJyPyuADZhEq2FlU7Wr4rxPkQxZW7ddf1JsmPdUJBB8W/sJyHye/ipAPxO0n6Pm0xVEFHnLGDn
	rf/QAXUSR/+4Rgijy1qciojEe79rR+/jhaR6y2W4LJmvLT0M15IPsN1UfFQl1NoIoY72g8HWkV9
	0gYjRc43Wp50kEtUs9cUixYa/GPM1z1A==
X-Google-Smtp-Source: AGHT+IECB4t9+nxA9LWLIFfRwRwZsyYuUUH4xiSxgCR5XbY+fu38QoXLmO5+/gf/KeL9xbqGeB9WRgfz
X-Received: from ywbhl13.prod.google.com ([2002:a05:690c:620d:b0:6f5:278e:e957])
 (user=keyz job=prod-delivery.src-stubby-dispatcher) by 2002:a05:690c:74ca:b0:6ef:81c0:5b56
 with SMTP id 00721157ae682-6f7a8355a9amr168753257b3.14.1738576619752; Mon, 03
 Feb 2025 01:56:59 -0800 (PST)
Date: Mon,  3 Feb 2025 17:56:53 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250203095653.4085118-1-keyz@google.com>
Subject: [PATCH v5] cpuidle: psci: Add trace for PSCI domain idle
From: Keita Morisaki <keyz@google.com>
To: linux-kernel@vger.kernel.org, lpieralisi@kernel.org, sudeep.holla@arm.com, 
	rafael@kernel.org, daniel.lezcano@linaro.org, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Cc: rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-trace-kernel@vger.kernel.org, aarontian@google.com, 
	yimingtseng@google.com, Keita Morisaki <keyz@google.com>, Dhruva Gole <d-gole@ti.com>, 
	Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="UTF-8"

The trace event cpu_idle provides insufficient information for debugging
PSCI requests due to lacking access to determined PSCI domain idle
states. The cpu_idle usually only shows -1, 0, or 1 regardless how many
idle states the power domain has.

Add new trace events namely psci_domain_idle_enter and
psci_domain_idle_exit to trace enter and exit events with a determined
idle state.

These new trace events will help developers debug CPUidle issues on ARM
systems using PSCI by providing more detailed information about the
requested idle states.

Signed-off-by: Keita Morisaki <keyz@google.com>
Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>
Reviewed-by: Dhruva Gole <d-gole@ti.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>
---
v1->v2: Split the ftrace event into two (psci_domain_idle_(enter|exit))
        and rephrase the commit message accordingly. Rebased onto the latest.
v2->v3: Add "Reviewed-by: Steven Rostedt"
v3->v4: Add the Tested-by label
v4->v5: Add "Reviewed-by: Dhruva Gole"

Hopefully this patch gets attention from maintainers of
drivers/cpuidle/cpuidle-psci.c too.

 drivers/cpuidle/cpuidle-psci.c |  3 +++
 include/trace/events/power.h   | 37 ++++++++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/drivers/cpuidle/cpuidle-psci.c b/drivers/cpuidle/cpuidle-psci.c
index 2562dc001fc1..dd8d776d6e39 100644
--- a/drivers/cpuidle/cpuidle-psci.c
+++ b/drivers/cpuidle/cpuidle-psci.c
@@ -25,6 +25,7 @@
 #include <linux/syscore_ops.h>

 #include <asm/cpuidle.h>
+#include <trace/events/power.h>

 #include "cpuidle-psci.h"
 #include "dt_idle_states.h"
@@ -74,7 +75,9 @@ static __cpuidle int __psci_enter_domain_idle_state(struct cpuidle_device *dev,
 	if (!state)
 		state = states[idx];

+	trace_psci_domain_idle_enter(dev->cpu, state, s2idle);
 	ret = psci_cpu_suspend_enter(state) ? -1 : idx;
+	trace_psci_domain_idle_exit(dev->cpu, state, s2idle);

 	if (s2idle)
 		dev_pm_genpd_resume(pd_dev);
diff --git a/include/trace/events/power.h b/include/trace/events/power.h
index d2349b6b531a..9253e83b9bb4 100644
--- a/include/trace/events/power.h
+++ b/include/trace/events/power.h
@@ -62,6 +62,43 @@ TRACE_EVENT(cpu_idle_miss,
 		(unsigned long)__entry->state, (__entry->below)?"below":"above")
 );

+DECLARE_EVENT_CLASS(psci_domain_idle,
+
+	TP_PROTO(unsigned int cpu_id, unsigned int state, bool s2idle),
+
+	TP_ARGS(cpu_id, state, s2idle),
+
+	TP_STRUCT__entry(
+		__field(u32,		cpu_id)
+		__field(u32,		state)
+		__field(bool,		s2idle)
+	),
+
+	TP_fast_assign(
+		__entry->cpu_id = cpu_id;
+		__entry->state = state;
+		__entry->s2idle = s2idle;
+	),
+
+	TP_printk("cpu_id=%lu state=0x%lx is_s2idle=%s",
+		  (unsigned long)__entry->cpu_id, (unsigned long)__entry->state,
+		  (__entry->s2idle)?"yes":"no")
+);
+
+DEFINE_EVENT(psci_domain_idle, psci_domain_idle_enter,
+
+	TP_PROTO(unsigned int cpu_id, unsigned int state, bool s2idle),
+
+	TP_ARGS(cpu_id, state, s2idle)
+);
+
+DEFINE_EVENT(psci_domain_idle, psci_domain_idle_exit,
+
+	TP_PROTO(unsigned int cpu_id, unsigned int state, bool s2idle),
+
+	TP_ARGS(cpu_id, state, s2idle)
+);
+
 TRACE_EVENT(powernv_throttle,

 	TP_PROTO(int chip_id, const char *reason, int pmax),

base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
--
2.48.1.362.g079036d154-goog
