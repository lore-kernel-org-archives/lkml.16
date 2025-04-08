Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE64726A0FF
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 12:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744115299; cv=none; b=mGx7MyqR8heJYmawfsfsi9O5oC7Tj+hVvLxNzGhAqA8gHasq0EjlLQ88favJFH/jrHerL0EOmtC8Lv9d7FEh5tidaw4VU/SSw50P1GzG8hz2zpdYOKR04IrGALqxInP/oSI5UZUGILZLwjwDKqOxsgU3GwpLB2cc+o3EXqBk57k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744115299; c=relaxed/simple;
	bh=DObU19VvY006XQ3e10r/OUmsX5tErlL3kFH9coykFdo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sISL/2zWzZj6e0LGE6aS3vOs7mbwYmk2Oh4ZPRoLk/wK9magrpMxj/HBTFXXiv6mBQgK6dYQ9MFzcuNNXzS9mVjf+ZDqSuCELDVVxDeJOPxLFYKPe10hoyWiA8lQQL9WD7D2oPKxBPXAM64M0fUsTE3BZJPlIgSlPvg5e8NfmEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W+Pi8CH5; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W+Pi8CH5"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-226185948ffso55246325ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 05:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744115297; x=1744720097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D41DPV1aln/uONmmmvqsYx6PaSPo1bAlKrhaJKKH4yI=;
        b=W+Pi8CH5Yl+9imQJ2b9GB3OxYkJOYzVk7/2iwgA4ZPjhy0+sshgmQfl5xovocNInuz
         IeV1khELv19O6mApVOgUX+qcIo8vcJ3vlrUxS3BALCyM6Bcv0853LFZze02DRGXMn67N
         Vi0bI+DX8rvNJxPzetSnaceYJlOQT5ErCpM/qzLEcU6m/HDzqP/NnrDeTp8tkZ48cUch
         LbL1296S/t4stv/lAiUUqqJgvGCFBC91/b9V3jXAOtPwa7vgr++Ss429zYPWGJoDkbvc
         Mf+e0VkMan/Lvo/OX41UNLtvvbt4P+JJyCOY7I86KGy2K5TR6o0Crimy2PYjqVremlVW
         gVvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744115297; x=1744720097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D41DPV1aln/uONmmmvqsYx6PaSPo1bAlKrhaJKKH4yI=;
        b=HX/cowNQbg85wU850OK8Df7BSP5ujbEaEx0eyVC2B1wg/C+Q6qXIhvAvwLSC0DbBig
         0INiNrj26XuZdqToDesdkl+L+0k+8DRW1gBIonqy/GGQDVpoLZoBwUpUUwHz0kUob7lC
         GILIJOrFNaUa2vNykTCJAE5mFvFasVb3ljA7DkCyaEPAqCD6vrWJEXwZfiXSYeHntSKG
         cOoN2MWOd5h2eHJh7mtmSAUFJvrwo8ItaEJEcFjNM+QS7ONNfUGNj6KFil7SpHmyRMkY
         K6+WDu/Ngs3c2+2hT/Mv7+edzTxSpAG2yLYBQb0jQZOhIeAsY62YpruZ5aFb1qwZtZXv
         Dn0A==
X-Forwarded-Encrypted: i=1; AJvYcCWa3PW1zOsYrH6hxWASrQ67BeJPRhAUaGtoJ9q4peQdJEP6vppkxBahvWBnPTagc1wgUAOLLlTZRFiJtao=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRGxU1Wybc2JHkpv973qoJ0gCCE2LYnpfNTUOEziLHVWTv7CEX
	RQ72c541/gMq45fau42IyFD0cmwIzN3ffgIlY49tmvbQUqkhFGti
X-Gm-Gg: ASbGncs2RpwyARVMj+lPaz/kORVgjdrD7iDI2mwOwYyulpCWQaW7WLn7xXBxnWv183a
	O6NZHXtQVH7IrRceHcxv3cweuBCh/H09wu5+TAOxNUQwfjJUM1/Yvz0DtH16On6BoD4xwQTNsQO
	S7sLosHeJmNMcWyOY9YSWwnd/inlj+uijz8/6raMHXfUoCcikUGuxA5dWxEwjFBjMG8dzM8CSvH
	sa8Mitvn7IUnR9uGO7pz5vVZo4hOOMjf0yJ5WxuXFHJpm6DkULlf1s5pomwNpj4JVguM0+SXDSW
	UV2JnHcVCkXcsGe4eTDwObBd1Fj//n1J5VzpwUNjW/TMHRV7ECpJ
X-Google-Smtp-Source: AGHT+IFX93uD6fHPuXQZl6l4cYSbASjyGb6DJ1ELwG6483Dsa38fYZu6BeqDv5ozCk5EfMHqm4W8/w==
X-Received: by 2002:a17:903:22c4:b0:227:e980:919d with SMTP id d9443c01a7336-22a955a18b3mr133803495ad.47.1744115296880;
        Tue, 08 Apr 2025 05:28:16 -0700 (PDT)
Received: from localhost.localdomain ([43.129.202.66])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297877658fsm98447165ad.238.2025.04.08.05.28.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 08 Apr 2025 05:28:16 -0700 (PDT)
From: Lance Yang <ioworker0@gmail.com>
To: akpm@linux-foundation.org
Cc: amaindex@outlook.com,
	anna.schumaker@oracle.com,
	boqun.feng@gmail.com,
	ioworker0@gmail.com,
	joel.granados@kernel.org,
	jstultz@google.com,
	kent.overstreet@linux.dev,
	leonylgao@tencent.com,
	linux-kernel@vger.kernel.org,
	longman@redhat.com,
	mhiramat@kernel.org,
	mingo@redhat.com,
	mingzhe.yang@ly.com,
	peterz@infradead.org,
	rostedt@goodmis.org,
	senozhatsky@chromium.org,
	tfiga@chromium.org,
	will@kernel.org
Subject: Re: [PATCH v4 2/3] hung_task: show the blocker task if the task is hung on semaphore
Date: Tue,  8 Apr 2025 20:27:57 +0800
Message-ID: <20250408122758.83495-1-ioworker0@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407130845.3c3501a03963f1d44835c755@linux-foundation.org>
References: <20250407130845.3c3501a03963f1d44835c755@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andrew,

Thanks a lot for taking time to review!

On Tue, Apr 8, 2025 at 4:08 AM Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Thu, 20 Mar 2025 14:49:22 +0800 Lance Yang <ioworker0@gmail.com> wrote:
>
> > Inspired by mutex blocker tracking[1], this patch makes a trade-off to
> > balance the overhead and utility of the hung task detector.
> >
> > Unlike mutexes, semaphores lack explicit ownership tracking, making it
> > challenging to identify the root cause of hangs. To address this, we
> > introduce a last_holder field to the semaphore structure, which is
> > updated when a task successfully calls down() and cleared during up().
> >
> > The assumption is that if a task is blocked on a semaphore, the holders
> > must not have released it. While this does not guarantee that the last
> > holder is one of the current blockers, it likely provides a practical hint
> > for diagnosing semaphore-related stalls.
> >
> > With this change, the hung task detector can now show blocker task's info
> > like below:
>
> +#ifdef CONFIG_DETECT_HUNG_TASK_BLOCKER
> +#ifdef CONFIG_DETECT_HUNG_TASK_BLOCKER
> +#ifdef CONFIG_DETECT_HUNG_TASK_BLOCKER
> +#ifdef CONFIG_DETECT_HUNG_TASK_BLOCKER
> +#ifdef CONFIG_DETECT_HUNG_TASK_BLOCKER
> +#ifdef CONFIG_DETECT_HUNG_TASK_BLOCKER
> +#ifdef CONFIG_DETECT_HUNG_TASK_BLOCKER
> +#ifdef CONFIG_DETECT_HUNG_TASK_BLOCKER
>
> It looks pretty simple to reduce the amount of ifdeffery which this
> patch adds.

Good catch! We can reduce five ifdeffery with the following change ;)

diff --git a/kernel/locking/semaphore.c b/kernel/locking/semaphore.c
index 3d06d4adc05b..db8a8f696f50 100644
--- a/kernel/locking/semaphore.c
+++ b/kernel/locking/semaphore.c
@@ -40,7 +40,41 @@ static noinline int __down_interruptible(struct semaphore *sem);
 static noinline int __down_killable(struct semaphore *sem);
 static noinline int __down_timeout(struct semaphore *sem, long timeout);
 static noinline void __up(struct semaphore *sem);
-static inline void __sem_acquire(struct semaphore *sem);
+
+#ifdef CONFIG_DETECT_HUNG_TASK_BLOCKER
+static inline void hung_task_sem_set_holder(struct semaphore *sem)
+{
+	WRITE_ONCE((sem)->last_holder, (unsigned long)current);
+}
+
+static inline void hung_task_sem_clear_if_holder(struct semaphore *sem)
+{
+	if (READ_ONCE((sem)->last_holder) == (unsigned long)current)
+		WRITE_ONCE((sem)->last_holder, 0UL);
+}
+
+unsigned long sem_last_holder(struct semaphore *sem)
+{
+	return READ_ONCE(sem->last_holder);
+}
+#else
+static inline void hung_task_sem_set_holder(struct semaphore *sem)
+{
+}
+static inline void hung_task_sem_clear_if_holder(struct semaphore *sem)
+{
+}
+unsigned long sem_last_holder(struct semaphore *sem)
+{
+	return 0UL;
+}
+#endif
+
+static inline void __sem_acquire(struct semaphore *sem)
+{
+	sem->count--;
+	hung_task_sem_set_holder(sem);
+}

 /**
  * down - acquire the semaphore
@@ -188,10 +222,7 @@ void __sched up(struct semaphore *sem)

 	raw_spin_lock_irqsave(&sem->lock, flags);

-#ifdef CONFIG_DETECT_HUNG_TASK_BLOCKER
-	if (READ_ONCE(sem->last_holder) == (unsigned long)current)
-		WRITE_ONCE(sem->last_holder, 0UL);
-#endif
+	hung_task_sem_clear_if_holder(sem);

 	if (likely(list_empty(&sem->wait_list)))
 		sem->count++;
@@ -233,9 +264,7 @@ static inline int __sched ___down_common(struct semaphore *sem, long state,
 		timeout = schedule_timeout(timeout);
 		raw_spin_lock_irq(&sem->lock);
 		if (waiter.up) {
-#ifdef CONFIG_DETECT_HUNG_TASK_BLOCKER
-			WRITE_ONCE(sem->last_holder, (unsigned long)current);
-#endif
+			hung_task_sem_set_holder(sem);
 			return 0;
 		}
 	}
@@ -254,17 +283,13 @@ static inline int __sched __down_common(struct semaphore *sem, long state,
 {
 	int ret;

-#ifdef CONFIG_DETECT_HUNG_TASK_BLOCKER
 	hung_task_set_blocker(sem, BLOCKER_TYPE_SEM);
-#endif

 	trace_contention_begin(sem, 0);
 	ret = ___down_common(sem, state, timeout);
 	trace_contention_end(sem, ret);

-#ifdef CONFIG_DETECT_HUNG_TASK_BLOCKER
 	hung_task_clear_blocker();
-#endif

 	return ret;
 }
@@ -297,23 +322,3 @@ static noinline void __sched __up(struct semaphore *sem)
 	waiter->up = true;
 	wake_up_process(waiter->task);
 }
-
-#ifdef CONFIG_DETECT_HUNG_TASK_BLOCKER
-unsigned long sem_last_holder(struct semaphore *sem)
-{
-	return READ_ONCE(sem->last_holder);
-}
-#else
-unsigned long sem_last_holder(struct semaphore *sem)
-{
-	return 0UL;
-}
-#endif
-
-static inline void __sem_acquire(struct semaphore *sem)
-{
-	sem->count--;
-#ifdef CONFIG_DETECT_HUNG_TASK_BLOCKER
-	WRITE_ONCE(sem->last_holder, (unsigned long)current);
-#endif
-}
---

[...]

> >  static noinline void __down(struct semaphore *sem);
> >  static noinline int __down_interruptible(struct semaphore *sem);
> >  static noinline int __down_killable(struct semaphore *sem);
> >  static noinline int __down_timeout(struct semaphore *sem, long timeout);
> >  static noinline void __up(struct semaphore *sem);
> > +static inline void __sem_acquire(struct semaphore *sem);
>
> It feels Just Weird to forward declare a static inline.  Is there a
> special reason for doing this?

Thanks for pointing this out.

Indeed, the forward declaratio was weird :(
Fixed by removing it as shown in the diff above.

Thanks,
Lance
