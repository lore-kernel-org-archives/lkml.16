Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C75313AA3E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 05:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751520988; cv=none; b=buYx/LozBzobsF2XPEiQ0rcVyHkuvmSa4KylTBqtQKUOIbEZnoPjgT7cWLx0Ej1AhK9fjQtoB5rBlVfhLG8KEsGM6go8WImuAZWA6djW0iUk8f6ewpzfY/TDL82CBpqIm/C9QIvlyvTRYb1K9x0kBVk77l7qJDMRer8yrbsP79E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751520988; c=relaxed/simple;
	bh=lJ/T83dJt9mH2yFSqfjecjHDP8qURlxSVZbN9Cej34w=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Content-Type; b=DxsMgTJkTQv8XIK47A20crfUxQ3M4gu4lQjaDB7OGscM5+kKkc37fXm8TapS2q2xpasUVa04pOOs9MJOR5Ic5Lk6MQH7gYRLLp7/rOnXzWaNVfISyJ3fMr/X22RbuSG0PMMQUGIfWrkw/etaO9a6/yJSbfV8s2Lwz8DcCaquGRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s1TRikVU; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s1TRikVU"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b3635eca369so2210313a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 22:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751520987; x=1752125787; darn=vger.kernel.org;
        h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2dNMhiAzoFZCauxtnsNXqcyPyU+32esTVpTpoiCTDg8=;
        b=s1TRikVUserHau/X2TDB+eLYX5w/LK3R7hp6QtkPTJLnXux34MEH1fjgqWtP6TeT7i
         trKpKzATEUMw8Q8a7bj2Az1haXFi5Rx816UN0ScwpSxU/7RoREGTp08oJiUFGaYpSzHX
         333CCl3XnTXuuEjDBLMUA8RElIJQsAvVO8iOpI09R/U8V+UE235hIleb0R1RcGTrINbs
         7URbISIg8i9TFeEKrG0Bvnkf2f3E9frEU0q3jx0hQ8Dqunc8KCCLsEEbqZLhXTVLYcv4
         Y2Qupley174pBeo5X/5rHXc6FtAT/Q+yxHQxBNwET5Hflh7yUEv2bOEkixFwyAnS0qZN
         EeQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751520987; x=1752125787;
        h=to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2dNMhiAzoFZCauxtnsNXqcyPyU+32esTVpTpoiCTDg8=;
        b=sH0HO/AHI0uLP51AwwTKkpa5rOG/Pm6bIBdxV9wsd8GIX+bZmdA2DFIpulhC8m+sbo
         g9UpZ2cqcIxxxiq7pyRJvXf5g9VEwN2P9IKI5Sk7B5bcylOpMBqzVrmx+qaoQX5soQy0
         STcAdgEGBb700jNnlyxHj0dWn1NvyKIcUiGOAjBWqf2XQP4I8ZuzfgHL4eiC0e19q4fP
         SzBgx7TVOIJ5Sc8NHsYeO1Zd7rdQaWOce65IO1epDQzzzw8oS/LmCR+Q0PzuP3Cd3T8D
         2EZBXJbUXgwWcDHNU4FNUXZWuqqM/EXbdw0iLPrZaJlia7ZIGRgFDterQNGJBTB79oUV
         nErQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlqY7JSsABOPqUwrOOUHjRkDolzW1fYOuiC4i+YwGdDrbOFU1P4ZIPXiBfFVaL1P+HTdXPxtLPM2t5pxw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqMRYVSuFDjFMWgBF3kpc8l74/44GDnsyhbab5G0eDdbjvRy3z
	R3+bAqccPaYu3HWkbj8yD8CE9aZkTEFJCARnxOk46QjdAkYNk/VDjQwogLeX0WfodjqC1e/hsMn
	GxJsh83IHDw==
X-Google-Smtp-Source: AGHT+IEV4oAWDDB19fbHcmr3wjhw1099rxHTl6rYSVnhtHvkVoLF4Qr+T3NZ1VKtVPlNfbXIHyNUIplTPN1j
X-Received: from pgbcz3.prod.google.com ([2002:a05:6a02:2303:b0:b31:c9b4:5662])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:998f:b0:21f:7525:f537
 with SMTP id adf61e73a8af0-222d7f2c78bmr10555326637.41.1751520986715; Wed, 02
 Jul 2025 22:36:26 -0700 (PDT)
Date: Wed,  2 Jul 2025 22:36:22 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250703053622.3141424-1-irogers@google.com>
Subject: [PATCH v1] perf tests make: Add NO_LIBDW=1 to minimal and add
 standalone test
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Missing testing coverage of NO_LIBDW=1 and add NO_LIBDW=1 to the
minimal test configuration.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/make | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/perf/tests/make b/tools/perf/tests/make
index e3651e5b195a..c574a678c28a 100644
--- a/tools/perf/tests/make
+++ b/tools/perf/tests/make
@@ -81,6 +81,7 @@ make_no_gtk2        := NO_GTK2=1
 make_no_ui          := NO_SLANG=1 NO_GTK2=1
 make_no_demangle    := NO_DEMANGLE=1
 make_no_libelf      := NO_LIBELF=1
+make_no_libdw       := NO_LIBDW=1
 make_libunwind      := LIBUNWIND=1
 make_no_libdw_dwarf_unwind := NO_LIBDW_DWARF_UNWIND=1
 make_no_backtrace   := NO_BACKTRACE=1
@@ -119,7 +120,7 @@ make_static         := LDFLAGS=-static NO_PERF_READ_VDSO32=1 NO_PERF_READ_VDSOX3
 # all the NO_* variable combined
 make_minimal        := NO_LIBPERL=1 NO_LIBPYTHON=1 NO_GTK2=1
 make_minimal        += NO_DEMANGLE=1 NO_LIBELF=1 NO_BACKTRACE=1
-make_minimal        += NO_LIBNUMA=1 NO_LIBBIONIC=1
+make_minimal        += NO_LIBNUMA=1 NO_LIBBIONIC=1 NO_LIBDW=1
 make_minimal        += NO_LIBDW_DWARF_UNWIND=1 NO_AUXTRACE=1 NO_LIBBPF=1
 make_minimal        += NO_SDT=1 NO_JVMTI=1 NO_LIBZSTD=1
 make_minimal        += NO_LIBCAP=1 NO_CAPSTONE=1
@@ -150,6 +151,7 @@ run += make_no_gtk2
 run += make_no_ui
 run += make_no_demangle
 run += make_no_libelf
+run += make_no_libdw
 run += make_libunwind
 run += make_no_libdw_dwarf_unwind
 run += make_no_backtrace
-- 
2.50.0.727.gbf7dc18ff4-goog

