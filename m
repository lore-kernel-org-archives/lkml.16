Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E1F25A2A2
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 04:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748493630; cv=none; b=JxGRltD9NeSSkTRjWYFfZCIiJAdZDEe7NCXyWUN44ZUccsEsT0q2/IOs3vJiir3FXFw7k1saQTwSd6OI4NuYFyh6wZd6cKOOcQi6i9gnZMECWumMk/ujboXsw3oinsv4YDzQa7JqjyAXWAQN69D1gXktzbwOEDxjWugD7Roz6pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748493630; c=relaxed/simple;
	bh=6yHwkKq6IIJbldd/zAUEevYoO7xZpmsIHYFkwvK/JAQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=E61GkHm13zfFcqWVnQkCfqWkZNmSslwe7uJMHV0n1IaURHQ1Xb5G1Um8GQtKCCYZUjlNvvsZLykotpyFkAU9L7VX+yTcuIquvWGl3qeVDr0VbgzxLhLnU1Z8k510RcYrmh8G8/qxttO/20N/W7UlHWd2dqJQSrmoNPCUJn0KKMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GNCQXbgg; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GNCQXbgg"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-311dbea6c10so701463a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 21:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748493629; x=1749098429; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZbWFwE3NBJXfenPf6zVpWFqvg1HOaBHgLfR4kbE7bm4=;
        b=GNCQXbggoJ87SHq7Rgkv4ApEGKO+GTyDVvvnA42YNd4p9r6iVY0IxcnihyZ+yQkHXq
         mEQIOFnAeP+qqswB/w1BaxW9v34benJdND6DXpypX7HojagJSeAgLWuIyMM6g2ptTptd
         LE//uJxHbTahWJI52YujY5OcMcCe6O4nqUk/u2xnc46g3LTH7xixSQiR2oACdO1Jsnrj
         mS+3jIv8XQCSwoXs1NjOwQwHbhFt08WnnTMZW58NP7PptU5Bfaql6gcqu4ZW1WHE2pOy
         c+tJJigP87TGOExS0aol/2miz5Is222/pgZzINrTG1nhx8ja9lEQmKIeWUEK5SvKbGri
         /PCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748493629; x=1749098429;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZbWFwE3NBJXfenPf6zVpWFqvg1HOaBHgLfR4kbE7bm4=;
        b=FDig+G/B49puAOQnw74fqWJyBAsZv5pEScDSlS7miMkg5sIdn6F5+fxw30YKU4H61f
         F6Gabi4VITu1lwKkzORtU/Nn9JKRxCHkqHyJLGtMWa5OETzl7JjwXOEzeHxcuQ2kJgrZ
         8qWEiLIIf8Fh7DqC9rGOG2j0MpvFsGx9zrymQRNA5C+3bU7NRltf9s4O/HcOLsD7OGJ9
         T9URZA9ni7oKMx8xsOt15dh88hUcwSxy5PSko+WmVV2zUWzim4cyTIie8Eu1OsjkP/CS
         dvRVXJd6wxht68dUENi7sl1WbIJ+atwdIfljeG8RayHlh08n4lEkJEdujp++NrPSET3P
         DxBQ==
X-Forwarded-Encrypted: i=1; AJvYcCW456B1r6xj5q2qJRt3pz3uMc7iS0eeOf1GqevsbcAaYeoJaz9UfJMvv8M/0BelcmI+VUDKyUQZWl+8HUY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4HItLFoJ9hmS4GN+TFvu96c9mpMrOP4oKngxU5EYyZQITYuA3
	PlIq+eKjiX4NVREwxFOPwT8HKbdmc3nPeoQHpX5G1oJeDThGSJx6PfkS8GJs4fI32miyuHrpUWd
	eTVQn7At0+Q==
X-Google-Smtp-Source: AGHT+IEMJs2IOOlHldXp9wTZAIVeYOWli7dpE37barkrgzVYs9ce83S04oJICPcjWW3vQ4qCtwTAbu1x11ne
X-Received: from pjbph15.prod.google.com ([2002:a17:90b:3bcf:b0:2f9:dc36:b11])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3d87:b0:311:df4b:4b81
 with SMTP id 98e67ed59e1d1-3121dc9d6c3mr1350848a91.25.1748493628616; Wed, 28
 May 2025 21:40:28 -0700 (PDT)
Date: Wed, 28 May 2025 21:39:47 -0700
In-Reply-To: <20250529044000.759937-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250529044000.759937-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250529044000.759937-12-irogers@google.com>
Subject: [PATCH v4 11/24] perf session: Add an env pointer for the current perf_env
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Colin Ian King <colin.i.king@gmail.com>, 
	Andi Kleen <ak@linux.intel.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Graham Woodward <graham.woodward@arm.com>, Ilkka Koskinen <ilkka@os.amperecomputing.com>, 
	Zhongqiu Han <quic_zhonhan@quicinc.com>, Yicong Yang <yangyicong@hisilicon.com>, 
	Athira Rajeev <atrajeev@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, 
	Li Huafei <lihuafei1@huawei.com>, "Steinar H. Gunderson" <sesse@google.com>, 
	Stephen Brennan <stephen.s.brennan@oracle.com>, Chun-Tse Shao <ctshao@google.com>, 
	Yujie Liu <yujie.liu@intel.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, Levi Yun <yeoreum.yun@arm.com>, 
	Howard Chu <howardchu95@gmail.com>, Weilin Wang <weilin.wang@intel.com>, 
	Thomas Falcon <thomas.falcon@intel.com>, Matt Fleming <matt@readmodwrite.com>, 
	Veronika Molnarova <vmolnaro@redhat.com>, 
	"=?UTF-8?q?Krzysztof=20=C5=81opatowski?=" <krzysztof.m.lopatowski@gmail.com>, Zixian Cai <fzczx123@gmail.com>, 
	Steve Clevenger <scclevenger@os.amperecomputing.com>, Ben Gainey <ben.gainey@arm.com>, 
	Chaitanya S Prakash <chaitanyas.prakash@arm.com>, Martin Liska <martin.liska@hey.com>, 
	"=?UTF-8?q?Martin=20Li=C5=A1ka?=" <m.liska@foxlink.cz>, Song Liu <song@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Initialize to `&header.env`. This will later allow the env value to be
changed.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/session.c | 3 ++-
 tools/perf/util/session.h | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/session.c b/tools/perf/util/session.c
index d3888b78ed50..3af518243daf 100644
--- a/tools/perf/util/session.c
+++ b/tools/perf/util/session.c
@@ -155,6 +155,7 @@ struct perf_session *__perf_session__new(struct perf_data *data,
 			     ordered_events__deliver_event, NULL);
 
 	perf_env__init(&session->header.env);
+	session->env = &session->header.env;
 	if (data) {
 		ret = perf_data__open(data);
 		if (ret < 0)
@@ -2746,5 +2747,5 @@ int perf_session__dsos_hit_all(struct perf_session *session)
 
 struct perf_env *perf_session__env(struct perf_session *session)
 {
-	return &session->header.env;
+	return session->env;
 }
diff --git a/tools/perf/util/session.h b/tools/perf/util/session.h
index e7f7464b838f..088868f1004a 100644
--- a/tools/perf/util/session.h
+++ b/tools/perf/util/session.h
@@ -45,6 +45,8 @@ struct perf_session {
 	struct perf_header	header;
 	/** @machines: Machines within the session a host and 0 or more guests. */
 	struct machines		machines;
+	/** @env: The perf_env being worked with, either from a data file or the host's. */
+	struct perf_env		*env;
 	/** @evlist: List of evsels/events of the session. */
 	struct evlist	*evlist;
 	/** @auxtrace: callbacks to allow AUX area data decoding. */
-- 
2.49.0.1204.g71687c7c1d-goog

