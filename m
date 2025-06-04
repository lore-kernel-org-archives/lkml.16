Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059C743146
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 00:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748998371; cv=none; b=BRhfR5lpcZiLBhdGh8L+MZYwSqyqh+8WJx2uLIrXTB5YKw2STosukuIzw9S9ee0mwPwM9iGNxqa8HkWFMff0j1Jjfht39iGqBE7rjFs/cANm3Xv1RtHYUpLGV/+dBCxNsYVrRCvMMpZVfpK4lUCmyVzrEbtZTB9icHuGAgAswS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748998371; c=relaxed/simple;
	bh=F0st5f8BGZF7VgFHpGDlSW0JMjLRX3xuISS/+/7ND4o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BCrvV8NXycpVpnit4mWqCaJxpsgSKWCMrVyLmlD8bSCQgQn8Q4ji398ACqcgCDujhxdf3N1WbdJqhCVtn8Z2eeL/K2IxMZgJoB/ndPKhs9JsnKN3Waxq/F/Pb98KOQuKeA+Xt6KOGPtngHx3mYK8ZOoO2iD1JN0EBiBsB4sjaCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=fail smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wfSIAwF+; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wfSIAwF+"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e7d9d480e6cso4653029276.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 17:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748998369; x=1749603169; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ufdJ7zCVJhXmyO6Hnb5W+3LfKFzQXrWMg7EkU2xzrdU=;
        b=wfSIAwF+BMvXYtfsp8hZtKfKHkLux3CS0REoV8+HS+nHVCnREWqPL8KJytnOgsk86D
         daupgunig/dGF0v7ZSI2uhxC9q2S8XDAM1BpqNLVUf3k9Dvr0LDwF6wJGgjtqkYNr3qj
         JN7eVTQtFprz9kLbdSKPsVJLGKGyIu7O4HkbplNLMdQfJ+Q3GNf4Im7QyMl4Rxsj5M/g
         P8ODgEFRMLuEvlfAdgMhkwyM9JXWSCqT1ieXqKG6UVLklyXG3F8D7qASba4cV36vPQUG
         fR3pzL1YEaTyZ5O4C9Q0qUM7MB/4PAYn29ZG0/5ZJl6RoLEJJ/W3lVnFXNcL+DvHAYu7
         A7Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748998369; x=1749603169;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ufdJ7zCVJhXmyO6Hnb5W+3LfKFzQXrWMg7EkU2xzrdU=;
        b=BNMpr9Fqdcx+EtlCXf4wargLfyS+9aeqVK972guGPQ0REyFIfXasLzNNHBoKBkfCzh
         HAxRjBgCJv+Klirl7hq/qGk7a304LVTsbK6lY91aUf6L43PHkhuls6oHtPDenBHb10+x
         mWdap2BPXse2PWBt5VnxyAKV5Q/EDCHWmCmDWB9BUreCC67mulK7+jYAhx83PngI0OfT
         iwudEGszPvF9OYq7xZUijXIsATiMp4D8g+zcAlBHmSWlbLAikKR6wFNHqX9qFotejkaQ
         oM6plIXC+dpOw8L7Z1TNHtqHMZg9CXGYSN1IL+I2vGUJKYLRG4oiRY7GklBafxANke6u
         gMoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUYqqHM1tpFO1KGRdfWO5rsr+PueTqLR1NpIgRPn5FQ0P3+J6hJhVJJT4hyBD6xCQ+JORBLbDZhUenMQw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyS02KLgMEuG9gPa66KshaVgaQMfcfisk9yqBsDHVa8niJ/mxko
	oKbncR2UsX+QpcxBjYHpQX+RNjMWtZjoHuVBVmdB6ei7t7gfAlWlF6wYanSNK5XNnpE7EXRIXs0
	DuEImdf6mrpMZmluXixjrjy/OaPU7SoW390Ia0LtS
X-Gm-Gg: ASbGnct1yMQKj9xqcDlkOFaI+012rlcXwlvDPtI62rZid5icTy0DbHe+T6th98hrHF3
	BEtGrd6hcPokJOPjP/JEG5Em3JHg6VHh9CU+qc49Pjhx0u4a0r3xDdZ75jgZddDJVP/kWR0j6j1
	s1WdvfvnMSGNTvnOLztbXlD2JuccGYdcVmmPgHtdJUkpoOwLsvsSmXSeJhRGNfoNzyoWEfpLHFz
	w==
X-Google-Smtp-Source: AGHT+IEnDQtfQo5x5DIJYs2UH2zoxENxePjxDZ00t7iisvDN9qp9tZqmkNYduYRzTjcj7MnmSchmbiJHQmlMkZYa+Go=
X-Received: by 2002:a05:6902:18d0:b0:e7d:c87a:6249 with SMTP id
 3f1490d57ef6-e8179dbababmr1390646276.36.1748998368683; Tue, 03 Jun 2025
 17:52:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250603-uffd-fixes-v1-0-9c638c73f047@columbia.edu> <20250603-uffd-fixes-v1-2-9c638c73f047@columbia.edu>
In-Reply-To: <20250603-uffd-fixes-v1-2-9c638c73f047@columbia.edu>
From: James Houghton <jthoughton@google.com>
Date: Tue, 3 Jun 2025 17:52:12 -0700
X-Gm-Features: AX0GCFvhX97qdJoaP_U5MjbCXqe-defL5vJZdiAvYUJ8X717AX3GBN57TvbH-7A
Message-ID: <CADrL8HWM9zmJY=paJjWYPZkw5gYXHMH7MmEMhzHoMpcETEJiUg@mail.gmail.com>
Subject: Re: [PATCH 2/3] userfaultfd: prevent unregistering VMAs through a
 different userfaultfd
To: Tal Zussman <tz2294@columbia.edu>
Cc: Andrew Morton <akpm@linux-foundation.org>, Peter Xu <peterx@redhat.com>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, David Hildenbrand <david@redhat.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Pavel Emelyanov <xemul@parallels.com>, Andrea Arcangeli <aarcange@redhat.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 3, 2025 at 3:15=E2=80=AFPM Tal Zussman <tz2294@columbia.edu> wr=
ote:
>
> Currently, a VMA registered with a uffd can be unregistered through a
> different uffd asssociated with the same mm_struct.
>
> Change this behavior to be stricter by requiring VMAs to be unregistered
> through the same uffd they were registered with.
>
> While at it, correct the comment for the no userfaultfd case. This seems
> to be a copy-paste artifact from the analagous userfaultfd_register()
> check.
>
> Fixes: 86039bd3b4e6 ("userfaultfd: add new syscall to provide memory exte=
rnalization")
> Signed-off-by: Tal Zussman <tz2294@columbia.edu>

Thanks, Tal! I like this patch, but I can't really meaningfully
comment on if it's worth it to change the UAPI.

> ---
>  fs/userfaultfd.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/fs/userfaultfd.c b/fs/userfaultfd.c
> index 22f4bf956ba1..9289e30b24c4 100644
> --- a/fs/userfaultfd.c
> +++ b/fs/userfaultfd.c
> @@ -1477,6 +1477,16 @@ static int userfaultfd_unregister(struct userfault=
fd_ctx *ctx,
>                 if (!vma_can_userfault(cur, cur->vm_flags, wp_async))
>                         goto out_unlock;
>
> +               /*
> +                * Check that this vma isn't already owned by a different
> +                * userfaultfd. This provides for more strict behavior by
> +                * preventing a VMA registered with a userfaultfd from be=
ing
> +                * unregistered through a different userfaultfd.
> +                */
> +               if (cur->vm_userfaultfd_ctx.ctx &&
> +                   cur->vm_userfaultfd_ctx.ctx !=3D ctx)
> +                       goto out_unlock;
> +

Very minor nitpick: I think this check should go above the
!vma_can_userfault() check above, as `wp_async` was derived from
`ctx`, not `cur->vm_userfaultfd_ctx.ctx`.

>                 found =3D true;
>         } for_each_vma_range(vmi, cur, end);

I don't really like this for_each_vma_range() for loop, but I guess it
is meaningful to the user: invalid unregistration attempts will fail
quickly instead of potentially making some progress. So unfortunately,
without a good reason, I suppose we can't get rid of it. :(

>         BUG_ON(!found);
> @@ -1491,10 +1501,11 @@ static int userfaultfd_unregister(struct userfaul=
tfd_ctx *ctx,
>                 cond_resched();
>
>                 BUG_ON(!vma_can_userfault(vma, vma->vm_flags, wp_async));
> +               BUG_ON(vma->vm_userfaultfd_ctx.ctx &&
> +                      vma->vm_userfaultfd_ctx.ctx !=3D ctx);

IMO, this new BUG_ON should either be
(1) moved and should not be a BUG_ON. See the WARN_ON_ONCE() below,
OR
(2) removed.

Perhaps the older BUG_ON() should be removed/changed too.

>
>                 /*
> -                * Nothing to do: this vma is already registered into thi=
s
> -                * userfaultfd and with the right tracking mode too.
> +                * Nothing to do: this vma is not registered with userfau=
ltfd.
>                  */
>                 if (!vma->vm_userfaultfd_ctx.ctx)
>                         goto skip;

if (WARN_ON_ONCE(vmx->vm_userfaultfd_ctx.ctx !=3D ctx)) {
    ret =3D -EINVAL;
    break;
}

where the WARN_ON_ONCE() indicates that the VMA should have been
filtered out earlier. The WARN_ON_ONCE() isn't even really necessary.


>
> --
> 2.39.5
>
>
