Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2901F12F8
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 14:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746109357; cv=none; b=Q5l+RF7+CZtB6HXy6s0j6aL+hfNRC4oLP+WdHA2NJ22SAXH+pHj/M9pUy9OXngQudghsmeO+IYlBfqlrB72yS+UsNo9vwxqpERKbScbRo+eNIJdZorDxGaHkC1uAvQbEE8kwZ4cpyQdRZJYrzHm6AGVjdE854aovI4n5GnspftQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746109357; c=relaxed/simple;
	bh=hNjaiSBspZ+UBmsreusgIc2BvSovtY7pkegoMP8xBFM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DrPMbvPFM+KL8nFvH0wt1vCVRRCZyX+kWg7kcj0fizVqYPrfVZG6gMlopkxMQXzY3pqLwSBG0pnacPHoIKEUV9dDqWrOHz2QGMuVDa0yxEEA0yyB7qC7tciMM4b1D3xBZKyny1EtF89Ayf048XmnTSgj+EClwxebiOdrgyFQqpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dZLoZWox; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dZLoZWox"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746109353;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hkAUnIn6FFgVAGrawRWWcF2hLPPn39ZWsAD7ItD6a9s=;
	b=dZLoZWoxBQKA8J9EM52TUZASmdxV6NI6bbsVoqQY4dCxSx8bVws6Fb2cTATGU4T2z50B0S
	bQ1TI48r+/phlv9Kuni9NkDEdq+CNHn8i+yoggDohHzGx9ItfqsM0cjgRdohE3kXgsYFgQ
	32NSScX5NJY4Q+nfaaCXFsDOR5OeICI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-39-NqRwVNayO2C0BAaMc4frXg-1; Thu, 01 May 2025 10:22:32 -0400
X-MC-Unique: NqRwVNayO2C0BAaMc4frXg-1
X-Mimecast-MFC-AGG-ID: NqRwVNayO2C0BAaMc4frXg_1746109351
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ac3c219371bso65632066b.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 07:22:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746109351; x=1746714151;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hkAUnIn6FFgVAGrawRWWcF2hLPPn39ZWsAD7ItD6a9s=;
        b=KG8qHP1pxXju1JQhPJCplr4aajKBW0fWwLoaR+eawapvODhKT57zVAdRUCdnhOtzC8
         bgGPW2pT8kZd5PDaKZRhbEFzJXfUjcXVgSsFAFLxfd8tBNJ2z4XBDRcmr9DEADo+akCW
         Cw3QMSM5Eco8TnxjW2EFserCz3KABvBNFDmxsyliXBjQg+GMEIffTvSVmv7cOy/hoxl4
         e8U/NEnG8TZcfGA4LtiS9rtp2iVc2CHXNPExJIvMziylHU6ZVGKP9b5EG/ZBaCf8LZ4F
         4aFH3ghn7o/h4vocNHCqGmEhLzvNkJtMUk2ahgmkLWOTuqSg2/qV6SSEKfmIjjlSs+N4
         jb+A==
X-Forwarded-Encrypted: i=1; AJvYcCVmvGzYF/vkHyQJjwmC/16NF6IVENDmc1PsJOWEIkLTaRVLKhoZ/2gfA3Z8MDEKN9UDhMu0Fz1rAA/zCU4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlSKnaPwDsvpGNRTdJT1ytIEkTP94v1hFdRAMk2x739xK8Chgp
	P1DPMKR3Sbra4pjHSIskWpUKpkyRa+D5WgfIFEBDjzp8IH08DbQ2GU7ZLYFPe1v+mEHp5wTLhYx
	oh3qVakHIQh0wmDsVF7qu2gdq34aXuCjUGtzS/vtDxI+2+2auZb6XVpDPR2xnrQ==
X-Gm-Gg: ASbGncuLDILwKOnt4pBLRzUuWGr7V5uVqy1CJI44JCXZuNG3Wcsp3ydQ/mPkIzODkpA
	X9AmYsH7Rc7p3oc07yAF6RMuatXBeB1oWniKJ5cSTtgAANXTWyVsK4aE9nLewfb7N7TLZjG5hZy
	fW2mCTravUaTKLtoXEkgVv296jXDP48B06Z/kF1rL2IGV0AcVmJ2WvTHejxUH0RuCPU0ggVTh9Z
	6H3f62eufycVSmlk+VYt/ht0fCAzpW63bd3L8iYEVpWPFxfubaAk77DcKPOifOR/0v4F6y0GbzX
	qytXaMYBAYB8OZkxPYUHA0zatAaEgXl+/Eq4y1ZQJcxNq4jf0Ht0Fz+0tQw00g6ZUaoW4a1/nV7
	cmaiu6KusV7s7O1rmxhMlQzXs90P30Umc6W3IJcac8TX9ezDsWi2xzQFYc/DgPw==
X-Received: by 2002:a17:906:f583:b0:abf:6ec7:65e9 with SMTP id a640c23a62f3a-acef49a2659mr340185866b.43.1746109351193;
        Thu, 01 May 2025 07:22:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQmCIsPg7hTA49kuwUzziwpHJFu2yj1P2zhbby8GVrxeUIu/zBWlAvOLjXWp6RRhte8XIg8g==
X-Received: by 2002:a17:906:f583:b0:abf:6ec7:65e9 with SMTP id a640c23a62f3a-acef49a2659mr340183966b.43.1746109350904;
        Thu, 01 May 2025 07:22:30 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad0da55b24esm46601966b.132.2025.05.01.07.22.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 07:22:30 -0700 (PDT)
Message-ID: <e0a01923-7d66-4076-a125-83875c60a48d@redhat.com>
Date: Thu, 1 May 2025 16:22:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: media: atomisp: fixed spaces to tabs
To: Thomas Andreatta <thomasandreatta2000@gmail.com>, andy@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Andreatta <thomas.andreatta2000@gmail.com>
References: <20250426193033.483124-1-thomas.andreatta2000@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250426193033.483124-1-thomas.andreatta2000@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 26-Apr-25 9:30 PM, Thomas Andreatta wrote:
> Removed spaces and substituted them with tabs.
> 
> Signed-off-by: Thomas Andreatta <thomas.andreatta2000@gmail.com>

Thank you for your patch.

I have merged this in my media-atomisp branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

And this patch will be included in my next
pull-request to Mauro (to media subsystem maintainer)

Regards,

Hans




> ---
>  drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> index e176483df301..0d5e35845ed7 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> @@ -518,7 +518,7 @@ static int gmin_subdev_add(struct gmin_subdev *gs)
>  
>  	/*WA:CHT requires XTAL clock as PLL is not stable.*/
>  	gs->clock_src = gmin_get_var_int(dev, false, "ClkSrc",
> -				         VLV2_CLK_PLL_19P2MHZ);
> +						VLV2_CLK_PLL_19P2MHZ);
>  
>  	/*
>  	 * Get ACPI _PR0 derived clock here already because it is used

