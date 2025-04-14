Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648E1289341
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 17:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744652520; cv=none; b=OidNsvxYKpgc4x9tEr11KXAFmspzEtjH4L5slnr972l3jmYOw89GVpPB0N9+oeIaRYOVTVY4V11L0nkglW9Tww8+vyxBSZmwHkPWpqIUz5YJ5GxLSjIDNFc8UN6xD+suYlhW95vzVKhwdD1eRa1Vc5yWsrlBNz4I2WWXlOWarn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744652520; c=relaxed/simple;
	bh=slHe5WC35Qo1w8hHbLkGv/83Qna2F02lahPNQerHbw8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=U/TlOwUgrFxqOvUDrI2uQd6cJBzOE+JSI+nM+gjQ7DlCAy3PReW/pR4BUBv6oXslNgquicybLppZ5mk6ZE9QwYRfTXrh/VxKFMh/Esk0hHEvN54p88LhRfG9EoBNhhHCt7WkOH8Eh7j9tCC/s2tZ1q19MATZvobQO9/axyO4gFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I0TQkECW; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I0TQkECW"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-3055f2e1486so6922178a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 10:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744652517; x=1745257317; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zlPSRtvb4/+TTghxrsueo1A3tWRb8o4F7DCTI51/qHU=;
        b=I0TQkECWxjPav8Enyn6SYKgmiZPcbhR8KsVmlwKtnZ1IQRVJ7kV8sdPgZEvhdHXwZJ
         BDVQbgC07kDmr2PTenKAi58lc3cgcfTJLg7Bcc/P0n5j7qvOrVFmaBdJ8iIKPzC/Oy+I
         z1HGLQ5hB+GWLlJwudWR98a/WI8vHYYu8ZhRPaD4Vfmnkwpqc1YG8345pUzDZZ7GcPIo
         t/GZZDaJ0uTFPf8h+dE12LUiL9VaSUiUPh/sXbVJ6maWZ125SvGeiW30ZrCOswNmqxiD
         c9Xt7t63AZr7H+6gxGPOjejDygzKE1V/KOvncgOrL2jXBv5ipvxwSi8cS7cWoXbMj0GB
         HHsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744652517; x=1745257317;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zlPSRtvb4/+TTghxrsueo1A3tWRb8o4F7DCTI51/qHU=;
        b=wVP/NvW0+CXiNLRZb2vvfGjo/Ezu5UrZSZd8tvnXw/7dcz+LcMfZt46KokWk25Y2ZI
         cKE13F6zuv0pxqqb6R0yTWg/fAqP0EYhgvO6VOrd8ou9ITMQClqMvc9MJ9BtDFBseZ33
         zuuDIG5Ed9trfU2uKbEqnn9kqOuTGx6TwD/02dnFnjkkvePDxOS/uEvPw0GjoPnb6o/w
         xKTTHX3Bj5Fm2mSzC4EvvviGKPf1aofPjE+apIs9WCjoaDRb4WWry3tLUtsxgnGVOy0M
         r6DXEthsxdcN2qFy3LsDKi+FMCM9al328eplmJQ1idp4fvIJvo214n0YTOBsRm1h9dxS
         gRAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYo0463oKy8SYKBRmvbnc3z9mGW3ncgYBh+enxy6urnmsWiIW/BZA2T6iDEbjRj1NVB/qcKF8vTwsuVmk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCZ6i/WxH+B+chAD6XiHSpBUSZpB8tlHzJGbFy7UwPl/9wfgW1
	b+vALlRUNrGhWL/X/cr+/oYcTgFHMGUnkcXUIS+uUIXOU4WlXIH+9kMy+3gFXNCrxFrBgBw/VLs
	QloLh9g==
X-Google-Smtp-Source: AGHT+IH9rV1O8BX4TziERNYAHUqTWDiePpMXRosCaFe8xB6DJ3X2Nfbl3Vec8TG/UcvWizJkMElzLTcdYlym
X-Received: from pjbpl17.prod.google.com ([2002:a17:90b:2691:b0:2f7:d453:e587])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:dfc4:b0:306:b593:4557
 with SMTP id 98e67ed59e1d1-30823633eb7mr16671483a91.4.1744652517625; Mon, 14
 Apr 2025 10:41:57 -0700 (PDT)
Date: Mon, 14 Apr 2025 10:41:19 -0700
In-Reply-To: <20250414174134.3095492-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250414174134.3095492-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250414174134.3095492-2-irogers@google.com>
Subject: [PATCH v5 01/16] perf intel-tpebs: Cleanup header
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, 
	"=?UTF-8?q?Andreas=20F=C3=A4rber?=" <afaerber@suse.de>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Caleb Biggers <caleb.biggers@intel.com>, 
	Weilin Wang <weilin.wang@intel.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Perry Taylor <perry.taylor@intel.com>, 
	Thomas Falcon <thomas.falcon@intel.com>
Content-Type: text/plain; charset="UTF-8"

Remove arch conditional compilation. Arch conditional compilation
belongs in the arch/ directory.

Tidy header guards to match other files. Remove unneeded includes and
switch to forward declarations when necesary.

Signed-off-by: Ian Rogers <irogers@google.com>
Tested-by: Weilin Wang <weilin.wang@intel.com>
Acked-by: Namhyung Kim <namhyung@kernel.org>
---
 tools/perf/util/Build         |  2 +-
 tools/perf/util/intel-tpebs.c |  1 +
 tools/perf/util/intel-tpebs.h | 30 ++++++------------------------
 3 files changed, 8 insertions(+), 25 deletions(-)

diff --git a/tools/perf/util/Build b/tools/perf/util/Build
index 946bce6628f3..815274b199fd 100644
--- a/tools/perf/util/Build
+++ b/tools/perf/util/Build
@@ -161,7 +161,7 @@ perf-util-y += clockid.o
 perf-util-y += list_sort.o
 perf-util-y += mutex.o
 perf-util-y += sharded_mutex.o
-perf-util-$(CONFIG_X86_64) += intel-tpebs.o
+perf-util-y += intel-tpebs.o
 
 perf-util-$(CONFIG_LIBBPF) += bpf_map.o
 perf-util-$(CONFIG_PERF_BPF_SKEL) += bpf_counter.o
diff --git a/tools/perf/util/intel-tpebs.c b/tools/perf/util/intel-tpebs.c
index 2c421b475b3b..3503da28a12f 100644
--- a/tools/perf/util/intel-tpebs.c
+++ b/tools/perf/util/intel-tpebs.c
@@ -19,6 +19,7 @@
 #include "tool.h"
 #include "cpumap.h"
 #include "metricgroup.h"
+#include "stat.h"
 #include <sys/stat.h>
 #include <sys/file.h>
 #include <poll.h>
diff --git a/tools/perf/util/intel-tpebs.h b/tools/perf/util/intel-tpebs.h
index 766b3fbd79f1..63c16e759a71 100644
--- a/tools/perf/util/intel-tpebs.h
+++ b/tools/perf/util/intel-tpebs.h
@@ -2,34 +2,16 @@
 /*
  * intel_tpebs.h: Intel TEPBS support
  */
-#ifndef INCLUDE__PERF_INTEL_TPEBS_H__
-#define INCLUDE__PERF_INTEL_TPEBS_H__
+#ifndef __INTEL_TPEBS_H
+#define __INTEL_TPEBS_H
 
-#include "stat.h"
-#include "evsel.h"
-
-#ifdef HAVE_ARCH_X86_64_SUPPORT
+struct evlist;
+struct evsel;
 
 extern bool tpebs_recording;
+
 int tpebs_start(struct evlist *evsel_list);
 void tpebs_delete(void);
 int tpebs_set_evsel(struct evsel *evsel, int cpu_map_idx, int thread);
 
-#else
-
-static inline int tpebs_start(struct evlist *evsel_list __maybe_unused)
-{
-	return 0;
-}
-
-static inline void tpebs_delete(void) {};
-
-static inline int tpebs_set_evsel(struct evsel *evsel  __maybe_unused,
-				int cpu_map_idx  __maybe_unused,
-				int thread  __maybe_unused)
-{
-	return 0;
-}
-
-#endif
-#endif
+#endif /* __INTEL_TPEBS_H */
-- 
2.49.0.604.gff1f9ca942-goog

