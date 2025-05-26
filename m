Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684601EC014
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 13:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748265131; cv=none; b=uSHeZXaoOPDWSu43NJD363BrBY4J4e9iCQzqb0Yf4QU57GSrUmNeRIFjuIOQ5TnsLvx2YmcXHjKbfGhO+T4p/j7j3J9gWLmARF2RcqdklzKIZr57Yd+RpTaiBzHtwzOfPO4GRpj71KZmrKIhyjNvjU9dSr6wARANNbmP6Ae/bSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748265131; c=relaxed/simple;
	bh=44bXjYgEx472ZLSVxB8lwvgofdNnAFTyYjXw5ZsM7p4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EBx+ZMpKkiVK8c8yok455um0puhY42QmJIrxrSBjA9mE/5WhBXXH9ckxXxwcjZhOkOF+CBmXFWya/6YDXSxWLiF6a5BdBZKEybh8vcVLmFRm0YnftInuLkLK2SCyp8hHgO4bvEKEUJNj8I9aO620DZBrzL3LEEOLhneTC2j9dzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=e1COR2jQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e1COR2jQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748265128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xq9c/4s+1JsjImWn/4Dy2VS9W8X+CykJQ3FUvjdqC4o=;
	b=e1COR2jQBEsaec16ylPx4IXvoG2JQLEmQmVJ09DneQcRKv8YPLZpdHQTpGgWBhh5bmWBw1
	xSxajw2N4ALleem9giz211O5Ra9XNpTmeV+XeHHOSS++ALJtt0QRziPgBJD+m7tJ3I+L43
	O+E1XH8Ohzxoc8L2XXGvOA1YShwE/2A=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-277-2IJmQeQ9OUueT2z1LdeNxA-1; Mon, 26 May 2025 09:12:07 -0400
X-MC-Unique: 2IJmQeQ9OUueT2z1LdeNxA-1
X-Mimecast-MFC-AGG-ID: 2IJmQeQ9OUueT2z1LdeNxA_1748265126
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ad56222a1easo206077666b.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 06:12:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748265126; x=1748869926;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xq9c/4s+1JsjImWn/4Dy2VS9W8X+CykJQ3FUvjdqC4o=;
        b=RoWAOOQR8VCsToKbiNCyt5dCrVXrPSX+fKOG8h5kxVeSBuo75CWRw5Skfey1qnjShM
         GF+uDxIJdPWCqmEVCQzoqgsPw2Vsl4vbgcKKVdvL90qyTUu35LUZx1EhY8Kfg3OagrV0
         10QBq+gqIS5XbX6SkW0Sgcnh8jbowTuADd83Puhv09yFv4ZLAdwhv3dMl2lxMDZiHBuD
         Z9AC/nYvBY0MMACX72d1IsGHrqjl95Cu/uKde8yBRLqH1tfVMF6wN/p6uKoCN2i/0YwZ
         Cvio+6Rb2RNos4IcDiDzEsy7AtPl0aky+lHX6hBdbMtmnnSjMrnmPPWNzUCL6ah2xeOs
         A5/w==
X-Forwarded-Encrypted: i=1; AJvYcCWvFm/FpcuMI/7XTbYIbkibFzTq527+ToTg8w3Pspbw3uL7b+EtHrcYGO1E7gRFImwmHId0Ih7VSJvpSzE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx0tI2mQt4ws2h1eTWaNeM1CDO/bglh4QFZdURHzpBI6x/l1zs
	wJnj54TAvctHax3kB2OTT8KikM5kPrjWXm8zJeayzyVBpmH6rQyYdCDBoVxXL6OJ7the5y5Jp56
	03lxWXZsN6IIumQ6shcsKrhLF/t1cSdNGODkJZFgHc5XI5iN67fHbeAcfgLG2sBhgQA==
X-Gm-Gg: ASbGncs4Lgp8gWvRnVIXlhCfdwTn8f/ZtAegklR/V0gRbe21SS7UFbc8Lz7MW6B9dqU
	JwKBC6GBifim1cH9T6r5ndCv/RvPclKHTh6qY3pJOJCbkR2kYE+MM8E+dodjEe3zcRA6HSssV0D
	w/W6vc12d+vJeeJ9wN8qzqyA8JlajryTyvb6CSD79rNQM+errwJXJZA15o+1IjCCnIYcMJz8T+M
	JUX/6hKGIyZglrGanSh2YU2Bm7hVwacDqtQBgdWQa5WJDlqwPjW0KPE/V0ATmJLk6kv+i2t4i/d
	OYmY5lIfFIfZzI8=
X-Received: by 2002:a17:907:c26:b0:ad2:43b6:dd6d with SMTP id a640c23a62f3a-ad85b051c94mr849211766b.12.1748265125720;
        Mon, 26 May 2025 06:12:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTalOSdIadkbqa2qSmFa/eDGnX0/I30Frc7K2IlJnfyDCKJR+uuIozDsv6EgrW7jIXkRBXUA==
X-Received: by 2002:a17:907:c26:b0:ad2:43b6:dd6d with SMTP id a640c23a62f3a-ad85b051c94mr849207766b.12.1748265125351;
        Mon, 26 May 2025 06:12:05 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d04b073sm1662864566b.27.2025.05.26.06.12.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 06:12:04 -0700 (PDT)
Message-ID: <7ff90036-a890-40d5-9305-72c0debb3594@redhat.com>
Date: Mon, 26 May 2025 15:12:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] media: uvcvideo: Do not mark valid metadata as
 invalid
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20250404-uvc-meta-v5-0-f79974fc2d20@chromium.org>
 <20250404-uvc-meta-v5-1-f79974fc2d20@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250404-uvc-meta-v5-1-f79974fc2d20@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4-Apr-25 08:37, Ricardo Ribalda wrote:
> Currently, the driver performs a length check of the metadata buffer
> before the actual metadata size is known and before the metadata is
> decided to be copied. This results in valid metadata buffers being
> incorrectly marked as invalid.
> 
> Move the length check to occur after the metadata size is determined and
> is decided to be copied.
> 
> Cc: stable@vger.kernel.org
> Fixes: 088ead255245 ("media: uvcvideo: Add a metadata device node")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hansg@kernel.org>

Regards,

Hans



> ---
>  drivers/media/usb/uvc/uvc_video.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index e3567aeb0007c1f0a766f331e4e744359e95a863..b113297dac61f1b2eecd72c36ea61ef2c1e7d28a 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -1433,12 +1433,6 @@ static void uvc_video_decode_meta(struct uvc_streaming *stream,
>  	if (!meta_buf || length == 2)
>  		return;
>  
> -	if (meta_buf->length - meta_buf->bytesused <
> -	    length + sizeof(meta->ns) + sizeof(meta->sof)) {
> -		meta_buf->error = 1;
> -		return;
> -	}
> -
>  	has_pts = mem[1] & UVC_STREAM_PTS;
>  	has_scr = mem[1] & UVC_STREAM_SCR;
>  
> @@ -1459,6 +1453,12 @@ static void uvc_video_decode_meta(struct uvc_streaming *stream,
>  				  !memcmp(scr, stream->clock.last_scr, 6)))
>  		return;
>  
> +	if (meta_buf->length - meta_buf->bytesused <
> +	    length + sizeof(meta->ns) + sizeof(meta->sof)) {
> +		meta_buf->error = 1;
> +		return;
> +	}
> +
>  	meta = (struct uvc_meta_buf *)((u8 *)meta_buf->mem + meta_buf->bytesused);
>  	local_irq_save(flags);
>  	time = uvc_video_get_time();
> 

