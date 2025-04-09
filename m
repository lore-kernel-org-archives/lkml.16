Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3479A26ACB
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 23:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744240362; cv=none; b=Fh+4kMw3pdhj8pa2R6BEbB1Iq7FVXOKpKyKBLCM+b3x3HclWAz+W70rGuVKcFfLVR4PCWtHkohRnfo1Kpk84jb+gI04znOo3g6hdiU2KChVLFfBhX+H3jego38y4zz3dhaf01kXrVVOI3UUzGi/RXh9i0Ui+sLEUPXGTZfxYc7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744240362; c=relaxed/simple;
	bh=WIA49+TKtPo0Cw/Pzw0xYETN11R/ZSK/Jj6AtKvIyJc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=fPB8kZ2WdIjKe4RRpOyhtgTTBiREl39ve5oz5w8pdCrNYOno90yrMA6Guouy0oIhiV63mPSCG28x4zCnZiYKvij14HDqLQlggZJpLR3/6XKIwRGoJcZ4RyoiIvRm9ljv62EavzE93HWnmANKY8jJqmUoyMlszqWPDy/KnzauVvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ctshao.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uuHwXCRC; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ctshao.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uuHwXCRC"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-736b431ee0dso107956b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 16:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744240360; x=1744845160; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hQy2Z6G5chmLGArkdaIBDoxGpfcNVyaQUKkExyNr838=;
        b=uuHwXCRCOpyc2+PR66raRyHhMm4LNcAvdPifIKvrGUkVIP30s4ftl6DGjvAvb/hd4x
         +bQw6eo9hYCRLcu7run0kKwQnANjUIUmkZLPZoDqY5MkB0JNTZYXLeCIYUkVq8ehYHNG
         kU/5Y4zDrKGLEJZ2geLj/zX93fTbNQbGzPGmZaq8OZiU5wb7L14tCu2roz4vzGkJY9yB
         SNcFFDyFFsfANafHJB017aJg64nGmnhNkdJE+mAM3WkDlm6etzBlEMXEHG0HndAezEHj
         F7fgIWTpwy277hIsNeedEv5Yk5NUB9fWnpIapfkcoqmsRUpk1qjoEs3veVWLMFOeX1Z4
         5dxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744240360; x=1744845160;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hQy2Z6G5chmLGArkdaIBDoxGpfcNVyaQUKkExyNr838=;
        b=QPURsjaThmdc1wXCVf5HGro3ZyJ7u3EcF9F0F+Aj7mYKSYfZ4+LGKqW9kS4xvQVzOz
         3+XtILyWuy8Ues9lqgFjyof82JinGAVUJUBdUjm2Of+eKJ6UrUSq3yYOZI4po9k0BOBd
         CpzhWyQdYMnzA1d/hn1FBEnBUNVqpLeQQs7/fUJjRCjbru2Z+0hPQjF3IdsZw+TkDxPU
         TVVlZoqj3tQJavS+c+1nFUXodgK/uFBdsU/ookAy5c/FDd/4g+qK8+kcDDnq3V7KR0HP
         QDqBQyhP/G6SFfOmrVjBA+da9JkKz2cAWYtKG0qMKWVGIaW+LXOPqqV/I+H28ZPidlpN
         0xtw==
X-Gm-Message-State: AOJu0YwwLu3uCjsJfVuQkwLr8OEbdtTnCKbfnmmuw8cIGNiJjY7qZcRM
	Usgr77AZjBzgWaiaLX66+91nhUiwo9i6gKdkKoMi7dLh2ffCltyz88kp5r8Y2oUOiuGIFhmRJ1S
	9ihY9GiPu36ioVRSutPRRQgoul/L+0VbtqJMLAbAvgUC24tMq4S2i+KiT/ILc8r4BunG3s3eRNY
	4gEM6/NckYYIgA9q8zi2V/bfZIi8DlxCbMNIc+hWAV
X-Google-Smtp-Source: AGHT+IEMiE4nRjncWxQA1pYrSlI10L6gQJX9h+opY9uU6dmtwNxQEFInA5eHScgXeegRJyJ6ePIaiikHJGM=
X-Received: from pge9.prod.google.com ([2002:a05:6a02:2d09:b0:af2:7f61:e1d4])
 (user=ctshao job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:ce4a:b0:1fd:f8dc:833e
 with SMTP id adf61e73a8af0-201695c31c3mr1457564637.30.1744240360348; Wed, 09
 Apr 2025 16:12:40 -0700 (PDT)
Date: Wed,  9 Apr 2025 16:12:08 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250409231230.1678358-1-ctshao@google.com>
Subject: [PATCH v2] perf test: Allow tolerance for leader sampling test
From: Chun-Tse Shao <ctshao@google.com>
To: linux-kernel@vger.kernel.org
Cc: Chun-Tse Shao <ctshao@google.com>, Ian Rogers <irogers@google.com>, 
	Thomas Richter <tmricht@linux.ibm.com>, peterz@infradead.org, mingo@redhat.com, 
	acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org, adrian.hunter@intel.com, 
	kan.liang@linux.intel.com, james.clark@linaro.org, dapeng1.mi@linux.intel.com, 
	vmolnaro@redhat.com, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

There is a known issue that the leader sampling is inconsistent, since
throttle only affect leader, not the slave. The detail is in [1]. To
maintain test coverage, this patch sets a tolerance rate of 80% to
accommodate the throttled samples and prevent test failures due to
throttling.

[1] lore.kernel.org/20250328182752.769662-1-ctshao@google.com

Signed-off-by: Chun-Tse Shao <ctshao@google.com>
Suggested-by: Ian Rogers <irogers@google.com>
Suggested-by: Thomas Richter <tmricht@linux.ibm.com>
Tested-by: Thomas Richter <tmricht@linux.ibm.com>
---
 tools/perf/tests/shell/record.sh | 28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/tools/perf/tests/shell/record.sh b/tools/perf/tests/shell/record.sh
index ba8d873d3ca7..06a718e80121 100755
--- a/tools/perf/tests/shell/record.sh
+++ b/tools/perf/tests/shell/record.sh
@@ -240,19 +240,39 @@ test_leader_sampling() {
   fi
   index=0
   perf script -i "${perfdata}" > $script_output
+  # Check if the two instruction counts are equal in each record.
+  # However, the throttling code doesn't consider event grouping. During throttling, only the
+  # leader is stopped, causing the slave's counts significantly higher. To temporarily solve this,
+  # let's set the tolerance rate to 80%.
+  # TODO: Revert the code for tolerance once the throttling mechanism is fixed.
+  valid_counts=0
+  invalid_counts=0
+  tolerance_rate=0.8
   while IFS= read -r line
   do
-    # Check if the two instruction counts are equal in each record
     cycles=$(echo $line | awk '{for(i=1;i<=NF;i++) if($i=="cycles:") print $(i-1)}')
     if [ $(($index%2)) -ne 0 ] && [ ${cycles}x != ${prev_cycles}x ]
     then
-      echo "Leader sampling [Failed inconsistent cycles count]"
-      err=1
-      return
+      invalid_counts=$(($invalid_counts+1))
+    else
+      valid_counts=$(($valid_counts+1))
     fi
     index=$(($index+1))
     prev_cycles=$cycles
   done < $script_output
+  total_counts=$(bc <<< "$invalid_counts+$valid_counts")
+  if (( $(bc <<< "$total_counts <= 0") ))
+  then
+      echo "Leader sampling [No sample generated]"
+      err=1
+      return
+  fi
+  if (( $(bc <<< "scale=3; $invalid_counts/$total_counts > 1-$tolerance_rate") ))
+  then
+      echo "Leader sampling [Failed inconsistent cycles count]"
+      err=1
+      return
+  fi
   echo "Basic leader sampling test [Success]"
 }

--
2.49.0.504.g3bcea36a83-goog

