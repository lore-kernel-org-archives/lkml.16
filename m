Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1D81B9831
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 08:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746260941; cv=none; b=lOL+oUVb1WJIRNEwNtyReidXRkMmMJ3DFJK7re2dr03iEkRQgt9fSQgMXbzYZcIK0o5xm1IfYj7iTkg+j952Qbd2JPmp5LyYzv6GTxqaXKiepfgk35haRw8PM84KrQqCKLhI0UfJjfmkM5CjudmEQqmxH4NNlFW/SEfc5K2f42A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746260941; c=relaxed/simple;
	bh=raXc3AUzvFqeZNUoCLIGiMxOpJttagQRF3qT5zAStIo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jHJb1s7ZwGSvx/IZ8h6LkgrKGAP/wnjwKZ+YyDuF8Ui+P9tIrLn7/+oYtmkcHoWntEXh4IVtfszpmANbf88ET1KMx1JCAE/8bQiTz9RZULtsDegAFhU+kfIsc9nJhJ74bX7XVjBvF6gj3zbXmE2UVvAnHye7HlhBp823yoMlNTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cIn6deAl; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cIn6deAl"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so14251655e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 May 2025 01:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746260935; x=1746865735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S2KEW3n2zkl+0JuMOh1cYZe+X08zSz0vOfCvBT3NWn4=;
        b=cIn6deAlsSLElnMUA6qopvXiznp6zhX1phOyGLZRzwtphGd6lHiPLbaCC9jwWGt7DT
         tJZU6bx0rpX93+gZvdZD8Z8HGA9ZftKk5DjxiFSPn/RmFDmWtZxOSqrefb0wMvGvQP10
         uV7rsBwmbHe62lLzrvtCsq0x86Sn0K6Z4Vv/DDXwJXT75vYwU70DaEg1u8cOlObw1XP9
         5ijG2qMsNpqayMa659AmvFvgiD0wIfkNpp1or1PnhXtYVfwEE68mgAulFgrJtkEuoIGu
         N7y6Y03tlH1Vo7gNN8amKmqTtBCR7sqLgWnCL/MBchOhZOgHIIwmsDhvLZKEe1Oe2Cj+
         Zq/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746260935; x=1746865735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S2KEW3n2zkl+0JuMOh1cYZe+X08zSz0vOfCvBT3NWn4=;
        b=IpNyIiHrR4LdV4ZKdnepoG1Ycm6+8HoXDUfLd2zPKNRV/wY8IJmM8QMJHt8akX4cXQ
         uJKvvhVtVJ0sulQfrrsz6N1o6FSrtB9gVuJscyrAEH4yodhKNLuOlAn2aDxLj8lmr6m3
         U9VKirlnmrVqLmy6rpsRT8FUCHnDClxeGk6ituknXkpX+pOBIW8bjuMW4Aqxgp9y+Jrb
         YQOmghohoMWo2rB/hGllqE2m2wNLo5TSa60QawQ8KNmq26QC0u+JeKxMt2ik4RMzY78f
         vxFDecFtO9PdYoejrsCvEVGim5VDxHT/KTXTnrCnLKMxA8McS35L9b0TJvMlWxcG1nJ6
         J6WA==
X-Gm-Message-State: AOJu0YxBYZFWFiutebvRiTZhl7ZCinw7Kwim2WBH4H3C86ZohAevybJN
	8JJ3cgj8I7bcfXQcNLqKdjy/9+xMSp3etx7M70rlWH2tFx00uziUwsKmjC5MR/r2SGJDaY2mFnL
	+
X-Gm-Gg: ASbGncsY0XkAK57ZA1CGwfIwC55D0MwRuMmaoMA7LPg4cH1+5+rvkc3jW3NE67Gc+8z
	Jn6APDw3YJn9HkxDMfV4JzcYfQfFEp6N8Lhy/xKd40qq0gp84iiVJxKMJ/cvK1sLP0LkfNCeBVC
	OYSbJ2A1uEKmIoJsm/vwueNBCSiBWZtKrkvHEO5VHFKoJMQMAoT3JQ5eCj8KEWULEUuFhrxXliu
	mHVponsNKdhaMixMMeZoz+AFdETEblzejhA3Xv3NTlnJTqS+VCVNBswYx/0KkFRF5RvSseWO1tS
	zM9zSZ6gwryH7WTjENQkmMD9tTkadrzBIsQAECr5AO2kLAng
X-Google-Smtp-Source: AGHT+IG7w5IgmH9oRTJXZYDjQuZP+6BcMMMBtaiONMMnugRzkTbB79gdLKV6dpBsSPrpDXR/fuKrCg==
X-Received: by 2002:a05:600c:8283:b0:43d:fa58:8377 with SMTP id 5b1f17b1804b1-441c4958273mr2188695e9.32.1746260935195;
        Sat, 03 May 2025 01:28:55 -0700 (PDT)
Received: from linux.box ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b89cc441sm68633445e9.3.2025.05.03.01.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 01:28:54 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>
Subject: [PATCH 3/4] Workqueue: add WQ_PERCPU
Date: Sat,  3 May 2025 10:28:33 +0200
Message-ID: <20250503082834.49413-4-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250503082834.49413-1-marco.crivellari@suse.com>
References: <20250503082834.49413-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently alloc_workqueue() treats all queues as per-CPU by default,
while unbound workqueues must opt-in via WQ_UNBOUND.

This default is suboptimal: most workloads benefit from unbound queues,
allowing the scheduler to place worker threads where they’re needed and
reducing noise when CPUs are isolated.

This patch adds a new WQ_PERCPU flag to explicitly request the legacy
per-CPU behavior. Both flags coexist for one release cycle to allow
callers to transition their calls.

Once migration is complete, WQ_UNBOUND can be removed and unbound
will become the implicit default.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 include/linux/workqueue.h | 1 +
 kernel/workqueue.c        | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/include/linux/workqueue.h b/include/linux/workqueue.h
index 9dea10a09cc5..697aabbd6dcb 100644
--- a/include/linux/workqueue.h
+++ b/include/linux/workqueue.h
@@ -374,6 +374,7 @@ enum wq_flags {
 	WQ_HIGHPRI		= 1 << 4, /* high priority */
 	WQ_CPU_INTENSIVE	= 1 << 5, /* cpu intensive workqueue */
 	WQ_SYSFS		= 1 << 6, /* visible in sysfs, see workqueue_sysfs_register() */
+	WQ_PERCPU		= 1 << 7, /* bound to a specific cpu */
 
 	/*
 	 * Per-cpu workqueues are generally preferred because they tend to
diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 98cbfc685f39..0a088a2bd6a3 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -5670,6 +5670,13 @@ static struct workqueue_struct *__alloc_workqueue(const char *fmt,
 			return NULL;
 	}
 
+	/* one among WQ_UNBOUND and WQ_PERCPU should always be present */
+	if (WARN_ON_ONCE(flags & WQ_UNBOUND && flags & WQ_PERCPU))
+		return NULL;
+
+	if (WARN_ON_ONCE(!(flags & WQ_UNBOUND) && !(flags & WQ_PERCPU)))
+		return NULL;
+
 	/* see the comment above the definition of WQ_POWER_EFFICIENT */
 	if ((flags & WQ_POWER_EFFICIENT) && wq_power_efficient)
 		flags |= WQ_UNBOUND;
-- 
2.49.0

