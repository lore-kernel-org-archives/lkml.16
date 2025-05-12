Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DE9253932
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 22:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747087649; cv=none; b=XJhW85NYZ+TxSaqOPx0EjoR3Chhr9+YwOUxzWVufY5GY4ntMLuW9m9/qMjd/S1nPO0y78xjr15A7YemQAhLkzCdSbFuA9izYjDM4vXKkJUmmid6mdlK/RxvXb6KBd8jWyNWj9F/TZpsxi+8Sz+PMuE/CzGBT9IB5AAh5pLvj1rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747087649; c=relaxed/simple;
	bh=59VlnNQcrQbF9VoPWx9rTK6gSiYi9D6flZRl8TqbiJY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XrX5KLc/htIcq6V+1rp1WNcZrqjVCOKNmoeqGpOd3PXa4SM3YEmjFzfkqe+dfEgKtuuC2sttFctd3xYNnU75PlgaykGoFeV6hhchYAiuSNRzDYa5iBcMeRfAQ2ro7cfBe6E7hHYqkbP2Bn3q7YQ64EbWTo7zyp/9xxWTAyJLhkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ctshao.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CZO49yyg; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ctshao.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CZO49yyg"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-30c54b40096so3174810a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 15:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747087647; x=1747692447; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wxh9BxVjJTo5yVA2IRbpjDRptGFFtiq3WHv5MWVzf+Y=;
        b=CZO49yyg1mcF0ro6Otiq7ZY2WLtZAgloq6dH0u1KrxaJGSPNfcD2NXLXw3vPsF/1FJ
         Y/8V05I2PmfgmjPsi+KvqGiAELGkJtr+7mAKld0fpu8ABVn98s854yZUZK9W80neSvuj
         Hq/oYYVmzWPiJyLxFj8esNu62CFnxQG+4FJFuHq2v84zVNaoT6BtQXFjK/kFr24DdVeg
         XFkow+iECF/ffv+2pnVQHpo8HbO/gUq6ZjbU+JKyLuXej24Rwhd7NyVknjraBKSsGQmA
         D9PDmxtLUyrYNOzfENtJbHpDRtm1+jnj1pdlIKogGGp3INaPJO52+8j5n8ZHv8sLMzyf
         A3+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747087647; x=1747692447;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wxh9BxVjJTo5yVA2IRbpjDRptGFFtiq3WHv5MWVzf+Y=;
        b=UYiAkG0Z8VBjl3FItOFMet7n0NcjrdPpj8Uol/ZVDpX5ukGF3x/mTYjwppQUEtal3J
         CNNg09vA4NrY83eEyKw3JsDrxx181Pdnm2miBAYr8FwI9Ay8YtJteBh+3Fj88bbyVdoD
         hQzW/1KJjQfzvWx40ebQhYksrGWtFf/Zvc258amdNg1ONRvT76kfptJARs8ln3YSed7b
         sgKqlAAo3+/l44Y5o8e86ebRjV57VOhm0vVRp0cYhQKsjR8DkUfXZzNfVJmFjY3OxOQG
         t4Ahl4LrkfvOhYIfoS75r+0u6U6Vj/G1DWOAQqs03hzG6jQRJEsDhm/sccyaKRkjUctZ
         +iyw==
X-Gm-Message-State: AOJu0Yw8e0uFGigoh+UqDE3AZfABKWdiNR7akFBWyrYUneSQly72S+1s
	wbnZ0gOZffYGa0oBSxOj6UOK9Jfg42fuk64rWfbAm3HMBJLUBqmZT5efgbfc5r2o4IeF8ZugF1p
	Iiy99hGZ9crY95XZG+hEXwl7KCtJczGnv0d2ku2rt7Uf5ROReKaKG/Eh/Qc+K84/FL3fliOhqoD
	eQuYbAltD2nW01DezPNHK8TuSAQ96gpKHw53UawB1f
X-Google-Smtp-Source: AGHT+IFV0Xs8KsMWHv241dXgYHn+UHe74XFCdqWoZQtKEzUjIVnWTSM5t/SWhVxKUs6uPis7bipKFz5djTs=
X-Received: from pjbpv5.prod.google.com ([2002:a17:90b:3c85:b0:2fc:2f33:e07d])
 (user=ctshao job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d406:b0:30a:883a:ea5b
 with SMTP id 98e67ed59e1d1-30c3d3d9925mr27620041a91.17.1747087647297; Mon, 12
 May 2025 15:07:27 -0700 (PDT)
Date: Mon, 12 May 2025 14:50:32 -0700
In-Reply-To: <20250512215929.2098240-1-ctshao@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250512215929.2098240-1-ctshao@google.com>
X-Mailer: git-send-email 2.49.0.1045.g170613ef41-goog
Message-ID: <20250512215929.2098240-4-ctshao@google.com>
Subject: [PATCH v3 3/3] perf test: Add stat uniquifying test
From: Chun-Tse Shao <ctshao@google.com>
To: linux-kernel@vger.kernel.org
Cc: Chun-Tse Shao <ctshao@google.com>, peterz@infradead.org, mingo@redhat.com, 
	acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com, 
	adrian.hunter@intel.com, kan.liang@linux.intel.com, james.clark@linaro.org, 
	howardchu95@gmail.com, yeoreum.yun@arm.com, linux@treblig.org, 
	weilin.wang@intel.com, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The `stat+uniquify.sh` test retrieves all uniquified `clockticks` events
from `perf list -v clockticks` and check if `perf stat -e clockticks -A`
contains all of them.

Signed-off-by: Chun-Tse Shao <ctshao@google.com>
---
 .../tests/shell/stat+event_uniquifying.sh     | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100755 tools/perf/tests/shell/stat+event_uniquifying.sh

diff --git a/tools/perf/tests/shell/stat+event_uniquifying.sh b/tools/perf/tests/shell/stat+event_uniquifying.sh
new file mode 100755
index 000000000000..5ec35c52b7d9
--- /dev/null
+++ b/tools/perf/tests/shell/stat+event_uniquifying.sh
@@ -0,0 +1,69 @@
+#!/bin/bash
+# perf stat events uniquifying
+# SPDX-License-Identifier: GPL-2.0
+
+set -e
+
+stat_output=$(mktemp /tmp/__perf_test.stat_output.XXXXX)
+perf_tool=perf
+err=0
+
+test_event_uniquifying() {
+  # We use `clockticks` to verify the uniquify behavior.
+  event="clockticks"
+
+  # If the `-A` option is added, the event should be uniquified.
+  #
+  # $perf list -v clockticks
+  #
+  # List of pre-defined events (to be used in -e or -M):
+  #
+  #   uncore_imc_0/clockticks/                           [Kernel PMU event]
+  #   uncore_imc_1/clockticks/                           [Kernel PMU event]
+  #   uncore_imc_2/clockticks/                           [Kernel PMU event]
+  #   uncore_imc_3/clockticks/                           [Kernel PMU event]
+  #   uncore_imc_4/clockticks/                           [Kernel PMU event]
+  #   uncore_imc_5/clockticks/                           [Kernel PMU event]
+  #
+  #   ...
+  #
+  # $perf stat -e clockticks -A -- true
+  #
+  #  Performance counter stats for 'system wide':
+  #
+  # CPU0            3,773,018      uncore_imc_0/clockticks/
+  # CPU0            3,609,025      uncore_imc_1/clockticks/
+  # CPU0                    0      uncore_imc_2/clockticks/
+  # CPU0            3,230,009      uncore_imc_3/clockticks/
+  # CPU0            3,049,897      uncore_imc_4/clockticks/
+  # CPU0                    0      uncore_imc_5/clockticks/
+  #
+  #        0.002029828 seconds time elapsed
+
+  echo "stat event uniquifying test"
+  uniquified_event_array=()
+
+  # Check how many uniquified events.
+  while IFS= read -r line; do
+    uniquified_event=$(echo "$line" | awk '{print $1}')
+    uniquified_event_array+=("${uniquified_event}")
+  done < <(${perf_tool} list -v ${event} | grep "\[Kernel PMU event\]")
+
+  perf_command="${perf_tool} stat -e $event -A -o ${stat_output} -- true"
+  $perf_command
+
+  # Check the output contains all uniquified events.
+  for uniquified_event in "${uniquified_event_array[@]}"; do
+    if ! cat "${stat_output}" | grep -q "${uniquified_event}"; then
+      echo "Event is not uniquified [Failed]"
+      echo "${perf_command}"
+      cat "${stat_output}"
+      err=1
+      break
+    fi
+  done
+}
+
+test_event_uniquifying
+rm -f "${stat_output}"
+exit $err
-- 
2.49.0.1045.g170613ef41-goog

