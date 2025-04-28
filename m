Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10342101B3
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 21:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745876060; cv=none; b=IDrQ2Bq8QZduLhNldBH8Z8o6BwnDEx/3IG63tM8U+Lv1PTLpxxN3etEJBSlZrLXNqEcy9PvXZyN2eQLwbM8FtRd1w8UACIlR84rDeL7dIWBgm+bHAoqVF/ujEcNjfwQWumzCgvnvkoE2X+fK+jTYK1XCXdGya2oZYqPAPr+lt0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745876060; c=relaxed/simple;
	bh=DT+OD4lOib7IOS4ovH6DPK7Kmbb/+1k3dk49ghgZL+c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=BHLdk9oXETZBRo96ql926s+ghe+uK4wnxFySefpMjad0v8TYHwDm3Y7jkml0qyQkhcziA7rf4MrWj4XG922cnS3sNJrmopQLcj+PhsS/SX3Vcqqy8saCsc3w8PwzqYtTNAvLt0YVQJwxMX7JEccFuFGDwJzB1Mp9ABmqfKsJzko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iyDeuoei; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iyDeuoei"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-af534e796baso2910342a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 14:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745876058; x=1746480858; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fZS1n0db6qQg+ZjsoOF7DP7dvRsPHCjcVpwodHb7LO0=;
        b=iyDeuoeiBIE3A11AODrCjeEk0v5HkkMkYErgZKuSjmqIJeL/ol9cazt7UYj4zyHFYL
         SZp2atfdv+2hrkoeuY1iKEWJ7xchEBqVgn5JVhNDD1FAI+71+WGl0IyRqfDXwPTKUCXK
         wlpRp0gp+B2GetfLSDSoLjEgObDKrp1f0k1agFubhXgX/aS9kVNSqkno1OjcmSWUcF1n
         W+QMOwkl3+UMmGtA1WSMO4PtpIHxoI5vn/vuL7POnk+e8r/qtkBZ8X7PgFdSPGvx2icu
         7Oe4UXVRzPEj4Y81HpzrRzI3qSXEVn/qN/YHXtaxtp3UzuZcFUIEk90BmNybLTRlWmkA
         7Iew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745876058; x=1746480858;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fZS1n0db6qQg+ZjsoOF7DP7dvRsPHCjcVpwodHb7LO0=;
        b=t9jv4AghdO7UCvyKcRQUr3SXzrfNkVqW7JfJyhubWmEsTwShN26EkUG8aAVGw1Xwhk
         x7uyZ06AxTxbdBY/z9WpPMXkIhjM7mIsVpDw6F4XvliAZWTUKLb7EcFg0vTbWGjXmwLG
         aA+zdm9eSIdXVJsmeTXpgynXlhLchv6LUD9xddd8Ip7qf2Gv/WH8caeEtvhGT0hdyuk5
         cRiZpiQZI6Z+z6z62zWYu5DOD//dBlSd4tMRFLfbQJqLO3byB+Z1vKG/ffCGvycby5jG
         p4hQZqPA1WKDy9lrNx0vXa8+JgUI1QgVdmLuPKhkvb6vvUz+Y/KMzrnu4k8Sah8trZlc
         2dJw==
X-Forwarded-Encrypted: i=1; AJvYcCXejZyAczx53EKwv6lwkiqBvxy2xdhyQUJhhUtvcAVrAD1qeNbHQwTFi17TMfo9FOAS+8/6GumSzJzoNio=@vger.kernel.org
X-Gm-Message-State: AOJu0YxThMN4zgUv9FdgQIFO75GS4/r2qUyEZ3qa1AbufS8TKnOzX4fW
	qCllrxgFa5N5l2bj4lmzKxmr95YIEt//QAgTGwKDQO5q/sWojHjLbvAxKLh9Gd+ErMu/93BbIUi
	xSWRLPQ==
X-Google-Smtp-Source: AGHT+IHkMEjq/0HiG7c1pF4ho/tCZ2BXVghAmtjMD8gPiMcgBdq5bmFUEr0M1yJwJEodxrYaR2+ePoOYa5W6
X-Received: from pjxx14.prod.google.com ([2002:a17:90b:58ce:b0:2f7:d453:e587])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2e8f:b0:2ff:71ad:e84e
 with SMTP id 98e67ed59e1d1-30a21550360mr1947861a91.10.1745876057888; Mon, 28
 Apr 2025 14:34:17 -0700 (PDT)
Date: Mon, 28 Apr 2025 14:34:02 -0700
In-Reply-To: <20250428213409.1417584-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250428213409.1417584-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.901.g37484f566f-goog
Message-ID: <20250428213409.1417584-4-irogers@google.com>
Subject: [PATCH v3 3/9] perf build-id: Truncate to avoid overflowing the
 build_id data
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Athira Rajeev <atrajeev@linux.ibm.com>, 
	Kajol Jain <kjain@linux.ibm.com>, Li Huafei <lihuafei1@huawei.com>, 
	"Steinar H. Gunderson" <sesse@google.com>, James Clark <james.clark@linaro.org>, 
	Stephen Brennan <stephen.s.brennan@oracle.com>, Andi Kleen <ak@linux.intel.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Zhongqiu Han <quic_zhonhan@quicinc.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, 
	"=?UTF-8?q?Krzysztof=20=C5=81opatowski?=" <krzysztof.m.lopatowski@gmail.com>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, Zixian Cai <fzczx123@gmail.com>, 
	Steve Clevenger <scclevenger@os.amperecomputing.com>, 
	Thomas Falcon <thomas.falcon@intel.com>, Martin Liska <martin.liska@hey.com>, 
	"=?UTF-8?q?Martin=20Li=C5=A1ka?=" <m.liska@foxlink.cz>, Song Liu <song@kernel.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Warning when the build_id data would be overflowed would lead to
memory corruption, switch to truncation.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/build-id.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/build-id.c b/tools/perf/util/build-id.c
index e763e8d99a43..5bc2040bdd0d 100644
--- a/tools/perf/util/build-id.c
+++ b/tools/perf/util/build-id.c
@@ -951,7 +951,10 @@ bool perf_session__read_build_ids(struct perf_session *session, bool with_hits)
 
 void build_id__init(struct build_id *bid, const u8 *data, size_t size)
 {
-	WARN_ON(size > BUILD_ID_SIZE);
+	if (size > BUILD_ID_SIZE) {
+		pr_debug("Truncating build_id size from %zd\n", size);
+		size = BUILD_ID_SIZE;
+	}
 	memcpy(bid->data, data, size);
 	bid->size = size;
 }
-- 
2.49.0.901.g37484f566f-goog

