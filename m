Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42DCC278159
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 18:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744224004; cv=none; b=HeiME8L1+IpSYfiIdXXV2y/3C+MpRqbTHdzIAOBY4QbDtvFG4K611U4L+3oaQqErhXlz7ijjEzv7uhl+fPAEbrW+uGFGJSDc1voIKJ5AuExQTzRdRsWta2N48iioxeDIcUobIeBP/i5KK/CVMcxELO2Ic+5FfVZNJTdaGDtyxWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744224004; c=relaxed/simple;
	bh=YByLGt5IbqoulT7McuNVKx1lx1ehCr8GvBpOhQdoaHM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=PbCh2D+tWV3ejtOKJZjfoXDoZOQwskqXtPpKbWJwFlz5Abcxcte70dw8X7WruZlXBLED8qbz+A9lh9c6sZe49rVzFlVANw0J3ZqwlVFLWYGvOK+K9Vhu8XiIdVMqBRMpBu96CeLaCkt65tzui0rixy8kddqdwHCsYon7CEa4Dxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ctshao.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=V5THz1oY; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ctshao.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V5THz1oY"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-af9b25da540so19981a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 11:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744224002; x=1744828802; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Z2A0w1cSwfGcyN3wePDGb03110dCs4MMvwp+DVzVxCo=;
        b=V5THz1oYWOKQK7pSBO1ynAJeVfQyStfK+G+PwM/NyyZlwFfM6Y1gK/FqvSGuXJ6HRZ
         N/DmGOCXxVNK8w/c/N4uR9jKU6fAW304q5K//LGq1QTUdHS3QqNfluBMymmgu+VyLDiZ
         FZrlWCaScVEZkab91qt1LMSCJDUZiiMKFpjJ/Fw5wKYdRvXegAT5SU4y5IK+hWMas0+X
         y5lHKkJTBQ7by0Jmpfl0po9P+LDmMmam8MJq8XIC4gEFnK5KtLnoLYGSsWqSEEkYL5TB
         yYIuNaQr0NdGEd1+OLTwYDQ1UoUWgmCujxKG3BP2veTqt4+dGzrZAiYE59O+wwyAkV2+
         4Egg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744224002; x=1744828802;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z2A0w1cSwfGcyN3wePDGb03110dCs4MMvwp+DVzVxCo=;
        b=MeKOwk7vcV6czd9Bc8xnXpxtp7Eow3I1ogR6ZeE69fvQ27HuX+qK/7uiiM8s5sVQiw
         /pJJvMubmMgprKX9auta8s12mj2mPRY1ajUI2cI+nqWCVFL4LQUjmBhNISR6JUe95hJZ
         s0M4u0uptnfhj9ARLOblRKGSLRjDNpffocC9+lpKZ6HR6jPAGTuj58ZWtDR518swdJPj
         WJEE6OmFuHD5JMFWiRfbaPVvWFixEpUVfZ2sG2vcfAAgtt1RCS1zFdx7zMlegiPPHE1B
         Zn78Ncm2DCKxlAwi3jPZixLoBlNgGoIw55Pm/Afu1APtGdnxWtqVkW3DWw7DzFeCMm4f
         7+hw==
X-Gm-Message-State: AOJu0YwcnWQl44OL53uApkDoooBOdsGwJFxA4OJ3rkke+JLlav/7LDWo
	f9Ji36q4aVIoTzauTz2meQteMbqB5i6XH9a+hkIJPWlOAO/lWks20bkYbxCuQXDx+KFMthbg6FL
	jKCf3SDZrBtdWDPypYkA7BcXzRkhRlAgY4MO9TFQzaDymGyh71GGPECX8YpWPh28Wx9l94esVpr
	doyIIpz4tCm+cHoJqXm7awzCMgHqdyDriNsk0RVqJg
X-Google-Smtp-Source: AGHT+IGb8sdlEq0WoN0OnV7IFDWAwCfVL3+wiVZXB8wDjM3cvPrWZregl/hVgJRrnfqNStxYzSMa0kfA5zM=
X-Received: from pleg18.prod.google.com ([2002:a17:902:e392:b0:223:f59e:ae50])
 (user=ctshao job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f60e:b0:223:faf5:c82
 with SMTP id d9443c01a7336-22ac3f3222amr45795565ad.8.1744224002399; Wed, 09
 Apr 2025 11:40:02 -0700 (PDT)
Date: Wed,  9 Apr 2025 11:39:30 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250409183958.1540709-1-ctshao@google.com>
Subject: [PATCH v2] perf report: Skip unsupported new event types
From: Chun-Tse Shao <ctshao@google.com>
To: linux-kernel@vger.kernel.org
Cc: Chun-Tse Shao <ctshao@google.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, peterz@infradead.org, mingo@redhat.com, 
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org, 
	irogers@google.com, adrian.hunter@intel.com, kan.liang@linux.intel.com, 
	dvyukov@google.com, ben.gainey@arm.com, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

`perf report` currently halts with an error when encountering
unsupported new event types (`event.type >= PERF_RECORD_HEADER_MAX`).
This patch modifies the behavior to skip these samples and continue
processing the remaining events.

Signed-off-by: Chun-Tse Shao <ctshao@google.com>
Suggested-by: Arnaldo Carvalho de Melo <acme@kernel.org>
Suggested-by: Namhyung Kim <namhyung@kernel.org>
---
 tools/perf/util/session.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/tools/perf/util/session.c b/tools/perf/util/session.c
index 60fb9997ea0d..b4c7973c34e2 100644
--- a/tools/perf/util/session.c
+++ b/tools/perf/util/session.c
@@ -1639,8 +1639,17 @@ static s64 perf_session__process_event(struct perf_session *session,
 	if (session->header.needs_swap)
 		event_swap(event, evlist__sample_id_all(evlist));
 
-	if (event->header.type >= PERF_RECORD_HEADER_MAX)
-		return -EINVAL;
+	if (event->header.type >= PERF_RECORD_HEADER_MAX) {
+		if (!PERF_ALIGN(event->header.size, sizeof(u64)))
+			/* perf should not support unaligned event */
+			ui__warning("Skip unaligned event type %u.\n", event->header.type);
+		else
+			/* This perf is outdated and does not support the latest event type. */
+			ui__warning("Unsupported type %u, please considering update perf.\n",
+				    event->header.type);
+		/* Skip unsupported/unaligned event by returning its size. */
+		return event->header.size;
+	}
 
 	events_stats__inc(&evlist->stats, event->header.type);
 
-- 
2.49.0.504.g3bcea36a83-goog

