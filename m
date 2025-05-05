Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D721225A2AD
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 14:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746456701; cv=none; b=MGT0ze6NG7kMWUN/rsfdh0RE2+OtSqWL65k+k5nk0KxkWpckf8ftxfjbzxYirpiubheG8PvQ0LUOEyTFTVFr05mzYRO2vLAVknQEjHX8dEFiWe4yd0KKDE5HCcOHaJPPcFf1DClyI21yDqNqu7eO1w99qoNJiAtN+r8uSgltFqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746456701; c=relaxed/simple;
	bh=oCEK/gb2s7VE5NbnwBs9WgyzCdnoTtPR5Hot8Paa4uk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d3noAHuonJ0CzJA2K9yk0KOoBcmqrnlbIs36kkMSgAIAlvxePDOHn0Bgu5Qz8WflRTaqA8MwexSHKOWLp5gfa4LtIBAjyy1V7SVyRLuJBRJo3jAEkv/R0eyw5niqjrGR1W4PyFOe4VCSxZ947koQMlwqbzsUvf6cPKv5Wv0F4j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FoAZ1axw; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FoAZ1axw"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39ee682e0ddso3014367f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 07:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746456698; x=1747061498; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X5qEheQ78VUh9wA81z867KyoEw2DalbMlFj0qM+zfz0=;
        b=FoAZ1axwKBrJFZ2uX6reeq49ulwtu5AJkVo98myV2slKOjoEYZzunrWfsZh7FyRBKI
         F6sO6CNmAL8uuhXtwSBmzqW0HlFIwP/4FguixhE9pQHSw00SF487DsTL5OQSPkMk+gey
         S3DlrmMdoO7CooSaSbNs8+oIzHnvvTl93HCcPkqfnRTmjWJR5d9WdsCINiC8xMYRSJRK
         KaEKRkuS41eZ3Kr9Pte04J1UoK8yoaVWMRggqY+TE1gqmZQ4BQtMFo9A9LKoeilLWPvY
         VFGStIEu8Davbcad4QglL38M+P7MV7YFmTHM7i4camyZCVN7WiiQKCeSsgVl9LZBR9u4
         OQMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746456698; x=1747061498;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X5qEheQ78VUh9wA81z867KyoEw2DalbMlFj0qM+zfz0=;
        b=OCsQfiVS7bvuQrtHdhhNcjd0efo7ksMVjdemEicKeJLVhxYKgnUayAaQJ2a3nQxS3p
         F1hJB68I2koRitQEUfb7R2uv/khiEpCNJVC8O3PtpQZ76qVgsm4aoE+Ltq5FXbB7Ks97
         /szWOz3bD+KXBk/pOwahDNXTCkMcbnW6qOjnMG/0c90vDaO1kZGcO3NPJZJBlShB2w/X
         dvx78gkc66hz/CJFAjVMMFH60qyXH/wmwnAUHOqmvjTly4Y0a3HvFQyzfgIkc7XWD2BH
         R1uzjpRIVAyRaDGOFcKnFuCFky3LQmHQhS+SFhMnz1/6ZVD8Swu/+j46GvcCHa4Vx6l0
         jo1A==
X-Forwarded-Encrypted: i=1; AJvYcCVcZkexadKWkMqvn16znNd/EVf3hiUX5GP5aJ9bg8++FKvTJSxnAXqnkR0CsKShuygugXxl14/9/hQcwFo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9Z6t8iJ4I4VtmCv3+wFfUcWnQPWjIIRw7AAVLYe6J6h3vWkCK
	18FnwGjy36D0M9de64098wrPT8fMYKHK/uwGFjJVgAOjTs9szzcbTZO6z/F+3LU=
X-Gm-Gg: ASbGncsYj2GtZUvvjBrkyTHth+j+k3PdM97Hj+5O97GaN6BAxIEf2hZ2i/B8iNN9PUB
	jnPIGkosf0ClLiJ0tviGJlUXaPfy4AKZBEuJJM36jMeD6ql+LlL16tqiJtkIA0qK5CHiesVz7KD
	kwPIqVlux4yOLBNdkMFeT5jGhwurhbcJOWJe/jnpRFGydm4bLXN0YXTNjfyFr/DJsMJv9R3fxHi
	N7ZKi8+3uIVZ5TDoPtfhXehFnkP4ByHJaIBDXpTyFg9FEgQdsaAEPg39R2DCx6aR6mNNLtCWZmS
	3LDoYYYSs8Aidv3VudGTe7mgURjWgEa4J4JMKLuwd4Vj6w==
X-Google-Smtp-Source: AGHT+IEVyw/YGLqw4XgUqJUoi8KM9ui43BsDBRvgsDIU2uPCdWA10j2oTFbpLZc6LLbBVKhBuXsc7A==
X-Received: by 2002:a5d:584c:0:b0:39c:e0e:b27a with SMTP id ffacd0b85a97d-3a09fd739d1mr4661103f8f.23.1746456698048;
        Mon, 05 May 2025 07:51:38 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a099ae7bbesm10434735f8f.49.2025.05.05.07.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 07:51:37 -0700 (PDT)
Date: Mon, 5 May 2025 17:51:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Gregory Price <gourry@gourry.net>
Cc: Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Rakie Kim <rakie.kim@sk.com>, Harry Yoo <harry.yoo@oracle.com>,
	honggyu.kim@sk.com
Subject: Re: [PATCH v3 2/3] mm,memory_hotplug: Implement numa node notifier
Message-ID: <aBjQdRZa0713T8hj@stanley.mountain>
References: <20250502083624.49849-1-osalvador@suse.de>
 <20250502083624.49849-3-osalvador@suse.de>
 <aBTkgnYYSN0SMQCU@gourry-fedora-PF4VCD3F>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBTkgnYYSN0SMQCU@gourry-fedora-PF4VCD3F>

On Fri, May 02, 2025 at 11:28:02AM -0400, Gregory Price wrote:
> On Fri, May 02, 2025 at 10:36:23AM +0200, Oscar Salvador wrote:
> > There are at least six consumers of hotplug_memory_notifier that what they
> > really are interested in is whether any numa node changed its state, e.g: going
> > from being memory aware to becoming memoryless and vice versa.
> > 
> > Implement a specific notifier for numa nodes when their state gets changed,
> > and have those consumers that only care about numa node state changes use it.
> > 
> > Signed-off-by: Oscar Salvador <osalvador@suse.de>
> > Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
> > Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> >  
> > diff --git a/mm/mempolicy.c b/mm/mempolicy.c
> > index f43951668c41..b3ad63fb3a2b 100644
> > --- a/mm/mempolicy.c
> > +++ b/mm/mempolicy.c
> > @@ -3591,20 +3591,20 @@ static int wi_node_notifier(struct notifier_block *nb,
> >  			       unsigned long action, void *data)
> >  {
> >  	int err;
> > -	struct memory_notify *arg = data;
> > +	struct node_notify *arg = data;
> >  	int nid = arg->status_change_nid;
> >  
> >  	if (nid < 0)
> >  		return NOTIFY_OK;
> >  
> >  	switch (action) {
> > -	case MEM_ONLINE:
> > +	case NODE_BECAME_MEM_AWARE:
> >  		err = sysfs_wi_node_add(nid);
> >  		if (err)
> >  			pr_err("failed to add sysfs for node%d during hotplug: %d\n",
> >  			       nid, err);
> >  		break;
> 
> May I suggest rolling this patch in with this change:
> https://lore.kernel.org/linux-mm/aAij2oUCP1zmcoPv@stanley.mountain/
> 
> seems to fix the underlying problem, and returning an error now makes
> sense given the change. 
> 
> +cc: Honggyu Kim, Dan Carpenter
> 

Oops.  I sent a v2 of that patch.  I imagine that Andrew will fold that
patch into Rakie Kim's patch.

https://lore.kernel.org/all/aBjL7Bwc0QBzgajK@stanley.mountain

regards,
dan carpenter

