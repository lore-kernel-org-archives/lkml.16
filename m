Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E49A1BEF81
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 16:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738427488; cv=none; b=KjnAMu0XOg2G/oIr8VZyz/JHZXJoF5mhk9/1LWqez3OH7sCVcTo9vn7p+r/prNWct8jh6nv/orv2Wyd7WzHBGi6GLe9TzN4fyO6RSONCYR/mp85TqoCA8NoMXus9L51rrDjvOscF+6KFfrysltG918PdwtxKnXIcOCkGlyhVMnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738427488; c=relaxed/simple;
	bh=9rF9XjhVIZ4MR6YyA9uIkpV/wPrZKAXNg/MzplEdjh4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZqriNl+oAuJlKyvqHcneUtUXP/JRbWWTjZovuyTN10wcM1vhZhuGRfh0FxdLVQE2Q57yO5DmmqBqCe7g5IEX9o7/5bLXVslc7aNJrR5O84q/qWhBfS/S7F96Pms1uUxW1Y7M7CfDy9mZ/o5NG5fccfmOmUgQlDq7wVYe2+hMaXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kECMI/6r; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kECMI/6r"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5d3f65844deso5354664a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 08:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738427485; x=1739032285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CXVQSHG/dhd9jfamFZQ5v0xVVMd1VSHlCVKm8ZZoizM=;
        b=kECMI/6ryPdRwtPKRQcv7diHxsYy/fUYYK7YCz4g1+UhW6+w1klS7UzHH3U9z/rUvt
         yobj/2NojFO0S29lAO19p2Kywn8/lbiWl1ABIiUYPwkSUlh+B99Rjb8r7yYFKJL4j4m6
         Ivjp7ThmBEYzICgk6Bcyv4fA9zc5mwmPkvd1kK+qrD9E8rtW1J+LLLSt51Ll16HS+bZ+
         m7lxcQylEimJVQF+2SycQ381FK9hDrSMiG8p4VUF7Xlq3VZ/QEJpDVB5eNVzv8Cu2ynm
         ARY5Y67tfzPxyrywSkaRIo4xjWxFu8pjFoH92GMioqY+Xu10JTamWnJhiTKZ+xVt8phM
         3Fug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738427485; x=1739032285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CXVQSHG/dhd9jfamFZQ5v0xVVMd1VSHlCVKm8ZZoizM=;
        b=sK0wMCcVxRKN4q7/BljeKA27/9/SVkSZjkFPDQK89bIOVgLAcPytarG+vbrqxc0Gca
         KaP/NPmblBqUlXkvo/lbtdW8MqTRZAhZB+G5OcWO88nNeN9ShcAl6wEbJ71CiIex6HqT
         3eyjYh+4jU9LNrD/l3gfgjgFr4ca80deoZpe/pz3snT5t+AFiF7jkoYmxneTEwu9FAKe
         OsR1yfSaysIRSibjXNWq24Cjs8GLgprP3+GqQKoIJ9FadSWHuFeypOrPQymScrKoEKYN
         6lS8QltTqkP6ygVDtAiZgSuOlEWmffmaCCV+o/YBk151+5bBAnzWBYq1o/58fDV6SLcy
         +Udg==
X-Forwarded-Encrypted: i=1; AJvYcCXHktf+jX8+xd7E+I9lIizI7NxpagpNyNcHXYQviRG9yIcTqz8Z5MoCfjRbvx/i+mFvYeh1UOSHqGgh3JI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMrx7WNOWl1DQnItD7G4qnpCppMsIIHNAWyZr+Jl3+Use+7RrX
	/6yQhNHLQXi9ghXVWQK1xaJ7BjU/73ioIJIZztj6i5VlLBXWB+Go
X-Gm-Gg: ASbGncurwVigEyqJYYg00A+UMdHp+eqlPf5lKYcog+YGU0I1V+fbnhhlEV3Mc8T3pi6
	M2sI4bpXGKwjMEwiVr6AMbGX6Z8miijz+t0ROKVRQPSYsXzlvvIQUtoTJBcgRccA3j4/+0a+ze/
	bjCKSw8XFA8vncnkRSZQzSaEBJh+Lvvg7GfcG4wNITIgCAtQuI56ece0Q0DDCaY0c4Z5DYa4/Sk
	aF2v0Tx3zWaw+iGiQpcTs9/gNsT2WDS19pFPrRxIW+oVppDwMoGb9aUDTNr00c9K63Yll/HUJ0C
	maUHKPSVaEcuWPQSLJ240szn6d7+sFpx4g==
X-Google-Smtp-Source: AGHT+IEBBONxnoUTzVDmSOq6OZmD+SIybzgSduX77ZYr+Wy+gfjJKcZ3ihdCR4osScCUIMVOsqIhYQ==
X-Received: by 2002:a05:6402:51d4:b0:5dc:100c:157f with SMTP id 4fb4d7f45d1cf-5dc5efbf5afmr19313220a12.11.1738427484556;
        Sat, 01 Feb 2025 08:31:24 -0800 (PST)
Received: from f.. (cst-prg-25-223.cust.vodafone.cz. [46.135.25.223])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc723cff72sm4636959a12.15.2025.02.01.08.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 08:31:23 -0800 (PST)
From: Mateusz Guzik <mjguzik@gmail.com>
To: ebiederm@xmission.com,
	oleg@redhat.com
Cc: brauner@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Mateusz Guzik <mjguzik@gmail.com>
Subject: [PATCH v3 2/6] exit: hoist get_pid() in release_task() outside of tasklist_lock
Date: Sat,  1 Feb 2025 17:31:02 +0100
Message-ID: <20250201163106.28912-3-mjguzik@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250201163106.28912-1-mjguzik@gmail.com>
References: <20250201163106.28912-1-mjguzik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Mateusz Guzik <mjguzik@gmail.com>
---
 kernel/exit.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/exit.c b/kernel/exit.c
index 1eb2e7d36ce4..257dd8ed45ea 100644
--- a/kernel/exit.c
+++ b/kernel/exit.c
@@ -248,9 +248,10 @@ void release_task(struct task_struct *p)
 
 	cgroup_release(p);
 
+	thread_pid = get_pid(p->thread_pid);
+
 	write_lock_irq(&tasklist_lock);
 	ptrace_release_task(p);
-	thread_pid = get_pid(p->thread_pid);
 	__exit_signal(p);
 
 	/*
-- 
2.43.0

