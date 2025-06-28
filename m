Received: from mail-oa1-f73.google.com (mail-oa1-f73.google.com [209.85.160.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96981D8E10
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 01:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751075760; cv=none; b=PEp1gK5mxDX9NC6F2+kF58e86Kyx72tDHlLaRAM8e3JABwdIUT/ZhX9kU+DJzPs6YoQ2X5hVeP92GVebAbsVwUg1EHQO88TP5SmHQV0Q677ciRZcsRHfh1LXhl14df/uC+rL4JCRkPiEDQ8V8142vrjejVvcaDMopbV6NhIfvOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751075760; c=relaxed/simple;
	bh=xp6QooYSKJIO1Ri906XmGIWsfQAQKsjdb0xfOXssMf0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Content-Type; b=VtxaCq6Fh5HA3AWwdpqzg1hsycnyRs7Gr9D2SEF8glozUXfnYGoYHSM7Qche/vJQmA4dfjWSevHlBxjlFU1BxV6+vOu8tK38eJdDbIPGHP8DoXBMnUCMFLz6l1a1rJd3tFLGkHtOPRh318VuLOpco/N3YriZwl1THWao+qEeklc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Nm7ykAd6; arc=none smtp.client-ip=209.85.160.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Nm7ykAd6"
Received: by mail-oa1-f73.google.com with SMTP id 586e51a60fabf-2d50f167550so154564fac.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 18:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751075758; x=1751680558; darn=vger.kernel.org;
        h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=R9h8FoTQNuVI8eMmwBP37Z8kyCmEZSw8NGWBhTujA80=;
        b=Nm7ykAd6fWeSufTbJVGNudayHXhgSEskE+UOhtZLXEBu1Pi91B2st+RouV6iwp7IuR
         JONLWqvOqogdHBESpBwHdBEmAurUGrMEL8wuUXNnMsINefn414M0d4tEYDpLOue8LQBM
         8Jdv7lwYB7NVqy3mz92BB0F/bvxFd/Lg/qTUMYcMcTi+i57F7+fEf6gG83izWh1pe1LY
         9ScIBIs+ogeT8l/Te6cQh1O7zJqvUJPQZHZr136ZwsiTtJ1EC2yJPTB6VGynlWxBRM7F
         Qcx2HAYSfSb6M5Pltx3bJXSGRFAQz4p6S56XSDtipaBDmlGYj9Dd0XK7IBK3plgi00GO
         C/0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751075758; x=1751680558;
        h=to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R9h8FoTQNuVI8eMmwBP37Z8kyCmEZSw8NGWBhTujA80=;
        b=OH8fzV1lZ/rqAaH2USpEaLS6jjCF0c+97GF6JhWiKlIYn5wjTSVQ9lQ2TCko8CUEV+
         SMCDm3u+KnfRtfTSvlxbm0N4uiqp/+NSZ6nvSABxRSrbl/v69eLHCHTf8sLhUFJyNIKO
         Ryak38hnBS60MSAUwIrHPO40LHcy86Uqq2HdFCHsubUCllGUsXFPTIzEeOiGepKPa0vn
         hW9sHCK8grAeZNXDO9BYzVgCuTSXqi2zRBFCFizn06MJbnIOOpYQvub9yUhlbIWm9xIi
         0riBfSyYcNp60ScgCGND1LCY9m4b9TAFOWdYD90aU4c0N9GpPG8NGtZ+zFeSf+CdX4TB
         ZFIA==
X-Forwarded-Encrypted: i=1; AJvYcCVwaPEYh9UgPnuMFN7WNVb2BpmuS0c7ZUg+yDrXzLS/nuw47XOcrbufzj6eTCbuxSd0AtNjbaw3s0nm+f0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqCCdntuZ6Q9G82mmchIgHWNNk9kuqVPwpK4YIZ8/7Tp1ZUWQj
	sE6YQe7ZTo2LRUThrQ1jhXe37YkRwjPwDC9M4WBh3yxFNxwyxiBhUHC8XD21ObcTSi+gYIX37sA
	82ME1rZ4GLw==
X-Google-Smtp-Source: AGHT+IENTPRHNWGW0h/e1gGYBTAnij1lcBLoq9GKy23IedPH8T1A4YYl98zUsSHXi72+tWcQDyLiUfKt1KD0
X-Received: from oabgs15.prod.google.com ([2002:a05:6870:ab8f:b0:2d6:1436:180b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6870:d92:b0:2ea:70ad:4517
 with SMTP id 586e51a60fabf-2efed4f4f3emr3048947fac.15.1751075757707; Fri, 27
 Jun 2025 18:55:57 -0700 (PDT)
Date: Fri, 27 Jun 2025 18:55:53 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250628015553.1270748-1-irogers@google.com>
Subject: [PATCH v2] perf test: Add basic callgraph test to record testing
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, James Clark <james.clark@linaro.org>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Thomas Richter <tmricht@linux.ibm.com>, 
	Chun-Tse Shao <ctshao@google.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Give some basic perf record callgraph coverage.

Signed-off-by: Ian Rogers <irogers@google.com>
---
v2: Pick up s390's needed "--call-graph dwarf" as spotted by James
    Clark <james.clark@linaro.org>.
---
 tools/perf/tests/shell/record.sh | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/tools/perf/tests/shell/record.sh b/tools/perf/tests/shell/record.sh
index 2022a4f739be..b1ad24fb3b33 100755
--- a/tools/perf/tests/shell/record.sh
+++ b/tools/perf/tests/shell/record.sh
@@ -12,8 +12,10 @@ shelldir=$(dirname "$0")
 . "${shelldir}"/lib/perf_has_symbol.sh
 
 testsym="test_loop"
+testsym2="brstack"
 
 skip_test_missing_symbol ${testsym}
+skip_test_missing_symbol ${testsym2}
 
 err=0
 perfdata=$(mktemp /tmp/__perf_test.perf.data.XXXXX)
@@ -359,6 +361,33 @@ test_precise_max() {
   fi
 }
 
+test_callgraph() {
+  echo "Callgraph test"
+
+  case $(uname -m)
+  in s390x)
+       cmd_flags="--call-graph dwarf -e cpu-clock";;
+     *)
+       cmd_flags="-g";;
+  esac
+
+  if ! perf record -o "${perfdata}" $cmd_flags perf test -w brstack
+  then
+    echo "Callgraph test [Failed missing output]"
+    err=1
+    return
+  fi
+
+  if ! perf report -i "${perfdata}" 2>&1 | grep "${testsym2}"
+  then
+    echo "Callgraph test [Failed missing symbol]"
+    err=1
+    return
+  fi
+
+  echo "Callgraph test [Success]"
+}
+
 # raise the limit of file descriptors to minimum
 if [[ $default_fd_limit -lt $min_fd_limit ]]; then
        ulimit -Sn $min_fd_limit
@@ -374,6 +403,7 @@ test_uid
 test_leader_sampling
 test_topdown_leader_sampling
 test_precise_max
+test_callgraph
 
 # restore the default value
 ulimit -Sn $default_fd_limit
-- 
2.50.0.727.gbf7dc18ff4-goog

