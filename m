Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97891E47A3
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 05:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750050942; cv=none; b=AqWhtAxIKz46Yc/o1xbxobmoYRWTPe2ka13fvGv6cIuGijrdXtbO9ymvmrLB4IyyfrxhKlAqD3aTKg0B0n+d0nEH4F8/10KlWx4zImFQLmoWBUtS7hSWWhHvlpn571xwucY4cd2YRAmVf5+Ysp0wxktH5aWC5g++4QgdLYPL2XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750050942; c=relaxed/simple;
	bh=zZY5QdAaatWoVBW7I7LQ11kD76DX+GBxtTOi8p7XfOs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=iXoEhtIXyLPSXPnypwD/q0y0ExcMUESHzvBD2M0OZviWDyumjIKeY6h7BLnV8p60VZmoI6lUGR2xM4IedBHc0wCnIPFDRbojjMkfrPeBm1Z4vja7ODK+DrG7LhH9Kbmepyo0meu+bQQIuKEL4w5zB0/cWuXSFHGRZUAImGZPh4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WGJMyN2k; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WGJMyN2k"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b2eeff19115so5273962a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 22:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750050940; x=1750655740; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TPESPEzAQJj2q7drTkMDX/Th9kHricV7LFea55YSIjA=;
        b=WGJMyN2kAFztVPM0q8EEUB+VNz6M5wFwR65nz9skEk0KvUKFtDZtpLL2doUShTfkac
         cGELlrg7MwJslCX2kU16P8YkqGzWy3TJUNCISIY4J/oZy8sST+7+B76nDhKiMsKtDKFE
         eMY3qMM/BZhMkI45cIiwWVXcdTMhPYQ3dz4joCm1JChY7qkmGg3vjRVEEJmcJQn7XG1N
         DdzEZQF66uN1XEXcvCcA4wbBDGBIi8TE1M/5Nxk94WrEKzoJFzjdmJtf41fO51DTZpbD
         /TINIdPTuYMbfBtCQtpgJZhL64bHTwGOlR1vuoS6Xm8dkXZfL3nlqOYggVvzcQfAO9nS
         PgYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750050940; x=1750655740;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TPESPEzAQJj2q7drTkMDX/Th9kHricV7LFea55YSIjA=;
        b=RVT78v+nmyYTYwq9BorXskGJT+uegSCUkpX5BUT6GLvY2HLj6LWGq6ojAC1b9goPGD
         jthafv7nXfHurc5bHIsZxslZukMe6F8TYJiXRW2RwqyD7mHH+gwHkLeBnobF7iXRWFve
         QdFqX9LyDB2yYh2V+bh3DSWX/zIKQDYAvbpZs1VZe29gJCF0RjMiyXb2G0+wAwu+1f+M
         KmXMtOdua/sLVnl+akZ/PYKN41Zj9CaeBumchOOoZ8TBkmeUbw7LJkMFXJsGD8IeJW2R
         hesSQYDQvUOJFTW7mRicjI2vCngxOp+6s46bcHyiw8lIiweu7LUT6CFaiX3gYvqkN1j2
         D38w==
X-Forwarded-Encrypted: i=1; AJvYcCXvOPibn7iw/2ywK9JmpK31Sg8cKbGkxGsTZNAy1uH94ZTn4496mypI52S50Dy4sOEaNXJyGpkyGLn2oIQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0AInXuDh4jluiV2KmZtlwQ1+4ZamVbWVvRTlBEQzXUynH9hyB
	b49o0oE2/UveJgwva+Wr2g0vdo7pUn+X5VSpJtm4OunRRpUNsb98woMzKjhCRkUFVzteSa2kSvY
	O7v9Tgl3jSg==
X-Google-Smtp-Source: AGHT+IEqUCk6kDNnznwLR7QswDVgEKNTjE47vrZVlVegCSdLW0pjKFX8we9erSxwtSxzpV8I2/gJIE8scUhO
X-Received: from pgbfe2.prod.google.com ([2002:a05:6a02:2882:b0:b2c:3c0e:f01c])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:7a90:b0:1f5:70d8:6a98
 with SMTP id adf61e73a8af0-21fbd295a7fmr11528932637.0.1750050940348; Sun, 15
 Jun 2025 22:15:40 -0700 (PDT)
Date: Sun, 15 Jun 2025 22:14:52 -0700
In-Reply-To: <20250616051500.1047173-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250616051500.1047173-1-irogers@google.com>
X-Mailer: git-send-email 2.50.0.rc2.696.g1fc2a0284f-goog
Message-ID: <20250616051500.1047173-8-irogers@google.com>
Subject: [PATCH v3 07/15] perf python: Add function returning dictionary of
 all events on a PMU
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

Allow all events on a PMU to be gathered, similar to how perf list
gathers event information.

An example usage:
```
$ python
Python 3.12.9 (main, Feb  5 2025, 01:31:18) [GCC 14.2.0] on linux
>>> import perf
>>> for pmu in perf.pmus():
...   print(pmu.events())
...
[{'name': 'mem_load_retired.l3_hit', 'desc': 'Retired load instructions...
```

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/python.c | 67 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/tools/perf/util/python.c b/tools/perf/util/python.c
index 33b23d56dfb1..f86a82548636 100644
--- a/tools/perf/util/python.c
+++ b/tools/perf/util/python.c
@@ -648,6 +648,67 @@ static PyObject *pyrf_pmu__name(PyObject *self)
 	return PyUnicode_FromString(ppmu->pmu->name);
 }
 
+static bool add_to_dict(PyObject *dict, const char *key, const char *value)
+{
+	PyObject *pkey, *pvalue;
+	bool ret;
+
+	if (value == NULL)
+		return true;
+
+	pkey = PyUnicode_FromString(key);
+	pvalue = PyUnicode_FromString(value);
+
+	ret = pkey && pvalue && PyDict_SetItem(dict, pkey, pvalue) == 0;
+	Py_XDECREF(pkey);
+	Py_XDECREF(pvalue);
+	return ret;
+}
+
+static int pyrf_pmu__events_cb(void *state, struct pmu_event_info *info)
+{
+	PyObject *py_list = state;
+	PyObject *dict = PyDict_New();
+
+	if (!dict)
+		return -ENOMEM;
+
+	if (!add_to_dict(dict, "name", info->name) ||
+	    !add_to_dict(dict, "alias", info->alias) ||
+	    !add_to_dict(dict, "scale_unit", info->scale_unit) ||
+	    !add_to_dict(dict, "desc", info->desc) ||
+	    !add_to_dict(dict, "long_desc", info->long_desc) ||
+	    !add_to_dict(dict, "encoding_desc", info->encoding_desc) ||
+	    !add_to_dict(dict, "topic", info->topic) ||
+	    !add_to_dict(dict, "event_type_desc", info->event_type_desc) ||
+	    !add_to_dict(dict, "str", info->str) ||
+	    !add_to_dict(dict, "deprecated", info->deprecated ? "deprecated" : NULL) ||
+	    PyList_Append(py_list, dict) != 0) {
+		Py_DECREF(dict);
+		return -ENOMEM;
+	}
+	Py_DECREF(dict);
+	return 0;
+}
+
+static PyObject *pyrf_pmu__events(PyObject *self)
+{
+	struct pyrf_pmu *ppmu = (void *)self;
+	PyObject *py_list = PyList_New(0);
+
+	if (!py_list)
+		return NULL;
+
+	if (perf_pmu__for_each_event(ppmu->pmu,
+				     /*skip_duplicate_pmus=*/false,
+				     py_list,
+				     pyrf_pmu__events_cb) != 0) {
+		Py_DECREF(py_list);
+		return NULL;
+	}
+	return py_list;
+}
+
 static PyObject *pyrf_pmu__repr(PyObject *self)
 {
 	struct pyrf_pmu *ppmu = (void *)self;
@@ -658,6 +719,12 @@ static PyObject *pyrf_pmu__repr(PyObject *self)
 static const char pyrf_pmu__doc[] = PyDoc_STR("perf Performance Monitoring Unit (PMU) object.");
 
 static PyMethodDef pyrf_pmu__methods[] = {
+	{
+		.ml_name  = "events",
+		.ml_meth  = (PyCFunction)pyrf_pmu__events,
+		.ml_flags = METH_NOARGS,
+		.ml_doc	  = PyDoc_STR("Name of the PMU including suffixes.")
+	},
 	{
 		.ml_name  = "name",
 		.ml_meth  = (PyCFunction)pyrf_pmu__name,
-- 
2.50.0.rc2.696.g1fc2a0284f-goog

