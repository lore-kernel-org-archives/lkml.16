Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02FE20CCE6;
	Tue,  4 Feb 2025 13:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738675660; cv=none; b=d3M4q17J4uhRa7QxqHJOWN4eEMIzXt1c9GhMK0T33xa/8aBWDFEwQ17i1F6EGSlu77HbF446XxjHRlahPU+X0uIXJdWZRKbd8HzPcLKERCHlj+lTp5df7WiX/Rz5zjH7xxM+f2HHDPJ7tzuid/ysncH5/WGmudumJ4hLNvulFAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738675660; c=relaxed/simple;
	bh=Eea6tVVsxcD5quhQuC8Q0rg/2MRquw4Py7WKMnkLtF4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K4sWoGMl+ORWh9lzKyZ/MFWCUxrgU9UBBlW6cfI1NZihg9T9I2YpZT7ZqBVOgHa94Zibp/LCGagDUhUWHJGBrIS8INpVcyoKtqa4OOBUJJ2w78rwo5LpgzXiZZhogUUik2b2b6cmg51G3FwD5A660eFL1MWJqIN39Ogl7JghnAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZQNBgVPN; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZQNBgVPN"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-21f01fe1ce8so10384765ad.2;
        Tue, 04 Feb 2025 05:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738675658; x=1739280458; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h+CA2BldyjOx9FvLz2tJ+fofNSBWPBgA4xz7VrkZ+vk=;
        b=ZQNBgVPNOnt2Vbi/tWzGnZPzE2PQPRERxjuR4u4JJ0XZCWY90ZXdF44gsExzYJnPNa
         cI83X1aacgagpmpwGyPxTckF/NVNltkew2MC9M9ACuKlFQcivJe1Qkr5znkshDmXurzW
         i6zwTXY2IL4g9ACO5GEsm0jSRKh/Rkg6AhiMi2u9SjRs74r67Vv60PbpztK1MxzcidIE
         76QOh9vE0LnFwWdZaudzRZeA5jx33d632eqHiqVB3QlgjRVykQ8GS93xBG4YQlpGfDCY
         3HaPnpgRKXGUL7+ixtiwMpqhMig1f0Y0pH8mK++l2JwdVXGevpV9niQrm46ayLnHdvKk
         rKVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738675658; x=1739280458;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h+CA2BldyjOx9FvLz2tJ+fofNSBWPBgA4xz7VrkZ+vk=;
        b=P5EqDCxhkIeCucB/IwWJ+o24/moG2qgllnojgaX24+r9UolEai9R5/lPYfhM7GvMAL
         vpvRiE5tN+3H0UNw2yiUmlVeYNJctXgr70RJN9sVQ1rxRTHhA+r8aUP+pmejm/wcXyHj
         jRxUd1oh41fgCHgf5rB0TcVyYAP3Dc6DxfQ9suc1UTG9ANqikjYTxqVBXTyp4zVVetpN
         ezVOVDi2U8iI/48gFBazEEKx8/BJi+T9+71Ki9fDeuaTSjcq0/mEAYKrPQ+Mam/IGOeg
         wLa2vWS7lc6/Xd4h1zmJcU3tGxHqLrPLAy0itixx2LgqfRJeD4y4bD2qRqfNvpWtfZ8m
         sHIA==
X-Forwarded-Encrypted: i=1; AJvYcCU/1FkhcH5uTAvTZbChux2cvNRpPTbXIn/1oqncP8HosaJVla7BvTL45IQ2LdEM9PclXh7Okqq8PwBp2YoG@vger.kernel.org, AJvYcCVIQaWrjQ6kJiLc1aEq7LejACVxM1lqHSCBjZY0mFxBZl/xWKBHm31eMlC6mC+dhBGvbV1dOPQrn+A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyByDfwR7pfrLd7AZSHJ07fzwZ+OFMj0oNSQSubIlmPaNPqA8L5
	Kqv3Za83Ys87qzWRFqEAgBTaJsER21cSG3Ng/8eW2vVqOkPSdofx
X-Gm-Gg: ASbGnctUei5r8SQPYMrybGAofUnlFcjE+4Ql4ywEbnWGCR0Q7HDyI5Zz77yRkQAsdOZ
	anz68CbU3ldeyDi3bE8jnieJAsZuz1Owwx61qMDZ0hKLlFjb1TN6wCnhOXeZHnzKTc3pytO6HJn
	ucbKJ+av28KdD6XQ7WWeU8NJbun8Oqtj3I0mNaFrW0VF548T9w1z3m861SxTw4h4kwqjAtxdiNC
	itOtMzTIcTt3B0HiidRSJOoCJTZrWPtvWogJwfjlhw7OF0THNKvuoGoUPbJkrexzSkpuV8l0NJ9
	41tugkQ7G8+GBdYbY8Gw7tN3P0wTSPwLEAN6M7w1JIU7CgT/sVHKWRh6LL5qAA==
X-Google-Smtp-Source: AGHT+IEEW0/q/VtvvhnPEbZcH1VDRzg4jPTQ59ejDSpibTlIVbKLZKoJaK/7RvNrrV5fEfjXbrkIxw==
X-Received: by 2002:a05:6a00:35cb:b0:72d:9cbc:72fa with SMTP id d2e1a72fcca58-72fd0c0b6ffmr38948240b3a.12.1738675657817;
        Tue, 04 Feb 2025 05:27:37 -0800 (PST)
Received: from ?IPV6:2409:40c0:1019:6a4a:7b6:abc:27dd:e5f? ([2409:40c0:1019:6a4a:7b6:abc:27dd:e5f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe6a18cb1sm10403792b3a.169.2025.02.04.05.27.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 05:27:37 -0800 (PST)
Message-ID: <51cab6c5-e985-4cc9-8eb3-54aa13cf83ac@gmail.com>
Date: Tue, 4 Feb 2025 18:57:33 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: dwc3: Fix kernel-doc warning for sg member in
To: corbet@lwn.net
Cc: skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250204091552.15296-1-purvayeshi550@gmail.com>
Content-Language: en-US
From: Purva Yeshi <purvayeshi550@gmail.com>
In-Reply-To: <20250204091552.15296-1-purvayeshi550@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/02/25 14:45, Purva Yeshi wrote:
> Added description for the 'sg' member in struct dwc3_request to
> resolve the kerneldoc warning when running 'make htmldocs'.
> 
> Signed-off-by: Purva Yeshi <purvayeshi550@gmail.com>
> ---
>   drivers/usb/dwc3/core.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index f11570c8ffd0..5e4daec322b7 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -942,6 +942,7 @@ struct dwc3_hwparams {
>    * @request: struct usb_request to be transferred
>    * @list: a list_head used for request queueing
>    * @dep: struct dwc3_ep owning this request
> + * @sg: pointer to the scatter-gather list
>    * @start_sg: pointer to the sg which should be queued next
>    * @num_pending_sgs: counter to pending sgs
>    * @remaining: amount of data remaining

Apologies for not including all the relevant recipients in this patch 
submission. I forgot to run the get_maintainer.pl script, but now I am 
sending the patch again to the correct recipients.

Best Regards,
Purva Yeshi
