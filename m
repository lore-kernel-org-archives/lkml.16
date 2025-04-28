Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D531A5BBA
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 21:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745876054; cv=none; b=M7cCyxyK6nrPz2zAIfDV0g9g6SfHWECXzCXPC6NA8D70Kydi1DR8oZQt3+7xVWO4kEUw9sjjQeDnizgsPwy6Y/Aa4fqem9kbGu4EgDF8Zqh7j7bjO47dAN13cKlPPNtExfwVeewKpOChFfWTrpxcpCj6B6KFQ7E7ucydvAz+Gck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745876054; c=relaxed/simple;
	bh=wmLjL3uu1SBaQMt05DbJktre9AX9CZEIaHrF9c+vxcc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Content-Type; b=GRMTnxMSUA72IFuxZn7Ip20HDbg1RL4YHXhJYtWuEFkpPgxXc1DgAfm14ulpLutbhkZm7E+MYWP/zuTie5FjlTveXv7vtCgyGJ6hf1xck5YQ4AwRzSjl11sY3IhrEymJXdME+8XPBZRGP1o9OUNJ0mrfHYU+cMz9rO+RW6EdahI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eib6ECsB; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eib6ECsB"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-af534e796baso2910302a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 14:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745876052; x=1746480852; darn=vger.kernel.org;
        h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cj/c5oogZqYX3xzKlkyw0X3MbeqYB945x9Mgm79S4zo=;
        b=eib6ECsByVbKA7bdEtrfjv7pK0WMWLzxNWJweEV6OHPX0eR4dDKszqdaNKp/QyAb3J
         amCZQKTooBn8UjaS0nM2dA62O4JNhnMo2KS44iCEtgMHF4TcFYw1vwJMc94ZQIQEFuBY
         V2pUjCi7F5SwP4n/GSICdj/+8JPU4YTzTE53l7Sjb2ZUAFgJK9TB0Y+ir/bdiger/UB2
         svwAdmZp44/nXeL3xpWJSBTEibxFszrRGNBp9sN1UoAHBDNxUnO2ehVos0cWr+pr92U6
         ravYuO4iEQeIMBL8LIKwnAEfazFYWOx9Ykoy2QW2EE6ZTMXshgMsOugmF0bgPB5Oabnl
         /37Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745876052; x=1746480852;
        h=to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cj/c5oogZqYX3xzKlkyw0X3MbeqYB945x9Mgm79S4zo=;
        b=lNiTISru247JOKRx8QYUfW/CIKmcKux02BL4+3SbjsP8PCdOCeLaStI23hRvaXX6Mx
         j5P44WC3A6lrJXNNd9U9dwj/zxuzxaHfN1Muuso9OpPPFY7egKFpFlP3YJPgx1B8aoCy
         lo8XJ62qVh1VUqb9DLVfUIJsAFuPA2VXxXySfgDMyHQvyGeWh6JqHHQGCE91AQWbEpJR
         +zpMoej/r2ttvT1dtpP+Ui2Ds8HsfgNeHO0esLokQK+eym5ms6lk2fRrx4Z7t4XGq2Wp
         JdPpmjpf874h39zDz4cbV1v+Q73ILwehHmL5Hq/nh0hJ9FyJBP6BQm+QpCGO1mwWKdZ6
         r81g==
X-Forwarded-Encrypted: i=1; AJvYcCUWFSTjDoT3DyoinSMxr7SMpBwsV3xVqBzNvlHNDfYxncjhi8tqE+iMB4GuyUc2HNHPaLeAvxbwC7iL51k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/HxAMUBqqH9VncKy3uSzMURvhkby6YXprNhwg1O+rBQlcUanj
	p3w5wKf6MBpNxV76SnkKvxMrLaiqot1DbwOFlc6Wgn02UdQImsHHajUUJiY8ZMIMrfFjT/wlHAr
	3A1wDeg==
X-Google-Smtp-Source: AGHT+IHv7PlHZ00FuHiUOgTY4BIXnXtwISPxnN0k3IBWgGiIrvxGquayY7tBuGrkZMoqODT26AYFUGzt7gYS
X-Received: from pjyp8.prod.google.com ([2002:a17:90a:e708:b0:305:2d68:2be6])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4cc4:b0:305:5f25:59a5
 with SMTP id 98e67ed59e1d1-30a215a9e6cmr1892969a91.35.1745876052550; Mon, 28
 Apr 2025 14:34:12 -0700 (PDT)
Date: Mon, 28 Apr 2025 14:33:59 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.901.g37484f566f-goog
Message-ID: <20250428213409.1417584-1-irogers@google.com>
Subject: [PATCH v3 0/9] perf: Default use of build IDs and improvements
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

Build ID mmap2 events have been available since Linux v5.12 and avoid
certain races. Enable these by default as discussed in:
https://lore.kernel.org/linux-perf-users/CAP-5=fXP7jN_QrGUcd55_QH5J-Y-FCaJ6=NaHVtyx0oyNh8_-Q@mail.gmail.com/

The dso_id is used to indentify a DSO that may change by being
overwritten. The inode generation isn't present in /proc/pid/maps and
so was already only optionally filled in. With build ID mmap events
the other major, minor and inode varialbes aren't filled in. Change
the dso_id implementation to make optional values explicit, rather
than injecting a dso_id we want to improve it during find operations,
add the buildid to the dso_id for sorting and so that matching fails
when build IDs vary between DSOs.

Mark the callchain for buildids and not just the sample IP, fixing
missing DSOs.

Fix sample__for_each_callchain_node to populate the map even when
symbols aren't computed.

Other minor bits of build_id clean up.

v3: Ensure the struct build_id is initialized empty prior to use as
    read paths may fail (Namhyung).

v2: Make marking DSOs still the default even with the defaulted build
    ID mmap. The command line option still disables this to avoid
    regressions. Add callchain patches and jitdump fix.

Ian Rogers (9):
  perf callchain: Always populate the addr_location map when adding IP
  perf build-id: Reduce size of "size" variable
  perf build-id: Truncate to avoid overflowing the build_id data
  perf build-id: Change sprintf functions to snprintf
  perf build-id: Mark DSO in sample callchains
  perf build-id: Ensure struct build_id is empty before use
  perf dso: Move build_id to dso_id
  perf jitdump: Directly mark the jitdump DSO
  perf record: Make --buildid-mmap the default

 tools/perf/bench/inject-buildid.c             |   2 +-
 tools/perf/builtin-buildid-cache.c            |  20 ++--
 tools/perf/builtin-buildid-list.c             |   6 +-
 tools/perf/builtin-inject.c                   |  36 +++---
 tools/perf/builtin-record.c                   |  33 ++++--
 tools/perf/builtin-report.c                   |  11 +-
 tools/perf/include/perf/perf_dlfilter.h       |   2 +-
 tools/perf/tests/pe-file-parsing.c            |   2 +-
 tools/perf/tests/sdt.c                        |   2 +-
 tools/perf/tests/symbols.c                    |   4 +-
 tools/perf/util/build-id.c                    |  63 ++++++----
 tools/perf/util/build-id.h                    |   8 +-
 tools/perf/util/debuginfo.c                   |   2 +-
 tools/perf/util/disasm.c                      |   2 +-
 tools/perf/util/dso.c                         | 111 ++++++++++--------
 tools/perf/util/dso.h                         |  75 ++++++------
 tools/perf/util/dsos.c                        |  20 ++--
 tools/perf/util/event.c                       |   2 +-
 tools/perf/util/header.c                      |   2 +-
 tools/perf/util/jitdump.c                     |  21 +++-
 tools/perf/util/machine.c                     |  34 +++---
 tools/perf/util/map.c                         |  15 ++-
 tools/perf/util/map.h                         |   5 +-
 tools/perf/util/probe-event.c                 |   3 +-
 tools/perf/util/probe-file.c                  |   4 +-
 tools/perf/util/probe-finder.c                |   3 +-
 .../scripting-engines/trace-event-python.c    |   7 +-
 tools/perf/util/sort.c                        |  27 +++--
 tools/perf/util/symbol-minimal.c              |   2 +-
 tools/perf/util/symbol.c                      |   7 +-
 tools/perf/util/symbol_conf.h                 |   2 +-
 tools/perf/util/synthetic-events.c            |  44 ++++---
 tools/perf/util/thread.c                      |   8 +-
 tools/perf/util/thread.h                      |   2 +-
 34 files changed, 337 insertions(+), 250 deletions(-)

-- 
2.49.0.901.g37484f566f-goog

