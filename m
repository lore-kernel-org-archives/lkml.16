Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B37204581
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 13:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743514917; cv=none; b=HIJV8yqumEjJupX5n+uDkkuNptcmlaANB9SNAt4AWpZYxibKrIVwGT2cbVf0yyuppXuqo/lZF1LbyNPckoHWcgYnQTgNEw8AaShsIk3EIgPji/dj50tdQD2jQ6+J+I7A1G+ZaWaLX+4L6MWa6CWbmUrSi4aY5Xkop7gu/V+qQ6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743514917; c=relaxed/simple;
	bh=9DmKSKgpRK/Ghoozm0xXZsix9t8rCDXOdYOtPeAD78E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rOOpNhbD31lhfx3rEFbeszvxpUdi5nyDEWvbEnWwV5F9Hnbpv7bGcnrh4sN6cGwxoNqvd4aZh/J3g1uvN5DxwViCDJWX3kevRcLtx2hCq0IrqVjPiEOQQOIMzOMm7ogSH1u83tPtHN2moBzvMKGI1hqY28uNMql2VLh85egYV5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Xlc5F694; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xlc5F694"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743514914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JT/1HJ7j1dGnCuukkfDvHYvyoCmZ0J/ymsOhodchoIw=;
	b=Xlc5F694PXS4yqHeNWpHfzQJEoX7L21ad5fcrONdVDOVkbiNWYZ5HQ2ncPL36RWymfL6Cd
	VHw4wB7JViYnwr8+/ZXtXOLT5Ag/VahD6GTPoL2lqejWTwWqN8vWcGR6iIeKvVPt8FlGX2
	YHWfOnkU374ECoq7See9A9USgXyDm8I=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-SdYERicnO-CvxunDbzgGkg-1; Tue, 01 Apr 2025 09:41:52 -0400
X-MC-Unique: SdYERicnO-CvxunDbzgGkg-1
X-Mimecast-MFC-AGG-ID: SdYERicnO-CvxunDbzgGkg_1743514911
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43d209dc2d3so32813375e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 06:41:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743514911; x=1744119711;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JT/1HJ7j1dGnCuukkfDvHYvyoCmZ0J/ymsOhodchoIw=;
        b=m6jG6SfU5VAsr7f1redXkbdT6I9FZP0chxEfy2mQQukWr7u+KhHPGUZ418CqIqt8fF
         mhrI5YqmviGYqeCCc1VXzoA2G42ASMddat5dK/1MAbXFPmfH6KeYcHEyLXBMzfk6yO0J
         t/LplB8yNNC0/jeLHBruiiA7uErN++cBDh5iLsM++KfF8hUX+utxH+y8tcIRszzMdgSG
         /AMs7VLXV5RRm61QgjdnAl7L8rz4jaVGFmtIt/FCribogQ9OGQDOn3KbEVrWbfyp1r9A
         GL6o1TmUlxhYQqpCcr8yVrl2KDK0A2dXMqHbEKs1VQ2f9uElhnA4MeK5i3DBxVUhQmGA
         5x1A==
X-Forwarded-Encrypted: i=1; AJvYcCUPpYurAQE+2NPI+57DLANt4AIO8vLJLY/r2mVOmRDrw2zFobUiH+SDh59RfHdDXW28WVi3wfzdBnhjXfQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYIwBUzNwQzwATuZjUCL5hwe+1d0XSWjexL95EK71CfIE2/bLg
	UEv3aTLJowATP5xTA4+srVuPV+a5Ldu3ZafE3I6chHtiTtPDySLBRngyoBvVsKbZyvHo7juM1YT
	5bTTGRZ5nn5PC4j35hFTBIPoNK+jcdkIR8pbGKNs6BXnHj9EcKU3cMqUHpPl4jk4kE9OIPffr
X-Gm-Gg: ASbGnctD7kV9iX8DbtarmFc9MfX4r0mcC4/vSBkRJ1NT9FA/dQiM1KLm22js23SdrOc
	zmtsZIYjsqc+xbMBVrv344C3KON9Jzy93iFTBWrieV58FB3SGR5Lr1fOaUXlg5PWMt5BiS586aF
	Dmz3/LXwlqh+En48dD7F9tusNxLYq8JnZfMFAuFDJXFD1v86/G/BFz7q18zasbZalN8rjpGC0WD
	aITRGkz0bRPNc8lak06oRHRO0YzBmxbJUAOsULgfwf0m2cphi7piFoHHLj2u4j7vPFvMbRdZwLj
	FqSE/agLSR5z1zV8tqo9lQR3DR+8m0b0XDEbyH9Cp+YWQFeE7EU4BwCHIvQ=
X-Received: by 2002:a05:600c:4705:b0:43d:79:ae1b with SMTP id 5b1f17b1804b1-43db6247e03mr130604265e9.14.1743514910754;
        Tue, 01 Apr 2025 06:41:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOonQsa/shEuP0wDgfiH+HuLEzgbTbno+i+to8l7EiHyrr/1tPYY8WHBx9YFeKuuzvpEHoDA==
X-Received: by 2002:a05:600c:4705:b0:43d:79:ae1b with SMTP id 5b1f17b1804b1-43db6247e03mr130603935e9.14.1743514910230;
        Tue, 01 Apr 2025 06:41:50 -0700 (PDT)
Received: from sgarzare-redhat (host-87-11-6-59.retail.telecomitalia.it. [87.11.6.59])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b79e33asm14333177f8f.66.2025.04.01.06.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 06:41:49 -0700 (PDT)
Date: Tue, 1 Apr 2025 15:41:42 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Cindy Lu <lulu@redhat.com>
Cc: jasowang@redhat.com, mst@redhat.com, michael.christie@oracle.com, 
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org, 
	netdev@vger.kernel.org
Subject: Re: [PATCH v8 3/8] vhost: Add the cgroup related function
Message-ID: <qucbuuwmqlrjhm7t7onoedzldrb2cvixjbjezmcovpo24ttzdx@sde275drep5u>
References: <20250328100359.1306072-1-lulu@redhat.com>
 <20250328100359.1306072-4-lulu@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250328100359.1306072-4-lulu@redhat.com>

On Fri, Mar 28, 2025 at 06:02:47PM +0800, Cindy Lu wrote:
>Add back the previously removed cgroup function to support the kthread

nit: Missing . at the end

>The biggest change for this part is in vhost_attach_cgroups() and
>vhost_attach_task_to_cgroups().
>
>The old function was remove in

nit: s/remove/removed

>commit 6e890c5d5021 ("vhost: use vhost_tasks for worker threads")
>
>Signed-off-by: Cindy Lu <lulu@redhat.com>
>---
> drivers/vhost/vhost.c | 41 +++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 41 insertions(+)

As I mentioned, this patch also has unused functions, but LGTM.

Thanks,
Stefano

>
>diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
>index 9500e85b42ce..20571bd6f7bd 100644
>--- a/drivers/vhost/vhost.c
>+++ b/drivers/vhost/vhost.c
>@@ -22,6 +22,7 @@
> #include <linux/slab.h>
> #include <linux/vmalloc.h>
> #include <linux/kthread.h>
>+#include <linux/cgroup.h>
> #include <linux/module.h>
> #include <linux/sort.h>
> #include <linux/sched/mm.h>
>@@ -620,6 +621,46 @@ long vhost_dev_check_owner(struct vhost_dev *dev)
> }
> EXPORT_SYMBOL_GPL(vhost_dev_check_owner);
>
>+struct vhost_attach_cgroups_struct {
>+	struct vhost_work work;
>+	struct task_struct *owner;
>+	int ret;
>+};
>+
>+static void vhost_attach_cgroups_work(struct vhost_work *work)
>+{
>+	struct vhost_attach_cgroups_struct *s;
>+
>+	s = container_of(work, struct vhost_attach_cgroups_struct, work);
>+	s->ret = cgroup_attach_task_all(s->owner, current);
>+}
>+
>+static int vhost_attach_task_to_cgroups(struct vhost_worker *worker)
>+{
>+	struct vhost_attach_cgroups_struct attach;
>+	int saved_cnt;
>+
>+	attach.owner = current;
>+
>+	vhost_work_init(&attach.work, vhost_attach_cgroups_work);
>+	vhost_worker_queue(worker, &attach.work);
>+
>+	mutex_lock(&worker->mutex);
>+
>+	/*
>+	 * Bypass attachment_cnt check in __vhost_worker_flush:
>+	 * Temporarily change it to INT_MAX to bypass the check
>+	 */
>+	saved_cnt = worker->attachment_cnt;
>+	worker->attachment_cnt = INT_MAX;
>+	__vhost_worker_flush(worker);
>+	worker->attachment_cnt = saved_cnt;
>+
>+	mutex_unlock(&worker->mutex);
>+
>+	return attach.ret;
>+}
>+
> /* Caller should have device mutex */
> bool vhost_dev_has_owner(struct vhost_dev *dev)
> {
>-- 
>2.45.0
>

