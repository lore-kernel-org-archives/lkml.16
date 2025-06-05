Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BA527F165
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 21:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749159621; cv=none; b=utEerzdw4Jq5v9yuM8V8le4u9RJBLgiettMqb1TbFYtK2XNna8eqAIz/h1b5M8hfhVk5JWQE/2NT2OqaQ7UkNeJbvM0ikBDoUdrVTkeETq4dWUFT1N7iWn0ED4I1a12999l42STYcOqxG44+zqvuX6AxVDVwL+DYrFMawdCGMsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749159621; c=relaxed/simple;
	bh=owrTpob8Z3VilSx0/gmgUp1e46LRN3HBsxPE3/o5G6s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qe8NIFHZQ76OBty+rzndqlWLY24ueoc+7S0zMVlH+Gv2Rlh1hQSjzBgpX3BQLn67OHDRcERcQb8bd13vBaCE0A7LXSc1JhodI5lHX9+CbHq5pq/9Xre/CfZB9K/BYLAYUSZj9b2deZy44+0fk3HaFRzmS16q6KzGiLxGD+tFPJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=IuXURwNx; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="IuXURwNx"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e819aa98db9so729159276.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 14:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1749159617; x=1749764417; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yiGFe0gms5Y7vXFNBwmlK7Nf7zyHEzhHaHnVsxs9CbY=;
        b=IuXURwNxIrnWOqUZ9sEpemZZlfxmRJhl0gOPEcfhNi/MwOqL/nUbuit38StphM+GIX
         hugZIKs7KZ0RtLYfCmShISEwue9SDjGsqrL+xnqcuWEV6e/8XoIqLlaq9lzYJOpN490P
         H5gxSAnTVHvi6XUhUCO50od0foj1uKTmX14SQtbCA5MKA6pN0BsBwhgbosnxsrIVXpK5
         p08NRHRHMZynjIGJVQN8WV79FWD2lkIcvJa4EV27B+ktqAJZfQP0JWGeTz0kC5RKKL5s
         tgGek5VF8hInimgY6QFZRAJzQSI1/JxNdYBRxCb/f4nftEt5cQn09gYlvWK39BDL4R6t
         o+IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749159617; x=1749764417;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yiGFe0gms5Y7vXFNBwmlK7Nf7zyHEzhHaHnVsxs9CbY=;
        b=UoR/wrFkNYc6GkWh3jDUSVvOVKI6TrxVGq2SOkEJCIU8MO2lV+4eDhCYr04gbgVP/k
         ma8+jcK0TM9dAgBnW+3tOtYDZUYjuJMYR4TuToU9YLOywNM59Dw+g+Keqb/btymPkXYF
         NfL+rHxB4w29/arKnXYGSEHWRXL7PbWc6CJlrV8CpgmRzXZvtKXcA5AgylyeHvZYHPEG
         SMa6keszEoh4sub8mHUVQ+N7FwhLeu86vBRQN4ZHwvm8jFAzSAPj5ToLHREXW0gvqpGU
         OdaQbzfIigMry2BC9569IJPWitmSci/K+DMYry/9LT1B7qwLt7Zq5YOU8Gcjprgfp/S5
         4ABg==
X-Forwarded-Encrypted: i=1; AJvYcCUMdwcNrmScOk/fX8aYRTRMdxYMNToZJqqK5fm7KulnPU41c055W7hRgj6KNoDwWhk2u1PPbw57Qwqp5p0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc50I0MTGNwWjADkxPzdNEG++WVJOtvIdc1m5aP77x0Fzp50LV
	P5NmOnA/2Ap48JmvoP+t1jDSxPQl/s8/2c7JrvhL1Ta4/bhC10nFxUAH7SAz0P20KVKEaAxFLOs
	J3USS3jVa8YYmuzvf1LJKhYGtdgYvamPoPjG1C6QA
X-Gm-Gg: ASbGncvxkQgSSbO8SBnbArvL+Nennb1MGlG4Y945xZZ+AB4Z+l0nB5u1Q60kqwx/ke6
	Qh7wkm0D3tG+UeO8wAHwcsCsANYpbgjWCxSAiCoVdOY2RhNRJdviv1rSb04yw5jJedPbLTBZQan
	enkXh+BDOfbZDKUTiYitXn8bbX/6wuts+fX5KnESbv42k=
X-Google-Smtp-Source: AGHT+IGTeby9Zg/JuU6w1mykeF0rzMEB/yxOlEg0U/HDEnInZhQM1QBBvHoRi8EzOT3QP4pmXeIss0vQyHFHUSPEmnM=
X-Received: by 2002:a05:6902:70b:b0:e7d:a3bc:22fd with SMTP id
 3f1490d57ef6-e81a232544bmr1970836276.39.1749159617415; Thu, 05 Jun 2025
 14:40:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605164852.2016-1-stephen.smalley.work@gmail.com>
In-Reply-To: <20250605164852.2016-1-stephen.smalley.work@gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 5 Jun 2025 17:40:06 -0400
X-Gm-Features: AX0GCFvLs9Ehag9allmkViAyOyTZUnzE1Hp0rLlPcQr3EgCFF2MrKf7Z5oBdrT4
Message-ID: <CAHC9VhQ-f-n+0g29MpBB3_om-e=vDqSC3h+Vn_XzpK2zpqamdQ@mail.gmail.com>
Subject: Re: [PATCH] fs/xattr.c: fix simple_xattr_list()
To: Stephen Smalley <stephen.smalley.work@gmail.com>
Cc: brauner@kernel.org, linux-fsdevel@vger.kerne.org, 
	linux-kernel@vger.kernel.org, selinux@vger.kernel.org, collin.funk1@gmail.com, 
	eggert@cs.ucla.edu, bug-gnulib@gnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 5, 2025 at 12:49=E2=80=AFPM Stephen Smalley
<stephen.smalley.work@gmail.com> wrote:
>
> commit 8b0ba61df5a1 ("fs/xattr.c: fix simple_xattr_list to always
> include security.* xattrs") failed to reset err after the call to
> security_inode_listsecurity(), which returns the length of the
> returned xattr name. This results in simple_xattr_list() incorrectly
> returning this length even if a POSIX acl is also set on the inode.
>
> Reported-by: Collin Funk <collin.funk1@gmail.com>
> Closes: https://lore.kernel.org/selinux/8734ceal7q.fsf@gmail.com/
> Reported-by: Paul Eggert <eggert@cs.ucla.edu>
> Closes: https://bugzilla.redhat.com/show_bug.cgi?id=3D2369561
> Fixes: 8b0ba61df5a1 ("fs/xattr.c: fix simple_xattr_list to always include=
 security.* xattrs")
>
> Signed-off-by: Stephen Smalley <stephen.smalley.work@gmail.com>
> ---
>  fs/xattr.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Paul Moore <paul@paul-moore.com>

> diff --git a/fs/xattr.c b/fs/xattr.c
> index 8ec5b0204bfd..600ae97969cf 100644
> --- a/fs/xattr.c
> +++ b/fs/xattr.c
> @@ -1479,6 +1479,7 @@ ssize_t simple_xattr_list(struct inode *inode, stru=
ct simple_xattrs *xattrs,
>                 buffer +=3D err;
>         }
>         remaining_size -=3D err;
> +       err =3D 0;
>
>         read_lock(&xattrs->lock);
>         for (rbp =3D rb_first(&xattrs->rb_root); rbp; rbp =3D rb_next(rbp=
)) {
> --
> 2.49.0

--=20
paul-moore.com
