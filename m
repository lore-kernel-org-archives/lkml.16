Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E59204873
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 15:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739200379; cv=none; b=e8lf1Io4239epEZnTh437IaufWFO9P6snIlqJnzhtF3XZDNZtbiwM2eTiB9AEQ3Ezs43/c6i+EpeYSQLmjCgZwSeu3AjYKA6yQ5hqKLsHjct9h8w+Ka6inbjuQIAzEBT48kuufhT/Zgk1i62kZgOXkF9TaRTepceO1DCUJqcTHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739200379; c=relaxed/simple;
	bh=ulHvHm4ifWHwuLhPFEPjoFTZbkUUcsP0tD9oetZXMyo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EBEt7zdxNMiACpoVIvTrQor6mDlPtWxHIWowN8RUGns1pU22DOgr3qJbgGLrNsBfOOI+teGbCij6FsBWOM9TxF5lMODSCp8OkJDmtfN0Voo2SgkIYurxIAT5VG/debvbGYqRcivO/CQ+Ry5JsWO0tgTEIeIPixXSMl+MR2Vzym8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=McNG672j; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="McNG672j"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5de84c2f62aso1724714a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 07:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739200376; x=1739805176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+1XVXoywLqfki7vGasTJjryB1AUnkPOTgHHVt4Rbtn8=;
        b=McNG672j6sqqp+IGQiZuENkWW6y7g2R68sks8diMZd4Lx3i2VXluYNlXHRoKwt2bZj
         gcY4xW9aaFk8y358uMqU0yq0KkifjeWr5sHc/TfoGA+6WFhOvDicZQJ57QXixNw3ZAFp
         pKH3yA4uJ2uiEdsvFiQ8g7eGs0evi2PQM9bEKiJP5WHrqoWGKRjQKjuqfcOnjaeI5W4I
         gbG+AoXlzaK8DBGvBeq9/RHOXRup8k8ARtyDBiwFvMdiadIPhYaR3lIQzR7W4Lp8X1tU
         uMSz0YV+V59NnyMVe1iaKapzeTIRoPJYO9Js3BWZRhxmvyxz1B07yCQBrXY7gWtrLJtO
         9acA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739200376; x=1739805176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+1XVXoywLqfki7vGasTJjryB1AUnkPOTgHHVt4Rbtn8=;
        b=Ma5nfkRev4rjwiCdMHOP0703y8OyHm64UoH21sjY3rgVDLoH+Xo/Rrx23EN7tB7lJQ
         N5XXrytZZP1PafwMUfno85aco3lVgvUvGvWn9G9vldzgLm+rkIwTSvxxI/QHJqZRPogM
         +AmfegNSZ9A8LRNYfEpKB4zKQ3BlFa7ybh2P74uMNxkIq7D+WWyQ02zwogjnp7KfQUCo
         QpgINHy18+pS3oyJ+Ww8BwsB4HE870NpOc0zMMHRtULg/+tz908jhA61uF8KMhTAXLTL
         u9itb+D+HmxOYYqwePyUUPx4RCEheNE/O99pcNHqq1LtSz5pQ0RSKpEnfH804VoGfX3+
         FFpA==
X-Forwarded-Encrypted: i=1; AJvYcCV/j94dZtDSLzg9v4s92VxkZp0boHxQVbOdziyhYsx+6XA0k0Z140k4u3UjJQlDmuLQEAjWT7+JvRQkLbA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcKO0ROd87rdSNGsphC/b7QdRqevwVEeOmwkdH7tmrdqetG20o
	7V912cj/jaQdeoPXoxRm51FJZ+K9Gm+sK4v3nAtfugo/b8RyssRKqncryV2fu/4=
X-Gm-Gg: ASbGncuyTjj8E4CDlfva7nAjSeLayiAhNUOYTjQNU/E8Gb9YLfNniEciNEK7Ye2YlrU
	knY3G4zj+jHgUGJ1pYaoNttK1hAzUc96FMu7lRJT0V0Oz1Z9H7TCEZ110Gelf47fGbJ9plG6y2S
	idzRWky/ZLgOY9cXfQzLahCkzLEXyPpWb4DNLgpMi0e5TZsbJOYsxW8pXesp5OKdgileUrGvZ7B
	VDHbfUxmwpkYT+piyJjusNSQ0eSkUhp7X3FEMYciwFR0gfMumVPv47L08AgRVktR5RrqGTnKkAC
	kaJknRek+X5vuNHUWw==
X-Google-Smtp-Source: AGHT+IHsHQFc3X6Y/WpOuje7/im6oWOB0bQqY28XRbEOckOEoxISoOotX0WPyGhk1EP1KQLT3TLonA==
X-Received: by 2002:a17:907:6eac:b0:ab7:d6c:5781 with SMTP id a640c23a62f3a-ab789b1e3bamr1456428866b.24.1739200375951;
        Mon, 10 Feb 2025 07:12:55 -0800 (PST)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab773339e82sm895192866b.143.2025.02.10.07.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 07:12:55 -0800 (PST)
From: =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
To: cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Frederic Weisbecker <fweisbecker@suse.com>
Subject: [PATCH 2/9] sched: Remove unneeed macro wrap
Date: Mon, 10 Feb 2025 16:12:32 +0100
Message-ID: <20250210151239.50055-3-mkoutny@suse.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210151239.50055-1-mkoutny@suse.com>
References: <20250210151239.50055-1-mkoutny@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

rt_entity_is_task has split definitions based on CONFIG_RT_GROUP_SCHED,
therefore we can use it always. No functional change intended.

Signed-off-by: Michal Koutný <mkoutny@suse.com>
---
 kernel/sched/rt.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index 3116745be304b..17b1fd0bac1d9 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -1257,11 +1257,9 @@ static void __delist_rt_entity(struct sched_rt_entity *rt_se, struct rt_prio_arr
 static inline struct sched_statistics *
 __schedstats_from_rt_se(struct sched_rt_entity *rt_se)
 {
-#ifdef CONFIG_RT_GROUP_SCHED
 	/* schedstats is not supported for rt group. */
 	if (!rt_entity_is_task(rt_se))
 		return NULL;
-#endif
 
 	return &rt_task_of(rt_se)->stats;
 }
-- 
2.48.1

