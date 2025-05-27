Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8550281375
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 18:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748369253; cv=none; b=TVz8UCQQxk2YSIdhMOcoPvepZAMt0ky4/tce4/ovleML/+euLUKPNfxNvBTeVBMRFuXgRJArH3sCbLy363BxMBVipFzd7AuRz5HumQgXLNAkNJu5oG18WYWnGMDkaKk10PhXlIe1hLCtyvwspgyGTNGs/3DxQNgXZTav0HmCBD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748369253; c=relaxed/simple;
	bh=CBWXDqwmWst2ZqdY/0uSvasMfgfkKz/Uh3ju60ADh2M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=i98/e/ByrOT7gBwn6P8U9NmrG8xXPEha2GVdzoPpsOaGPoM7SIvjehwOzHiUeC2Scf/Q6b2OsEtG9TrestJneX6KwgjzmbL+SlIdhXeN84WWW+Qxbg9BNb6F10keieEZRgpqyWLCJTWo803E1asopfpB4Cz7Au/XVnKaYUX3WKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zL0jlFJX; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zL0jlFJX"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2323bd7f873so36157475ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 11:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748369251; x=1748974051; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MX8V9w5FVeExaYuyetA8waEgh5LNED363u7Lxm8ca88=;
        b=zL0jlFJXGyxlsUD21aqW0bFet2sLNYLeKMK1o4Ro8srPJOIgc4bW4qZXvdryrk4iKP
         B6ras8VwRLUKNQM6yBNgHclzhv99bF6PEjiL4ZSNye6yK4g54jjITLEnf9qkfUr68BwE
         zR1v1zedIpqR4OlQ3hzlWF91OCLFwf1cevvV+TEgTynRrIM/M4nFirUR9lW0tSueze4s
         1UjKRrhM5JvQ8LMM+jOAv2U1+Jo/ctj1BoZJauFehmBtyiImppp/PYB/oZfin6ZDTFeS
         v29YPd0glAJM4xMWMT7EJTYcAIR0mkuI+Ax6+xyOHmvXTF09cxss1D2zoVKUGyl86j9q
         aOaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748369251; x=1748974051;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MX8V9w5FVeExaYuyetA8waEgh5LNED363u7Lxm8ca88=;
        b=mdwK6I66HnaNZs0hwFEBV7htSsjqMzGo/AV10Sfh68qRCIBfWh6PB9kNaXhCtAxm+7
         Yu2Z8u0dQz5sTkBSKRnlPp5cz7sVsVE3dflr7DV2okTzBW/y5127UKIDRyKyvnkKVLDj
         YqThlq+b4WQfUXfr6LRDecoKm1bOvI8bRceu+3s8ZXu5vPmWuXgi8y3XEVmb1Bu/cSWk
         mvq0kydREMJ59foOYHJOHDCGN9Ex69iutnX3b+7ysGrzm9JaoYchEHtmfXpsNwlX/rRt
         YqIlDT49MfmTl7Gs5VPGof9u2b+ozuSgEjC0MDprYCo72rV+OJorkNwNNQ91dqnhMSYF
         wWVg==
X-Forwarded-Encrypted: i=1; AJvYcCV429k75d5N9djzqNMBnROY60WbhC09UTjWGYILcbW1hNIHBVJhuTFg9hx6+9t4zrn1pdDTHjjcUHIQNY4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo5386p3B2Oqq3tD9X6Fmh25E1ML8gSBWsjW2HWO6kw9PRWRVr
	VuQduo59BV7TPkZ51SpjS6tBQX66ab2csQPNHXZ1MaJurr66Lb1GcAER7znNYjYZGd3f1duRHrH
	nQHlRHvwRRA==
X-Google-Smtp-Source: AGHT+IGNqZt8gE2AinHrs5u59vtVCFuseQxQglwLlKwXoQLPdUfefW6JEtTDFuscAHg/KyKTb9DfJ3w8oY6h
X-Received: from plll21.prod.google.com ([2002:a17:902:d055:b0:234:949d:4a5c])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:41c8:b0:234:a063:e2ac
 with SMTP id d9443c01a7336-234a063e540mr48300615ad.2.1748369250955; Tue, 27
 May 2025 11:07:30 -0700 (PDT)
Date: Tue, 27 May 2025 11:07:02 -0700
In-Reply-To: <20250527180703.129336-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250527180703.129336-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250527180703.129336-6-irogers@google.com>
Subject: [PATCH v1 5/6] perf test intel-pt: Skip jitdump test if no libelf
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, James Clark <james.clark@linaro.org>, 
	Howard Chu <howardchu95@gmail.com>, Weilin Wang <weilin.wang@intel.com>, 
	Stephen Brennan <stephen.s.brennan@oracle.com>, Andi Kleen <ak@linux.intel.com>, 
	Dmitry Vyukov <dvyukov@google.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

jitdump support is only present if building with libelf. Skip the
intel-pt jitdump test if perf isn't compiled with libelf support.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/shell/test_intel_pt.sh | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/perf/tests/shell/test_intel_pt.sh b/tools/perf/tests/shell/test_intel_pt.sh
index f3a9a040bacc..32a9b8dcb200 100755
--- a/tools/perf/tests/shell/test_intel_pt.sh
+++ b/tools/perf/tests/shell/test_intel_pt.sh
@@ -288,6 +288,11 @@ test_jitdump()
 	jitdump_incl_dir="${script_dir}/../../util"
 	jitdump_h="${jitdump_incl_dir}/jitdump.h"
 
+        if ! perf check feature -q libelf ; then
+		echo "SKIP: libelf is needed for jitdump"
+		return 2
+	fi
+
 	if [ ! -e "${jitdump_h}" ] ; then
 		echo "SKIP: Include file jitdump.h not found"
 		return 2
-- 
2.49.0.1204.g71687c7c1d-goog

