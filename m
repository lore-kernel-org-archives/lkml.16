Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB06E21D3EE
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 21:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750281323; cv=none; b=O90LR8OuCpi48FWfZbuh3fx/3ZaSRGaMP+5pc4WMoUqKYBTrNWJEbSl56o0reyoEb5UITboo4RuaqetlMi8m3A9ZGWow49sLE6QQGK7XnvAFA6Crg4mfcNbO+cdPltQoLjqZiNdKvxrQqC/dBF6vJA2U5m+tQ1J6RZL3PC4v8fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750281323; c=relaxed/simple;
	bh=AGPmAlAQR0g0Mmcs/uRlA5H54exkEzkBJEzy8rKw04U=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Content-Type; b=IVM/Pfbengagq3keQc8xPMG+CArLezWq9lqYLqq1fziTGCHBSENPhKfCqDxl6cNx3NlnOEeiUmM3zd6CWbfopQ8PS9BIdNjoPMUIs1hhDgYbQMR7d0PxFjgP0c5n+7Mjn5LIfiY520qB6zA0kBnMjlwNaGH2nn8fvLrfSv0jftg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=abDxen4y; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="abDxen4y"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b2eb60594e8so86880a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 14:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750281321; x=1750886121; darn=vger.kernel.org;
        h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kugD/a6Oq01nl8GXZYoQNqMpzVqYE6IP/zMN/oH7VXg=;
        b=abDxen4y2dF9+RPkPxSjkmi4NZEnxIjmWg2sJO7As/wctNLexTqTm4WPYECqOJPY+E
         WmWyyDM8opUiLmvwQxJUhWSc8EByYhhHnu/nBE9VJF+DS8bilfMVvSVMEG8pNm5zuqXw
         DtFF6h9Zy+fHWMRMIMLRmO3xdAuBvUh90GCrLuTl3MiBZdjHoCpdxUnKXiy1esFK/J9u
         6d4/DGEEPRJB4QjfHCsssbZhHtzXxvHAhkV1mYHhHWUaqNCsTp2MXboaQlZrvxBqfu7G
         7kZlytJz32aTx8ooDOX4d/iUWzHmXDSuNezI4hVpZOmbxBKn+XP63rjlk93u6tu//AaN
         aDrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750281321; x=1750886121;
        h=to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kugD/a6Oq01nl8GXZYoQNqMpzVqYE6IP/zMN/oH7VXg=;
        b=G2OLE31XnngRkt23kySEEnupeINH9xjSR/JquGI7KZNEP1d9V9HzU6QCdj97eeC2ht
         A3YLVcBByis/dfgFNZIsRY5yy1YfDoBSJag2gH3L42/CZQDY/3Mw+q9/cuHZBdHAJAnc
         RtJftE08eMKM2g3eSLLwAQBpBH76Vah7UxHVLQlUHn6bY9UwruqsBE1cbrzIhQ47fVrp
         mKz+uaCWLtwyklCNg51g8rqrbMWPkjV+dQVO93VZ5Z/epo4XJctBCqUXVeJvr8D8u5Ao
         s6AjFqn3GjiVhcYq/UgnVFI5wpvJNerdcUaGMXk5qchNma5aBIqj7Cs9kAQbzRGa69ay
         USJA==
X-Forwarded-Encrypted: i=1; AJvYcCWq6fF+/LOD1HcDBR6bACq5ytoA0+/fM88ppIjAWSnekwXe/qpvgzDCIPcSnPt8s2mCbqHLMP7MX8oIG/I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ2qlKUWZQXsphd6j07JVQi8Ku4cIhonF3Kghwpob8tbqnCMjl
	QcVEJwTJYcaEuomB3WxslGCh8ogvFKYalwUWzoyOytJJMPTH5u4psEYzKp+5pqRmtldPdhwx9JQ
	rynn9uurQRw==
X-Google-Smtp-Source: AGHT+IHklB2h/YWXJUEjk47SGrDIP4HwXRROJ0w/r5CagrJNn+dueEakf3gzfgt+ISbJZxBPMjRlUdCylAf+
X-Received: from pge23.prod.google.com ([2002:a05:6a02:2d17:b0:b2f:5023:640d])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6300:6a0e:b0:220:bb2:6074
 with SMTP id adf61e73a8af0-2200bb2608fmr2512209637.11.1750281321071; Wed, 18
 Jun 2025 14:15:21 -0700 (PDT)
Date: Wed, 18 Jun 2025 14:15:13 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.rc2.701.gf1e915cc24-goog
Message-ID: <20250618211514.3084483-1-irogers@google.com>
Subject: [PATCH v1 1/2] perf test workload noploop: Name the noploop process
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Name the noploop process "perf-noploop" so that tests can easily check
for its existence.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/workloads/noploop.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/perf/tests/workloads/noploop.c b/tools/perf/tests/workloads/noploop.c
index 940ea5910a84..8b954d466083 100644
--- a/tools/perf/tests/workloads/noploop.c
+++ b/tools/perf/tests/workloads/noploop.c
@@ -2,6 +2,8 @@
 #include <stdlib.h>
 #include <signal.h>
 #include <unistd.h>
+#include <linux/prctl.h>
+#include <sys/prctl.h>
 #include <linux/compiler.h>
 #include "../tests.h"
 
@@ -16,6 +18,7 @@ static int noploop(int argc, const char **argv)
 {
 	int sec = 1;
 
+	prctl(PR_SET_NAME, "perf-noploop");
 	if (argc > 0)
 		sec = atoi(argv[0]);
 
-- 
2.50.0.rc2.701.gf1e915cc24-goog

