Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027B017A2ED
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 15:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746199688; cv=none; b=mEAt/8fI3uPohNtm5fpqloltcvqix7AMOaAxftizKtBxywg22iwcszzh9bw4uAODT7DTIPB+sqQzaLra+NvxgordGIrJmDKz/ZGAOSlUCe+dgKfW7gtU3NZRaS0/ByVT8nqda1DMC+b4HqmCVd+byNTGJUnP0dfveVF3uBsArPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746199688; c=relaxed/simple;
	bh=y0DpLINw5AZnw5oe4G7p+5DEZx4hIvw8GXP8hCaaNas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pLcbKQE+WMMo4aCLlW87a//of346V0K72RRcZgEcj0uhxOXPlA63XYlDTfJYN+h6DKU0CKjB7995UC3UGmPfFi4lcXC4+MkUjfsOw1BHiAS13Y8YDGhR/mIgDZx6larJwMggFxG11hHSdQ56ILw+OJ8yBKPmhyK3TSGKVd4jYp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=S4oYfKqq; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="S4oYfKqq"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4766631a6a4so29180591cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 08:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1746199684; x=1746804484; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=42DL1ZP+c01CDP0GIqBUWL1Jk5Vm3sDUPFDs4Yt7wZQ=;
        b=S4oYfKqqudSipLuLYAFxomlj89yq9tgjLwH+hj7KnHFHCX/nQrYJ4iXTj1I8Z8eIB2
         w9YM2VK1R7qxJunJOdNGwITA2tEj7Nobr1WUIuMCgdkVS8uxc//jn1wkowWSC2w9W3ct
         g096gcRYM6NH90imr9Zk9+7Bejox0PY9eeOlIEg5ighde2/GPpBAkD1lVoUAGM5m6CYJ
         CnNvcBYHJnkGsA1wp9Lb3pfktXP4KzSx+BzNRPS1ipfDTtNQ4WT9mimlrlywaAMUv1Ch
         M5ORrbFtKlw4xtX6eI/iZnXhJ/LIc15AXFyWBhl1bDn+B9SUpT2Bf7oOaevg948B/LsB
         0NVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746199684; x=1746804484;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=42DL1ZP+c01CDP0GIqBUWL1Jk5Vm3sDUPFDs4Yt7wZQ=;
        b=QwwfZ2l0smldPDjo1nslnitYVvN1dnmsab1EYVhRttbrBUqs/doJZeTykcSpQLStOw
         EPuOQC+36w5NPZHbX7EacPtVbX8Uo7DqxSrdCHUyuLQsTASf5IvniEkHJrXXbkeZc9uD
         On/DuZ26AyK5EML6ENKhEJbOquV7XzVAZrDsZlFn/HjhcwmBbBUWhVecki0L6R2xqANZ
         JS48TZFzq8mXaVKLl19ka24TnCMUCef49j7DAmNRI/Bm6/rLGbHD8/2419OU1HMdK1TQ
         x1FApXlTaj8VfIsKN2/axUyBvJwqO419Uxab3W00RHwWtxU94tj3lAshwZ7LQc/K9UZ2
         aqXw==
X-Forwarded-Encrypted: i=1; AJvYcCV8Z2B4e7Bczw2+BODGSUhocm3+wq6wwmHAfaT1WjroYVxBEZARGhNrBuDrYR1dLdQ54pqMv+1hu8icLaU=@vger.kernel.org
X-Gm-Message-State: AOJu0YySU3xg/Wg90RcZFbEbylHhmtM4xsEJ3dj3ozuIrJmJ55mdUvY1
	S6Y9fOP3zCR6jPSxU8hTWH3pYCZ2BAHqogwqXmdDRqxhyGck9GUyrFskO2hsOxc=
X-Gm-Gg: ASbGncvdylPIs+etepUsGZWweunfWXGleXJ39De+Zn4ELwr3mKDnRtjXvCca/hH1fFa
	DYgwqrLtsKQvBN3oPE1v48SkHJmnSKQqyubkccm+ff8T9BBM+Y/PZUT+f7KSQrkWw4Nhv57WWYq
	yBRayVNpqnZHDSqaXp1+Pq/Pm88fpB55PNPxNfaC0Q3Hi+MDyBVlW++SoDNZFWIJRZwuHGXJI5e
	6xuOjzMpgLcMyy7T0Va2iD/+kp7p0SWkVTbbH90iIdq9nalsPqLdFbiim8KEnuyXR1kHlp7tKrw
	1Wm+CY1yrF/HLumCRbLRIeJ+gr25ZGQ4mrSFrttXi+KgtwGTV6SPOWQFI7qz1g8tFCapuuo5lly
	0yMQFr89c8ONl/RRk/SMU
X-Google-Smtp-Source: AGHT+IGaXH+5tIeyfIuTLwQyATlw4BiXrTVsqaoS6omvSGNhxllI2Khqh3orgpzgkZE1HIIjlXZ59w==
X-Received: by 2002:a05:622a:1929:b0:474:fab0:6564 with SMTP id d75a77b69052e-48c32ac7e09mr55484501cf.37.1746199684627;
        Fri, 02 May 2025 08:28:04 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-69-37.washdc.fios.verizon.net. [173.79.69.37])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-48b96ad3752sm19030211cf.36.2025.05.02.08.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 08:28:04 -0700 (PDT)
Date: Fri, 2 May 2025 11:28:02 -0400
From: Gregory Price <gourry@gourry.net>
To: Oscar Salvador <osalvador@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Rakie Kim <rakie.kim@sk.com>, Harry Yoo <harry.yoo@oracle.com>,
	dan.carpenter@linaro.org, honggyu.kim@sk.com
Subject: Re: [PATCH v3 2/3] mm,memory_hotplug: Implement numa node notifier
Message-ID: <aBTkgnYYSN0SMQCU@gourry-fedora-PF4VCD3F>
References: <20250502083624.49849-1-osalvador@suse.de>
 <20250502083624.49849-3-osalvador@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502083624.49849-3-osalvador@suse.de>

On Fri, May 02, 2025 at 10:36:23AM +0200, Oscar Salvador wrote:
> There are at least six consumers of hotplug_memory_notifier that what they
> really are interested in is whether any numa node changed its state, e.g: going
> from being memory aware to becoming memoryless and vice versa.
> 
> Implement a specific notifier for numa nodes when their state gets changed,
> and have those consumers that only care about numa node state changes use it.
> 
> Signed-off-by: Oscar Salvador <osalvador@suse.de>
> Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>  
> diff --git a/mm/mempolicy.c b/mm/mempolicy.c
> index f43951668c41..b3ad63fb3a2b 100644
> --- a/mm/mempolicy.c
> +++ b/mm/mempolicy.c
> @@ -3591,20 +3591,20 @@ static int wi_node_notifier(struct notifier_block *nb,
>  			       unsigned long action, void *data)
>  {
>  	int err;
> -	struct memory_notify *arg = data;
> +	struct node_notify *arg = data;
>  	int nid = arg->status_change_nid;
>  
>  	if (nid < 0)
>  		return NOTIFY_OK;
>  
>  	switch (action) {
> -	case MEM_ONLINE:
> +	case NODE_BECAME_MEM_AWARE:
>  		err = sysfs_wi_node_add(nid);
>  		if (err)
>  			pr_err("failed to add sysfs for node%d during hotplug: %d\n",
>  			       nid, err);
>  		break;

May I suggest rolling this patch in with this change:
https://lore.kernel.org/linux-mm/aAij2oUCP1zmcoPv@stanley.mountain/

seems to fix the underlying problem, and returning an error now makes
sense given the change. 

+cc: Honggyu Kim, Dan Carpenter

> -	case MEM_OFFLINE:
> +	case NODE_BECAME_MEMORYLESS:
>  		sysfs_wi_node_delete(nid);
>  		break;
>  	}
> @@ -3639,7 +3639,7 @@ static int __init add_weighted_interleave_group(struct kobject *mempolicy_kobj)
>  		}
>  	}
>  
> -	hotplug_memory_notifier(wi_node_notifier, DEFAULT_CALLBACK_PRI);
> +	hotplug_node_notifier(wi_node_notifier, DEFAULT_CALLBACK_PRI);
>  	return 0;
>  
>  err_cleanup_kobj:
