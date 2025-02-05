Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2FE212D86
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 20:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738786183; cv=none; b=jSDp6UTwAXlp82cPlFKd0gN8R5WdSJLpIHzYEkgJwA5Y6wr78/abpynyXEvjwkNSy+jg73UwW3Bdt5DYBLkiTv/vPlEccu8jY2ktBaDa7EJufBmgFl5OM69Bag3sR9FMjVBzgsRKKeD5qj0fQMZADaqzwpKFW/oOGFfL8Ffm8yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738786183; c=relaxed/simple;
	bh=u+0IP/WM+c1HWcevhyhBDP6G4TM3xWdnu+4FbhJH/Kg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JRUQWXKCDdkoCLeH9L5M2rNOxhAhkxH0fmt2JAUMR8k8F9UY8XQECD+X+Aq5e4ccYHgc8hAnQwXZAHqFyTy416/5dMNi0qjb+44cmVACiSuT65podPwv0ZTLfpgwiodKddKdHI2FF3NcNG1sjMOAEQDYgF4U38J5kujzwo57ajU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tow0J9ZD; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tow0J9ZD"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ab76aa0e6fcso27369866b.3
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 12:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738786180; x=1739390980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DaN+NvEOsPAuKb5beMVe5hx8j0KcYxaWgEBiI4mkpQY=;
        b=Tow0J9ZDHqLIsNIl2eMlxPYlkS73IttDp351moUsL9aIVCCx/PoUvnzw5mtHhPD1SB
         m+A/wRLRk3F1Ai5+4VWM6FEQ0abSrvgalFnSlcbTgqkkNVzvl1AZXbDovYLgozd0+DkI
         8GE2RIMUhaFz5/Ij0Agon4w8KfrPvoYvuGgHISIYqk7a4upIh4qn3df3Cej0rHXRwOf5
         fPvo4ch0yiXiyNfFYp9iJgTs7+dEZ0PBLWBeAlZDWX63sCJL1kOfxpG6DQerNZJfVA3Y
         8dlQvij1atz26eCEuu0kwZA6nq7bS/MFYYq7KU4hZUus43M82y0mkcxSjHpT91Gick6r
         Lbig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738786180; x=1739390980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DaN+NvEOsPAuKb5beMVe5hx8j0KcYxaWgEBiI4mkpQY=;
        b=h7nL7p43wAwfdakKV8TX+V/FdSxEjhl/iSaH70238qVnUFWaatEMyNZtZxv7Chsx0N
         Idm5KQcupq8PwUSoLbcRCd+rQ2EJrp1JKwjGvi8ZgtJwjUzBcRBjJ2BvUXhhOeDrXADV
         xHeJ7uRQBJ56T6sqxBUIzMzcRlmd0FYa3vyDKp1Jl4kx1/CY1YVrPGJh87tHJLG+TVJ5
         2dsdmcglT5bTpIwTMgdVFpLufFyHWF+0i7ZwJ8ZLGa7B57Cb7SOoA2fFHjSdVzMDqGZ3
         bj+IqKJGWbjW2qayiOiIiILm5lbjev131csctLsXGo5jgac2Kqkgwl8MHSeCugeMrPLI
         49Rw==
X-Forwarded-Encrypted: i=1; AJvYcCVfIia+yp1sIaqcD45wpQ+vqu9usdSEjHsnhDYI1OmJchAA3ozjDFSxvTmxdcEkGE0hngYco7GVXAYHH6M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYipAJZTsQW7x5TyJozSmBl9hShNMdsdrYwgeoAs4XiwSEB9Sy
	+6Fg9XSg57brEyHSludj/U8/84P+f5gMhUnIS6OwPilaloeLDPvA
X-Gm-Gg: ASbGncstkEk3x+r/EAL9Th9hqlkRjhQHefXhJgNlbspliobPk1GrWeWXW1tjBcjUddm
	n8HNE/asaMJH11EbpbY+jhWcv5uPpomyV1Xw91k/A7wUVTNg9UOdngPB4N0ndR/dUZJaxzV6JrY
	cjk7xH88NQRbfx3L7iaYiXZBms1HMD/z362/L3E2GlcvsYbKTrc9WMGweQdtA11qdAngOqf0KZk
	a/tiCuR/u6bG0bkI+GJP2/b78o7Snj0LEKPeqTPuNDNT2IJS3vlrb4hvrqjvhl536P06WGHpvDb
	1sxMDclQWk2wkPoFRYrZhzFQaMectfc=
X-Google-Smtp-Source: AGHT+IGToc/kGWkzde6y1XJ2Iuyq2BTibRMDiLOdIZo2G0z5rfjdXFqozq1t+u7xhnldZvZXHFGMDw==
X-Received: by 2002:a05:6402:401c:b0:5db:e91a:6baf with SMTP id 4fb4d7f45d1cf-5dcdb712a06mr11388909a12.14.1738786179154;
        Wed, 05 Feb 2025 12:09:39 -0800 (PST)
Received: from f.. (cst-prg-95-94.cust.vodafone.cz. [46.135.95.94])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab703fbcc0csm932221866b.53.2025.02.05.12.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 12:09:38 -0800 (PST)
From: Mateusz Guzik <mjguzik@gmail.com>
To: ebiederm@xmission.com,
	oleg@redhat.com
Cc: brauner@kernel.org,
	akpm@linux-foundation.org,
	Liam.Howlett@oracle.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Mateusz Guzik <mjguzik@gmail.com>
Subject: [PATCH v5 1/5] exit: perform add_device_randomness() without tasklist_lock
Date: Wed,  5 Feb 2025 21:09:25 +0100
Message-ID: <20250205200929.406568-2-mjguzik@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205200929.406568-1-mjguzik@gmail.com>
References: <20250205200929.406568-1-mjguzik@gmail.com>
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

Reviewed-by: Oleg Nesterov <oleg@redhat.com>
Signed-off-by: Mateusz Guzik <mjguzik@gmail.com>
---
 kernel/exit.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/exit.c b/kernel/exit.c
index 3485e5fc499e..c79b41509cd3 100644
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
@@ -278,6 +275,9 @@ void release_task(struct task_struct *p)
 	write_unlock_irq(&tasklist_lock);
 	proc_flush_pid(thread_pid);
 	put_pid(thread_pid);
+	add_device_randomness(&p->se.sum_exec_runtime,
+			      sizeof(p->se.sum_exec_runtime));
+	free_pids(post.pids);
 	release_thread(p);
 	put_task_struct_rcu_user(p);
 
-- 
2.43.0

