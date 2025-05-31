Received: from mail-oo1-f66.google.com (mail-oo1-f66.google.com [209.85.161.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D25E22339
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 11:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748689381; cv=none; b=VUuQRS3tjfcDoo/HoqLfAREcZqAhcuxLPX5WuJi7FayBSIbELTbBfOEw33U4F3wumtkJvpLJq+r3B7hKRJKhtBmgo2cHBB56nwH/tOJBgKza5wHNoHKCas8CeJnFPMyT7JyikS1eubt+cDtZyFfydjACcJJi6390hIMeXDrQTic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748689381; c=relaxed/simple;
	bh=MQ0QsfN78p6M7ysS6rRwuQHFP9/bjaEB6BqUbOvdxvQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=mG1Dx/Sy8mx3asc+R3f555yTQwJwk/z5PEHqKs6MUNN8AchpWautIylY1La+74CARZNuOWKmFwatEwThPijSBW66h2USbhnXxKcqm8KuLKTIg7NNZdivCdyeY4NDi/gAHrU61RNOiWyi2Rg8hMxvnKj4yxbtTXwNTeJOsG/xJjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SoTBEBB6; arc=none smtp.client-ip=209.85.161.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SoTBEBB6"
Received: by mail-oo1-f66.google.com with SMTP id 006d021491bc7-6021e3daeabso1457269eaf.3
        for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 04:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748689379; x=1749294179; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8MJVpLnAhuiLyjmxqyPqgnL0s3rbxwXJq8Lbe3LlxTU=;
        b=SoTBEBB6YgbRLvab8eW4EauoYVpDTBrbDB943CiNHo5j46H2SlrYarUJz/lPwe4FmY
         fs9Yx7D3tYlCuiK/UclFG4dppGk/gdjr9o7cUOqnoME8DdgotcA1O9Cfkj774bbcD2Pq
         uK6MYFuMxHRWHC303vHOeHMFQ0YD53w1nbSYoyCdEXeNOSSmEPmUJ/3H4DiJKF3569n9
         IIfwlYQfJbGEqcVyUPpzhjflII4nRja7ZcNwDYvB4kVUzChS53+0LdZMud7eOGJ0SScV
         7QfqoiF5Q+ixg81NOZXPeWDwvm844c59R/1PmUlVvyk+fKscgLuBNy3QFcIlHJ7kJ585
         UjLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748689379; x=1749294179;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8MJVpLnAhuiLyjmxqyPqgnL0s3rbxwXJq8Lbe3LlxTU=;
        b=jVFcC3y80qJ2UqAUqLLn+56qV7YFo3M9JgKr3YVofHwg1s+TJ0BdJM9xKzCLGubbpi
         lUPoaQialOuP2aY7zmA+1Z8hh9aaL2+xjBEgY40S4qa3xd229QOUwfQrNaRWn1V7VZfw
         WuVsYlt8pLKzNe36B81yUd1JL0hQwVJGBxSHBs/xnII6itURDeoFga30xOUP8NirWrkO
         fu7W+nG4u4nHlFv7R9HIdmrbKvIFAm1IL6J1VfZkGoLwd2/Oi+27ylVpLGO43jCMOR+U
         H4u/Pl/dqQ6dWAmt1BQbAxwnXnYl5KwamAY/u+eOYPN5QH3EtET3n6XM02+liIk2Tmls
         Gcog==
X-Gm-Message-State: AOJu0Ywmw7DWIZlf+iJ+Y8rM8UBKr7N/Hw3OwPDNlAxIm1D3nNABZVcZ
	anhjEdz7VLo7uxfM1nxv+1gmGb/nsDq0yC2yEqRXeHJs9KZ17tQU8RITp7K9Pm6QDP8YWEapM6h
	+N4omgppxaahQgnBwSxMezs0Oi81x7uKTraWx7sk=
X-Gm-Gg: ASbGncsbjNjWALLd+ohiGVoPqK4+m2cedHOBnl6WBZCENF9JL9BmsBbg/tVs7Iv/W5V
	AbDH4JfBid4ukm2xFePQIb5tPAKA4TnsG9J9cTPP4T98ioWpq2xXcWnkVcXwAC+5mWB525u1rHq
	NXNiLr/pko53IgpjnB6C6j6jJqdYlAQ31PXU7j0McvAJIQ6uu8d0agoq2S7KrvUIwiZA==
X-Google-Smtp-Source: AGHT+IGKk5ajWyklz0mksu47OSabJcuFKa6zZAwQ3u32kPtPsEI4fkaKveNB9a9lshKcupoTDsKOPG0mPutK5pLEYXc=
X-Received: by 2002:a05:690c:7405:b0:70d:ecdd:9bd1 with SMTP id
 00721157ae682-70f97fc644amr88028967b3.24.1748689368884; Sat, 31 May 2025
 04:02:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Amit <amitchoudhary0523@gmail.com>
Date: Sat, 31 May 2025 16:32:38 +0530
X-Gm-Features: AX0GCFtfD7ne3UV7afYofVX4jg2bI7lk0tE2wmsC0PzSBUBfjsSacL8g_vSND-k
Message-ID: <CAFf+5zic0=7ThhCZu2wwGd+OKEErsvbL31N0MSzRRO35CZaOVA@mail.gmail.com>
Subject: List of pthread functions and symbols.
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

List of pthread functions and symbols.

---------
Functions
---------

int pthread_create(pthread_t *, const pthread_attr_t *, void *(*)(void *),
                   void *);
int pthread_detach(pthread_t);
int pthread_join(pthread_t, void **);
void pthread_exit(void *);

int pthread_attr_init(pthread_attr_t *);
int pthread_attr_setdetachstate(pthread_attr_t *, int);
int pthread_attr_getdetachstate(const pthread_attr_t *, int *);
int pthread_attr_setstacksize(pthread_attr_t *, size_t);
int pthread_attr_getstacksize(const pthread_attr_t *, size_t *);
int pthread_attr_setguardsize(pthread_attr_t *, size_t);
int pthread_attr_getguardsize(const pthread_attr_t *, size_t *);
int pthread_attr_setstackaddr(pthread_attr_t *, void *);
int pthread_attr_getstackaddr(const pthread_attr_t *, void **);
int pthread_attr_destroy(pthread_attr_t *);

int pthread_mutex_init(pthread_mutex_t *, const pthread_mutexattr_t *);
int pthread_mutex_lock(pthread_mutex_t *);
int pthread_mutex_trylock(pthread_mutex_t *);
int pthread_mutex_unlock(pthread_mutex_t *);
int pthread_mutex_destroy(pthread_mutex_t *);

int pthread_mutexattr_init(pthread_mutexattr_t *);
int pthread_mutexattr_settype(pthread_mutexattr_t *, int);
int pthread_mutexattr_gettype(const pthread_mutexattr_t *, int *);
int pthread_mutexattr_setpshared(pthread_mutexattr_t *, int);
int pthread_mutexattr_getpshared(const pthread_mutexattr_t *, int *);
int pthread_mutexattr_setprotocol(pthread_mutexattr_t *, int);
int pthread_mutexattr_getprotocol(const pthread_mutexattr_t *, int *);
int pthread_mutexattr_destroy(pthread_mutexattr_t *);

int pthread_cond_init(pthread_cond_t *, const pthread_condattr_t *);
int pthread_cond_wait(pthread_cond_t *, pthread_mutex_t *);
int pthread_cond_broadcast(pthread_cond_t *);
int pthread_cond_signal(pthread_cond_t *);
int pthread_cond_destroy(pthread_cond_t *);

int pthread_cond_timedwait(pthread_cond_t *, pthread_mutex_t *,
                           const struct timespec *);

int pthread_condattr_init(pthread_condattr_t *);
int pthread_condattr_setpshared(pthread_condattr_t *, int);
int pthread_condattr_getpshared(const pthread_condattr_t *, int *);
int pthread_condattr_destroy(pthread_condattr_t *);

int pthread_attr_getinheritsched(const pthread_attr_t *, int *);
int pthread_attr_getschedparam(const pthread_attr_t *, struct sched_param *);
int pthread_attr_getschedpolicy(const pthread_attr_t *, int *);
int pthread_attr_getscope(const pthread_attr_t *, int *);
int pthread_attr_setinheritsched(pthread_attr_t *, int);
int pthread_attr_setschedparam(pthread_attr_t *, const struct sched_param *);
int pthread_attr_setschedpolicy(pthread_attr_t *, int);
int pthread_attr_setscope(pthread_attr_t *, int);
int pthread_cancel(pthread_t);
void pthread_cleanup_push(void*), void *);
void pthread_cleanup_pop(int);
int pthread_equal(pthread_t, pthread_t);
int pthread_getconcurrency(void);
int pthread_getschedparam(pthread_t, int *, struct sched_param *);
void *pthread_getspecific(pthread_key_t);
int pthread_key_create(pthread_key_t *, void (*)(void *));
int pthread_key_delete(pthread_key_t);
int pthread_mutex_getprioceiling(const pthread_mutex_t *, int *);
int pthread_mutex_setprioceiling(pthread_mutex_t *, int, int *);
int pthread_mutexattr_getprioceiling(const pthread_mutexattr_t *, int *);
int pthread_mutexattr_setprioceiling(pthread_mutexattr_t *, int);
int pthread_once(pthread_once_t *, void (*)(void));

int pthread_rwlock_init(pthread_rwlock_t *, const pthread_rwlockattr_t *);
int pthread_rwlock_rdlock(pthread_rwlock_t *);
int pthread_rwlock_tryrdlock(pthread_rwlock_t *);
int pthread_rwlock_wrlock(pthread_rwlock_t *);
int pthread_rwlock_trywrlock(pthread_rwlock_t *);
int pthread_rwlock_unlock(pthread_rwlock_t *);
int pthread_rwlock_destroy(pthread_rwlock_t *);

int pthread_rwlockattr_init(pthread_rwlockattr_t *);
int pthread_rwlockattr_setpshared(pthread_rwlockattr_t *, int);
int pthread_rwlockattr_getpshared(const pthread_rwlockattr_t *, int *);
int pthread_rwlockattr_destroy(pthread_rwlockattr_t *);

pthread_t pthread_self(void);
int pthread_setcancelstate(int, int *);
int pthread_setcanceltype(int, int *);
int pthread_setconcurrency(int);
int pthread_setschedparam(pthread_t, int, const struct sched_param *);
int pthread_setspecific(pthread_key_t, const void *);
void pthread_testcancel(void);

-------
Symbols
-------

PTHREAD_CREATE_DETACHED
PTHREAD_CREATE_JOINABLE

PTHREAD_MUTEX_INITIALIZER
PTHREAD_COND_INITIALIZER

PTHREAD_MUTEX_DEFAULT
PTHREAD_MUTEX_NORMAL
PTHREAD_MUTEX_RECURSIVE
PTHREAD_MUTEX_ERRORCHECK
PTHREAD_PROCESS_SHARED
PTHREAD_PROCESS_PRIVATE

PTHREAD_RWLOCK_INITIALIZER

PTHREAD_CANCEL_ASYNCHRONOUS
PTHREAD_CANCEL_ENABLE
PTHREAD_CANCEL_DEFERRED
PTHREAD_CANCEL_DISABLE
PTHREAD_CANCELED
PTHREAD_EXPLICIT_SCHED
PTHREAD_INHERIT_SCHED
PTHREAD_ONCE_INIT
PTHREAD_PRIO_INHERIT
PTHREAD_PRIO_NONE
PTHREAD_PRIO_PROTECT
PTHREAD_SCOPE_PROCESS
PTHREAD_SCOPE_SYSTEM

----
