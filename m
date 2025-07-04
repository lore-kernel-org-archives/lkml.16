Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E172C3258
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 14:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751639786; cv=none; b=Z5rCiDvFp5ILXTYv3mJjIljcMBrUN9+lAnBgQsXDFvES390V2hThza2S+kEMEPRexxGUvggGMGEFA/DkELhZiVozrutSJsjoDmOMxc+zzXtrxCVdnM7tV4Xf9QIWvq1pULhTsMOVZBr2yh8lBZ2r3SI0TJCj8gTEyStVd0o7nPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751639786; c=relaxed/simple;
	bh=nb4um9P8hUoqYEaIVbgAm/x5zCvPnr2ef9UlSlIIiMA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AQmNkLP3tIZQupexBQpEatMY4RmX6kqlT9QqAAFYMvDhm9HBZasXmOv0VSTpv+5ugGGilhy3tc++F6MKE69tbOv649z/DEASmNfajq19zOai8wVrDqPY49W8lkU41zwfxOTHZhFe8xPpel6FJw2WJ+ZQTPTbdFLhlvHsondT51o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rjvLs4rx; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rjvLs4rx"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4538bc52a8dso7604315e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 07:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751639783; x=1752244583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aYfIWQe8S3zIoB06sVdRdEn43/CQJKSFHRiqx/zs5CE=;
        b=rjvLs4rxrnhdfSwpwXJHcITwz72ommLyNbf9zwXj6zC/3HIDPdfrFDmVQ4wjfmTc9X
         9iULlDzksTSgFOj4M5cqb5tdUePogAFZk3KXmb8Qg6+Up6GekOUZ9E7RqC70tv0yRVWx
         ip581Dv3ybN3GCGucpS9wIH9hc9EL/lmsrEYOXwPXhtu1LA819VqscTeQDOQQJtBUAPe
         sCHsaVMXzePaBWTr3kZRavFBp/QPu8o4jaIhC/Gf84z1SrNpmGQnCw1Zv+E2ubYcDNHJ
         nSjuvcAB0LK4BLdXd9YQ131R97gXCmUtX7NwC0K4rATn1TSDzPax+FDylGKgEMSqQ/eH
         MX+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751639783; x=1752244583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aYfIWQe8S3zIoB06sVdRdEn43/CQJKSFHRiqx/zs5CE=;
        b=UfXoIRcZ5Aqy+LwZufSbvsyCt2Dgknvg491d8HQ9L1GNIszzyszVL8nIB4yuT/ZSmt
         oErBG0+WVXSj5yb4whmcAiWsgzyV5Z+sE57Yzu9XXQHN43+Kn3Kx2AoeKD00Ys+efR+W
         AhJpx2/57Jyt6m9qnyY+Hb1nRMW679V1yNlpmHn2SaL4whKorktOO0AhnnQGYDTfXNDh
         mrf4TAsP2mnATHZelWJC5V2VrT3MgMDVV115akWRsnFbkF+WI9M4TctG3Fwp1kgxWMAV
         amIYs+3DJ5c79cI3nIfLid/zT3oFylQ8AxlUJ4gskCo4zmjkOp5mFLiUxkdubiRMi/MK
         KUiQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1e/lcQ21lKdWud0OyPZ8TtqSsvnj+OHD59XNoEZ0re3ZDiAoROUdyfTN+eK4sRZFDbI5zLiikkJ9xxYo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzssHXfn2PjmNeaN5p2NIDsOHpMeaGllQIr/tFdv+rtMrSdGAte
	wb+sElb5k5Iudym5pSfXIOeCWWgNzjGGnJS3JXYb6rDErd52ZJQdDvK4MypKrxZOUUU0yQZQpuC
	4nVPy
X-Gm-Gg: ASbGncsd5E3aw858goJIf5CrTX7sHqhnbnID2G3bVwDy5Mo8VSM/AUi/7J5Jwq0CTLa
	yuLywupnR3oP61rMz8XCxRClBpnzYZrhbYDWdCiQnAve3O4DgbptC5aPPiNRXWyIeboU9bQv7V1
	V+mu6H0F3dWRFMeL4uH+dDEhEcsrwsZRQgNw2hhmetjfNmHOwL4R/3zd3rD6cNiGdT45xsLYnkY
	b1rFIHPjxyHLfaRcLYcgAK0tad1/oazgAFn2Olq9cY0orhdQtXVJ+eMbYRX8DaF0/RX/zVA8gH5
	nOFcuf94R62klYEXyQwoUOdWd2imvQBeqcr8Hytd9DaXXxqhXl8NLtqqibWR/UoyRfsd/fc=
X-Google-Smtp-Source: AGHT+IEvxKudST1vPPvq53xQ78WkR/ilZX9FnxePFKofGNqwn70qdcXs4eLbY09PRDLMzHgEG2j4DA==
X-Received: by 2002:a05:600c:c492:b0:442:f4a3:b5ec with SMTP id 5b1f17b1804b1-454b3108998mr32960635e9.4.1751639783310;
        Fri, 04 Jul 2025 07:36:23 -0700 (PDT)
Received: from vingu-cube.. ([2a01:e0a:f:6020:7ff5:bbf8:9357:784a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b4708d0beesm2690186f8f.36.2025.07.04.07.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 07:36:21 -0700 (PDT)
From: Vincent Guittot <vincent.guittot@linaro.org>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	dhaval@gianis.ca,
	linux-kernel@vger.kernel.org
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH v2 4/6] sched/fair: Limit run to parity to the min slice of enqueued entities
Date: Fri,  4 Jul 2025 16:36:10 +0200
Message-ID: <20250704143612.998419-5-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704143612.998419-1-vincent.guittot@linaro.org>
References: <20250704143612.998419-1-vincent.guittot@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Run to parity ensures that current will get a chance to run its full
slice in one go but this can create large latency and/or lag for
entities with shorter slice that has exhausted their previous slice
and wait to run their next slice.

Clamp the run to parity to the shortest slice of all enqueued entities.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 kernel/sched/fair.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 2e624a769b86..2a0348b0cc3d 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -884,16 +884,20 @@ struct sched_entity *__pick_first_entity(struct cfs_rq *cfs_rq)
 /*
  * HACK, Set the vruntime up to which an entity can run before picking another
  * one, in vlag, which isn't used until dequeue.
- * In case of run to parity, we let the entity run to its deadline.
+ * In case of run to parity, we use the shortest slice of the enqueued entities
+ * to define the longest runtime.
  * When run to parity is disabled, we give a minimum quantum to the running
  * entity to ensure progress.
  */
 static inline void set_protect_slice(struct sched_entity *se)
 {
-	u64 quantum = se->slice;
+	u64 quantum;
 
-	if (!sched_feat(RUN_TO_PARITY))
-		quantum = min(quantum, normalized_sysctl_sched_base_slice);
+	if (sched_feat(RUN_TO_PARITY))
+		quantum = cfs_rq_min_slice(cfs_rq_of(se));
+	else
+		quantum = normalized_sysctl_sched_base_slice;
+	quantum = min(quantum, se->slice);
 
 	if (quantum != se->slice)
 		se->vlag = min(se->deadline, se->vruntime + calc_delta_fair(quantum, se));
-- 
2.43.0

