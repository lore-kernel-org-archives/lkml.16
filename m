Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03B94B1E78
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 10:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746701094; cv=none; b=KRo3jopPrs0MsQGjhqQPSLIys4afqoeaO7tkiNtrI1Q+Ov2lbGwIpV3Sl7StLOX8tpMuGrw3W084pLLS9YzQf4rADkbT6mcJb0j86ZdshaLIy8LqS+AjyCUSL3fBCluIsmnRAkv9Qkz9QcvtsavqixtklWBw0iKTP6jpHyDPi/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746701094; c=relaxed/simple;
	bh=Fn/Bg797RXtejcknSS+9IWDalUH7spovGht6Hnt9Dzc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=iqvvbyr5TPTGv8DXMD6AC+gvpP6HhUZcMIbobcgvtqLcnPrC2w0F/E6itCDysZ/VK45JFgOT3BqDWDMIj46x10sjzj5Y6T46pZUzEc9jv355HeqLbPrBOSbEQsWzHCbxuJ+qy4otrbOys+Bb9rTEH+heqLeJESk6Q73RoKVUd8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=czI43x1K; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="czI43x1K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746701091;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kg0VQN380cNy38+THmalJtzeh1gOYnZWm93pCjMLjOk=;
	b=czI43x1KLzE1GTC6pGdE1IS6CahfZGETeALu1S+fndNyyplNe+SQNSInZgYiMnwXvzn+F0
	1V7r/rn0XAJ8N+0HNpFU5RwrVJX+9YRWgmw5rcJPl3khzdG8PshZytfLebh0VcUAe8PBHo
	RqruxctLPAE3YNBuc0ut/Mnr69fr4k0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-397-mw9JlpWgPPOke-ngKQT7xw-1; Thu, 08 May 2025 06:44:50 -0400
X-MC-Unique: mw9JlpWgPPOke-ngKQT7xw-1
X-Mimecast-MFC-AGG-ID: mw9JlpWgPPOke-ngKQT7xw_1746701089
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-442cd12d151so5026055e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 03:44:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746701089; x=1747305889;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kg0VQN380cNy38+THmalJtzeh1gOYnZWm93pCjMLjOk=;
        b=esXS0JMuKYD6V24KjL/Tx3nSYIKFmqtnb0kIr/XXzPDEyXMY3RLS4b/OiZyIL9XXYs
         vartBmqa8YK6TM7NNarhugZFDHPmJYUmNOFE/2V0EPfP6qiRJp5TEUHSuwOOYB4EUDsb
         aFTOwRuzEI4+2mSkWRhXLtoKMaTd6inTrHo68qBkQ/zJLwLk+PPsflRIQjjycGecfW09
         NbNE8VuJPI2xJubwtsX65YxuDTkp0emiB5mLxqiFx9eE3SUgDC4UQg9kJ1kkHeVpAE9/
         8J4bBB4x47qGLZ4FTwxfgkuoUiMEFM7+FnjHVphxxD24YSs8E81eIl1oE3avB5GWAm1K
         lE1w==
X-Forwarded-Encrypted: i=1; AJvYcCUsTcrPp3fL2qIzCgYVaRZBY+XhUOI3QrlTATZALGl0M789NBjMyvRwKFcZLlTwc3nZ7QkY2MtV+cubUhU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCHODzAyWqr9k5P+eyuupdlvKMYVpuxGIJMGud5NmE6X9lWEgS
	xgvl0/x9A+TC93zO7uFVQtYWWnZHi5SGcJpaUq6Q+yrzYLlKL/ybIaz9JYTUN21wAED8jCB4V6x
	MUjUwjaUKW+MPnyKDeFalaHlg2GTJYveKqYZYgv3Y5AJ9Xmxqcbq/jdCtMtFA6w==
X-Gm-Gg: ASbGncvcDEkhkMac7B8/vtF/6l8lXQko6SkYcSlssXs34q+f+vbgy4vI2SBVVUPIQoW
	g2TMuqRpdMGM6LWvLH1bEFztCb9sMRU9QvGdIx6ycGKUN5zns5EsbwMQpzXvMA0yYMtQvPKan6I
	SNsJG8JU0AXGzlRWDoCqM/fZICQE0PG+O2/7mBQjgxu8BxS/z8kgALqOMrvr+MpwMFKCl0ds2Mz
	i6nFyZsFA1B2N0/jP75cG6fI+OeV5jfEaC7rC8nJnpqMISxV8ULfeDrzqyHNdEMd5zppBHJzyYc
	jmyIT3Ans9EpZpb6j6XOs7S/neCyarwT+gIgRHXeOpvof/OHmWPd576l0Rp3mlMQwLwvIg==
X-Received: by 2002:a05:600c:5027:b0:43c:f64c:44a4 with SMTP id 5b1f17b1804b1-441d44c41a5mr60707235e9.8.1746701089368;
        Thu, 08 May 2025 03:44:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKWHQImK0mQVYX3JJhEVaBoNakORu3NGB6ausgRqlBfk0NSvqhDkPdCLTMr4AX1Nn44y4TLQ==
X-Received: by 2002:a05:600c:5027:b0:43c:f64c:44a4 with SMTP id 5b1f17b1804b1-441d44c41a5mr60706975e9.8.1746701089048;
        Thu, 08 May 2025 03:44:49 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d14e6d74sm23818755e9.21.2025.05.08.03.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 03:44:48 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Philipp Stanner <phasta@mailbox.org>, Philipp Stanner
 <phasta@kernel.org>, Dave Airlie <airlied@redhat.com>, Gerd Hoffmann
 <kraxel@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Arnd Bergmann <arnd@kernel.org>, Jani Nikula <jani.nikula@intel.com>,
 Niklas Schnelle <schnelle@linux.ibm.com>, Jeff Johnson
 <jeff.johnson@oss.qualcomm.com>
Cc: virtualization@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/cirrus: Use non-hybrid PCI devres API
In-Reply-To: <6d46103afab9fc8e843e5681226f7db34a4ca57d.camel@mailbox.org>
References: <20250417094009.29297-2-phasta@kernel.org>
 <87frhzc1a9.fsf@minerva.mail-host-address-is-not-set>
 <6d46103afab9fc8e843e5681226f7db34a4ca57d.camel@mailbox.org>
Date: Thu, 08 May 2025 12:44:46 +0200
Message-ID: <87a57ns7oh.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Philipp Stanner <phasta@mailbox.org> writes:

Hello Philipp,

> On Tue, 2025-04-22 at 23:51 +0200, Javier Martinez Canillas wrote:
>> Philipp Stanner <phasta@kernel.org> writes:
>> 
>> Hello Philipp,
>> 
>> > cirrus enables its PCI device with pcim_enable_device(). This,
>> > implicitly, switches the function pci_request_regions() into
>> > managed
>> > mode, where it becomes a devres function.
>> > 
>> > The PCI subsystem wants to remove this hybrid nature from its
>> > interfaces. To do so, users of the aforementioned combination of
>> > functions must be ported to non-hybrid functions.
>> > 
>> > Replace the call to sometimes-managed pci_request_regions() with
>> > one to
>> > the always-managed pcim_request_all_regions().
>> > 
>> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
>> > ---
>> 
>> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>> 
>
> Who's in charge of applying this? Any objections with me just putting
> it into drm-misc-next?
>

Sure, go ahead.

> P.
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

