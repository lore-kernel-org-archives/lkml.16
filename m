Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82482222D4
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 05:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744002102; cv=none; b=aVFrl/y3kWa2bucoUTBjruTyQq18YdCUJ4aXjqx1D0VPNGdIY/8JyfxbnP7QojXnBxwEkNOcnnnC/P1quvLgqz3hjoMmtH7Pzkkef1Z6y23TzhDK9HByNCIbLk+OSKAKSzxQDmLhuWmnrp+KODRnU0FuhWujK9C95RrNqIz605I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744002102; c=relaxed/simple;
	bh=4/dJlTWkcf5FOf5+oh0Up7fh8r5QO82sMonPjvpz42s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=sGrj0Al0zFuKyvF7Lb11luF7DVr7Bbl5SpzWTeBzuwxeWX6MUeDEuyzo2tUlWl1BSzBiS0qUfiLHXBUhOk4FysZ9xpwZx3G8IehJ4+z4yfg0Cx7oF0mOkITMAgz1LFexqgYf10MQhZhGcLB1TWODwM32+Z1H+KRX78PflC1RZ50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2HyDl5o0; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2HyDl5o0"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-af59547f55bso2382981a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 22:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744002100; x=1744606900; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AtCRHQR2grinPcYBxNOrxZNvf1a5RF1zR0pJL1Q63Gw=;
        b=2HyDl5o0K4GRDnDtVvjgF56pDV3nMhss75zm8m2xqL5vdDp82j6fBhoSqb5ppjSHAw
         AMwFZBcpOtiL0LBIOrT9M9wGGxpSWVVt1aTimsbmWiBynPAgp/MrCmgeCq5UUUI/dBrH
         2VQXNff6Z9GgYVKfh7WFbPPCYoiyNNuPP1NkmFJ8ejOTxiw7Xbp4PiJTLSguKHC0VPyp
         SBuanuhQh07JOweG2pSUGTTDvx9Gdy6CtwOtRE/iHaGg6QySXf0ARezh00c8xmhRV+EO
         aTNFies2yBk47ZLqpk/AdO6aW6w3JVEFef5w3a7XwhNdl3EnGxbQZTjUv+XT7iDM6jy1
         O8CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744002100; x=1744606900;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AtCRHQR2grinPcYBxNOrxZNvf1a5RF1zR0pJL1Q63Gw=;
        b=JvH8XDV4E6yIFwqQLPMHObBoi03ZlsQQRyW0eaBO3ZoIQxTUyTSpojxnbCmkWs9ly9
         Lz8rY4YrGwQEzmtjIjH7xOhl9qYgcKNP8WKTyteQVNffO6GV7wIyDi6Mfi12zwc6sCiy
         mlCqmTx90Rr54RUFLufk1uQS9bE6jyLcMP3m0psyIFCBrQOoSvdgyjSg1TL5wmdBwAWw
         4GG01aQjBqiGtEBJksc38t+2WPs2FlQuDiAiaCHLO3Dks/2Olbg+N5rJxzKkBYo8p2S/
         Kb5prwpNLdNkB7+nG/VFp3ZnXZtzEoBnNAhXM9FpRL1ZmjKKtJ3tHOwvX1fkOdrtkFFE
         0Bmg==
X-Forwarded-Encrypted: i=1; AJvYcCVV6kltq83wiARx+P5JUHqNT3RSyOL4/hGUK3z4s86EHjUUIx6AxAylRvjccvDI87mt40uWETEjp9ofEok=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2HuX27Tj52cdyDN8kbvG03ddECL5o+/57YrDYab6QE/Xibkoj
	s3OOPBzfmPhU1c7I8cA4QGJuj4RmGxypKvIX48V3PxKCM/uNVKpX0ZKleZ708fPEmn1QG82tKRR
	6pKPkgw==
X-Google-Smtp-Source: AGHT+IEjajBXa+ImbR9+M7N6IJYR9vPfq9GEqRJ+O38SQ6pLjk2N6Ar0bQ675WJLx+x+Zi12lyBWB7Q29nuS
X-Received: from pjur7.prod.google.com ([2002:a17:90a:d407:b0:2fc:b544:749e])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:224b:b0:2fe:a742:51b0
 with SMTP id 98e67ed59e1d1-306a4b86c9dmr11892592a91.31.1744002099857; Sun, 06
 Apr 2025 22:01:39 -0700 (PDT)
Date: Sun,  6 Apr 2025 22:01:01 -0700
In-Reply-To: <20250407050101.1389825-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250407050101.1389825-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250407050101.1389825-17-irogers@google.com>
Subject: [PATCH v2 16/16] perf record: Retirement latency cleanup in evsel__config
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Weilin Wang <weilin.wang@intel.com>, 
	James Clark <james.clark@linaro.org>, Xu Yang <xu.yang_2@nxp.com>, 
	John Garry <john.g.garry@oracle.com>, Howard Chu <howardchu95@gmail.com>, 
	Levi Yun <yeoreum.yun@arm.com>, Dominique Martinet <asmadeus@codewreck.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Perf record will fail with retirement latency events as the open
doesn't do a perf_event_open system call. Use evsel__config to set up
such events for recording by removing the flag and enabling sample
weights - the sample weights containing the retirement latency.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/evsel.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/perf/util/evsel.c b/tools/perf/util/evsel.c
index 661a07cbdb25..6a84893e3c58 100644
--- a/tools/perf/util/evsel.c
+++ b/tools/perf/util/evsel.c
@@ -1440,9 +1440,10 @@ void evsel__config(struct evsel *evsel, struct record_opts *opts,
 		attr->branch_sample_type = opts->branch_stack;
 	}
 
-	if (opts->sample_weight)
+	if (opts->sample_weight || evsel->retire_lat) {
 		arch_evsel__set_sample_weight(evsel);
-
+		evsel->retire_lat = false;
+	}
 	attr->task     = track;
 	attr->mmap     = track;
 	attr->mmap2    = track && !perf_missing_features.mmap2;
-- 
2.49.0.504.g3bcea36a83-goog

