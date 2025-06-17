Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2037120D4FF
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 22:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750199659; cv=none; b=gtHZTM0hVmJnU0nviHchEjZz+QzjEdpsVoaokLtprB9vDJuXOPD4W4q3vYOYulTmDOEHgpB2qYRYQec2zyI7yJl649g4Fyy1mXvHY7ybbcv68N1e3zVeWQfP/Co/l7/s5WeQRqvFm/yNyNf7QY17rYrPpQgBy8VbRgxt1Ehh4Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750199659; c=relaxed/simple;
	bh=eCuGjp6hG/MXH23RM/BMJyOq9nbIlhN/iGtH2KuanSk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=LdItZosmUvF8OKGuW/2uurc3B/hi2jX4FX+vyPXnucWmMg2Nn8wFkln0WaHhvZcXWCSF0K4TGi/k3Ceq6Q/wTj1xvwaSrDZs+qfa9v+U0gtFS+zoQJWH5/7CChZB0OEFDo0pQzrl1xHQGyL2bmwDD1H6YnABqPKvWHXL3KHSYQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=li9dyRK3; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="li9dyRK3"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b31bc3128fcso1217097a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 15:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750199656; x=1750804456; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ole7/QKvdk2YX82faNIgxPbHeQ2syHOfB0nwCHGLyac=;
        b=li9dyRK3VgVWyVRWS/UMsyI7UwoyCj8jyvY2OjEmNP8w85A1+NTaoSM9YARLeNiuv+
         6Lqu9s4CUMlQJ8lOf+ZozPtl5YXid951dT4KnsK6+FBek2uPAkhjQL77tILfWjT+MZ1j
         8jBtJpQgBEtduXkceonaZsfSUogG+nq69D2XaZ3DVtrwIPWiALuDwfnvT6J/vOW7XoyM
         MXoB6idVTnCdkfalgEwWvuCh04hPE/GthpOnioblbe3Beg+Q72UQRSGrbX9axc9ikyXi
         +ujQl2I7g+DOal4HaGMBvjU35kmoYzB+2SvVhddnwJ0os4G71F/cMO7+qBLzmi9AdM51
         SjuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750199656; x=1750804456;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ole7/QKvdk2YX82faNIgxPbHeQ2syHOfB0nwCHGLyac=;
        b=aJCILz+5HOEb1dEdN0S2lP6lFaQNsPJEUrmEo52GsrUDSHoaOrxmRPwd4ccIG6uJ+O
         Gss89Fb55pWKFJfVrufFVuy9GfQEohs46HLHDxplLDQSXb/gk6bJb/tEFiHFYzBhbsOd
         KQNJDfsZ9m/V36tpdnF1aCI8lanYYs8ybeUVPB8NODc1MS4ml97bPlCvLQYRnFESD23l
         Hp0i+S8bxbmBu0E276j484o5WckVXlTJ+yrrX+Wzx/ixdp0tAPEjLW3ZSUXl5p1NRIGg
         W2Z+YWtqKcOF5w9W8KkBJ765nKd1faingMbQHgefHKWsvH2nSpE0YAkfLLF6Kt3T+ZhT
         bD9A==
X-Forwarded-Encrypted: i=1; AJvYcCVhySo+QYfyJqqWttz/6jUTUahssMyCd/JW6JtLMkvlWi/Ch/UauS4YvkEJHf2qKfMBdA+hLg4n+JJp3rQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxhsy1Eq4vJUlFDqpRBYCYt7wlIcr0K8vIawua40fwWF8tm3C1d
	Yw77mdxObXxlcblKs/pYSRelFyDYfMyaIlgNtaRWaerwoB71f0W+IWZw6bELt9R1MG8K8lRJ/DK
	Psknj37JIUg==
X-Google-Smtp-Source: AGHT+IFqo/2say/u+Lf3kECAVOASzRCWN1tWiNcZXQsgMOYI5Al6Fu55dP/lwgpwm2CkUARyqbdTct5OAd3H
X-Received: from pgct18.prod.google.com ([2002:a05:6a02:5292:b0:b2f:6348:f715])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:4983:b0:21f:bdd5:d71b
 with SMTP id adf61e73a8af0-21fbdd5d743mr22982667637.2.1750199656506; Tue, 17
 Jun 2025 15:34:16 -0700 (PDT)
Date: Tue, 17 Jun 2025 15:33:54 -0700
In-Reply-To: <20250617223356.2752099-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250617223356.2752099-1-irogers@google.com>
X-Mailer: git-send-email 2.50.0.rc2.761.g2dc52ea45b-goog
Message-ID: <20250617223356.2752099-2-irogers@google.com>
Subject: [PATCH v2 2/4] perf evsel: Missed close when probing hybrid core PMUs
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Michael Petlan <mpetlan@redhat.com>, 
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Andi Kleen <ak@linux.intel.com>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add missing close to avoid leaking perf events. In past perfs this
mattered little as the function was just used by perf list. As the
function is now used to detect hybrid PMUs leaking the perf event is
somewhat more painful.

Fixes: b41f1cec91c3 ("perf list: Skip unsupported events")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/print-events.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/perf/util/print-events.c b/tools/perf/util/print-events.c
index a786cbfb0ff5..83aaf7cda635 100644
--- a/tools/perf/util/print-events.c
+++ b/tools/perf/util/print-events.c
@@ -268,6 +268,7 @@ bool is_event_supported(u8 type, u64 config)
 			ret = evsel__open(evsel, NULL, tmap) >= 0;
 		}
 
+		evsel__close(evsel);
 		evsel__delete(evsel);
 	}
 
-- 
2.50.0.rc2.761.g2dc52ea45b-goog

