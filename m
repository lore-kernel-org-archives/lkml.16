Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1307A22D790
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 14:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746541280; cv=none; b=dXW4o/4AynzPDwvih/fnhl0WxHw0byeRXuXebgfSWSOG/e4fQ81az3/pCK1ba+veUAXxsZm9YkcYC9RqBCmiU3z5RS1769N7BXUGbu7+MzGA468Bk1NKxKw+G+4BdaCnZmr/gjaUw9o8HNAIXUEARV21VrDRG3+SxBrI3waxWN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746541280; c=relaxed/simple;
	bh=v6tIU51WKjF1/NkIyoROw5WXrzlZQWyxho0C1tB5QrA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=mrnlIoXtWMPImBufwwyKTOGf9zHEWA/1OfihlNPIYpe0CzgxrHNvz9LnAfc5YNbVM8L3mFAbYOQquCIc2z1wJ4rF2+Ewc+Bi3JlEFNxj28dwDB2GurgJDMtfvBVu91kJH2mO9f2UGTJ+fxvvXMf+JWs7VU1ypIdMf7XMaHeraX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=egtvekn2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="egtvekn2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746541276;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ra8dT+u0znMisKaFww4zDPkxUuk3oLrk2DWOA7MbbUg=;
	b=egtvekn2FsXfdc4Ukwor7XH73weeVnJjfv5baG7LGbYcgPtRmboVa0Edqu+EFqRVZbeWlm
	MWBgAPM8GX3euE2xEd3krtCajJ6o6UCo+yTm/zJ3g4qOmli4n+pJ2m7/Kpx3QBta6DBpv9
	oPKcJoL/R161ktWNEAHg6OPVk2Zucuk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-173-LmFDlsajPjiFBkzS6gRFuA-1; Tue, 06 May 2025 10:21:15 -0400
X-MC-Unique: LmFDlsajPjiFBkzS6gRFuA-1
X-Mimecast-MFC-AGG-ID: LmFDlsajPjiFBkzS6gRFuA_1746541274
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43cf44b66f7so32411925e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 07:21:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746541274; x=1747146074;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ra8dT+u0znMisKaFww4zDPkxUuk3oLrk2DWOA7MbbUg=;
        b=tRz25LfAR4dvb9TEkCrUMBLmrpQI92JoNsi2vhK1FL96v7SEYpEQlb7NlR9qpLiwRE
         DvArQspf8pS0xdY/Io+uQ83F5eqMZx9pEnJD3/Lh2TzYnvnkZYsidQyG+lBRp7+qr4lH
         H8OPIc7KtHmuMjXBoKnxzQ/xyVsIq7C9W0X/OI4XIyjClg12LALU42sLIy6GnmnFAgYk
         nkQJd2b4jmawCpHlBsJBvDq4zYvOBg2tQ0ErwUVFi9+K5iO9L+sm0rpdmN8Fg7f1irji
         P9x6WKtTreJcdejsAjTfjZO5WwMaTVgY1L7aPVmITvxuFG3saV27N8Yhp2CLcXMaDYmI
         43vA==
X-Forwarded-Encrypted: i=1; AJvYcCUsh6taBeVsNAedKClTmHtdI62H2vWKNuNwKue9t8PKXtf5qp8goNlORLEq2x6FMF8o3nHY5480gVN+i08=@vger.kernel.org
X-Gm-Message-State: AOJu0YzONcorx8GlZMJsR+XIKH0qEAcQ2qc2yTOx41RcYCp9RgUEA3Np
	TNU/FLkdfIGy0wYtI9S6dfeTgdNk+i9XRmEPUD7CKCRKYTIcgAEIUANoINtWJXp1vOEtY8nMF9P
	y/365kfbBiUBf2P4/pIDWNnTZuN14s+AemGM47HOnMVC4Ww9wNlufvjq8vlw5ZQ==
X-Gm-Gg: ASbGncvc3auMEcHYgr2P/n8jeZBWR8R6AYSg7dpMzHsHX4nT4BHiduTrMrQxXPmXshy
	7AqQV+zr6/bSMBVIKyO9qEFvg751Zqz8kLbtK6zHV2r9KI2KZv230de2slwfjNWPNLftyqO8R+A
	MZuE+fswZdjQF79rtGIoamQungy/CGowvhfF3gvgAdz7Ix5CfdvjKAMarlEnRL68MfKuwkIle2u
	Wynzl6xaIw5213nL0ruH93At99/+2icNXPUa+HWsyu//7+f6YWGC9yw3LvqDX/G5eX5wJC8f21D
	HVqpOkrAK5iH6FSDPPRP1iT2woOGpYM1YvGZj+vNBlHIMNF1BtE=
X-Received: by 2002:a05:600c:3e14:b0:43c:fceb:91a with SMTP id 5b1f17b1804b1-441d0fccc42mr27860425e9.11.1746541274437;
        Tue, 06 May 2025 07:21:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcl3pdRwGtR90YF92Wz2k29+8QkFp4HNoMWwAPK/gnK9MygK9LLY/Q0xnpACkC8ozFWRpQJg==
X-Received: by 2002:a05:600c:3e14:b0:43c:fceb:91a with SMTP id 5b1f17b1804b1-441d0fccc42mr27860085e9.11.1746541274068;
        Tue, 06 May 2025 07:21:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ef9e:3e6f:fd9c:5630? ([2a01:e0a:c:37e0:ef9e:3e6f:fd9c:5630])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2b28732sm215496895e9.37.2025.05.06.07.21.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 07:21:13 -0700 (PDT)
Message-ID: <9876f066-d01d-41fb-ab6c-e474986dfec1@redhat.com>
Date: Tue, 6 May 2025 16:21:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Add entries for drm_panic, drm_panic_qr_code
 and drm_log
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250506133143.156447-1-jfalempe@redhat.com>
 <87tt5xvob0.fsf@intel.com>
Content-Language: en-US, fr
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <87tt5xvob0.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/05/2025 15:52, Jani Nikula wrote:
> On Tue, 06 May 2025, Jocelyn Falempe <jfalempe@redhat.com> wrote:
>> Add myself and Javier as maintainer for drm_panic, drm_panic_qr_code
>> and drm_log.
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>   MAINTAINERS | 28 ++++++++++++++++++++++++++++
>>   1 file changed, 28 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 38df6b159a3b..df3abdcf1767 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -8177,6 +8177,34 @@ F:	drivers/gpu/drm/drm_panel.c
>>   F:	drivers/gpu/drm/panel/
>>   F:	include/drm/drm_panel.h
>>   
>> +DRM PANIC
>> +M:	Jocelyn Falempe <jfalempe@redhat.com>
>> +M:	Javier Martinez Canillas <javierm@redhat.com>
>> +L:	dri-devel@lists.freedesktop.org
>> +S:	Supported
>> +T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>> +F:	drivers/gpu/drm/drm_draw.c
>> +F:	drivers/gpu/drm/drm_draw_internal.h
>> +F:	drivers/gpu/drm/drm_panic*.c
>> +F:	include/drm/drm_panic*
>> +
>> +DRM PANIC QR CODE
>> +M:	Jocelyn Falempe <jfalempe@redhat.com>
>> +M:	Javier Martinez Canillas <javierm@redhat.com>
>> +L:	dri-devel@lists.freedesktop.org
>> +L:	rust-for-linux@vger.kernel.org
>> +S:	Supported
>> +T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>> +F:	drivers/gpu/drm/drm_panic_qr.rs
>> +
>> +DRM LOG
>> +M:	Jocelyn Falempe <jfalempe@redhat.com>
>> +M:	Javier Martinez Canillas <javierm@redhat.com>
>> +L:	dri-devel@lists.freedesktop.org
>> +S:	Supported
>> +T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>> +F:	drivers/gpu/drm/clients/drm_log.c
>> +
> 
> MAINTAINERS is supposed to be sorted. See commit 80e62bc8487b
> ("MAINTAINERS: re-sort all entries and fields").

Sure, I will move the "DRM LOG" block just before "DRM PANEL DRIVERS"
The rest should be already sorted correctly.

Thanks,

-- 

Jocelyn
> 
> BR,
> Jani.
> 
> 
>>   DRM PRIVACY-SCREEN CLASS
>>   M:	Hans de Goede <hdegoede@redhat.com>
>>   L:	dri-devel@lists.freedesktop.org
>>
>> base-commit: 258aebf100540d36aba910f545d4d5ddf4ecaf0b
> 

