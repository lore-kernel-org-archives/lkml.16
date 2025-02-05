Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7CC1E1C2B
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 16:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738772911; cv=none; b=WA+aRxJsqvXK+ZHCQFsaiKZIKFYWjjikqYx5IMPbf1B5L79WusRl/ZlE5ZDPBEEtUczRLVflxZQBCHwpBkxbUIzQg3oabtdG83giRNf23DIdqRvieNvs2c0kqepHg69whCSGI1mowapELvj3Y0Z9giuvDyx619mc4mk8SCFURhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738772911; c=relaxed/simple;
	bh=mCUuqANy+yIirvStGy+ihDF5Mjg3/pOlPEFxqwt4Lks=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IEt3NJvZ6zFx0LlTukou6ZHbIJZ9DMybwN+qCYa8REQbcfSh9R+1FwLKlwj9gOjXa/lk5xVZ0Yzx7BWCsZdXwWblSor6ZL0myTKUeBA3Aj263vBq5JN0GAKjcoVndTgJxqDSH21s3nLvhDAZOIoSntRq8Y77FvJ+85cwzeOcjrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dvyukov.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qIeW4ZFC; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dvyukov.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qIeW4ZFC"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-5d89a53fc46so8421905a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 08:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738772908; x=1739377708; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FnxTA7/lzeZN78ebNQoH43GndLOusnP4mO8C9596Y+4=;
        b=qIeW4ZFCOQOSFjKVt5OHpn/I1xerQQxL8yJj4IsbfnMNcChWCsfwT1lRfFth9sBZ2g
         Lf1jrL+23ZdNl2IwCUEZ01dzpAUNh2tOwXgrjbi8BJ/iQ0n4iZmjSnsNtLNSLxjZybp/
         S6Br5by1apIaBLyN7dJVDAIF5jPCljdXDkfKyexw9i/xxaNJMZ2yit/wNaQM2KjNMTiN
         8Q53afIhLiomzCdVsqdDH0FBKubryL+aEhgtNTguEIeuqReLi2yRl3wKyGALkz/R8Sra
         cggYkU4/5/qXj1oN8P2lNygyfWWB/9dBSH3ZUTWuqS4rX3B/8orDfBeurV/TLi/3J3/0
         BGKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738772908; x=1739377708;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FnxTA7/lzeZN78ebNQoH43GndLOusnP4mO8C9596Y+4=;
        b=lJw7si4e1RNoOn0/VmRpbbENhO+IsI363NHv/rRZ/T29W63fgXutQVFV9Vu5vMjovg
         S+R8WCtEfctUqhozQqEplehrdPRHYE1AAQIu6bxpS0o6OpTnT47kd2R3Jt+7vZg5rNIy
         KA4u2WfLUG8+OqxntoRoayybl6M5pM63Sv2IRt5TbO0xnHahjHa2UJPWlUFvd5JpEfqp
         Fb492EFHVN1+pj4zhvY683ugL108SSdaHyhqG4tFYVdN2XyqRfuTMPuM14IfW1Aj/dJ4
         6pOB8+19VTxFjIxMk3mTcj48adqbzKp6k/ae7IKQmKw8W8sFhiFtatUnX+6vIeVT51Fh
         RipQ==
X-Forwarded-Encrypted: i=1; AJvYcCUr4nlXi+S5OnTxBz6F7aQNDIaNWHuy8ABbZm0iIMFuHdr662FatHXdp+AcxZ8r7gaZLPQdHH5jIJri5kE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDBDrQY3UhzSCJJhe2s58dyusTqrL/0OsxqhIX2rAuEMsLgOJw
	VP9HLJbhydGKVmSproIpjXZYj2Y0E+B/oVdGj2BBxVrVofi+Z8gErSEvigKHW3kTEWeWeUmrR5s
	gmT/Hvg==
X-Google-Smtp-Source: AGHT+IGi7pGhqSR/YX9Xx+oluRt5MlaD9sGVw6bvjj2oO/7Y6ABn73tWE8HvkKA2j9pbak7aso8uToRZxWXu
X-Received: from edbin7.prod.google.com ([2002:a05:6402:2087:b0:5dc:e07e:cc7e])
 (user=dvyukov job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:321e:b0:5dc:100c:1567
 with SMTP id 4fb4d7f45d1cf-5dcdb732679mr4424057a12.15.1738772908404; Wed, 05
 Feb 2025 08:28:28 -0800 (PST)
Date: Wed,  5 Feb 2025 17:27:40 +0100
In-Reply-To: <cover.1738772628.git.dvyukov@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1738772628.git.dvyukov@google.com>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <85d8b0c00dc94cecc64aedbe52215505a791d5e6.1738772628.git.dvyukov@google.com>
Subject: [PATCH v5 1/8] perf report: Add machine parallelism
From: Dmitry Vyukov <dvyukov@google.com>
To: namhyung@kernel.org, irogers@google.com
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dmitry Vyukov <dvyukov@google.com>, Arnaldo Carvalho de Melo <acme@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Add calculation of the current parallelism level (number of threads actively
running on CPUs). The parallelism level can be shown in reports on its own,
and to calculate latency overheads.

Signed-off-by: Dmitry Vyukov <dvyukov@google.com>
Cc: Namhyung Kim <namhyung@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Ian Rogers <irogers@google.com>
Cc: linux-perf-users@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 tools/perf/builtin-report.c     | 1 +
 tools/perf/util/addr_location.c | 1 +
 tools/perf/util/addr_location.h | 2 ++
 tools/perf/util/event.c         | 3 +++
 tools/perf/util/machine.c       | 7 +++++++
 tools/perf/util/machine.h       | 6 ++++++
 6 files changed, 20 insertions(+)

diff --git a/tools/perf/builtin-report.c b/tools/perf/builtin-report.c
index f5fbd670d619a..0d9bd090eda71 100644
--- a/tools/perf/builtin-report.c
+++ b/tools/perf/builtin-report.c
@@ -1568,6 +1568,7 @@ int cmd_report(int argc, const char **argv)
 	report.tool.cgroup		 = perf_event__process_cgroup;
 	report.tool.exit		 = perf_event__process_exit;
 	report.tool.fork		 = perf_event__process_fork;
+	report.tool.context_switch	 = perf_event__process_switch;
 	report.tool.lost		 = perf_event__process_lost;
 	report.tool.read		 = process_read_event;
 	report.tool.attr		 = process_attr;
diff --git a/tools/perf/util/addr_location.c b/tools/perf/util/addr_location.c
index 51825ef8c0ab7..007a2f5df9a6a 100644
--- a/tools/perf/util/addr_location.c
+++ b/tools/perf/util/addr_location.c
@@ -17,6 +17,7 @@ void addr_location__init(struct addr_location *al)
 	al->cpumode = 0;
 	al->cpu = 0;
 	al->socket = 0;
+	al->parallelism = 1;
 }
 
 /*
diff --git a/tools/perf/util/addr_location.h b/tools/perf/util/addr_location.h
index d8ac0428dff23..36aaa45445f24 100644
--- a/tools/perf/util/addr_location.h
+++ b/tools/perf/util/addr_location.h
@@ -21,6 +21,8 @@ struct addr_location {
 	u8	      cpumode;
 	s32	      cpu;
 	s32	      socket;
+	/* Same as machine.parallelism but within [1, nr_cpus]. */
+	int	      parallelism;
 };
 
 void addr_location__init(struct addr_location *al);
diff --git a/tools/perf/util/event.c b/tools/perf/util/event.c
index aac96d5d19170..3d3ac58e1c660 100644
--- a/tools/perf/util/event.c
+++ b/tools/perf/util/event.c
@@ -767,6 +767,9 @@ int machine__resolve(struct machine *machine, struct addr_location *al,
 			al->socket = env->cpu[al->cpu].socket_id;
 	}
 
+	/* Account for possible out-of-order switch events. */
+	al->parallelism = min(max(machine->parallelism, 1), machine__nr_cpus_avail(machine));
+
 	if (al->map) {
 		if (symbol_conf.dso_list &&
 		    (!dso || !(strlist__has_entry(symbol_conf.dso_list,
diff --git a/tools/perf/util/machine.c b/tools/perf/util/machine.c
index 2d51badfbf2e2..0e65c5377f983 100644
--- a/tools/perf/util/machine.c
+++ b/tools/perf/util/machine.c
@@ -94,6 +94,8 @@ int machine__init(struct machine *machine, const char *root_dir, pid_t pid)
 	machine->comm_exec = false;
 	machine->kernel_start = 0;
 	machine->vmlinux_map = NULL;
+	/* There is no initial context switch in, so we start at 1. */
+	machine->parallelism = 1;
 
 	machine->root_dir = strdup(root_dir);
 	if (machine->root_dir == NULL)
@@ -677,8 +679,11 @@ int machine__process_aux_output_hw_id_event(struct machine *machine __maybe_unus
 int machine__process_switch_event(struct machine *machine __maybe_unused,
 				  union perf_event *event)
 {
+	bool out = event->header.misc & PERF_RECORD_MISC_SWITCH_OUT;
+
 	if (dump_trace)
 		perf_event__fprintf_switch(event, stdout);
+	machine->parallelism += out ? -1 : 1;
 	return 0;
 }
 
@@ -1900,6 +1905,8 @@ int machine__process_exit_event(struct machine *machine, union perf_event *event
 	if (dump_trace)
 		perf_event__fprintf_task(event, stdout);
 
+	/* There is no context switch out before exit, so we decrement here. */
+	machine->parallelism--;
 	if (thread != NULL) {
 		if (symbol_conf.keep_exited_threads)
 			thread__set_exited(thread, /*exited=*/true);
diff --git a/tools/perf/util/machine.h b/tools/perf/util/machine.h
index 2e5a4cb342d82..a5f28652873ce 100644
--- a/tools/perf/util/machine.h
+++ b/tools/perf/util/machine.h
@@ -50,6 +50,12 @@ struct machine {
 		u64	  text_start;
 		u64	  text_end;
 	} sched, lock, traceiter, trace;
+	/*
+	 * The current parallelism level (number of threads that run on CPUs).
+	 * This value can be less than 1, or larger than the total number
+	 * of CPUs, if events are poorly ordered.
+	 */
+	int		  parallelism;
 	pid_t		  *current_tid;
 	size_t		  current_tid_sz;
 	union { /* Tool specific area */
-- 
2.48.1.362.g079036d154-goog

