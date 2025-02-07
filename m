Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72D01DE4C8
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 23:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738970708; cv=none; b=Q4+RxfF1mnl/r/D6QC86h+I9eA40FH3gDRodFZk/v2RwSHnT4RKNd3dgKdMQFGneVqFhCHHPAGiwnow4vAl9/HNJEkVozeYBLTnt8O2qihhoqODjmj0hILjS7kELmR4G9paqzb8rvwlJPwCVWB+3lgLEhf29P0S6SBcCrH8OT5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738970708; c=relaxed/simple;
	bh=5aRNT+AFzX7JKDjBTlrIYAKWaFe7b1kC3Ps8PgQ3sAg=;
	h=Date:In-Reply-To:Message-Id:Mime-Version:References:Subject:From:
	 To:Content-Type; b=tBHhwYk8QN8j0/mA0Pe83gMi9dRyUCFhhCMdIw+5UmkwZ2Ndy9Iimww7tW30UztG5qoEC4e0plIfevnO/g9qzx3svN0sHtsTMwLTkkrEeVOX+4ozKewaKe4amWseHFFHi/jwSKxoz9LdrsYDif1ui50jJobabrz+b+y6iQwTRTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4gteXJ6G; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4gteXJ6G"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6f97ec73df7so15167607b3.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 15:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738970705; x=1739575505; darn=vger.kernel.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KS+tqbMW67c9gn9HPH93hQ26ck+oWW3I2CAzT0FW6oo=;
        b=4gteXJ6GPpm+0dqem38U4iZGdC593KVy1HjwiMQaGMA6hxD0c9wXjRVva8fD9lHFcj
         SjG3lBpfh0W7WPYOyRLcNb2cQFUqKyrGxr2WNOmFyLOlk0v5QLHB2OzOhl25ZbmWR4Qc
         LTXLuwAqLZIYI+R7GjrSLiyMa4MJBE58NoBogLQPcsPss7lRr4nVb9n8QpIBIJMbghS+
         zNpAoyj4VuEbCIbmxk/EZbJPEH+9lHTFWyinYz41ThdcbWTeXQNW97yIm6MrfMMEe0+h
         1TivzFFgHE03Om8Xf47INV1/rxMl9URePHztoJ04rtlm7SySKQZ6XULMBwsnCIsvwh+u
         QThw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738970705; x=1739575505;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KS+tqbMW67c9gn9HPH93hQ26ck+oWW3I2CAzT0FW6oo=;
        b=Q4h6hIGU4cERVk/y266bfOJHvr9bSIxFxO3VsIq4l56kecTtcRPBSJASNsUBW6Vwrj
         DyKwfmyNsxTHqd/OJEOJE9Wjq4PgrohCq2fT4HxE/YnTfwvt2GFAy4NusqeyqJPvubX+
         gkscPXJaDRVPuTCmGqC77M0r/zC4DI8NFRPXq3sgj2bahHyuu9yukH6rQ/uVqUnNE5cj
         O03623DarKP40RtSr2vy3bBTuSEuS9sx/Om0ob9R96yw2rNSd1TSjVN+B+m1+p2cS98z
         bWY9A8K0At1xMQGUABd/eGIPhcXh0uVPtjtQFxiW0uLMmiypw1dbYmR+FbsJF9SWrR42
         pqSg==
X-Forwarded-Encrypted: i=1; AJvYcCXtRWmXZvTjUwedXkX9hR8cAu71HML++GFk+joBJAKPVnDEBTK3Qv1rLdYbxoImPatEzWTG2Y+ndjCTCIk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7+k/4IiJZI8D5jkWAJ6bzBFtqBHswN4BssC7ZoDE3NDl3GGH6
	jXxRbTrGvTDlhR3CeH1AJ0EhmayogtyQ/N0YZfPtif5UIq2mZ5Z9kqUmFngVO+LmzyJ7R9a78AV
	wnVsg9Q==
X-Google-Smtp-Source: AGHT+IENQY6UASBJx0jxxx9ueRpM6qeWuNuVIi1ghJIH/SvVzdy0j/DypkgqZpMb2qmbWhaduC8Lvc2+e2cx
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:79e4:4a45:1e80:ace5])
 (user=irogers job=sendgmr) by 2002:a05:690c:25c2:b0:6f3:e216:9dd with SMTP id
 00721157ae682-6f9b2914de9mr477627b3.4.1738970705693; Fri, 07 Feb 2025
 15:25:05 -0800 (PST)
Date: Fri,  7 Feb 2025 15:24:45 -0800
In-Reply-To: <20250207232452.994822-1-irogers@google.com>
Message-Id: <20250207232452.994822-5-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250207232452.994822-1-irogers@google.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Subject: [PATCH v2 4/7] perf header: Switch mem topology to io_dir__readdir
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Sam James <sam@gentoo.org>, 
	Jesper Juhl <jesperjuhl76@gmail.com>, James Clark <james.clark@linaro.org>, 
	Zhongqiu Han <quic_zhonhan@quicinc.com>, Yicong Yang <yangyicong@hisilicon.com>, 
	Thomas Richter <tmricht@linux.ibm.com>, Michael Petlan <mpetlan@redhat.com>, 
	Veronika Molnarova <vmolnaro@redhat.com>, Anne Macedo <retpolanne@posteo.net>, 
	Dominique Martinet <asmadeus@codewreck.org>, 
	Jean-Philippe Romain <jean-philippe.romain@foss.st.com>, Junhao He <hejunhao3@huawei.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	"=?UTF-8?q?Krzysztof=20=C5=81opatowski?=" <krzysztof.m.lopatowski@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Switch memory_node__read and build_mem_topology from opendir/readdir
to io_dir__readdir, with smaller stack allocations. Reduces peak
memory consumption of perf record by 10kb.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/header.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/tools/perf/util/header.c b/tools/perf/util/header.c
index d06aa86352d3..1900965f8752 100644
--- a/tools/perf/util/header.c
+++ b/tools/perf/util/header.c
@@ -44,6 +44,7 @@
 #include "build-id.h"
 #include "data.h"
 #include <api/fs/fs.h>
+#include <api/io_dir.h>
 #include "asm/bug.h"
 #include "tool.h"
 #include "time-utils.h"
@@ -1311,11 +1312,11 @@ static int memory_node__read(struct memory_node *n, unsigned long idx)
 {
 	unsigned int phys, size = 0;
 	char path[PATH_MAX];
-	struct dirent *ent;
-	DIR *dir;
+	struct io_dirent64 *ent;
+	struct io_dir dir;
 
 #define for_each_memory(mem, dir)					\
-	while ((ent = readdir(dir)))					\
+	while ((ent = io_dir__readdir(&dir)) != NULL)			\
 		if (strcmp(ent->d_name, ".") &&				\
 		    strcmp(ent->d_name, "..") &&			\
 		    sscanf(ent->d_name, "memory%u", &mem) == 1)
@@ -1324,9 +1325,9 @@ static int memory_node__read(struct memory_node *n, unsigned long idx)
 		  "%s/devices/system/node/node%lu",
 		  sysfs__mountpoint(), idx);
 
-	dir = opendir(path);
-	if (!dir) {
-		pr_warning("failed: can't open memory sysfs data\n");
+	io_dir__init(&dir, open(path, O_CLOEXEC | O_DIRECTORY | O_RDONLY));
+	if (dir.dirfd < 0) {
+		pr_warning("failed: can't open memory sysfs data '%s'\n", path);
 		return -1;
 	}
 
@@ -1338,20 +1339,20 @@ static int memory_node__read(struct memory_node *n, unsigned long idx)
 
 	n->set = bitmap_zalloc(size);
 	if (!n->set) {
-		closedir(dir);
+		close(dir.dirfd);
 		return -ENOMEM;
 	}
 
 	n->node = idx;
 	n->size = size;
 
-	rewinddir(dir);
+	io_dir__rewinddir(&dir);
 
 	for_each_memory(phys, dir) {
 		__set_bit(phys, n->set);
 	}
 
-	closedir(dir);
+	close(dir.dirfd);
 	return 0;
 }
 
@@ -1374,8 +1375,8 @@ static int memory_node__sort(const void *a, const void *b)
 static int build_mem_topology(struct memory_node **nodesp, u64 *cntp)
 {
 	char path[PATH_MAX];
-	struct dirent *ent;
-	DIR *dir;
+	struct io_dirent64 *ent;
+	struct io_dir dir;
 	int ret = 0;
 	size_t cnt = 0, size = 0;
 	struct memory_node *nodes = NULL;
@@ -1383,14 +1384,14 @@ static int build_mem_topology(struct memory_node **nodesp, u64 *cntp)
 	scnprintf(path, PATH_MAX, "%s/devices/system/node/",
 		  sysfs__mountpoint());
 
-	dir = opendir(path);
-	if (!dir) {
+	io_dir__init(&dir, open(path, O_CLOEXEC | O_DIRECTORY | O_RDONLY));
+	if (dir.dirfd < 0) {
 		pr_debug2("%s: couldn't read %s, does this arch have topology information?\n",
 			  __func__, path);
 		return -1;
 	}
 
-	while (!ret && (ent = readdir(dir))) {
+	while (!ret && (ent = io_dir__readdir(&dir))) {
 		unsigned int idx;
 		int r;
 
@@ -1419,7 +1420,7 @@ static int build_mem_topology(struct memory_node **nodesp, u64 *cntp)
 			cnt += 1;
 	}
 out:
-	closedir(dir);
+	close(dir.dirfd);
 	if (!ret) {
 		*cntp = cnt;
 		*nodesp = nodes;
-- 
2.48.1.502.g6dc24dfdaf-goog

