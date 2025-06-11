Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF9E1F758F
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 16:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749657738; cv=none; b=Dx0DkT8ZogiOwOOi+Y18zyrl+JEmC0bqmpqQvPQHzoPS12cLlWH1A3w9h6jrR+DEVng9fnsrtSOopcHnKCYk8Hc42FQcaJ0ncWkRmq0kDA8Iy2Dhw6OQkC4ShZ7fCAshgwuf9E3NH1T+MKIFHYb7n9RH/+LPUD2zHoovyyNfN9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749657738; c=relaxed/simple;
	bh=BtcOquUGwsjRLqbBlkEJh0ol3cqkffLVbzVijupKQ7E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=dMoA9KWkrQSb0cZ8FZ6fmkzoHlFlpQKsL4xIkY0Fz4dNWAHpvR2aN3+mH1NEncEd4/zNBfmlMyzaTQMdGqOu51btSFXOSqkXtlSHL7tb8lluGoIt2oqzNBMOs72gCZcFL9jiulKMzyu7+CtKDlI70VOS36JP94SXf0zMWG0+QMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JDVG8Jj9; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JDVG8Jj9"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-31171a736b2so47063a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 09:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749657735; x=1750262535; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f5Xx6iphroRaR7e/xw5HkqxmSocnFfl7rcbz//2QDaI=;
        b=JDVG8Jj9czLp/CnLnASeHVrvcEO0yQJ6PJPBZmcO1G7uNIWEdNkvMTQzUOQeRhpzC8
         Rv/EFe0mmP1A4KT2gfURIWDsVCDsp5EZBvVmbcr4FFxhUj2vQi64ZqV4cMFcucLWkb8B
         xy6PdhXIkmY/ePm6aGB09pm+KFF9OLpQDNR3q3RhTL30k+Ce3XJllvGGU4hB5xRUEJU9
         b3+CmI7l6CPaIcNVS7vW0KjarlIvFkvV7os/uKdc1aT2MUfmibQL+YsGCyzJErSnO9ey
         TYgHzGdNx5etNqR4qzgi9pMvhVO1oqjJhvERLDjwZfUTXqwyx0UUdCfJmjcMlfJcfThu
         adjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749657735; x=1750262535;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f5Xx6iphroRaR7e/xw5HkqxmSocnFfl7rcbz//2QDaI=;
        b=FXVJYUcbgdDbk5g1lZCFgAwGgV4Kd1Nyj7FK9K0xDZk/IICaPPkCdatNVLz5MNb0TR
         SXhPmM/NluSsMg8ePxwr90Jyptd91o46kW792mXnO1hK29WRMMGfpdq8i/IwawJ10gID
         cnGEWSpvmrFEhAzXmmDXKs9qQ8yBBETikT1HE+oUgjZdaP/ULBh3Lw7+FEGOhbjBlaE7
         FY+dpNFoXGLf127521HSsYT1JD2yRVaNjZbS29Wcfk+QeKZrpxeXRDT+xSk+CVrgz2/B
         zpg5bVdNYs9TLqm4LEJnrDnK/xcAQwCGriQRFML6BBNGaFTUbQn2RcP7Ttcadsj+jjAq
         8WAg==
X-Forwarded-Encrypted: i=1; AJvYcCV2otFm/BD4S/49X6Smu4kE6N+M/viiWh3iGbZ+3mH9r0UCKpBbxtu3C68P7cfffLV05C5tmc/oW5zhoGw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTgQ7cXJJ8tIFZkExHNKjf1Lu59stvX0XqxL8uix5R3Z41kfla
	90daIbHv2BD02MXGijMZKAOQfLyMXvErzirjNLXgtdvvNIObnnpn7xSYtmJ1NgTAPOlDhSD1okE
	kA3sCoSwRaA==
X-Google-Smtp-Source: AGHT+IFAkRbgSlWhSoM6PRzyRRiPAqWwAEoNMW5/8t9gaYd2P64BUSTvoB7DysOP5MYkv1aet9iGtDpbV1+3
X-Received: from pjq7.prod.google.com ([2002:a17:90b:5607:b0:311:462d:cb60])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1dd2:b0:312:959:dc41
 with SMTP id 98e67ed59e1d1-313af264ec6mr5574694a91.27.1749657735660; Wed, 11
 Jun 2025 09:02:15 -0700 (PDT)
Date: Wed, 11 Jun 2025 09:01:54 -0700
In-Reply-To: <20250611160206.552030-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250611160206.552030-1-irogers@google.com>
X-Mailer: git-send-email 2.50.0.rc0.642.g800a2b2222-goog
Message-ID: <20250611160206.552030-4-irogers@google.com>
Subject: [PATCH v2 03/15] perf python: In str(evsel) use the evsel__pmu_name helper
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

