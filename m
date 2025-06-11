Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1D625BEED
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 11:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749642542; cv=none; b=pQ0Zzq9k94JP2aXO6ThEwWdluhfkMTpZnvoMw9erwhtQDG4IHv8GKgA6mypKIgib/Zy1GLFhucfa8Bg/EmkUETv1DniyZ5ijuumfNRvbl//2LBQDpop/ynY/+9kfHbscgm0QdFh9LJI1EbbMr3gMWx6ty0rTCwidOYBv08XW7Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749642542; c=relaxed/simple;
	bh=35M5gOyWlSaqL6iH1KU+YV0U7S6wgKSwxLGbs4KIhfE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OA9nYEqdFDOlKCHun0emcd42hxOjpekNdc1mbWQxUnoIiVvqb8DTfdfkA1mE263ASX4YZwRjL8uXoVfrNrBlN4Gw94vr7llPOXgxUOjnzPu/0EYywzqfagE2QDaXEfkLIgsu37Ywn4cose6NvCh5GC81VdCMR15/MpfNNvtlH38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C9ghENme; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C9ghENme"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-60794c43101so6871108a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 04:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749642539; x=1750247339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LSRjpysjkvUqzPQa+4DtR1H7++BicgArTKa2t6hjtGY=;
        b=C9ghENmeToVUF/KYUew990rIk9SrUTkgGjpP12pJl7qXlQLp+y4NweVUlamKaSsMjr
         2zHl013HMcukEUKqOBOUlE9DmJJ8K1NADum6QEgjHFr3+Xsxl7EaWr1KCTc7earcwBAv
         TXh+0iU/lcd87q9yNkTaWDFu4/5jDw4Dfl6CyToMhlie0Mi7S7Xn1Ndc85AwJdLJEMcC
         /IBWDysgXbsDwiJcYR9JSOajoncc8ZdHrRc4+w+VXT3SeRG9tmBpLluEpvVcNliYEugi
         T7hsNKFhcr1OUQIcPilvxsG6fuM4BHNHcb5PLMPnDr6s03EpAPRb9DjldjbsfO3NtyKx
         H2hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749642539; x=1750247339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LSRjpysjkvUqzPQa+4DtR1H7++BicgArTKa2t6hjtGY=;
        b=ikQTvjnZjVaoFLzUmS8C4Kx0EY6QzpkAOWBXZRsteobeeg98djJg8Yk20+5ef6QRaV
         lYrFc+Z+KwYHo1CjJDyqGt3xwTEPLo6dD5mcVH13X+9rSdJ/dhM7EMIA3YFYYSlnMaTK
         MROTPEdOZFHUoRvkCwRMuTaJ0py692GWQslgm9As+4VxsrKssDwBNV28X9b7DGGku/a2
         cj31E9oRT0lRWJf41Z75m5USgEJtIbkzrlH8kQF7c7CN1IVeaulje7H78NhuMiPxTd4T
         Hkx+JvCiYUzVIaytC1iTrWp556wDY/e/Pidp8PBHuIw0bb728EzSMU8BoB5zFPhFmB0y
         YqzQ==
X-Gm-Message-State: AOJu0YwBGwHZLAgTE+yFK6ViHuCiB2pPlXnNsA8dN9Gn/Kq85ScxrRQ9
	Qwncf9BmHLxpAz+/M3JUQJLjbtUGkz4Vfo+KyXJx+uCy92hC0HisFi0z
X-Gm-Gg: ASbGncsnnssYYBBUZz/hYUJdoKgOOGowmvEbiymvHFjMJn0Lp0UKmRSfbipQKEww2Ie
	sgdLJ0CdIb+3tC4heexlHAcIR8kuXUfmWzrZKTrpVjmrhgOVt1vdKz3ML4Ri9lHKSr88QyIDASr
	66ogneBYMwA6+2udKRC15xhprfrCf9on7JH9kebfzs7F7dFUGrXqJT6NRoiyqBC3yUZ/T7ya+VI
	ExN+m0HhPOI2DNu4O0REV/gzE2+KrXDGlzC1Kg5t9ev2wymez6IEzaO9/nbagSFuAsOQRqY3tX0
	5OBxrhItobUoySeJ5ezQJXgbIEJu9QgM3Zyku4sVCbUdSbE7UjFZGIAHS4taHaEcnAVMH//l/WZ
	iag==
X-Google-Smtp-Source: AGHT+IFvMMhhCIH4jalpWwB+920r18WVhja2oWWNtYf6uMWbIL0d0FmohQk/xL8AYQFH9BE5Ruxc9w==
X-Received: by 2002:a17:906:f581:b0:ad2:15c4:e23f with SMTP id a640c23a62f3a-ade8946222dmr282933066b.13.1749642538835;
        Wed, 11 Jun 2025 04:48:58 -0700 (PDT)
Received: from localhost.localdomain ([41.79.198.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade33c09594sm787588566b.97.2025.06.11.04.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 04:48:58 -0700 (PDT)
From: Khalid Ali <khaliidcaliy@gmail.com>
X-Google-Original-From: Khalid Ali <khaliidcaliy@gmail.com
To: tglx@linutronix.de,
	peterz@infradead.org,
	luto@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Khalid Ali <khaliidcaliy@gmail.com>
Subject: [PATCH] kernel/entry: Remove some redundancy checks on syscall works
Date: Wed, 11 Jun 2025 11:43:53 +0000
Message-ID: <20250611114810.785-1-khaliidcaliy@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a redundant checks of thread syscall work.

After we read thread syscall work we are checking the work bits using
SYSCALL_WORK_ENTER and SYSCALL_WORK_EXIT on syscall entry and exit
respectively, and at the same time syscall_trace_enter() and
syscall_exit_work() checking bits one by one, the bits we already checked.
This is redundancy. So either we need to check the work bits one by one as I
did, or check as whole. On my prespective, i think the way code is
implemented now checking work bits one by one is simpler and gives us
more granular control.

I also checking if SYSCALL_WORK_SYSCALL_AUDIT is set on work as other
part. Thus we don't need SYSCALL_WORK_ENTER and SYSCALL_WORK_EXIT
anymore. We may need on the future, so we can safely let them be there.

Signed-off-by: Khalid Ali <khaliidcaliy@gmail.com>
---
 include/linux/entry-common.h | 9 ++-------
 kernel/entry/common.c        | 8 +++++---
 2 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/include/linux/entry-common.h b/include/linux/entry-common.h
index f94f3fdf15fc..60a6741d5c5a 100644
--- a/include/linux/entry-common.h
+++ b/include/linux/entry-common.h
@@ -165,11 +165,7 @@ long syscall_trace_enter(struct pt_regs *regs, long syscall,
 static __always_inline long syscall_enter_from_user_mode_work(struct pt_regs *regs, long syscall)
 {
 	unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
-
-	if (work & SYSCALL_WORK_ENTER)
-		syscall = syscall_trace_enter(regs, syscall, work);
-
-	return syscall;
+	return  syscall_trace_enter(regs, syscall, work);
 }
 
 /**
@@ -408,8 +404,7 @@ static __always_inline void syscall_exit_to_user_mode_work(struct pt_regs *regs)
 	 * enabled, we want to run them exactly once per syscall exit with
 	 * interrupts enabled.
 	 */
-	if (unlikely(work & SYSCALL_WORK_EXIT))
-		syscall_exit_work(regs, work);
+	syscall_exit_work(regs, work);
 	local_irq_disable_exit_to_user();
 	exit_to_user_mode_prepare(regs);
 }
diff --git a/kernel/entry/common.c b/kernel/entry/common.c
index e774dc9e7eaf..9accf5fde8e7 100644
--- a/kernel/entry/common.c
+++ b/kernel/entry/common.c
@@ -64,8 +64,9 @@ long syscall_trace_enter(struct pt_regs *regs, long syscall,
 		 */
 		syscall = syscall_get_nr(current, regs);
 	}
-
-	syscall_enter_audit(regs, syscall);
+	
+	if (work & SYSCALL_WORK_SYSCALL_AUDIT)
+		syscall_enter_audit(regs, syscall);
 
 	return ret ? : syscall;
 }
@@ -162,7 +163,8 @@ void syscall_exit_work(struct pt_regs *regs, unsigned long work)
 		}
 	}
 
-	audit_syscall_exit(regs);
+	if (work & SYSCALL_WORK_SYSCALL_AUDIT)
+		audit_syscall_exit(regs);
 
 	if (work & SYSCALL_WORK_SYSCALL_TRACEPOINT)
 		trace_sys_exit(regs, syscall_get_return_value(current, regs));
-- 
2.49.0

