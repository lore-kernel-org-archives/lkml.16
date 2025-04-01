Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA6D204C34
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 13:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743515303; cv=none; b=C6LFZmDgWOsNipW0lKyVR5AaWoQ8Inejgef41eLJJ/ktAVYsAcY4XPNO8I0seH1cyLV1f5dShXsOqBdxCfjDxUFxaJi1WDK2II7/396r7HXwmvn8NZUkk5/dqUBj1uwGzHAOJW5jRcTVWiM2/NLn+V1nfUbHQ6SsvbY7+oFkEgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743515303; c=relaxed/simple;
	bh=ZXVTBdQxmjCjU3ulgpfsPSQCkooAmJuUdjJcSaB1g1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sKQZGycT5YNEsZPJrQe1sWll7MjJ7kCWUw35VLFnQ715VYQ/TDoSiBsi7Eq/OhWSR7Z5wlX7v+xjakn4+daKq7Oi37OEkt7ixucPcxeB50YaeMg20K4rBEWOvJTXHoZCF/CEtdcqDcbLwEfoRRwE4ruAYYowWG8icuBqej21WHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DJw7xLHD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DJw7xLHD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743515300;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R7GU5F4nSqJyry11vrhXMIOMNpBvoJMOeaJENZ/IuO4=;
	b=DJw7xLHDbKx9hCGrp+EboLvMcraxg1N0Uh+LIQoIGeSC9m68pSRgQu3zpr8ZF6bLD9icuk
	1x5Z+c2b4MoodBgqFzdjMwiqDu4RfsgQU3bGOkAnvxehDwvBCCsDjDzuBYzGWdCEh8V2dx
	zWhOktTKBoD5bH+8ulG9iZ70e/gAYMk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-500-frHXqaLhPpKAcHSQKmpAMA-1; Tue, 01 Apr 2025 09:48:19 -0400
X-MC-Unique: frHXqaLhPpKAcHSQKmpAMA-1
X-Mimecast-MFC-AGG-ID: frHXqaLhPpKAcHSQKmpAMA_1743515298
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43ceb011ea5so39807405e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 06:48:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743515298; x=1744120098;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R7GU5F4nSqJyry11vrhXMIOMNpBvoJMOeaJENZ/IuO4=;
        b=dftKZy4R/LfE8TjH3noq023C1DkjFmnGa/dLQ7n/VhDDbZDIKvB8yyfWCBO8RHULJn
         bANOg4zar+Hggvthh+n1tDPhypw0dV2fkHWFezWzLTEC3ZWR+PNDhxNKLWn8mo9cCsRN
         7rMGxVe9QAgRADvRt++ZICdDzrinJYqht6CF0Hdqz2fXeEpoGUb8O8ATSybbBtQe2KHD
         T0rfYE0StAeqG81FPt3ziTim1GnQMKCsih2KeBAs+HbSmRiNu/aJpipxq8BY7gopqFVc
         50cB51d5MVdLdaaoBsAIeWqkhRkrpeKMXC9p1oK8gMmzCDLleuBwtk6/QufU5XPvthtS
         VIfw==
X-Forwarded-Encrypted: i=1; AJvYcCViP9ThNcxVzfd7U3lzMCu4KgUyo8wAFyb7Wq0q9g7OOTWFhQGMr8zt82cOu9s2XdsDLDP1IJ8xu67Efjw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJXd1wuFV7Qhxk80C4EFS5cWoFXanR9eBnAw+8VjfqTSpHiyq2
	TcJej14vgiWDgAOyfwQ8ZpztVeeTklA/UAgdk0+ny4ZoNDfHWkyNSV2D/ZLM3JAUb5PzRkszVTj
	Uy+SXemWphCoPdnuugufthUpA7PL80CNxkeXGMM5tAiRoFAnHaIMylbCX63auyQ==
X-Gm-Gg: ASbGncuSr4COxEoH0/MNsGlAupHAtUIDZHCVqLbk3Rh8GmGybZJ9Nz2VkfRkw+My8vr
	ZMwQAm3QkFfmqZhvE3xG6+LEL/VlOOm6dMVxZKBtTRSB/5+Ml31FZ5vtSQXIGMEPWDlm1lNoDxd
	yyU5suYDTisAHl3WIs4J+buOsE5CN6gCgYKyLQO9eY5OHxIjbuqAbPgF4TPHnK6wKQMErg3+jak
	pxpJHdhecUuIU3n3bAZew+/JOPQxfgJ+g9JcdiuoGeVGDiGoviRXWHb27DMLyzzW1UNYAEfV76s
	T6o+Ir3m/DQcqZd2M6sDB+vJo32dYgb0byWhax8dpnwhgdzLNIKm6PyMWYk=
X-Received: by 2002:a5d:5848:0:b0:390:fe8b:f442 with SMTP id ffacd0b85a97d-39c12119cc3mr9449914f8f.54.1743515297744;
        Tue, 01 Apr 2025 06:48:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHwq+RFHEcdC7l4xxfCK53cCh/ZW01zsvBzyQxNNavy2YTN7WUbI12TI74GK5OqAFQc28skQ==
X-Received: by 2002:a5d:5848:0:b0:390:fe8b:f442 with SMTP id ffacd0b85a97d-39c12119cc3mr9449891f8f.54.1743515297292;
        Tue, 01 Apr 2025 06:48:17 -0700 (PDT)
Received: from sgarzare-redhat (host-87-11-6-59.retail.telecomitalia.it. [87.11.6.59])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0dcc66a4sm13129284f8f.42.2025.04.01.06.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 06:48:16 -0700 (PDT)
Date: Tue, 1 Apr 2025 15:48:12 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Cindy Lu <lulu@redhat.com>
Cc: jasowang@redhat.com, mst@redhat.com, michael.christie@oracle.com, 
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org, 
	netdev@vger.kernel.org
Subject: Re: [PATCH v8 4/8] vhost: Introduce vhost_worker_ops in vhost_worker
Message-ID: <3hsgi4a2kj5fg65zz7q463ypxbstf2x73avupayyrexjonkheo@utoyktego6as>
References: <20250328100359.1306072-1-lulu@redhat.com>
 <20250328100359.1306072-5-lulu@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250328100359.1306072-5-lulu@redhat.com>

On Fri, Mar 28, 2025 at 06:02:48PM +0800, Cindy Lu wrote:
>Abstract vhost worker operations (create/stop/wakeup) into an ops
>structure to prepare for kthread mode support.
>
>Signed-off-by: Cindy Lu <lulu@redhat.com>
>---
> drivers/vhost/vhost.c | 63 ++++++++++++++++++++++++++++++-------------
> drivers/vhost/vhost.h | 11 ++++++++
> 2 files changed, 56 insertions(+), 18 deletions(-)
>
>diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
>index 20571bd6f7bd..c162ad772f8f 100644
>--- a/drivers/vhost/vhost.c
>+++ b/drivers/vhost/vhost.c
>@@ -243,7 +243,7 @@ static void vhost_worker_queue(struct vhost_worker *worker,
> 		 * test_and_set_bit() implies a memory barrier.
> 		 */
> 		llist_add(&work->node, &worker->work_list);
>-		vhost_task_wake(worker->vtsk);
>+		worker->ops->wakeup(worker);
> 	}
> }
>
>@@ -706,7 +706,7 @@ static void vhost_worker_destroy(struct vhost_dev *dev,
>
> 	WARN_ON(!llist_empty(&worker->work_list));
> 	xa_erase(&dev->worker_xa, worker->id);
>-	vhost_task_stop(worker->vtsk);
>+	worker->ops->stop(worker);
> 	kfree(worker);
> }
>
>@@ -729,42 +729,69 @@ static void vhost_workers_free(struct vhost_dev *dev)
> 	xa_destroy(&dev->worker_xa);
> }
>
>+static void vhost_task_wakeup(struct vhost_worker *worker)
>+{
>+	return vhost_task_wake(worker->vtsk);
>+}
>+
>+static void vhost_task_do_stop(struct vhost_worker *worker)
>+{
>+	return vhost_task_stop(worker->vtsk);
>+}
>+
>+static int vhost_task_worker_create(struct vhost_worker *worker,
>+				    struct vhost_dev *dev, const char *name)
>+{
>+	struct vhost_task *vtsk;
>+	u32 id;
>+	int ret;
>+
>+	vtsk = vhost_task_create(vhost_run_work_list, vhost_worker_killed,
>+				 worker, name);
>+	if (IS_ERR(vtsk))
>+		return PTR_ERR(vtsk);
>+
>+	worker->vtsk = vtsk;
>+	vhost_task_start(vtsk);
>+	ret = xa_alloc(&dev->worker_xa, &id, worker, xa_limit_32b, GFP_KERNEL);
>+	if (ret < 0) {
>+		vhost_task_do_stop(worker);
>+		return ret;
>+	}

In the final code, xa_alloc() is duplicated among the functions that 
create ktrhead or task, might it make sense to leave it out and do it in 
vhost_worker_create() ?

Thanks,
Stefano

>+	worker->id = id;
>+	return 0;
>+}
>+
>+static const struct vhost_worker_ops vhost_task_ops = {
>+	.create = vhost_task_worker_create,
>+	.stop = vhost_task_do_stop,
>+	.wakeup = vhost_task_wakeup,
>+};
>+
> static struct vhost_worker *vhost_worker_create(struct vhost_dev *dev)
> {
> 	struct vhost_worker *worker;
>-	struct vhost_task *vtsk;
> 	char name[TASK_COMM_LEN];
> 	int ret;
>-	u32 id;
>+	const struct vhost_worker_ops *ops = &vhost_task_ops;
>
> 	worker = kzalloc(sizeof(*worker), GFP_KERNEL_ACCOUNT);
> 	if (!worker)
> 		return NULL;
>
> 	worker->dev = dev;
>+	worker->ops = ops;
> 	snprintf(name, sizeof(name), "vhost-%d", current->pid);
>
>-	vtsk = vhost_task_create(vhost_run_work_list, vhost_worker_killed,
>-				 worker, name);
>-	if (IS_ERR(vtsk))
>-		goto free_worker;
>-
> 	mutex_init(&worker->mutex);
> 	init_llist_head(&worker->work_list);
> 	worker->kcov_handle = kcov_common_handle();
>-	worker->vtsk = vtsk;
>-
>-	vhost_task_start(vtsk);
>-
>-	ret = xa_alloc(&dev->worker_xa, &id, worker, xa_limit_32b, GFP_KERNEL);
>+	ret = ops->create(worker, dev, name);
> 	if (ret < 0)
>-		goto stop_worker;
>-	worker->id = id;
>+		goto free_worker;
>
> 	return worker;
>
>-stop_worker:
>-	vhost_task_stop(vtsk);
> free_worker:
> 	kfree(worker);
> 	return NULL;
>diff --git a/drivers/vhost/vhost.h b/drivers/vhost/vhost.h
>index 19bb94922a0e..98895e299efa 100644
>--- a/drivers/vhost/vhost.h
>+++ b/drivers/vhost/vhost.h
>@@ -26,6 +26,16 @@ struct vhost_work {
> 	unsigned long		flags;
> };
>
>+struct vhost_worker;
>+struct vhost_dev;
>+
>+struct vhost_worker_ops {
>+	int (*create)(struct vhost_worker *worker, struct vhost_dev *dev,
>+		      const char *name);
>+	void (*stop)(struct vhost_worker *worker);
>+	void (*wakeup)(struct vhost_worker *worker);
>+};
>+
> struct vhost_worker {
> 	struct vhost_task	*vtsk;
> 	struct vhost_dev	*dev;
>@@ -36,6 +46,7 @@ struct vhost_worker {
> 	u32			id;
> 	int			attachment_cnt;
> 	bool			killed;
>+	const struct vhost_worker_ops *ops;
> };
>
> /* Poll a file (eventfd or socket) */
>-- 
>2.45.0
>

