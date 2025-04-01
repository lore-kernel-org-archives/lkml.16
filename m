Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1081E9B00
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 08:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743495163; cv=none; b=Hiyfngx+O5KgYNXC9lYZjBkkZM4GCij+Ax6QWlznf9NEQ9FV4cxf54PSq6kZq0h4o7QrRZLsIRCUK72h6VFfJJUmDvcO9vVGlAP0wZ9vfNsX7Jy+/kXOX+Xj272T0dx5UzfwHeLac8FyhZA28efVlLEhMn3qlcmKhpJ7Mn+webA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743495163; c=relaxed/simple;
	bh=PS2Sdb9Q6APRHIqkC9t7Ru11wjylMIVzx8bP3kMRQz4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fhgZk7rpZIHWTqTXwlyBtg1KgVM72obMyQsbtGYAt7BtbgBKuEAKHvw1Ze+a8TcaJvuB9nuR20JENxshtdqNQbqdf+lyGrJiSIIEiTXNBKgaHZ0UhiVqeVdvbYFKAYNov9S0/MSjNmVm1hBuzgrR2vCidT1ARVHLGSSJ8LyL4Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JBIKE4nN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JBIKE4nN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743495161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GASTRkZgNEq8ywrAyVO6ME8QzSZbSDWDx62+D68AoZQ=;
	b=JBIKE4nNgBlRp2YFtqhNS9MPUUAosEYscNwnjFplE9jxZGxpWjCTP5QypWq80oEhGPwKXY
	xBhYWHZMRnVYbDU6HdmrP1sLjIIyTilsgnJ3piP4EIiLDAW38DxyBcVPZhOKjKLv8/p+GD
	F8HYjmXkOrTRCbth1tILtZjl4Tu2Q2A=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-387-DPhVZX4RMTWZnBEItBu1Zw-1; Tue, 01 Apr 2025 04:12:38 -0400
X-MC-Unique: DPhVZX4RMTWZnBEItBu1Zw-1
X-Mimecast-MFC-AGG-ID: DPhVZX4RMTWZnBEItBu1Zw_1743495157
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ac28a2c7c48so430531566b.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 01:12:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743495157; x=1744099957;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GASTRkZgNEq8ywrAyVO6ME8QzSZbSDWDx62+D68AoZQ=;
        b=suldeUa8bmZTJacTBWGXswQO5LF2SqXWBTbuIK76O9i3rGn/3Ltl40/2knO+4Tj9G0
         b73LkjLA//ESv+aWLCz4D5r7cm2hUIrT8m2OLdX+gOdr8Q3ZXHMEDgCgR6d6lc3DW6ae
         WPfgYAvAliqAfRA8AzE31RjmoKxyvbcYxYlR0Ed22VU21enXrICl2EqJV2TdzvCo6WUL
         AvyDW6GAEnP/BMwoj9x0iKUn0VhGI2AMjGsXyuJ2K7OIKZpEtD+waH9fFZeD3YNUwrjx
         6Na2Zt+2MfpLIXoqmvH4S0dtI+/vpyfILJuhPvIlZgTMqhUP0t37a+8i1WoFPjQaOORn
         dzNg==
X-Forwarded-Encrypted: i=1; AJvYcCXGRPYPH+LRetrnW9GyW+amku0AGF4X6kLaGKJCSzXwYVR7/PORjufELT+KF+pikSpiQmMnX9W+Z6nq4tk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzklE5MxjXpACi4pcGwhmBmaPOf24OM8o12KibzlfXjvUVVDxVQ
	YE+hUjlH6ESUzomJQFGCwob0wnxG8Rd/886feYgj8rPUVX/orjDCzEbxhbtxMnGItOcvmGZqkxV
	hT8Th0O5nNEEgcN974npAnKanSYcOQDboqRlNha/02xNaiuWq8fHdOzNXHDk6xA==
X-Gm-Gg: ASbGncs5+2XqCUfJb9SF+v+QofRgWEJmY6OSSDAhVx5o72gNQ0Qr7nbw4EiYOuMHh95
	e3PWxZc+GpJlRaPZAmsEP/YzWpV5+hxq0seQXLqDhZsOI4BcKAoGkMuBEPWXMDIUw8dutBKoDWi
	IUenWO3c0RiY1wdHYDh1fswUAOj1ESRA4ZPri7xjVo+dwFnyDWLoJKtsnN/bjCY5vtZPNpllef+
	ie9cfl25EZ0/aLeGa8Yp1rux8r4BSrfn0EsXDhzEaXd4RIOqNEEJDmCloMBVpokULlJ2JfOTi+c
	cFkU6hS4Jgh+AmvTx1W1a0snXHHd9tAm/iEDcp18cHUdAcJ/o+Q5lpCPN7AXHViI5AVjbn947xK
	IQ8ZDxJOyzUPA+JUA1+9rVuWhsXuorut7Mzh0vYBP02V45cFJfshVZyA14CZAZT2sww==
X-Received: by 2002:a05:6402:4310:b0:5e6:1353:1319 with SMTP id 4fb4d7f45d1cf-5edfce9881amr9817982a12.12.1743495156737;
        Tue, 01 Apr 2025 01:12:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6luXrvYzdujvkcKPyEJpEUzJF03r0BacXFA3SpTp0Ue2HkS05barJl28QJGj7RKl2zsVeHQ==
X-Received: by 2002:a05:6402:4310:b0:5e6:1353:1319 with SMTP id 4fb4d7f45d1cf-5edfce9881amr9817964a12.12.1743495156332;
        Tue, 01 Apr 2025 01:12:36 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc16f213dsm6809339a12.44.2025.04.01.01.12.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 01:12:35 -0700 (PDT)
Message-ID: <5fd2253f-0acb-4c95-b3bb-e7e065c92dd5@redhat.com>
Date: Tue, 1 Apr 2025 10:12:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] media: i2c: ov02e10: add OV02E10 image sensor
 driver
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Hans de Goede <hansg@kernel.org>, Jingjing Xiong <jingjing.xiong@intel.com>,
 Hao Yao <hao.yao@intel.com>, Jim Lai <jim.lai@intel.com>,
 You-Sheng Yang <vicamo.yang@canonical.com>,
 Alan Stern <stern@rowland.harvard.edu>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20250325-b4-media-comitters-next-25-03-13-ov02e10-v2-0-4d933ac8cff6@linaro.org>
 <20250325-b4-media-comitters-next-25-03-13-ov02e10-v2-2-4d933ac8cff6@linaro.org>
 <Z-UAFkshOgeytfB4@kekkonen.localdomain>
 <47dd7daa-cce4-4ad0-ab57-4c76304b0aa6@linaro.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <47dd7daa-cce4-4ad0-ab57-4c76304b0aa6@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Bryan, Sakari,

On 1-Apr-25 2:34 AM, Bryan O'Donoghue wrote:
> On 27/03/2025 07:36, Sakari Ailus wrote:
>>> +static u64 to_pixel_rate(u32 f_index)
>>> +{
>>> +    u64 pixel_rate = link_freq_menu_items[f_index] * 2 * OV02E10_DATA_LANES;
>>> +
>>> +    do_div(pixel_rate, OV02E10_RGB_DEPTH);
>> The pixel rate control is for the pixel rate on the pixel array, not on the
>> CSI-2 interface. Without binning or sub-sampling these may the same still,
>> but this only works in special cases really.
> 
> Hmm computer says no, I don't think I have understood this comment..
> 
> Looking at other drivers, I'd say the above pattern is pretty common - taking ov8856 as an example that's pretty much equivalent logic to the above, ov08x40 does something similar.
> 
> =>
> 
> pixel_rate == link_freq * 2 * #oflanes / RGB_DEPTH
>            => 360MHz * 2 * 2 / 10
>            => 360000000 * 2 * 2 / 10
>            => 144000000
> 
> If I'm understanding you though you mean the pixel rate for the control V4L2_CID_PIXEL_RATE expressed here should be the resolution * the FPS / bits_per_pixel

I have to agree with Bryan here that the pixelrate typically is const
and directly derived from the link-frequency. Even the
__v4l2_get_link_freq_ctrl() helper from drivers/media/v4l2-core/v4l2-common.c
assumes this.

binning / subsampling does not change anything wrt the pixelrate it
just means that either the blanking becomes much bigger keeping
vts / hts the same, or that the FPS becomes much higher.

It is not like the sensor is sending an empty pixel on the CSI
link every other pixel when binning, since there is no such
thing as an empty pixel. So the sensor must go faster when doing
horizontal binning to keep the CSI link filled effectively
doubling the FPS, or requiring a much larger hblank after having
taken only half the time sending pixels.

(and the same applies to vts when vertical binning)

> pixel_rate = wdith x height x fps / bpp
>            => 1928 * 1088 * 30 / 10
>            => 6292992
> 
> i.e. the pixel rate not related to the CSI2 link frequency ?

No the pixel-rate control includes vblank + hblank "pixels"
and is in pixels/sec so no dividing by bpp, iow it is:

vts * hts * fps

and this must match

link_freq * 2 * #oflanes / RGB_DEPTH

Regards,

Hans


