Received: from jpms-ob01.noc.sony.co.jp (jpms-ob01.noc.sony.co.jp [211.125.140.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4321F2798EB;
	Tue, 27 May 2025 14:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.125.140.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748357771; cv=none; b=S2PesJdGnIO81QDTpbuB1V9PZzNUaYotqQmRXdbbwWDq9Yr4UwPQ28xZfLSlMwfGyxLvIGo9t6iMHKHoZhkuZBmfi9Mxu8+OYqlc8i5y2l10kcZwSBAAjMi6qaMwzRskmvrEoI/0Yv/Abp+r7d631wkjECcyJKdTCRso54ezGsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748357771; c=relaxed/simple;
	bh=t09Z5CcPNsYhzB2DxpAVxkfOFuQjUTPqnqfcV3KtAyE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q0voEIHeP6bTbyoE3ChQObEe96ekMYY3IribxBScaKBibXqKiXrl0NzypXDiprHl+Dlb2SwGwq7Jw1g2bUf8MTBIWmG8txP/ZmVnLLTWgXHRj1VvxQxaOYF/vqvOuW52Uw/9ne1Y4AXsKZVz6xf5k6sheEoUClnfj0ELyXpNYcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=JNq96kT7; arc=none smtp.client-ip=211.125.140.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="JNq96kT7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=sony.com; s=s1jp; t=1748357768; x=1779893768;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=1B77FQV8y43cy3gheZ3TuKMjJM1UlUmYPoM7OCb+594=;
  b=JNq96kT7Y4adU9zT9aFTe3t9a7NkeRvx+PVlBvROtEyZS8oHM1eYrEvh
   YG+BVkzSAW6JsAeyxqRnF4GB1Eeb7XsBF0MCkGkfcKcJIrqyaUgbQtyxf
   DHLfhm92JQywrTYl7MZHVyGQc6oRTyr93HG15bN+Jc3GJZwH88qsklcsT
   wAKz34nCHN55hQc+zQ/5TBDrCkb5p5lhO3W3LjqTU+qW1OJ+O3ZxcG1yc
   o++cpj6GjQMGbM1Edg+BVc3CnxaYv8vsGzoqM2hq9FUM5W8jhUsI8oeS6
   ehfi1hJ9BfgWHF5lu4vDSi9YAcmMUYrkZjPIyIu22ayfySqPqYN1XALb1
   g==;
Received: from unknown (HELO jpmta-ob02.noc.sony.co.jp) ([IPv6:2001:cf8:0:6e7::7])
  by jpms-ob01.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 23:56:03 +0900
X-IronPort-AV: E=Sophos;i="6.15,318,1739804400"; 
   d="scan'208";a="534627492"
Received: from unknown (HELO [127.0.1.1]) ([IPv6:2001:cf8:1:573:0:dddd:6b3e:119e])
  by jpmta-ob02.noc.sony.co.jp with ESMTP; 27 May 2025 23:56:03 +0900
From: Shashank Balaji <shashank.mahadasyam@sony.com>
Date: Tue, 27 May 2025 23:55:57 +0900
Subject: [PATCH v2 1/2] sched_deadline, docs: replace rt-app examples with
 chrt or use config.json
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-sched-deadline-cpu-affinity-v2-1-b8b40a4feefa@sony.com>
References: <20250527-sched-deadline-cpu-affinity-v2-0-b8b40a4feefa@sony.com>
In-Reply-To: <20250527-sched-deadline-cpu-affinity-v2-0-b8b40a4feefa@sony.com>
To: Jonathan Corbet <corbet@lwn.net>, Juri Lelli <juri.lelli@redhat.com>, 
 Peter Zijlstra <peterz@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Shinya Takumi <shinya.takumi@sony.com>, 
 Shashank Balaji <shashank.mahadasyam@sony.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3489;
 i=shashank.mahadasyam@sony.com; h=from:subject:message-id;
 bh=t09Z5CcPNsYhzB2DxpAVxkfOFuQjUTPqnqfcV3KtAyE=;
 b=owGbwMvMwCV2mPH4Ij++H1mMp9WSGDJMLzWVPhZfODVoq2Sz9uKiGI6Pr86znjZfm/LR1kawf
 AbXUtm5HaUsDGJcDLJiiizvZNZdOGhl2fT1OMM3mDmsTCBDGLg4BWAi568y/C+56FLPJR7Yf9K7
 maV/+wu59MmdBczfdjsvWn1R9sGrV42MDJNVsw13PmljnGw2dc2O4HX3d291k5HKkp1z4uXBR9G
 3gzkB
X-Developer-Key: i=shashank.mahadasyam@sony.com; a=openpgp;
 fpr=EE1CAED0C13A3982F5C700F6C301C7A24E0EF86A

rt-app no longer accepts command-line arguments. So, replace rt-app example
with chrt and use the JSON format in the other example instead of command-
line arguments.

Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>
---
 Documentation/scheduler/sched-deadline.rst | 48 +++++++++++++++++++-----------
 1 file changed, 30 insertions(+), 18 deletions(-)

diff --git a/Documentation/scheduler/sched-deadline.rst b/Documentation/scheduler/sched-deadline.rst
index a727827b8dd52710f880c2b92d3a8224c259873c..b7aa96b0a02576311ce8fafc51b8b6949760927a 100644
--- a/Documentation/scheduler/sched-deadline.rst
+++ b/Documentation/scheduler/sched-deadline.rst
@@ -678,8 +678,7 @@ Deadline Task Scheduling
 5.1 SCHED_DEADLINE and cpusets HOWTO
 ------------------------------------
 
- An example of a simple configuration (pin a -deadline task to CPU0)
- follows (rt-app is used to create a -deadline task)::
+ An example of a simple configuration (pin a -deadline task to CPU0) follows::
 
    mkdir /dev/cpuset
    mount -t cgroup -o cpuset cpuset /dev/cpuset
@@ -692,8 +691,7 @@ Deadline Task Scheduling
    echo 1 > cpu0/cpuset.cpu_exclusive
    echo 1 > cpu0/cpuset.mem_exclusive
    echo $$ > cpu0/tasks
-   rt-app -t 100000:10000:d:0 -D5 # it is now actually superfluous to specify
-				  # task affinity
+   chrt --sched-runtime 100000 --sched-period 200000 --deadline 0 yes > /dev/null
 
 6. Future plans
 ===============
@@ -731,24 +729,38 @@ Appendix A. Test suite
  behaves under such workloads. In this way, results are easily reproducible.
  rt-app is available at: https://github.com/scheduler-tools/rt-app.
 
- Thread parameters can be specified from the command line, with something like
- this::
+ rt-app does not accept command line arguments, and instead reads from a JSON
+ configuration file. Here is an example ``config.json``:
 
-  # rt-app -t 100000:10000:d -t 150000:20000:f:10 -D5
+ .. code-block:: json
 
- The above creates 2 threads. The first one, scheduled by SCHED_DEADLINE,
- executes for 10ms every 100ms. The second one, scheduled at SCHED_FIFO
- priority 10, executes for 20ms every 150ms. The test will run for a total
- of 5 seconds.
+  {
+    "tasks": {
+      "dl_task": {
+        "policy": "SCHED_DEADLINE",
+        "priority": 0,
+        "dl-runtime": 10000,
+        "dl-period": 100000,
+        "dl-deadline": 100000
+      },
+      "fifo_task": {
+        "policy": "SCHED_FIFO",
+        "priority": 10,
+        "runtime": 20000,
+        "sleep": 130000
+      }
+    },
+    "global": {
+      "duration": 5
+    }
+  }
 
- More interestingly, configurations can be described with a json file that
- can be passed as input to rt-app with something like this::
+ On running ``rt-app config.json``, it creates 2 threads. The first one,
+ scheduled by SCHED_DEADLINE, executes for 10ms every 100ms. The second one,
+ scheduled at SCHED_FIFO priority 10, executes for 20ms every 150ms. The test
+ will run for a total of 5 seconds.
 
-  # rt-app my_config.json
-
- The parameters that can be specified with the second method are a superset
- of the command line options. Please refer to rt-app documentation for more
- details (`<rt-app-sources>/doc/*.json`).
+ Please refer to the rt-app documentation for the JSON schema and more examples.
 
  The second testing application is done using chrt which has support
  for SCHED_DEADLINE.

-- 
2.43.0

