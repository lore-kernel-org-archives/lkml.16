Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776932AF10
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 12:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746188378; cv=none; b=OFKEt9E8zL08WZETbKHBUE5rsP31S8bHdTC6cGkucg60LmUcN3OiDUhn1i8Ufj5qm4aE09FvoKw+d+d4D9TJlyJDwdz9cXrYnm/XyaARClOM3QBlD4P/crpIviktxvkC7s0OcwmnLLokAZ3IYVLk9J3QU0WXuF7RhrQPk+fSago=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746188378; c=relaxed/simple;
	bh=FENMmhfwQ5oOAyyY9sISJmBTjz0OnuIFHSOtBaRZYy8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SZrSwCwhAeC1xjkuAWuorOeHnmZrxb2pImFD7+nn8lL4jPO7N3HCIa+0oWYjzzDYMC1q0WbAyP3dm6BSRmx6/Ph1fxTOmgDy1mHBEGf3OMQrZWWc9tucOlY+NtxIopV21aLGtLLv6KFDieHwbDG0qfTv+XJM250erJO985aFmx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=U1FW+5Aa; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="U1FW+5Aa"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso12353715e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 05:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1746188373; x=1746793173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qjSigm8B1BUt7izc6EoCs9OHgMLeKXN4gHZNIhC4uLY=;
        b=U1FW+5AaDNuYGPGS6vEf6no5Nio/sLPdPP7dtPYR22Pu+E19JuVBMrx8pE6bOqE29W
         xGhlm8DyZ3ED+f8qSXX6Yk3jzfVuvvjuUz1XbXo4j/yLy9etY6lsa1Fqwt6/TUbYiqzL
         mnjOyzEMe2saDO2ah8lHDV0QfC+m82wIiMHTtErLcOudPneN5J2ZTWABAgwEMkeKPJWf
         hWQfRxDcnVebhIu0vapimtnU3xnib1lrjLkBaZY43Pe7UeH1xBhrdHAQCYuj9W92nhFm
         91FBfHeZQC2LpAjusba4bSqjZuLHrWb/recOfGqFmPXBVV0T2q7OIUNAWgWEsba8O6rv
         sH5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746188373; x=1746793173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qjSigm8B1BUt7izc6EoCs9OHgMLeKXN4gHZNIhC4uLY=;
        b=YujkD9ex3iP9MEnVQhxZlLVVWegPMeuIY+EJugdUMIBwpmTjhn9F9NzNNJo0KWHY92
         pSIn9tJtLEpqfhqARsOIMMY1KW6x+g+6BZr7yVvBEM/W3lleIUnmWnK/hKQ7FhAzHEid
         EdxG3dw0A6u2mb1tpSa+qe4BcO+VfbVbrSDAk0CipM3I144cI4z6CySwHnl7c4WdjpiP
         KqrXk+cVnheZvjB8TAofqbSaYKwsDL8v2sRLhesHUtn1rVULE/yd4BPpDIA2xE4lIv4m
         LaFsm+yGnrT4N8jBOOXyIg4YcrQ/uusYG9H5lxcKoeYKlTDmv21MskJa4zZvsnCAMUqx
         YEwg==
X-Forwarded-Encrypted: i=1; AJvYcCXU4xESWH3mEyFZq4J64POlQeqMrRp7zxnFyf91smvsbo61wSWF1uPZkhw5oUjrhyuAZbg8B0SRTHo6FzE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbUqbUecx1N5/Fjn4yzptOOB4eoEM/5u6auAS3FFi/arMmSsC+
	1mjXE7iozk0e1v0vuG7EtacLeMjFV+ANH7Eu0O2jJbuESgu3KyVEv1hI6KD1nw8=
X-Gm-Gg: ASbGncsRrcNzLYWrBW0cQBC6BwpMn8T8JObWMwpUB1M4WtlV66iXVMapFcnbjCl3TSk
	h18fFWNjj/2joMNJD6lBftkup/6LDmE9R31O0cFhzlCz07c2MS4oBW6m8Xm6IRcdWPtPwuz6n6o
	FdF5e8ylsGHfQMfbfhI/JtCb8kIzPqFusecxKvL6twB0M7mE5RX7UPcTDwT4b7+D44DZd5VAJmS
	QxzB9wU+okHvrmYSh+7ECChE29ezlXIXyJcSeeB8ecKrs4fUCINuw06AijYZs4+t37e5eL/EPRV
	hZIOqn/hC6Zyp9hd0aqUNKImx++Px6v3BDBO96Hid9LrzTvmWLcu8Thbmk1Y5DzdZFG9wuaWlbu
	MyCntDLH4vjlWCCa5nwdziT/VXPkfdY9LXVxYQj79qE2mtggG7dk=
X-Google-Smtp-Source: AGHT+IGcxrAqqNqdPnNdNq7itJRByTv87m6oPO4uxZVjY1/A+JmfUDtTIVX5DaOH4UncYJ+Fr7Scxw==
X-Received: by 2002:a05:600c:6dcf:b0:441:bbe5:f562 with SMTP id 5b1f17b1804b1-441bbe5f680mr16473815e9.16.1746188372670;
        Fri, 02 May 2025 05:19:32 -0700 (PDT)
Received: from raven.intern.cm-ag (p200300dc6f46c100023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f46:c100:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b8a286cfsm42312875e9.29.2025.05.02.05.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 05:19:32 -0700 (PDT)
From: Max Kellermann <max.kellermann@ionos.com>
To: tj@kernel.org,
	hannes@cmpxchg.org,
	mkoutny@suse.com,
	cgroups@vger.kernel.org.com,
	linux-kernel@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>
Subject: [PATCH] kernel/cgroup/pids: add "pids.forks" counter
Date: Fri,  2 May 2025 14:19:30 +0200
Message-ID: <20250502121930.4008251-1-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Counts the number of fork()/clone() calls, similar to the "processes"
row in /proc/stat, but per cgroup.  This helps with analyzing who was
responsible for peaks in the global "processes" counter.

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 Documentation/admin-guide/cgroup-v2.rst |  5 +++++
 kernel/cgroup/pids.c                    | 18 ++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 1a16ce68a4d7..88f996e083e2 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -2294,6 +2294,11 @@ PID Interface Files
 	The maximum value that the number of processes in the cgroup and its
 	descendants has ever reached.
 
+  pids.forks
+	A read-only single value file which exists on non-root cgroups.
+
+	The number of fork()/clone() calls (whether successful or not).
+
   pids.events
 	A read-only flat-keyed file which exists on non-root cgroups. Unless
 	specified otherwise, a value change in this file generates a file
diff --git a/kernel/cgroup/pids.c b/kernel/cgroup/pids.c
index 8f61114c36dd..fb18741f85ba 100644
--- a/kernel/cgroup/pids.c
+++ b/kernel/cgroup/pids.c
@@ -49,6 +49,9 @@ enum pidcg_event {
 struct pids_cgroup {
 	struct cgroup_subsys_state	css;
 
+	/* the "pids.forks" counter */
+	atomic64_t			forks;
+
 	/*
 	 * Use 64-bit types so that we can safely represent "max" as
 	 * %PIDS_MAX = (%PID_MAX_LIMIT + 1).
@@ -147,6 +150,7 @@ static void pids_charge(struct pids_cgroup *pids, int num)
 	struct pids_cgroup *p;
 
 	for (p = pids; parent_pids(p); p = parent_pids(p)) {
+		atomic64_add(num, &p->forks);
 		int64_t new = atomic64_add_return(num, &p->counter);
 
 		pids_update_watermark(p, new);
@@ -168,6 +172,7 @@ static int pids_try_charge(struct pids_cgroup *pids, int num, struct pids_cgroup
 	struct pids_cgroup *p, *q;
 
 	for (p = pids; parent_pids(p); p = parent_pids(p)) {
+		atomic64_add(num, &p->forks);
 		int64_t new = atomic64_add_return(num, &p->counter);
 		int64_t limit = atomic64_read(&p->limit);
 
@@ -342,6 +347,14 @@ static int pids_max_show(struct seq_file *sf, void *v)
 	return 0;
 }
 
+static s64 pids_forks_read(struct cgroup_subsys_state *css,
+			   struct cftype *cft)
+{
+	struct pids_cgroup *pids = css_pids(css);
+
+	return atomic64_read(&pids->forks);
+}
+
 static s64 pids_current_read(struct cgroup_subsys_state *css,
 			     struct cftype *cft)
 {
@@ -404,6 +417,11 @@ static struct cftype pids_files[] = {
 		.flags = CFTYPE_NOT_ON_ROOT,
 		.read_s64 = pids_peak_read,
 	},
+	{
+		.name = "forks",
+		.read_s64 = pids_forks_read,
+		.flags = CFTYPE_NOT_ON_ROOT,
+	},
 	{
 		.name = "events",
 		.seq_show = pids_events_show,
-- 
2.47.2

