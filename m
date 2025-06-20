Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23C12E54CF
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 15:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750433012; cv=none; b=gikun+fVh2oiFMo2RGRLSiDosVaCGvNVeJifswmVcdNF9nF+TJeTnZDfEOTwNXMfPgaGQ70Um0Y11q3O6UNZKjcuWKSOxznHlRSGVjfZ6+A9eEV7F+flvh+kH0f5xqrC8ErTh3M4AnEyuR5vBrofQTsEyXauc1HEiJTZDWYlVbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750433012; c=relaxed/simple;
	bh=5ZDs0SoJ8yatsvNiDpfTaIQZ7Et15dC+wW8JUAJyaC4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oIU+o20tlQMWcUfduFDbbKNvHPqMv7fsYPGepT5gpAEadIee805vofv7/W3fzlrgtDIizL4V/1voCboVvakOJTOl/qgSGbv5/X+lxcTzhInfXUtcAviX0p+DGXX4sgLp1QySVlColEBsoHYnHwaUsBBiQRWeint8ZUz9rp0Jq9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N0GoWGit; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N0GoWGit"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D8A3C4CEF1;
	Fri, 20 Jun 2025 15:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750433012;
	bh=5ZDs0SoJ8yatsvNiDpfTaIQZ7Et15dC+wW8JUAJyaC4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N0GoWGitkAAPEFD4VB5WV0lsjJeMMqPW/RjtPbDmKWgyegn813ztRSTvejygMwPe+
	 KngmwpDKwqSpbfjIrvCAc45lgKRgkrdqvaoBqgbO0GT6zY5oS9p/VZmpZe2CPVSHl5
	 N7iv8Ke1n7/qP4Vg56o0C/5E6EVGmPIQwZJKE0ssVJyBeEHXvjd82QZUy8Jkm1zfid
	 +pnMSNJ/3noGsHybSfuXSHN3WW3tIIBolDNQ9f5CY5PBKtLZbuYC0HpIi2hVHU81Z9
	 wX0FI4cfDMgGL8Z1/8I0KBgvuL7n5VjBePTEpi4jRBhdiB8LnB53fCYteEM5ei8bH+
	 5H28P9i3kAEJA==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Tejun Heo <tj@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>,
	Waiman Long <longman@redhat.com>
Subject: [PATCH 07/27] sched/isolation: Save boot defined domain flags
Date: Fri, 20 Jun 2025 17:22:48 +0200
Message-ID: <20250620152308.27492-8-frederic@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250620152308.27492-1-frederic@kernel.org>
References: <20250620152308.27492-1-frederic@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HK_TYPE_DOMAIN will soon integrate not only boot defined isolcpus= CPUs
but also cpuset isolated partitions.

Housekeeping still needs a way to record what was initially passed
to isolcpus= in order to keep these CPUs isolated after a cpuset
isolated partition is modified or destroyed while containing some of
them.

Create a new HK_TYPE_DOMAIN_BOOT to keep track of those.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 include/linux/sched/isolation.h | 1 +
 kernel/sched/isolation.c        | 5 +++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/linux/sched/isolation.h b/include/linux/sched/isolation.h
index 8de4f625a5c1..731506d312d2 100644
--- a/include/linux/sched/isolation.h
+++ b/include/linux/sched/isolation.h
@@ -7,6 +7,7 @@
 #include <linux/tick.h>
 
 enum hk_type {
+	HK_TYPE_DOMAIN_BOOT,
 	HK_TYPE_DOMAIN,
 	HK_TYPE_MANAGED_IRQ,
 	HK_TYPE_KERNEL_NOISE,
diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
index 8c02eeccea3b..9ecf53c5328b 100644
--- a/kernel/sched/isolation.c
+++ b/kernel/sched/isolation.c
@@ -9,6 +9,7 @@
  */
 
 enum hk_flags {
+	HK_FLAG_DOMAIN_BOOT	= BIT(HK_TYPE_DOMAIN_BOOT),
 	HK_FLAG_DOMAIN		= BIT(HK_TYPE_DOMAIN),
 	HK_FLAG_MANAGED_IRQ	= BIT(HK_TYPE_MANAGED_IRQ),
 	HK_FLAG_KERNEL_NOISE	= BIT(HK_TYPE_KERNEL_NOISE),
@@ -214,7 +215,7 @@ static int __init housekeeping_isolcpus_setup(char *str)
 
 		if (!strncmp(str, "domain,", 7)) {
 			str += 7;
-			flags |= HK_FLAG_DOMAIN;
+			flags |= HK_FLAG_DOMAIN | HK_FLAG_DOMAIN_BOOT;
 			continue;
 		}
 
@@ -244,7 +245,7 @@ static int __init housekeeping_isolcpus_setup(char *str)
 
 	/* Default behaviour for isolcpus without flags */
 	if (!flags)
-		flags |= HK_FLAG_DOMAIN;
+		flags |= HK_FLAG_DOMAIN | HK_FLAG_DOMAIN_BOOT;
 
 	return housekeeping_setup(str, flags);
 }
-- 
2.48.1

