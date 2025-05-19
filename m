Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3C02741DF
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747649730; cv=none; b=L85jnNBAtsPel7Ftm3tj2Sh7UBWjiFsNJ7UEr4MQdrazZih5+uAaRxLCGq8bdE4p/kgyaKjeOhQxZa9H8AvX1707gQ8vZYqQjFOeXxY8IjQr9NBJ/hsrffp3yZT9B//6JpTdFRTTup73eUYZPniTOYx6fPWTXUG0qYP9PYy8ekw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747649730; c=relaxed/simple;
	bh=t2/fKhQwlLxBOrTHI6XMMF0jkkRQ4qJ2TF9uKD6hKSQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=bVZBUrdci2KltLa/RhpvTTcNu+jCzOpZcjkGn4geO8RD/2BBfU91g8wqmro8f/2GCSAlmjhcnvZ75mOF0qz7GfM7CMxe/CHMtYoebTNuWKRXdRrGGf+pdmZ87GBjGOZtOR8xEzVPf444AfJ+Gy0YEaZBBguZbPZN3arHDhW/M94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=f5QEXu00; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="f5QEXu00"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ad5297704aaso632700866b.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 03:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1747649725; x=1748254525; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H8Pm/OPQZPnSJzvrFPS62tYBR4nzvc5QqMIJv/6pDWI=;
        b=f5QEXu00/l3mNV/SUjuU1h/PoKnEUYhDAGNF9DeYGvFj2CNG/FW0nzuY5WQf0ckET/
         9+RyfTdpfAFObEO9mCjF0m2lEE+9NIYqw8EvzSZ6OTyH7NsgifnjRC8BUf5u2Dh7A1Go
         8fqBTmnv9qVItn+KNS7FXJjZ2QoYP/2ruWRoDd69tsoKWPBR8u/KbHSa0JWhuOo34CBw
         r8OFgPsh67JqYKhMwZj/lCBy2/u2P+raQQvdDk5VQo7XH5heLCABx78BlQUQT3xRZxtA
         aSVyk9+pXSuorKIJVwYkTeBy5jMgcDQudgBxj8fF2f4dJ9NBJKdFGphnC5soTzBMPxUV
         ZQGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747649725; x=1748254525;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H8Pm/OPQZPnSJzvrFPS62tYBR4nzvc5QqMIJv/6pDWI=;
        b=coduWeTlYpO9AMrho4fYcEyIKwwX/s8Pp2gaFd/z6Jkv0IpE5zkkA2HuT7Y4BAb5TD
         vXx2uVzqsr/X/gH89bzyCJzdD4n+0bim9eh2XTWC+FkoV5gHaX5rmUFmiGQZBbsGYQ16
         E3+5LbNaHs8FtrOldVLUKwGPWt1KcZf3BdhEVIG566UvR5XO55ib4B1wPzwSWYjWAl8X
         gUjA0f5ycInEYjuEu+AiSLc3zhKrv85nHycqd30DvNySZa6lIxd3ME4bA7IHV5GRLPRA
         OJ4MX7se06d8GxjhZu93t0w60Q82L0qX3CFH8aCEW/l9szwGSuC4cxYLloR14U51TMCw
         ShVA==
X-Forwarded-Encrypted: i=1; AJvYcCUDLN2w88FBB7Ma+UkVUX9X68N3v9LCBg3mTGSDrM9iQpEPRukhK4dM/u3EvFFs4/ac9NHC0KW7h00w3LM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx11kiNNiET4ZuArPyHG+pn5tBZVarXvf40WGTKBNdZHfvkuQZv
	mteKwvmJS9oZ9h5jncL3lC4YUQNEExVvbNAqH5QmbNzK+dGPF/5qepPzY5lzoFzPvkOO/mg7kdE
	rv5mdxUSIFHTc+dYXu5pa7nMsQJWopvjCmhtPU82zNw==
X-Gm-Gg: ASbGncs8EYMoBf+a/1tzRM/YT+Arg1kwlsF2eKPxCbBTbD7c3oQBk1jO+h+YwHl2Il+
	Vx1vR0U6sC7oXFgEJJSknD0dLwAjHGAoxhJ1r7fNga7/Z1sZt+ud5i01aUK+C+jysNPDI6ArAgc
	T1LJzHcIx0X5zDazWYTcaSy9bulgBxZfogjTT4kdH21w4dwm3wEudeDhf3AcvzrA==
X-Google-Smtp-Source: AGHT+IEBxoy70OLus6nLzIrd0jFiVYq2bn4bWSvgAaRhTp7gQlMAwgpB3doYR0OSFM1kgTYn1jpA4h1GHZFfXc5spX4=
X-Received: by 2002:a17:907:7d89:b0:ad4:5346:2fec with SMTP id
 a640c23a62f3a-ad52d6307f4mr1096445666b.61.1747649724970; Mon, 19 May 2025
 03:15:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241206165014.165614-1-max.kellermann@ionos.com>
In-Reply-To: <20241206165014.165614-1-max.kellermann@ionos.com>
From: Max Kellermann <max.kellermann@ionos.com>
Date: Mon, 19 May 2025 12:15:14 +0200
X-Gm-Features: AX0GCFtKZEpAY6CHKkFI2TZqbc-QDLmrBaRMzVTuM8EfqZVQmVG6kb0DruUucDo
Message-ID: <CAKPOu+8eQfqJ9tVz-DzDzqKPEtQVCooxtxe1+OZanu5gi3oQzQ@mail.gmail.com>
Subject: Re: [PATCH] fs/ceph/io: make ceph_start_io_*() killable
To: xiubli@redhat.com, idryomov@gmail.com, amarkuze@redhat.com, 
	ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

What happened to this patch submission? Similar patches were accepted
in NFS and VFS core.

On Fri, Dec 6, 2024 at 5:50=E2=80=AFPM Max Kellermann <max.kellermann@ionos=
.com> wrote:
>
> This allows killing processes that wait for a lock when one process is
> stuck waiting for the Ceph server.  This is similar to the NFS commit
> 38a125b31504 ("fs/nfs/io: make nfs_start_io_*() killable").
>
> Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
> ---
>  fs/ceph/file.c | 22 +++++++++++++---------
>  fs/ceph/io.c   | 44 +++++++++++++++++++++++++++++++++-----------
>  fs/ceph/io.h   |  8 +++++---
>  3 files changed, 51 insertions(+), 23 deletions(-)
>
> diff --git a/fs/ceph/file.c b/fs/ceph/file.c
> index 4b8d59ebda00..d79c0774dc6e 100644
> --- a/fs/ceph/file.c
> +++ b/fs/ceph/file.c
> @@ -2127,10 +2127,11 @@ static ssize_t ceph_read_iter(struct kiocb *iocb,=
 struct iov_iter *to)
>         if (ceph_inode_is_shutdown(inode))
>                 return -ESTALE;
>
> -       if (direct_lock)
> -               ceph_start_io_direct(inode);
> -       else
> -               ceph_start_io_read(inode);
> +       ret =3D direct_lock
> +               ? ceph_start_io_direct(inode)
> +               : ceph_start_io_read(inode);
> +       if (ret)
> +               return ret;
>
>         if (!(fi->flags & CEPH_F_SYNC) && !direct_lock)
>                 want |=3D CEPH_CAP_FILE_CACHE;
> @@ -2283,7 +2284,9 @@ static ssize_t ceph_splice_read(struct file *in, lo=
ff_t *ppos,
>             (fi->flags & CEPH_F_SYNC))
>                 return copy_splice_read(in, ppos, pipe, len, flags);
>
> -       ceph_start_io_read(inode);
> +       ret =3D ceph_start_io_read(inode);
> +       if (ret)
> +               return ret;
>
>         want =3D CEPH_CAP_FILE_CACHE;
>         if (fi->fmode & CEPH_FILE_MODE_LAZY)
> @@ -2362,10 +2365,11 @@ static ssize_t ceph_write_iter(struct kiocb *iocb=
, struct iov_iter *from)
>                 direct_lock =3D true;
>
>  retry_snap:
> -       if (direct_lock)
> -               ceph_start_io_direct(inode);
> -       else
> -               ceph_start_io_write(inode);
> +       err =3D direct_lock
> +               ? ceph_start_io_direct(inode)
> +               : ceph_start_io_write(inode);
> +       if (err)
> +               goto out_unlocked;
>
>         if (iocb->ki_flags & IOCB_APPEND) {
>                 err =3D ceph_do_getattr(inode, CEPH_STAT_CAP_SIZE, false)=
;
> diff --git a/fs/ceph/io.c b/fs/ceph/io.c
> index c456509b31c3..2735503bc479 100644
> --- a/fs/ceph/io.c
> +++ b/fs/ceph/io.c
> @@ -47,20 +47,30 @@ static void ceph_block_o_direct(struct ceph_inode_inf=
o *ci, struct inode *inode)
>   * Note that buffered writes and truncates both take a write lock on
>   * inode->i_rwsem, meaning that those are serialised w.r.t. the reads.
>   */
> -void
> +int
>  ceph_start_io_read(struct inode *inode)
>  {
>         struct ceph_inode_info *ci =3D ceph_inode(inode);
> +       int err;
>
>         /* Be an optimist! */
> -       down_read(&inode->i_rwsem);
> +       err =3D down_read_killable(&inode->i_rwsem);
> +       if (err)
> +               return err;
> +
>         if (!(READ_ONCE(ci->i_ceph_flags) & CEPH_I_ODIRECT))
> -               return;
> +               return 0;
>         up_read(&inode->i_rwsem);
> +
>         /* Slow path.... */
> -       down_write(&inode->i_rwsem);
> +       err =3D down_write_killable(&inode->i_rwsem);
> +       if (err)
> +               return err;
> +
>         ceph_block_o_direct(ci, inode);
>         downgrade_write(&inode->i_rwsem);
> +
> +       return 0;
>  }
>
>  /**
> @@ -83,11 +93,13 @@ ceph_end_io_read(struct inode *inode)
>   * Declare that a buffered write operation is about to start, and ensure
>   * that we block all direct I/O.
>   */
> -void
> +int
>  ceph_start_io_write(struct inode *inode)
>  {
> -       down_write(&inode->i_rwsem);
> -       ceph_block_o_direct(ceph_inode(inode), inode);
> +       int err =3D down_write_killable(&inode->i_rwsem);
> +       if (!err)
> +               ceph_block_o_direct(ceph_inode(inode), inode);
> +       return err;
>  }
>
>  /**
> @@ -133,20 +145,30 @@ static void ceph_block_buffered(struct ceph_inode_i=
nfo *ci, struct inode *inode)
>   * Note that buffered writes and truncates both take a write lock on
>   * inode->i_rwsem, meaning that those are serialised w.r.t. O_DIRECT.
>   */
> -void
> +int
>  ceph_start_io_direct(struct inode *inode)
>  {
>         struct ceph_inode_info *ci =3D ceph_inode(inode);
> +       int err;
>
>         /* Be an optimist! */
> -       down_read(&inode->i_rwsem);
> +       err =3D down_read_killable(&inode->i_rwsem);
> +       if (err)
> +               return err;
> +
>         if (READ_ONCE(ci->i_ceph_flags) & CEPH_I_ODIRECT)
> -               return;
> +               return 0;
>         up_read(&inode->i_rwsem);
> +
>         /* Slow path.... */
> -       down_write(&inode->i_rwsem);
> +       err =3D down_write_killable(&inode->i_rwsem);
> +       if (err)
> +               return err;
> +
>         ceph_block_buffered(ci, inode);
>         downgrade_write(&inode->i_rwsem);
> +
> +       return 0;
>  }
>
>  /**
> diff --git a/fs/ceph/io.h b/fs/ceph/io.h
> index fa594cd77348..08d58253f533 100644
> --- a/fs/ceph/io.h
> +++ b/fs/ceph/io.h
> @@ -2,11 +2,13 @@
>  #ifndef _FS_CEPH_IO_H
>  #define _FS_CEPH_IO_H
>
> -void ceph_start_io_read(struct inode *inode);
> +#include <linux/compiler_attributes.h> // for __must_check
> +
> +__must_check int ceph_start_io_read(struct inode *inode);
>  void ceph_end_io_read(struct inode *inode);
> -void ceph_start_io_write(struct inode *inode);
> +__must_check int ceph_start_io_write(struct inode *inode);
>  void ceph_end_io_write(struct inode *inode);
> -void ceph_start_io_direct(struct inode *inode);
> +__must_check int ceph_start_io_direct(struct inode *inode);
>  void ceph_end_io_direct(struct inode *inode);
>
>  #endif /* FS_CEPH_IO_H */
> --
> 2.45.2
>
