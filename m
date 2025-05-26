Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5253D148832
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 06:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748242353; cv=none; b=oFX1f7+FhHGvwpmCzMVRFiMbz2TygKVXREby69QCU9fYH4PrUj6asVI+GV8BAfwPNlju1/RnOP6lesp3fNtBkgaDoyy85x88zmDbYHLHxDN8GE+VO1S3OXqFYSVkj4qfc8iq+Vdkthp66SX1sJ50y+RPgLSe3ZTBVFY/xHB31H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748242353; c=relaxed/simple;
	bh=ZlOwcc3VkcgMEcapoxgQ8V2pPpI1bt/bQ0cPBZzebSQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yxn5LeBhyneogJnQNgs4Nc63UI2DT0Yc3nuijzSYrECXKtnEQvXzDPGnHxrka6ZmcTkOyuex5pV+wkaYB+oMInQjiEd/QM6IMZmitwJpo320rLiIUzHzHZldH9CqEF8ZWRPg9J7z6bKiUbr/xsLECuSYgoStaPu2BsxrsuiTWDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MqepkjPl; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MqepkjPl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748242348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yCawJ0dFDpBtyEVTwgAC5gJwKklBKm4JN0UMebcRJJs=;
	b=MqepkjPlOzCVWtClHVbr4y6Y7uoUil8sG2goYXmCXVG945iEa03X39vYEx59Af/Jmd+ozP
	qaeJA1yyuCsHhwmNRWpLtXMSuay+tz3ljGraR2KldQT89hfkXVP1gOf2/MrCa/oxVYhuU9
	5yAYE8sLIYXFT+Qs7yx0Yjk3+1up59E=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-3o8plT2nPgeLNRVdVcKOPQ-1; Mon, 26 May 2025 02:52:26 -0400
X-MC-Unique: 3o8plT2nPgeLNRVdVcKOPQ-1
X-Mimecast-MFC-AGG-ID: 3o8plT2nPgeLNRVdVcKOPQ_1748242345
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-32a6759deabso218601fa.3
        for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 23:52:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748242345; x=1748847145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yCawJ0dFDpBtyEVTwgAC5gJwKklBKm4JN0UMebcRJJs=;
        b=wZFuYrSiccvn1hyCMyXlIonDat/BUILDrPI5FbKEawXFPK6XoYrkmZdqB+r28WXex3
         r7NiUH7Qx8jH+ftp4WGAOqWbIYyhuwfTNwXurlrA+I+gLgLhzCuQkQ54hcMP8tzWH05E
         n9khMgeks3RvNT5o4J0VDphIAyL7yTbDF9YAgdZKMh7K7raQWt4/rueyU8JdTtgggsnI
         8LiH6PigWVra4dq98Q3FSsMNi/v5nitfhXhKrjgjrOZ1zzZwDg4ouUdAqXo4ywXzcRWN
         1oyW+Lal+S3cchwe6lOi86EbZa4Nz0drd/pii7EmnwbqxJrbWjRY6xns+K8Y+0oZniuF
         96OQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfvDNrcQ4a1RLlT3XH9JxEtJC3YqQQCPIcMTKtdYuyNHyWkgnqph6DTzjgxnUCAkfobe8RfihPQ179wfM=@vger.kernel.org
X-Gm-Message-State: AOJu0YypCPalElK7TvJ+XAPYtC3Ghnb2ouvdLd7mox6xgTdnVI+Y3TSe
	8b9nAsXFpMyhIgjiA2wv9/cpLz8AeVbG2zgHJCn1V2iShgAVj6ufQwczNN2zMFIAaz7IDCgJl8I
	D8VgttbKI3a4ISF1yAdwl757vu/FoL7H5z0COKcNfeiohulwOlPWYWC08kzARRCu4q6nYzLYreb
	mj6RtGNA6f8m3BmZ6HJFc6ZZgzFOohmjxCV3zQ21Yb
X-Gm-Gg: ASbGncv/2k3wiDyiiZb7K+lTYTPeRguFWqNO1e+CI286RlUsm/XFg3UJ+BEqDBa1cZK
	POUFxAccq2EB94a5wgCV8DEwjBNuvfwrwhLlU8hEBd2T9AuZvEJx0gzPVbD8Pg56GT/QWlg==
X-Received: by 2002:a05:651c:19ab:b0:307:e498:1254 with SMTP id 38308e7fff4ca-3295baeff9dmr18498241fa.35.1748242344838;
        Sun, 25 May 2025 23:52:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHszLz76zAR4JvYoIBlb5ySuIUmig7t9FtU7r6WgUonz9U2v+LHNp5oX3arfEHLt11Gwff9YPos8+RUDqFLJ4I=
X-Received: by 2002:a05:651c:19ab:b0:307:e498:1254 with SMTP id
 38308e7fff4ca-3295baeff9dmr18498111fa.35.1748242344293; Sun, 25 May 2025
 23:52:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250524061320.370630-1-yukuai1@huaweicloud.com> <20250524061320.370630-8-yukuai1@huaweicloud.com>
In-Reply-To: <20250524061320.370630-8-yukuai1@huaweicloud.com>
From: Xiao Ni <xni@redhat.com>
Date: Mon, 26 May 2025 14:52:12 +0800
X-Gm-Features: AX0GCFv9c4SwTsia3eNC4sWIirkkKBWV3G9f__Cg0e6F32b-Njv-SJIRMs18ANE
Message-ID: <CALTww2_03_fVt+KMcmtbGw-kcRsLLpAG7W62e3y0W9SpvhUVtg@mail.gmail.com>
Subject: Re: [PATCH 07/23] md/md-bitmap: delay registration of bitmap_ops
 until creating bitmap
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
> Currently bitmap_ops is registered while allocating mddev, this is fine
> when there is only one bitmap_ops, however, after introduing a new
> bitmap_ops, user space need a time window to choose which bitmap_ops to
> use while creating new array.

Could you give more explanation about what the time window is? Is it
between setting llbitmap by bitmap_type and md_bitmap_create?

>
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> ---
>  drivers/md/md.c | 86 +++++++++++++++++++++++++++++++------------------
>  1 file changed, 55 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/md/md.c b/drivers/md/md.c
> index 4eb0c6effd5b..dc4b85f30e13 100644
> --- a/drivers/md/md.c
> +++ b/drivers/md/md.c
> @@ -674,39 +674,50 @@ static void no_op(struct percpu_ref *r) {}
>
>  static bool mddev_set_bitmap_ops(struct mddev *mddev)
>  {
> +       struct bitmap_operations *old =3D mddev->bitmap_ops;
> +       struct md_submodule_head *head;
> +
> +       if (mddev->bitmap_id =3D=3D ID_BITMAP_NONE ||
> +           (old && old->head.id =3D=3D mddev->bitmap_id))
> +               return true;
> +
>         xa_lock(&md_submodule);
> -       mddev->bitmap_ops =3D xa_load(&md_submodule, mddev->bitmap_id);
> +       head =3D xa_load(&md_submodule, mddev->bitmap_id);
>         xa_unlock(&md_submodule);
>
> -       if (!mddev->bitmap_ops) {
> -               pr_warn_once("md: can't find bitmap id %d\n", mddev->bitm=
ap_id);
> +       if (WARN_ON_ONCE(!head || head->type !=3D MD_BITMAP)) {
> +               pr_err("md: can't find bitmap id %d\n", mddev->bitmap_id)=
;
>                 return false;
>         }
>
> +       if (old && old->group)
> +               sysfs_remove_group(&mddev->kobj, old->group);

I think you're handling a competition problem here. But I don't know
how the old/old->group is already created when creating an array.
Could you explain this?

Regards
Xiao

> +
> +       mddev->bitmap_ops =3D (void *)head;
> +       if (mddev->bitmap_ops && mddev->bitmap_ops->group &&
> +           sysfs_create_group(&mddev->kobj, mddev->bitmap_ops->group))
> +               pr_warn("md: cannot register extra bitmap attributes for =
%s\n",
> +                       mdname(mddev));
> +
>         return true;
>  }
>
>  static void mddev_clear_bitmap_ops(struct mddev *mddev)
>  {
> +       if (mddev->bitmap_ops && mddev->bitmap_ops->group)
> +               sysfs_remove_group(&mddev->kobj, mddev->bitmap_ops->group=
);
> +
>         mddev->bitmap_ops =3D NULL;
>  }
>
>  int mddev_init(struct mddev *mddev)
>  {
> -       mddev->bitmap_id =3D ID_BITMAP;
> -
> -       if (!mddev_set_bitmap_ops(mddev))
> -               return -EINVAL;
> -
>         if (percpu_ref_init(&mddev->active_io, active_io_release,
> -                           PERCPU_REF_ALLOW_REINIT, GFP_KERNEL)) {
> -               mddev_clear_bitmap_ops(mddev);
> +                           PERCPU_REF_ALLOW_REINIT, GFP_KERNEL))
>                 return -ENOMEM;
> -       }
>
>         if (percpu_ref_init(&mddev->writes_pending, no_op,
>                             PERCPU_REF_ALLOW_REINIT, GFP_KERNEL)) {
> -               mddev_clear_bitmap_ops(mddev);
>                 percpu_ref_exit(&mddev->active_io);
>                 return -ENOMEM;
>         }
> @@ -734,6 +745,7 @@ int mddev_init(struct mddev *mddev)
>         mddev->resync_min =3D 0;
>         mddev->resync_max =3D MaxSector;
>         mddev->level =3D LEVEL_NONE;
> +       mddev->bitmap_id =3D ID_BITMAP;
>
>         INIT_WORK(&mddev->sync_work, md_start_sync);
>         INIT_WORK(&mddev->del_work, mddev_delayed_delete);
> @@ -744,7 +756,6 @@ EXPORT_SYMBOL_GPL(mddev_init);
>
>  void mddev_destroy(struct mddev *mddev)
>  {
> -       mddev_clear_bitmap_ops(mddev);
>         percpu_ref_exit(&mddev->active_io);
>         percpu_ref_exit(&mddev->writes_pending);
>  }
> @@ -6093,11 +6104,6 @@ struct mddev *md_alloc(dev_t dev, char *name)
>                 return ERR_PTR(error);
>         }
>
> -       if (md_bitmap_registered(mddev) && mddev->bitmap_ops->group)
> -               if (sysfs_create_group(&mddev->kobj, mddev->bitmap_ops->g=
roup))
> -                       pr_warn("md: cannot register extra bitmap attribu=
tes for %s\n",
> -                               mdname(mddev));
> -
>         kobject_uevent(&mddev->kobj, KOBJ_ADD);
>         mddev->sysfs_state =3D sysfs_get_dirent_safe(mddev->kobj.sd, "arr=
ay_state");
>         mddev->sysfs_level =3D sysfs_get_dirent_safe(mddev->kobj.sd, "lev=
el");
> @@ -6173,6 +6179,26 @@ static void md_safemode_timeout(struct timer_list =
*t)
>
>  static int start_dirty_degraded;
>
> +static int md_bitmap_create(struct mddev *mddev)
> +{
> +       if (mddev->bitmap_id =3D=3D ID_BITMAP_NONE)
> +               return -EINVAL;
> +
> +       if (!mddev_set_bitmap_ops(mddev))
> +               return -ENOENT;
> +
> +       return mddev->bitmap_ops->create(mddev);
> +}
> +
> +static void md_bitmap_destroy(struct mddev *mddev)
> +{
> +       if (!md_bitmap_registered(mddev))
> +               return;
> +
> +       mddev->bitmap_ops->destroy(mddev);
> +       mddev_clear_bitmap_ops(mddev);
> +}
> +
>  int md_run(struct mddev *mddev)
>  {
>         int err;
> @@ -6337,9 +6363,9 @@ int md_run(struct mddev *mddev)
>                         (unsigned long long)pers->size(mddev, 0, 0) / 2);
>                 err =3D -EINVAL;
>         }
> -       if (err =3D=3D 0 && pers->sync_request && md_bitmap_registered(md=
dev) &&
> +       if (err =3D=3D 0 && pers->sync_request &&
>             (mddev->bitmap_info.file || mddev->bitmap_info.offset)) {
> -               err =3D mddev->bitmap_ops->create(mddev);
> +               err =3D md_bitmap_create(mddev);
>                 if (err)
>                         pr_warn("%s: failed to create bitmap (%d)\n",
>                                 mdname(mddev), err);
> @@ -6412,8 +6438,7 @@ int md_run(struct mddev *mddev)
>                 pers->free(mddev, mddev->private);
>         mddev->private =3D NULL;
>         put_pers(pers);
> -       if (md_bitmap_registered(mddev))
> -               mddev->bitmap_ops->destroy(mddev);
> +       md_bitmap_destroy(mddev);
>  abort:
>         bioset_exit(&mddev->io_clone_set);
>  exit_sync_set:
> @@ -6436,7 +6461,7 @@ int do_md_run(struct mddev *mddev)
>         if (md_bitmap_registered(mddev)) {
>                 err =3D mddev->bitmap_ops->load(mddev);
>                 if (err) {
> -                       mddev->bitmap_ops->destroy(mddev);
> +                       md_bitmap_destroy(mddev);
>                         goto out;
>                 }
>         }
> @@ -6627,8 +6652,7 @@ static void __md_stop(struct mddev *mddev)
>  {
>         struct md_personality *pers =3D mddev->pers;
>
> -       if (md_bitmap_registered(mddev))
> -               mddev->bitmap_ops->destroy(mddev);
> +       md_bitmap_destroy(mddev);
>         mddev_detach(mddev);
>         spin_lock(&mddev->lock);
>         mddev->pers =3D NULL;
> @@ -7408,16 +7432,16 @@ static int set_bitmap_file(struct mddev *mddev, i=
nt fd)
>         err =3D 0;
>         if (mddev->pers) {
>                 if (fd >=3D 0) {
> -                       err =3D mddev->bitmap_ops->create(mddev);
> +                       err =3D md_bitmap_create(mddev);
>                         if (!err)
>                                 err =3D mddev->bitmap_ops->load(mddev);
>
>                         if (err) {
> -                               mddev->bitmap_ops->destroy(mddev);
> +                               md_bitmap_destroy(mddev);
>                                 fd =3D -1;
>                         }
>                 } else if (fd < 0) {
> -                       mddev->bitmap_ops->destroy(mddev);
> +                       md_bitmap_destroy(mddev);
>                 }
>         }
>
> @@ -7732,12 +7756,12 @@ static int update_array_info(struct mddev *mddev,=
 mdu_array_info_t *info)
>                                 mddev->bitmap_info.default_offset;
>                         mddev->bitmap_info.space =3D
>                                 mddev->bitmap_info.default_space;
> -                       rv =3D mddev->bitmap_ops->create(mddev);
> +                       rv =3D md_bitmap_create(mddev);
>                         if (!rv)
>                                 rv =3D mddev->bitmap_ops->load(mddev);
>
>                         if (rv)
> -                               mddev->bitmap_ops->destroy(mddev);
> +                               md_bitmap_destroy(mddev);
>                 } else {
>                         struct md_bitmap_stats stats;
>
> @@ -7763,7 +7787,7 @@ static int update_array_info(struct mddev *mddev, m=
du_array_info_t *info)
>                                 put_cluster_ops(mddev);
>                                 mddev->safemode_delay =3D DEFAULT_SAFEMOD=
E_DELAY;
>                         }
> -                       mddev->bitmap_ops->destroy(mddev);
> +                       md_bitmap_destroy(mddev);
>                         mddev->bitmap_info.offset =3D 0;
>                 }
>         }
> --
> 2.39.2
>

