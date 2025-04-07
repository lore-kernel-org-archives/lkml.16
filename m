Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A8920E6FB
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 11:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744026106; cv=none; b=RLts77StdUSxTtCGLo/DPVsHeXPhth3D7hw7KRjsvuqdZXkeKfWH1A0VIuBng+Buj67YPoCNeyiA643qwKBUb1HBxitEKOV0fJ6D0DemOOiSjvHxgW4lY4I6bpS1sBmZe+Y+GKEiq2aZsTKGQ2jnrCWfldIj9zUf3r2uDCqjmhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744026106; c=relaxed/simple;
	bh=T1Gc1WsYyy+thC5pufNRIsi57oTBLKU11v4occxYB9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iCxjRFOoJHIqRuABSaPehZRMKY1yskW5HlHvnQFyBX1ESghv4rEjwBWgRHSjrFlIs1Rigq7+UFcb90PTfYLra2wgs2+dNAaasWeJn0cp4dr/0w7Y9xkBnBJr6dtPl4IEPLfm3lwo1IUncOJX82LT3rSJBCwrkVRd6+ohcqpk9Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aCtiMOu+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aCtiMOu+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744026103;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/18Tl/tFX6iSKG+VYUdH9MARKh6n7GdxvTDO5NcIXq0=;
	b=aCtiMOu+SaqNrndLEKAH2BnYfM7J+hlItx2RQwkADbUzPVZHUOUtXYy4uVQ6c5X3IA7U/L
	o8v0e2P4dNeH2myG76yriKLqkFemWUmWhMCxlNDBsojC8hAlmFZIMKVMpIFX3kiJWFS7/c
	9nUXRP/pd7bt6XV420M2AEzxConGFVM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-435--Tzwzpd-MkafjUyqpC20_Q-1; Mon, 07 Apr 2025 07:41:42 -0400
X-MC-Unique: -Tzwzpd-MkafjUyqpC20_Q-1
X-Mimecast-MFC-AGG-ID: -Tzwzpd-MkafjUyqpC20_Q_1744026101
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-39134c762ebso1862578f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 04:41:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744026101; x=1744630901;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/18Tl/tFX6iSKG+VYUdH9MARKh6n7GdxvTDO5NcIXq0=;
        b=ObzFlyZk3xjA04rhbktq4PwYcyosmmWOtl/1jn0wjIufNYFKxf24/B5MXNWJCE5T0T
         ayndohE3C8Tc0ncxsHyXRfLwsg2B+doYLHYZB7Wmk1H34yvHHf9JtDqvG3sbFprb9+UU
         u5wbmzMFd6tWjQscbKVdIl2F+8YS8W7cxNVGyWskrnQpfNDRfdoW3mcOUn4WtJyRWDcV
         lRtuT4vWifSUsxiYPwNOuUZGl4QwqGY0bH2cxxQuktwnuRhpsC+lFfdjWH9UQWZ9rcE1
         FY16bDYJ4it6G4m+ev759D8G41xE67G9LULs5p+/h/xz4aP/D4y/POqePOSOv81KAPai
         FXxg==
X-Forwarded-Encrypted: i=1; AJvYcCV1h2bgWDenNpYPER+N4Di3Fce8XApmn38OgTbQ0qKupLVUoTygdfHD1LqckFJ6N1PjV/55543m3OvijxM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzV2fu3GFHVVwLgFPLoQcrwlTjA/c7r5yAgqUIZNTXn+y5hjqdD
	Nl4vgLrCRGBCUH6MHWBlX3XVkbUhhlWo5GDMjtfc8vZBX46NeslCx8wzadMYiikty7YpqbmqOVl
	Xa33uDUmHvy1aCxs97fPKK6ZXnvGbFbJ3i/cI1jtaHRHkhu1Y/7MvpGSv8FHs1w==
X-Gm-Gg: ASbGnctN1ESygLHYxgLTHatJm8C6YV1xS3wt//5HaIyEiYiVKgEtyJU9xA2C0jjLSW+
	RVllzJN5wHkZawNOymYE5nTYTLn+He/skBJwfLpEw54b2IBMxL7L/NxSnqZRTlOB8/ghKkmkTN8
	VsdaflSl8ptpbavNtSFG0e8fSMZ2wil5mxAxSnAgobu1GETI+5vkFN3yLLsr7aeTZLvjueA7xP5
	qepY2c+YNDMMRT5TJ4cNC7yPEAC19hUwsM8162ZWvcFkrN6fZ32XuOgIEKfcbjA1eZfawt5IQFE
	aBLLpmRLmmO17p/3K1o=
X-Received: by 2002:a5d:6da9:0:b0:391:2f2f:818 with SMTP id ffacd0b85a97d-39d6fc00b4dmr6938040f8f.9.1744026100975;
        Mon, 07 Apr 2025 04:41:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5I8mCiAb1eBIzaa69eqs7IXjcg7TUnCrCJ0nVq8RtXubncMnApUfmUN9ILHJhvMKIwwyQQQ==
X-Received: by 2002:a5d:6da9:0:b0:391:2f2f:818 with SMTP id ffacd0b85a97d-39d6fc00b4dmr6938012f8f.9.1744026100616;
        Mon, 07 Apr 2025 04:41:40 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1795630sm133704795e9.29.2025.04.07.04.41.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 04:41:40 -0700 (PDT)
Message-ID: <14319e01-e7b8-4ab6-bc27-a2b02b755c10@redhat.com>
Date: Mon, 7 Apr 2025 13:41:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/5] media: uvcvideo: Implement Granular Power Saving
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
References: <20250327-uvc-granpower-ng-v6-0-35a2357ff348@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250327-uvc-granpower-ng-v6-0-35a2357ff348@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ricardo,

On 27-Mar-25 22:05, Ricardo Ribalda wrote:
> Right now we power-up the device when a user open() the device and we
> power it off when the last user close() the first video node.
> 
> This behaviour affects the power consumption of the device is multiple
> use cases, such as:
> - Polling the privacy gpio
> - udev probing the device
> 
> This patchset introduces a more granular power saving behaviour where
> the camera is only awaken when needed. It is compatible with
> asynchronous controls.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> Changes in v6:
> - Improve error handling
> - Use __free instead of guards()
> - Rename uvc_v4l2_unlocked_ioctl
> - Link to v5: https://lore.kernel.org/r/20250303-uvc-granpower-ng-v5-0-a3dfbe29fe91@chromium.org

Thank you for the new version.

I've pushed 6.15-rc1 + the entire v6 series merged on top to:
https://gitlab.freedesktop.org/linux-media/users/uvc/ -next now.

Regards,

Hans




> Changes in v5:
> - Improve "media: uvcvideo: Make power management granular" commit
>   message.
> - Link to v4: https://lore.kernel.org/r/20250226-uvc-granpower-ng-v4-0-3ec9be906048@chromium.org
> 
> Changes in v4:
> - CodeStyle
> - Create uvc_pm_ functions
> - Link to v3: https://lore.kernel.org/r/20250206-uvc-granpower-ng-v3-0-32d0d7b0c5d8@chromium.org
> 
> Changes in v3:
> - Fix build error on sh4.
> - Link to v2: https://lore.kernel.org/r/20250203-uvc-granpower-ng-v2-0-bef4b55e7b67@chromium.org
> 
> Changes in v2:
> - Add missing semicolon.
> - Rebase on top of media-committers/next
> - Link to v1: https://lore.kernel.org/r/20241126-uvc-granpower-ng-v1-0-6312bf26549c@chromium.org
> 
> ---
> Ricardo Ribalda (5):
>       media: uvcvideo: Keep streaming state in the file handle
>       media: uvcvideo: Create uvc_pm_(get|put) functions
>       media: uvcvideo: Increase/decrease the PM counter per IOCTL
>       media: uvcvideo: Make power management granular
>       media: uvcvideo: Do not turn on the camera for some ioctls
> 
>  drivers/media/usb/uvc/uvc_ctrl.c |  37 +++++++++----
>  drivers/media/usb/uvc/uvc_v4l2.c | 115 +++++++++++++++++++++++++++++++--------
>  drivers/media/usb/uvc/uvcvideo.h |   5 ++
>  3 files changed, 123 insertions(+), 34 deletions(-)
> ---
> base-commit: f2151613e040973c868d28c8b00885dfab69eb75
> change-id: 20241126-uvc-granpower-ng-069185a6d474
> 
> Best regards,

