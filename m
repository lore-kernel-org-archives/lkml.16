Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C87AE20E703;
	Tue,  1 Apr 2025 18:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743530852; cv=none; b=gAHdwqpm0xdbbHW8jo+yDk2EsOatwAZQ0setT0S7e2C6JlHEo1sVU6eEmLjFvO3gzvBqK4T0F8pEswJUI6kh6/Q0DXLj1ABx3xmp+VaivbRadK+my1864ftzSK7ZIYt18z+QQiIDg/cfdOeu2c7Y7L4gNKK5OfNWVde3f2Iw/xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743530852; c=relaxed/simple;
	bh=TXxMNAnXlc8yDC90Wg8saX7ywbgOuUDpvHHIJU0/IH0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZPokWxSTZ633VBOy57V8RrzUNEKw3TaYYwRh6wECgtm/kNaXWyC3aQcKG8CBqk/gdkZFNmC8si6fTWEc2zuEpFoJssq5Gk4bOZpiDlCHbXhdhtda86FhyPFEqp3WAR0MlQUH6oQeO8JXD9PPq/DvIW5amn8GJ+OcLjjCafnI3vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 63BD914BF;
	Tue,  1 Apr 2025 11:07:33 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 86A073F59E;
	Tue,  1 Apr 2025 11:07:28 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v4 7/7] Documentation: coresight: Document AUX pause and resume
Date: Tue,  1 Apr 2025 19:07:08 +0100
Message-Id: <20250401180708.385396-8-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250401180708.385396-1-leo.yan@arm.com>
References: <20250401180708.385396-1-leo.yan@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds description for AUX pause and resume.  It gives introduction
for what's AUX pause and resume and records usage examples.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 Documentation/trace/coresight/coresight-perf.rst | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/Documentation/trace/coresight/coresight-perf.rst b/Documentation/trace/coresight/coresight-perf.rst
index d087aae7d492..30be89320621 100644
--- a/Documentation/trace/coresight/coresight-perf.rst
+++ b/Documentation/trace/coresight/coresight-perf.rst
@@ -78,6 +78,37 @@ enabled like::
 
 Please refer to the kernel configuration help for more information.
 
+Fine-grained tracing with AUX pause and resume
+----------------------------------------------
+
+Arm CoreSight may generate a large amount of hardware trace data, which
+will lead to overhead in recording and distract users when reviewing
+profiling result. To mitigate the issue of excessive trace data, Perf
+provides AUX pause and resume functionality for fine-grained tracing.
+
+The AUX pause and resume can be triggered by associated events. These
+events can be ftrace tracepoints (including static and dynamic
+tracepoints) or PMU events (e.g. CPU PMU cycle event). To create a perf
+session with AUX pause / resume, three configuration terms are
+introduced:
+
+- "aux-action=start-paused": it is specified for the cs_etm PMU event to
+  launch in a paused state.
+- "aux-action=pause": an associated event is specified with this term
+  to pause AUX trace.
+- "aux-action=resume": an associated event is specified with this term
+  to resume AUX trace.
+
+Example for triggering AUX pause and resume with ftrace tracepoints::
+
+  perf record -e cs_etm/aux-action=start-paused/k,syscalls:sys_enter_openat/aux-action=resume/,syscalls:sys_exit_openat/aux-action=pause/ ls
+
+Example for triggering AUX pause and resume with PMU event::
+
+  perf record -a -e cs_etm/aux-action=start-paused/k \
+        -e cycles/aux-action=pause,period=10000000/ \
+        -e cycles/aux-action=resume,period=1050000/ -- sleep 1
+
 Perf test - Verify kernel and userspace perf CoreSight work
 -----------------------------------------------------------
 
-- 
2.34.1

