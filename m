Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E7220E6F3
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 21:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745876058; cv=none; b=nv4JJ1yvu0ZyeHsyOPbVQ/V/kvdLvitYvxCC6wEM5rA0Wh/UbjYM98IvxkhZX7JO8Vx/0iecuPG6ssGVieagdPkIFqHdRhxsii6vMn/jwu/L3i6BrB5Qz/qE79cXbnycsSKWPoeUUdnx++sphGEWFCJS+frUtzvtWGZdJdmzJrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745876058; c=relaxed/simple;
	bh=sNSKisiG1hdsMeqAXMQnBsbK1CE7qqQDhEcMwAn9yhQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=ccNqEk6h2DG8D3yYrtiYHxbnkjwmGHfP0A/KvKpocFL6mV3r/6ouoM9ibS49QUx67EQb71n0r8iYn9XiCeqIswVyTod5C1dDkPiogbKOjuhaWrhZ224lvR6G4wGNTdSyFmWcrjqgalS/6I3Wwlokc1p9oDsX+RxDR0tD30Gjcp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UVyiYdyO; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UVyiYdyO"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b0f807421c9so2934173a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 14:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745876056; x=1746480856; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X02HQomgxWR3mWoM82/yA1eUjs3APdARyr9edl1ymiY=;
        b=UVyiYdyOSxnDxDu2soqu/hFv1RqnaE3Me/dC+DrXORs6CC9cKsHcWPRyLwdMnHdfHU
         ZyUptv+RZpomP8FJRMSFAeWqa989t3W9qdF20gnD6/VnLb/3zGLFZNqwscFR7Qhx5BJN
         oQ0/d+YNUVL9hH2W0SPQ06vrZc3BYkec9uTRo+OnoKU1rp5N4YmPIYiNrwLqaV5yHv9y
         Q07iVPXf5cdke5QEwv/sohQuObpZRpIQbE9n0h3MV6fYAyAmxvkb3g1I0fellZgJdG1l
         YNVCJ6kKNutLBQwM8eLlYYC/xjytSYz3jZDgrf5KEvVJgMxJGPuHLX+2kS7dgyS3u+44
         1hYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745876056; x=1746480856;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X02HQomgxWR3mWoM82/yA1eUjs3APdARyr9edl1ymiY=;
        b=TmQX33IZ5NGpfG7ZiuBBVHFZokAGx62LA8hbgPUa7aeG06qeyVfr729l9AQdJvJOd6
         nVYbsPID9jkmHA3fNCDv5GIKefz0aWALOYjYunOOwsQftYJHKVSxThCpm3IjJbYVNpx8
         D21jDx23nVaiKEwIWzKgf2voPL6SO0cgNM8e5NKw6IQ637r5EFQ09gkDp6RhP1ayzsi1
         nWn0C/T8oAUXPEcnqnxqywcbms9KFAF44V0YTnAlSckZAK5W/j61r/HkIH+StzXMPQyb
         Kv0a1tVoYQ/g7to8PWkCZ7b4zXizBeb2YpV5kfApQi6ZMATlq2A/sQKmrJPzAjdAh+2M
         S1IA==
X-Forwarded-Encrypted: i=1; AJvYcCWSJS8cboisKP2/pzCln7oVImoiW3mmKluMFOsTjL1TdmjkTYsnTv4/4cPQ4lO2YsnImRpdFciyzlRLx6k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKnWFq38mzakQnL6PS6pw6EA9aUxhsRTMl/OGWaOb1A7vcoROS
	fF0MIh61mqJBw8GsD6SQVXKEq7q/DTVh1XpoUNL78D2zd85S1F3ihrRFz8KHnUcrrTh6RoiV20K
	H5sUiYw==
X-Google-Smtp-Source: AGHT+IG9piqj3ObQ1uyzi2wTg72pEue4UFNXrJZLmUK2OICKb7nWvOBDj/R3L8x9+9AWxEJhOVRnDHHFPirA
X-Received: from pgld6.prod.google.com ([2002:a63:e06:0:b0:b13:7874:b1b3])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:6a03:b0:1f5:80a3:b006
 with SMTP id adf61e73a8af0-2095682bb2dmr953425637.21.1745876056067; Mon, 28
 Apr 2025 14:34:16 -0700 (PDT)
Date: Mon, 28 Apr 2025 14:34:01 -0700
In-Reply-To: <20250428213409.1417584-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250428213409.1417584-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.901.g37484f566f-goog
Message-ID: <20250428213409.1417584-3-irogers@google.com>
Subject: [PATCH v3 2/9] perf build-id: Reduce size of "size" variable
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

Later clean up of the dso_id to include a build_id will suffer from
alignment and size issues. The size can only hold up to a value of
BUILD_ID_SIZE (20) and the mmap2 event uses a byte for the value.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/build-id.h         | 2 +-
 tools/perf/util/synthetic-events.c | 8 ++++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/tools/perf/util/build-id.h b/tools/perf/util/build-id.h
index a212497bfdb0..e3e0a446ff0c 100644
--- a/tools/perf/util/build-id.h
+++ b/tools/perf/util/build-id.h
@@ -13,7 +13,7 @@
 
 struct build_id {
 	u8	data[BUILD_ID_SIZE];
-	size_t	size;
+	u8	size;
 };
 
 struct dso;
diff --git a/tools/perf/util/synthetic-events.c b/tools/perf/util/synthetic-events.c
index 2fc4d0537840..68bb7c5fe1b1 100644
--- a/tools/perf/util/synthetic-events.c
+++ b/tools/perf/util/synthetic-events.c
@@ -2248,7 +2248,9 @@ int perf_event__synthesize_build_id(const struct perf_tool *tool,
 
 	memset(&ev, 0, len);
 
-	ev.build_id.size = min(bid->size, sizeof(ev.build_id.build_id));
+	ev.build_id.size = bid->size;
+	if (ev.build_id.size > sizeof(ev.build_id.build_id))
+		ev.build_id.size = sizeof(ev.build_id.build_id);
 	memcpy(ev.build_id.build_id, bid->data, ev.build_id.size);
 	ev.build_id.header.type = PERF_RECORD_HEADER_BUILD_ID;
 	ev.build_id.header.misc = misc | PERF_RECORD_MISC_BUILD_ID_SIZE;
@@ -2308,7 +2310,9 @@ int perf_event__synthesize_mmap2_build_id(const struct perf_tool *tool,
 	ev.mmap2.len = len;
 	ev.mmap2.pgoff = pgoff;
 
-	ev.mmap2.build_id_size = min(bid->size, sizeof(ev.mmap2.build_id));
+	ev.mmap2.build_id_size = bid->size;
+	if (ev.mmap2.build_id_size > sizeof(ev.mmap2.build_id))
+		ev.build_id.size = sizeof(ev.mmap2.build_id);
 	memcpy(ev.mmap2.build_id, bid->data, ev.mmap2.build_id_size);
 
 	ev.mmap2.prot = prot;
-- 
2.49.0.901.g37484f566f-goog

