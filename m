Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B28288CB3
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 18:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748974614; cv=none; b=G+7pZiXtlZiLVIcB4FxFSZdwU2gOwTXhECzRaBVg9+hc2oJYFYOaT7Br75bSHzbTzRbtFetXdHaQC/iLCgdLaj+B+z/86kuT+T01V7CFCV9fUK/UClILoDToaVnmV7awWpTTWEy7tl1WTlKxyE0qk4scbAXXDJ0uLwqAQJrq2l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748974614; c=relaxed/simple;
	bh=wBMwFZ65rrg8ho4R1itK1EGQahIG96i90ewd1ea9HYg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=icjbYkiUqbKBU5b5zR9BRY8QqIM9FOeWLjuKXxetXn4+ZVCuPreSk9MnDMylv/+Ogfd3zCli4g1Y/QshKYE231XCjKxc/aGBQvBDs260HWLLG3VlsBmBzIqCLTyEGiDPgZETDin7akNmNtSWjATgpOYvKMGBuNyDDp7jcj5YOL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ctshao.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FtvKk2i7; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ctshao.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FtvKk2i7"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-7394772635dso3940184b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 11:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748974612; x=1749579412; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XvHfZvteDDVqcCnEge2jWEzX4DjmZnrKZWBqnzvh3sM=;
        b=FtvKk2i7DM7s4ZJvbtTccyj9kDRt5eJoEBNDFXUWW9GEP8doLWIVIgvoFmIJPpCEEV
         xe/hSdd2qZhh+FK3/8zj9JddLw8fEqaDwawppFcwrb4ZIMkEH1WtNGJSuKfg/hnEiSy1
         zOk0/zVEBjmCzJCyjRiv/6JIsaFxIwSlugA2WqEgjqAXD2IKZlFrbWqvJyoFC+J03O/W
         hkADPPrM6q4leOkfUcx4/ETS0Kr94eXQi1vuHehWvdl0xDwRJtfXVfxvhcW/MMCfDBpJ
         Ohj3RCV/0pl1VKycUaolJIi5Z9Oi+azEYLwrjydQsmOO1/7AAzWCbGCXElI7a+EvqYw9
         Jrpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748974612; x=1749579412;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XvHfZvteDDVqcCnEge2jWEzX4DjmZnrKZWBqnzvh3sM=;
        b=tmqWkr2dRMtwgZh5wAhM5q+JXnRxQOXzrCwZgL91bK9gd8YywTw3vu0oXRQlAdY3tL
         zG1BeVWmrYZTR8Ym/nPGla25tQ2CBa4iBN6UxbPvekSiNtnZno/fjk592A1muZOp9q4f
         jxiD2j2+LldugFDf6XfNc8iMmok+LT6gZMSopzj0hyfnzBQKXwecGrw1yUo6F9DO4Cy9
         OLQT7DWegJGsC5vzCzHL1dQE7DKA1UF9iUBYEM8/N91x0shL1LAHF5+PdIJGPlo+r8Gj
         eiJrxLCVdz6v0CdOj/5Ud2wB3d2vEOihN3or7FemCJGz7apJ59AStG2dep1cDO//Zyaa
         FTgg==
X-Gm-Message-State: AOJu0YyX7nQNYZIpT6bBbyVtytZHE9TjoN+c7mb0Ml418F0j9tiLUMSS
	/TVk2h55Gf7uUrTD0aWouMazKX5c7hLe3rGFFUz2TU/z+e/fuQ3zNgKn4GsxIGIOmkBwJI+NJWJ
	XA4rhIaP5/MjSLqMB4/BY519LGMStYKh8jyAhVUlzDmCwlSSu/0ZQMtFYYPANvHqLC00atSYCqM
	2lgE3w1M+rR63CQaYevZm/lcHRgm0EyCNwpT/EWXsk6oZa
X-Google-Smtp-Source: AGHT+IEuYjk9n2uExO2tYukINHmxBE9zmSFBuDwroUnzVDGF4KT2eakPJ9ADydhQfQMyjArCbTyiOhGBzlU=
X-Received: from pgbdh4.prod.google.com ([2002:a05:6a02:b84:b0:b2e:ce0c:b3fb])
 (user=ctshao job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:3944:b0:1f5:8622:5ecb
 with SMTP id adf61e73a8af0-21ae00c7013mr33177374637.34.1748974612100; Tue, 03
 Jun 2025 11:16:52 -0700 (PDT)
Date: Tue,  3 Jun 2025 11:15:54 -0700
In-Reply-To: <20250603181634.1362626-1-ctshao@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250603181634.1362626-1-ctshao@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250603181634.1362626-2-ctshao@google.com>
Subject: [PATCH v4 2/2] perf evsel: Find process with busy PMUs for EBUSY
From: Chun-Tse Shao <ctshao@google.com>
To: linux-kernel@vger.kernel.org
Cc: Chun-Tse Shao <ctshao@google.com>, Ian Rogers <irogers@google.com>, peterz@infradead.org, 
	mingo@redhat.com, acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org, adrian.hunter@intel.com, 
	kan.liang@linux.intel.com, james.clark@linaro.org, howardchu95@gmail.com, 
	weilin.wang@intel.com, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

It parses fdinfo with PMU type, comparing with the event which failed to
open, and report the processes causing EBUSY error.

Testing cycles and intel_pt//

  $ ./perf stat -e cycles &
  [1] 55569
  $ ./perf stat -e intel_pt// &
  [2] 55683
  $ ./perf stat -e intel_pt//
  Error:
  The PMU intel_pt counters are busy and in use by another process.
  Possible processes:
  55683 ./perf stat -e intel_pt//

Only perf with intel_pt was reported.

Reviewed-by: Ian Rogers <irogers@google.com>
Signed-off-by: Chun-Tse Shao <ctshao@google.com>
---
v4:
  Removed the first patch in v3 since it is merged.
  Retested to make sure the patch still work.

v3: lore.kernel.org/20241106003007.2112584-3-ctshao@google.com/
 tools/perf/util/evsel.c | 79 +++++++++++++++++++++++++++++------------
 1 file changed, 57 insertions(+), 22 deletions(-)

diff --git a/tools/perf/util/evsel.c b/tools/perf/util/evsel.c
index d55482f094bf..fa281ea15a25 100644
--- a/tools/perf/util/evsel.c
+++ b/tools/perf/util/evsel.c
@@ -3619,7 +3619,8 @@ static bool find_process(const char *name)
 	return ret ? false : true;
 }

-static int dump_perf_event_processes(char *msg, size_t size)
+static int dump_perf_event_processes(const struct perf_event_attr *failed_attr,
+				     char *msg, size_t size)
 {
 	DIR *proc_dir;
 	struct dirent *proc_entry;
@@ -3660,29 +3661,61 @@ static int dump_perf_event_processes(char *msg, size_t size)
 				continue;
 			/* Take care as readlink doesn't null terminate the string. */
 			if (!strncmp(buf, "anon_inode:[perf_event]", link_size)) {
-				int cmdline_fd;
-				ssize_t cmdline_size;
-
-				scnprintf(buf, sizeof(buf), "%s/cmdline", proc_entry->d_name);
-				cmdline_fd = openat(dirfd(proc_dir), buf, O_RDONLY);
-				if (cmdline_fd == -1)
-					continue;
-				cmdline_size = read(cmdline_fd, buf, sizeof(buf) - 1);
-				close(cmdline_fd);
-				if (cmdline_size < 0)
+				int fdinfo_fd;
+				ssize_t fdinfo_size;
+				char *line;
+				u32 perf_event_type = UINT32_MAX;
+
+				/* Let's check the PMU type reserved by this process */
+				scnprintf(buf, sizeof(buf), "%s/fdinfo/%s",
+					  proc_entry->d_name, fd_entry->d_name);
+				fdinfo_fd = openat(dirfd(proc_dir), buf, O_RDONLY);
+				fdinfo_size = read(fdinfo_fd, buf, sizeof(buf) - 1);
+				if (fdinfo_size < 0)
 					continue;
-				buf[cmdline_size] = '\0';
-				for (ssize_t i = 0; i < cmdline_size; i++) {
-					if (buf[i] == '\0')
-						buf[i] = ' ';
+				buf[fdinfo_size] = '\0';
+
+				line = strtok(buf, "\n");
+				while (line != NULL) {
+					if (sscanf(line,
+						   "perf_event_attr.type:\t%u",
+						   &perf_event_type) == 1)
+						break;
+					line = strtok(NULL, "\n");
 				}

-				if (printed == 0)
-					printed += scnprintf(msg, size, "Possible processes:\n");
-
-				printed += scnprintf(msg + printed, size - printed,
-						"%s %s\n", proc_entry->d_name, buf);
-				break;
+				/* Report the process which reserves the conflicted PMU. */
+				/* If fdinfo does not contain PMU type, report it too. */
+				if (perf_event_type == failed_attr->type ||
+				    perf_event_type == UINT32_MAX) {
+					int cmdline_fd;
+					ssize_t cmdline_size;
+
+					scnprintf(buf, sizeof(buf),
+						  "%s/cmdline",
+						  proc_entry->d_name);
+					cmdline_fd = openat(dirfd(proc_dir), buf, O_RDONLY);
+					if (cmdline_fd == -1)
+						continue;
+					cmdline_size = read(cmdline_fd, buf, sizeof(buf) - 1);
+					close(cmdline_fd);
+					if (cmdline_size < 0)
+						continue;
+					buf[cmdline_size] = '\0';
+					for (ssize_t i = 0; i < cmdline_size; i++) {
+						if (buf[i] == '\0')
+							buf[i] = ' ';
+					}
+
+					if (printed == 0)
+						printed += scnprintf(
+							msg, size,
+							"Possible processes:\n");
+
+					printed += scnprintf(msg + printed, size - printed,
+							"%s %s\n", proc_entry->d_name, buf);
+					break;
+				}
 			}
 		}
 		closedir(fd_dir);
@@ -3799,7 +3832,9 @@ int evsel__open_strerror(struct evsel *evsel, struct target *target,
 			msg, size,
 			"The PMU %s counters are busy and in use by another process.\n",
 			evsel->pmu ? evsel->pmu->name : "");
-		return printed + dump_perf_event_processes(msg + printed, size - printed);
+		return printed + dump_perf_event_processes(&evsel->core.attr,
+							   msg + printed,
+							   size - printed);
 		break;
 	case EINVAL:
 		if (evsel->core.attr.sample_type & PERF_SAMPLE_CODE_PAGE_SIZE && perf_missing_features.code_page_size)
--
2.49.0.1204.g71687c7c1d-goog

