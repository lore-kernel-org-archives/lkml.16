Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381391EB18A
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 19:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747684323; cv=none; b=HEUy0Dm2wYvM/aRnVy15sq0HohOJ8nExT4fY5qM7ISLmluxR+PZjwd3zFXXzI6lHl3lkJf1buGzNRVkDXPimoU1e5DhxIZAXP4LCPVhE9mqdzsWsbbjhpxzAxUqHe6G5bvH3+9mXwrr3t67d2j6pkVJZaQOd4O4Y3oRrAuwzIGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747684323; c=relaxed/simple;
	bh=moBbk0e4zwG56wqQUF81dVts+MTk1ZzL4lCGN3wIn8o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VpfnHkT4SPi/JlvgS+dSIdTqAQE3X5ziMMbMU29ZnDrgt6QxLd8jczNUbbs9KBUE3tyJRkfqwybqtWbXq1UvWN2d6X35eJi3JsE1eIrnIYlgTjIfK3L1UX35jmE6PHUKZdL2lLLU0OzLQXQ/FR5cqwga/jEFlDLiHo9ozo8iJH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NJETqKNP; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NJETqKNP"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-22e7e097ef7so35832345ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 12:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747684321; x=1748289121; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KLEswg+2ZvrVLuaVvJaBqbKOECqngCDtBESlmPXVj5E=;
        b=NJETqKNP8/5/a9EMxvxtiUaJmWDegkDzzfPbEZI4DXFm608qlg9J99HvvSU+YcrxCx
         Z0IQkqHcuZRWgPSKs5L59cVwXQ79e57zYNfDz8J8cXcKUTgPwvUl+B3Uer/Am8PRxfiM
         bWmIqkQ8PJUjyqckxfMSLdY9YnENISuW2PSWpLWqPMhQhO3yfbhfnyTU0H73d+veOCXF
         CuP1hPOLKEnsjymUrSzl+43VkNFn9Yw2YPriYjhd0VGR65T/Z1EztrAbkwYMsiKxDtt6
         SlsEAl3kVhKsSeVPy9Yd1ydA9vzABhyzMdGmUvMdEzqAxP83frxrb1g0NzGsFFrJGHRr
         063Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747684321; x=1748289121;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KLEswg+2ZvrVLuaVvJaBqbKOECqngCDtBESlmPXVj5E=;
        b=ub1KXBQzSkADkvkgYnVRwTnfhSo88JfjTG9ITD80OIP6F9L14+frKOTSpQKKw2+2iV
         5lVaeo5pTqK5E2YDOb+TKZ7FOBbb6kc6t1TX9vTHIcYRR+ZT7VDLxsm/1MxkFVRu6can
         2Z16Hnu1vDY775dQ6QDjlYeUDLuOdfss7N1dpz7cvV0yU2fLOZHptgH3Q8Zw2l7xST2l
         3pjvUdyklU3ChIUITzVcoV41K5V6xsRb/eLfMF8jLEWn0iur2YAlf4cwwXyYuP1cmhgU
         qFIm6FOzWCt9OPq2cTNNvWXzyKvfzNtnI1AAWjZh9gJbojdOQ+plleNFS/fHtV5N+tOJ
         rrfA==
X-Forwarded-Encrypted: i=1; AJvYcCUD8TuGo4V1GqjvLIfl4hkrFnKmxqj2vqP00+NlvC7xRewTWzvpxs2MFW7CKfkBE8ZWPlwX/xYZJDJOneY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBbaSfRQx1aoR8g0JRBfujVOZVXjot/+p/XIHQlhbW207HzFcl
	NzQxy2Wj9H2QmXeMmX13B3JRdOSm8p+4KFmZR5b6Ud/I2D40IROiYm4BVFMeeoM/LH/Pb8Y0mo7
	FESZk2VLzTg==
X-Google-Smtp-Source: AGHT+IGiY7OLM1UzxicQml+gH+PtRzbE8+fqCyt/LZBKRCSiwh5xxuwG513k9Tf7aNUBoQ3RvzqhqxPjjUnf
X-Received: from plbma15.prod.google.com ([2002:a17:903:94f:b0:22e:4a61:5545])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1988:b0:21b:d2b6:ca7f
 with SMTP id d9443c01a7336-231de3ada46mr178538855ad.32.1747684321434; Mon, 19
 May 2025 12:52:01 -0700 (PDT)
Date: Mon, 19 May 2025 12:51:38 -0700
In-Reply-To: <20250519195148.1708988-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250519195148.1708988-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250519195148.1708988-2-irogers@google.com>
Subject: [PATCH v3 1/7] libperf threadmap: Don't segv for index 0 for the NULL perf_thread_map
From: Ian Rogers <irogers@google.com>
To: Gautam Menghani <gautam@linux.ibm.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Howard Chu <howardchu95@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Cc: maddy@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"

perf_thread_map__nr returns length 1 if the perf_thread_map is NULL,
meaning index 0 is valid. When perf_thread_map__pid of index 0 is read
then return the expected "any" -1 value. Assert this is only done for
index 0.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/lib/perf/threadmap.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/lib/perf/threadmap.c b/tools/lib/perf/threadmap.c
index 07968f3ea093..3ca9ba4987fc 100644
--- a/tools/lib/perf/threadmap.c
+++ b/tools/lib/perf/threadmap.c
@@ -97,5 +97,10 @@ int perf_thread_map__nr(struct perf_thread_map *threads)
 
 pid_t perf_thread_map__pid(struct perf_thread_map *map, int idx)
 {
+	if (!map) {
+		assert(idx == 0);
+		return -1;
+	}
+
 	return map->map[idx].pid;
 }
-- 
2.49.0.1101.gccaa498523-goog

