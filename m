Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062F12949F7
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 19:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745524723; cv=none; b=QURyzaAnjWu+njJuG46Qx/ri88AkBfxQdybt+yA1B0a70HCQ1hJR6VC4AEM4nhQMwjz9rtFiLzrGq1wW6OO1OK4h8zGqe+CJ1xIWmMg/BHUUBilh8VWkY/yt/wrAgVuBNbso3s+mq4ZJ0JzkOaR6WWLcMQ3fYK1ddT+KM7hp4mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745524723; c=relaxed/simple;
	bh=ZrmbJv1wP81Ikb37sNi/fSdxIlGOQqzFBl/SHVNr6I8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=azXDYUp2ZHpAnlkb/XhG0yudRElnlpA0UdcjyylJyf9uqoWWULaRwLx8w50VH8A8WU8Ic9XP3ikNekp8V+sFr/J7CBAhBI0uOb5jl5HXYzFJg2br7CoSZGGZQuKP5U7u+QC0Q7/KfpVMQRxEjlOUICh7+no1GPgBDukfHdtaFvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UdtFgrVH; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UdtFgrVH"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-736b5f9279cso1269534b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 12:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745524721; x=1746129521; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o0PZ2/PZJEEEZcnWaKrTZF4YzFQpgxmEtQRIBYWzhA0=;
        b=UdtFgrVHFmnk2O71FEXa8K/BUBvuUak0z1oozwFAtv2G/s01z6GlnroH0raO6eUyQr
         y3Okdmx861hzzdZUF7VaozgN/54n9hu4cgBAAstQgVEfLXMavpQ7SeosuifatDLhYzxT
         qX+PY0TzXVqdENq4XjtlScgZ+46CJu75jaPXnjjdtVR/QTPbpR9kE+dNCe4wYcKzYseI
         tCbBKo8qUNGuDLg3RFCX7Mvl7zxxDCf0YMUZwr/ncFYZNmKyxfze7PfuknJhh9VIeAY5
         6ofsEVL6Nqkpzzx1u4P7HTlUew4YeUb5GdojIt04uUY9bbOMkYGtfjqjBQ9gGX4TJqzr
         ZTKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745524721; x=1746129521;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o0PZ2/PZJEEEZcnWaKrTZF4YzFQpgxmEtQRIBYWzhA0=;
        b=cQ9aN88nwmtK0u3P7tBWGpVmZQEkusQm8w4IDRZpF9iDiZJa+s5r9ELRsoEcdLooz0
         j+UnFkCgqaYN+EoXCUTbT0hlM4+qeJhTST4BrgZFuQqe/dZTQYZZVeD0mDsitfYwgUT7
         7rb7ZkfAyc2UoR+0ppHdtUh5PqSyuQJUSq22HYKLcCLB7sAiJTWqr4G+AjIVyOZe/poD
         zz9vtP5XS+fRH3GnBPXtpz050rlcmtN91qHP+mOY3ACSjSXuscaodNPmT1FhHnx2OD8H
         +wx10HLO6otSbSGLJ+VU50gC1GEwFyGU9h6qRpbTBZtJkXnDCchaZC2Ug+yfWOZM5itm
         50aA==
X-Forwarded-Encrypted: i=1; AJvYcCUuhqsapNie3yGEkBC27ybSiX7hIJ2+gO//T3X//zyVDtD49yxY1RdnvKEOHhcujRCrWDV8ZRcDnU/mD9Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzalV/CHyDUiIRTBXJo2aA1s4TP5+JgLqZY7SfTGXrl9Q03t9gm
	mQLrJsYQMIDqbEIP1ZdArTSPzYJYFjhDZqzs7f17LGlnEvLxJxAnalInYtj/M2Q345mg9rxk6g4
	RB8qyaw==
X-Google-Smtp-Source: AGHT+IGL3ZNrz1pe1MwYmQZuoc8g3pcu2bGBqpUvU3O7qAcD+2gzoKVbqzHg1t9Z+jFrCzyjP6JaAGIuv2Z6
X-Received: from pfbhm3.prod.google.com ([2002:a05:6a00:6703:b0:73d:b1c6:c137])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2e1b:b0:736:5dc6:a14b
 with SMTP id d2e1a72fcca58-73e32fe68c5mr1203043b3a.13.1745524721144; Thu, 24
 Apr 2025 12:58:41 -0700 (PDT)
Date: Thu, 24 Apr 2025 12:58:26 -0700
In-Reply-To: <20250424195831.1767457-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250424195831.1767457-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.850.g28803427d3-goog
Message-ID: <20250424195831.1767457-4-irogers@google.com>
Subject: [PATCH v2 3/8] perf build-id: Reduce size of "size" variable
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
2.49.0.850.g28803427d3-goog

