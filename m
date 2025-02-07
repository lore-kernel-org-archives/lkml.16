Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDBAE1DD9A8
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 23:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738970703; cv=none; b=EDQGSZJVw6yBq0UkOyM+Ad+zsqcrGDJK/AmtAaO7Hh9SI7LAx1TbV1LDWn7CotSlh84qjLuWv2aMkXDjbApVjdX1DDGWyxwtMqLfu/5DqDpeKBOQdo1i8t+ks5LPJuEFNgs5EJ3ugyMg2gZs5HtyJNpsuD8TNVLFG/6zj2UHWsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738970703; c=relaxed/simple;
	bh=zYNGAkgMdd9XUiROyIWPJ+Mlzc02RJhIL7WMmuG/ANk=;
	h=Date:In-Reply-To:Message-Id:Mime-Version:References:Subject:From:
	 To:Content-Type; b=hZqwBY2WGv5x1c9FIbMTMao9LQb3ekFcrp8ftKgU7MCXy8HDE2NGoPDrrlNbHxPVWqjKZDg47Z1Gg04SjC77X7zTH77Ok5hD9WaN1MKxt/V7pnyGnDGn46rwSJqmlzXQv/eVnZEaUmVYUDUzRcOVHVgDk/W9Lump3Zh0hHDhVbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YCH63TyX; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YCH63TyX"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6f2c7008c05so39238677b3.0
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 15:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738970701; x=1739575501; darn=vger.kernel.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SK5AV+lqqx4bn5Q1XZOeQFYE3IU1Rh1nSkTxsM9kwPs=;
        b=YCH63TyXDwQb4STHaWAL+hUqUdTcrNhfKwB/o5vzjOUIhohBRztfM98IeRkAgI8f3P
         xG6ZiXJywzOdS88kNfJ1dLlw72k9jZs9KSZZdyptKiaybvwMqoPYDO2z7VQCI7pGD4So
         Ae9hLOyE+07dsXSbysyhcIWma8368O7apF+phCD/6edwa5qjRFCd53Vg2R9gG4cCVo6i
         hQmqXh2faIIi1U/pClngYCA9h0gAb/q5zXC8J2mcpnkNO2Vz5oq8JGmcKFDkJWUNhwjc
         7teFCT9ujYgvTflwda37iIIUa7f3LWFK/80VlCQ3TpTbe6iCONyIqktPnTC+Ze2yvzXX
         zgGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738970701; x=1739575501;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SK5AV+lqqx4bn5Q1XZOeQFYE3IU1Rh1nSkTxsM9kwPs=;
        b=Bf9ikVU8uc1NRQmGzQMRkSKiwVyLuCytKn89CPhcevXxf9bPOY4PB1wCNriAE5NEuc
         O2hduTQ9Bcg3EVC1Cw+VHOgT2+spdp6pLn4R1DniB3q/34u85f9wlx9dyxsHEpi8XpBj
         ZjkcF0Y4L+FayzUXqDSn0hPvXMwY3+31P8GVbeMGRGXAh5Q8J/K1zv9Xc7yBJtHRj3V3
         1qCOdGpJIDFEFmVTxC4Us8GgQoyOGedQnshyoeLGerOiYGpDcNjtzMW/MkGaD2YWZFxZ
         AXfndz+4YMSQypkCysCz9+ng7S+jYopAV0sCcEz8+Ur9QxqQCaDl5XXUhheRalLug/oT
         EcwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWVrbHGQChvQp1empoEUCzSPZwB2dl+8R8vB3oNvWLo0UeoJZjW2cBaHNVi4SEWFhFAs7Gy7AhC08M9zA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMa97ecqQDGVI5nB4VqbdjWWFgtNeJ5tHrhiq65/J5K7G5L9+5
	QIL/1okBNPxC197uhwUp4zR6gVU2aa2X/GjkJRtNCuVZoLPzx9yrIcySCX8BtnK9DZxcR67OS6v
	e/MzRSA==
X-Google-Smtp-Source: AGHT+IGNMSvc4/dmPsVB5ZKRDbOu0NNtmtkE0ZYHFYRHCb/11YooZqZk50AbSjXlheuxley0tKZG/Im1zyjt
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:79e4:4a45:1e80:ace5])
 (user=irogers job=sendgmr) by 2002:a05:690c:9315:b0:6f9:a402:ff3e with SMTP
 id 00721157ae682-6f9b2960936mr337647b3.5.1738970700926; Fri, 07 Feb 2025
 15:25:00 -0800 (PST)
Date: Fri,  7 Feb 2025 15:24:43 -0800
In-Reply-To: <20250207232452.994822-1-irogers@google.com>
Message-Id: <20250207232452.994822-3-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250207232452.994822-1-irogers@google.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Subject: [PATCH v2 2/7] perf maps: Switch modules tree walk to io_dir__readdir
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

Compared to glibc's opendir/readdir this lowers the max RSS of perf
record by 1.8MB on a Debian machine.

Acked-by: Namhyung Kim <namhyung@kernel.org>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/machine.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/tools/perf/util/machine.c b/tools/perf/util/machine.c
index 2d51badfbf2e..bdd7969533c6 100644
--- a/tools/perf/util/machine.c
+++ b/tools/perf/util/machine.c
@@ -37,6 +37,7 @@
 #include <internal/lib.h> // page_size
 #include "cgroup.h"
 #include "arm64-frame-pointer-unwind-support.h"
+#include <api/io_dir.h>
 
 #include <linux/ctype.h>
 #include <symbol/kallsyms.h>
@@ -1354,25 +1355,21 @@ static int maps__set_module_path(struct maps *maps, const char *path, struct kmo
 
 static int maps__set_modules_path_dir(struct maps *maps, const char *dir_name, int depth)
 {
-	struct dirent *dent;
-	DIR *dir = opendir(dir_name);
+	struct io_dirent64 *dent;
+	struct io_dir iod;
 	int ret = 0;
 
-	if (!dir) {
+	io_dir__init(&iod, open(dir_name, O_CLOEXEC | O_DIRECTORY | O_RDONLY));
+	if (iod.dirfd < 0) {
 		pr_debug("%s: cannot open %s dir\n", __func__, dir_name);
 		return -1;
 	}
 
-	while ((dent = readdir(dir)) != NULL) {
+	while ((dent = io_dir__readdir(&iod)) != NULL) {
 		char path[PATH_MAX];
-		struct stat st;
 
-		/*sshfs might return bad dent->d_type, so we have to stat*/
 		path__join(path, sizeof(path), dir_name, dent->d_name);
-		if (stat(path, &st))
-			continue;
-
-		if (S_ISDIR(st.st_mode)) {
+		if (io_dir__is_dir(&iod, dent)) {
 			if (!strcmp(dent->d_name, ".") ||
 			    !strcmp(dent->d_name, ".."))
 				continue;
@@ -1405,7 +1402,7 @@ static int maps__set_modules_path_dir(struct maps *maps, const char *dir_name, i
 	}
 
 out:
-	closedir(dir);
+	close(iod.dirfd);
 	return ret;
 }
 
-- 
2.48.1.502.g6dc24dfdaf-goog

