Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DFE4503B
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 01:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751074549; cv=none; b=tE25Yvw9E9YNRmDT8skw23nqm7Ak5GpEUn0cZG8UA9dyhccP5vPioIrxUZa2E3mu6xBd3K/EDN0EGLR/cA4/ZjgPA6ry9KM7dhhn08QmXrXZO6CqiXIknqBq1H7wZHYWgCq+tVZXqZG35nn4k6uZnWxYGbYF3y5YtigDgQCqNW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751074549; c=relaxed/simple;
	bh=xp6QooYSKJIO1Ri906XmGIWsfQAQKsjdb0xfOXssMf0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Content-Type; b=Q9HuIBrAbWwnF6BJL99se78NUJ1I5B6EmAph0gspOdoJnl+c3h0AHoJLM8uFzazsupQvn2MNSK1mel+y7Ec/Fb5cFIzRRPn1SVhSZswqEDj2QqOfsgt5H1p+zV6+YqTRtQh2kU0FhUYtaQZ+4Dfx5r0sF7jqFAIy8+q2acfACFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xdVMkFzd; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xdVMkFzd"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2354ba59eb6so2944845ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 18:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751074547; x=1751679347; darn=vger.kernel.org;
        h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=R9h8FoTQNuVI8eMmwBP37Z8kyCmEZSw8NGWBhTujA80=;
        b=xdVMkFzdpFqOfJQjtFVgzLGhPxgaCy+UyVNi0kyxvmPLB6ZJjsGkerDbgcN+xryGX1
         UmNbttmKdqNcW1kkzTAqESqhvO9Y7wVe+PzLlJdUftgGsjSd0Fz4KRlPz6PX+YOgLZSY
         ZOhsLhq4Uhioa7mogaBsEjomYfYZjvHVkWUvSUs7cSTyq5ShZzToO3Ctn37bYNpaTTVN
         1eClON703uXnFuyTms2z8oeYeayV9lul6vc/ok1egSGin8RiR72Mt6yMyvp+HQE9plZZ
         EB9g/8xg7lXllhuQw2YIKBrjrK37rVF2L7LR/75SaJAcbpdeCWQttBMwDJTDzoyBmSKz
         WVVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751074547; x=1751679347;
        h=to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R9h8FoTQNuVI8eMmwBP37Z8kyCmEZSw8NGWBhTujA80=;
        b=FQ5IZ4r6O0jUNydI7FPaOGC/9OUOrO+atg0JUyrGj6eGOQu0CtalKYzMmcuOYL2GiR
         Cnu6yVS3cRcMjhNIYqFDTm/DfwTgHpsahnulYA/e675CF4W1advjbl0AovEa9xlil9SN
         dNvhM9iALz7ARo1uLWgGeFHvsPuMdKQB5GsOqAV5YFehPepsBRxSXrI03NPgmzuYrZWm
         vLTACgYRdwpH2Qmf7G3MYhpw79a4OP/0fl6kbIZUMgJeIOaXp0APkgPh+erycre7jK8g
         76S70H1UBU7h6lkoYVeQcGtII8BzWTNK1NXVj/+zaEZQgfi846zRIGayhLmINDpV8xe1
         TRbA==
X-Forwarded-Encrypted: i=1; AJvYcCVBnT5t+u2iY5GdRvNuG/0gitNo2qZEOYTXCk6RQPszeabl7bxaDmeHNtHE+X+XUGAm1Gzha1bviRvP0i4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1IWHAC8pHWCdwe558+v6tcMpk+Krpeco1zcXThNFc0o+JLFPD
	YMKSFns2r04y7+XgjenDlU8aFLy6XtTXS5DuuJ+v6fH2rGnkfLQAuqLoqFgU7HW57cVWtRV8d6X
	ZmrdKBEoeVw==
X-Google-Smtp-Source: AGHT+IFd92Gn7WZNkqbN9k4RxtUPFZQe9Qxn220MNduLvj81BEx2Pr2j7bq1bV6C1FyTLi1nNpfqzVoS6gQU
X-Received: from plle5.prod.google.com ([2002:a17:903:1665:b0:237:d76c:a11a])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ce86:b0:235:15f3:ef16
 with SMTP id d9443c01a7336-23ac3deb433mr84311265ad.13.1751074547429; Fri, 27
 Jun 2025 18:35:47 -0700 (PDT)
Date: Fri, 27 Jun 2025 18:35:43 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250628013543.1250435-1-irogers@google.com>
Subject: [PATCH v1] perf test: Add basic callgraph test to record testing
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

