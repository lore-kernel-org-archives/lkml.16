Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0534A1E5B8D
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 18:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738952474; cv=none; b=FGiAKommTeg6c7WnQYRhpZnNXSRMEc06qF06bhR2SeO6zNvm/w5BPzr6nqNm3IM3pjVQDMxxoQrpQmIRLDLGKvq078U3Zpg0aO2UNE7TThqvi30XkI1188ZAoPhksRsG/34ZIM0wk1kaz3XgCkcDLoo7ce9oEEs5t6H2qFktX1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738952474; c=relaxed/simple;
	bh=BFPUfUPV9C28sQ+5++oI/Mt7czcCX79RjU67ZXHg4wc=;
	h=Date:In-Reply-To:Message-Id:Mime-Version:References:Subject:From:
	 To:Content-Type; b=MP03VF6qWplOhFuWYt/vTO6Dr3m+ZquVS9bkcH+A+oz8RvzoF+0E6k83wIGIBff8bLenQiZpO2MtsEfbmlnEx1wdqpi44T8zSPo/Scxxy7j4DwVjF2i1rSw97paVVD2NQzQU7YrgrQVZQsT24JCgJCb3zJO1Vlrd3dS66rWQ8Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1lHGLNkT; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1lHGLNkT"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e5af19d9746so4458770276.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 10:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738952462; x=1739557262; darn=vger.kernel.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GJ1B/xiMtyqfDg8YY7mV/zwkOmMpFHIKV2LiJJcfRRg=;
        b=1lHGLNkTlFfs0RKU0oMmU1f1mYihB82iE5UsB9F88z7oJMExu6zc9zehwtX2MDT1L5
         JSMzybt3KmviOvLztALE6tSogZbKkX+xj4/4MYRG1iYUfr3N5m0fThcozYVHDVdRyYqP
         zjyYt9w2gQAuRpHgNnZmWAcoW05OsrJxP4Kt+11T5w7IL+0l/pjU7Oel5olyx+TDKU8g
         UjllTZ6gWEtHfvOXg+1bp/oa80U/jTPJgLQR9fw9JAxZYROHpFquDOjAenCP9cgbeTyE
         ed/P210RB8X00SEVTnG5w+9QAa/vhhlrHnDq0K78wo8ePZzqbTmRINfY2sGi4yZPMsZg
         tbtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738952462; x=1739557262;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GJ1B/xiMtyqfDg8YY7mV/zwkOmMpFHIKV2LiJJcfRRg=;
        b=fJpQT07nPltDgXXFgGv0Hss5ZbnW9ANypLkahNlnEcihB5a3MC28QLAaxqxkipDKMW
         HYZz027WghZKA9PDEWmE1kUa2Oge88MuKhuwl5//3/9zJHevZn6jQA6PPUwGS7mHGo1+
         ddrenX+xMyef4PFXoU0H6fipA+GGpCQ8I37XFCag408rxdMYa9OjAEkHK23tiqjXxOnP
         GYz3QSnHkcK4XChAdN4Li6eUMxXGOUl7XFu1z8j7syFGoFtITmGos2BIUf81NRZhoKrz
         8E0boKAi1f0mKieht5zTJYXSN3CPpZeyZP2ZGCWSxFDybXVbyNEVi7PMtNcKxq0h081r
         T5FA==
X-Forwarded-Encrypted: i=1; AJvYcCVRFwLGrNayMWDhd+htqtStjDKxj973460upit6wBI8dBf2DSG1gtCYsB+sw9PtjG6bn5BudX+KQ25d+Sg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7LMMlJOdk+8rYEjOrAot2uWubEtlkjiHrJQO2FyJpsI7nJwoY
	rlmuhsNGFStiLHZSLgVEIRIu7leUN71T28iXs91CknErKtrtyaBbgk3Ap23TppGxZGAYmpK9A7d
	P+Uxspw==
X-Google-Smtp-Source: AGHT+IE9nQpJYQAPqABDSpxfPZLeiGhu7pUsYj71K+2YZn/FOwykQoduIPN2YQ2O5PvMZXOpJnpFdfgF8pTZ
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:79e4:4a45:1e80:ace5])
 (user=irogers job=sendgmr) by 2002:a25:d890:0:b0:e5b:33d1:cbf7 with SMTP id
 3f1490d57ef6-e5b354f6044mr89852276.4.1738952461878; Fri, 07 Feb 2025 10:21:01
 -0800 (PST)
Date: Fri,  7 Feb 2025 10:19:58 -0800
In-Reply-To: <20250207181959.799610-1-irogers@google.com>
Message-Id: <20250207181959.799610-25-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250207181959.799610-1-irogers@google.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Subject: [PATCH v6 24/24] perf test stat_all_metrics: Ensure missing events
 fail test
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, 
	"=?UTF-8?q?Andreas=20F=C3=A4rber?=" <afaerber@suse.de>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Weilin Wang <weilin.wang@intel.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Perry Taylor <perry.taylor@intel.com>, Samantha Alt <samantha.alt@intel.com>, 
	Caleb Biggers <caleb.biggers@intel.com>, Edward Baker <edward.baker@intel.com>, 
	Michael Petlan <mpetlan@redhat.com>, Thomas Falcon <thomas.falcon@intel.com>
Content-Type: text/plain; charset="UTF-8"

Issue reported by Thomas Falcon and diagnosed by Kan Liang here:
https://lore.kernel.org/lkml/d44036481022c27d83ce0faf8c7f77042baedb34.camel@intel.com/
Metrics with missing events can be erroneously skipped if they contain
FP, AMX or PMM events.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/shell/stat_all_metrics.sh | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tools/perf/tests/shell/stat_all_metrics.sh b/tools/perf/tests/shell/stat_all_metrics.sh
index 73e9347e88a9..ee817c66da06 100755
--- a/tools/perf/tests/shell/stat_all_metrics.sh
+++ b/tools/perf/tests/shell/stat_all_metrics.sh
@@ -20,7 +20,13 @@ for m in $(perf list --raw-dump metrics); do
   result_err=$?
   if [[ $result_err -gt 0 ]]
   then
-    if [[ "$result" =~ \
+    if [[ "$result" =~ "Cannot resolve IDs for" ]]
+    then
+      echo "Metric contains missing events"
+      echo $result
+      err=1 # Fail
+      continue
+    elif [[ "$result" =~ \
           "Access to performance monitoring and observability operations is limited" ]]
     then
       echo "Permission failure"
-- 
2.48.1.502.g6dc24dfdaf-goog

