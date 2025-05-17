Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3EB81F4C9F
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 11:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747482728; cv=none; b=qG0V/oVltQAGA2l3tKO03rBCYu/U0xwBmTXN0x09lqZjU3Pq0b04xf3xIbW3lBh+/6nQ9KNa7OcoHTvj7sf5lV/iZzVBpPpXoY1BoR6FSVIAi6etS42HJRBh7hcHqKpJgp+x3ZLvHfFOsefTjNSyiNTQvuRuiCEJ9RBiPpeX5rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747482728; c=relaxed/simple;
	bh=m5hZn2lBKz1PWAaWSHBVZ7i7dyeqEjyGUoYURXdR9uM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=awsiBhneD2hhe2bKh4CDZ+uCkIgLkoYcTpcZyslHgVY8ezd6w77MUuEnbJmIQDSweVyNplOLAYz+hhS99UHkbiQUQQtidGoE0wWx24KTIPrApT4vuvlOIQJMSYfIpZggh/NdQ2anGvO6uQA79cgxjRagyS9VTxQqE4uqHXYlORk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NKYPUYtm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NKYPUYtm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747482725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WI7rWNSKhgDqBhYOHrrkdZ0TEF2u5UshAdR0shZptPU=;
	b=NKYPUYtmgo1aXQe0o5Lad5yT+SQjMfg4AZtrIPqyxZDZ/3B3naH2B9r6opSd6ZZHBsaGcb
	qjhbvskVbJhvuvJhXjxlUy0zBzisQ2l9J9N/HcWiDkS05Z6M3+EUXlO4LfjlgCfVNz+NKp
	OU1y1SPMKOpUA4Fye/+U5KxqYpkQYAM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-_Jyt_5LHOjW4BdcL3s-yyw-1; Sat, 17 May 2025 07:52:04 -0400
X-MC-Unique: _Jyt_5LHOjW4BdcL3s-yyw-1
X-Mimecast-MFC-AGG-ID: _Jyt_5LHOjW4BdcL3s-yyw_1747482723
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a35ec8845cso783078f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 04:52:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747482722; x=1748087522;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WI7rWNSKhgDqBhYOHrrkdZ0TEF2u5UshAdR0shZptPU=;
        b=C5Gxu0TVI+LYsi7pMK+Hdo/U+++mftbhloKTJWgOhjC7jyva0o2osn5WluQ5oxa0eu
         E9A2qHNd9H0D0loQn2BG90DyGOjY9mHLPiII3jMgqwIG3YvihgDXLeUAMB0BLgCJKFGt
         dRzmGhN3AToV68e0o7JovMfC9+1FJT39CJCdqVRcUcwU+NzIZbRLBhpLgDNu4vL0Gp2K
         me5hjzRS7GY6lxXSMXfo0uiPcE+jKRzwMAIssMtrvHRA9SeYosTSSmEc7Vt/ct9GYuyz
         SECY8oswg0GySbDDmvz+SjKU0qGyHNbKCvHri2LI+oQWvPw2n3JVtkLQc1v9vsDhQEtG
         osrA==
X-Forwarded-Encrypted: i=1; AJvYcCXGUNd7cCqsEfqW4lJ0dUw8x1ZiaP/tzZ3LH3ZkhHaPCzvE4Bb7zrsTO50IyBM6Z9DqP0GqHVkAeuU/BYc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDWwI/X3LrdWae1V17/h2PaCosFCZClW33YZiIkJ++RnpIdYFY
	LsFUD+pv5hm5UWN+pa3cHB1Z5ItLNJYs828hBB6gdaNyGl9oToSnL5ipjeKN18SHeaiBx3Y/SPp
	AefTWXXJcwguk8uBxltKHqq5hv6D8m05sbYRZj7YrXJoXTwr9bpNnwIr+BObVZ52dm2cbkAIN3/
	Bp
X-Gm-Gg: ASbGncsESszeFaGrrshyuMQIQGHoCNN2KNgHoumo6BBl4gQxKiGRzk5tzY3+Sm39Siz
	j3QjanhfcsxbJ3jngjvXkG2QF2joxDTocMArdPNkFhzZAnhO1eWjxwWibgv7sqJ88Rs9weA404n
	saVX3xG1YdcgCO+oO5Zxo607gQLy/M+VGRGzi8CsekC/Cg+bhtOZjcIkjmspAsj3fn1tVzQRk/R
	6OJA1x/rlDDkuvv8rK+FozIcfsLV7PJ3oeEKefshrr1LHifdAzn2xc4UmwwNIAkCfVIZECQVpDM
	c8FaJxawvgyong==
X-Received: by 2002:a05:6000:2dc2:b0:3a0:b65b:78ef with SMTP id ffacd0b85a97d-3a35c845c04mr6604836f8f.52.1747482722505;
        Sat, 17 May 2025 04:52:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEManXnYpBgRjM8l6x5mvWBUQhw2KLN6YmgUA9pVhlJcvB3dgeZ4KHw08Pb6yV0/tksn56dg==
X-Received: by 2002:a05:6000:2dc2:b0:3a0:b65b:78ef with SMTP id ffacd0b85a97d-3a35c845c04mr6604823f8f.52.1747482722165;
        Sat, 17 May 2025 04:52:02 -0700 (PDT)
Received: from [10.124.0.73] ([89.207.171.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca5a5b4sm5922936f8f.21.2025.05.17.04.51.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 May 2025 04:52:01 -0700 (PDT)
Message-ID: <6d1bd031-cdea-441e-98a3-b1f16dc55d4b@redhat.com>
Date: Sat, 17 May 2025 13:51:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11] media: uvcvideo: Fix bandwidth issue for Alcor
 camera.
To: chenchangcheng <ccc194101@163.com>, laurent.pinchart@ideasonboard.com,
 ribalda@chromium.org
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, chenchangcheng <chenchangcheng@kylinos.cn>
References: <20250515111406.1470687-1-ccc194101@163.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250515111406.1470687-1-ccc194101@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi chenchangcheng,

On 15-May-25 13:14, chenchangcheng wrote:
> From: chenchangcheng <chenchangcheng@kylinos.cn>
> 
> Some broken device return wrong dwMaxPayloadTransferSize fields
> as follows:
>     [  218.632537] [pid:20427,cpu6,guvcview,8]uvcvideo: Device requested 2752512 B/frame bandwidth.
>     [  218.632598] [pid:20427,cpu6,guvcview,9]uvcvideo: No fast enough alt setting for requested bandwidth.
> 
> When dwMaxPayloadTransferSize is greater than maxpsize,
> it will prevent the camera from starting.
> So use the bandwidth of maxpsize.
> 
> Signed-off-by: chenchangcheng <chenchangcheng@kylinos.cn>

Thank you for your patch. Laurent has merged this into the uvc/next branch now, see:

https://gitlab.freedesktop.org/linux-media/users/uvc/-/commits/next/

Regards,

Hans



> ---
>  drivers/media/usb/uvc/uvc_video.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index e3567aeb0007..11769a1832d2 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -262,6 +262,15 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
>  
>  		ctrl->dwMaxPayloadTransferSize = bandwidth;
>  	}
> +
> +	if (stream->intf->num_altsetting > 1 &&
> +	    ctrl->dwMaxPayloadTransferSize > stream->maxpsize) {
> +		dev_warn_ratelimited(&stream->intf->dev,
> +				     "UVC non compliance: the max payload transmission size (%u) exceeds the size of the ep max packet (%u). Using the max size.\n",
> +				     ctrl->dwMaxPayloadTransferSize,
> +				     stream->maxpsize);
> +		ctrl->dwMaxPayloadTransferSize = stream->maxpsize;
> +	}
>  }
>  
>  static size_t uvc_video_ctrl_size(struct uvc_streaming *stream)
> 
> base-commit: 9f35e33144ae5377d6a8de86dd3bd4d995c6ac65

