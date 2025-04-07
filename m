Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F107F212FB8
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 03:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743995664; cv=none; b=irhiYgnCrIjFc4u5Edi+Cxd/4yMIiaLjK08v7OIMogfjcX3a+gixYs+NK91w81Amg+UGd/uFPP4/zrJg/Qd9rMP8BRU8H+zunZPeENX2Rnq4kw3a7Sa80dAoZFmRELsCRrLXDk2qy4UUJ0qMeTvWaj8tUto52+6pvPgo1g7mGJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743995664; c=relaxed/simple;
	bh=mXJAmxybI6UA4lfjqnhnYvdlcYJUljSoCZLa9BbD4is=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ej7I/qCYlQsFF1V0VAKi0rWv2QuU+EbVKBmjL7FiaFqJFd3JWPisf24TPFywhBhJnVagRX7BmVLsxGjCb7kY3WDa0qPrOThJt7jSfmTcnISaLk90SM1+hg9cF80Uh21a48/HWdIKh9qd7ObWsy9spTWGFcYAKXo5WGT+5o/AmWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bTAgSuWk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bTAgSuWk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743995661;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0EOfyJkW8Qr+KfhHOJXKNdiT0oP5UcDYVoU1kH9CCUI=;
	b=bTAgSuWksqYSsW9ewcVFGQNFcE/bDYxtFMWCEvJaee45Cy++nvXxMrdztIhlNAU87Iq6nL
	Z0OiZLAPAozmKHS0uleI0OGIHUak3O7eL91awVDBPyfsSTSn80qZqobLgG+ASZvdWfN5Dk
	39p25ZGTThAqGW6SZfQB3Wpu7Dbw4bU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-207-1NIYrFXoMUWeL6xp1tjK-w-1; Sun, 06 Apr 2025 23:14:20 -0400
X-MC-Unique: 1NIYrFXoMUWeL6xp1tjK-w-1
X-Mimecast-MFC-AGG-ID: 1NIYrFXoMUWeL6xp1tjK-w_1743995659
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ac3c219371bso396666566b.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 20:14:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743995659; x=1744600459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0EOfyJkW8Qr+KfhHOJXKNdiT0oP5UcDYVoU1kH9CCUI=;
        b=cQoPpKr/Jju37ylopJQKOliLoKWx7CTe/gvMS03Z7JN+1eMd7EtPPpuU9/t8l2vNMM
         imH9jEzSWUWJH5kldDQI6KgPjhJctWtc+Np9lwjvGLRAMeOQiwfkAtA7MbxvbppwuaB/
         +o16HW8Rr7Vb5Rv7vxsHWq9bGvThN79qun1XHYCZ08Sfs46ONf93qXQuOkshnb/gb8zz
         LNkVhHZDnj0yLXuzcnS3ivVmcTqaYfE3ipR5jAOJF+mJfPPBXUXee0qfcJf+0f04yAAs
         ateqswLhUnP5agfDfYwSAfNJk+7Hj9ufXPmTt3YKK9CDQUomFJR6Iy6DwvGxg/q+0+B3
         pP8g==
X-Forwarded-Encrypted: i=1; AJvYcCVY2ner9R3+j+k+1fF6gM1uA7tOyh7wMf1JBONCcFAvhv+7iY9XN0Lw2VPhztw2WsxxzxKhJAU2qw7rJ0w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkEdGEmtVtdKYFQb258dEYfPjDtSpDctMRGO797jYpJzeQ34ES
	WQLKyeF3+qZj1sF99Ui9xMD8rMEj2jmkcdOXavtZhkLa++Pge+gNz81ND67Sj+sQ+21noN7F5FZ
	7BvnasCcnEcVh72KzANlEhB+iSK8DgacqldYT0CEyS40tuEMqGSXgpT7cwSwRU9TFl/rIVXjuda
	q/AmUvdwXPPRpg1jz4T1KNP7llN4qqjTOPagg9
X-Gm-Gg: ASbGncspiX9sG9wEPklS1Y4RtbSmw+rG55Xo9BCyrt6v585jFVZwfOUIn5Ei/ZglVig
	qNvGijwyDobO9QyKv1Hanj2GKtFQ3Ve+6aKmZ85Zq3Zto9O8p4IRaL3Mt739Far/4475R+dpZGA
	==
X-Received: by 2002:a17:907:7e91:b0:ac7:c66a:4702 with SMTP id a640c23a62f3a-ac7e7778fccmr672850166b.57.1743995659398;
        Sun, 06 Apr 2025 20:14:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCWk0xdNUItKSUltbDcxn9ctHyrAE4G2otpueHZlPsmxRr87Wrg5z580eF4IAEek7EI0SxS57Fmv8i+q3owI8=
X-Received: by 2002:a17:907:7e91:b0:ac7:c66a:4702 with SMTP id
 a640c23a62f3a-ac7e7778fccmr672848866b.57.1743995659075; Sun, 06 Apr 2025
 20:14:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250328100359.1306072-1-lulu@redhat.com> <20250328100359.1306072-5-lulu@redhat.com>
 <3hsgi4a2kj5fg65zz7q463ypxbstf2x73avupayyrexjonkheo@utoyktego6as>
In-Reply-To: <3hsgi4a2kj5fg65zz7q463ypxbstf2x73avupayyrexjonkheo@utoyktego6as>
From: Cindy Lu <lulu@redhat.com>
Date: Mon, 7 Apr 2025 11:13:42 +0800
X-Gm-Features: ATxdqUF29XmCj9-AK-IDg-1ou2ZB2wD6PcpkfDmhvou-lIdz_Dc0jfCjIxAbUfg
Message-ID: <CACLfguV5v8Pm9=+0jkDnZFLp-MiyoYT=cFsA2rqeVgNJ2O7zvQ@mail.gmail.com>
Subject: Re: [PATCH v8 4/8] vhost: Introduce vhost_worker_ops in vhost_worker
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: jasowang@redhat.com, mst@redhat.com, michael.christie@oracle.com, 
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 1, 2025 at 9:48=E2=80=AFPM Stefano Garzarella <sgarzare@redhat.=
com> wrote:
>
> On Fri, Mar 28, 2025 at 06:02:48PM +0800, Cindy Lu wrote:
> >Abstract vhost worker operations (create/stop/wakeup) into an ops
> >structure to prepare for kthread mode support.
> >
> >Signed-off-by: Cindy Lu <lulu@redhat.com>
> >---
> > drivers/vhost/vhost.c | 63 ++++++++++++++++++++++++++++++-------------
> > drivers/vhost/vhost.h | 11 ++++++++
> > 2 files changed, 56 insertions(+), 18 deletions(-)
> >
> >diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
> >index 20571bd6f7bd..c162ad772f8f 100644
> >--- a/drivers/vhost/vhost.c
> >+++ b/drivers/vhost/vhost.c
> >@@ -243,7 +243,7 @@ static void vhost_worker_queue(struct vhost_worker *=
worker,
> >                * test_and_set_bit() implies a memory barrier.
> >                */
> >               llist_add(&work->node, &worker->work_list);
> >-              vhost_task_wake(worker->vtsk);
> >+              worker->ops->wakeup(worker);
> >       }
> > }
> >
> >@@ -706,7 +706,7 @@ static void vhost_worker_destroy(struct vhost_dev *d=
ev,
> >
> >       WARN_ON(!llist_empty(&worker->work_list));
> >       xa_erase(&dev->worker_xa, worker->id);
> >-      vhost_task_stop(worker->vtsk);
> >+      worker->ops->stop(worker);
> >       kfree(worker);
> > }
> >
> >@@ -729,42 +729,69 @@ static void vhost_workers_free(struct vhost_dev *d=
ev)
> >       xa_destroy(&dev->worker_xa);
> > }
> >
> >+static void vhost_task_wakeup(struct vhost_worker *worker)
> >+{
> >+      return vhost_task_wake(worker->vtsk);
> >+}
> >+
> >+static void vhost_task_do_stop(struct vhost_worker *worker)
> >+{
> >+      return vhost_task_stop(worker->vtsk);
> >+}
> >+
> >+static int vhost_task_worker_create(struct vhost_worker *worker,
> >+                                  struct vhost_dev *dev, const char *na=
me)
> >+{
> >+      struct vhost_task *vtsk;
> >+      u32 id;
> >+      int ret;
> >+
> >+      vtsk =3D vhost_task_create(vhost_run_work_list, vhost_worker_kill=
ed,
> >+                               worker, name);
> >+      if (IS_ERR(vtsk))
> >+              return PTR_ERR(vtsk);
> >+
> >+      worker->vtsk =3D vtsk;
> >+      vhost_task_start(vtsk);
> >+      ret =3D xa_alloc(&dev->worker_xa, &id, worker, xa_limit_32b, GFP_=
KERNEL);
> >+      if (ret < 0) {
> >+              vhost_task_do_stop(worker);
> >+              return ret;
> >+      }
>
> In the final code, xa_alloc() is duplicated among the functions that
> create ktrhead or task, might it make sense to leave it out and do it in
> vhost_worker_create() ?
>
> Thanks,
> Stefano
>
Thanks a lot Stefano. I previously tried moving xa_alloc() out, but
that made the code strange.
I think keeping xa_alloc() in the create_ops function completes the
job in  a single function, and maybe it could be used in some other
functions in the future
thanks
cindy

> >+      worker->id =3D id;
> >+      return 0;
> >+}
> >+
> >+static const struct vhost_worker_ops vhost_task_ops =3D {
> >+      .create =3D vhost_task_worker_create,
> >+      .stop =3D vhost_task_do_stop,
> >+      .wakeup =3D vhost_task_wakeup,
> >+};
> >+
> > static struct vhost_worker *vhost_worker_create(struct vhost_dev *dev)
> > {
> >       struct vhost_worker *worker;
> >-      struct vhost_task *vtsk;
> >       char name[TASK_COMM_LEN];
> >       int ret;
> >-      u32 id;
> >+      const struct vhost_worker_ops *ops =3D &vhost_task_ops;
> >
> >       worker =3D kzalloc(sizeof(*worker), GFP_KERNEL_ACCOUNT);
> >       if (!worker)
> >               return NULL;
> >
> >       worker->dev =3D dev;
> >+      worker->ops =3D ops;
> >       snprintf(name, sizeof(name), "vhost-%d", current->pid);
> >
> >-      vtsk =3D vhost_task_create(vhost_run_work_list, vhost_worker_kill=
ed,
> >-                               worker, name);
> >-      if (IS_ERR(vtsk))
> >-              goto free_worker;
> >-
> >       mutex_init(&worker->mutex);
> >       init_llist_head(&worker->work_list);
> >       worker->kcov_handle =3D kcov_common_handle();
> >-      worker->vtsk =3D vtsk;
> >-
> >-      vhost_task_start(vtsk);
> >-
> >-      ret =3D xa_alloc(&dev->worker_xa, &id, worker, xa_limit_32b, GFP_=
KERNEL);
> >+      ret =3D ops->create(worker, dev, name);
> >       if (ret < 0)
> >-              goto stop_worker;
> >-      worker->id =3D id;
> >+              goto free_worker;
> >
> >       return worker;
> >
> >-stop_worker:
> >-      vhost_task_stop(vtsk);
> > free_worker:
> >       kfree(worker);
> >       return NULL;
> >diff --git a/drivers/vhost/vhost.h b/drivers/vhost/vhost.h
> >index 19bb94922a0e..98895e299efa 100644
> >--- a/drivers/vhost/vhost.h
> >+++ b/drivers/vhost/vhost.h
> >@@ -26,6 +26,16 @@ struct vhost_work {
> >       unsigned long           flags;
> > };
> >
> >+struct vhost_worker;
> >+struct vhost_dev;
> >+
> >+struct vhost_worker_ops {
> >+      int (*create)(struct vhost_worker *worker, struct vhost_dev *dev,
> >+                    const char *name);
> >+      void (*stop)(struct vhost_worker *worker);
> >+      void (*wakeup)(struct vhost_worker *worker);
> >+};
> >+
> > struct vhost_worker {
> >       struct vhost_task       *vtsk;
> >       struct vhost_dev        *dev;
> >@@ -36,6 +46,7 @@ struct vhost_worker {
> >       u32                     id;
> >       int                     attachment_cnt;
> >       bool                    killed;
> >+      const struct vhost_worker_ops *ops;
> > };
> >
> > /* Poll a file (eventfd or socket) */
> >--
> >2.45.0
> >
>

