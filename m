Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB2C2E62B4
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 07:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743752019; cv=none; b=hj+8jjJ/Se1sH/6GqHyA7m5i+KGZMbtdnzC90hXQHhspfKde7jrprMmdSsU8Alze09ndgvkpl+lvyd4GvmrKpnnjBYFG67aCM/y/XnBQ7CaCPd659J36au/RK3z2OO0OwuZPESrL+ihAh4v8b7yNIdkC+Gofs0NpY3iGKxWcsww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743752019; c=relaxed/simple;
	bh=gI1v4iSJP5dgGf8bteoJ4THSJSJ9gl2Lo+f6A7xueQg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tcQ/9WpgwpP9hGVThu/2XEK6/92UpjGPXNMlx42JE3V/DgsYODewFjSVABX40zp8d0Y01JbY+98um6qPAs9+TbauTXwH0/gnzOncHfScyVI0Tc96oBYwOTc76bMrdqXwN96LqXZUSSFl1OC4J1Gn8Wsl4hvnIWOoh4OybLLNcGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=mlgQCiQu; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=f4D9D1uB; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="mlgQCiQu";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="f4D9D1uB"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1743752015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CORAwJdGdFJqSXpfBY2eBhV3jtyb7N9hwR1HOp2miIw=;
	b=mlgQCiQuOrsco+po4sSITtC11nph9KQwzE+DSpGJF+GzYbY1iOkm+3JPijRAA5OPBTYb6Q
	cVSO8otipo4wfZTMR9e4XBBy7+JZWjVU78K6a6RbI0La0EjxVpHCOfajgXBYkW9pF5mIXq
	MlOfJJTps1zAjYHYoUraLaIKshDoNKjvRocZeBCwdTQVYw4qZfIwfNdNvPStyBPsBA4mLl
	34iqpxCz3hMPEH8Q1L2pQRcmKyoMQeBTVMkaLkZkmiM8/40W3mmcqN7vd10cylBbYoZ9bg
	uMqnQytDLVcIlT2rUK9A5IB9f59wnGpgcz8y0nYaOE2A3fDlx9Xnjr1IpgLgmw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1743752015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CORAwJdGdFJqSXpfBY2eBhV3jtyb7N9hwR1HOp2miIw=;
	b=f4D9D1uBxpPnWMpsC1nrSzp/rcZLMY6vogYgkx7/pYNMe8b3tUWHHdgp5rXAqD/prNL9o3
	0oyADrspMYRwtfBQ==
To: Jocelyn Falempe <jfalempe@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Ryosuke Yasuoka <ryasuoka@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>, Wei Yang
 <richard.weiyang@gmail.com>, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, John Ogness
 <john.ogness@linutronix.de>, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>, Simona Vetter
 <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v2 1/2] mm/kmap: Add kmap_local_page_try_from_panic()
In-Reply-To: <20250321112436.1739876-2-jfalempe@redhat.com>
References: <20250321112436.1739876-1-jfalempe@redhat.com>
 <20250321112436.1739876-2-jfalempe@redhat.com>
Date: Fri, 04 Apr 2025 09:33:35 +0200
Message-ID: <87mscwv0s0.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Mar 21 2025 at 12:16, Jocelyn Falempe wrote:
> kmap_local_page() can be unsafe to call from a panic handler, if
> CONFIG_HIGHMEM is set, and the page is in the highmem zone.
> So add kmap_local_page_try_from_panic() to handle this case.

I think this is a reasonable solution and the highmem case can suffer
from not getting the reliable panic output.

> Suggested-by: Simona Vetter <simona.vetter@ffwll.ch>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>  include/linux/highmem-internal.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/include/linux/highmem-internal.h b/include/linux/highmem-internal.h
> index dd100e849f5e0..5d089b0ca56de 100644
> --- a/include/linux/highmem-internal.h
> +++ b/include/linux/highmem-internal.h
> @@ -73,6 +73,13 @@ static inline void *kmap_local_page(struct page *page)
>  	return __kmap_local_page_prot(page, kmap_prot);
>  }
>  
> +static inline void *kmap_local_page_try_from_panic(struct page *page)
> +{
> +	if (!PageHighMem(page))
> +		return page_address(page);
> +	return NULL;

A comment explaining the reason why the highmem mapping cannot work here
would be appreciated.

Aside of that:

      Reviewed-by: Thomas Gleixner <tglx@linutronix.de>

Thanks,

        tglx
