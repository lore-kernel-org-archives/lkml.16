Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EAC7258CE5
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 09:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744277098; cv=none; b=Hg/0n/1TMTyyL9Vnfvyy6YUfHugXUTRutbH1TGai2uHsm+9izj4e2KiRaArD2UaRlVwru8ZYQlxc7pfxi8XVcQewALcIScBBHWssUirh/gP3NRkqybbzHoJ3PVDAIPrzQO/u1isC6Ww61j6SUEri4pPQsKSDDhEkj5H7HkXHbPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744277098; c=relaxed/simple;
	bh=sRgGEEUvN7WDn/uIL41kT3ggZ+XEuuqACqV8BYZ001U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t/p6+dC6ytk2cLcX+0XTbjZf1DPxl+sn23HkHI+DxCW3+lsECTnTG8WEfz55xiN5x90dPoxZC56y60xG/Xtq8i8FzFb9gE7l/4yfJLlX2U89/Di/+YciIBEdzxw3YG/DNFcXoOrtVEkGy+4OW1acI+9j1dCqKd2GOgL7UOpOcH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LUDB+o5S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LUDB+o5S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7E63C4CEE3;
	Thu, 10 Apr 2025 09:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744277097;
	bh=sRgGEEUvN7WDn/uIL41kT3ggZ+XEuuqACqV8BYZ001U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LUDB+o5S34YvwaLF9uRuzsFRTkiwhxrIuuGAGvyBb7gtv3bfckx2kI+nESQZTngGu
	 J1+huw2I4Fzuge2W+Pou8I5UwdHVxlSoij2uRD91jt4F819T9zAWVnfVfre+/shGkk
	 k4lr30gaq3uDJyMh5INSQfEYZ8ICMOzOa40CEGcDVVij2c/le85Kq3laAt9CPC0pvP
	 VNF0Ibylt5tmhdOBOIu4hqz2BQk4gkyZ15OsUGegdyWTscrj5yb+J/Q2/lPwaQA8nx
	 VA41jEeyrVddAE7JKvc+jkX20ne7JQIWHMJpByE6nMAYjXSOS1bZpeL8RALv7K1h8F
	 ssIXEIx4ZjNWQ==
From: alexs@kernel.org
To: 
Cc: linux-kernel@vger.kernel.org,
	Alex Shi <alexs@kernel.org>,
	Valentin Schneider <vschneid@redhat.com>,
	Ben Segall <bsegall@google.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>
Subject: [PATCH 4/4] sched/isolation: don't alloc twice for housekeeping.cpumasks
Date: Thu, 10 Apr 2025 17:24:19 +0800
Message-ID: <20250410092423.9831-4-alexs@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250410092423.9831-1-alexs@kernel.org>
References: <20250410092423.9831-1-alexs@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alex Shi <alexs@kernel.org>

The variable housekeeping.cpumasks[type] will be alloced twice if
nohz_full and isolcpus are both setup in cmdline, that shouldn't to do
so. Just alloc once is enough and save a bit memory.

Signed-off-by: Alex Shi <alexs@kernel.org>
Cc: Valentin Schneider <vschneid@redhat.com>
Cc: Ben Segall <bsegall@google.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Juri Lelli <juri.lelli@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>
---
 kernel/sched/isolation.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
index e93776740725..44ab46b31f6b 100644
--- a/kernel/sched/isolation.c
+++ b/kernel/sched/isolation.c
@@ -103,10 +103,10 @@ void __init housekeeping_init(void)
 static void __init housekeeping_setup_type(enum hk_type type,
 					   cpumask_var_t housekeeping_staging)
 {
+	if (cpumask_empty(housekeeping.cpumasks[type]))
+		alloc_bootmem_cpumask_var(&housekeeping.cpumasks[type]);
 
-	alloc_bootmem_cpumask_var(&housekeeping.cpumasks[type]);
-	cpumask_copy(housekeeping.cpumasks[type],
-		     housekeeping_staging);
+	cpumask_copy(housekeeping.cpumasks[type], housekeeping_staging);
 }
 
 static int __init housekeeping_setup(char *str, unsigned long flags)
-- 
2.47.1

