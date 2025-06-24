Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09D83D3B8
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 09:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750757667; cv=none; b=UJQowJdCiXgXKHSLL0kza5jHl5KP4N9CBlb+cui9M+uV6M8thbuO4WZcvwJd4CF7YR1O4B0HxCw/StnPJ+XnZMBSaB/ptR7L5HfvdK8Q/9c2/B5j1WxdPNfzTpZmkDGkFGNDD2syVYTq3ZRkiYkgI4UAq/takKFpXb85IYNKDng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750757667; c=relaxed/simple;
	bh=I8MWf4sdfUN+VFU/y2u5ZPC+dC74nGwCDeAcM2t2H7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pwGa3U6dD7ienv56u6m9svj/k3SplYB7Elb+yJG8mEq49YBduO5iN6NYmgwRVpcX/yWC27k0AWo0tUYrgXX/XMxWvWQl/xlbx81TbJMeqjWtltuZYdtCBnPBUYHZbm5o8KVqIE9Bdeq92nflypR/aB7mr3TKEuqQiQX4RJKsm48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y8czmUp7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y8czmUp7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750757663;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8cjGmnDdtqRz4b8fh1TvIU0XIbqHazQnCZhyhESq7S4=;
	b=Y8czmUp7gf7smkO3RgXZeRw7EntnZRRQ13IyE1yDiSA8jk0tBMl6oWxZ2BlT112BvbsfM4
	2d9niQzwSkYdZ6UIX87NW36azHW6M9tetqJlR9zxpDKZpSX0esWkvDgEwGGOBTIxcCLmxh
	Gaq55zKxSeeAczzS1A+71AU8SaB77ds=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-625-7Z09YuVpPoGaztRjup6wGw-1; Tue,
 24 Jun 2025 05:34:20 -0400
X-MC-Unique: 7Z09YuVpPoGaztRjup6wGw-1
X-Mimecast-MFC-AGG-ID: 7Z09YuVpPoGaztRjup6wGw_1750757659
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 007E219560B7;
	Tue, 24 Jun 2025 09:34:19 +0000 (UTC)
Received: from localhost (unknown [10.72.112.21])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C2B27180045B;
	Tue, 24 Jun 2025 09:34:17 +0000 (UTC)
Date: Tue, 24 Jun 2025 17:34:12 +0800
From: Baoquan He <bhe@redhat.com>
To: "Uladzislau Rezki (Sony)" <urezki@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	LKML <linux-kernel@vger.kernel.org>,
	Harry Yoo <harry.yoo@oracle.com>,
	Suren Baghdasaryan <surenb@google.com>,
	David Wang <00107082@163.com>
Subject: Re: [PATCH 2/2] lib/test_vmalloc.c: Restrict default test mask to
 avoid test warnings
Message-ID: <aFpxFF9a40lFx+v+@MiWiFi-R3L-srv>
References: <20250623184035.581229-1-urezki@gmail.com>
 <20250623184035.581229-2-urezki@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623184035.581229-2-urezki@gmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On 06/23/25 at 08:40pm, Uladzislau Rezki (Sony) wrote:
> When the vmalloc test is built into the kernel, it runs automatically
> during the boot. The current-default "run_test_mask" includes all test
> cases, including those which are designed to fail and which trigger
> kernel warnings.
> 
> These kernel splats can be misinterpreted as actual kernel bugs, leading
> to false alarms and unnecessary reports.
> 
> To address this, limit the default test mask to only the first few tests
> which are expected to pass cleanly. These tests are safe and should not
> generate any warnings unless there is a real bug.
> 
> Users who wish to explicitly run specific test cases have to pass the
> run_test_mask as a boot parameter or at module load time.
> 
> Cc: Harry Yoo <harry.yoo@oracle.com>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: David Wang <00107082@163.com>
> Signed-off-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
> ---
>  lib/test_vmalloc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Baoquan He <bhe@redhat.com>

> 
> diff --git a/lib/test_vmalloc.c b/lib/test_vmalloc.c
> index 7264781750c96..c1966cf72ab89 100644
> --- a/lib/test_vmalloc.c
> +++ b/lib/test_vmalloc.c
> @@ -41,7 +41,7 @@ __param(int, nr_pages, 0,
>  __param(bool, use_huge, false,
>  	"Use vmalloc_huge in fix_size_alloc_test");
>  
> -__param(int, run_test_mask, INT_MAX,
> +__param(int, run_test_mask, 7,
>  	"Set tests specified in the mask.\n\n"
>  		"\t\tid: 1,    name: fix_size_alloc_test\n"
>  		"\t\tid: 2,    name: full_fit_alloc_test\n"
> -- 
> 2.39.5
> 

