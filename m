Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB01214204
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 09:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745226855; cv=none; b=ubaetpZrbqhIpTlLsEsFO5RkeradfFOsHWmJf+35yn9VpMPnUV98P8g0Qv3hSEnvO3JUHmkatwyfCHFJuZ175y8ySjOt4xvA4iKPDh0m6Q5hjpFqDO9VfwC0hze2NLoozMBlh7FFHqSmMQxeWXXiqeFCDpkAj9HU7eYCWhM0bNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745226855; c=relaxed/simple;
	bh=Sek/1qM6VAaCLISu+e0NpeWjIB1EzF+cjtMiY1AWrUw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LU+w4VrURCA4iIukdGUYyUqCEyCSuWGa9O0UMNI5Wj9JRPh7LQSOzS572uegDdobjeek1ZYUxBxxv7I3D7nD9jufSSRRfvVY3Sz5lyN2nsKwgZFlsMWDc8JlTBItdgAmBlUZbcvcDwseYkKOcNmyKHJw5G0z0OYnCfQgVV7Q/e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=hE4J3T+p; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="hE4J3T+p"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7394945d37eso3028828b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 02:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1745226854; x=1745831654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ygV5UbjOFbVAxBSeUQbkYKQf+DuR38CRxo53sfgG9F0=;
        b=hE4J3T+pam/cxSdA+Y2zJ3g3IUDuvnDK4L5eB9lOJyr5y4CBoKZ4NRhxd8dU4Bl79K
         dUOhkijvVzibD8MtcTS/GWjXdlaz/utOGst3q2RcgrDsB5DWu3hRhmjHSKisQ/ly6Lfh
         gCxTK9hnKcdJ1yptpBMwoKYQqD+H85fwagzxgM/ykVsWTYTKWt78aeyZ2nfLDAaNFltz
         tBUatb1ll0PWROpy19D3PsLlLdidYSm9eYe4hzS6lLAI37XP8UYJLVSzunzGNyCfkWdE
         539DybguyZVRzq498M5xSbpUJHFxrGI25TU0PWI0Cm1SuMoskfz/3o4mPWILKWRI6xkV
         2yIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745226854; x=1745831654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ygV5UbjOFbVAxBSeUQbkYKQf+DuR38CRxo53sfgG9F0=;
        b=DrXrh/5FL4P6Lk0qG6n9HOGZSq1140C9j+LZbOxuMZoWeCuIfvcfqNlM3qK/s9rpMY
         X0KdZPedrSik5LIipEf0YMR50Xc0sxBVqoWL8MCuQ2aljRVtc1TMof2b3Z5taEnAnLv3
         rjDc92pJlmeKTQjY3klYipFrxhNIdSWcqWY7aQoa5SKoo59vvDCdkwhVkQUYYcZGF9/W
         lIeL1+NOcVwRdNtECVBNkqO2YWha9ygx63i23Zk79xQS2HodT+Ubr5fJV4zoQG5Cby/c
         4sczbS+Uoc1pS1T5ukE/VU4Uw+c2XW6wX9WbyYG94qq1uofkD6B2BA0Seg2p/i0eZs+a
         sY6w==
X-Forwarded-Encrypted: i=1; AJvYcCWKTeKu+dcEWdRXxYF/3CBWX5PK9ZeiAK0cyu5mRF5WWVCT/jFN3QDS0kmj/G3ApgAsvtp29TUcRt6iQS8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFVvhQlBjSSq5Dhbza+HbnH8G9mOgQGYmBNXJRE/7mc3+xlG4/
	4M3+UEd+FbVfK+fluKCqUhDGkKT5oD4wiDnQk15YpG2N8sSf6eUP8lI0MftaJhA=
X-Gm-Gg: ASbGnctiAFxzLzu69Er2cohCfQYHiJrzKYFovsusqun65wBEhu1YtcC9F16JmxcbdJZ
	PLse3nydE4nXClSwMSFKEpKhv0B6H/aaUZuAAcavBP/FKdJ7nYpmYrcJbvowZXnByTb5SaQW6H/
	soXlRUmWCxjLUOmO908TUrQXp/YLsBw6BDXQtOS2VBrXatqePJ4W5TyRYeuf/iWuSOfURiRmLzj
	RHKQ/PBaHxSZUDQZkVdKhCWATDyZ71l56nFeldwamyCFQOjCXuxNx6wAgI/QZzqlfm0ONwLVmm6
	paNLxTCZFva5uVRy3RN7KOxvUkYIZw5VMWMb3nBmhOp3mqdPenSZ7iXtDeVvF6dKcQ==
X-Google-Smtp-Source: AGHT+IEll/jifAikPxZ2dySlj6rMg3Q4GiFLUm5e3aty/LuvjRx4u1+vE+jTGDM8X0cXAuamrHwh3g==
X-Received: by 2002:a05:6a21:9202:b0:1f5:55b7:1bb2 with SMTP id adf61e73a8af0-203cbc22e32mr14573489637.6.1745226853712;
        Mon, 21 Apr 2025 02:14:13 -0700 (PDT)
Received: from n37-069-081.byted.org ([115.190.40.15])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0db157be12sm5246285a12.64.2025.04.21.02.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 02:14:13 -0700 (PDT)
From: Zhongkun He <hezhongkun.hzk@bytedance.com>
To: akpm@linux-foundation.org
Cc: hannes@cmpxchg.org,
	mhocko@suse.com,
	yosry.ahmed@linux.dev,
	muchun.song@linux.dev,
	yuzhao@google.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Zhongkun He <hezhongkun.hzk@bytedance.com>
Subject: [PATCH V4 3/4] mm: add max swappiness arg to lru_gen for anonymous memory only
Date: Mon, 21 Apr 2025 17:13:30 +0800
Message-Id: <65181f7745d657d664d833c26d8a94cae40538b9.1745225696.git.hezhongkun.hzk@bytedance.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1745225696.git.hezhongkun.hzk@bytedance.com>
References: <cover.1745225696.git.hezhongkun.hzk@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MGLRU already supports reclaiming only from anonymous memory
via the /sys/kernel/debug/lru_gen interface. Now, memory.reclaim
also supports the swappiness=max parameter to enable reclaiming
solely from anonymous memory. To unify the semantics of proactive
reclaiming from anonymous folios, the max parameter is introduced.

Signed-off-by: Zhongkun He <hezhongkun.hzk@bytedance.com>
---
 Documentation/admin-guide/mm/multigen_lru.rst |  5 +++--
 mm/vmscan.c                                   | 15 ++++++++++++---
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/mm/multigen_lru.rst b/Documentation/admin-guide/mm/multigen_lru.rst
index 33e068830497..9cb54b4ff5d9 100644
--- a/Documentation/admin-guide/mm/multigen_lru.rst
+++ b/Documentation/admin-guide/mm/multigen_lru.rst
@@ -151,8 +151,9 @@ generations less than or equal to ``min_gen_nr``.
 ``min_gen_nr`` should be less than ``max_gen_nr-1``, since
 ``max_gen_nr`` and ``max_gen_nr-1`` are not fully aged (equivalent to
 the active list) and therefore cannot be evicted. ``swappiness``
-overrides the default value in ``/proc/sys/vm/swappiness``.
-``nr_to_reclaim`` limits the number of pages to evict.
+overrides the default value in ``/proc/sys/vm/swappiness`` and the valid
+range is [0-200, max], with max being exclusively used for the reclamation
+of anonymous memory. ``nr_to_reclaim`` limits the number of pages to evict.
 
 A typical use case is that a job scheduler runs this command before it
 tries to land a new job on a server. If it fails to materialize enough
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 49eb2a4e490d..b442c20d1168 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -5581,7 +5581,7 @@ static ssize_t lru_gen_seq_write(struct file *file, const char __user *src,
 	while ((cur = strsep(&next, ",;\n"))) {
 		int n;
 		int end;
-		char cmd;
+		char cmd, swap_string[5];
 		unsigned int memcg_id;
 		unsigned int nid;
 		unsigned long seq;
@@ -5592,13 +5592,22 @@ static ssize_t lru_gen_seq_write(struct file *file, const char __user *src,
 		if (!*cur)
 			continue;
 
-		n = sscanf(cur, "%c %u %u %lu %n %u %n %lu %n", &cmd, &memcg_id, &nid,
-			   &seq, &end, &swappiness, &end, &opt, &end);
+		n = sscanf(cur, "%c %u %u %lu %n %4s %n %lu %n", &cmd, &memcg_id, &nid,
+			   &seq, &end, swap_string, &end, &opt, &end);
 		if (n < 4 || cur[end]) {
 			err = -EINVAL;
 			break;
 		}
 
+		/* set by userspace for anonymous memory only */
+		if (!strncmp("max", swap_string, sizeof("max"))) {
+			swappiness = SWAPPINESS_ANON_ONLY;
+		} else {
+			err = kstrtouint(swap_string, 0, &swappiness);
+			if (err)
+				break;
+		}
+
 		err = run_cmd(cmd, memcg_id, nid, seq, &sc, swappiness, opt);
 		if (err)
 			break;
-- 
2.39.5

