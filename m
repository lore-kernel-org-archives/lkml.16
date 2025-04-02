Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066222356A0
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 11:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743594910; cv=none; b=eKGre1glPP+FqxT+P2nkafstmdeY0iwtOH4ThQAtttKH+AKpSfgULB3VehkA4VXL7FpsSSe75c4flli5gbkXAtGu56flAPwaLLvDcrqmJWU7zYNDVMriSkUg6suRwPDJfjj4yiycxDtEGLn/FFWGS7fLLpiWE2AVDW5G2g9lb8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743594910; c=relaxed/simple;
	bh=nENsrqmWbegOZG/r1X2PxQn++esBRh+Li8k0rldpTEo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qiGyPyrL/nK9xyYGZbwU2DONpIEv5JUT3kvRsWDYxNDtrApDl5vRhsmNrJz70zXloaU2xnaStitmRqtnf5N+JUGlD62jbJ/de+a1msmq9YuCm1Upm/lofUFm/0jBsrCfj5Ogm5Ix92748vZmQScTiQdO1dwDlrG/Mx2PHcxtWWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gKZy9vXS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gKZy9vXS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743594907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wz4FfrnCRhg6e7/GKO5rTqDjU53m8lZ5KDISSPVBre8=;
	b=gKZy9vXSeYIx/PMZJfivqJczcqIwdPcuh8Nn+dK4wFZ8dz3a5K+oSgG0Bc393RYy95HSDb
	OBemwJY5m+l+4RLw2Kp5kJuopi+z915J9F8BeWwpShnjmszoEfDP3L82HOz8z6ntHTV74B
	+PbpwqCsLkCHT4rR/gm0HcSOasyE5mA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-204-lwrlsvR2NcWl9MvtwIZLwQ-1; Wed, 02 Apr 2025 07:55:06 -0400
X-MC-Unique: lwrlsvR2NcWl9MvtwIZLwQ-1
X-Mimecast-MFC-AGG-ID: lwrlsvR2NcWl9MvtwIZLwQ_1743594905
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ac3d89cc4f3so516377066b.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 04:55:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743594905; x=1744199705;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wz4FfrnCRhg6e7/GKO5rTqDjU53m8lZ5KDISSPVBre8=;
        b=FgUQL4u1z332DxuZdn8ecEFTPRyHgJaYQ+y3puus3cy+3Fwt5cr5jJJgPY9n4xpRY8
         Qkxf34UYudesekNFWvSYgD0D0MovPJQsPHsQpYO467IjKBYnE5mMVlzqQh3GBRUTVN5G
         lfG0kHes+0bFzZmAC7ZVnnpEo1nrOdXhm03RNUwjWZ4y5hoD88ESuvEt8/QXFj9N3edd
         wAPwMqAQdUo7pnVy1Hqnc8mqOWbQrn/Sj37O4EkaGEJXNJs3CjbEb5JwROdjrXJAAlTo
         3vF++4oPyQqd95wqpdhPGHTPmtaafK3uuo64W/hsULyY2hiAfAOa7oysjrx0kJRWhhl7
         zW1A==
X-Forwarded-Encrypted: i=1; AJvYcCUCgRn/bYMuuQYCnZeFhxJIwitC+WG3d/jqO8DQtxHMwDtiG5FtKTT9isnIa55XvDl/EELAEHRV74ZI5DA=@vger.kernel.org
X-Gm-Message-State: AOJu0YydaDw7tjgwhWWDj7+0kPXL0oOqHcIqiSARtwRRezhZ5q4ZqydP
	noIDVcc5ShlqL8UlW+l9AHTrCiQl57vyB4wbGCAGwVImcUwYoTpTYgPfhizYjZN8enpr42jTxHb
	E+TW4+5y28IsyK0+tcxSj+ZV8d3C2D/0UjgYAgLflBTShYK0y4wdlMmhatCyRJQ==
X-Gm-Gg: ASbGnctf5bpQr1DBcdmMA5XLPK+aQHPeTtxLle7KwlmZujWCYwmNxZpwwGUVnofeOBh
	+bUpFDOYOGYEjkznL39RqWhXf4kC2st1w+73OTuxvqOIuVEXwnJrZQzSL+jYhwss+h29btJLuDx
	TJ0l0A8eUfJUzEyCTNEdzAcpilmlpZweBDiIv4zqCHhCRZqo5lwEvNhudHaUpI8AFPWMgIpAyGn
	YWw+GDR5cimg2+CrR0NH6iaPoVWh6+dAs11kufCvIihl5mZmyUK+TOCYDnQxtmiA/TTOuzoNkbS
	gEwJ8I5vYNC6ZMhWRihQadtkFDnALMsQq74pQVXXqaOdZHZ1Dk3VrVUkVQ+xKpvu3hrdNSK5dGO
	eR/YSjkHFT2/nZw+gF3KZg3Mfc8HjFAkjyEO4bq+RTaGpOCV3LJWnY9hYOXrXh2e5rw==
X-Received: by 2002:a17:907:7e82:b0:ac1:effd:f2ea with SMTP id a640c23a62f3a-ac738a82f63mr1519900466b.24.1743594905452;
        Wed, 02 Apr 2025 04:55:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5nJsoUbdzDsoVfY6aWJ+75CkT2U3THLfZxOsW3hmwXfpxrhyV3hBIjXRvBVKnq7fFcjCx/w==
X-Received: by 2002:a17:907:7e82:b0:ac1:effd:f2ea with SMTP id a640c23a62f3a-ac738a82f63mr1519898866b.24.1743594905016;
        Wed, 02 Apr 2025 04:55:05 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71971bf3fsm897184966b.182.2025.04.02.04.55.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 04:55:04 -0700 (PDT)
Message-ID: <cc9f5c30-45a6-4130-bdf3-732e5f1c6d2b@redhat.com>
Date: Wed, 2 Apr 2025 13:55:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Bluetooth: btrtl: Prevent potential NULL dereference
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Jeremy Cline <jeremy@jcline.org>, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <0174d93d-f3a5-48ed-a755-ed7f6455c1bf@stanley.mountain>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <0174d93d-f3a5-48ed-a755-ed7f6455c1bf@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 2-Apr-25 1:01 PM, Dan Carpenter wrote:
> The btrtl_initialize() function checks that rtl_load_file() either
> had an error or it loaded a zero length file.  However, if it loaded
> a zero length file then the error code is not set correctly.  It
> results in an error pointer vs NULL bug, followed by a NULL pointer
> dereference.  This was detected by Smatch:
> 
> drivers/bluetooth/btrtl.c:592 btrtl_initialize() warn: passing zero to 'ERR_PTR'
> 
> Fixes: 26503ad25de8 ("Bluetooth: btrtl: split the device initialization into smaller parts")
> S

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


igned-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/bluetooth/btrtl.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/bluetooth/btrtl.c b/drivers/bluetooth/btrtl.c
> index d3eba0d4a57d..7838c89e529e 100644
> --- a/drivers/bluetooth/btrtl.c
> +++ b/drivers/bluetooth/btrtl.c
> @@ -1215,6 +1215,8 @@ struct btrtl_device_info *btrtl_initialize(struct hci_dev *hdev,
>  			rtl_dev_err(hdev, "mandatory config file %s not found",
>  				    btrtl_dev->ic_info->cfg_name);
>  			ret = btrtl_dev->cfg_len;
> +			if (!ret)
> +				ret = -EINVAL;
>  			goto err_free;
>  		}
>  	}

