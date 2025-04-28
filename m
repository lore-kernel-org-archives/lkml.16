Received: from SHSQR01.spreadtrum.com (mx1.unisoc.com [222.66.158.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C91A1B423C
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 08:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=222.66.158.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745829419; cv=none; b=JK+8a9NnI09sjUsFdjvI/wjgjXz13523lGnL58dzUwS6GVLjtL6bHk35gp1masadEyaSMagahW3QGSX88nmSokFxSFQXPG/bVdIfwN250iawSMeZ9dE0wu+5DFuxS/7mkL8H2sRPEjGHqULm2/QVwgoeifvyhHaLwEDcuUPHvko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745829419; c=relaxed/simple;
	bh=up4xmKeUHk6N6IzCRI9ReUFoCyUNJnulwdwYT17K3Ik=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hFbRyklChmks1hM8MPVirwVtH6yLPxwQ8Gw0fXNqTdxKpwHItXGL8AIulGy3AqYgelGKjGplYtmU+4hJ1Mbbdd3KReEe19JVjFJby3JyZ1zLlgMoEyARbmxWgPX8wrJD7dzBi4FgDEIEpd8O5He7V+vchfLQMISwzOUo39yZIsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=unisoc.com; spf=pass smtp.mailfrom=unisoc.com; arc=none smtp.client-ip=222.66.158.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=unisoc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=unisoc.com
Received: from dlp.unisoc.com ([10.29.3.86])
	by SHSQR01.spreadtrum.com with ESMTP id 53S8aWbM052103;
	Mon, 28 Apr 2025 16:36:32 +0800 (+08)
	(envelope-from baisheng.gao@unisoc.com)
Received: from SHDLP.spreadtrum.com (shmbx06.spreadtrum.com [10.0.1.11])
	by dlp.unisoc.com (SkyGuard) with ESMTPS id 4ZmGwF2kPfz2MDkkp;
	Mon, 28 Apr 2025 16:34:53 +0800 (CST)
Received: from BJ15137PCW.spreadtrum.com (10.0.73.32) by
 shmbx06.spreadtrum.com (10.0.1.11) with Microsoft SMTP Server (TLS) id
 15.0.1497.48; Mon, 28 Apr 2025 16:36:30 +0800
From: Baisheng Gao <baisheng.gao@unisoc.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim
	<namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander
 Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
        Adrian Hunter <adrian.hunter@intel.com>, <kan.liang@linux.intel.com>
CC: <linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <cixi.geng@linux.dev>, <hao_hao.wang@unisoc.com>,
        <zhaoyang.huang@unisoc.com>
Subject: [PATCH V2] perf/core: Fix a defect in perf_output_sample
Date: Mon, 28 Apr 2025 16:36:29 +0800
Message-ID: <20250428083629.88-1-baisheng.gao@unisoc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 shmbx06.spreadtrum.com (10.0.1.11)
X-MAIL:SHSQR01.spreadtrum.com 53S8aWbM052103

The defect exits in an exiting process which is interrupted by the
perf sample routine. The routine will collect the user stack if
being specified, whereas the user memory space possibly has been
unavailable, so a panic will happen.

In order to fix the issue, forbidding to copy the user stack of an
exiting process.

Stack dump:
 Internal error: synchronous external abort: ffffffff96000010 [#1]
  PREEMPT SMP
 CPU: 3 PID: 2651 Comm: binder:2649_1 Tainted: G        W  OE
  5.15.149-android13-8-00008-gbe074b05e5af-ab12096863 #1
 Hardware name: Spreadtrum UMS9230 1H10 SoC (DT)
 pstate: 204000c5 (nzCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
 pc : __arch_copy_from_user+0x180/0x218
 lr : arch_perf_out_copy_user+0xb0/0x17c
 sp : ffffffc00801baf0
 x29: ffffffc00801baf0 x28: ffffffc00801bbf8 x27: ffffffc00801bbe8
 x26: 0000000000000000 x25: 0000000000001000 x24: 000000000000feb8
 x23: 00000000000005f0 x22: ffffff80613c8000 x21: ffffff8143102a10
 x20: 0000007c239643c0 x19: 00000000000005f0 x18: ffffffc00801d058
 x17: ffffffc16e677000 x16: ffffffc008018000 x15: 0000007c239643c0
 x14: 0000000000000002 x13: 0000000000000003 x12: ffffffc008000000
 x11: ffffff8000090000 x10: ffffffc008090000 x9 : 0000007fffffffff
 x8 : 0000007c239643c0 x7 : 000000000000feb8 x6 : ffffff8143102a10
 x5 : ffffff8143103000 x4 : 0000000000000000 x3 : ffffff8093cad140
 x2 : 0000000000000570 x1 : 0000007c239643c0 x0 : ffffff8143102a10
 Call trace:
  __arch_copy_from_user+0x180/0x218
  perf_output_sample+0x14e4/0x1904
  perf_event_output_forward+0x90/0x130
  __perf_event_overflow+0xc8/0x17c
  perf_swevent_hrtimer+0x124/0x290
  __run_hrtimer+0x134/0x4a0
  hrtimer_interrupt+0x2e4/0x560
  arch_timer_handler_phys+0x5c/0xa0
  handle_percpu_devid_irq+0xc0/0x374
  handle_domain_irq+0xd8/0x160
  gic_handle_irq.34215+0x58/0x26c
  call_on_irq_stack+0x3c/0x70
  do_interrupt_handler+0x44/0xa0
  el1_interrupt+0x34/0x64
  el1h_64_irq_handler+0x1c/0x2c
  el1h_64_irq+0x7c/0x80
  release_pages+0xac/0x9b4
  tlb_finish_mmu+0xb0/0x238
  exit_mmap+0x1b8/0x538
  __mmput+0x40/0x274
  mmput+0x40/0x134
  exit_mm+0x3bc/0x72c
  do_exit+0x294/0x1160
  do_group_exit+0xc8/0x174
  get_signal+0x830/0x95c
  do_signal+0x9c/0x2a8
  do_notify_resume+0x98/0x1ac
  el0_svc+0x5c/0x84
  el0t_64_sync_handler+0x88/0xec
  el0t_64_sync+0x1b8/0x1bc

Signed-off-by: Baisheng Gao <baisheng.gao@unisoc.com>
---
 kernel/events/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index e93c19565914..9c9b571b812d 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -7867,7 +7867,8 @@ void perf_output_sample(struct perf_output_handle *handle,
 		}
 	}
 
-	if (sample_type & PERF_SAMPLE_STACK_USER) {
+	if (sample_type & PERF_SAMPLE_STACK_USER &&
+			!(current->flags & PF_EXITING)) {
 		perf_output_sample_ustack(handle,
 					  data->stack_user_size,
 					  data->regs_user.regs);
-- 
2.34.1

