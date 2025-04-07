Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DBC82D91
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 08:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744013367; cv=none; b=NqNJX1GUhc8Px6xXr8dyXA4dZD6hrYQvmmRwYhEaIxN6id/GUIUOWtpi01HUxbHA9BKnm0leWLXpSmkYAyo4T6zh/zS43evRlIReF67HIrB0n6Egx1caVIKoLd/XNwo3BWEOuqhhxwcE3chVwog5qnWkFmUkk/RhyScV/XaxAAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744013367; c=relaxed/simple;
	bh=AIcU3qGQw0vyLqEK981tZMF9Tv1Bj8Bx9LH29b6ile8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V+6t7zKun4sx0IwUOiYjH/CbSs9eeg15y+3hgx6Mg74iaXloB8u4zHa3Qlm9xKwJDxAVhLU5o1WWZU4kxK6eY+zSIIFEs0ZRDrVFFrsFkLUSBnGPTNdmRHXVDWTqbrpmyV8eVfvLaqETZGhRQHKQY/p9QCgzOZSGQmRfbRVE69c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dLbomTfJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dLbomTfJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744013364;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=25iyDw7sQyJUYeKPA+oSXr49j9oc0JtsKm/C1RWwbCM=;
	b=dLbomTfJN9bfAfCm+jl6XtNfXvhUHGYxqnv/rLq2965n8i1OqNV9IoYQhiNZTycVBAdkRp
	5h1SC53lsL0AJVJVS+xyqn1CWF40bnszlNgthVlKfB5NwIXRcKQ4xzjQeYXDrivVWOfQDp
	a7nwQ7P3QjbPPZ+r3NRylAKL+ry75+Y=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-265-6Kwft1LBPB6At1DVA4ooyQ-1; Mon, 07 Apr 2025 04:09:23 -0400
X-MC-Unique: 6Kwft1LBPB6At1DVA4ooyQ-1
X-Mimecast-MFC-AGG-ID: 6Kwft1LBPB6At1DVA4ooyQ_1744013363
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-6f2a2ab50f6so58046167b3.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 01:09:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744013363; x=1744618163;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=25iyDw7sQyJUYeKPA+oSXr49j9oc0JtsKm/C1RWwbCM=;
        b=JIpiIIN2MONu3ID47QINjc2NKikuBjYSubpZYYo652E+7XEMQxW6T74E2rx7fydPKH
         btuOZWL5YihZ9xOfbIe8M3n3dNTi+AItOAqAN8kBRfvSUcsqb50OTzIGJyypuV+dCGAI
         knYsXymQnPQZ8oyZcTaj7s3j833DPZ9NgguxPFyroxXFfVpjmUwB7nQMX2LYk7MczwxB
         7gLannESlFSfthg1Wc4SWN+mA6S5CEF5PRiIw1mLxXWTOfnl4hsgslliLtjJgIYCpl5M
         ZCzcSqcn86ZPoSzC8e29b2ohty2/UY4lpYfkfEWIKgvVBJh6s0g7Y3uaq1bWJEVBgPsA
         hATw==
X-Forwarded-Encrypted: i=1; AJvYcCW60Uk4pbC/0FkqSvN76NCFkI1J4O04awbMPBVUCQlQJjJH2n0OMQSOltm5afRgsNzdITfvX7AkZX6N2Bg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmo3EepEEs6ULU01bzTzTIGDVt6yTn5kmIU+ZWlgNrN5yp+Zve
	Y2HpP1RQ5+qa9xW5MYwiQWMsTrtvGixIh0nWo7ylA1xakyhebm44c8R0FkGvcxqK4VpD1vXNTCL
	s5MQbZjvuZoGwNqa3CAaWCVgtqg66vC3IT2MZ60e4YtmDxI5wAWbAfycOdy4FMmgnseV2Yc4/M3
	qZlkuqzR+1rxFWzNqiSm5ONjHVzaXkFSG6orAI
X-Gm-Gg: ASbGnct1enSx/bfCDglsHHKKIGCNVBeqNK0pdR3U/zQy4l+97E/p42BEsFcMQxXZ/EO
	YGcxFRNRUxn+QarlspeH2do4bmT70d+q20YKt9TDQsjYUvIQI1KNRsZQ1OKVwG4I4soxSQF0=
X-Received: by 2002:a05:690c:7011:b0:6fb:a4e6:7d52 with SMTP id 00721157ae682-703e1625d65mr224051547b3.35.1744013362966;
        Mon, 07 Apr 2025 01:09:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGb7hTIHt+NuAmVBBXpHYp02iOd0Zq7ltlx2Dmrw3wGkGid4PjxSlXl7aFHxqXXb8FYdr8XlOdtIB0TH3sudVc=
X-Received: by 2002:a05:690c:7011:b0:6fb:a4e6:7d52 with SMTP id
 00721157ae682-703e1625d65mr224051167b3.35.1744013362628; Mon, 07 Apr 2025
 01:09:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250328100359.1306072-1-lulu@redhat.com> <20250328100359.1306072-5-lulu@redhat.com>
 <3hsgi4a2kj5fg65zz7q463ypxbstf2x73avupayyrexjonkheo@utoyktego6as> <CACLfguV5v8Pm9=+0jkDnZFLp-MiyoYT=cFsA2rqeVgNJ2O7zvQ@mail.gmail.com>
In-Reply-To: <CACLfguV5v8Pm9=+0jkDnZFLp-MiyoYT=cFsA2rqeVgNJ2O7zvQ@mail.gmail.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Mon, 7 Apr 2025 10:09:11 +0200
X-Gm-Features: ATxdqUGcClEaKZlXIh_kQkwLsnROHag_isA2bwLbYX3EtHi3Lr3hxio_8weYAPw
Message-ID: <CAGxU2F5mCHdByvcuj8SOiXCj+MtD5=GM4yEprpeiDU8ZZAVsLw@mail.gmail.com>
Subject: Re: [PATCH v8 4/8] vhost: Introduce vhost_worker_ops in vhost_worker
To: Cindy Lu <lulu@redhat.com>
Cc: jasowang@redhat.com, mst@redhat.com, michael.christie@oracle.com, 
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 7 Apr 2025 at 05:14, Cindy Lu <lulu@redhat.com> wrote:
>
> On Tue, Apr 1, 2025 at 9:48=E2=80=AFPM Stefano Garzarella <sgarzare@redha=
t.com> wrote:
> >
> > On Fri, Mar 28, 2025 at 06:02:48PM +0800, Cindy Lu wrote:
> > >Abstract vhost worker operations (create/stop/wakeup) into an ops
> > >structure to prepare for kthread mode support.
> > >
> > >Signed-off-by: Cindy Lu <lulu@redhat.com>
> > >---
> > > drivers/vhost/vhost.c | 63 ++++++++++++++++++++++++++++++------------=
-
> > > drivers/vhost/vhost.h | 11 ++++++++
> > > 2 files changed, 56 insertions(+), 18 deletions(-)
> > >
> > >diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
> > >index 20571bd6f7bd..c162ad772f8f 100644
> > >--- a/drivers/vhost/vhost.c
> > >+++ b/drivers/vhost/vhost.c
> > >@@ -243,7 +243,7 @@ static void vhost_worker_queue(struct vhost_worker=
 *worker,
> > >                * test_and_set_bit() implies a memory barrier.
> > >                */
> > >               llist_add(&work->node, &worker->work_list);
> > >-              vhost_task_wake(worker->vtsk);
> > >+              worker->ops->wakeup(worker);
> > >       }
> > > }
> > >
> > >@@ -706,7 +706,7 @@ static void vhost_worker_destroy(struct vhost_dev =
*dev,
> > >
> > >       WARN_ON(!llist_empty(&worker->work_list));
> > >       xa_erase(&dev->worker_xa, worker->id);
> > >-      vhost_task_stop(worker->vtsk);
> > >+      worker->ops->stop(worker);
> > >       kfree(worker);
> > > }
> > >
> > >@@ -729,42 +729,69 @@ static void vhost_workers_free(struct vhost_dev =
*dev)
> > >       xa_destroy(&dev->worker_xa);
> > > }
> > >
> > >+static void vhost_task_wakeup(struct vhost_worker *worker)
> > >+{
> > >+      return vhost_task_wake(worker->vtsk);
> > >+}
> > >+
> > >+static void vhost_task_do_stop(struct vhost_worker *worker)
> > >+{
> > >+      return vhost_task_stop(worker->vtsk);
> > >+}
> > >+
> > >+static int vhost_task_worker_create(struct vhost_worker *worker,
> > >+                                  struct vhost_dev *dev, const char *=
name)
> > >+{
> > >+      struct vhost_task *vtsk;
> > >+      u32 id;
> > >+      int ret;
> > >+
> > >+      vtsk =3D vhost_task_create(vhost_run_work_list, vhost_worker_ki=
lled,
> > >+                               worker, name);
> > >+      if (IS_ERR(vtsk))
> > >+              return PTR_ERR(vtsk);
> > >+
> > >+      worker->vtsk =3D vtsk;
> > >+      vhost_task_start(vtsk);
> > >+      ret =3D xa_alloc(&dev->worker_xa, &id, worker, xa_limit_32b, GF=
P_KERNEL);
> > >+      if (ret < 0) {
> > >+              vhost_task_do_stop(worker);
> > >+              return ret;
> > >+      }
> >
> > In the final code, xa_alloc() is duplicated among the functions that
> > create ktrhead or task, might it make sense to leave it out and do it i=
n
> > vhost_worker_create() ?
> >
> > Thanks,
> > Stefano
> >
> Thanks a lot Stefano. I previously tried moving xa_alloc() out, but
> that made the code strange.
> I think keeping xa_alloc() in the create_ops function completes the
> job in  a single function, and maybe it could be used in some other
> functions in the future

Sure, if you tried, and it doesn't add benefits, that's perfectly fine
to ignore this suggestion! ;-)

Thanks,
Stefano

> thanks
> cindy
>
> > >+      worker->id =3D id;
> > >+      return 0;
> > >+}
> > >+
> > >+static const struct vhost_worker_ops vhost_task_ops =3D {
> > >+      .create =3D vhost_task_worker_create,
> > >+      .stop =3D vhost_task_do_stop,
> > >+      .wakeup =3D vhost_task_wakeup,
> > >+};
> > >+
> > > static struct vhost_worker *vhost_worker_create(struct vhost_dev *dev=
)
> > > {
> > >       struct vhost_worker *worker;
> > >-      struct vhost_task *vtsk;
> > >       char name[TASK_COMM_LEN];
> > >       int ret;
> > >-      u32 id;
> > >+      const struct vhost_worker_ops *ops =3D &vhost_task_ops;
> > >
> > >       worker =3D kzalloc(sizeof(*worker), GFP_KERNEL_ACCOUNT);
> > >       if (!worker)
> > >               return NULL;
> > >
> > >       worker->dev =3D dev;
> > >+      worker->ops =3D ops;
> > >       snprintf(name, sizeof(name), "vhost-%d", current->pid);
> > >
> > >-      vtsk =3D vhost_task_create(vhost_run_work_list, vhost_worker_ki=
lled,
> > >-                               worker, name);
> > >-      if (IS_ERR(vtsk))
> > >-              goto free_worker;
> > >-
> > >       mutex_init(&worker->mutex);
> > >       init_llist_head(&worker->work_list);
> > >       worker->kcov_handle =3D kcov_common_handle();
> > >-      worker->vtsk =3D vtsk;
> > >-
> > >-      vhost_task_start(vtsk);
> > >-
> > >-      ret =3D xa_alloc(&dev->worker_xa, &id, worker, xa_limit_32b, GF=
P_KERNEL);
> > >+      ret =3D ops->create(worker, dev, name);
> > >       if (ret < 0)
> > >-              goto stop_worker;
> > >-      worker->id =3D id;
> > >+              goto free_worker;
> > >
> > >       return worker;
> > >
> > >-stop_worker:
> > >-      vhost_task_stop(vtsk);
> > > free_worker:
> > >       kfree(worker);
> > >       return NULL;
> > >diff --git a/drivers/vhost/vhost.h b/drivers/vhost/vhost.h
> > >index 19bb94922a0e..98895e299efa 100644
> > >--- a/drivers/vhost/vhost.h
> > >+++ b/drivers/vhost/vhost.h
> > >@@ -26,6 +26,16 @@ struct vhost_work {
> > >       unsigned long           flags;
> > > };
> > >
> > >+struct vhost_worker;
> > >+struct vhost_dev;
> > >+
> > >+struct vhost_worker_ops {
> > >+      int (*create)(struct vhost_worker *worker, struct vhost_dev *de=
v,
> > >+                    const char *name);
> > >+      void (*stop)(struct vhost_worker *worker);
> > >+      void (*wakeup)(struct vhost_worker *worker);
> > >+};
> > >+
> > > struct vhost_worker {
> > >       struct vhost_task       *vtsk;
> > >       struct vhost_dev        *dev;
> > >@@ -36,6 +46,7 @@ struct vhost_worker {
> > >       u32                     id;
> > >       int                     attachment_cnt;
> > >       bool                    killed;
> > >+      const struct vhost_worker_ops *ops;
> > > };
> > >
> > > /* Poll a file (eventfd or socket) */
> > >--
> > >2.45.0
> > >
> >
>

