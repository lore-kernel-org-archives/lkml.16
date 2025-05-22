Received: from jpms-ob01.noc.sony.co.jp (jpms-ob01.noc.sony.co.jp [211.125.140.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A217724E4C6;
	Thu, 22 May 2025 08:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.125.140.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747901196; cv=none; b=vFf9FQUaQfR0mxHDx5r/qkMKkJf/9+o7tUUG/0uzGG5YrGWTkP8LBzuMKubHGs6JCJHty68vx83gy5cwC8GZOm2nJ3tWqJOcjjSNIN5rtXKATYybg8naG+qFGID9c9bwDJGdyclTYcIptCqk4UWHj+7olNzUEzNmw6JIc6FAbeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747901196; c=relaxed/simple;
	bh=YoACCie3gGAm+FPq0sD/zcFtsFfRUyGwmwo4/zS2RYs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=LZl71/9QF3n43gEwD5jhHCwz5bbaINZyh0iQ4zHoreJBxcEHwNrKeKfY2y2uxAblMP7e3nu4WbPC3VvnkPnWbgAqJm1ryvbfXaLFVnRf3cwD77xnxHjZABA0FpZOKj3nW8DOB7El3K4IvP9vTN5Zl6x1juXq9TyK4+scberfR7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=E+o+9RRx; arc=none smtp.client-ip=211.125.140.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="E+o+9RRx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=sony.com; s=s1jp; t=1747901194; x=1779437194;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=XQ7y1p1sktW4J1b/tJO6yePn+6OExQlZCyQglgca6iM=;
  b=E+o+9RRxiRK+W5iP4rbMjaQ3l9WomnjU5bKBJ16G+crs3EUq3D8jHEv2
   ZBT4ra1wL2/6sdQqNRJANrzkbv79BBt12HRt9Oe2MpzjFAAoLlggyaRwg
   GLHLGwWInF3MUdGy8vHMERCu3cUqp2qJoompJEh5GrNsxES8Gt4+3RQUf
   Yo9YrgGZgkUEatcXDLDxfFCrAS8cBSVnMk74cKYgRuUGLLMlAUzkmy7Tw
   9VlxwAoZOKVKrhny8ze6wbp/0xk9Z7XbIeBYTlsM7apjZI1UnxY+CFihv
   c/ROf6xl9OMOdN8fjLRvWOMQkO19sB+mmDFBLJdR2Or9GDVzOyhc12vEx
   A==;
Received: from unknown (HELO jpmta-ob1.noc.sony.co.jp) ([IPv6:2001:cf8:0:6e7::6])
  by jpms-ob01.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 17:06:32 +0900
X-IronPort-AV: E=Sophos;i="6.15,305,1739804400"; 
   d="scan'208";a="562594537"
Received: from unknown (HELO [127.0.1.1]) ([IPv6:2001:cf8:1:573:0:dddd:6b3e:119e])
  by jpmta-ob1.noc.sony.co.jp with ESMTP; 22 May 2025 17:06:32 +0900
From: Shashank Balaji <shashank.mahadasyam@sony.com>
Date: Thu, 22 May 2025 17:06:28 +0900
Subject: [PATCH] sched_deadline, docs: add affinity setting with cgroup2
 cpuset controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-sched-deadline-cpu-affinity-v1-1-2172c683acac@sony.com>
X-B4-Tracking: v=1; b=H4sIAAPbLmgC/x3MMQqEMBAF0KvI1DuQDVroVWSLmPnRAYmS6KKId
 zdYvuZdlJEUmbrqooS/Zl1iwfdTkZ9cHMEqxWSNbUxjLWc/QVjgZNYI9uvOLgSNup08mKGGBCP
 iWyrDmhD0ePf+d98PSCkz1m0AAAA=
X-Change-ID: 20250522-sched-deadline-cpu-affinity-b0b4edf0ddc9
To: Jonathan Corbet <corbet@lwn.net>, Juri Lelli <juri.lelli@redhat.com>, 
 Peter Zijlstra <peterz@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Shinya Takumi <shinya.takumi@sony.com>, 
 Shashank Balaji <shashank.mahadasyam@sony.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2938;
 i=shashank.mahadasyam@sony.com; h=from:subject:message-id;
 bh=YoACCie3gGAm+FPq0sD/zcFtsFfRUyGwmwo4/zS2RYs=;
 b=owGbwMvMwCV2mPH4Ij++H1mMp9WSGDL0brOrsVo8OGV+w+7gj7+T5ITZH3M/0uS2/ql733viv
 y+Lz79x7ihlYRDjYpAVU2R5J7PuwkEry6avxxm+wcxhZQIZwsDFKQATub6dkeGAfdgpxrVHWOsP
 rIpJYCvkDnPX+a979flXqxcnn2rJZWxg+F+w5/XVGRVPJn2ZNf9JveFF1ZNH2flqBS4s/360WWW
 rdQMLAA==
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
index a727827b8dd52710f880c2b92d3a8224c259873c..e3d7968ff6c3c43f87e249dbcb309619dbd616bf 100644
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
 
  An example of a simple configuration (pin a -deadline task to CPU0)
  follows (rt-app is used to create a -deadline task)::
@@ -695,6 +699,19 @@ Deadline Task Scheduling
    rt-app -t 100000:10000:d:0 -D5 # it is now actually superfluous to specify
 				  # task affinity
 
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
+   rt-app -t 100000:10000:d:0 -D5
+
 6. Future plans
 ===============
 

---
base-commit: a5806cd506af5a7c19bcd596e4708b5c464bfd21
change-id: 20250522-sched-deadline-cpu-affinity-b0b4edf0ddc9

Best regards,
-- 
Shashank Balaji <shashank.mahadasyam@sony.com>

