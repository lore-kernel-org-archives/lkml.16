Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FC8294A12
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 19:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745524725; cv=none; b=mTyS0VmdHbCMjlLZzrrVz/L8twvbxiV2zVg3t4t1mFzPtBzva1aw31p24oa2LIYSEP0kWnYLjs2oloeXQeidFcmsAWlKshYnWGWT2xEZ37iNo6M0ToSoY2HlTNe0pg/OicAoLND1jT2YVh8dL2xEkux0n2QA958uaxQR0XnpgcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745524725; c=relaxed/simple;
	bh=Qa7/NWnNAbbvspFXvntiqb8JE6R610NDMEjZ2+RCtsI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=n2mCC0ygJwpz7va3XdQv5YRXx4OSa+8dtYizdgRGCnPoZc0CFNMUdsNbM1uLbBnCAXbYY4qgYR/URWpvxuWdPKUBw7cagenLMsFPcEeRqb3l1DsUBmzWf8MFy31NXwx9AKwosOKjssnKmJdukFa6UUt1zXt3tjG0QEpsIYIfXKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hTttOamX; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hTttOamX"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-736d30d2570so1296295b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 12:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745524723; x=1746129523; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J+5lHcPlqDn1PtKKI7aRSOFbGSO3/XuDLrZF/cxUnH8=;
        b=hTttOamXBM7orBVyAfxZi+GeA1GBGY8R0Z1TuJKblUN38HTkGNry9lyBv0JEH3JoPF
         Z2TAFDRzoyLlc1WpQeRzYYPDLjrBytrYASzJLapznN10I+eoi4RHqyQD1ov5x+4V4Pzi
         iVEASMoBZk6ar5dxJksJm0SUlaw7lAZM+LbVkAftGhr62xseuZnT/I9k3yIai53jG4oj
         HLPbUwGiPHvo0qCiRvHc6i1r/QSZ37C/N+cjVN+ZWyG/y8UE6bHoguWp7pBpuG1SLp03
         rtofTTZmm1ce0wPI8HdU8NJkG/OrU6GusqYofx53XvQ/mpVxhCQzwZBAb4rgnuE/V2+b
         w5tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745524723; x=1746129523;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J+5lHcPlqDn1PtKKI7aRSOFbGSO3/XuDLrZF/cxUnH8=;
        b=eX9Bg/uF3iLavzlxtWbL0KSKGW8bUrmu4Q6FrIY52moqD7hkGF8GQrISy9LG6R8RO+
         RskT3Dp7MCsCab4yeEcNdVhkmd5uwYKTtF8/0B1oUU3s923zACSlUhVYTOa73iIwwG5R
         Z4i0YlqryWcij6fodRnBtiup2cp8cNtz7odH7vNpfnrNIZBNxu0Uixx1P0dERSyPZ123
         yQlqW/hOxMIebScJy2IRHQVo7IuJ5JO/PGp1VyYj7O8h5bTVdi0xnzCJ1TIHWdUp/gXE
         Dqk1MMEb8TcaN7/GtUnxiJL4u2fZw9E9MCWSm5XbYembeHZiXP8m7sewcyaURSKLxtst
         S7Lw==
X-Forwarded-Encrypted: i=1; AJvYcCUC1iaCsyVdJPchn4SQjx0wxYaef7LFuwubLwCBrQRgRClRM/hfwCa+0hWg+gUyEHnI6JxCWPNunAQbQrg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgYlKWz7jiIdJDpORU0HHHfTYinbc6oAgvJWpRh+MZ3vagybcz
	AFWq5r0J5ZMwM+4IatfSTVMJbiNF/p4Zw+OQoJxw7A/ZzHg8aICSKuIkrPQ5E77T/FeRbDrIyit
	gNKwbxQ==
X-Google-Smtp-Source: AGHT+IHbY+skXPkqzN4tXonepKOsEquu2RdmRcb5i3vEvMDiDPwT/zO4+SFRTK7fVeGl+4ZG6qcfy5nHPoJ2
X-Received: from pgbee14.prod.google.com ([2002:a05:6a02:458e:b0:af2:681:e27a])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:ce44:b0:1fe:6bbf:af22
 with SMTP id adf61e73a8af0-20444e6925dmr5081834637.1.1745524723187; Thu, 24
 Apr 2025 12:58:43 -0700 (PDT)
Date: Thu, 24 Apr 2025 12:58:27 -0700
In-Reply-To: <20250424195831.1767457-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250424195831.1767457-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.850.g28803427d3-goog
Message-ID: <20250424195831.1767457-5-irogers@google.com>
Subject: [PATCH v2 4/8] perf build-id: Truncate to avoid overflowing the
 build_id data
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

Warning when the build_id data would be overflowed would lead to
memory corruption, switch to truncation.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/build-id.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/build-id.c b/tools/perf/util/build-id.c
index e763e8d99a43..5bc2040bdd0d 100644
--- a/tools/perf/util/build-id.c
+++ b/tools/perf/util/build-id.c
@@ -951,7 +951,10 @@ bool perf_session__read_build_ids(struct perf_session *session, bool with_hits)
 
 void build_id__init(struct build_id *bid, const u8 *data, size_t size)
 {
-	WARN_ON(size > BUILD_ID_SIZE);
+	if (size > BUILD_ID_SIZE) {
+		pr_debug("Truncating build_id size from %zd\n", size);
+		size = BUILD_ID_SIZE;
+	}
 	memcpy(bid->data, data, size);
 	bid->size = size;
 }
-- 
2.49.0.850.g28803427d3-goog

