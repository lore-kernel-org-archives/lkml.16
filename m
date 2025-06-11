Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0B1226861
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 03:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749613579; cv=none; b=ZJ792ZXG+u5SRFvbkwrjBZ0dOV6hbXgdUuqlO8T+azhMbtprXHvk5vuQxQ83XRJU/D3N+oC2bWT0BRfdGRM6bjAHlvvltVFwRVzonw/vbCzK9H+j6Wp4k1oPRmtqdGHVBsplqmuc0y6/2C/JJZu4IOmR53uIXbHaH0Xev8EJhr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749613579; c=relaxed/simple;
	bh=BtcOquUGwsjRLqbBlkEJh0ol3cqkffLVbzVijupKQ7E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=K9g2EyFy4gRR72jEl5gP30rthxerPE6qKTNR2t0uS8rdy8R36a2RgZZZu0UPCkiLep0H5endSGU76G00kZGU+hdJzNkG8EfzJMMlSjGCPZZ0dxbs0deDLE3dYIeivHX8llxzyimTi1vCxf21un41kBYLhVRm8aaJc5MU8tR13XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y0Xolltx; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y0Xolltx"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-740270e168aso5048873b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 20:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749613576; x=1750218376; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f5Xx6iphroRaR7e/xw5HkqxmSocnFfl7rcbz//2QDaI=;
        b=Y0XolltxE8u9NvLh/vF1sN1DC+/opIMAMguh7FPOeMXxDz4h1l+zfY/escpyrrz8Ax
         PdiR6fehVAhwCltx2YTTMFaHGt+Pl6ZEYtsQxz6UOL6SlTl/GInj+xSkJ5keXbjXBSzE
         a8uZ4G1wWHVL6jZuzv3UVp6ZMJC1UnLvXzA4iMi23FbcUhmxZH7makTK5bXhZ29IXI6V
         +jwJf0DaLTjtlfNKlKG5uedp2I0lil937VpP7XjvbzgJHLCLJKQgoi4RuvRDmPQHtX3X
         QS5LT+MZAb+Mp5htHkuaP1S3XCIvTSGcbrXM6ZOrucAhU95lk8aCdDJJef+HTQyCtr2b
         L73A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749613576; x=1750218376;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f5Xx6iphroRaR7e/xw5HkqxmSocnFfl7rcbz//2QDaI=;
        b=PtBmYu11FWydUv9W6j0yGnpLjVAkJ3UQ9q+zSPdxiCICO9o6s0MLL/CRAgjCc9azVZ
         vboSs66u6xuzCnbg9l56QL+Z7jfa3qoON5/N7ZrdJsU+LIGaRbg2J6Q0sout6/8RqxLj
         LjQsft4Wmz3SPt8Ish7dB4z3nOaXr5I3OeSXlHap+EpnGOfRxYftcxocm2pjemqKj/o5
         j7EBMsJ2KIGBr4fsJwHBnPqnXRLoOV7Q07DWtkEeTFufyh5xJR/5tXhwtDOgdhW2c6oG
         v8Slmvk1ngmgLV+GwXXMnjAovdO1ZwcNZ5EAZ9OUQhoLpByIxHUMFE8CC/b+ucsX3XgI
         F0Eg==
X-Forwarded-Encrypted: i=1; AJvYcCVBjCPNH5cgIGHeM7fqkTfuua5n/ZB/e6UOWHsNB1dwymAdse4F/D8/IFfJE1MRMVRSg640yj+ecUM2Vkc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7FK5548LudR702ysHfkEu56+IG9vkDJocSZLjEP89um/S1ZAo
	yUFipauElLYkc2GOFi9XR0iAm8Sa4rmKrtofmy2MgcsB38e+TSRF7YSIcth+cBGe4uPPXsS5Axz
	LOluAiqXCkg==
X-Google-Smtp-Source: AGHT+IFQVZM1IhRDpBF2ZYGc8nNH0F8JFzlu7zx3JEGYRdMi0czqCNaqZ9Jj8ehUm/ulZYPW7648pVCmdnF/
X-Received: from pgbfe4.prod.google.com ([2002:a05:6a02:2884:b0:b2f:a049:b765])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:9149:b0:21f:5674:3dd8
 with SMTP id adf61e73a8af0-21f866f2d63mr3054859637.26.1749613576027; Tue, 10
 Jun 2025 20:46:16 -0700 (PDT)
Date: Tue, 10 Jun 2025 20:45:17 -0700
In-Reply-To: <20250611034529.508842-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250611034529.508842-1-irogers@google.com>
X-Mailer: git-send-email 2.50.0.rc0.642.g800a2b2222-goog
Message-ID: <20250611034529.508842-4-irogers@google.com>
Subject: [PATCH v1 03/15] perf python: In str(evsel) use the evsel__pmu_name helper
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, James Clark <james.clark@linaro.org>, 
	Xu Yang <xu.yang_2@nxp.com>, John Garry <john.g.garry@oracle.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Howard Chu <howardchu95@gmail.com>, 
	Weilin Wang <weilin.wang@intel.com>, Thomas Richter <tmricht@linux.ibm.com>, 
	Andi Kleen <ak@linux.intel.com>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
	Gautam Menghani <gautam@linux.ibm.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The evsel__pmu_name helper will internally use evsel__find_pmu that
handles legacy events, extended types, etc. in determining a PMU and
will provide a better value than just trying to access the PMU's name
directly as the PMU may not have been computed.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/python.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/tools/perf/util/python.c b/tools/perf/util/python.c
index 82666bcd2eda..49e1db3feb87 100644
--- a/tools/perf/util/python.c
+++ b/tools/perf/util/python.c
@@ -924,10 +924,7 @@ static PyObject *pyrf_evsel__str(PyObject *self)
 	struct pyrf_evsel *pevsel = (void *)self;
 	struct evsel *evsel = &pevsel->evsel;
 
-	if (!evsel->pmu)
-		return PyUnicode_FromFormat("evsel(%s)", evsel__name(evsel));
-
-	return PyUnicode_FromFormat("evsel(%s/%s/)", evsel->pmu->name, evsel__name(evsel));
+	return PyUnicode_FromFormat("evsel(%s/%s/)", evsel__pmu_name(evsel), evsel__name(evsel));
 }
 
 static PyMethodDef pyrf_evsel__methods[] = {
-- 
2.50.0.rc0.642.g800a2b2222-goog

