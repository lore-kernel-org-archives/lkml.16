Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F528472
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 13:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743428456; cv=none; b=kMMGS1779iiof51zVvw2BvvMn78ZiVMLfi6ET404vH2ZdGzjOCbaBsIDngF0D/G/+UrqHKhMtaxiwLWHjZCR2HRW8K60JrJWuW4NWB3ibcWvmjDntoV8fiK5WYkAAwea7Y7/2peTfExahVKZkWpbsZgPiue+ZUtqUbdVkXCA82Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743428456; c=relaxed/simple;
	bh=jBX9LZU7Pg/pD3cY7AL6lhbIkF4pI/TwsjbsQyNPDTk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g0dppJbrVbniOmTRcRkvuscJnHD2CEgpjeF2FyW8AXUeeMHnWaToCnGvkEPPnpbmx4n+GiATioEyrn5yeLDBBI9AOzBKgiLvRjDmO91nYqNKVSzoU1zH6ajm9xPbDqZSpZinaQKGSnx476cEBax0Y6BJ4RC+hEQ8Y3FDdFKih0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=twkCdVi7; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="twkCdVi7"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cfe574976so30789435e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 06:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743428453; x=1744033253; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JcvIS8eeddlDCHMQUC+mFz0BhHofMLV7E7SV2Sxv+AM=;
        b=twkCdVi7ls9FnP9gxOMFGgjim7chM/LJvC2RRyHU8j4nhqqdZ/6qcTUx4YjHref470
         OwJL1L+KisTOmfr9c90iDUayORYoKKEzYrED92CbJp37GsDo+qDemYEi+0bcDKVW9pSn
         /AeHKjyU5k53LlcSVPC+jZeuFZktBqerrhWL5EWEXFFWDl+RGVBr1buoo6zEntWm4k1U
         3AWTTLoedr/ufOOwXn8bP7vBpIfp9oVzwj/sJGMrL3tEXrGorsdgv5NSy5+c0UrnAjLF
         2LCmTQ001SXdteCPVeMs5ZnZ1Nd3z+Yb3HkEl9dViV9JjbzhoZMED/9wkx/bO4FHqJeI
         IVeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743428453; x=1744033253;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JcvIS8eeddlDCHMQUC+mFz0BhHofMLV7E7SV2Sxv+AM=;
        b=KDwpJFoIqgTVIbZz9REulzgN0R9OtQq6tS+3aFI0mdOCmCcmGkIfRpvhOrJwWp9cbH
         DL+CH1eL+2owqstIRy12JCzX4e2Uz72nVQuRjgye3T4c4RFIQXUnFHS2eK/jL2PhctSq
         hCKZ/ksl/0y9G/nVpvldqOnQ6ZkJxibo91vrhOd9GpoRX0SQlcBJVCqn4uSlaKpuYaVe
         d9rgcBr31ziRfQzp2dJiYDIl4pp8Yh+IwmbV9/kw9DHpnjfIC31uuh5wVK38I1aygIW9
         w0iRVD4GR5QTNwvnsMsMNAF6vpe9JQg08L6i+9MQzDPnzAcxyQj59tgynTEPYvVPBLVX
         geJg==
X-Forwarded-Encrypted: i=1; AJvYcCXPygkTSl4Xa+LS11HWuyaNcbP+W2RmCv/7cs5+SFy4x+pIG41iMFm1ifYRMESImzFy5921KTJQtGQ3RCs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcBbobvxku9kJjRZPEWn+lzgQx6Ev1NyAhlA2aHk85Ow9t92yP
	Mmb9K1pjnwGMdgqbmzIQL7zOiItryaju8cZTxv1crrr07wKYrqhh/2ZYpkNZoII=
X-Gm-Gg: ASbGncsFDmI0TKZRN5lPafyqfKoE478MTGE9WOMtXQdX+E/b0E/cPue6b1pnlpgCni3
	h9YFY+ot9mh8Z2NjFfY12z8HEUvLQ5+ANQUgmfP9Uh2pYc2sxC7LACmmyJVCS9ohk4yoV5R9QBp
	fQ8CvBnHd1NmzrRPJRimc/yeOsuyhMLFChoOzY6x6kIOwSaFJBCEpsfAveP6RsBmE3E5G1SNEGT
	f9w7y1R4pg/dLXx5bpqlrl5HZmZzB+zZiJZ+2Ui7rNSiEt2EViOfQ2Wk3X1MsjCbQqliZ6/r78u
	aGFhqr3NEcTjXLJknVRRKEbFs/c3EE+Mhk5qOTsb8IVnfYt97A==
X-Google-Smtp-Source: AGHT+IGh3YEVtbE+1fjKhYwzjJfyAVJuJJfdjvfuRwAaPfMFF0DAxUF0d09/qUn91/N/4A/L9IqzrQ==
X-Received: by 2002:a05:600c:ccb:b0:43c:f8fc:f687 with SMTP id 5b1f17b1804b1-43e9dea008bmr28889355e9.27.1743428453321;
        Mon, 31 Mar 2025 06:40:53 -0700 (PDT)
Received: from [192.168.1.247] ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8fbc1716sm120986445e9.15.2025.03.31.06.40.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 06:40:52 -0700 (PDT)
Message-ID: <28dd049e-65b1-4111-8a24-ba9765bbb1f6@linaro.org>
Date: Mon, 31 Mar 2025 14:40:51 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] coresight: cti: Replace inclusion by struct
 fwnode_handle forward declaration
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250331071453.3987013-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250331071453.3987013-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 31/03/2025 8:14 am, Andy Shevchenko wrote:
> The fwnode.h is not supposed to be used by the drivers as it
> has the definitions for the core parts for different device
> property provider implementations. Drop it.
> 
> Since the code wants to use the pointer to the struct fwnode_handle
> the forward declaration is provided.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/hwtracing/coresight/coresight-cti.h | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-cti.h b/drivers/hwtracing/coresight/coresight-cti.h
> index 16e310e7e9d4..8362a47c939c 100644
> --- a/drivers/hwtracing/coresight/coresight-cti.h
> +++ b/drivers/hwtracing/coresight/coresight-cti.h
> @@ -9,7 +9,6 @@
>   
>   #include <linux/coresight.h>
>   #include <linux/device.h>
> -#include <linux/fwnode.h>
>   #include <linux/list.h>
>   #include <linux/spinlock.h>
>   #include <linux/sysfs.h>
> @@ -17,6 +16,8 @@
>   
>   #include "coresight-priv.h"
>   
> +struct fwnode_handle;
> +
>   /*
>    * Device registers
>    * 0x000 - 0x144: CTI programming and status

Reviewed-by: James Clark <james.clark@linaro.org>

