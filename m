Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48EE213E66
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 19:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747684335; cv=none; b=sB9coN3CG30OSwaFRn7Lbhdo/PKxKWVOe6MpUQVUbOo9in2OC38IJ0pzw9s5DW+6+Sj+m/EDH84NA7boVV0eOJkgVkycBqe/YPS2bxQ9NbWNoehfCr4ojcLgAsQY6awqSDptzGVpM0f/9uJ7HtSXypeWGSt5tsE2jPSHlUeW3/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747684335; c=relaxed/simple;
	bh=vYKZ7UU3d6W0XWpUl3LQ77RivMsd/ygLc7/+TypmMX0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Hy8acGzjmbZfkr4B6+vNOr71IFuHQcPhZSp1SxADuJtR21irIt3NbFW5Ku6QWAxlKEzaF9V+XPmqzJAbGXPNsM7l9jcmyfjerG1FNxJME/WF4PzqmFZk1WYl5rd/qPdk2blH5w09hq4xIE6TroPbDQe90cmtv3xra2BOcdFyAaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GwmtWyIW; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GwmtWyIW"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-22e7e097ef7so35833175ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 12:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747684333; x=1748289133; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FgAhtpYqG4jLSkLI7df7b5Hm2UBWO/lbheIxXFEUD3s=;
        b=GwmtWyIWTwpwQ0RmN6Xb1ctrI98ZJ3Yz4cNY9X+RPLXWAIrqvZ/61p49+H2tO0A9vB
         0j1XUaZFQlTxzlwbn/Cdc3n66Kkh6QTzRr1RA2pqzLNah9in5KU3bB7Ep9Y7n8TnE3eL
         KHEvwwh+Gqo0EaKUfCxpsjbZqo1FBBN0eoJtWBXCa5dcG1F9AuqT+nl0stIRqixesAKS
         8LpofQ1hc9C2wDVQI4ww7UE/JG5ku7nL/hzMxYSt8ZrtrhLsxPQN1EzULJ2t4TfMeMTY
         ONS9TmPc1QglS6iJMggTFYMhzNsaEGv9YF3FoR/2zKQL49JlWNCMITAQFVYxDSmIq5XD
         nZnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747684333; x=1748289133;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FgAhtpYqG4jLSkLI7df7b5Hm2UBWO/lbheIxXFEUD3s=;
        b=qLKhmbrQUlMbg4rK1rOlbYDXE1/nddJlEy0Vy3PGCE1bjAyFjW8QQuIr0Js2zfIiGi
         iMXD8y/SQambVmvRFHWXJghL+KLEJCJbonPwJUoAQLVaYVkpdfjVcDRwof7Lu8Msg4IW
         xTeyFzPhUXbAk3/K3RgWSyxoWpRNlEBZhRnOYHObZzkhr7HcS7XVu0pwgNrqLTaASVsI
         KZFspyU/XCU2khhvPpOmXkQ9vgpoOvApkp85s0IxRqFKzX6mSWyOX635j1PBWqT6xhYU
         8z/uvRXe96afuMNwZD/odraeZB06fK6rUNBJhh5tMnNFfFVOZczv1IR1rz81yL0HsYKw
         WrTA==
X-Forwarded-Encrypted: i=1; AJvYcCUaiWQEpVwHoAOKZTAIv30IozyggypaIztMZ2gbXbHf+UqDYpOQ8ZHHeSerOJbgxZX746gCrk/Fxc2U2P4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOxjM8EDN6yQeLYUKlcUd9IiRMDYx6n92H8pkO2sBAfgK8ttxV
	rvDOMUUKmmUaTs0qiGnZOnZPWoN85PTp2XpoUh3nrG4JfsMXYELzw8BwrPrOa+Ip53QJZ+bDdDV
	W8mqGsiofgw==
X-Google-Smtp-Source: AGHT+IH1kT3MN3SYAmc8uUe08DCjTdzbnCvrlmmF/wDovWUwVi+lLGNVgvguJC9H+PaoKTd+AZaNUwKtVAd6
X-Received: from plblm14.prod.google.com ([2002:a17:903:298e:b0:220:ca3c:96bc])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:fc46:b0:231:cb8e:472e
 with SMTP id d9443c01a7336-231de3b9eedmr194639595ad.46.1747684333058; Mon, 19
 May 2025 12:52:13 -0700 (PDT)
Date: Mon, 19 May 2025 12:51:40 -0700
In-Reply-To: <20250519195148.1708988-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250519195148.1708988-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250519195148.1708988-4-irogers@google.com>
Subject: [PATCH v3 3/7] perf python: Add evsel cpus and threads functions
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

Allow access to cpus and thread_map associated with an evsel.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/python.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/tools/perf/util/python.c b/tools/perf/util/python.c
index f3c05da25b4a..ead3afd2d996 100644
--- a/tools/perf/util/python.c
+++ b/tools/perf/util/python.c
@@ -781,6 +781,27 @@ static PyObject *pyrf_evsel__open(struct pyrf_evsel *pevsel,
 	return Py_None;
 }
 
+static PyObject *pyrf_evsel__cpus(struct pyrf_evsel *pevsel)
+{
+	struct pyrf_cpu_map *pcpu_map = PyObject_New(struct pyrf_cpu_map, &pyrf_cpu_map__type);
+
+	if (pcpu_map)
+		pcpu_map->cpus = perf_cpu_map__get(pevsel->evsel.core.cpus);
+
+	return (PyObject *)pcpu_map;
+}
+
+static PyObject *pyrf_evsel__threads(struct pyrf_evsel *pevsel)
+{
+	struct pyrf_thread_map *pthread_map =
+		PyObject_New(struct pyrf_thread_map, &pyrf_thread_map__type);
+
+	if (pthread_map)
+		pthread_map->threads = perf_thread_map__get(pevsel->evsel.core.threads);
+
+	return (PyObject *)pthread_map;
+}
+
 static PyObject *pyrf_evsel__str(PyObject *self)
 {
 	struct pyrf_evsel *pevsel = (void *)self;
@@ -799,6 +820,18 @@ static PyMethodDef pyrf_evsel__methods[] = {
 		.ml_flags = METH_VARARGS | METH_KEYWORDS,
 		.ml_doc	  = PyDoc_STR("open the event selector file descriptor table.")
 	},
+	{
+		.ml_name  = "cpus",
+		.ml_meth  = (PyCFunction)pyrf_evsel__cpus,
+		.ml_flags = METH_NOARGS,
+		.ml_doc	  = PyDoc_STR("CPUs the event is to be used with.")
+	},
+	{
+		.ml_name  = "threads",
+		.ml_meth  = (PyCFunction)pyrf_evsel__threads,
+		.ml_flags = METH_NOARGS,
+		.ml_doc	  = PyDoc_STR("threads the event is to be used with.")
+	},
 	{ .ml_name = NULL, }
 };
 
-- 
2.49.0.1101.gccaa498523-goog

