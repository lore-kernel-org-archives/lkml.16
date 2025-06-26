Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCFE2EFDA5
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 19:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750967821; cv=none; b=mmSES21jzflS5JOdjZzrKkXn0myjlqN5NxCowNMalcC4C9HioyrfgDjhbpD0g2DiYX5zrqHEmT5PR7fX9k5KwAf0somCUGoYXAoruonDBTowE3craR7+Qs0CLNsoc+gDRqbaFwIyE4s1/1+4A3joMSOr4VZnSHk9ELMvX54sFDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750967821; c=relaxed/simple;
	bh=jiUU/CO/dIeSSSoaGHlhX1BWyie8LcKytE6z9fFLDBo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i/5w7d/61gU3zOQ+dTKuTTXamshiGOpmbq7znA9j5oXCz/nbn2xj83QlWBboR7ls0GghietCnaDTfgxp5cLBXvjtHP+EN1PWN2ulFq/doJA0ONdGAs+fGBoQne54+md1fkE/z9EAlzuMPxroXqV8B//na/joURomM6IUK3gQEks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aujfukfF; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aujfukfF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750967819; x=1782503819;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jiUU/CO/dIeSSSoaGHlhX1BWyie8LcKytE6z9fFLDBo=;
  b=aujfukfFRlBOiWcy289i1GD2OCam5RyScPuzQLSOcwIbM392i8ycgTqr
   gm1DeJuV3kHnqr4kSWkN0yV7CrAnYPqHrUaLvZS6R7DbbkCBovaZ2JqKU
   vgbN0Tcshf5GWfgVO0WrWbS1TZtkg6q6wCn/Q3JEdFtb2nYEYtiZttTOS
   D+BWKWlhEvbd3EvXQCkhxrDAa1TxBCUgYHM28GZj0t1taA1DbZUOuKnbT
   9AqMPc8+Ea0//rIrLVaYR3vCw5JAXmnpbtcDa3uaqWgdTXEN7631L78A1
   joLEhUGVRQRDDWS2xELkSc4b0Jm3QnHpq5NB2PytbE6ZRu7IiLzikkRN7
   A==;
X-CSE-ConnectionGUID: epXjcKTZSkW1/Zc6+OYH6g==
X-CSE-MsgGUID: VINT20ZRRN+f6f9tgOfrpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53002132"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="53002132"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 12:56:58 -0700
X-CSE-ConnectionGUID: ONNkOTygRrupnby8dcXAPw==
X-CSE-MsgGUID: fpGKqIczRa2jTf8sqdmkbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="156902899"
Received: from kanliang-dev.jf.intel.com ([10.165.154.102])
  by fmviesa005.fm.intel.com with ESMTP; 26 Jun 2025 12:56:57 -0700
From: kan.liang@linux.intel.com
To: peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	tglx@linutronix.de,
	dave.hansen@linux.intel.com,
	irogers@google.com,
	adrian.hunter@intel.com,
	jolsa@kernel.org,
	alexander.shishkin@linux.intel.com,
	linux-kernel@vger.kernel.org
Cc: dapeng1.mi@linux.intel.com,
	ak@linux.intel.com,
	zide.chen@intel.com,
	mark.rutland@arm.com,
	broonie@kernel.org,
	ravi.bangoria@amd.com,
	Kan Liang <kan.liang@linux.intel.com>
Subject: [RFC PATCH V2 02/13] perf/x86: Setup the regs data
Date: Thu, 26 Jun 2025 12:55:59 -0700
Message-Id: <20250626195610.405379-3-kan.liang@linux.intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20250626195610.405379-1-kan.liang@linux.intel.com>
References: <20250626195610.405379-1-kan.liang@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kan Liang <kan.liang@linux.intel.com>

The current code relies on the generic code to setup the regs data.
It will not work well when there are more regs introduced.
Introduce a X86-specific x86_pmu_setup_regs_data().
Now, it's the same as the generic code. More X86-specific codes will be
added later when the new regs.

Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
---
 arch/x86/events/core.c       | 32 ++++++++++++++++++++++++++++++++
 arch/x86/events/intel/ds.c   |  4 +++-
 arch/x86/events/perf_event.h |  4 ++++
 3 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index 64a7a8aa2e38..c601ad761534 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -1685,6 +1685,38 @@ static void x86_pmu_del(struct perf_event *event, int flags)
 	static_call_cond(x86_pmu_del)(event);
 }
 
+void x86_pmu_setup_regs_data(struct perf_event *event,
+			     struct perf_sample_data *data,
+			     struct pt_regs *regs)
+{
+	u64 sample_type = event->attr.sample_type;
+
+	if (sample_type & PERF_SAMPLE_REGS_USER) {
+		if (user_mode(regs)) {
+			data->regs_user.abi = perf_reg_abi(current);
+			data->regs_user.regs = regs;
+		} else if (!(current->flags & PF_KTHREAD)) {
+			perf_get_regs_user(&data->regs_user, regs);
+		} else {
+			data->regs_user.abi = PERF_SAMPLE_REGS_ABI_NONE;
+			data->regs_user.regs = NULL;
+		}
+		data->dyn_size += sizeof(u64);
+		if (data->regs_user.regs)
+			data->dyn_size += hweight64(event->attr.sample_regs_user) * sizeof(u64);
+		data->sample_flags |= PERF_SAMPLE_REGS_USER;
+	}
+
+	if (sample_type & PERF_SAMPLE_REGS_INTR) {
+		data->regs_intr.regs = regs;
+		data->regs_intr.abi = perf_reg_abi(current);
+		data->dyn_size += sizeof(u64);
+		if (data->regs_intr.regs)
+			data->dyn_size += hweight64(event->attr.sample_regs_intr) * sizeof(u64);
+		data->sample_flags |= PERF_SAMPLE_REGS_INTR;
+	}
+}
+
 int x86_pmu_handle_irq(struct pt_regs *regs)
 {
 	struct perf_sample_data data;
diff --git a/arch/x86/events/intel/ds.c b/arch/x86/events/intel/ds.c
index c0b7ac1c7594..e67d8a03ddfe 100644
--- a/arch/x86/events/intel/ds.c
+++ b/arch/x86/events/intel/ds.c
@@ -2126,8 +2126,10 @@ static void setup_pebs_adaptive_sample_data(struct perf_event *event,
 			regs->flags &= ~PERF_EFLAGS_EXACT;
 		}
 
-		if (sample_type & (PERF_SAMPLE_REGS_INTR | PERF_SAMPLE_REGS_USER))
+		if (sample_type & (PERF_SAMPLE_REGS_INTR | PERF_SAMPLE_REGS_USER)) {
 			adaptive_pebs_save_regs(regs, gprs);
+			x86_pmu_setup_regs_data(event, data, regs);
+		}
 	}
 
 	if (format_group & PEBS_DATACFG_MEMINFO) {
diff --git a/arch/x86/events/perf_event.h b/arch/x86/events/perf_event.h
index 2b969386dcdd..12682a059608 100644
--- a/arch/x86/events/perf_event.h
+++ b/arch/x86/events/perf_event.h
@@ -1278,6 +1278,10 @@ void x86_pmu_enable_event(struct perf_event *event);
 
 int x86_pmu_handle_irq(struct pt_regs *regs);
 
+void x86_pmu_setup_regs_data(struct perf_event *event,
+			     struct perf_sample_data *data,
+			     struct pt_regs *regs);
+
 void x86_pmu_show_pmu_cap(struct pmu *pmu);
 
 static inline int x86_pmu_num_counters(struct pmu *pmu)
-- 
2.38.1

