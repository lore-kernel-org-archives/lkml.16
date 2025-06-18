Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CBD2EBB8F;
	Wed, 18 Jun 2025 15:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750261307; cv=none; b=Gu8SI3IIyN2eBSaP+IgeSqMKTzBoD5UFzwArU7DO/6jtEJjLVmllsilDVWBdx+MDAh32TfqI3j7Udc/xu/2TFHQDKpE2tBJ1hJCuBh2k65qdWeYijET2nHo+MV72S7UorfFQoBplAF7lr5hYVYdANjJPxMgSuaT6Td2nC94q5Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750261307; c=relaxed/simple;
	bh=5fODnZj7QS2otvkNr8MgLNJBCJcLgbtpHvEVyhHXnfg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sk4OWMVd69zKaFJydmCmJM/1UwvUdW77xkyGGydDWn+pesTs23WLUOfvv/evqLYLrstXPIA51jrDf73bS0DlQzzLRfGxPrOtkZ1+qWzq2WiWsP2rMu+SnvtXrG714jwzfeA2HjlJnAnLAtDHM+uNwDtcKptlECui3KFSZslyz/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AekMSzAA; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AekMSzAA"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-748582445cfso4520455b3a.2;
        Wed, 18 Jun 2025 08:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750261305; x=1750866105; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=6L7uwG3VBypmGYHkgMmKs2bnckC2OdTHHl2gTv6nxi8=;
        b=AekMSzAAVbVbQOSRpTrjWsSk7QxBmrd/8EE6yCdQJknRo5Jvk8qJ/nz9Ui4zK0Rjhh
         gLksiD9a0s0XtAJqoGfXYVFvfo1TFXXOdOYagUNpQNNFbFkI/REgUb4s6B8+VkPRu8iE
         ez6t+6sxvsiQefRG5EUJiU5yId0t/z308Q//mC3yRJ/o7EbkFBG9pNRn6HBsmB8Me6fz
         hZD87bVRR+b6bdGPL9hFTA07CRLKrkJ7+YoH/HjndEmWQk42ZPpNfbbjUXCtOlWhilzU
         2K61Cv0hf4Oum/V+2Q0uX7mV14EH9Aw8qd8CsRJ/j6e7ucIVbzFl5aVqmatXYS3Htlh1
         KU9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750261305; x=1750866105;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6L7uwG3VBypmGYHkgMmKs2bnckC2OdTHHl2gTv6nxi8=;
        b=qgLIEa5OWgOha4FwhAPT8vFedtvnqb85vwf5Os9n2Sc05s2OkOxmihwFf7fKIXRaSe
         Mcc+1P2OUCtvsbpfgaaqBfvBQpnb0s4A1ul4h4p1JC5ToDRZsf8l6gNRrbmjZRI4GmiP
         sCsgma1XNUZbTJbqvWui3VugrtuI/+LlCv7vbmMkOpXG7hoo8ZBM9ez1bJ8SxN/E8VVy
         wNOMQ6MYoTPHRekhpRUq0H1iCcnF3+BrsBs3fvwBTpWSqFRNJZcLdPHcXRg6dRjMcbfO
         W3Sd2n7q/tiB7OWiNchvWZ4fsRIWAMrsoPqCNzYOWuiU/kSa5/2+fN/fce6aV4+63SYS
         ppwA==
X-Forwarded-Encrypted: i=1; AJvYcCWEOYZlraRzGnIv0j59gwNFqp+35qdmv+/zO5s5bcuU5g5lKYEazfx5Jf+kl3IxP+tnlDCAXwBrKOECIhg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxlkiy4KUjo5PuzrnUP0rcCErNeTu3fYOb8rWghkLZKtIFCRbrU
	aqo9RH9jFYIVY+BB2/XA/eh2k+wtQ7i1ZHRWsPMvKi7G4JM8TRTCIIEbJ6qwJA==
X-Gm-Gg: ASbGncsvAO3GUVFPrhpTylHS1kBsvkS6RihjGD2SPt+kKY7BqdZukft7n9Qm6DE7o4H
	4fRv6jAlJ1UMr+ijxHJKusqbBvkQVocn45pazbXgQMB1NMn1RQ1dPo3sZllm3vYJjcr9ty0FTgB
	dipFJ1dIvWwx4e0NXkY5OsXG99baeSvI44AJQJE9CivseYpMRcvEI3fsiDAmo7XS2f1lyh+oikO
	kwP+tMb3xHCbSHOdpIfWZnfJDL5gefQbik+LxaGHyzJwOexlfsm1mhUb9Q22WxVHEQ72xU7C2bm
	1ZW97VxzYwJ6X1xE6ht+R3Sgp+q2UXCgM1ZIWJg2mirKGu+Ohk5yOOERns4rfWHHSh7eRpXOd5f
	MR3RPFmV5bqTMc6093AJ48U0n4TuttSpX9CQ=
X-Google-Smtp-Source: AGHT+IGQyo4UfE08IhfAD4gv3entkgwSbHPGY5LZYuNg5wOXMVChIcNgsKcn+tJv2Ny6fHnEp9wAVw==
X-Received: by 2002:a05:6a00:3928:b0:742:a111:ee6f with SMTP id d2e1a72fcca58-7489ce3cd70mr19786530b3a.10.1750261305032;
        Wed, 18 Jun 2025 08:41:45 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748ded10691sm3033401b3a.60.2025.06.18.08.41.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 08:41:44 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <1144cef1-c4af-4fd4-93ae-70a2fcf67f54@roeck-us.net>
Date: Wed, 18 Jun 2025 08:41:43 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (corsair-cpro) Change dependency from HID to
 HIDRAW
To: dongfengweixiao@gmail.com, jdelvare@suse.com, linux@roeck-us.ne
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250618072845.233204-1-dongfengweixiao@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20250618072845.233204-1-dongfengweixiao@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/18/25 00:28, dongfengweixiao@gmail.com wrote:
> From: "Dee.H.Y" <dongfengweixiao@gmail.com>
> 
> This patch updates the dependency of the CORSAIR_CPRO driver in the
> hwmon subsystem. Previously, the driver relied on HID, but now it

 From Documentation/process/submitting-patches.rst:

Describe your changes in imperative mood, e.g. "make xyzzy do frotz"
instead of "[This patch] makes xyzzy do frotz" or "[I] changed xyzzy
to do frotz", as if you are giving orders to the codebase to change
its behaviour.

What is "previously" ? The driver always used HID_CONNECT_HIDRAW.

Either case, I do not think this patch is warranted. CONFIG_HIDRAW
creates /dev/hidraw for use by applications. This driver does not
need such an application to work. If you disagree, please provide
logs showing that the driver does not work with CONFIG_HIDRAW=n.

Thanks,
Guenter

> depends on HIDRAW. This change is aligned with the implementation
> in the `ccp_probe()` function, where `HID_CONNECT_HIDRAW` is used,
> indicating that the HID raw interface is required for proper operation.
> 
> Signed-off-by: Dee.H.Y <dongfengweixiao@gmail.com>
> ---
>   drivers/hwmon/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 08a3c863f80a..3f128cacb486 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -475,7 +475,7 @@ config SENSORS_CHIPCAP2
>   
>   config SENSORS_CORSAIR_CPRO
>   	tristate "Corsair Commander Pro controller"
> -	depends on HID
> +	depends on HIDRAW
>   	help
>   	  If you say yes here you get support for the Corsair Commander Pro
>   	  controller.

