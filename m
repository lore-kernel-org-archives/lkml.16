Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B8624E4B3
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 14:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744901399; cv=none; b=acB9syAkS1A/z+pOvD8AoqIZKnS0ffSOjdLgfBnv8PGcoshBn6YG/fKuvRo3tGzEQuamJ4vPo+MHxlMhyDxlVFZII6ZsVrPh6np4aPz5KPo9APMo0PSGITd0ZuoqpdvDwh3USAYhkuS8UUwHqO5AqytX4ewV6GujkVs6Ui7mh90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744901399; c=relaxed/simple;
	bh=wkUhe+5UgXQ62adGuCrJlWozx3nrM1pQzJP3RGiT9xI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=caVBtL6x14ZOAgrC1L+3Hw5R7zqYBpNaGUwBWr5HerTR0AYgdpNs7jAIeDWXrF24W4MTZyK8+gtb6Tb+1Q56PGrfoauYKjjl7Zx7qqOE6mie6fTRxjXDc9ZxsADoAZx02P860e124OpGWtwM9a80/CtaJxHPSoHXy7mhDY3Hfb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac3fcf5ab0dso138036766b.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 07:49:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744901396; x=1745506196;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TEu/dMMv1x05lJznx/hka4ssdz4rcEJBZoJlf12fbOI=;
        b=dv79ljHQ+RrUcwVYJfvc0TWHA9yQuFtJ4dqsYMTu2o+la+7K5aphRrDgd1JR+FD7S8
         YCEBvZ8sxKx+BgJY4FLAFRNf/hkxES4A18Bjk6Rxcf6bAOY1c3c1EPIsNECwSnQqxp20
         Y3PluArngWOGXjR6DJFGEwCAWZz89BqkYOibYl0w1lyM02vDGxd9VaIf7DYVhNkM6ZHB
         hmHc86lNF8vkV+IfSURWCKoKx7pCN/+8p7qNmCj55SsIe8fa4tVDIy9kh5xFq+lRbuAL
         UKV5BTOlA2F8vWlfVJsTAEfK+5E2YSnjjIZouXweDXoOt4HyLL1COzzm/TkfjnHJ1rRj
         R7Ew==
X-Forwarded-Encrypted: i=1; AJvYcCXljwaakdZtuv8U7nt5aV6EXp/OgspMD6lZkObR4/kfWsF5NRPWVyXViMf61bUrH8JnFWfR7VcQv3ynO/0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq71CSYvW43/AzSuC1jRP5Q089jSZSZpkpTKb22iFLdsW/YC0e
	6XW0M0dW8XaOZmfYkOX4X8DrjubJhm5HZ6IbWFVuG1vxIL6FB2t0
X-Gm-Gg: ASbGncuJ1ICCTvgGaGKYK50g9JuV0I7zzjeoNaL9YYxasKiHEBpTx0u1r4bCvP5vjeh
	NgPwlOkg0hJl9Rewy/F1/uCh4k5o7QbCcZYtFV5TNfObdlDH4rKt3lnZ/dtFJ3UPfzLzi0q8EUk
	UlXXrD6UgFOHzE8jrd3+hEqqpOnX0s0o2hCT4hZnkyoqkOJ8fbF0g6KuQB1857QlFoa0jZEgF2C
	BQIMJnjEgpojBfuy0SC96Bli1aEeVgslBzmg1L8wnX9saVvSYgGP9MUyxGqcmNsnh14lRCcFGIT
	6y7eKSxrvzrWQAvGjObNgHnYROamIbL9
X-Google-Smtp-Source: AGHT+IEIMmu3af40R7kHw6ePT8DVPeAMApcM5GlDcLLxD/3QmaFeTvU18SzEn//5nYdBgFZpTp3D9g==
X-Received: by 2002:a17:907:7206:b0:ac8:1efc:b993 with SMTP id a640c23a62f3a-acb42ad9886mr602106366b.44.1744901396081;
        Thu, 17 Apr 2025 07:49:56 -0700 (PDT)
Received: from gmail.com ([2a03:2880:30ff:41::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ec90950sm4027666b.75.2025.04.17.07.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 07:49:55 -0700 (PDT)
Date: Thu, 17 Apr 2025 07:49:53 -0700
From: Breno Leitao <leitao@debian.org>
To: Zijun Hu <zijun_hu@icloud.com>
Cc: Joel Becker <jlbec@evilplan.org>,
	Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
	Al Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org,
	Zijun Hu <quic_zijuhu@quicinc.com>
Subject: Re: [PATCH v2 3/3] configfs: Correct error value returned by API
 config_item_set_name()
Message-ID: <aAEVEbcjtK3W7K3z@gmail.com>
References: <20250415-fix_configfs-v2-0-fcd527dd1824@quicinc.com>
 <20250415-fix_configfs-v2-3-fcd527dd1824@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415-fix_configfs-v2-3-fcd527dd1824@quicinc.com>

On Tue, Apr 15, 2025 at 08:34:27PM +0800, Zijun Hu wrote:
> From: Zijun Hu <quic_zijuhu@quicinc.com>
> 
> kvasprintf() failure is often caused by memory allocation which has error
> code -ENOMEM, but config_item_set_name() returns -EFAULT for the failure.
> 
> Fix by returning -ENOMEM instead of -EFAULT for the failure.
> 
> Reviewed-by: Joel Becker <jlbec@evilplan.org>
> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>

Reviewed-by: Breno Leitao <leitao@debian.org>

> ---
>  fs/configfs/item.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/configfs/item.c b/fs/configfs/item.c
> index 254170a82aa337d95cbfbdf1a2db1023db3a2907..c378b5cbf87d28387a509c3cabb93eccfb520c9c 100644
> --- a/fs/configfs/item.c
> +++ b/fs/configfs/item.c
> @@ -66,7 +66,7 @@ int config_item_set_name(struct config_item *item, const char *fmt, ...)
>  		name = kvasprintf(GFP_KERNEL, fmt, args);
>  		va_end(args);
>  		if (!name)
> -			return -EFAULT;
> +			return -ENOMEM;

I've checked that all the config_item_set_name() callers, who check for
the return value, are fine with this change also.

--breno
