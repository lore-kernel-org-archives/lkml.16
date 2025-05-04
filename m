Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BAE153800
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 10:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746353174; cv=none; b=VrrwvM3ZG7PNRSco5h+V6fC8oE0LKXGJhdEYMUYJracVGyo+CCgeTjxJcOnZoNacY8pAqBn0blt7a0QzHHggrprcNxEhYLpI138wXoGpMya2/e8YkWfki/gJN/xzK/tw4pQrOkgzE3giLPr/HiXhaAK07aCR9PFfd7QsHP26E9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746353174; c=relaxed/simple;
	bh=JL3XkAj7vKDP2Rhw1aBkOgJ/hiKDV5Cf8RNnHw8tbNQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=hYLaxzh5VbyI0pYQSa0pGn1MJ9BsrtfFHWrHbkdxTEKH1SR4N97FCSFCIk294TQJlYHkxxmJWGK9b9e/o51DMoPl76GpQ6tLxkjQR7AOfRMKyZ/w0MJeuGP/B0OAh+Gxb8rG/cj6bU+NRKuGQiOgSGQu2u/aRXFYFjbFXWUIycg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Gn1WoT53; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Gn1WoT53"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746353170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NvJ7vLDIHj6O9i5UsnQ+ux6Ts9JtSmkul70topMATbY=;
	b=Gn1WoT53nRlL3VKozR6rytgeloTR708ZH1oa0N1UcvS1JUk1/Z97kxqT7FA2V8GYnKSfh8
	i4ehWlImwyXuZdLrkXQ7dmAv08Ex5jo0s0qQ56VDdd/yiNHQE7M1U635XRsE5CNDrWSgtA
	BXC1nYEgoP4f6fH/dk70vKjsL0NGQs0=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-687-GHA9sYqyOzed-hwZy9XjIg-1; Sun,
 04 May 2025 06:06:07 -0400
X-MC-Unique: GHA9sYqyOzed-hwZy9XjIg-1
X-Mimecast-MFC-AGG-ID: GHA9sYqyOzed-hwZy9XjIg_1746353166
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A94591800263;
	Sun,  4 May 2025 10:06:05 +0000 (UTC)
Received: from [10.22.80.45] (unknown [10.22.80.45])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8114E1800352;
	Sun,  4 May 2025 10:06:03 +0000 (UTC)
Date: Sun, 4 May 2025 12:05:58 +0200 (CEST)
From: Mikulas Patocka <mpatocka@redhat.com>
To: John Garry <john.g.garry@oracle.com>
cc: agk@redhat.com, snitzer@kernel.org, dm-devel@lists.linux.dev, 
    linux-kernel@vger.kernel.org, martin.petersen@oracle.com
Subject: Re: [PATCH] dm-table: Set BLK_FEAT_ATOMIC_WRITES for target queue
 limits
In-Reply-To: <20250502143933.1320061-1-john.g.garry@oracle.com>
Message-ID: <57c7b277-4afd-cc22-d1aa-90ad2d9d23ea@redhat.com>
References: <20250502143933.1320061-1-john.g.garry@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Hi

I applied the patch, thanks.

Mikulas



On Fri, 2 May 2025, John Garry wrote:

> Feature flag BLK_FEAT_ATOMIC_WRITES is not being properly set for the
> target queue limits, and this means that atomic writes are not being
> enabled for any dm personalities.
> 
> When calling dm_set_device_limits() -> blk_stack_limits() ->
> ... -> blk_stack_atomic_writes_limits(), the bottom device limits
> (which corresponds to intermediate target queue limits) does not have
> BLK_FEAT_ATOMIC_WRITES set, and so atomic writes can never be enabled.
> 
> Typically such a flag would be inherited from the stacked device in
> dm_set_device_limits() -> blk_stack_limits() via BLK_FEAT_INHERIT_MASK,
> but BLK_FEAT_ATOMIC_WRITES is not inherited as it's preferred to manually
> enable on a per-personality basis.
> 
> Set BLK_FEAT_ATOMIC_WRITES manually for the intermediate target queue
> limits from the stacked device to get atomic writes working.
> 
> Fixes: 3194e36488e2 ("dm-table: atomic writes support")
> Signed-off-by: John Garry <john.g.garry@oracle.com>
> 
> diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
> index 9e175c5e0634..b35e48fed641 100644
> --- a/drivers/md/dm-table.c
> +++ b/drivers/md/dm-table.c
> @@ -431,6 +431,12 @@ static int dm_set_device_limits(struct dm_target *ti, struct dm_dev *dev,
>  		return 0;
>  	}
>  
> +	/*
> +	 * BLK_FEAT_ATOMIC_WRITES is not inherited from the bottom device in
> +	 * blk_stack_limits(), so do it manually.
> +	 */
> +	limits->features |= (q->limits.features & BLK_FEAT_ATOMIC_WRITES);
> +
>  	if (blk_stack_limits(limits, &q->limits,
>  			get_start_sect(bdev) + start) < 0)
>  		DMWARN("%s: adding target device %pg caused an alignment inconsistency: "
> -- 
> 2.31.1
> 

