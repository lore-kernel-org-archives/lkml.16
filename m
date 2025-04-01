Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E5C2045BC
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 13:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743514696; cv=none; b=SI0BgpxYo8+M38V5T8o91VLZOH3si3oqpy8Ij2l5qZ6yh8DE4nhpRK9hhs80c/vNQuxLlDW9zBovK8sCbuVeU+VTNAjaBin9ZZ3W/cEdb/OFjEuqHM7UmuuDnevsVhkYTSW/dt3OerWvN9YKZhQKnNTgpyw7sXza2r7vEH66yvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743514696; c=relaxed/simple;
	bh=Tv6jLPBrzNjMWpo+/OOUTUfL/0e584MxIOISNnV7p8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tl55gfpwCpySeMLWi7d6C/va3yMQ2ULq2NvuuldNY1OWcb6p1XO3UbFW0ubhkvnIMgr7DcdRkfF39d8kbjOGvFYAx2fuS+UHHCfa+yHJxtgb1ap1zCGNHd1B09cKfZGSzD2ALRinKc6mU5YL3ewiDyVzBjXBQjZ5Yz+fe1/dDWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EwmHzA7m; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EwmHzA7m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743514692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PLR2CTlKlBh1tBHT4me7CSz9I+6Wecczia3M942yG/Q=;
	b=EwmHzA7mxWBoSMPd4/jKGQ19A23vs6TRB4LTsBMl7uhhmEk1APqnsv4ocCVfbqNrh8VAVY
	IBI0iUJ63PRWTQx9XHJNaPXDk+68yOS8VMo+pntb5xJjLW3yQ/pJ7g5++LTcYFwk2GZjc8
	L8d+T3UjylumRrVv0Ub6lMGnwN5z43c=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-274-XR1hih__PFurI1Wq9gGB1A-1; Tue, 01 Apr 2025 09:38:12 -0400
X-MC-Unique: XR1hih__PFurI1Wq9gGB1A-1
X-Mimecast-MFC-AGG-ID: XR1hih__PFurI1Wq9gGB1A_1743514691
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3913f546dfdso2921160f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 06:38:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743514690; x=1744119490;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PLR2CTlKlBh1tBHT4me7CSz9I+6Wecczia3M942yG/Q=;
        b=GoiCn8IQ/m/toN0QBbxGfOKHAYNVEjvB9zG4ketCQ71RHLrJ7v7VhWhbr/PjKH3zLA
         Og1dErrcs04+Ou2uUHU9Euv7vYvp+i+HvM81pnw08nf+vLnvRrw23ITmgX7cZXvd4wy7
         /Mldf50wdt+PRynQnS20Qb0/3MDmhLtIA3pKuUCHC66jaZgijuUmf/hdj1CUPmp7YQMB
         rAPagQm4HAZdNranMLF9m4ybb3sNrqSSXVNyvtKesPpEtqCq6El7ae6/nH9L6t0CMNgN
         zUNtLyFUjofV4aPQzw4AH901JrBRj8kB5Xy0jgDobwFHsCvB4fvfoGdpN2G5oGa7n5hl
         tYug==
X-Forwarded-Encrypted: i=1; AJvYcCUKLnr/PNX8j6JzLvIR8FkBhxm/F41MTC7cM8PkXQydXnC609AOG/KeWfQnp7DDLXZK1/ZySgQ0OfUUobA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZf/mmtgurV/WR3ia+0lR745s+FWsTDhfgrMExjebPJiykgW0+
	YcuY1sGe+v5dwCT4QldbDG5AbkDCNN/KEwxipRreK2512uUiVgCE1KkxXtBTynzh/KhiIqqMrux
	vRRPAwh3cesUgcIvggtskwljNKXMvZisTrp2P/Mrfi6m8WAu+mB0RwNYz/7p7yPbZ8X1wWAVT
X-Gm-Gg: ASbGncuwju+AUjeV15t4aOWiexwAD8MV0Hay7cKAxz4UGQFm5NV3RcgC0Dvn+khlSdW
	OyE1cjabb7gOZDXdp3Xb9IjVDg+8E33SKYyb5hY/sPA2LuJEyQ2/KYbspaDbUOBbfNM001j0zsp
	+1RnPzTfsSH0onq824s18KBNfiGhvEs0wz4hflF1Jt3c9cO6QqCbcMiTHux9k00t4dXSuBiRzXJ
	YrdL7jGYspfwqtYYmyTn5D10Z7zrSBB5BHwI2I7raAC8wvC4ISucLLFwyauL1PdkiTxKsb45CrA
	M1LC4kWZlMXzyI4MqJAslarZALYLlOhsoyK5N9Lswv9kszhaVGxgmWwQUa4=
X-Received: by 2002:a05:6000:40ce:b0:399:6ad6:34 with SMTP id ffacd0b85a97d-39c12118e33mr10038709f8f.35.1743514689977;
        Tue, 01 Apr 2025 06:38:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGlZRmu/hwz3PRTRaavlDQia8G1V08A9rc2gfYG8uSPBATLZEqFZ5bYSvbtyXL7+/sXwDad3g==
X-Received: by 2002:a05:6000:40ce:b0:399:6ad6:34 with SMTP id ffacd0b85a97d-39c12118e33mr10038680f8f.35.1743514689549;
        Tue, 01 Apr 2025 06:38:09 -0700 (PDT)
Received: from sgarzare-redhat (host-87-11-6-59.retail.telecomitalia.it. [87.11.6.59])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b6588d0sm13944756f8f.7.2025.04.01.06.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 06:38:08 -0700 (PDT)
Date: Tue, 1 Apr 2025 15:38:02 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Cindy Lu <lulu@redhat.com>
Cc: jasowang@redhat.com, mst@redhat.com, michael.christie@oracle.com, 
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org, 
	netdev@vger.kernel.org
Subject: Re: [PATCH v8 2/8] vhost: Reintroduce vhost_worker to support kthread
Message-ID: <ylnfh4mwifvrnmlwpg6g4mjtfzc7z5qvn5hnnvxz6cepbkobcg@hsv3z2yp5w3f>
References: <20250328100359.1306072-1-lulu@redhat.com>
 <20250328100359.1306072-3-lulu@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250328100359.1306072-3-lulu@redhat.com>

On Fri, Mar 28, 2025 at 06:02:46PM +0800, Cindy Lu wrote:
>Add the previously removed function vhost_worker() back
>to support the kthread and rename it to vhost_run_work_kthread_list.
>
>The old function vhost_worker was change to support task in

nit: s/change/changed

>commit 6e890c5d5021 ("vhost: use vhost_tasks for worker threads")
>change to xarray in
>commit 1cdaafa1b8b4 ("vhost: replace single worker pointer with xarray")
>
>Signed-off-by: Cindy Lu <lulu@redhat.com>
>---
> drivers/vhost/vhost.c | 38 ++++++++++++++++++++++++++++++++++++++
> 1 file changed, 38 insertions(+)

I tried to build commit by commit (mainly to check bisection), and I
discovered that nowdays unused functions produce an error (yes, we can 
mute it for example by setting CONFIG_WERROR to N), but I wanted to 
point it out:

../drivers/vhost/vhost.c:391:12: error: ‘vhost_run_work_kthread_list’ defined but not used [-Werror=unused-function]
   391 | static int vhost_run_work_kthread_list(void *data)

So not sure if we need to squash this where we use it.

Same issue also for the next 2 patches.

Thanks,
Stefano

>
>diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
>index 250dc43f1786..9500e85b42ce 100644
>--- a/drivers/vhost/vhost.c
>+++ b/drivers/vhost/vhost.c
>@@ -388,6 +388,44 @@ static void vhost_vq_reset(struct vhost_dev *dev,
> 	__vhost_vq_meta_reset(vq);
> }
>
>+static int vhost_run_work_kthread_list(void *data)
>+{
>+	struct vhost_worker *worker = data;
>+	struct vhost_work *work, *work_next;
>+	struct vhost_dev *dev = worker->dev;
>+	struct llist_node *node;
>+
>+	kthread_use_mm(dev->mm);
>+
>+	for (;;) {
>+		/* mb paired w/ kthread_stop */
>+		set_current_state(TASK_INTERRUPTIBLE);
>+
>+		if (kthread_should_stop()) {
>+			__set_current_state(TASK_RUNNING);
>+			break;
>+		}
>+		node = llist_del_all(&worker->work_list);
>+		if (!node)
>+			schedule();
>+
>+		node = llist_reverse_order(node);
>+		/* make sure flag is seen after deletion */
>+		smp_wmb();
>+		llist_for_each_entry_safe(work, work_next, node, node) {
>+			clear_bit(VHOST_WORK_QUEUED, &work->flags);
>+			__set_current_state(TASK_RUNNING);
>+			kcov_remote_start_common(worker->kcov_handle);
>+			work->fn(work);
>+			kcov_remote_stop();
>+			cond_resched();
>+		}
>+	}
>+	kthread_unuse_mm(dev->mm);
>+
>+	return 0;
>+}
>+
> static bool vhost_run_work_list(void *data)
> {
> 	struct vhost_worker *worker = data;
>-- 
>2.45.0
>

