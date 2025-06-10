Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47847256C6A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 20:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749588030; cv=none; b=uSixGhUioV5plbQh/kbRDa0LnvQY3Gq6gextk2rIMZbLeFjg8WyRazjAS8uwcUGx6sdj6kau+sKGSU6U18BhHYqvCG9KKb77lDbXXLTTq5BQCvIhVbsScFGoRuwvdK4DUEHApifoDsuhWjUFSPbsAROHt0L4QPf2i9s6Q2xdBWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749588030; c=relaxed/simple;
	bh=dJ9OOGoWvuIUnmGt/nCx+MMv4teNu9P9lGopqw8Jo7I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G4D+dHTpElxm5A3xcue5n11UGFtHRPWMQUPPh8Xl2slHtWBo4xQml9wBUylv8BNQVQsWLnF3ySF0rpIUc1CvrcWatAw1NO2hzCaSXJK1WgYhyIe1v4gnhDi5Ei4vfQ0HwcnTiLN0m52otyOm2obXQAp3K6JGlMioeDFPAhvuwXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rZ9uo4JO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rZ9uo4JO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79087C4CEED;
	Tue, 10 Jun 2025 20:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749588029;
	bh=dJ9OOGoWvuIUnmGt/nCx+MMv4teNu9P9lGopqw8Jo7I=;
	h=Date:From:To:Cc:Subject:From;
	b=rZ9uo4JOZ5+su43xNwqEjydnUXZkS2oM7Hw4my7eD32OnKxx9Oo9jPS6QU4GJKfSw
	 Q66ocAyVQ506d7md7QrqXbPrsx5H+Z12ZFLlLMhiGWAOzaR8i0Z/3LPvHw4pJUDzj/
	 VIQrxsd8BZDGjD3RRoQ7+7wi7nyrQBtrpAY1uVRhe993x5jfPp+Nzzq9ALKIXsZVZL
	 KCRuTytQ6SXv0hThZcCV82olQtZHb1n3BHrxyi3zK6EpnGQLnZJrLdCuSZDbMPoERr
	 /taKZBmZaiBpZf+YDNHP6E5AZ9dj9MQ+yb3uVwRqTuJHbQ4Ftqw7DM/62tA+qDgfAu
	 OR3seY82wvflA==
Date: Tue, 10 Jun 2025 17:40:26 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Adrian Hunter <adrian.hunter@intel.com>,
	Ian Rogers <irogers@google.com>,
	James Clark <james.clark@linaro.org>, Jiri Olsa <jolsa@kernel.org>,
	Kan Liang <kan.liang@linux.intel.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH 1/1 fyi] tools headers UAPI: Sync linux/prctl.h with the
 kernel sources to pick FUTEX knob
Message-ID: <aEiYOtKkrVDT03hZ@x1>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tldr; Just FYI, I'm carrying this on the perf tools tree.

Full explanation:

There used to be no copies, with tools/ code using kernel headers
directly. From time to time tools/perf/ broke due to legitimate kernel
hacking. At some point Linus complained about such direct usage. Then we
adopted the current model.

See further details at:

 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/include/uapi/README

To pick the changes in:

  63e8595c060a1fef ("futex: Allow to make the private hash immutable")
  80367ad01d93ac78 ("futex: Add basic infrastructure for local task local hash")

That adds a FUTEX knob:

  $ tools/perf/trace/beauty/prctl_option.sh > before
  $ cp include/uapi/linux/prctl.h tools/perf/trace/beauty/include/uapi/linux/prctl.h
  $ tools/perf/trace/beauty/prctl_option.sh > after
  $ diff -u before after
  --- before	2025-06-09 14:50:45.162579336 -0300
  +++ after	2025-06-09 14:50:52.797660024 -0300
  @@ -72,6 +72,7 @@
   	[75] = "SET_SHADOW_STACK_STATUS",
   	[76] = "LOCK_SHADOW_STACK_STATUS",
   	[77] = "TIMER_CREATE_RESTORE_IDS",
  +	[78] = "FUTEX_HASH",
   };
   static const char *prctl_set_mm_options[] = {
   	[1] = "START_CODE",
  $

That now will be used to decode the syscall option and also to compose
filters, for instance:

  [root@five ~]# perf trace -e syscalls:sys_enter_prctl --filter option==SET_NAME
       0.000 Isolated Servi/3474327 syscalls:sys_enter_prctl(option: SET_NAME, arg2: 0x7f23f13b7aee)
       0.032 DOM Worker/3474327 syscalls:sys_enter_prctl(option: SET_NAME, arg2: 0x7f23deb25670)
       7.920 :3474328/3474328 syscalls:sys_enter_prctl(option: SET_NAME, arg2: 0x7f23e24fbb10)
       7.935 StreamT~s #374/3474328 syscalls:sys_enter_prctl(option: SET_NAME, arg2: 0x7f23e24fb970)
       8.400 Isolated Servi/3474329 syscalls:sys_enter_prctl(option: SET_NAME, arg2: 0x7f23e24bab10)
       8.418 StreamT~s #374/3474329 syscalls:sys_enter_prctl(option: SET_NAME, arg2: 0x7f23e24ba970)
  ^C[root@five ~]#

This addresses this perf build warning:

  Warning: Kernel ABI header differences:
    diff -u tools/include/uapi/linux/prctl.h include/uapi/linux/prctl.h

Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: Ian Rogers <irogers@google.com>
Cc: James Clark <james.clark@linaro.org>
Cc: Jiri Olsa <jolsa@kernel.org>
Cc: Kan Liang <kan.liang@linux.intel.com>
Cc: Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
---
 tools/perf/trace/beauty/include/uapi/linux/prctl.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tools/perf/trace/beauty/include/uapi/linux/prctl.h b/tools/perf/trace/beauty/include/uapi/linux/prctl.h
index 15c18ef4eb11a013..43dec6eed559a686 100644
--- a/tools/perf/trace/beauty/include/uapi/linux/prctl.h
+++ b/tools/perf/trace/beauty/include/uapi/linux/prctl.h
@@ -364,4 +364,11 @@ struct prctl_mm_map {
 # define PR_TIMER_CREATE_RESTORE_IDS_ON		1
 # define PR_TIMER_CREATE_RESTORE_IDS_GET	2
 
+/* FUTEX hash management */
+#define PR_FUTEX_HASH			78
+# define PR_FUTEX_HASH_SET_SLOTS	1
+# define FH_FLAG_IMMUTABLE		(1ULL << 0)
+# define PR_FUTEX_HASH_GET_SLOTS	2
+# define PR_FUTEX_HASH_GET_IMMUTABLE	3
+
 #endif /* _LINUX_PRCTL_H */
-- 
2.49.0

