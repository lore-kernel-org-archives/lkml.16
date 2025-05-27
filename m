Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937771FB3
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 21:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748382641; cv=none; b=kYgKf5eYec4CQl/er48MCQ9SdrIwnqPjPRVtMwBThwGp6tEPRBVXoOtkyrBqq+If7fms0UAX0pmcTUf+hs0fSqJG8cpM1A6JkYMdtyYq3xWL63oRiJM2iew/Qyyp8iW6i31ubc2MMjySYENdZK6LgmG7ooFrKiep4CD2q4Ehxu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748382641; c=relaxed/simple;
	bh=gStf4rc+PfmUoSWbPTo2dWtfe1mdr6RBm/W15XNCQ5A=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Content-Type; b=M/+oL1jteOGTIGwFbbE54efQsz8ZciaQKwSle0f/uxnE7Y/km4OnsezOfFEqvn/Jd9T3hE+5i/3lpgI0F6twNItgcziTNZ3q6wCg+ZwhCIMKrTOQsBLO0W3cB09K6tTQ1n6Gh+trzlxiEAXXWNqm4yUMcEkHpZRlfdPO9LylZwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g/LjN2E2; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g/LjN2E2"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2349fe5be47so8700055ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 14:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748382639; x=1748987439; darn=vger.kernel.org;
        h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dtvDg2edXjwGmFOOqP4AgS1P4/Y9z8Fg7Ga55758bwE=;
        b=g/LjN2E2aMh3IpPFkNmJWD1aU3RJV6gavJPlehTYsLTFIptgu2pLFyBpgClgXBw312
         9gIar/LFSI7+Ib57kcTTLyiSMgS4R6y+v9bPo2r22upXjn4vi6HsjZx2OSeX8qWuW4Vr
         BlbmcfnjiM8n1hsi2fXgZoZP4DJVw3AvMKoBSZe9r7+5784+zqvY+OmG6Kh7a4S3oi4A
         0LY2Mn882vYDhHl6CrJ8Qa9LyiZUEqLwrD/cv5IiuCprtdUNJuaMLxa6scoubzPMwG9z
         7qVAOUTBhSoHrzZ+89nzJfD7jS/W8Q1WK11PziLnZ4JezIisYQbJhGZUoCHcc4B6XfOr
         A4bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748382639; x=1748987439;
        h=to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dtvDg2edXjwGmFOOqP4AgS1P4/Y9z8Fg7Ga55758bwE=;
        b=kA8LDwEcNVfRYCmHsgaBw8oc6fbC3t0V6Xm6RLF3YKKX26v7l3YuYc0zZL2Bu1dUtG
         oFd37VBXo9uagDop4BURivTkBq5g5AzmyA2e/mRLwu5KtwBR68/fJnx3NNLVhB6RFGdf
         yvXgUYMRb5yw9mtV9ENfrtd1fmlXOcG6/I8H/O9qZsfWlCLL32c5fArtHYmW2ZRZj/LY
         Jx7ERCNrN/Uz0W0+o7RzT/72sXtqoJWq/NXWoq65vhQJ6gdDME2w/T7ZQQrTxDRMQqYe
         n5So4ZuJONVDEKkF78t0g2dgFuud+T43jCs/cYQffzMFWZI2I2fnxdipeC7FVEvzXRNu
         T5+w==
X-Forwarded-Encrypted: i=1; AJvYcCX02Kb3JP9MUCcy24xuVB2N4r+MOdxxsLTa2Jjp1Psx2hKPWCS0A7ROW7zuQ0pJeGIXKeLxwjMHrd21q0M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6GxFxhaXtJnYHZY6TEPdDBNGQiANzrnxx5Kruy9u+Lg4akTLR
	zNxgPxGg7oqkqsfGMRo6ayzch06WMRaSrVEjnEZXhzYW10fAr8KOY+c0dfKgEKXRKkv9q3y2g0H
	KKYtkSos6Vg==
X-Google-Smtp-Source: AGHT+IGNVsuVSkksPsxQ9leFjTvon2JgsNPkZicJCwyJLA7I5bE+HPYfDlveY3Drm+zlsKabaZYyMJGUDsrs
X-Received: from plbp4.prod.google.com ([2002:a17:903:1744:b0:223:225b:3d83])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ed8b:b0:234:b41e:37a2
 with SMTP id d9443c01a7336-234b41e388dmr28095045ad.11.1748382638788; Tue, 27
 May 2025 14:50:38 -0700 (PDT)
Date: Tue, 27 May 2025 14:50:35 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250527215035.187992-1-irogers@google.com>
Subject: [PATCH v2] perf pmu: Avoid segv for missing name/alias_name in wildcarding
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The pmu name or alias_name fields may be NULL and should be skipped if
so. This is done in all loops of perf_pmu___name_match except the
final wildcard loop which was an oversight.

Fixes: c786468a3585 ("perf pmu: Rename name matching for no suffix or wildcard variants")
Signed-off-by: Ian Rogers <irogers@google.com>
Acked-by: Namhyung Kim <namhyung@kernel.org>
---
v2. Rebase resolving merge conflicts, add Namhyung's Acked-by.
---
 tools/perf/util/pmu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
index bc1178234d3b..609828513f6c 100644
--- a/tools/perf/util/pmu.c
+++ b/tools/perf/util/pmu.c
@@ -2143,6 +2143,9 @@ static bool perf_pmu___name_match(const struct perf_pmu *pmu, const char *to_mat
 	for (size_t i = 0; i < ARRAY_SIZE(names); i++) {
 		const char *name = names[i];
 
+		if (!name)
+			continue;
+
 		if (wildcard && perf_pmu__match_wildcard_uncore(name, to_match))
 			return true;
 		if (!wildcard && perf_pmu__match_ignoring_suffix_uncore(name, to_match))
-- 
2.49.0.1204.g71687c7c1d-goog

