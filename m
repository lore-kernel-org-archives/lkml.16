Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA85DDBC
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 15:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744988490; cv=none; b=PsLBwsXF/dqwLDsbB2K4H664Urexo2h7e50g1fQkIrcFeurnuIdou7rjJUIBKnkU8QnnkPfz3RMZQ5+qKcrCzPFEE28wT/p4iJI6b63G/VW2MVXzMIsrJA3xjtiAVMwoksCEWJ8G+0w+fepqaeNpB2y+Dz+cQFt8wMLOMpbKx6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744988490; c=relaxed/simple;
	bh=cUScJlxx6PaVcUB9345/WvR/gxZXEm3FaPxFzf9BX0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tZod1n71stfPYMgiqgn7k27N+BUxUdk19rh/SOxm6JFKXsLq/EIqF9kEdIzBXdRKhuibNOo0mN2p6vu2wNI++mZkplUXPpBne12t9gDuLpznA7yzCUoIJ2OIkNRP7rmxSwQmENViiCusA3chLqVESSTnrqRjsv35/lRZo5Ze5GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B9RqorT1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B9RqorT1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744988487;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pRAvjPkxYPRRBD/GS3VWgx3W5DD4E26CuWLhjY+XoMQ=;
	b=B9RqorT1bOOgq+eSAYFgHbCYM6BBzRE/yXBknABmfBsntAhif4Dr++QUhPq4QsOpbgOv8d
	cYSbJwPTliYWYx00UearnXbiBEPa7k3+Liuk/QCgiT/LtIaf0iFGGXZoKmOfPyj8YX14Cq
	iY8j0Ta/GGSS/z/eNWug6pBnY/BdGHg=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-564-IvsvK0IHPzGJ4ruXSllrCA-1; Fri,
 18 Apr 2025 11:01:24 -0400
X-MC-Unique: IvsvK0IHPzGJ4ruXSllrCA-1
X-Mimecast-MFC-AGG-ID: IvsvK0IHPzGJ4ruXSllrCA_1744988482
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 714FB1800879;
	Fri, 18 Apr 2025 15:01:22 +0000 (UTC)
Received: from localhost (unknown [10.72.112.18])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 40E181956054;
	Fri, 18 Apr 2025 15:01:20 +0000 (UTC)
Date: Fri, 18 Apr 2025 23:01:17 +0800
From: Baoquan He <bhe@redhat.com>
To: "Uladzislau Rezki (Sony)" <urezki@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	LKML <linux-kernel@vger.kernel.org>,
	Christoph Hellwig <hch@infradead.org>,
	Oleksiy Avramchenko <oleksiy.avramchenko@sony.com>
Subject: Re: [PATCH 2/4] lib/test_vmalloc.c: Allow built-in execution
Message-ID: <aAJpPUVGGk4Ma/8B@MiWiFi-R3L-srv>
References: <20250417161216.88318-1-urezki@gmail.com>
 <20250417161216.88318-2-urezki@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417161216.88318-2-urezki@gmail.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

On 04/17/25 at 06:12pm, Uladzislau Rezki (Sony) wrote:
> This patch removes the dependency on module loading ("m")
> for the vmalloc test suite, enabling it to be built directly
> into the kernel, so both ("=m") and ("=y") are supported.
> 
> Motivation:
> - Faster debugging/testing of vmalloc code;
> - It allows to configure the test via kernel-boot parameters.
> 
> Configuration example:
>   test_vmalloc.nr_threads=64
>   test_vmalloc.run_test_mask=7
>   test_vmalloc.sequential_test_order=1
> 
> Signed-off-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
> ---
>  lib/Kconfig.debug  | 3 +--
>  lib/test_vmalloc.c | 5 +++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Baoquan He <bhe@redhat.com>

> 
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index f9051ab610d54..166b9d830a85a 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -2574,8 +2574,7 @@ config TEST_BITOPS
>  config TEST_VMALLOC
>  	tristate "Test module for stress/performance analysis of vmalloc allocator"
>  	default n
> -       depends on MMU
> -	depends on m
> +	depends on MMU
>  	help
>  	  This builds the "test_vmalloc" module that should be used for
>  	  stress and performance analysis. So, any new change for vmalloc
> diff --git a/lib/test_vmalloc.c b/lib/test_vmalloc.c
> index 4ab23e5e772d0..6d65ef725d42c 100644
> --- a/lib/test_vmalloc.c
> +++ b/lib/test_vmalloc.c
> @@ -591,10 +591,11 @@ static void do_concurrent_test(void)
>  	kvfree(tdriver);
>  }
>  
> -static int vmalloc_test_init(void)
> +static int __init vmalloc_test_init(void)
>  {
>  	do_concurrent_test();
> -	return -EAGAIN; /* Fail will directly unload the module */
> +	/* Fail will directly unload the module */
> +	return IS_BUILTIN(CONFIG_TEST_VMALLOC) ? 0:-EAGAIN;
>  }
>  
>  module_init(vmalloc_test_init)
> -- 
> 2.39.5
> 

