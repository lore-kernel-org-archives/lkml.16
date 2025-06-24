Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8882D25744F
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 08:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750753860; cv=none; b=c0ss+YADuBMP2p8FUti6ij7TXdE4inofoD7Xt7sfrO28taN+VCbEQZ3zwIdqTTKN62MEQmAKyybto4/1fSvoXozL0Hh1kweucBImKyg53+jhMw212PnaFvibP7ndNoGD51047kOQXCOJwnSMZ4q59IFCPSxRDLo+vkGBoeGsBfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750753860; c=relaxed/simple;
	bh=QOHbXjq8BQfASz7XeifT+IWRHhkz+YrxDpafUWPOsyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YMDcpLUmdjs10ZnCIyB1tJWbsBEsr8uLm4V5gWKCX6JR04BswhElur82n/fjYT3Iat1vQ3K9VzOY4EVHVBAjCIrUoz7NaHKcBpavfrA7BpzHhZ95wV0hUgLtnKrquBdyo9x1o2qRYqqYyZn/Hova+Qojxk4KZ8Sy9oJAYAIDkA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fp8Hkii4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fp8Hkii4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750753857;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uasRZZUq4je56X5RWLM0Pz1qlN/y56MEIUD9faMoeXs=;
	b=fp8Hkii4akpen/qv9am2IG4TXlJqIlQ0y00sykYH0+THSVyTzyhiyVv9J5bZh1Eqi4IBdP
	TWtRtqq+uCSXFv+tuxB7cyhPEMQQxD2yYi20aGB9WzmfRUDI9Kzpegyl+2JH7SeHzCdFpm
	XCSCC0S/Jyk5JmySw7lZ7XPlASF7HsM=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-124-GR_HFpohMWeLGDfluxR8nA-1; Tue,
 24 Jun 2025 04:30:53 -0400
X-MC-Unique: GR_HFpohMWeLGDfluxR8nA-1
X-Mimecast-MFC-AGG-ID: GR_HFpohMWeLGDfluxR8nA_1750753852
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BC09E1955F44;
	Tue, 24 Jun 2025 08:30:51 +0000 (UTC)
Received: from localhost (unknown [10.72.112.21])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 912AC19560A3;
	Tue, 24 Jun 2025 08:30:50 +0000 (UTC)
Date: Tue, 24 Jun 2025 16:30:35 +0800
From: Baoquan He <bhe@redhat.com>
To: "Uladzislau Rezki (Sony)" <urezki@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	LKML <linux-kernel@vger.kernel.org>,
	Harry Yoo <harry.yoo@oracle.com>,
	Suren Baghdasaryan <surenb@google.com>,
	David Wang <00107082@163.com>
Subject: Re: [PATCH 1/2] lib/test_vmalloc.c: Use late_initcall() if built-in
 for init ordering
Message-ID: <aFpiK2iPRDj8AIzV@MiWiFi-R3L-srv>
References: <20250623184035.581229-1-urezki@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623184035.581229-1-urezki@gmail.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

On 06/23/25 at 08:40pm, Uladzislau Rezki (Sony) wrote:
> When the vmalloc test code is compiled as a built-in, use late_initcall()
> instead of module_init() to defer a vmalloc test execution until most
> subsystems are up and running.
> 
> It avoids interfering with components that may not yet be initialized
> at module_init() time. For example, there was a recent report of memory
> profiling infrastructure not being ready early enough leading to kernel
> crash.
> 
> By using late_initcall() in the built-in case, we ensure the tests are
> run at a safer point during a boot sequence.
> 
> Cc: Harry Yoo <harry.yoo@oracle.com>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: David Wang <00107082@163.com>
> Signed-off-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
> ---
>  lib/test_vmalloc.c | 4 ++++
>  1 file changed, 4 insertions(+)

LGTM,

Reviewed-by: Baoquan He <bhe@redhat.com>

> 
> diff --git a/lib/test_vmalloc.c b/lib/test_vmalloc.c
> index 1b0b59549aaf1..7264781750c96 100644
> --- a/lib/test_vmalloc.c
> +++ b/lib/test_vmalloc.c
> @@ -598,7 +598,11 @@ static int __init vmalloc_test_init(void)
>  	return IS_BUILTIN(CONFIG_TEST_VMALLOC) ? 0:-EAGAIN;
>  }
>  
> +#ifdef MODULE
>  module_init(vmalloc_test_init)
> +#else
> +late_initcall(vmalloc_test_init);
> +#endif
>  
>  MODULE_LICENSE("GPL");
>  MODULE_AUTHOR("Uladzislau Rezki");
> -- 
> 2.39.5
> 
> 

