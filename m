Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9774723C51E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 11:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749728968; cv=none; b=YUJJZVSTAksovE5L1zuMBJH6jgZ0wklusaf40AMCTLEOKsol6hhs8jnHQpijb+n78xVKL7dT0AQbtdJBzUH01rkhoAisEdQLHGiBCSzqG6zac3LCD3T/h6wqc/1kZ7FMWOrZj5Uh21yoioEaPu/aBbJ0bUrui/wsSd7RtQudiJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749728968; c=relaxed/simple;
	bh=MekC8kWB6iTk5o/hNYg8C7X4E32nXGov9VbtevuaI6c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=duDnn9C4AyvLNxI+r9l8bgIC9xshe5AxTgZKG2mM0CkWTMBMAGO8lNWUY5+gDCE2l0koaOmYUNAYy61JK/6KIRkyybod61N9wgHAxFwvCHVQWb2gf387a/d62L3IHhnqH9F/pj10EISb7voGcGrf1k82twEfuwM0zqDhAXAqgLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y8YwwZbb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y8YwwZbb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749728965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=44j4I4TXCM8K1tAGGoYj0qrHUcxAz/oIThDxTCmpNZk=;
	b=Y8YwwZbb4Bs13mA25aKTwIwg7XfG/+GfdhezrPL5hXk7SCiGB9ONfLz760dpKtW3YvqL6M
	lAJ3oFJuWBqSAqqt+HB+7bled9oi09eg/dbH4BWvyBzWgLu94rPAFzVkRqZl+Iv06aYXkZ
	e9saRw6nP7IoHG9UGFFeqa+lGAzVcsc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692--Ca1ZE4kMtal1eZT-cuBsg-1; Thu, 12 Jun 2025 07:49:19 -0400
X-MC-Unique: -Ca1ZE4kMtal1eZT-cuBsg-1
X-Mimecast-MFC-AGG-ID: -Ca1ZE4kMtal1eZT-cuBsg_1749728958
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4eee2398bso400703f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 04:49:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749728958; x=1750333758;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=44j4I4TXCM8K1tAGGoYj0qrHUcxAz/oIThDxTCmpNZk=;
        b=aJ61wu+Vb3k6aKMU5iMuT/Lc14Q7TutQlh6ydUTDZVwLHYP4U/EZ6/zFkYxZtyxae9
         nmIbdBYAYdHpHZmNnCjuAcT3K3u06KEA3oMAfTyqMTiae6e21QJ9rYAwTfik+LQZTZUw
         zxQjrYbvH1M4q/n2/2NXhLax7lZju8bxt5GweyUrt+PGsXLHmhzUgdTJ13rH4SCQ/y4g
         9WRY47WvAZWjGlVwTJcbid6EhlWG53+iMRzIHgNRUEB9g7vVhVue6GUYId9HWqQMM0g2
         s/8gCB6ovTzpfg5q8Q0aEZyU+Pb4dJhXG3svP7A9Jmu2hxV3yLH2u1ByK5ZLCSejdsll
         cIRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCGDrs0bmJEED+26p7Khxl6yKiO63gMMkgQAE6VpJRXJblWZG6IqGTxTsoFgHFXR94c6KVMxlCCJM84Ag=@vger.kernel.org
X-Gm-Message-State: AOJu0YykPAxiMpxjfvKvcx2npnSenREGbLEOLlGgkcUtHltAeVRbzz5G
	2a3poWxPX+xUNCZhPcuYhVNfsFOJkxMi/ZZrmhXm3l+9ppNFuzXQy+mmEyESyWjPiKJofADP0cL
	q+ED96rpNi1nYSkroqqscMPEXJRS/b5mJ6fos1hD+gwGjRaoFq68wwcJL/Q9nc5sofQ==
X-Gm-Gg: ASbGncvXths8I6mEsuOO6BFnbIB7siskGbCp8BUvruwbQlE19tZf5J5O22PpzomVVWH
	JFi2wz+E50HytRZwqa3+2mOm+gsZZpvDR3oUlZ5aktz+6MhAXuVSXG02ezRcl+kUlxGVoq8xJHE
	wZbQTUy1ZbEmYNZ9Lh2QacO/qvrAzBRjtpXRhPtQBnQBbClj1gK2qiQD8/uOAXWkJnZS17vx0cl
	M4bKPH4MuEmBmcodD8wufoLHVy8eHHEEuyuQMBWIBm7UIfpe/eo0I5e47B/d/S1zLVB+IQAUHkr
	fWU3FCVsDcVxQf9Boq/5YI6ArpBzvL1gGSQ3BrJPVK8O2vgEM+qzJ6CW05dXHZ5gfutR2442BHK
	AA7hO
X-Received: by 2002:a05:6000:430e:b0:3a4:dbac:2db6 with SMTP id ffacd0b85a97d-3a5586f3553mr5300920f8f.49.1749728958112;
        Thu, 12 Jun 2025 04:49:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4WzB+LJcR1u2hK9wFwGy2wUTAL8u1WuDKJLfv52nOHBwv65vCbiVqlOIk/P6Twhu+7Lo4ig==
X-Received: by 2002:a05:6000:430e:b0:3a4:dbac:2db6 with SMTP id ffacd0b85a97d-3a5586f3553mr5300892f8f.49.1749728957713;
        Thu, 12 Jun 2025 04:49:17 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a561b4b88esm1746765f8f.79.2025.06.12.04.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 04:49:17 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, John Keeping
 <jkeeping@inmusicbrands.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/ssd130x: fix ssd132x_clear_screen() columns
In-Reply-To: <fb6d8eb9-cdc1-4d07-8a55-928282c9e7ad@suse.de>
References: <20250611111307.1814876-1-jkeeping@inmusicbrands.com>
 <87y0tycumu.fsf@minerva.mail-host-address-is-not-set>
 <fb6d8eb9-cdc1-4d07-8a55-928282c9e7ad@suse.de>
Date: Thu, 12 Jun 2025 13:49:15 +0200
Message-ID: <87frg5w56s.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Hi
>
> Am 11.06.25 um 14:47 schrieb Javier Martinez Canillas:
>> John Keeping <jkeeping@inmusicbrands.com> writes:
>>
>> Hello John,
>>
>>> The number of columns relates to the width, not the height.  Use the
>>> correct variable.
>>>
>>> Signed-off-by: John Keeping <jkeeping@inmusicbrands.com>
>>> ---
>>>   drivers/gpu/drm/solomon/ssd130x.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
>>> index dd2006d51c7a2..eec43d1a55951 100644
>>> --- a/drivers/gpu/drm/solomon/ssd130x.c
>>> +++ b/drivers/gpu/drm/solomon/ssd130x.c
>>> @@ -974,7 +974,7 @@ static void ssd130x_clear_screen(struct ssd130x_device *ssd130x, u8 *data_array)
>>>   
>>>   static void ssd132x_clear_screen(struct ssd130x_device *ssd130x, u8 *data_array)
>>>   {
>>> -	unsigned int columns = DIV_ROUND_UP(ssd130x->height, SSD132X_SEGMENT_WIDTH);
>>> +	unsigned int columns = DIV_ROUND_UP(ssd130x->width, SSD132X_SEGMENT_WIDTH);
>>>   	unsigned int height = ssd130x->height;
>>>   
>> Ups, indeed. Thanks for fixing it!
>>
>> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>
> Could you please add a Fixes tag before merging the patch? Thanks!
>

Sure, I'll add the following tag:

Fixes: fdd591e00a9c ("drm/ssd130x: Add support for the SSD132x OLED controller family")

before merging the patch.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

