Received: from mail-oo1-f73.google.com (mail-oo1-f73.google.com [209.85.161.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CAA224236
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 18:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743531937; cv=none; b=mjxpEsiKzZP0HkoIHujkgO2acTAcI13zt8rwnXhAgk2kCmOnXCfGkZrxNhKDFUR3iGXz0MmvoPdd8ivhZM9BsVKjnTogHol98QthDVgH7ppfPvTy3kIw5etgVUzCq8wdi0uERjZMRpXa3WZcoQV+uerLiUVF9A/R6XZrGygoHLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743531937; c=relaxed/simple;
	bh=TA9MBJKZGnM8bN2F3H667zTwUG3oMX/UHc/LW06bLSE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=MRFr4+QiYikX5r9BX+opbBeKs8teRqHj3YePane1LbaU3fjuA9o+YBIJLQPYNbiXZLct5x9Ww3N7BI30eQp8s1E+6TXa2nPd6PexLd2zGxC6dhbd+Y5pAb2fKIKubPdTtDV6j1vU2eQcZ9ZZ2wucXUIcU0Hx2xz3nPOvIipQXio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pWwfKJ8f; arc=none smtp.client-ip=209.85.161.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pWwfKJ8f"
Received: by mail-oo1-f73.google.com with SMTP id 006d021491bc7-5fc0058d68eso1710798eaf.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 11:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743531935; x=1744136735; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3QC+vjZ+uxGeny3upI0J2RrDdb+/2bXijdeBhXiDIiY=;
        b=pWwfKJ8fCmN0wtEC5f+Ezggf3fYRDPtOAGJryzgyjIThYQW9S9bJypm7uzPjOlEoaK
         t87yFuu+bgpNBrI94t4+kwSnZHPVgTYop4tWw6epQRaA+NF2a3cY/VYIV3t5NkySU8Xf
         8Vr8WSOn1KKW595FPW1G76h8rjtos8OXZqVaGIax2yzfi7h9kLPAfkzPfJOXpsvt0vtA
         rpLHsYvKfKoPruijBu3NXG7GUoRoUqHKtz6hRVKT1Lq5tSfU244+lKjkK6Mh23sLnNne
         AyVoJYC4DTV3d9ggLD6r1IFVrnUMpR4yK/RjEOR901Lc0p5QY74C5DaLVXoNd+Nex4KH
         GcIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743531935; x=1744136735;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3QC+vjZ+uxGeny3upI0J2RrDdb+/2bXijdeBhXiDIiY=;
        b=dKwFNbK5ydc3gVCk2Has0GJnwO5gUc9W5SUEpDlyYcy0NcKT3bMCa0RbJChSssFRQh
         VdcP9y3qMSbGe6W4Pocb8/XhkNH0Mft+ivIuozu58T15rX9if9EQTu+DMwHaYen6AEaF
         619F35aC3bflDr1zIQVIS8DSdrcbTxXllH4ajT942XOyLo7jjfEHyACPnIr94Qhyk62i
         nhzFZI9ocqZ2AyTkAUOZT0FOKG2pTQDkKC42EyGf87pweJNRP15xLISNM+iNfa6W/70j
         4nFEDE55dfp0ZmNvWq1BwTYcq7rk5PDEEiYINAIVzCTQ32EgHRgT9uZW9NpGm7gIXCIs
         OQ5g==
X-Forwarded-Encrypted: i=1; AJvYcCXSC+pP1cSKY/5qSIKKdiIsupGIdl/dD5qYI+jh7Y/lfQLOzCMs+DQP85M+hFqlLY926l1aW4WeEyKsrDQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWJj53xch5Xe+1ipt4bDUpHNWZkTAD7cZDN0cpJaRQz+FzdPzH
	xwwot0jy1AW32uka53k2iGu8SoHDjNxidwpIih4WtKwul+eJ/RLiJF/gD7bOfee83b5UgTIcGNy
	jlgnyCQ==
X-Google-Smtp-Source: AGHT+IExn2cUPsKHag87+ixWWT8lIhcsbUX86fXDEHLuW52QwQ4G2bpj9G8hgmkcPun76Arl4dDyofdwGznJ
X-Received: from oabhl24.prod.google.com ([2002:a05:6870:1b18:b0:289:d40:52c])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6870:b149:b0:2c2:5c26:2d8e
 with SMTP id 586e51a60fabf-2cbcf51534cmr8318955fac.16.1743531934478; Tue, 01
 Apr 2025 11:25:34 -0700 (PDT)
Date: Tue,  1 Apr 2025 11:23:27 -0700
In-Reply-To: <20250401182347.3422199-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250401182347.3422199-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250401182347.3422199-30-irogers@google.com>
Subject: [PATCH v1 29/48] perf buildid: Silence -Wshorten-64-to-32 warnings
From: Ian Rogers <irogers@google.com>
To: Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, 
	"=?UTF-8?q?Andr=C3=A9=20Almeida?=" <andrealmeid@igalia.com>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	Yicong Yang <yangyicong@hisilicon.com>, Jonathan Cameron <jonathan.cameron@huawei.com>, 
	Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Kyle Meyer <kyle.meyer@hpe.com>, 
	Ben Gainey <ben.gainey@arm.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	Kajol Jain <kjain@linux.ibm.com>, Aditya Gupta <adityag@linux.ibm.com>, 
	Eder Zulian <ezulian@redhat.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	Kuan-Wei Chiu <visitorckw@gmail.com>, He Zhe <zhe.he@windriver.com>, 
	Dirk Gouders <dirk@gouders.net>, Brian Geffon <bgeffon@google.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, Howard Chu <howardchu95@gmail.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Colin Ian King <colin.i.king@gmail.com>, 
	Dominique Martinet <asmadeus@codewreck.org>, Jann Horn <jannh@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Yang Jihong <yangjihong@bytedance.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Andi Kleen <ak@linux.intel.com>, Graham Woodward <graham.woodward@arm.com>, 
	Ilkka Koskinen <ilkka@os.amperecomputing.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Zhongqiu Han <quic_zhonhan@quicinc.com>, 
	Hao Ge <gehao@kylinos.cn>, Tengda Wu <wutengda@huaweicloud.com>, 
	Gabriele Monaco <gmonaco@redhat.com>, Chun-Tse Shao <ctshao@google.com>, 
	Casey Chen <cachen@purestorage.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
	Li Huafei <lihuafei1@huawei.com>, "Steinar H. Gunderson" <sesse@google.com>, Levi Yun <yeoreum.yun@arm.com>, 
	Weilin Wang <weilin.wang@intel.com>, Thomas Falcon <thomas.falcon@intel.com>, 
	Thomas Richter <tmricht@linux.ibm.com>, Andrew Kreimer <algonell@gmail.com>, 
	"=?UTF-8?q?Krzysztof=20=C5=81opatowski?=" <krzysztof.m.lopatowski@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Jean-Philippe Romain <jean-philippe.romain@foss.st.com>, Junhao He <hejunhao3@huawei.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Xu Yang <xu.yang_2@nxp.com>, 
	Steve Clevenger <scclevenger@os.amperecomputing.com>, Zixian Cai <fzczx123@gmail.com>, 
	Stephen Brennan <stephen.s.brennan@oracle.com>, Yujie Liu <yujie.liu@intel.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

The clang warning -Wshorten-64-to-32 can be useful to catch
inadvertent truncation. In some instances this truncation can lead to
changing the sign of a result, for example, truncation to return an
int to fit a sort routine. Silence the warning by making the implicit
truncation explicit.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-buildid-cache.c | 2 +-
 tools/perf/builtin-buildid-list.c  | 2 +-
 tools/perf/util/build-id.c         | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/perf/builtin-buildid-cache.c b/tools/perf/builtin-buildid-cache.c
index b0511d16aeb6..7f7ebd625ed6 100644
--- a/tools/perf/builtin-buildid-cache.c
+++ b/tools/perf/builtin-buildid-cache.c
@@ -450,7 +450,7 @@ int cmd_buildid_cache(int argc, const char **argv)
 
 		session = perf_session__new(&data, NULL);
 		if (IS_ERR(session))
-			return PTR_ERR(session);
+			return (int)PTR_ERR(session);
 	}
 
 	if (symbol__init(session ? &session->header.env : NULL) < 0)
diff --git a/tools/perf/builtin-buildid-list.c b/tools/perf/builtin-buildid-list.c
index 52dfacaff8e3..ef84d1adb98f 100644
--- a/tools/perf/builtin-buildid-list.c
+++ b/tools/perf/builtin-buildid-list.c
@@ -109,7 +109,7 @@ static int perf_session__list_build_ids(bool force, bool with_hits)
 
 	session = perf_session__new(&data, &build_id__mark_dso_hit_ops);
 	if (IS_ERR(session))
-		return PTR_ERR(session);
+		return (int)PTR_ERR(session);
 
 	/*
 	 * We take all buildids when the file contains AUX area tracing data
diff --git a/tools/perf/util/build-id.c b/tools/perf/util/build-id.c
index e763e8d99a43..6a3ae17b1ccf 100644
--- a/tools/perf/util/build-id.c
+++ b/tools/perf/util/build-id.c
@@ -81,7 +81,7 @@ int build_id__sprintf(const struct build_id *build_id, char *bf)
 		bid += 2;
 	}
 
-	return (bid - bf) + 1;
+	return (int)(bid - bf) + 1;
 }
 
 int sysfs__sprintf_build_id(const char *root_dir, char *sbuild_id)
-- 
2.49.0.504.g3bcea36a83-goog

