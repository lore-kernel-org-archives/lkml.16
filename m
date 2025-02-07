Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE8E13CFA6;
	Fri,  7 Feb 2025 06:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738908024; cv=none; b=MkKbHndKj71jUqYCWwbohY1EZ+Be7np4tUtSz9FjZ/AQlCYx+Tc1tylvtU9Ni743fPHVgacSU3K1o8ttpnagrhBbugaQUTgoFtttXyhgPPOyE/UOcd2edWJrN+0lhaeuxLeaQ6yVhonVUK3zFsKV3Rri3CFl8VDSV4JqNzNGBTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738908024; c=relaxed/simple;
	bh=7o7FL/JCVS1jc0tC0D2Cjvdx3RpTuW+6mfAqJy3mzxQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rJhLgj60cTb7jh4DSfgdLqdoOxOqQO2Bp7mB632kyBHfqraR7rB1PX5t2pyS3VuWntYkM7PmMQ36PBtpj+FnSmrjOBYUahsHvhVauB++Nhtr4oG1k/ieFF15yuVJhY2AB85EK6Ffn8f66Pc6otDC8tZ2+cILXUR9dMIi1DhS+Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ipYUEVcs; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ipYUEVcs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=u4nIchrTN9F3VybN5rfwkXr15hqso/8vU5boVWwvOT0=; b=ipYUEVcsfaggfWKYWaFsJcGTq/
	JKQ4cF/j6Y8E+IphzZnnzIJh5d7Q/va5F6NYLjJYgNfXzX8svQ+cGgab7bkqldt4K/Yw9F65UYTwj
	oA8GwhvT2RpzTmbioxXugJ4KfZBki+1NOOnUF8e1mB4E11C+iXMT9i0a9cfqddkGaESUDqmMtLn4N
	wBUH9nw+rSkuVKkEm9BRgi3VRUQH7FcnYITQM0ZFnqc7heJKgry+el7yjD0JysZ4dhcBtFzIu7LcD
	iVcOJi14bHygjB9ynJOUxqiOr7qzZQhny2cTEm/9MJpHIwAWO29BVFq+YfrZN+6lbvvqmbESi9wDu
	Iv5oL7Fw==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tgHPO-00000007GeR-0JeN;
	Fri, 07 Feb 2025 06:00:11 +0000
Message-ID: <1349dfa5-2f82-4afc-8bf4-80b27ceac3e9@infradead.org>
Date: Thu, 6 Feb 2025 22:00:01 -0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: gpu: Fixed typos
To: Eric Salem <ericsalem@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <f68426ac-d8ec-4a90-a683-ca157719c7d5@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <f68426ac-d8ec-4a90-a683-ca157719c7d5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/6/25 7:46 PM, Eric Salem wrote:
> Fixed a few misspellings.
> 
> Signed-off-by: Eric Salem <ericsalem@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  Documentation/gpu/todo.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 256d0d1cb216..7cc102f1571a 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -294,7 +294,7 @@ Various hold-ups:
>    valid formats for atomic drivers.
>  
>  - Many drivers subclass drm_framebuffer, we'd need a embedding compatible
> -  version of the varios drm_gem_fb_create functions. Maybe called
> +  version of the various drm_gem_fb_create functions. Maybe called
>    drm_gem_fb_create/_with_dirty/_with_funcs as needed.
>  
>  Contact: Simona Vetter
> @@ -319,7 +319,7 @@ everything after it has done the write-protect/mkwrite trickery:
>  
>        vma->vm_page_prot = pgprot_wrprotect(vma->vm_page_prot);
>  
> -- Set the mkwrite and fsync callbacks with similar implementions to the core
> +- Set the mkwrite and fsync callbacks with similar implementations to the core
>    fbdev defio stuff. These should all work on plain ptes, they don't actually
>    require a struct page.  uff. These should all work on plain ptes, they don't
>    actually require a struct page.
> @@ -838,7 +838,7 @@ Querying errors from drm_syncobj
>  ================================
>  
>  The drm_syncobj container can be used by driver independent code to signal
> -complection of submission.
> +completion of submission.
>  
>  One minor feature still missing is a generic DRM IOCTL to query the error
>  status of binary and timeline drm_syncobj.

-- 
~Randy

