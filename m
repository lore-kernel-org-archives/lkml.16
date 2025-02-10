Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764DE23DEAB
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 15:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739200384; cv=none; b=fHxOTbF8c64vP5FongTcczsVNYcZ/VheZk4Y2P7LtTG9QX9yaUycrv0GFD0+7ggFZlq5SeT3ypd8u2q3GGUdu8jOLrK5c33ARWvFqmoPhHDI29YoSAzg+fQXL9+nQb2Hs17j1YMgHdOAtjVMLgT/n8YEzlWJYeCKHfPeiDAgEEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739200384; c=relaxed/simple;
	bh=iqeMyg2aM7rOxUpDWS/hr/9N/tXvFYSx8aHXmJaW8IE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y/SswWBhC3Px6Npna4C9U/JW8tt9gPTPB9yxS3HErnWy8YPmAcRKeNTFMbvX6Ylvhdxy8+gdfTZ+0hXrZpOV+vMU4vuC3Yy2S1VjIRBjNskxqhvtwgboPY6tL3sw4SSYrE44Eb/9ro4fs/fVW1wggTBvZnO3M/bc7xX8VZUh3B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cPI3/4kP; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cPI3/4kP"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ab7ca64da5dso138241366b.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 07:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739200380; x=1739805180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S7MdvLo2eJNuv+SAzqGScNlKUwpiF8b6hAU2gKf+PuM=;
        b=cPI3/4kPGhCpWqSc5MwGXkQo+kYmiF7kcNbax9523QDkCcMDarEkuOEOptJq7pyOWH
         OuK/KsbIyUndWq5qzuO5wg+cJ/bqFZmEEahUNQi2VCaDLlCly1dKpq4P8uOGeb8K/D26
         INJhc2UiNtVcV8YcYyFbXL30GKHCnk5rK2vzEdHg4JFFN2zP2xIv8aAA6e/kj/fdQFbv
         mv4M6iVCgKh671IMXB9dJOEJJ5Xy+h8r5rLuVciwfJD1Ht9gRKw6Udv/46tZVew8FqaE
         fzV8X6fvYN5Keyp7xqiXTsujUpLYuLKQPXw8ADnTdJbD+sNX9euD9uWsZyZLltq97GxZ
         QB9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739200380; x=1739805180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S7MdvLo2eJNuv+SAzqGScNlKUwpiF8b6hAU2gKf+PuM=;
        b=LZ8FpoY8GNi+dk7mCigp0hjuJN/V9vPm5GVRpb1lUTr3eWOUmQsIRyEMsQG4+Ugkgr
         36oZIesvE+ckC6jzPhpbep1Jkg4AxNfikIug4sMb4aJT9DalAGfhhgSrr90W5riv+b76
         oHO+h1w9OE4HkTDf9CMVKI6gQGPDwgptnNGs1krt3XM+htBjtOE5Lb5iy5AZNOT8d8nX
         9MPB/kdSZJqduIsxjTZfdxpp4cI5monUV4Sse/kHua54BjAoCow+99tt63N5AsM/IZcK
         Zex5b6kgEGGZ6ido/mxjsPnxhoUMC54pktv6/AcEo+R2pQtHOVLO80PX6GYpO/z9D1KC
         2Uvg==
X-Forwarded-Encrypted: i=1; AJvYcCUa5SYF712VipxqhSalEFfA7UWE8LCVlRsBp1zRidMPBGoX2bofI8CBOMTLQjrBYL1hGZw32amLN9QkzcA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhl7qp2SEUsEyEJ7IAPzgMRFZb7wx7AvpWArffrhywBrkb8hGA
	m63KBr0nd9a26U1/9jweFhyTuq5UoY7Q3dzxVVmljD7fQO1elg+VxenK1djflB13AaoDTzG6juw
	P
X-Gm-Gg: ASbGnct7KorhgMTch6VD3IbSTSp5HzSSrG1SC4A2fLTy1MaAQRnC4y6Y9eSrTBZ2Zag
	58Eblgk4W2aL/RKsLQ28wsU9aDRNiCWgk3mirAGAmEieEXukjIBwEM2NuFOjiSNha0xZf7J8Xin
	CY8HGg5airloCHRS+v5djVp3JeWB2hxlm10Y8GaMfxX+e25Zu5rOTtp1NdnUaAysCcqhhm15m6i
	ZQHhM8kIhPkeItU+uHDqm6wKh6Dq7x16ve3JXsIl0GpeC+RRIMaUAqjK0lUgdPTMggWWYn71KCZ
	OiVQ40Bi226OK0KljA==
X-Google-Smtp-Source: AGHT+IGk13SlYbxa8hsziKdtSAXkNvItrd13FwoaDhO6Dj5aOXPATenE3duFftBrONekaMv0xj1FKQ==
X-Received: by 2002:a17:907:d26:b0:ab7:d34a:8f83 with SMTP id a640c23a62f3a-ab7d34a94a4mr151220666b.17.1739200380472;
        Mon, 10 Feb 2025 07:13:00 -0800 (PST)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab773339e82sm895192866b.143.2025.02.10.07.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 07:13:00 -0800 (PST)
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
Subject: [PATCH 9/9] sched: Add annotations to RT_GROUP_SCHED fields
Date: Mon, 10 Feb 2025 16:12:39 +0100
Message-ID: <20250210151239.50055-10-mkoutny@suse.com>
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

Update comments to ease RT throttling understanding.

Signed-off-by: Michal Koutný <mkoutny@suse.com>
---
 kernel/sched/sched.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 4548048dbcb8f..51feefef65c66 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -819,17 +819,17 @@ struct rt_rq {
 
 #ifdef CONFIG_RT_GROUP_SCHED
 	int			rt_throttled;
-	u64			rt_time;
-	u64			rt_runtime;
+	u64			rt_time; /* consumed RT time, goes up in update_curr_rt */
+	u64			rt_runtime; /* allotted RT time, "slice" from rt_bandwidth, RT sharing/balancing */
 	/* Nests inside the rq lock: */
 	raw_spinlock_t		rt_runtime_lock;
 
 	unsigned int		rt_nr_boosted;
 
-	struct rq		*rq;
+	struct rq		*rq; /* this is always top-level rq, cache? */
 #endif
 #ifdef CONFIG_CGROUP_SCHED
-	struct task_group	*tg;
+	struct task_group	*tg; /* this tg has "this" rt_rq on given CPU for runnable entities */
 #endif
 };
 
-- 
2.48.1

