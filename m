Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06ABE2BAF9
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 03:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744688674; cv=none; b=BOc3Sa5im9a2dUEMsJRe1a1U16EyXPVbUYRbRgHLPNaN4VyYLixYNOZn4zU7amjuzjGB6qz+eIYElZ+c3XVDEDjYPKtgnn2pby1M24XqBOqNcWbbeicNY4uI7h47R7wEFKYpazmOTqwtA/aq15Qww+akWg527k85dFar4Pa7XUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744688674; c=relaxed/simple;
	bh=6ndNnKQQzuRuXFdVjgZ6Syc7HRTz7CfS0JIUMBPTDEM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kgeS//MI7K+v7oupfPGfjpySx9FZqqGitKq0V8lH7+kcqZXTEol5y69df6acGJspny+E7wKtaK5J4ugslXktcYc7WGjvzdzxp3WMNrMntTKbgFkpECCwCdwaS9DO4TkONPm9fCc39HlWIanyuTu3Aa3Q38hlE251Ino46tcfT+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BEjEJ7dq; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BEjEJ7dq"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-736c1138ae5so4970863b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 20:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744688672; x=1745293472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dKS5rOz7ang1NarqFeC0/+mWHGy1rD4OU6jItF9usOM=;
        b=BEjEJ7dqPi6MWCVlyxcnmJ8MnBQaDZTXtaXY/4j6MKcdMIcHMrIXa6Sa2XLzBMsgZc
         mBwt4Z7B1tFIg0L5TlHHwkOPmaJiXpdDcXaI4YP09wwd7Bkr1AIK3O7kPKL1IA0kZ96R
         d3QCGN/K9HLXg/9dnR2Wq/Erz99FxZ+hiWzLpt7YeoU56njHLLlFIQFPuhToKNkJIShb
         QitBfj7gCbZ83ZaKE6dArZKpBsBBN+I+PU31j2MXE+UfE8vTvRtNKU51mGRj7SB4dPRJ
         A8AViwYXu9vb6X/Xs/5G6P3UYWxrTOACP8LOTsFqLuMR9w7hGZGMBZF9Ch7maXRwry9G
         dphQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744688672; x=1745293472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dKS5rOz7ang1NarqFeC0/+mWHGy1rD4OU6jItF9usOM=;
        b=EdSfCGNHpzjsgXk21AMYYuxbBF5uZwV8Mk547n7rpYhOxJk1Ebogma9GgGwJavhGWm
         PSBT3NGRaV3lNbljbINrbi4aaDNi8bNsY56W02eunOWkHx/HGTRNrprpxBHEKhu505i6
         2sNXYnIIIrg5sOpNQKfQiTfSlhU/XEWgym7SYRClHoIiqeNt6Fy0UuliRIfo71MFiB/2
         LwM0SGVmRYEGVAgNRK2X7DwW6SCGzyqCHFx6gwtxu7v53YaSupcyq7Ndp+3+lh7dziF2
         re7QkV520RbOPixRVwNzaY2i7Wz1qbTb5Uw4ximBQnvAjUAjeK5juMT0ErviYflYzu1U
         ezHA==
X-Forwarded-Encrypted: i=1; AJvYcCWLuh75vR8q93yMh10rdDWG70HgalkGOAqohuAlc0IF4XBH7Tzm6wyJ1bVoDNFDR908nuC2IV3LBviX74Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhhtH+4UC8/KY/ThZHgydg3tiexYVTnpAoB8Nlzq/gKX3gmaEI
	9vx4GZw3jOk3aGSWyUlbJxsr1XqH6w8XpYJznpEOi23dpw3kL38q
X-Gm-Gg: ASbGnctkLggs3p0HlFCIoz5PYL+HGLePqiD8rKpe7ipnbdv1EwygAM+xpSgtQPJmozm
	qAVNwI+Jzmel+EOsIHTEV3w9+q9u7pqWLuPD8hMnwpx8K+f105Q0wZUy03wtcHPuFp9MIXLmvVT
	X4+i3Zoh5FqzuDDvdFkRHA5gGffRENPYa2PcvMftB8AzAesVtrfGJq5OLS2OR6FQF+yXQRrD5aU
	gTW8XAhcnxVzinIG7MGduFJrkef9l8KzcOyDqSeyrMq21P/OW/c0H92oc22hZX0zOsg1DBPp3/Y
	upYB7/uLPv/TtSlRenYKdw0XZbbiCg3iso1JMqSBjf6fhxKfiIPkZBCA
X-Google-Smtp-Source: AGHT+IELgDFpZK4Ui492FpDknFNSfWI7ntUjOT8mUFhKyXOlnebL66ShRj6FO+JKLl6EqL7lTjUypw==
X-Received: by 2002:a05:6a21:a4ca:b0:1f5:790c:94a with SMTP id adf61e73a8af0-201797c3989mr20913723637.25.1744688672186;
        Mon, 14 Apr 2025 20:44:32 -0700 (PDT)
Received: from EBJ9932692.tcent.cn ([43.129.202.66])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a321edf6sm10010125a12.65.2025.04.14.20.44.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Apr 2025 20:44:31 -0700 (PDT)
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
Subject: Re: [PATCH v5 1/3] hung_task: replace blocker_mutex with encoded blocker
Date: Tue, 15 Apr 2025 11:44:21 +0800
Message-ID: <20250415034422.95089-1-ioworker0@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250414143637.a1ae89d6b46c13f195e9210e@linux-foundation.org>
References: <20250414143637.a1ae89d6b46c13f195e9210e@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andrew,

On Tue, Apr 15, 2025 at 5:36 AM Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Mon, 14 Apr 2025 22:59:43 +0800 Lance Yang <ioworker0@gmail.com> wrote:
>
> > This patch replaces 'struct mutex *blocker_mutex' with 'unsigned long
> > blocker', as only one blocker is active at a time.
> >
> > The blocker filed can store both the lock addrees and the lock type, with
> > LSB used to encode the type as Masami suggested, making it easier to extend
> > the feature to cover other types of locks.
> >
> > Also, once the lock type is determined, we can directly extract the address
> > and cast it to a lock pointer ;)
> >
> > ...
> >
> >  static void debug_show_blocker(struct task_struct *task)
> >  {
> >       struct task_struct *g, *t;
> > -     unsigned long owner;
> > -     struct mutex *lock;
> > +     unsigned long owner, blocker;
> > 
> >       RCU_LOCKDEP_WARN(!rcu_read_lock_held(), "No rcu lock held");
> > 
> > -     lock = READ_ONCE(task->blocker_mutex);
> > -     if (!lock)
> > +     blocker = READ_ONCE(task->blocker);
> > +     if (!blocker ||
> > +         hung_task_get_blocker_type(blocker) != BLOCKER_TYPE_MUTEX)
> >               return;
> > 
> > -     owner = mutex_get_owner(lock);
> > +     owner = mutex_get_owner(
> > +             (struct mutex *)hung_task_blocker_to_lock(blocker));
>
> typecast is unneeded?

Good catch! This typecast is redundant here. Since the #02[1] patch already
covers this code section, could you please fold the following change into
that patch?

diff --git a/kernel/hung_task.c b/kernel/hung_task.c
index d2432df2b905..b30b9ab17694 100644
--- a/kernel/hung_task.c
+++ b/kernel/hung_task.c
@@ -111,12 +111,10 @@ static void debug_show_blocker(struct task_struct *task)
 
 	switch (blocker_type) {
 	case BLOCKER_TYPE_MUTEX:
-		owner = mutex_get_owner(
-			(struct mutex *)hung_task_blocker_to_lock(blocker));
+		owner = mutex_get_owner(hung_task_blocker_to_lock(blocker));
 		break;
 	case BLOCKER_TYPE_SEM:
-		owner = sem_last_holder(
-			(struct semaphore *)hung_task_blocker_to_lock(blocker));
+		owner = sem_last_holder(hung_task_blocker_to_lock(blocker));
 		break;
 	default:
 		WARN_ON_ONCE(1);
--

[1] https://lore.kernel.org/all/20250414145945.84916-3-ioworker0@gmail.com

Thanks,
Lance
