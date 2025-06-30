Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A3D20103A
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 22:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751324202; cv=none; b=ryYe5+lDzk7g07CUWyTbgyoqkQ/r9BNQ/WjG/yF2jw8g3W+N4reB6qMbdsSjtd08CNNBG9LKYGH9jtygwjmBQLXaBgvXR9zqb10CuFf8SaOSVpFFgSxGycwlFbPE1zGEyoHP66auReDcA3CuVYKWDnxs3/gFCOkZ5OtljhyEJbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751324202; c=relaxed/simple;
	bh=/4SjED/6P5QMWfmvfhHEAO9Iq2kipcz5xfs91SBDivM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jxDigKz9QMw3fy7cBs96RAJ24G879y6/3uww6ATNrknx5FwFloSJFdELM1ZmJ4G8vn0HUazbVCbtyFbKNOgFCCJIgZ4ntdFF5NPa3HB9x9/hcEEYvhE7MwWg+z3xlqagMCptEAGSlwLLT2VLP+XpskYaJHsG6NxJQKghMVjcGFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EvGRD57w; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EvGRD57w"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6098ef283f0so4592a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 15:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751324199; x=1751928999; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M7R5ktcV401kDH/d+qwKCQlLBLAeHgEGNUeVhuIZukw=;
        b=EvGRD57w/ey53kIOFLWDBM0umU9fx04FdbKgmVsX9eCMBRLPdJMnfrwLI+lhGch9mF
         GIk3D5tVYg+Stt10azH50NhyseP1U7EwQeM/OjnZjEt0hx8+4FGUnNOrwhhCSibbHCZo
         ICLz/10eTMu2yE16AKC2KPMO9Ul33+zNNHUmpbU6bGfZpTnCbAV52vpXksOlxBoT4+zh
         St6DlYxRuBTTTjKAFvPKn4JPj5K85/rAfXqoLV99T//deR8CAxDJKklmbBvEd1OhE5EQ
         5EEkqF3N2Obf3Q4830JGn178f532/QisLmBrSQWKQ7F3Z6y+jP3e3FUgiNp0vXrxqkR/
         ejnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751324199; x=1751928999;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M7R5ktcV401kDH/d+qwKCQlLBLAeHgEGNUeVhuIZukw=;
        b=d0mvwjebqeR8O0+2nP0VmU/deh/dHol3OWjFCjsZRF9jj9VQIoJy6hSuwuDbq/aJhN
         PPFiur5eq1gKk7MsqwuJCIVBRVhEjdG9WuwAsL+MuajrckIiUgOkEB15pVfineWZ6M5I
         7kzUDsS22ROAt2MhciQpto203goHnmmLRIyHp58X+MmGBBdJFZnfzeRRofERVZdR7mDq
         uphP3dIQlYeQhJOh3JilOU5QJQyxhBnpKV7F8k3zpPVNT1TCoJT6LenvFsFsy36tIWhn
         IAM+H0w9D5lUQfZ5XbNcoS7+j+V8gwFNHkwUVlp64bEEUIaErDNb+rDJCnNpQq8ikIxl
         M8GQ==
X-Forwarded-Encrypted: i=1; AJvYcCWB/DTEyjrMnYdTanYDO9tNMGuBY4GA/NjLhchIUlGAic5r6qAyWkJVaWkGZALKjGdfMhL7toAjOX8pNEk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmVlQRU62yjmpTtvlgAaBm7MgEvpc9npdX0c70FTor0oLIga6C
	4CKSGCeKc+RfuA2kG3Pqhfy75yMjxqKLhqHAMKFwFcw6URRb+LwbC00SSkOGVsxkvYfu0NSDyMf
	KfX0lYR5mgnln6Fml1A1w07j2eUtf5+JIymy6k2YTh5wbT6KVQpGkhkjlvMg=
X-Gm-Gg: ASbGncukbiC9I7DaB+3ydwMGnn37sVjFSSeRjXfMifbSWndDvNsWU6NK7q9kxCPKauP
	bPMq8sqmuIdG+b4mSHgX9ZeeZWkgfj3Exq4vCyXviOE04K76DIMoxafavQ/DpzwuIEm2eRrk5FF
	AmkOErfT2V5jzHPuIzGoH/nxX7YeFLbf+MVqqrBdXfB/M6fpSVRoFGzJSBkKmvKOpNbqxAAwL2F
	g==
X-Google-Smtp-Source: AGHT+IHN4Q5qVv7STN2zkQigTwd6ckNtyug0GjwCzMak6D3eFupekwm7Mzvsg61LwR7bzp8dNQGph0F51sdiQBVIGzM=
X-Received: by 2002:aa7:d887:0:b0:60b:9d04:2cec with SMTP id
 4fb4d7f45d1cf-60e38a923f8mr2580a12.5.1751324199107; Mon, 30 Jun 2025 15:56:39
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250615144235.1836469-1-chullee@google.com> <20250615144235.1836469-3-chullee@google.com>
 <c8389c1a-16d2-4de4-bc3f-7a5e4ccdbc34@kernel.org>
In-Reply-To: <c8389c1a-16d2-4de4-bc3f-7a5e4ccdbc34@kernel.org>
From: Daniel Lee <chullee@google.com>
Date: Mon, 30 Jun 2025 15:56:28 -0700
X-Gm-Features: Ac12FXxzXkzy0qePDKtuBAjgWeWGzgYc_s5Wj4IDCSbA2BAhcYaaMIv-ITP6RRU
Message-ID: <CALBjLoB6+FgWJMqKPN1o1bpeYWB-d-7BWtGbYPo18fcFWZqEkw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] f2fs: use ioprio hint for hot and pinned files
To: Chao Yu <chao@kernel.org>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 5:50=E2=80=AFAM Chao Yu <chao@kernel.org> wrote:
>
> On 6/15/25 22:42, Daniel Lee wrote:
> > Apply the `ioprio_hint` to set `F2FS_IOPRIO_WRITE` priority
> > on files identified as "hot" at creation and on files that are
> > pinned via ioctl.
> >
> > Signed-off-by: Daniel Lee <chullee@google.com>
> > ---
> >  fs/f2fs/f2fs.h  | 19 +++++++++++++++++++
> >  fs/f2fs/file.c  |  3 +++
> >  fs/f2fs/namei.c | 11 +++++++----
> >  3 files changed, 29 insertions(+), 4 deletions(-)
> >
> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > index 3e02687c1b58..0c4f52892ff7 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -3440,6 +3440,25 @@ static inline void set_file(struct inode *inode,=
 int type)
> >       f2fs_mark_inode_dirty_sync(inode, true);
> >  }
> >
> > +static inline int get_ioprio(struct inode *inode)
> > +{
> > +     return F2FS_I(inode)->ioprio_hint;
> > +}
> > +
> > +static inline void set_ioprio(struct inode *inode, int level)
> > +{
> > +     if (get_ioprio(inode) =3D=3D level)
> > +             return;
> > +     F2FS_I(inode)->ioprio_hint =3D level;
> > +}
> > +
> > +static inline void clear_ioprio(struct inode *inode)
> > +{
> > +     if (get_ioprio(inode) =3D=3D 0)
> > +             return;
> > +     F2FS_I(inode)->ioprio_hint =3D 0;
> > +}
> > +
> >  static inline void clear_file(struct inode *inode, int type)
> >  {
> >       if (!is_file(inode, type))
> > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > index 3eb40d7bf602..a18fb7f3d019 100644
> > --- a/fs/f2fs/file.c
> > +++ b/fs/f2fs/file.c
> > @@ -3496,6 +3496,7 @@ static int f2fs_ioc_set_pin_file(struct file *fil=
p, unsigned long arg)
> >
> >       if (!pin) {
> >               clear_inode_flag(inode, FI_PIN_FILE);
> > +             clear_ioprio(inode);
>
> I guess there are more places clearing FI_PIN_FILE? we need to cover
> them all?

Yes, you're right. FI_PIN_FILE is toggled in several places. However,
this change is intended to set the HOT and IOPRIO on the files that
users explicitly pin through IOCTL. The other kernel internal
mechanisms (e.g., swap or gc_failures) remain the same. Are there any
potential issues that I should consider?

 >
> >               f2fs_i_gc_failures_write(inode, 0);
> >               goto done;
> >       } else if (f2fs_is_pinned_file(inode)) {
> > @@ -3529,6 +3530,8 @@ static int f2fs_ioc_set_pin_file(struct file *fil=
p, unsigned long arg)
> >       }
> >
> >       set_inode_flag(inode, FI_PIN_FILE);
> > +     file_set_hot(inode);
>
> Unnecessary file_set_hot() invoking? Or am I missing anything?
>
> Thanks,

Setting HOT and IOPRIO by default is also intentional. We set both
flags by default because the main use case for pinned files involves
frequently updated or short-lived data that needs fast write speeds.

>
> > +     set_ioprio(inode, F2FS_IOPRIO_WRITE);
> >       ret =3D F2FS_I(inode)->i_gc_failures;
> >  done:
> >       f2fs_update_time(sbi, REQ_TIME);
> > diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
> > index 07e333ee21b7..0f96a0b86c40 100644
> > --- a/fs/f2fs/namei.c
> > +++ b/fs/f2fs/namei.c
> > @@ -191,9 +191,10 @@ static void set_compress_new_inode(struct f2fs_sb_=
info *sbi, struct inode *dir,
> >  }
> >
> >  /*
> > - * Set file's temperature for hot/cold data separation
> > + * Set file's temperature (for hot/cold data separation) and
> > + * I/O priority, based on filename extension
> >   */
> > -static void set_file_temperature(struct f2fs_sb_info *sbi, struct inod=
e *inode,
> > +static void set_file_temp_prio(struct f2fs_sb_info *sbi, struct inode =
*inode,
> >               const unsigned char *name)
> >  {
> >       __u8 (*extlist)[F2FS_EXTENSION_LEN] =3D sbi->raw_super->extension=
_list;
> > @@ -212,8 +213,10 @@ static void set_file_temperature(struct f2fs_sb_in=
fo *sbi, struct inode *inode,
> >
> >       if (i < cold_count)
> >               file_set_cold(inode);
> > -     else
> > +     else {
> >               file_set_hot(inode);
> > +             set_ioprio(inode, F2FS_IOPRIO_WRITE);
> > +     }
> >  }
> >
> >  static struct inode *f2fs_new_inode(struct mnt_idmap *idmap,
> > @@ -317,7 +320,7 @@ static struct inode *f2fs_new_inode(struct mnt_idma=
p *idmap,
> >               set_inode_flag(inode, FI_INLINE_DATA);
> >
> >       if (name && !test_opt(sbi, DISABLE_EXT_IDENTIFY))
> > -             set_file_temperature(sbi, inode, name);
> > +             set_file_temp_prio(sbi, inode, name);
> >
> >       stat_inc_inline_xattr(inode);
> >       stat_inc_inline_inode(inode);
>
