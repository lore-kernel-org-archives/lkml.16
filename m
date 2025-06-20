Received: from mail-oa1-f73.google.com (mail-oa1-f73.google.com [209.85.160.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF0F2EA746
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 17:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750441246; cv=none; b=oyqHiZl0cjPdlV1mO0Lsc5O+0bKCRoPwvwTPVOarnVd3GrpgLlE8BSh1xmbqkbkCXQbQxKYbcN7jYR8fExFZhkjaz+WosJ8Mw+gvxOCg5YpgIQxVn/gyX+qqufB7lcL0ifNf21QdpK4ISvZApowrdduhvelmeBFi3QMCWGdBX7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750441246; c=relaxed/simple;
	bh=t8gN8BSzphkAW0QD/TlbFY2nTXHFMLr/Gq3m0QI9RqE=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=eS5rjfqjA+/GEs8P9OU8or1xkVeDQqxeRty0aDiaMwNRsVPS4IeTtU+PkFZJSjOzM4XsuUBFFXlOyI/pzsjZRGK+/APgynEbbCJfExaLHZH1FIGWfks6IDbzV/ymhLmz1yh0R1UGG0tWjajV85kNmvnF3Bb/1qaFjnOz2uxApyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ctshao.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NLi2R1s7; arc=none smtp.client-ip=209.85.160.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ctshao.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NLi2R1s7"
Received: by mail-oa1-f73.google.com with SMTP id 586e51a60fabf-2eae95dfae3so1987702fac.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 10:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750441244; x=1751046044; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Z5IAXZsKuFDuoJG1qfWh85k6atVC8+rtB/SA3HapoHs=;
        b=NLi2R1s7s4YZUFha+BC3uVwByA1vg392Roak6KPoEBw8ciU7lYkfT+Cozp4BZHYVq1
         OlIa0YaiZ2oEIiruWUbkbs+/21xm5v0uVAJ3GV3QvYMmWSqnprQU0D3zm9sM7/uA6ZPC
         nw8pb7q3lQ04pqykA7I+62Dxb/AMm7KCiSBxdRe2qf+4lzj2h7ZlkKj8vcqBWY8/ZBvD
         iC1/V6ocnFoxgICmHPvkHO1BYsyi0ppmspWyDlSYVChRdMc+nmr5ULdazJDLGoGLRCVx
         MvRURMlJEPsBxpnIB74BgMWGA+UHw2Pxro7eXlDfxIijrmZ7SR5+1ZU8MXtOASSzt5OA
         i6Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750441244; x=1751046044;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z5IAXZsKuFDuoJG1qfWh85k6atVC8+rtB/SA3HapoHs=;
        b=QC4KOTsvQILed7ZDUxsH56bAYk8POJTT8chM29mz177QZ6dENVVIVoYLdi2bMMq5a3
         5K1nQgi90aHpuzNWz6tsVxc0hY5r6di2LsbjaFZNVhDRcc1OSOlDcqLI2eAYrWZ2FXIc
         Bl+XlGdfXLh6wGZdhek9FQAzVzr2JgeBJlPLfALS75RtVEng65giQ+xYjbZMeZW3QiRy
         YNwohbOQO+Og7Dg9G3DoLfpqfFViPRHZ2GPT4D81foDJFDLPeLJMDiu0Ns7SlkHTRPwG
         9azyw3Wz0z0d6M6HsVm7B2PhLd0bWKnAwpfKPN5/QzXDLksdqp84Hoty49WgJX4bpVNR
         ofkQ==
X-Gm-Message-State: AOJu0YzskHMDaowLcf4gFJhjrxyvkfmnWsGYd4Yjr2U3M2Bvu6T5bZdZ
	9j0nQzmWaRWzggOOHBU1n5ZBTj5ZIAlmFwPeGww5vgkxqc6VEjKuaYwarzyBjCPQAiRW4T4/VS3
	P5dqsDwoW7Vg1ao8wZz6JO3FSPmCeYVW67M2SDaC+ehEDCGOeU5GEf1IEZF/tpKoiOf5NuIRL7J
	lFzEG5eCzfxsvVpFkdKlwr5zaUoysVm4a45VNdpP9UvdYD
X-Google-Smtp-Source: AGHT+IF5ieJyxM2jpeX8ReeQCqqYbc2omjzhKC3iAdcOfEZPgq49LzyPKkUyU/UM5XjMtO8PvFh2R0DiQE0=
X-Received: from oabuw9.prod.google.com ([2002:a05:6870:ae89:b0:2b8:ed65:d4c7])
 (user=ctshao job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6870:6387:b0:2d6:241:aed5
 with SMTP id 586e51a60fabf-2eeee89c171mr2521624fac.26.1750441243845; Fri, 20
 Jun 2025 10:40:43 -0700 (PDT)
Date: Fri, 20 Jun 2025 10:40:09 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.rc2.701.gf1e915cc24-goog
Message-ID: <20250620174034.819894-1-ctshao@google.com>
Subject: [PATCH v1] perf test: Replace grep perl regexp with awk
From: Chun-Tse Shao <ctshao@google.com>
To: linux-kernel@vger.kernel.org
Cc: wy.shih90@gmail.com, Chun-Tse Shao <ctshao@google.com>, Ian Rogers <irogers@google.com>, 
	peterz@infradead.org, mingo@redhat.com, acme@kernel.org, namhyung@kernel.org, 
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org, 
	adrian.hunter@intel.com, kan.liang@linux.intel.com, james.clark@linaro.org, 
	tmricht@linux.ibm.com, leo.yan@arm.com, atrajeev@linux.vnet.ibm.com, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

perl is not universal on all machines and should be replaced with awk,
which is much more common.

Before:
  $ perf test "probe libc's inet_pton & backtrace it with ping" -v
  --- start ---
  test child forked, pid 145431
  grep: Perl matching not supported in a --disable-perl-regexp build

  FAIL: could not add event
  ---- end(-1) ----
  121: probe libc's inet_pton & backtrace it with ping                 : FAILED!
After:
  $ perf test "probe libc's inet_pton & backtrace it with ping" -v
  121: probe libc's inet_pton & backtrace it with ping                 : Ok

Suggested-by: Ian Rogers <irogers@google.com>
Signed-off-by: Chun-Tse Shao <ctshao@google.com>
---
 tools/perf/tests/shell/record+probe_libc_inet_pton.sh | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/perf/tests/shell/record+probe_libc_inet_pton.sh b/tools/perf/tests/shell/record+probe_libc_inet_pton.sh
index c4bab5b5cc59..aaa5ee06ae18 100755
--- a/tools/perf/tests/shell/record+probe_libc_inet_pton.sh
+++ b/tools/perf/tests/shell/record+probe_libc_inet_pton.sh
@@ -23,7 +23,8 @@ event_pattern='probe_libc:inet_pton(\_[[:digit:]]+)?'
 add_libc_inet_pton_event() {

 	event_name=$(perf probe -f -x $libc -a inet_pton 2>&1 | tail -n +2 | head -n -5 | \
-			grep -P -o "$event_pattern(?=[[:space:]]\(on inet_pton in $libc\))")
+			awk -v ep="$event_pattern" -v l="$libc" '$0 ~ ep && $0 ~ \
+			("\\(on inet_pton in " l "\\)") {print $1}')

 	if [ $? -ne 0 ] || [ -z "$event_name" ] ; then
 		printf "FAIL: could not add event\n"
--
2.50.0.rc2.701.gf1e915cc24-goog

