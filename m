Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F19C1E3DE8
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 09:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750325514; cv=none; b=iLAayqgpPMkIrRXKuBdgqigk+Vm3Y/rDUzlIcoqHoAZxNtthO/e8w+5P2oSogNCs7gA0IwTciTN91aLzlb+odC7XUF/zXZVxJlywwdadJxMif0amZStzmZM26PI12eXNoFbgt/snvngKnwd6LPoWAj3DpPqXd9irRzPx/2bOfVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750325514; c=relaxed/simple;
	bh=qzMUaqnOLX+ANKhFdcWfG2nmVXkaSn55wfgQ7HyL7TU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eIFdeofcJYG/F5GGlM5XCFZ353puHb5OGhnFvSdZLYtAA64ZYcp8KU8ggEBzoCe8+KIjY8vZOhMCWmGEvLZNDFKlt10EeNmM76nYzkXF3O3ewOEFNP57AjgZnPK6g+T2wVoIavST4quSpahGxxp9n/I2sKrND/mBQ8GNtrj2EmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F5hqYEBE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F5hqYEBE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750325511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2jXjg8C8SccVbJIxPY6T+fEgjPq8rj583aQs46Ok3ck=;
	b=F5hqYEBEQOtzKUqYezxz8rp3vV3OWtoFzQXGoot7UAgx98LNoHEchl93mvBjOSvmuO5409
	d7oRHTfcJsCb+2IWfWXKFtUmdyzD8f0jUurD/kA13cU8AJslSPp87X15VSwAlLHDxXXPry
	ls0qTps//wZrxuwSKOvVbvqbNJLm2Bk=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-235-_XqqMhXSOeqXAk9UBgG21A-1; Thu,
 19 Jun 2025 05:31:46 -0400
X-MC-Unique: _XqqMhXSOeqXAk9UBgG21A-1
X-Mimecast-MFC-AGG-ID: _XqqMhXSOeqXAk9UBgG21A_1750325504
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 27B57180028E;
	Thu, 19 Jun 2025 09:31:44 +0000 (UTC)
Received: from fedora (unknown [10.72.116.16])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 04124180035C;
	Thu, 19 Jun 2025 09:31:36 +0000 (UTC)
Date: Thu, 19 Jun 2025 17:31:31 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: akpm@linux-foundation.org, tglx@linutronix.de, john.g.garry@oracle.com,
	axboe@kernel.dk, linux-kernel@vger.kernel.org, yukuai3@huawei.com,
	yi.zhang@huawei.com, yangerkun@huawei.com, johnny.chenyi@huawei.com
Subject: Re: [PATCH] lib/group_cpus: fix NULL pointer dereference from
 group_cpus_evenly()
Message-ID: <aFPY8zaPYO8kNRKD@fedora>
References: <20250619082941.3741592-1-yukuai1@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619082941.3741592-1-yukuai1@huaweicloud.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On Thu, Jun 19, 2025 at 04:29:41PM +0800, Yu Kuai wrote:
> From: Yu Kuai <yukuai3@huawei.com>
> 
> While testing null_blk with configfs, echo 0 > poll_queues will trigger
> following panic:
> 
> BUG: kernel NULL pointer dereference, address: 0000000000000010
> Oops: Oops: 0000 [#1] SMP NOPTI
> CPU: 27 UID: 0 PID: 920 Comm: bash Not tainted 6.15.0-02023-gadbdb95c8696-dirty #1238 PREEMPT(undef)
> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.1-2.fc37 04/01/2014
> RIP: 0010:__bitmap_or+0x48/0x70
> Call Trace:
>  <TASK>
>  __group_cpus_evenly+0x822/0x8c0
>  group_cpus_evenly+0x2d9/0x490
>  blk_mq_map_queues+0x1e/0x110
>  null_map_queues+0xc9/0x170 [null_blk]
>  blk_mq_update_queue_map+0xdb/0x160
>  blk_mq_update_nr_hw_queues+0x22b/0x560
>  nullb_update_nr_hw_queues+0x71/0xf0 [null_blk]
>  nullb_device_poll_queues_store+0xa4/0x130 [null_blk]
>  configfs_write_iter+0x109/0x1d0
>  vfs_write+0x26e/0x6f0
>  ksys_write+0x79/0x180
>  __x64_sys_write+0x1d/0x30
>  x64_sys_call+0x45c4/0x45f0
>  do_syscall_64+0xa5/0x240
>  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> 
> Root cause is that numgrps is set to 0, and ZERO_SIZE_PTR is returned
> from kcalloc(), then __group_cpus_evenly() will deference the
> ZERO_SIZE_PTR.
> 
> Fix the problem by checking kcalloc() return value with ZERO_OR_NULL_PTR,
> and NULL will be returned to caller.
> 
> Fixes: 6a6dcae8f486 ("blk-mq: Build default queue map via group_cpus_evenly()")
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> ---
>  lib/group_cpus.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/group_cpus.c b/lib/group_cpus.c
> index ee272c4cefcc..5e243946ee4e 100644
> --- a/lib/group_cpus.c
> +++ b/lib/group_cpus.c
> @@ -363,7 +363,7 @@ struct cpumask *group_cpus_evenly(unsigned int numgrps)
>  		goto fail_npresmsk;
>  
>  	masks = kcalloc(numgrps, sizeof(*masks), GFP_KERNEL);
> -	if (!masks)
> +	if (ZERO_OR_NULL_PTR(masks))
>  		goto fail_node_to_cpumask;

I'd suggest to check 'numgrps' explicitly, which is more readable than
ZERO_PTR.


Thanks,
Ming

