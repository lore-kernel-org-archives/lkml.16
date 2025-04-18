Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3D71D89F0
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 15:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744988508; cv=none; b=POe3aHpYErRXob08Vnq33nxRqbzEQsvUJNSBPD8wMU3C9Jfc+Rdx65avoiXGL2uv0hbNoD6+ED15RVV0EXQjeh9cF8dv1nKAluaQFnQoHNxzcQ7MTc9aIyYca9QEK5W5zRW4vxZIH7RT4dSXkIonbrpdPyrfNSf2wLEHFV0D0B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744988508; c=relaxed/simple;
	bh=FWbrSVy6V4doqA4dC7Rao1yMTsc7/2keSqw/TY5ZDAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gAlF/xlbkR4X5+R2bBsGJlF5SAP/Zvrq6fHss1jYS0+6OU82aonCO5++04Mb/SWnP3zxJKZ4BajIw05M/gYrt2PzcZ+feKdc6asqXM6lLIWyKGNSLkKHSekjAcjbz0xmbzphsRanTd7aPviL5b6E0jdCGlvNgISVf646wbQj4xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=guR1pIke; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="guR1pIke"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744988505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qfNiTVzEmfUj36NeR+W+IszVzxKnk6l6G/dt+7ak0N0=;
	b=guR1pIkevpS6c/mbdGRJFVWPOWjxqGogdDtuGvOFgXX9+qrO2fpcCnG045SaVpX2hLl9Oo
	RGmUF6B7XKnh8e/5gU0ZoaTMkpen4Nr/PceEpAbgMOtYFtKleLlAWxV22hqanYePPeD3cD
	TqvvpPsg1FAIbIb84yFgr2IhZPNhZKk=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-365-rV9BBcsJPNqvIFj7JRMPkQ-1; Fri,
 18 Apr 2025 11:01:42 -0400
X-MC-Unique: rV9BBcsJPNqvIFj7JRMPkQ-1
X-Mimecast-MFC-AGG-ID: rV9BBcsJPNqvIFj7JRMPkQ_1744988501
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B715319560AE;
	Fri, 18 Apr 2025 15:01:40 +0000 (UTC)
Received: from localhost (unknown [10.72.112.18])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 87B841801942;
	Fri, 18 Apr 2025 15:01:39 +0000 (UTC)
Date: Fri, 18 Apr 2025 23:01:35 +0800
From: Baoquan He <bhe@redhat.com>
To: "Uladzislau Rezki (Sony)" <urezki@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	LKML <linux-kernel@vger.kernel.org>,
	Christoph Hellwig <hch@infradead.org>,
	Oleksiy Avramchenko <oleksiy.avramchenko@sony.com>
Subject: Re: [PATCH 3/4] MAINTAINERS: Add test_vmalloc.c to VMALLOC section
Message-ID: <aAJpTwSTphlbAW0I@MiWiFi-R3L-srv>
References: <20250417161216.88318-1-urezki@gmail.com>
 <20250417161216.88318-3-urezki@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417161216.88318-3-urezki@gmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On 04/17/25 at 06:12pm, Uladzislau Rezki (Sony) wrote:
> A vmalloc subsystem includes "lib/test_vmalloc.c" test suite.
> Add an "F:" entry under VMALLOC section to track this file as
> part of the subsystem.
> 
> Signed-off-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 17ed0b5ffdd20..8e62b09e4c9e4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25874,6 +25874,7 @@ W:	http://www.linux-mm.org
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
>  F:	include/linux/vmalloc.h
>  F:	mm/vmalloc.c
> +F:	lib/test_vmalloc.c

Reviewed-by: Baoquan He <bhe@redhat.com>

>  
>  VME SUBSYSTEM
>  L:	linux-kernel@vger.kernel.org
> -- 
> 2.39.5
> 

