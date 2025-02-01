Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA371C5D7D
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 16:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738427486; cv=none; b=PAOJC+oRqsyDZMu21ef/ZfEeC/yOvsJrz6Uz7W4ihfbIDHeEhUofLDXjGdjMM3OZimemG4VzQEhsTvdaIjPpfHfuqxm8NzV5Dzox98jmeOEcCBJkgDVF4Q2ifzKaAY+wPMD5oLA7YThFBlCOz6KyZsLqKyfW7niGms5mjCY4F+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738427486; c=relaxed/simple;
	bh=29eRj3EFsZ4yZGV4Y5RF6hOfC7a7Sir0lKqdY6Rk6wM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Itiyncy1PabBVmTJON5NQJu0xNoMbAmYXszF1G2BZvv4CN7AtqHGcYN4/Sn4YLbUOepcCers9F9oyqpxEBMitNi6V5q3XL22qgnnwxYucmC3cJmlhRfJS2BQ3dXsxCRBcC+1hDx96pEl5GG5IVTslHqG4/LX7VfPtMzeORlDIXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kfLmPD33; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kfLmPD33"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ab69bba49e2so445898166b.2
        for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 08:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738427483; x=1739032283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q9VwguEfdw2O0mEEKHo5I+DTD1LWzDzpt7iDjHggfOc=;
        b=kfLmPD33E0pjDWU1wvVcQRYTdnDzte2Uuek5unsqxyBLcO7koi0wjZt0Ee6ECwXWuS
         BHBG7EuOnkXpOS67LDMUKHvHV93Xu+Oh5Tnch5LEtotoUbk48r+h2WNGI2qHTnmS272g
         FNany51AVHwVmHjXt1dlEL000GVoHISJWKg2Yxb4UIYgO9WRVgCUgm5IR9fBBxWoOn74
         jyOBX0T2m6fmnYcl7Sb6MH25MrPoKGEQ8W+rgv3bQIYces+JpyS/8KrgHyHvfBbK8vls
         W/XxktPU3I4c2VH76oFtr8Jp8e9+1wm6NrtO2wq5JOY+azAc1Xw8Imr/RuxnRuCZlFFh
         QBYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738427483; x=1739032283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q9VwguEfdw2O0mEEKHo5I+DTD1LWzDzpt7iDjHggfOc=;
        b=UvPESB/2dTZDab3cM9o9nhtG1hvDNRsUyz9+k/ricx6aLxpqiRPoHp/rJyh6nyhX6U
         ArLNxuyw0mXEbDrsQeVMtuiKO+OP/o4TRAkLEKsetHjr0fXyvnwIV15l4KBhDjv3ojLo
         oZSMzk3bTcalO2fxPy8eeGbGD5f9LNw1vzE7zN2XxiXFt1CCBmVQVeG3MmfyQ3pmsdCL
         nh4AaYOKWegAlcJLPUApR2/BQ00jntj4kqhH4cKrmp6+OM+NO498YGvuvdeWlZMEWn0l
         c/QZnxJsiNpl3f4Z5q6dMWGed1rLCAiS/Ue4bo8fG09kyDZ9pFPbDf7VkbkfoA1GbMb1
         ZE+w==
X-Forwarded-Encrypted: i=1; AJvYcCW9vK/jEknqqbDfy330JMcOKDpOWYER+ohqsXu3NZTpfsNXuI9oWhZMtv/v173SO4povzLqkIac4JC/VYU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCe8byksna/Iwb/HuXtxgQHYm+MR6J+CLirXSbJk3z1ht93ktK
	9fb0sCj9Qb1VtQBKunxsVkOREp5kBhN0CKEGdr8p1hB5b6Avl28V
X-Gm-Gg: ASbGncvyVcv6MjG7fPQjlma0nnh3A8byjGQeY5ck/ZZEjI/s7Mjczx3BW+3PV/gfFhR
	uvDqwJ1yDw7ff/rNqcKT+RULLsZDIpO8eDCBXZmgJDjc7H8KvzNgbFjn4IYg1IdbeklGQ+F/Ate
	tHlsK/QWqZBZLJTE046++SnNVB6LXVSx1ZSh2bdfzUwYoRJSQquMSZQKY05Pbjh51G/tcH/Opib
	44k4xeM1TI3q3Jrx8ELVcUb6zkS7q2azN9LFmxWhW6khO35p8R9di4gGNGhXLmJNbU+/MA3u+U7
	kFXYX6uAPvwSU5HmePgTaFE4E2ZjpHyhDQ==
X-Google-Smtp-Source: AGHT+IHvc7aK8w+Hd89W24dqneZqKXcLr+wAyc1msRlyW5N6rBFhpTa7M7G/9pyZypuHCoX+4ZopoA==
X-Received: by 2002:a05:6402:3511:b0:5d0:81f5:a398 with SMTP id 4fb4d7f45d1cf-5dc5efa8b65mr37039629a12.1.1738427483014;
        Sat, 01 Feb 2025 08:31:23 -0800 (PST)
Received: from f.. (cst-prg-25-223.cust.vodafone.cz. [46.135.25.223])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc723cff72sm4636959a12.15.2025.02.01.08.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 08:31:22 -0800 (PST)
From: Mateusz Guzik <mjguzik@gmail.com>
To: ebiederm@xmission.com,
	oleg@redhat.com
Cc: brauner@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Mateusz Guzik <mjguzik@gmail.com>
Subject: [PATCH v3 1/6] exit: perform add_device_randomness() without tasklist_lock
Date: Sat,  1 Feb 2025 17:31:01 +0100
Message-ID: <20250201163106.28912-2-mjguzik@gmail.com>
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

Parallel calls to add_device_randomness() contend on their own.

The clone side aleady runs outside of tasklist_lock, which in turn means
any caller on the exit side extends the tasklist_lock hold time while
contending on the random-private lock.

Signed-off-by: Mateusz Guzik <mjguzik@gmail.com>
---
 kernel/exit.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/kernel/exit.c b/kernel/exit.c
index 3485e5fc499e..1eb2e7d36ce4 100644
--- a/kernel/exit.c
+++ b/kernel/exit.c
@@ -174,9 +174,6 @@ static void __exit_signal(struct task_struct *tsk)
 			sig->curr_target = next_thread(tsk);
 	}
 
-	add_device_randomness((const void*) &tsk->se.sum_exec_runtime,
-			      sizeof(unsigned long long));
-
 	/*
 	 * Accumulate here the counters for all threads as they die. We could
 	 * skip the group leader because it is the last user of signal_struct,
@@ -278,6 +275,8 @@ void release_task(struct task_struct *p)
 	write_unlock_irq(&tasklist_lock);
 	proc_flush_pid(thread_pid);
 	put_pid(thread_pid);
+	add_device_randomness((const void*) &p->se.sum_exec_runtime,
+			      sizeof(unsigned long long));
 	release_thread(p);
 	put_task_struct_rcu_user(p);
 
-- 
2.43.0

