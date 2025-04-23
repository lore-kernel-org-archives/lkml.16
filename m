Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5002E149E17
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 14:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745419219; cv=none; b=oV3gTGHKqcg4K/ClhYOyZwJ4aENTck2+oo17LmPLIyY4atuiO2CjeeAeEcSJKwTtbIEbRsJCVnbt6j/nptEwFZs2t9RfLM/7lmdkb9yoHgX5+Ykr6Qrf5rNLUxB9hH0v0vKj6KdjET5arAaFd7jr6pvaERjjhwPqtcnYLWHbUbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745419219; c=relaxed/simple;
	bh=Rmlfd/rSuvwlCl5x6LrGt0gYUPlUJFi8+DdXTz476Q0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mHhxUOY8wVBiqVZZgGvvMkbb0IjLH0LT5eRrxQN0QUwB2boBx/KJuf4FKcbDdEV1+yswhI38lISIQiIUAkzozu5Sm8SAa+lolJkPGJYNL/YzenBG0kGqnBWkE/JcMegn9xiKub50ZintlakNwiwyFP7TmN9nXBoZTlDwVFV7rfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SKbigtDp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SKbigtDp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745419216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JkJug5w1edMe5yo1kpcyV9QLxwL/8dhEAUtpaAiUDeE=;
	b=SKbigtDpvt1Od83O+JZDZ1+AFcSbsHw1h4qwVNYP761/o39oKFkJyGanrbakmHmg1o6RX5
	2a370p7uI3G6DKXl9W8Jf2wn6hoLakbdY/q9yaBKWvBX4lph93vfJb8dHBvfKYuSZJ4YpV
	R7T0Xf5lBPZWagNOYXlcShFSY46ZuXM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-689-q36uHdKJNgSBC81tkYOdfQ-1; Wed, 23 Apr 2025 10:40:14 -0400
X-MC-Unique: q36uHdKJNgSBC81tkYOdfQ-1
X-Mimecast-MFC-AGG-ID: q36uHdKJNgSBC81tkYOdfQ_1745419213
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-acb66d17be4so429436266b.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 07:40:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745419213; x=1746024013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JkJug5w1edMe5yo1kpcyV9QLxwL/8dhEAUtpaAiUDeE=;
        b=escBGUnuEN24YiDOI5tY7yh9wCwlNrhv3OqGQdKNV6vjC3KwqNceB6MZnnVCBM7Pk8
         rbncA12WkWrm/iREhF+kHNLDjziC/boKJqfSEbzamh4FOqT/kybfRKySWY4N+ma4XyDU
         2wyDliuOOr7u0bA8vLrlaB1+2scAl3H8+6uH3Bemt+Y4dhji2jjHgXumeo4M5g87Omvv
         sS7TdyhqQwgo5B0YRwmO4EgwZrvqMNG5sGtjvCJnY6a9rmXzpmaWh87lVbO5JbUtNj1F
         LQFb2sAmWANw5sWOn2De6/W1yRgIT/hEuw7LhfXzUB/HJJzAYGXFcAj91KkC1ZC/T/Gt
         siEA==
X-Forwarded-Encrypted: i=1; AJvYcCXEtjTlRLfcD1lu6dwMr3ys35C6iN6yxHXjQXulpnusS8C/4PZ5cbfGLqf8SruwlC5JNiFbo4Kin5YPKCw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1sNmqTAwHmPWSECyClcqwUmOfdBBZHC1gRqVvH8fTdGjJkLXx
	FzLThRqGg3w14EAJOgF5t5iGmWkJA6Zwb5fB+DVTatqlKeaPZ0MdKDUDqHlR2UgP5xjVFkbH/5U
	srllfitpot37BcI1hmClqC2mYTmliyS9C7rnBzIZS6GQ776xD7FEwfduOzDRmUyrsz4DzFw888h
	f+t25axXspXWXDJgZW5pODqSSf3RI0R4GHh3AH
X-Gm-Gg: ASbGncsSqsuuLnN3i1+B3W46f0pHbOahqyc+g9wEtb4Iy5m4MgG2FCONIm2c93HmZch
	GKbpmZbqnaGOO3VVGqLZu/vfqP+0PB2LVrTSmyM9kjErzKVtCu8WVO6OrA+oiuqWxL2FWbw==
X-Received: by 2002:a17:907:c16:b0:ac2:9683:ad25 with SMTP id a640c23a62f3a-acb74b8ceb3mr1581377566b.34.1745419213224;
        Wed, 23 Apr 2025 07:40:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOejD5veWR6WGbbaeBjKvwZuxwQAGUxN7gY9/CIk2gXG+SuUIdiohcgVWDUliNqfKREDs/epDddZaSp+5t7Ew=
X-Received: by 2002:a17:907:c16:b0:ac2:9683:ad25 with SMTP id
 a640c23a62f3a-acb74b8ceb3mr1581374866b.34.1745419212746; Wed, 23 Apr 2025
 07:40:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423132250.1821518-1-max.kellermann@ionos.com>
In-Reply-To: <20250423132250.1821518-1-max.kellermann@ionos.com>
From: David Wysochanski <dwysocha@redhat.com>
Date: Wed, 23 Apr 2025 10:39:36 -0400
X-Gm-Features: ATxdqUFpiVavU7EZ3mWDQwA1ebMhcqjNgaQjiGo8g9QsoQ9FqiRsLXlzm93jeW0
Message-ID: <CALF+zOmH0fCwsLgWxOLh+Zpak9dZO5Z0D1WozTWjMMOjsyhbBQ@mail.gmail.com>
Subject: Re: [PATCH] fs/nfs/read: fix double-unlock bug in nfs_return_empty_folio()
To: Max Kellermann <max.kellermann@ionos.com>
Cc: linux-nfs@vger.kernel.org, trondmy@kernel.org, anna@kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 9:23=E2=80=AFAM Max Kellermann <max.kellermann@iono=
s.com> wrote:
>
> Sometimes, when a file was read while it was being truncated by
> another NFS client, the kernel could deadlock because folio_unlock()
> was called twice, and the second call would XOR back the `PG_locked`
> flag.
>
> Most of the time (depending on the timing of the truncation), nobody
> notices the problem because folio_unlock() gets called three times,
> which flips `PG_locked` back off:
>
>  1. vfs_read, nfs_read_folio, ... nfs_read_add_folio,
>     nfs_return_empty_folio
>  2. vfs_read, nfs_read_folio, ... netfs_read_collection,
>     netfs_unlock_abandoned_read_pages
>  3. vfs_read, ... nfs_do_read_folio, nfs_read_add_folio,
>     nfs_return_empty_folio
>
> The problem is that nfs_read_add_folio() is not supposed to unlock the
> folio if fscache is enabled, and a nfs_netfs_folio_unlock() check is
> missing in nfs_return_empty_folio().
>
> Rarely this leads to a warning in netfs_read_collection():
>
>  ------------[ cut here ]------------
>  R=3D0000031c: folio 10 is not locked
>  WARNING: CPU: 0 PID: 29 at fs/netfs/read_collect.c:133 netfs_read_collec=
tion+0x7c0/0xf00
>  [...]
>  Workqueue: events_unbound netfs_read_collection_worker
>  RIP: 0010:netfs_read_collection+0x7c0/0xf00
>  [...]
>  Call Trace:
>   <TASK>
>   netfs_read_collection_worker+0x67/0x80
>   process_one_work+0x12e/0x2c0
>   worker_thread+0x295/0x3a0
>
> Most of the time, however, processes just get stuck forever in
> folio_wait_bit_common(), waiting for `PG_locked` to disappear, which
> never happens because nobody is really holding the folio lock.
>
> Fixes: 000dbe0bec05 ("NFS: Convert buffered read paths to use netfs when =
fscache is enabled")
> Cc: stable@vger.kernel.org
> Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
> ---
>  fs/nfs/read.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/fs/nfs/read.c b/fs/nfs/read.c
> index 81bd1b9aba17..3c1fa320b3f1 100644
> --- a/fs/nfs/read.c
> +++ b/fs/nfs/read.c
> @@ -56,7 +56,8 @@ static int nfs_return_empty_folio(struct folio *folio)
>  {
>         folio_zero_segment(folio, 0, folio_size(folio));
>         folio_mark_uptodate(folio);
> -       folio_unlock(folio);
> +       if (nfs_netfs_folio_unlock(folio))
> +               folio_unlock(folio);
>         return 0;
>  }
>
> --
> 2.47.2
>

LGTM
Thanks for tracking this down, Max.

Reviewed-by: Dave Wysochanski <dwysocha@redhat.com>

