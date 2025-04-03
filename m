Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD5C1F55EB
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 20:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743711899; cv=none; b=r+zKNrvvWJY1ZWHbVKXcm8tLxwz4MEwC0tyesVeVdT6tKHIYa7f4rEQCk2N26Qdyp6lA+jEiPc4WXxXjYlvfbzdhQdP3n6kLS73VscSJqEfUT+o3ny6f5Rlmc8x78Ht27+I19ksaa5XGkDVfVH+gTz9EQq/XViamu4SRHFck1ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743711899; c=relaxed/simple;
	bh=gNKtXVPbbB+3G3c1/vIwnhim6kYBeq02fpYtM7jeUSA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LZR3mdEY7CHCknFLMg8/HI6gFWsOijkFP/DxKCouxEkIsw61U8SPsc/RzqTBM39G0EXa4P9J4fmsYDNl805FXXwpIM/mUHZHgOxvH5RIRsJLqUNMVfo9RGUaFMH9lePE0UF+p7WiwAz/v+/ZILXMEzMfn9Q3MhVVdO+a/2lWXoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bHMl2oCV; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bHMl2oCV"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-224364f2492so11494645ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 13:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743711897; x=1744316697; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5JjsjFOUC3YO0iochXENC9eaId60vwka6iugGNbtu6g=;
        b=bHMl2oCV0NSsEuL75SZKT20HqYO/Xjnbzds/OdHU6ejlw9glzpP/pPQZ2MW+7qt5HK
         8zEbyt3fzWgt3Iab/mzzQreY9gwVJmlUHvXv8T1a9ZVlyLKSTPnCgmehEp8r+Ng9ym1F
         8vEVB/SwZHDr4j4dbBRnK+52FG/cADVS0YAxP/GD4TQy6Bcp/LUu1qckhvijYqpLm+Yv
         MFiLcdrDb0vaMREmc/VTMDbWOHaHBkyiBl4vreQMoyV3KH4OUReEvDhkGALsa4yw2Xh9
         iQLbX8wk9J5uGbMdkfadcDFWd5ROiGy4v77uDBY4qaSkrp2R5v84nwa5EfI6S1ohuuNT
         6nhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743711897; x=1744316697;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5JjsjFOUC3YO0iochXENC9eaId60vwka6iugGNbtu6g=;
        b=AWS7/SVYvxB6FvfeEiRFXdqOOpewteBxZETSjl/ncilicmDvNKpq7yUEyESDOXdGZo
         ys9i0NJlM1sCkG/lzFr0lBZ2fxuAHl/FrqLzzGj+ZoKhp/SM5tAqnjuTYLGAhJDiPc9W
         z5zKP4a4oxonxc52IuFjRcgRforepOBRaeACME4IcLUAwCx5xChhV2K17cW5JeUpQbtW
         AhYu5GT2LmQF0ubpnh/ouoYr2E+pCgkOnDqD45LiwlT4HbIcD2M/sXpJZ+p00WgHGw38
         v8G8/KiY36EV1o4S465eq+wl0VmB+/JGoahGNzUfn4+jS6pPJLFNlPqGsRUgVtFmxfxQ
         qDLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHspTVxPSg2jh3AWgRkll4Tkr+BZ58Alb16WHHKg66MtI7rA2CqtdAn12Wla9bF7kojff4coivfL4Apgs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx0g51chgZakV1w0tn/NsteJQLcoJ8ov+iaRChZ+dVca4ehfME
	tVrryIm75CZaFzN5dxBzfazGS0ToX9mrXCQp4ssPaw51XLTZU4esbvvau7lBmeyhf/qPGMsAuo3
	aDKiONg==
X-Google-Smtp-Source: AGHT+IHRfFDzCYIPq5Bp5DbUlRqc8I14sxeIBKF4QG8mXK1Q6lEJ5VL4ONiwvatjg5A7PeaRVPG/gKZbjZDM
X-Received: from plbja4.prod.google.com ([2002:a17:902:efc4:b0:223:52c5:17f6])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:94e:b0:229:1619:ab58
 with SMTP id d9443c01a7336-22a8a0b33e8mr7237285ad.43.1743711896952; Thu, 03
 Apr 2025 13:24:56 -0700 (PDT)
Date: Thu,  3 Apr 2025 13:24:39 -0700
In-Reply-To: <20250403202439.57791-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250403202439.57791-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250403202439.57791-5-irogers@google.com>
Subject: [PATCH v3 4/4] perf tests: Add a DRM PMU test
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, James Clark <james.clark@linaro.org>, 
	Weilin Wang <weilin.wang@intel.com>, Dominique Martinet <asmadeus@codewreck.org>, 
	Thomas Richter <tmricht@linux.ibm.com>, Junhao He <hejunhao3@huawei.com>, 
	Jean-Philippe Romain <jean-philippe.romain@foss.st.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

The test opens any DRM devices so that the shell has fdinfo files
containing the DRM data. The test then uses perf stat to make sure the
events can be read.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/shell/drm_pmu.sh | 78 +++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)
 create mode 100755 tools/perf/tests/shell/drm_pmu.sh

diff --git a/tools/perf/tests/shell/drm_pmu.sh b/tools/perf/tests/shell/drm_pmu.sh
new file mode 100755
index 000000000000..e629fe0e8463
--- /dev/null
+++ b/tools/perf/tests/shell/drm_pmu.sh
@@ -0,0 +1,78 @@
+#!/bin/bash
+# DRM PMU
+# SPDX-License-Identifier: GPL-2.0
+
+set -e
+
+output=$(mktemp /tmp/perf.drm_pmu.XXXXXX.txt)
+
+cleanup() {
+  rm -f "${output}"
+
+  trap - EXIT TERM INT
+}
+
+trap_cleanup() {
+  echo "Unexpected signal in ${FUNCNAME[1]}"
+  cleanup
+  exit 1
+}
+trap trap_cleanup EXIT TERM INT
+
+# Array to store file descriptors and device names
+declare -A device_fds
+
+# Open all devices and store file descriptors. Opening the device will create a
+# /proc/$$/fdinfo file containing the DRM statistics.
+fd_count=3 # Start with file descriptor 3
+for device in /dev/dri/*
+do
+  if [[ ! -c "$device" ]]
+  then
+    continue
+  fi
+  major=$(stat -c "%Hr" "$device")
+  if [[ "$major" != 226 ]]
+  then
+    continue
+  fi
+  echo "Opening $device"
+  eval "exec $fd_count<\"$device\""
+  echo "fdinfo for: $device (FD: $fd_count)"
+  cat "/proc/$$/fdinfo/$fd_count"
+  echo
+  device_fds["$device"]="$fd_count"
+  fd_count=$((fd_count + 1))
+done
+
+if [[ ${#device_fds[@]} -eq 0 ]]
+then
+  echo "No DRM devices found [Skip]"
+  cleanup
+  exit 2
+fi
+
+# For each DRM event
+err=0
+for p in $(perf list --raw-dump drm-)
+do
+  echo -n "Testing perf stat of $p. "
+  perf stat -e "$p" --pid=$$ true > "$output" 2>&1
+  if ! grep -q "$p" "$output"
+  then
+    echo "Missing DRM event in: [Failed]"
+    cat "$output"
+    err=1
+  else
+    echo "[OK]"
+  fi
+done
+
+# Close all file descriptors
+for fd in "${device_fds[@]}"; do
+  eval "exec $fd<&-"
+done
+
+# Finished
+cleanup
+exit $err
-- 
2.49.0.504.g3bcea36a83-goog

