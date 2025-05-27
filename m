Received: from jpms-ob01.noc.sony.co.jp (jpms-ob01.noc.sony.co.jp [211.125.140.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB2027991C;
	Tue, 27 May 2025 14:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.125.140.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748357772; cv=none; b=D6SS+mAOWCoCvs7m+CDpl1WpLu/LTmlXaxoui/RVf0S9aCVtwzBlgDcu+PHm7u1cP5/z/jdoZ1XAocHnfuR2T7DC+7ddPuX+ybJL+Cn6aeORju3kLCpbvz1EJ7RrKz/ePMvtOw2J4RBOT/s4n5dL6NLsh0FfZ+dQJT2t5qBxLMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748357772; c=relaxed/simple;
	bh=3Wt+EHWz5IG03k3cQmX9fUctjhkN2uTFxGyrUjfglPI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bDYterhHnE4cjNptvlqLaINmWt0SDxwoAUfHgkk/BzwCzSZwa54HcZgm6EEfM7GG2YVIWVOkBg4jDdOz8AbjUURopUomzhcrb7DX2p+rqSsWfA+Ai5nY7Y7czhHwBBrEX2rwl3FXT0Br2DKq9tlSVeGy4MaR7DHmP/9aW+NJ92c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=ZZEvRtkU; arc=none smtp.client-ip=211.125.140.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="ZZEvRtkU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=sony.com; s=s1jp; t=1748357770; x=1779893770;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=b06uT2xm22NJ6tJenPUmaXQ8h1Dezkkzes2Hwvoxh0A=;
  b=ZZEvRtkUIYETsefS4UnwoWpfTZowc++jpTqh2K3hHq8/tefKx/tP/hOW
   RcwJ8c2zPjQl3qt6xfaE1iFbI5VlcGParLY/zFednQm/DARmn33rW7eWB
   xnaUDpwq1cZTJBqRdrTLdrLUUW20l6q/VugczEAA3lvfDFlPnZF0nMDeN
   qzxMkWHddlaK+xXRQrR08EL4niDNJ3EyDOAahxxlU1YTc8derCrTZOCo2
   8Etaxr6JxijBsfWciRM13cUpRFyoMYmp2olrVFQsXt/HEzX4kxgCJkA2H
   qOhk2rUxvX8dyjsJTV63y0skHisyDIWe4OLJgsuExD6GBjSIN2F1L+Xoz
   g==;
Received: from unknown (HELO jpmta-ob02.noc.sony.co.jp) ([IPv6:2001:cf8:0:6e7::7])
  by jpms-ob01.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 23:56:03 +0900
X-IronPort-AV: E=Sophos;i="6.15,318,1739804400"; 
   d="scan'208";a="534627493"
Received: from unknown (HELO [127.0.1.1]) ([IPv6:2001:cf8:1:573:0:dddd:6b3e:119e])
  by jpmta-ob02.noc.sony.co.jp with ESMTP; 27 May 2025 23:56:03 +0900
From: Shashank Balaji <shashank.mahadasyam@sony.com>
Date: Tue, 27 May 2025 23:55:58 +0900
Subject: [PATCH v2 2/2] sched_deadline, docs: add affinity setting with
 cgroup2 cpuset controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-sched-deadline-cpu-affinity-v2-2-b8b40a4feefa@sony.com>
References: <20250527-sched-deadline-cpu-affinity-v2-0-b8b40a4feefa@sony.com>
In-Reply-To: <20250527-sched-deadline-cpu-affinity-v2-0-b8b40a4feefa@sony.com>
To: Jonathan Corbet <corbet@lwn.net>, Juri Lelli <juri.lelli@redhat.com>, 
 Peter Zijlstra <peterz@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Shinya Takumi <shinya.takumi@sony.com>, 
 Shashank Balaji <shashank.mahadasyam@sony.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2769;
 i=shashank.mahadasyam@sony.com; h=from:subject:message-id;
 bh=3Wt+EHWz5IG03k3cQmX9fUctjhkN2uTFxGyrUjfglPI=;
 b=owGbwMvMwCV2mPH4Ij++H1mMp9WSGDJMLzXLXLSbeX/yv1VxzudeZZ5fz1aiWOtY0HX7YPDlH
 j3mMNP/HaUsDGJcDLJiiizvZNZdOGhl2fT1OMM3mDmsTCBDGLg4BWAi744x/K8QqBaJequ3U56H
 sSzeaGZK1Qz5hhNeLwQ/O6dc9Cz3m8nI8GbjO3c3q69sqdOcVh0PVw9ZZ9Ey519v8aYftywXTFt
 qzQYA
X-Developer-Key: i=shashank.mahadasyam@sony.com; a=openpgp;
 fpr=EE1CAED0C13A3982F5C700F6C301C7A24E0EF86A

Setting the cpu affinity mask of a SCHED_DEADLINE process using the cgroup v1
cpuset controller is already detailed. Add similar information for cgroup v2's
cpuset controller.

Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>
---
 Documentation/scheduler/sched-deadline.rst | 29 +++++++++++++++++++++++------
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/Documentation/scheduler/sched-deadline.rst b/Documentation/scheduler/sched-deadline.rst
index b7aa96b0a02576311ce8fafc51b8b6949760927a..ec543a12f848e9d7215cc72c6068cf7b6b925dd8 100644
--- a/Documentation/scheduler/sched-deadline.rst
+++ b/Documentation/scheduler/sched-deadline.rst
@@ -20,7 +20,8 @@ Deadline Task Scheduling
       4.3 Default behavior
       4.4 Behavior of sched_yield()
     5. Tasks CPU affinity
-      5.1 SCHED_DEADLINE and cpusets HOWTO
+      5.1 Using cgroup v1 cpuset controller
+      5.2 Using cgroup v2 cpuset controller
     6. Future plans
     A. Test suite
     B. Minimal main()
@@ -671,12 +672,15 @@ Deadline Task Scheduling
 5. Tasks CPU affinity
 =====================
 
- -deadline tasks cannot have an affinity mask smaller that the entire
- root_domain they are created on. However, affinities can be specified
- through the cpuset facility (Documentation/admin-guide/cgroup-v1/cpusets.rst).
+ Deadline tasks cannot have a cpu affinity mask smaller than the root domain they
+ are created on. So, using ``sched_setaffinity(2)`` won't work. Instead, the
+ the deadline task should be created in a restricted root domain. This can be
+ done using the cpuset controller of either cgroup v1 (deprecated) or cgroup v2.
+ See :ref:`Documentation/admin-guide/cgroup-v1/cpusets.rst <cpusets>` and
+ :ref:`Documentation/admin-guide/cgroup-v2.rst <cgroup-v2>` for more information.
 
-5.1 SCHED_DEADLINE and cpusets HOWTO
-------------------------------------
+5.1 Using cgroup v1 cpuset controller
+-------------------------------------
 
  An example of a simple configuration (pin a -deadline task to CPU0) follows::
 
@@ -693,6 +697,19 @@ Deadline Task Scheduling
    echo $$ > cpu0/tasks
    chrt --sched-runtime 100000 --sched-period 200000 --deadline 0 yes > /dev/null
 
+5.2 Using cgroup v2 cpuset controller
+-------------------------------------
+
+ Assuming the cgroup v2 root is mounted at ``/sys/fs/cgroup``.
+
+   cd /sys/fs/cgroup
+   echo '+cpuset' > cgroup.subtree_control
+   mkdir deadline_group
+   echo 0 > deadline_group/cpuset.cpus
+   echo 'root' > deadline_group/cpuset.cpus.partition
+   echo $$ > deadline_group/cgroup.procs
+   chrt --sched-runtime 100000 --sched-period 200000 --deadline 0 yes > /dev/null
+
 6. Future plans
 ===============
 

-- 
2.43.0

