Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDEA2046AC
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 13:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743515516; cv=none; b=RI9pyiR5NsvL0YKPb+dhwHeYCoWBOEHlZmhkJGDO8kUkN+Sv4GcQE0Fwg4mxnK35xKbeHBkje3slxzCV7q5oO1RyMQCaD/tjIcChy3CpVaTYT2U+qA86prfCPzdH7FUinDiePqTfx5AmCMFn4HJT7QRNPEME8FjnkoLgadd5+to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743515516; c=relaxed/simple;
	bh=fyJnXBrOut1qI3iVOlrjftIknLYmdN5T3FQdk35b5Ao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pn7iKztKsf+OawO8KesGllsadQ3oM1fq57DRxA1+Hj93/OfAUTv4XpQd45LMAXM3/48NxSRXEBZoVwK7ztPRMc55HRyr5HuWtsC2M9cXMbzVsbmKLHqAzrj3M7n/X8dLleC81OIaYvWaVzdov7OAxXdvs6BNG98+aUIZQjpedCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DXUh2oCq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DXUh2oCq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743515513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yd713vKppQHQbjGvhffkowOQ35Ux0lbgZmPhSE6rLE4=;
	b=DXUh2oCqO1ROUWPH9FsOCb2vIi7aEw9cFXs8Wd2MT//ewVMR1qzWvxWhArg1aEIv+yxneX
	wlr6CmaPzWfj4M8Jz77xLWVIiP7RH2ZQtVWfnI/pkm8yml/cLTKR+Xjrb3mRnCuD61H393
	t/ee6bw7ZWLxrE6cgoPts4yAlnqCFBo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-434-hYkVQnpgOeOvhzPi_pk8Og-1; Tue, 01 Apr 2025 09:51:51 -0400
X-MC-Unique: hYkVQnpgOeOvhzPi_pk8Og-1
X-Mimecast-MFC-AGG-ID: hYkVQnpgOeOvhzPi_pk8Og_1743515510
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43cfda30a3cso35914365e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 06:51:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743515510; x=1744120310;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yd713vKppQHQbjGvhffkowOQ35Ux0lbgZmPhSE6rLE4=;
        b=qdggxKAmvbv8b876akWM21Cv7R9HYJVWWaCad6dYDmWRX6TCoY0G4fkJ5fTlZch9PD
         sFN+G8GXftIY8vOayR0z/9zZS/Ye9cls/JRSJxGInSPR0slEcdlkf+Dd8NR3IX4rqfj8
         K2eNP4R/rxv2J/iqVUBcGL5ymbHjYIMtkuwC9Um1RiPI1jMzidjmtu21Xa0BtQDakshP
         5HdFzFF0iwg3uni74PYiEZBFDIKr8KG3RcezgdBLSqqPHsKvKCczP1iOyr7EFtkNZue8
         gM+BX+vju2zEBwPhR8KA3sgG62Krew+ceTtp7T3k9APY5yUe4c/pTno+LR+kXD5IHT/i
         zsug==
X-Forwarded-Encrypted: i=1; AJvYcCWflDspAAfoXwjHrJmMOXkK0pCWP1BanYjvpl2TP3p0uxzQt85uW+VmNJpHMncnNUFOAy2SrQOjym/qJ+o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtiEnQDi5tbVebIKvAMn7Au6a1xqqB8Z+/J7nUnX9sIFlp5i2S
	niPxBzM4haV4i7UX4HwTlznT65sm7BR8zqDlk/DxExyIGygHIy8eRzPQgmpldoJDnq3bIcfoIgv
	6Eq3Ninema4G7cpJFtEx0xltt+CXSXjNz4a2VP4dwbLVChYl0OwXioNVkcsiV7g==
X-Gm-Gg: ASbGnctFABhq7EZgAcWMQ0mgGQ6ml09ptt4HYIlFfmBJGZkM9ytBPXrpq3mdbS2wVCa
	L4I7KXkKWRXd2qLUSBOQlf2KrQhTTXdKTu2r1KrW7z22DSWLbwMBdyE+THOB+WjdEtqQ2NSiLx9
	Fbc40SDhJYj2PDUneKwIyCAIFk0e4K66tkUVVaZKvG14VYUZieAq+d2hw1B7rUlYYyRwNan6dKb
	qHgYBleJeZdLKAGK3LeKfT+SFGOg4a6rh+Ssx1xeI+xQwF0NDSRqEhVkW3w8CqU5+QAJTYYjRWg
	6eEHTiIzWXGsN4hrbKDXrLWi5rtAGy+5JggZVGZDLAcghQSRSnyY1O3lrgU=
X-Received: by 2002:a5d:5984:0:b0:391:4095:49b7 with SMTP id ffacd0b85a97d-39c120e079amr10530779f8f.25.1743515509942;
        Tue, 01 Apr 2025 06:51:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsBMqSUaVpvZcub9DerZUyAcDAdWPbokGx4MrEDvZ1V89a1sJp60yqYaFeSZ3uq31KHnaDGQ==
X-Received: by 2002:a5d:5984:0:b0:391:4095:49b7 with SMTP id ffacd0b85a97d-39c120e079amr10530760f8f.25.1743515509455;
        Tue, 01 Apr 2025 06:51:49 -0700 (PDT)
Received: from sgarzare-redhat (host-87-11-6-59.retail.telecomitalia.it. [87.11.6.59])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b7a4318sm13937042f8f.87.2025.04.01.06.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 06:51:48 -0700 (PDT)
Date: Tue, 1 Apr 2025 15:51:42 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Cindy Lu <lulu@redhat.com>
Cc: jasowang@redhat.com, mst@redhat.com, michael.christie@oracle.com, 
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org, 
	netdev@vger.kernel.org
Subject: Re: [PATCH v8 5/8] vhost: Reintroduce kthread mode support in vhost
Message-ID: <qtii7gazb52fuvkeiymllkapnd3l3ji6ht7y7cfegybreavmit@h6bvfhwpghg6>
References: <20250328100359.1306072-1-lulu@redhat.com>
 <20250328100359.1306072-6-lulu@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250328100359.1306072-6-lulu@redhat.com>

On Fri, Mar 28, 2025 at 06:02:49PM +0800, Cindy Lu wrote:
>This commit restores the previously removed functions kthread
>wake/stop/create, and use ops structure vhost_worker_ops to
>manage worker wakeup, stop and creation. The function
>vhost_worker_create initializes these ops pointers based on
>the value of inherit_owner
>
>The old function was remove in

nit: s/remove/removed

>commit 6e890c5d5021 ("vhost: use vhost_tasks for worker threads")
>
>Signed-off-by: Cindy Lu <lulu@redhat.com>
>---
> drivers/vhost/vhost.c | 48 ++++++++++++++++++++++++++++++++++++++++++-
> drivers/vhost/vhost.h |  1 +
> 2 files changed, 48 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
>index c162ad772f8f..be97028a8baf 100644
>--- a/drivers/vhost/vhost.c
>+++ b/drivers/vhost/vhost.c
>@@ -734,11 +734,21 @@ static void vhost_task_wakeup(struct vhost_worker *worker)
> 	return vhost_task_wake(worker->vtsk);
> }
>
>+static void vhost_kthread_wakeup(struct vhost_worker *worker)
>+{
>+	wake_up_process(worker->kthread_task);
>+}
>+
> static void vhost_task_do_stop(struct vhost_worker *worker)
> {
> 	return vhost_task_stop(worker->vtsk);
> }
>
>+static void vhost_kthread_do_stop(struct vhost_worker *worker)
>+{
>+	kthread_stop(worker->kthread_task);
>+}
>+
> static int vhost_task_worker_create(struct vhost_worker *worker,
> 				    struct vhost_dev *dev, const char *name)
> {
>@@ -762,6 +772,41 @@ static int vhost_task_worker_create(struct vhost_worker *worker,
> 	return 0;
> }
>
>+static int vhost_kthread_worker_create(struct vhost_worker *worker,
>+				       struct vhost_dev *dev, const char *name)
>+{
>+	struct task_struct *task;
>+	u32 id;
>+	int ret;
>+
>+	task = kthread_create(vhost_run_work_kthread_list, worker, "%s", name);
>+	if (IS_ERR(task))
>+		return PTR_ERR(task);
>+
>+	worker->kthread_task = task;
>+	wake_up_process(task);
>+	ret = xa_alloc(&dev->worker_xa, &id, worker, xa_limit_32b, GFP_KERNEL);
>+	if (ret < 0)
>+		goto stop_worker;
>+
>+	ret = vhost_attach_task_to_cgroups(worker);
>+	if (ret)
>+		goto stop_worker;
>+
>+	worker->id = id;
>+	return 0;
>+
>+stop_worker:
>+	vhost_kthread_do_stop(worker);
>+	return ret;
>+}
>+
>+static const struct vhost_worker_ops kthread_ops = {
>+	.create = vhost_kthread_worker_create,
>+	.stop = vhost_kthread_do_stop,
>+	.wakeup = vhost_kthread_wakeup,
>+};
>+
> static const struct vhost_worker_ops vhost_task_ops = {
> 	.create = vhost_task_worker_create,
> 	.stop = vhost_task_do_stop,
>@@ -773,7 +818,8 @@ static struct vhost_worker *vhost_worker_create(struct vhost_dev *dev)
> 	struct vhost_worker *worker;
> 	char name[TASK_COMM_LEN];
> 	int ret;
>-	const struct vhost_worker_ops *ops = &vhost_task_ops;
>+	const struct vhost_worker_ops *ops =
>+		dev->inherit_owner ? &vhost_task_ops : &kthread_ops;
>
> 	worker = kzalloc(sizeof(*worker), GFP_KERNEL_ACCOUNT);
> 	if (!worker)
>diff --git a/drivers/vhost/vhost.h b/drivers/vhost/vhost.h
>index 98895e299efa..af4b2f7d3b91 100644
>--- a/drivers/vhost/vhost.h
>+++ b/drivers/vhost/vhost.h
>@@ -37,6 +37,7 @@ struct vhost_worker_ops {
> };
>
> struct vhost_worker {
>+	struct task_struct *kthread_task;
                           ^
nit: I'm not a fan of tabs, but here all the other fields have it, so I 
would put it in.

> 	struct vhost_task	*vtsk;
> 	struct vhost_dev	*dev;
> 	/* Used to serialize device wide flushing with worker swapping. */
>-- 
>2.45.0
>

The patch LGTM:

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

