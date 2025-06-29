Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9745419E82A
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 12:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751198887; cv=none; b=ooINryHARcxocZJxyhFLuJqOmS0F81+gjqlkZNqVXoSV9Q+a6JKVXqIq17IMgjGfM2Zqcopajp2cxMzBhpAmN762pmQyiAITiCL45aUfYkVk1XdOxzYO8YStUgK9Aq4ASrPIxMDJ5g7tmAcR6K4aPmJFqym3qCi3kYyu86NYp/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751198887; c=relaxed/simple;
	bh=Bd4ZFb5mI/vt0MlkmiVCP1yVrwm4sXAQYCfiPh8N3BA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RdIJ77y97c5XVTJcBt2zvnn3DmNXUwFTVKJXwkGpNsW9lZ/pn7E4ZDxS1GHJIHoe12+ghuckWPVEIIVnGrru891VbfLCMjRSx29wuMfA91k8fM/1ZTnJmTkRO9FPGtKzp23lH2aMRMIFyQP3CRgX1+Pcu9T991xbFUSX5H+Ilro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AcSwfLw+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AcSwfLw+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751198884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y61uksNXY3bfxfbmhRvj/wWi6127GwpvTiXCWAuJy7Y=;
	b=AcSwfLw+eR77dtav8RM5UgkU0RGUt+2bIs7ZQjYUEjgx5mZjp1u36XjAjuwdhhpYiW2JAW
	xzTVFrRSE2AxHXqIdsPjQS+g1gkB9spo/OrjUaahDOpHBjlIqBfAkioc1IRmqxGOFEl7L8
	CYklQjDBIiJZ7xh8FEjOTut4cwSKuSg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-4zKEoKWVP-C91VTfcK1EgA-1; Sun, 29 Jun 2025 08:08:02 -0400
X-MC-Unique: 4zKEoKWVP-C91VTfcK1EgA-1
X-Mimecast-MFC-AGG-ID: 4zKEoKWVP-C91VTfcK1EgA_1751198881
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ae0d798398bso248903366b.1
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 05:08:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751198881; x=1751803681;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y61uksNXY3bfxfbmhRvj/wWi6127GwpvTiXCWAuJy7Y=;
        b=BVIxKJ7/fX8+6cCvqsjc/ysGFMPwUDsxOI8+gPqRxivsE/JYPSVoQMXUxyyZg0ZqEL
         R0XDMU6KaQ5DpvwTqCX+ZhROrQyhfwV68Klx30Hx0S5d8y8yHcB9VPXdliwubc408rCs
         rCzq5rCBIgO4RHwCg2DQQv75OJj4+thVgt58jlz58lNXf64mAOxWej1fjSP/fT0SOVLA
         y5JedyLhHrZlB/MqzaB/dCv96OV31yxJMhc4sBoH9JWJfigN8qOSMq8VHoNZMpJ4WwvD
         rgYsjarLZXc7qIT0uYFgOxDWFHJTKT1jAGvHOOIf3lJkKkTZcb2rjxrXod2uR93z2gFf
         nPcw==
X-Forwarded-Encrypted: i=1; AJvYcCWpwv3gN16fs8rkmdHg5POEzXFfPyTc9y6sCGDdr5zy4f9DC+zNhJwTzjVsiRksZe8xp63RT4StCB/c5+o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCPpbbwvXVeg5/36GiWRZMH176jWW1H158Ecb9b+wpSNTs3nQc
	LUwjB6f41h0LatlM44toLZqb8TigaoGUXHOFENi02GnG0DbZYDwG0pMJxMgXpyGdPwaiMzQcmSn
	J1800O7DOtsIV1Wx+/g6UDvNTKNySxZsM0tmPJ4Mynu6gdtJVPASu2siNICdYkqhNpg==
X-Gm-Gg: ASbGncuSO/dZvfFHsHm3znoQ/f6Km37GK5SQKQ6hxXFb0pDiKH93sdtl8kQrLRB/mRT
	VCvGhljYdZkRXThPncd5XJO5NVJ2PIhNbKDnO4tz/U5rNL5aOAjYrTlzzGNvTk6U7xwE+irdtiw
	knwWWFFs4GHY6geoMnwWdGeAnPxrYtLYB+AFNmzMKl3+kgzFKWDyYBTQpnl641o3TfMQnZSr5ux
	NQ8j/rBFYGoyzQ+6XRcLhczC59uZ2xpS8lIZJzYNnlNWAox70WplJ5ddm5m27n7lqzhswMVo5kL
	WCv6Nrb2UDWyECtz0soJDLVevHLD0L1W1JT27L4fr13Y2FLmky2HSrLnCjMsnq7p3YSYpfv2Sbr
	agLgYpLdwhJlR5ReXRui7XkqVwe6g5LZmhiGGvPbaoT9pJan8aIc+ktPIu+L+IrAa2MTbdQeqwQ
	==
X-Received: by 2002:a17:907:7207:b0:ae3:6b52:f7dd with SMTP id a640c23a62f3a-ae36b52f88amr514353866b.46.1751198881152;
        Sun, 29 Jun 2025 05:08:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IET079+lNS2Zrgoqy9+whMR/tx3pQQ8PudfiWv0ZLtWOTerBzl2nFJIzCBrV1Me9yEUFQUboA==
X-Received: by 2002:a17:907:7207:b0:ae3:6b52:f7dd with SMTP id a640c23a62f3a-ae36b52f88amr514350466b.46.1751198880619;
        Sun, 29 Jun 2025 05:08:00 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c6bc2dsm490353166b.136.2025.06.29.05.07.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Jun 2025 05:07:59 -0700 (PDT)
Message-ID: <8a3ad930-bfb1-4531-9d34-fdf7d437f352@redhat.com>
Date: Sun, 29 Jun 2025 14:07:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: display: simple-framebuffer: Add
 interconnects property
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250623-simple-drm-fb-icc-v2-0-f69b86cd3d7d@fairphone.com>
 <20250623-simple-drm-fb-icc-v2-1-f69b86cd3d7d@fairphone.com>
 <20250627-mysterious-optimistic-bird-acaafb@krzk-bin>
 <DAX7ZB27SBPV.2Y0I09TVSF3TT@fairphone.com>
 <1129bc60-f9cb-40be-9869-8ffa3b3c9748@kernel.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <1129bc60-f9cb-40be-9869-8ffa3b3c9748@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Krzysztof,

On 28-Jun-25 1:49 PM, Krzysztof Kozlowski wrote:
> On 27/06/2025 11:48, Luca Weiss wrote:
>> Hi Krzysztof,
>>
>> On Fri Jun 27, 2025 at 10:08 AM CEST, Krzysztof Kozlowski wrote:
>>> On Mon, Jun 23, 2025 at 08:44:45AM +0200, Luca Weiss wrote:
>>>> Document the interconnects property which is a list of interconnect
>>>> paths that is used by the framebuffer and therefore needs to be kept
>>>> alive when the framebuffer is being used.
>>>>
>>>> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>> ---
>>>>  Documentation/devicetree/bindings/display/simple-framebuffer.yaml | 3 +++
>>>>  1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
>>>> index 296500f9da05e296dbbeec50ba5186b6b30aaffc..f0fa0ef23d91043dfb2b220c654b80e2e80850cd 100644
>>>> --- a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
>>>> +++ b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
>>>> @@ -79,6 +79,9 @@ properties:
>>>>    power-domains:
>>>>      description: List of power domains used by the framebuffer.
>>>>  
>>>> +  interconnects:
>>>> +    description: List of interconnect paths used by the framebuffer.
>>>> +
>>>
>>> maxItems: 1, or this is not a simple FB anymore. Anything which needs
>>> some sort of resources in unknown way is not simple anymore. You need
>>> device specific bindings.
>>
>> The bindings support an arbitrary number of clocks, regulators,
>> power-domains. Why should I artificially limit the interconnects to only
>> one?
> 
> And IMO they should not. Bindings are not supposed to be generic.

The simplefb binding is a binding to allow keeping the firmware, e.g.
uboot setup framebuffer alive to e.g. show a boot splash until
the native display-engine drive loads. Needing display-engine
specific bindings totally contradicts the whole goal of 

It is generic by nature and I really do not see how clocks and
regulators are any different then interconnects here.

Note that we had a huge discussion about adding clock
and regulators to simplefb many years ago with pretty
much the same arguments against doing so. In the end it was
decided to add regulator and clocks support to the simplefb
bindings and non of the feared problems with e.g. ordening
of turning things on happened.

A big part of this is that the claiming of clks / regulators /
interconnects by the simplefb driver is there to keep things on,
so it happens before the kernel starts tuning off unused resources
IOW everything is already up and running and this really is about
avoiding turning things off.

Regards,

Hans



