Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193E8231CB0
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 04:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738901444; cv=none; b=OgG0MyvPMa4anxRCzdBFmFhKDPgYqnOaZcXdjClWdscDQ/2rNd3of9HjhntaBRclsfeRxNRawmYggOk0zUfAiICLc8ou4C+PT/kY+pfyOFTqFoo6EX89kZ+1uTMJu3+tCC6cgI9z3hGFVVDjTaimaBiDOPaJ8jVYCelhV7oT18w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738901444; c=relaxed/simple;
	bh=LKw6HaeW05jbHUxXDx+rmwHbEdYlclYGnPRLLJQzy60=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NhkzYEk1DzrN1q6mCemceakhOU/AqUicRSUZVzZsic1UWU34mBtFtvNuT3uTiz3ZHLHhbMYIna7KqYa6RM9xM+ezLSq/qtpRP2FBMFRbRmQoAQpxeo3PRortkV3bPIDAquks1XKfImDX8qcoVPvLzVZrE8sudkNmnd57nXQuO9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=UlhGKpb6; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="UlhGKpb6"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2f9dcc3f944so328279a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 20:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1738901442; x=1739506242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WiWK8iJRg8z+aUiF8sWc5hRLfRD7QwQ2HIsrRNActc8=;
        b=UlhGKpb6zXysr6SZqmUaiY2FtTJ8HiMF/75i4C3nvr7jnkkzah6EkEL0/Mu3UKYTqq
         jvV2d80ykSjq0K1tbAdLAkKFQkyJIHqdPbGGB0XNwJTOYX7je3mtIKsZefbeh/F/Ab6A
         9VhcBvjx0hsp90fz/bGDWeX5MfqllPgLtrkbiliNXMU4iyvcPWyCS7+8ix77gGWDk9T/
         eSgBz4MARdfsoGat/4E8sqiE+DqB1chv1Kg/lo7LDt0nkc1961Tifse3FLjGmNSsMBHK
         OkObHteYHG0/6BSI9ZIPWcCdHVdkvvU7GlnEKjkwpT17tkVcVdyK+AcN469qOAlIEeza
         W9yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738901442; x=1739506242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WiWK8iJRg8z+aUiF8sWc5hRLfRD7QwQ2HIsrRNActc8=;
        b=XOIA4uqmoXRhPeaTka48q9RqU3ZwG+wI8wBCQHkZKtHeIPqwkAQQRdC6/J6gFJ22RK
         Xsw5Dnbw5IYQKH1NIfhiKK/rHKJAn40fsz/K3OphuEDM4nVXvQAoq0cwIj+1EehFVvc3
         k3t1r7iwDFRGTa6qsxr3mLd6msZtxcZI08cg3f4NZAnymU6kve0M7o+9QjAgd58wWX+2
         pDjRQT7G8RU21d1oh6eNrlv8v8H3xNw9SZYlXNgIg1HFlBR5DeL/1NzsRwRoqzTd9/MT
         YSVoOPzz0BT+u2DnRXpbtDvcCQZ7yz1uI5u7p6NyDUmroWyCsX6dKhKUVGvvTarp6ist
         K78A==
X-Forwarded-Encrypted: i=1; AJvYcCVYQT5uFi/w/yQMuHJKZJmGBp3VCvgCNEFjQ/X0SqAkQoe/Ewl63vXvgvr6TFNZkLmIizEyiSVs+lmmm8M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzL4DXdm1ppEVTl82VTirV9Oy83tCxTtvyZeA13/mUz+KO1eC1E
	RA/SjNACdjQHvWtkW+2fjYYF24JnHp232CHaJGXzuYszbqk3Dx5T/yCrPdjuosQ=
X-Gm-Gg: ASbGncvtqO9GOsCyPBgOFLzToBhi+0CHm4Y3WpacZXsxvJ5ZXN5oAgSEZyNoWXUqExS
	myvXirMEVAjm8xcNQYMfaUshQ9SUUBtAl+vI4B7DXD5oQaVy1IgwyWu05TtltxCw8fe3cw/PcVt
	INNiWbvGa2O81e5qN/SHQi0NsR7eFBE0mksx2Q5DpT5j9b0oV/yT7zoZLsBvaPUharCHRx1jj7M
	Z39Bl6hAXPNwxXns1TSWRKZ2sXi8Jcix5tRt2v3DOW5sMTrQIz/QWRk607xlj57/zzzHuTfrEl8
	O55cZNPgvN/0j0MYQm++OLct5yqKgOrL7q62hrmFn+SaoOBGibze6Q==
X-Google-Smtp-Source: AGHT+IGfN8nWMRRbiHB1N/J5PGoY6ixrDg2dHrmz1XRhdmGLzjRZe+YvfBS7TcrzSJ8pWsfzRBB2Tw==
X-Received: by 2002:a05:6a20:4386:b0:1e1:a434:296b with SMTP id adf61e73a8af0-1ee03a23f1bmr1577240637.1.1738901442330;
        Thu, 06 Feb 2025 20:10:42 -0800 (PST)
Received: from C02DV8HUMD6R.bytedance.net ([139.177.225.244])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad51aee7fbasm2135485a12.46.2025.02.06.20.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 20:10:41 -0800 (PST)
From: Abel Wu <wuyun.abel@bytedance.com>
To: Johannes Weiner <hannes@cmpxchg.org>,
	Tejun Heo <tj@kernel.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Abel Wu <wuyun.abel@bytedance.com>,
	Yury Norov <yury.norov@gmail.com>,
	Bitao Hu <yaoma@linux.alibaba.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Chen Ridong <chenridong@huawei.com>
Cc: cgroups@vger.kernel.org (open list:CONTROL GROUP (CGROUP)),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 1/2] cgroup/rstat: Fix forceidle time in cpu.stat
Date: Fri,  7 Feb 2025 12:10:00 +0800
Message-Id: <20250207041012.89192-2-wuyun.abel@bytedance.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20250207041012.89192-1-wuyun.abel@bytedance.com>
References: <20250207041012.89192-1-wuyun.abel@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The commit b824766504e4 ("cgroup/rstat: add force idle show helper")
retrieves forceidle_time outside cgroup_rstat_lock for non-root cgroups
which can be potentially inconsistent with other stats.

Rather than reverting that commit, fix it in a way that retains the
effort of cleaning up the ifdef-messes.

Fixes: b824766504e4 ("cgroup/rstat: add force idle show helper")
Signed-off-by: Abel Wu <wuyun.abel@bytedance.com>
---
 kernel/cgroup/rstat.c | 29 +++++++++++++----------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/kernel/cgroup/rstat.c b/kernel/cgroup/rstat.c
index 5877974ece92..c2784c317cdd 100644
--- a/kernel/cgroup/rstat.c
+++ b/kernel/cgroup/rstat.c
@@ -613,36 +613,33 @@ static void cgroup_force_idle_show(struct seq_file *seq, struct cgroup_base_stat
 void cgroup_base_stat_cputime_show(struct seq_file *seq)
 {
 	struct cgroup *cgrp = seq_css(seq)->cgroup;
-	u64 usage, utime, stime, ntime;
+	struct cgroup_base_stat bstat;
 
 	if (cgroup_parent(cgrp)) {
 		cgroup_rstat_flush_hold(cgrp);
-		usage = cgrp->bstat.cputime.sum_exec_runtime;
+		bstat = cgrp->bstat;
 		cputime_adjust(&cgrp->bstat.cputime, &cgrp->prev_cputime,
-			       &utime, &stime);
-		ntime = cgrp->bstat.ntime;
+			       &bstat.cputime.utime, &bstat.cputime.stime);
 		cgroup_rstat_flush_release(cgrp);
 	} else {
-		/* cgrp->bstat of root is not actually used, reuse it */
-		root_cgroup_cputime(&cgrp->bstat);
-		usage = cgrp->bstat.cputime.sum_exec_runtime;
-		utime = cgrp->bstat.cputime.utime;
-		stime = cgrp->bstat.cputime.stime;
-		ntime = cgrp->bstat.ntime;
+		root_cgroup_cputime(&bstat);
 	}
 
-	do_div(usage, NSEC_PER_USEC);
-	do_div(utime, NSEC_PER_USEC);
-	do_div(stime, NSEC_PER_USEC);
-	do_div(ntime, NSEC_PER_USEC);
+	do_div(bstat.cputime.sum_exec_runtime, NSEC_PER_USEC);
+	do_div(bstat.cputime.utime, NSEC_PER_USEC);
+	do_div(bstat.cputime.stime, NSEC_PER_USEC);
+	do_div(bstat.ntime, NSEC_PER_USEC);
 
 	seq_printf(seq, "usage_usec %llu\n"
 			"user_usec %llu\n"
 			"system_usec %llu\n"
 			"nice_usec %llu\n",
-			usage, utime, stime, ntime);
+			bstat.cputime.sum_exec_runtime,
+			bstat.cputime.utime,
+			bstat.cputime.stime,
+			bstat.ntime);
 
-	cgroup_force_idle_show(seq, &cgrp->bstat);
+	cgroup_force_idle_show(seq, &bstat);
 }
 
 /* Add bpf kfuncs for cgroup_rstat_updated() and cgroup_rstat_flush() */
-- 
2.37.3

