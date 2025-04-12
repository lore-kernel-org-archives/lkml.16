Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDE0881E
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 00:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744418833; cv=none; b=bfi+kUpI9vXiWQGY0Y3v5Ucgr3tYN1J1eY9vcUtjsESsaoZbQoj2kW9a0EnoLKo9caScU0Em+5Jk8Tr9T1GKxWk0gX/oJH4bTp6J0SFibsutaSrao9zTmqqiHjtrE6m6us357gnS+yk01jb9xF5r9oU9okxyzRisMU2oAfDY6VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744418833; c=relaxed/simple;
	bh=KDRG+BUxIpW7MqiZAj5b4BCNjSJSRnlOy0XFOZBp0vo=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Content-Type; b=n76KjIm8hCslKsytORJSsa1RNu36+g14v/65ckczyPskSvkvcyLSgJUcngcRJ/JcvSr9BYB8xDJdSEyka7jErKP956wC5negtyBHVYcbROQy/UuQK9oK9H4HTnrmZ+8aDZ4OljqY4SdyrMiPE97b46eqiJf0lh7vyRlncBAxjhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1SwfAZtY; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1SwfAZtY"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-736b22717f1so2285128b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 17:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744418832; x=1745023632; darn=vger.kernel.org;
        h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tHTLa94HXSVEIUxZyIb9fBP5TbrQyRP3t9C8j3ndw7o=;
        b=1SwfAZtYEtkYDnk+8vDL0BmkO2HMaaBYUF1y9UZwauuILfhICYExglXiA0drXrllKd
         KOPGDNaeb88O+/YDzXpNyYClqKLQnz3NicHPO+uezydlDLL/nfwKRmDRdZaHC3eaT3fv
         ry7F6hXPTh15krgPCECfjlK9y6HbhyzQMhWKl8JP/3vEKO40DC/0NMwTLXD7jzAQbLNu
         xtZdJDxdhYg8MtgaEBof70I5ZBfI3aDiJ+lFkbs6yfVpvQn/2wYyex6SERe18Fi2vKL1
         KJkX96t6eN8qn18fnUlDqtRprFeT+xjosB0TLrjJnNvWr7PoBuvoo4Qk6qRAjUsDz75S
         RZ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744418832; x=1745023632;
        h=to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tHTLa94HXSVEIUxZyIb9fBP5TbrQyRP3t9C8j3ndw7o=;
        b=Elq5GYOBUUV2lS+MPWtuNwyFLhbtFLrI+oyFb7pUnU3q19VNDNgvZat3LMQN/wp4mr
         XjeFDOKgWT7grQbgVoVw2dAiKO53+qj2YjDo/LHVe/bhQFxG5VEl2AZOMtliTrnDMtXo
         9swqGe4Uppr2KXJnSNt57yC+R4GCywljw1OlxcAWyFTMegOadoW9/IZMgUnaIVWAGzxo
         M13QT2N+QZMHC0jWeHsjJa6nDen3Ghp3/3iN+YiIWuFJOHHJnsBcgFq9ekzFx8aPoyAe
         V0oJJv+deewvB1i8HAIVQUpUBTZcZH+L/hiPZKEILJ98YtO1gQUQQokHvpxMU769VHJC
         2K9g==
X-Forwarded-Encrypted: i=1; AJvYcCVWtGflMnBMX9Q7VqdaN2QxNDFrfq7UQdZWOaypRMCiJzuCSnjHbmsvlONqNij1Ddf1YKAgvzKH8R5gDuQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz8cUmwBHW5OOn4l4BguVB7XUyM+hW1AWw8zZwpB5t+/FZ9N6C
	kp7Tt062QYpY0PmM1BpT/6cOvml9r9q39k0tGuPI2yL7BJvRRtEZaaTG7uXCU1BSTSDc59BjzkP
	p//ilBg==
X-Google-Smtp-Source: AGHT+IECJ+2tahnuW9wj1DdRO5tnybB4VA6zKgzlLeiti1FKVKAcr927Zk7A8Lk9g5acFGoDI0frS4AUFuOm
X-Received: from pgc16.prod.google.com ([2002:a05:6a02:2f90:b0:af2:4edb:7793])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:6d8d:b0:1f3:2e7a:7320
 with SMTP id adf61e73a8af0-2016a2895e3mr10885742637.19.1744418831761; Fri, 11
 Apr 2025 17:47:11 -0700 (PDT)
Date: Fri, 11 Apr 2025 17:47:03 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250412004704.2297939-1-irogers@google.com>
Subject: [PATCH v1 1/2] perf evsel: Add per-thread warning for EOPNOTSUPP open failues
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, Kan@google.com, 
	Liang@google.com, kan.liang@linux.intel.com, 
	James Clark <james.clark@linaro.org>, Weilin Wang <weilin.wang@intel.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The mrvl_ddr_pmu will return EOPNOTSUPP if opened in per-thread
mode. Give a warning for this similar to EINVAL. Doing this better
supports metric testing with limited permissions when the mrvl_ddr_pmu
is present, as the failure to open causes the test to skip and not
fail.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/evsel.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/perf/util/evsel.c b/tools/perf/util/evsel.c
index 1974395492d7..a8a8afb78f00 100644
--- a/tools/perf/util/evsel.c
+++ b/tools/perf/util/evsel.c
@@ -3774,6 +3774,10 @@ int evsel__open_strerror(struct evsel *evsel, struct target *target,
 			return scnprintf(msg, size, "%s",
 	"No hardware sampling interrupt available.\n");
 #endif
+		if (!target__has_cpu(target))
+			return scnprintf(msg, size,
+	"Unsupported event (%s) in per-thread mode, enable system wide with '-a'.",
+					evsel__name(evsel));
 		break;
 	case EBUSY:
 		if (find_process("oprofiled"))
-- 
2.49.0.604.gff1f9ca942-goog

