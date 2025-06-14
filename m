Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB745680
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 00:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749861673; cv=none; b=B731zBq2scmm5KTiyIWwGLZcnXRxtwmDohspgKhz8mIeWMq6yWdDTpAzCWxdzIehUXiBc5aJIJh9ghNIsM5czkNgv/DArg5SqCN604rw09i10SkMshFJEvWpaEsR6nH30wctfwvdxJ17O4PhqnS02h5Ls5aaoavyU2Or5k0IPQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749861673; c=relaxed/simple;
	bh=hH5vIPdTCQff8gwOm6etCU6s/IbLP6xIsPkR6QvOXa4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Content-Type; b=LhYBcCzpn+Z4Etjz34l+9YsUh+JlJUcErrJCohgo+MBDrhcYjk9I1+BJuRFkOfcpjjJOm0YcuffmjBePfav8zPrruNvUyVtI+eX/bxSJVbmZSHo8HOrT4age1XL3xUQWM0r1YBbifVxwlCkHphxDe9zmBzVoeXdBxQaVJDFEX+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MIXnpKci; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MIXnpKci"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b1ffc678adfso1664169a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 17:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749861671; x=1750466471; darn=vger.kernel.org;
        h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gIpeoLgx1K21dRmhAOymx8G2jElFSvxUENOQocYBfZ0=;
        b=MIXnpKciWfQvwDzJ4FRhGgZ0P+wkbarV0BbGJBjozrysu/jlXCb423kMNuYTLk+RG1
         te1t3KtzCAOZXQv+tWeuFo4avAEBgu85ISXPGo7Bzs6fXklKF0PZpgownx1sxi2aBmiU
         0pshQ4jiqZYy73zT8wgeJfj8VXtcgfaavB920ISOTe7QQ3/OXsslmTaLp1uvShrlr6jd
         U9NUWUNJXllbMESPJQk6chuAoZiubgwR7DNEnDkg9Q5Yrr4fArkpYMqcGgHkDWVVWjGs
         0LaxcEYLgyxkGFE0ucGurzyh5rwzNejA8+4TiHzKYoMGBG+SeqUxndLFUjwCHEmk/GsN
         QYhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749861671; x=1750466471;
        h=to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gIpeoLgx1K21dRmhAOymx8G2jElFSvxUENOQocYBfZ0=;
        b=sX3N9HieCRCsW5p4m1JuymlGVoIaPaPispK3750hVxnctlN7vjGyq3v6kVBBe1TLKd
         x7th9GdgkBZ0fwXyiDl3Aknd09upTgX72gVvup8taWThW1Cfcj8RhCiKyPbkT7ExUX+o
         w4rVK6iE7hXSHz7Z2VeKoypOOCt+V5M++Ffa9wDCFQD4FuM+RM/EiI7ha23GVRVi43hs
         p53SnzFVWwWutjsiECc/3QSWLPHqp8eJW7GSloMit8OrAnGkLIS+wmtIFzkQ0P0h87zR
         luk1J3akG8QM7/0qd+QWssKs9HLTyXh1GjnzXJHTzjykong7l1pmQyAL3IXM/qqrMkjy
         L2eg==
X-Forwarded-Encrypted: i=1; AJvYcCV+wFESrnMazmV7witmKg1EpLDtP9gAFg6sXY0nEypXJI8T/BECoPinqnMWJrq7zk7vCnA+DV6hFVe9yYo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBl33aese6NY1M20MTWCwgVW/b1dIAYn4ovbU0dfgTOmMDgR2E
	z7EycOVyB2l8GOG5MeA1pu05s6rrUDP6EbRyjTjhMDwVQVyzJVQVOX+h1ZGIylpMF3u9JUCq49o
	Soa7K6QtroA==
X-Google-Smtp-Source: AGHT+IGmKPJfsPCnvNpuOKHgItgWUFCp+xTyjx33g6KS/Q9Z5ioZMSCkxxEO5LmKd1BvAO1c4Fp3J/S/dn0R
X-Received: from pgbfy9.prod.google.com ([2002:a05:6a02:2a89:b0:b2c:374b:9e48])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:158b:b0:21f:994e:7355
 with SMTP id adf61e73a8af0-21fbd668cf5mr2044481637.36.1749861671333; Fri, 13
 Jun 2025 17:41:11 -0700 (PDT)
Date: Fri, 13 Jun 2025 17:41:04 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250614004108.1650988-1-irogers@google.com>
Subject: [PATCH v1 1/4] perf test: Directory file descriptor leak
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Michael Petlan <mpetlan@redhat.com>, 
	Andi Kleen <ak@linux.intel.com>, Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add missed close when iterating over the script directories.

Fixes: f3295f5b067d ("perf tests: Use scandirat for shell script finding")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/tests-scripts.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/perf/tests/tests-scripts.c b/tools/perf/tests/tests-scripts.c
index 1d5759d08141..3a2a8438f9af 100644
--- a/tools/perf/tests/tests-scripts.c
+++ b/tools/perf/tests/tests-scripts.c
@@ -260,6 +260,7 @@ static void append_scripts_in_dir(int dir_fd,
 			continue; /* Skip scripts that have a separate driver. */
 		fd = openat(dir_fd, ent->d_name, O_PATH);
 		append_scripts_in_dir(fd, result, result_sz);
+		close(fd);
 	}
 	for (i = 0; i < n_dirs; i++) /* Clean up */
 		zfree(&entlist[i]);
-- 
2.50.0.rc1.591.g9c95f17f64-goog

