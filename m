Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481CF7260D
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 16:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748190754; cv=none; b=f3uuWHl0+zF5cNjyO+y9vK0DcPKnfr8bh9wOuW39VaoK2zt6nTV6nESGqBCfYVGaDsNkZwfloXr3hZTrR4WQZFkz/BaXipb8sgxd30nQhOpAUDeGjQMATZ44fjuYBud2itdp4+zWG4w9U5JDPbRC9WEZ/MbL3G3vhQ2mg0qrl5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748190754; c=relaxed/simple;
	bh=K5z7N06BGK7qBedQwnCbjIWSUHF/wQ08EVC+4hOCrCs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q1JVSw1sTNUpoNMot6eG1LU3N/Ch80OcmTLTF3TwE954Nbk4MbiUqjEtpgKt7PvtBA1KL4gO5gf/veJK4Y0Ej4ib4h6RtEFdlIBMbH8mBVxfnK9ee2Om+bnO6z2qc34sCVPJM5F8bQDmNAmEG9nl5NSt9TevvedguxYtJZDOmDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c3gMhSJm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c3gMhSJm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748190751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J+zRLGn9y63L2oZofT6Hbt1gUwgDkhWd9Mz3xBzoYtQ=;
	b=c3gMhSJmCP5oGB666TPK3TYszubihZdANHOqAPeweuWlm7ljFhazpvArS2jdtSCX0oaA9o
	nka1VAbkXcGKGK1jlJfqITRAct0Y25mfAnWz/qchqS7JurPUffPpfyAx4z0w65oFAuRLrv
	lNhEnaqZWrm6xKKwefWvo/3kNGHuOKQ=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-541-rQFDVlybNvSSqZS6d-1szA-1; Sun, 25 May 2025 12:32:29 -0400
X-MC-Unique: rQFDVlybNvSSqZS6d-1szA-1
X-Mimecast-MFC-AGG-ID: rQFDVlybNvSSqZS6d-1szA_1748190748
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-32927576bddso7500151fa.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 09:32:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748190748; x=1748795548;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J+zRLGn9y63L2oZofT6Hbt1gUwgDkhWd9Mz3xBzoYtQ=;
        b=muLx3W1PuIzCy/qZJLWPdP5q2OTwo9R/7YkRGzv7ZAPDyyZ8vYmXEGctgKBkVuG+Ro
         Krr92Fy12Vjn7doZICwDFdxBfaiDx4GKvXVOlbEB0YvTaWaiR3+6IPbP2PJtLJVP6z2P
         QXVUR0Hj/6gi51deW51dusx3CstTs63Y/SOHIo+un2KS0Q1QxjpDs1CTthVuuGLMnpCT
         bh+RSblYa0H9usHoZ3fhX6BCZXouXH7KyzcWWZ2sTjPwCCKP0IbcXqefDAss/vRTx4sJ
         FdZ+N8EfuLeYL+hcooXilGJlE4BSNH4hGdFjeADncUqrJk4c7+l9fHcBkvF+VTJ/bRwL
         IcVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhJK78N0vK4EDtVY+XTI8x+COlTDHY0UVybfsPna/SukbDOyVXe4pqtB+rPVIp3lr5IuNM9neJnkgwPeg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhmRKsI8r1VwdEzoXEBDCyyITOJqdbr0hxTe2DqiJTuZfEhgkV
	8rSB4RdLRp2D6yR53iiHdlS6/5H1kHq/kUQAMeq5cBzZjUauSs8HsjXgtTt3/SeyQ8y+fax+83i
	pIry4OwKGXjXR39PDpM5QUPRW7DjeDC548S0X/lwlhXPt0a6xz59kwfeL+azB1EMnZRsNEZCxN0
	jCfpVlFWcqs5oqvC+Xr9/aa2tbhaNOR1vNVpb1HwfR
X-Gm-Gg: ASbGncvDAz+VK7KvIP/rhqskk9I/AL/Y1LMT/fbjB+7y6k4GPNDBSidSThgm06yTiDl
	I7WJ30a4g+v4Bp8/HVG94HxUGPajNoOWdztW6sbPLiewTp9zNyPWld5Qajdqfo1lukTkvtQ==
X-Received: by 2002:a05:651c:b23:b0:329:136e:300f with SMTP id 38308e7fff4ca-3294f7de991mr29734011fa.13.1748190747718;
        Sun, 25 May 2025 09:32:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNS+VFjmKrwDfYKYbpbcSAs/okXkGNCwwo6+o1eeAchy+mFmTO/OB/zQnt3M5/gyWyVOgJ/xeqo41hiDi1yrY=
X-Received: by 2002:a05:651c:b23:b0:329:136e:300f with SMTP id
 38308e7fff4ca-3294f7de991mr29733901fa.13.1748190747254; Sun, 25 May 2025
 09:32:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250524061320.370630-1-yukuai1@huaweicloud.com> <20250524061320.370630-7-yukuai1@huaweicloud.com>
In-Reply-To: <20250524061320.370630-7-yukuai1@huaweicloud.com>
From: Xiao Ni <xni@redhat.com>
Date: Mon, 26 May 2025 00:32:14 +0800
X-Gm-Features: AX0GCFtfoksJfef6YN4SbZyc2t62AJhh2nx9ETjK8_y0O50kQ-CGHswA4ikw5jg
Message-ID: <CALTww2_sxkU83=F+BqBJB29-gada2=sF-cZR98e5UiARJQuNjg@mail.gmail.com>
Subject: Re: [PATCH 06/23] md/md-bitmap: add a new sysfs api bitmap_type
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: hch@lst.de, colyli@kernel.org, song@kernel.org, yukuai3@huawei.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-raid@vger.kernel.org, yi.zhang@huawei.com, yangerkun@huawei.com, 
	johnny.chenyi@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 24, 2025 at 2:18=E2=80=AFPM Yu Kuai <yukuai1@huaweicloud.com> w=
rote:
>
> From: Yu Kuai <yukuai3@huawei.com>
>
> The api will be used by mdadm to set bitmap_ops while creating new array

Hi Kuai

Maybe you want to say "set bitmap type" here? And can you explain more
here, why does it need this sys file while creating a new array? The
reason I ask is that it doesn't use a sys file when creating an array
with bitmap.

And if it really needs this, can this be gotten by superblock?

Best Regards
Xiao

> or assemble array, prepare to add a new bitmap.
>
> Currently available options are:
>
> cat /sys/block/md0/md/bitmap_type
> none [bitmap]
>
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> ---
>  Documentation/admin-guide/md.rst | 73 ++++++++++++++----------
>  drivers/md/md.c                  | 96 ++++++++++++++++++++++++++++++--
>  drivers/md/md.h                  |  2 +
>  3 files changed, 135 insertions(+), 36 deletions(-)
>
> diff --git a/Documentation/admin-guide/md.rst b/Documentation/admin-guide=
/md.rst
> index 4ff2cc291d18..356d2a344f08 100644
> --- a/Documentation/admin-guide/md.rst
> +++ b/Documentation/admin-guide/md.rst
> @@ -347,6 +347,49 @@ All md devices contain:
>       active-idle
>           like active, but no writes have been seen for a while (safe_mod=
e_delay).
>
> +  consistency_policy
> +     This indicates how the array maintains consistency in case of unexp=
ected
> +     shutdown. It can be:
> +
> +     none
> +       Array has no redundancy information, e.g. raid0, linear.
> +
> +     resync
> +       Full resync is performed and all redundancy is regenerated when t=
he
> +       array is started after unclean shutdown.
> +
> +     bitmap
> +       Resync assisted by a write-intent bitmap.
> +
> +     journal
> +       For raid4/5/6, journal device is used to log transactions and rep=
lay
> +       after unclean shutdown.
> +
> +     ppl
> +       For raid5 only, Partial Parity Log is used to close the write hol=
e and
> +       eliminate resync.
> +
> +     The accepted values when writing to this file are ``ppl`` and ``res=
ync``,
> +     used to enable and disable PPL.
> +
> +  uuid
> +     This indicates the UUID of the array in the following format:
> +     xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
> +
> +  bitmap_type
> +     [RW] When read, this file will display the current and available
> +     bitmap for this array. The currently active bitmap will be enclosed
> +     in [] brackets. Writing an bitmap name or ID to this file will swit=
ch
> +     control of this array to that new bitmap. Note that writing a new
> +     bitmap for created array is forbidden.
> +
> +     none
> +         No bitmap
> +     bitmap
> +         The default internal bitmap
> +
> +If bitmap_type is bitmap, then the md device will also contain:
> +
>    bitmap/location
>       This indicates where the write-intent bitmap for the array is
>       stored.
> @@ -401,36 +444,6 @@ All md devices contain:
>       once the array becomes non-degraded, and this fact has been
>       recorded in the metadata.
>
> -  consistency_policy
> -     This indicates how the array maintains consistency in case of unexp=
ected
> -     shutdown. It can be:
> -
> -     none
> -       Array has no redundancy information, e.g. raid0, linear.
> -
> -     resync
> -       Full resync is performed and all redundancy is regenerated when t=
he
> -       array is started after unclean shutdown.
> -
> -     bitmap
> -       Resync assisted by a write-intent bitmap.
> -
> -     journal
> -       For raid4/5/6, journal device is used to log transactions and rep=
lay
> -       after unclean shutdown.
> -
> -     ppl
> -       For raid5 only, Partial Parity Log is used to close the write hol=
e and
> -       eliminate resync.
> -
> -     The accepted values when writing to this file are ``ppl`` and ``res=
ync``,
> -     used to enable and disable PPL.
> -
> -  uuid
> -     This indicates the UUID of the array in the following format:
> -     xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
> -
> -
>  As component devices are added to an md array, they appear in the ``md``
>  directory as new directories named::
>
> diff --git a/drivers/md/md.c b/drivers/md/md.c
> index 311e52d5173d..4eb0c6effd5b 100644
> --- a/drivers/md/md.c
> +++ b/drivers/md/md.c
> @@ -672,13 +672,18 @@ static void active_io_release(struct percpu_ref *re=
f)
>
>  static void no_op(struct percpu_ref *r) {}
>
> -static void mddev_set_bitmap_ops(struct mddev *mddev, enum md_submodule_=
id id)
> +static bool mddev_set_bitmap_ops(struct mddev *mddev)
>  {
>         xa_lock(&md_submodule);
> -       mddev->bitmap_ops =3D xa_load(&md_submodule, id);
> +       mddev->bitmap_ops =3D xa_load(&md_submodule, mddev->bitmap_id);
>         xa_unlock(&md_submodule);
> -       if (!mddev->bitmap_ops)
> -               pr_warn_once("md: can't find bitmap id %d\n", id);
> +
> +       if (!mddev->bitmap_ops) {
> +               pr_warn_once("md: can't find bitmap id %d\n", mddev->bitm=
ap_id);
> +               return false;
> +       }
> +
> +       return true;
>  }
>
>  static void mddev_clear_bitmap_ops(struct mddev *mddev)
> @@ -688,8 +693,10 @@ static void mddev_clear_bitmap_ops(struct mddev *mdd=
ev)
>
>  int mddev_init(struct mddev *mddev)
>  {
> -       /* TODO: support more versions */
> -       mddev_set_bitmap_ops(mddev, ID_BITMAP);
> +       mddev->bitmap_id =3D ID_BITMAP;
> +
> +       if (!mddev_set_bitmap_ops(mddev))
> +               return -EINVAL;
>
>         if (percpu_ref_init(&mddev->active_io, active_io_release,
>                             PERCPU_REF_ALLOW_REINIT, GFP_KERNEL)) {
> @@ -4155,6 +4162,82 @@ new_level_store(struct mddev *mddev, const char *b=
uf, size_t len)
>  static struct md_sysfs_entry md_new_level =3D
>  __ATTR(new_level, 0664, new_level_show, new_level_store);
>
> +static ssize_t
> +bitmap_type_show(struct mddev *mddev, char *page)
> +{
> +       struct md_submodule_head *head;
> +       unsigned long i;
> +       ssize_t len =3D 0;
> +
> +       if (mddev->bitmap_id =3D=3D ID_BITMAP_NONE)
> +               len +=3D sprintf(page + len, "[none] ");
> +       else
> +               len +=3D sprintf(page + len, "none ");
> +
> +       xa_lock(&md_submodule);
> +       xa_for_each(&md_submodule, i, head) {
> +               if (head->type !=3D MD_BITMAP)
> +                       continue;
> +
> +               if (mddev->bitmap_id =3D=3D head->id)
> +                       len +=3D sprintf(page + len, "[%s] ", head->name)=
;
> +               else
> +                       len +=3D sprintf(page + len, "%s ", head->name);
> +       }
> +       xa_unlock(&md_submodule);
> +
> +       len +=3D sprintf(page + len, "\n");
> +       return len;
> +}
> +
> +static ssize_t
> +bitmap_type_store(struct mddev *mddev, const char *buf, size_t len)
> +{
> +       struct md_submodule_head *head;
> +       enum md_submodule_id id;
> +       unsigned long i;
> +       int err;
> +
> +       if (mddev->bitmap_ops)
> +               return -EBUSY;
> +
> +       err =3D kstrtoint(buf, 10, &id);
> +       if (!err) {
> +               if (id =3D=3D ID_BITMAP_NONE) {
> +                       mddev->bitmap_id =3D id;
> +                       return len;
> +               }
> +
> +               xa_lock(&md_submodule);
> +               head =3D xa_load(&md_submodule, id);
> +               xa_unlock(&md_submodule);
> +
> +               if (head && head->type =3D=3D MD_BITMAP) {
> +                       mddev->bitmap_id =3D id;
> +                       return len;
> +               }
> +       }
> +
> +       if (cmd_match(buf, "none")) {
> +               mddev->bitmap_id =3D ID_BITMAP_NONE;
> +               return len;
> +       }
> +
> +       xa_lock(&md_submodule);
> +       xa_for_each(&md_submodule, i, head) {
> +               if (head->type =3D=3D MD_BITMAP && cmd_match(buf, head->n=
ame)) {
> +                       mddev->bitmap_id =3D head->id;
> +                       xa_unlock(&md_submodule);
> +                       return len;
> +               }
> +       }
> +       xa_unlock(&md_submodule);
> +       return -ENOENT;
> +}
> +
> +static struct md_sysfs_entry md_bitmap_type =3D
> +__ATTR(bitmap_type, 0664, bitmap_type_show, bitmap_type_store);
> +
>  static ssize_t
>  layout_show(struct mddev *mddev, char *page)
>  {
> @@ -5719,6 +5802,7 @@ __ATTR(serialize_policy, S_IRUGO | S_IWUSR, seriali=
ze_policy_show,
>  static struct attribute *md_default_attrs[] =3D {
>         &md_level.attr,
>         &md_new_level.attr,
> +       &md_bitmap_type.attr,
>         &md_layout.attr,
>         &md_raid_disks.attr,
>         &md_uuid.attr,
> diff --git a/drivers/md/md.h b/drivers/md/md.h
> index 13e3f9ce1b79..bf34c0a36551 100644
> --- a/drivers/md/md.h
> +++ b/drivers/md/md.h
> @@ -40,6 +40,7 @@ enum md_submodule_id {
>         ID_CLUSTER,
>         ID_BITMAP,
>         ID_LLBITMAP,    /* TODO */
> +       ID_BITMAP_NONE,
>  };
>
>  struct md_submodule_head {
> @@ -565,6 +566,7 @@ struct mddev {
>         struct percpu_ref               writes_pending;
>         int                             sync_checkers;  /* # of threads c=
hecking writes_pending */
>
> +       enum md_submodule_id            bitmap_id;
>         void                            *bitmap; /* the bitmap for the de=
vice */
>         struct bitmap_operations        *bitmap_ops;
>         struct {
> --
> 2.39.2
>

