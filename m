Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2830A28C2B5
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 13:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750425002; cv=none; b=mnKkmYikWkFD8s4OPEYwn8qq2dML6KG/cCwQxXa2tA/8TQgHPnCEAGpgPds9iwnJSV2INz0oINGnppAn+kMAH4e2ng4u1v2pmXOA53I4F6RdnNHp8EUqy7fIw2SSo0tcAJHbR502SEQgRLU6hj/OBQGIpA1RoAKw6A26a82bXKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750425002; c=relaxed/simple;
	bh=nHJlRRXHCltVDM0SPmxxQhkuFzik5VSZCZ8u76ZAQYc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=M06y4ZKSBRsZ75GoTwUyW3NLOkgUxqsGNJV/RXLCnJDFBFYGxBdwMX3YSltHs3iJ2OiXOV7T2bxIXZnLQbbOOTNp815vkGOT30vMhiN7vfaZ49j01qtg2FjFXhE7V3Mo1hgnce9dvuEKB7kjbzRTfBxQ4c7XixK+GQV+v1GMv+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=nNI+ajM6; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="nNI+ajM6"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ad8a8da2376so291823166b.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 06:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750424998; x=1751029798; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=70ctTpSJsq+bQHgnXDWzVP4qaU3/3WUnYFhQbeURUT8=;
        b=nNI+ajM631phue9gNU0R//9nD+1z0es0SOg/pso5Wy3ApnO0/optB5TNz0t+l2tQva
         Ej/EWyRtj505M4h3GCc/oyGw3qHrRWNCnYebikry7r5xhFPYLhP/HOaY70z6UVlxao65
         ccejSRNjeKqS5X6UJ3y4q0FP3tCbKsd8UVnTcDH5phs+cGpow4TAn7kz+Gd2nTxMqKL6
         E8w3f8yvC80sxLG2gFQrZxzYdgS2tFgPKPNWxczNVta16CBg8hfhsyS5XyDwlR4xDWNL
         slxgU9WhoZmbduQxJyueUfkXrt0XNcgPUBtivBBJU/UtfBDng9lw7EB+OVUuaAm0wRup
         RFKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750424998; x=1751029798;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=70ctTpSJsq+bQHgnXDWzVP4qaU3/3WUnYFhQbeURUT8=;
        b=DMUaOMsuAu9B/7spI0IW1N3vqRLvMOSQenaAtrE7c73EEEhjGRmLK+x6K7mgYWWcDs
         JmgnlFysY2T1rz19X7hEhW2RcCW9baDu/SCmRZHyj6OvvVTfrF8TiMSmRhNBe41u6Iav
         QbWb/ufZkPpMHuaROq2Cf3yL8ThlkKLNS496Jjmi10xJQBie+LVMAqJOlBmDp/g0unBz
         Scxt+1zfjTdtZIrmFgAuyYJmnkYJaZ6aKlLuaYBx9A/fcnvmsCB6Y9RwPbp2VLkGpQiL
         dJvZinDbGw34+OyE3FSJbL2PoqtzgOZBzs/lKzEhuT/IJWw1i1o9RRS7NQlHJ5UZIHwZ
         ZhKA==
X-Forwarded-Encrypted: i=1; AJvYcCWqrnwIpovZx14YqQ883eXrF7vRCEwHBi7NoUo+/EAUy/0k+KXbETYvifYVSyrvbWOBBV/JUnRJ904bFyA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRXD+OGsO3v9VhU66AD3eVszmHLtHYe7qMamN2dRNovIvqmbgj
	zs/v/EAMnmzgHJ64Y7FZ9+O/vJkzYTOHWiwD83cr+TY0zJQDShfPpWwLuMAxa9NeLmE=
X-Gm-Gg: ASbGnctJA7hUqTpfhicmjejzm3e4Fibsq4u4CoS45oE0kfTDloKG/pIE9pBZeoND2Q5
	1Uczxkjx2ICWcIGbrRnLkZFgJwgqCwPBrQrRGCfsuURF2MKUQZAVn3Hc8rWyRDJPeFTnXoGgiY0
	fKeDTeiJbda0f1xlmu6RZm+v76E4IxDRxPvaymKVQ5c04v9ODNpQNrHHKp2jUddPTq4J78miWEU
	H1I8GKCX6+EpvFEm14Bc7XmV7gZhnUjBBKcF2M0eZTTQ1R5VL5EPHnnAQmxH+9R3CayE4tRWnQQ
	y+SEfWiPsO6GAkKY2riq1sL3ZVMQKwghS3aVMIdG1u1xzcnVRZ8iAFBUAecJB9SFVovrMAPY6NF
	UgENSN6fmcMgqAZrhyB0hChUMmwU5oKk=
X-Google-Smtp-Source: AGHT+IHvlXLALS4AHiE4SoJGkmgQzjz8Tofgh17vREN5VuVWgpnSvyEfhznZhRgrJb/j59g9wyMOzg==
X-Received: by 2002:a17:907:6e9f:b0:ada:99ed:67a3 with SMTP id a640c23a62f3a-ae057ac2433mr265724666b.27.1750424998367;
        Fri, 20 Jun 2025 06:09:58 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053e809f6sm159702466b.1.2025.06.20.06.09.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 06:09:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Jun 2025 15:09:57 +0200
Message-Id: <DARDVIP633UV.36218UJFJZJIY@fairphone.com>
Subject: Re: [PATCH 3/3] fbdev/simplefb: Add support for interconnect paths
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Thomas Zimmermann" <tzimmermann@suse.de>, "Hans de Goede"
 <hdegoede@redhat.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Javier Martinez Canillas"
 <javierm@redhat.com>, "Helge Deller" <deller@gmx.de>
Cc: <linux-fbdev@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250620-simple-drm-fb-icc-v1-0-d92142e8f74f@fairphone.com>
 <20250620-simple-drm-fb-icc-v1-3-d92142e8f74f@fairphone.com>
 <cf29862b-496b-4825-aa0f-493eb44838a5@suse.de>
 <DARBA03BEQA1.3KLHCBFNTVXKJ@fairphone.com>
 <4475251a-ede7-42d1-a95e-497e09beba0d@suse.de>
 <DARCJEWMK6C2.21Y93IPCZO7NM@fairphone.com>
 <8874b905-dd1a-4bcc-9572-edcf5451f400@suse.de>
In-Reply-To: <8874b905-dd1a-4bcc-9572-edcf5451f400@suse.de>

On Fri Jun 20, 2025 at 2:36 PM CEST, Thomas Zimmermann wrote:
> Hi
>
> Am 20.06.25 um 14:07 schrieb Luca Weiss:
>> On Fri Jun 20, 2025 at 1:28 PM CEST, Thomas Zimmermann wrote:
>>> Hi
>>>
>>> Am 20.06.25 um 13:07 schrieb Luca Weiss:
>>>> Hi Thomas,
>>>>
>>>> On Fri Jun 20, 2025 at 1:02 PM CEST, Thomas Zimmermann wrote:
>>>>> Hi
>>>>>
>>>>> Am 20.06.25 um 12:31 schrieb Luca Weiss:
>>>>>> Some devices might require keeping an interconnect path alive so tha=
t
>>>>>> the framebuffer continues working. Add support for that by setting t=
he
>>>>>> bandwidth requirements appropriately for all provided interconnect
>>>>>> paths.
>>>>>>
>>>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>>>> ---
>>>>>>     drivers/video/fbdev/simplefb.c | 83 ++++++++++++++++++++++++++++=
++++++++++++++
>>>>>>     1 file changed, 83 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/si=
mplefb.c
>>>>>> index be95fcddce4c8ca794826b805cd7dad2985bd637..ca73e079fd13550ddc77=
9e84db80f7f9b743d074 100644
>>>>>> --- a/drivers/video/fbdev/simplefb.c
>>>>>> +++ b/drivers/video/fbdev/simplefb.c
>>>>>> @@ -27,6 +27,7 @@
>>>>>>     #include <linux/parser.h>
>>>>>>     #include <linux/pm_domain.h>
>>>>>>     #include <linux/regulator/consumer.h>
>>>>>> +#include <linux/interconnect.h>
>>>>> With alphabetical sorting:
>>>>>
>>>>> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>> Thanks for the reviews!
>>>>
>>>> For both simpledrm.c and simplefb.c, the includes are not strictly
>>>> alphabetically sorted (1 mis-sort in simpledrm, 3 in simplefb), shall =
I
>>>> just try and slot it into the best fitting place, or make them sorted =
in
>>>> my patch? Or I can add a separate commit for each driver before to sor=
t
>>>> them.
>>>>
>>>> Let me know!
>>> Best is to try to fit it into the <linux/*> block. In simpledrm, it's
>>> probably my mistake. Don't bother with sending an extra cleanup if you
>>> don't want to.
>> I was mostly asking whether this diff is okay as part of my patch (for
>> just adding <linux/interconnect.h>)
>>
>> diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/simple=
fb.c
>> index be95fcddce4c..f2efa4b51401 100644
>> --- a/drivers/video/fbdev/simplefb.c
>> +++ b/drivers/video/fbdev/simplefb.c
>> @@ -13,18 +13,19 @@
>>    */
>>  =20
>>   #include <linux/aperture.h>
>> +#include <linux/clk.h>
>>   #include <linux/errno.h>
>>   #include <linux/fb.h>
>> +#include <linux/interconnect.h>
>>   #include <linux/io.h>
>>   #include <linux/module.h>
>> -#include <linux/platform_data/simplefb.h>
>> -#include <linux/platform_device.h>
>> -#include <linux/clk.h>
>>   #include <linux/of.h>
>>   #include <linux/of_address.h>
>>   #include <linux/of_clk.h>
>>   #include <linux/of_platform.h>
>>   #include <linux/parser.h>
>> +#include <linux/platform_data/simplefb.h>
>> +#include <linux/platform_device.h>
>>   #include <linux/pm_domain.h>
>>   #include <linux/regulator/consumer.h>
>>  =20
>>
>> Or if you want this churn to be a separate commit. Either way is fine
>> with me, just trying to figure out the preferences of this subsystem :)
>
> If you want to resort the entries, please do so in a separate patch.

Ack, will do in v2!

Regards
Luca

>
> Best regards
> Thomas
>
>>
>> Regards
>> Luca
>>

