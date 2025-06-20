Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DB12DF3E8
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 16:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750438215; cv=none; b=reROJRDqIEq4+qwJS78vYVZR6fNxnH1FzhGu/UP9Vrn6YsHycQB2lKcw/f/mQ99xKlrdauYv8HLAtLp40zt54JdYPBX5I9IS3TTLQM8TI40jS1/xASqq7kroVK5+Dr+ubGqVofCwlThz2npf9YPUxJ4wFLUGSBc59yJRoBdE1L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750438215; c=relaxed/simple;
	bh=dY+pm5eSSZsBPLfOchs10YQh8P4xM1jomqKvnhLb9/4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JL7BXM2BJDr0fe1P7tbukZLDCdhp2LJy48tHsdZtWCTSctEalH+PWp1GC/9Z/wTCauvvDrQGke4qnHBIGR5BGnV0L+MzuRFzKv1rZB5T6AeAuopmd6pX2wUtSbgCEIF5mkkFa1WfPzgnN1nqsSLcmBMzFs6Ly9uTye8RzmJg5bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mihalicyn.com; spf=pass smtp.mailfrom=mihalicyn.com; dkim=pass (1024-bit key) header.d=mihalicyn.com header.i=@mihalicyn.com header.b=ejxsIqhL; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mihalicyn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mihalicyn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mihalicyn.com header.i=@mihalicyn.com header.b="ejxsIqhL"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-553b6a349ccso2059284e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 09:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mihalicyn.com; s=mihalicyn; t=1750438212; x=1751043012; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HmlY05Xhq4DWn0Q/RTnndfyWxHMFyGtp//asKCUv8FI=;
        b=ejxsIqhLkFFjila0NFNQThJKkbmmst9UcrZHu+YqY79bBrFPrwPhd3OPW04zupj1vD
         DDu9lbiugnNeGnYuDZi5DqNXyMckCQjj0z1vdnIKwqjf0eb/FZ/acx3XYK6EJrfyNBRY
         QZv1KuVWQdDojtsIffA7y3ZjvfDVFBut6lMnY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750438212; x=1751043012;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HmlY05Xhq4DWn0Q/RTnndfyWxHMFyGtp//asKCUv8FI=;
        b=fn1b4058AM+dFdu7CSse4Oxb6xJxJVQ4XmASjtrK1j5l2Ey4Y/Gma8vrhOjdaeVck9
         ePEcpqb007WO7XS7pkVPglI0JWEhlsSu+74FpY60vhOByK/7BZ7qcijTXF50zror+Rll
         dL+Fui+v0MFP3lE8WjMK84tebSbFKInyWXkNppZ7G03g2RTuOHwfdUoVeOc0laBUbrZG
         VTyKazy+RKalA1wrNBQ5Q0AFtXBVWIDBtDwPhRJvaQdeMxXUS9F6ac6NP2Wmql6Peq4y
         nRuwqBeK/PCmnzDRHeS+VSyR8aXDS7OqDC9HX6h3qZYbiPWlx9Ikc1nIKuSp3fFlaNs1
         pTvA==
X-Forwarded-Encrypted: i=1; AJvYcCXITEcM5Irx4uJOuE01Ld60gpGOut8+JrfsQeRI1X7m3NthRDTBGTZsm4uZWcUVfSis1GEdmkC4A9E++0k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJp06KLUMUsbT+E5u2eZuK8stb2cls6k+h0zH+mWo4rg2UP37f
	sMwBFCPkxmyNhEZQCjvygiH/Ac4wNsGm6FRnK8GyP4m5jEspN1fWZcaRaKsus9g3swCbWueGH94
	L0QpLFd37WOkUNIq7PnTzEITCHSmwdSSlDYh57TiXfw==
X-Gm-Gg: ASbGncu9Bdd+MKTvrRyVS0AJWZBgXr0pCKUzCzEvae042SFvY5RT9On7hYsO/FE4nir
	CZi980+6uW6ruRsiT7YvK6tuEHtI06Boo2r/A6g09dtBEAI4LmUBmXBjK/uYmLoBk8rU83d0May
	JcF37ihhsbY9Zg0bOumbSOMCt/LUrkqgvT2YSqAn2ODNNB
X-Google-Smtp-Source: AGHT+IHK1Ts9tNZh/IwXSfefAwMh137c1G/ca2mq258vFr2H+GU2S8HSayozQQWcG5dJzahVTDnfAbIypkbA62xUy1k=
X-Received: by 2002:a05:6512:2345:b0:553:2f19:fd1e with SMTP id
 2adb3069b0e04-553e3be8549mr1147392e87.28.1750438211628; Fri, 20 Jun 2025
 09:50:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620112105.3396149-1-arnd@kernel.org>
In-Reply-To: <20250620112105.3396149-1-arnd@kernel.org>
From: Alexander Mikhalitsyn <alexander@mihalicyn.com>
Date: Fri, 20 Jun 2025 18:49:59 +0200
X-Gm-Features: Ac12FXwsQw1wrf4tvPmP69JHE9mjWKDj4FcCzqgDj3K1MOGULQa_-3nVtY4ihvA
Message-ID: <CAJqdLrq4bwF=sjZ2umwQBCMWSXEDi8N+DiSVW5poT9KfWykqmA@mail.gmail.com>
Subject: Re: [PATCH] coredump: reduce stack usage in vfs_coredump()
To: Arnd Bergmann <arnd@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Jan Kara <jack@suse.cz>, Jann Horn <jannh@google.com>, 
	Luca Boccassi <luca.boccassi@gmail.com>, Jeff Layton <jlayton@kernel.org>, 
	Roman Kisel <romank@linux.microsoft.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Am Fr., 20. Juni 2025 um 13:21 Uhr schrieb Arnd Bergmann <arnd@kernel.org>:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The newly added socket coredump code runs into some corner cases
> with KASAN that end up needing a lot of stack space:
>
> fs/coredump.c:1206:1: error: the frame size of 1680 bytes is larger than 1280 bytes [-Werror=frame-larger-than=]
>
> Mark the socket helper function as noinline_for_stack so its stack
> usage does not leak out to the other code paths. This also seems to
> help with register pressure, and the resulting combined stack usage of
> vfs_coredump() and coredump_socket() is actually lower than the inlined
> version.
>
> Moving the core_state variable into coredump_wait() helps reduce the
> stack usage further and simplifies the code, though it is not sufficient
> to avoid the warning by itself.
>
> Fixes: 6a7a50e5f1ac ("coredump: use a single helper for the socket")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>

> ---
>  fs/coredump.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/fs/coredump.c b/fs/coredump.c
> index e2611fb1f254..c46e3996ff91 100644
> --- a/fs/coredump.c
> +++ b/fs/coredump.c
> @@ -518,27 +518,28 @@ static int zap_threads(struct task_struct *tsk,
>         return nr;
>  }
>
> -static int coredump_wait(int exit_code, struct core_state *core_state)
> +static int coredump_wait(int exit_code)
>  {
>         struct task_struct *tsk = current;
> +       struct core_state core_state;
>         int core_waiters = -EBUSY;
>
> -       init_completion(&core_state->startup);
> -       core_state->dumper.task = tsk;
> -       core_state->dumper.next = NULL;
> +       init_completion(&core_state.startup);
> +       core_state.dumper.task = tsk;
> +       core_state.dumper.next = NULL;
>
> -       core_waiters = zap_threads(tsk, core_state, exit_code);
> +       core_waiters = zap_threads(tsk, &core_state, exit_code);
>         if (core_waiters > 0) {
>                 struct core_thread *ptr;
>
> -               wait_for_completion_state(&core_state->startup,
> +               wait_for_completion_state(&core_state.startup,
>                                           TASK_UNINTERRUPTIBLE|TASK_FREEZABLE);
>                 /*
>                  * Wait for all the threads to become inactive, so that
>                  * all the thread context (extended register state, like
>                  * fpu etc) gets copied to the memory.
>                  */
> -               ptr = core_state->dumper.next;
> +               ptr = core_state.dumper.next;
>                 while (ptr != NULL) {
>                         wait_task_inactive(ptr->task, TASK_ANY);
>                         ptr = ptr->next;
> @@ -858,7 +859,7 @@ static bool coredump_sock_request(struct core_name *cn, struct coredump_params *
>         return coredump_sock_mark(cprm->file, COREDUMP_MARK_REQACK);
>  }
>
> -static bool coredump_socket(struct core_name *cn, struct coredump_params *cprm)
> +static noinline_for_stack bool coredump_socket(struct core_name *cn, struct coredump_params *cprm)
>  {
>         if (!coredump_sock_connect(cn, cprm))
>                 return false;
> @@ -1095,7 +1096,6 @@ void vfs_coredump(const kernel_siginfo_t *siginfo)
>  {
>         struct cred *cred __free(put_cred) = NULL;
>         size_t *argv __free(kfree) = NULL;
> -       struct core_state core_state;
>         struct core_name cn;
>         struct mm_struct *mm = current->mm;
>         struct linux_binfmt *binfmt = mm->binfmt;
> @@ -1131,7 +1131,7 @@ void vfs_coredump(const kernel_siginfo_t *siginfo)
>         if (coredump_force_suid_safe(&cprm))
>                 cred->fsuid = GLOBAL_ROOT_UID;
>
> -       if (coredump_wait(siginfo->si_signo, &core_state) < 0)
> +       if (coredump_wait(siginfo->si_signo) < 0)
>                 return;
>
>         old_cred = override_creds(cred);
> --
> 2.39.5
>
