Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455E518DB2A
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 14:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747752133; cv=none; b=jxAPvyczN5fTW5+XdDGC1Ti6d0VVcjUcDQ/M1Lh6bj1CdePR6SW8y1SlDuT0JP7lHT1g3BCrA4rsZYuCjI3ZDdJHH0Zd/LndcUfS3EG/gsFc2ZUxrTBtzR3Yj3m0Ehl3jEsP3fAXS2P+W6JsrU4HKOm0WHyyoRLRvpaDSLkiKDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747752133; c=relaxed/simple;
	bh=9mdndIGZvPtVXnNoGjtPDopOUZXG1Caua5coezK8eyQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KM/BHHdWNKN8hGADdZfN82rXkaPp4PnqqamQV9JRDdl4pbnp3sRn01R8qTME+OByCmyGmd/T1f3vLZ4GjNCNuHllKZEr5+IbmRqygsgc6zfoMAjvlgWL91zBqTc0VyCdoXAzxZAgjLSXrfDjy7IfXAXFk+TC56yUamAS104zJxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Xw8XW/D7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xw8XW/D7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747752131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BUukwfEnSXPmCGvCdBvi67igzNFP2XiJNFPtM3ycw68=;
	b=Xw8XW/D7Yya6mvzUNA6EZfQMTinAlwdDPNvCvrtPb4yLZkfn4yDNzdUFv7A9okjXpHBko8
	mUHwirOrX8/n2GGMIb1cTAy5Dhm3m3mOtwsgMPY1yiNqnIeAJAc108EQ/wVPyTv6sAgG01
	T1qFJJsHqCJxuxljX+27FyXOcp6+hiE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-470-6SBlNtEVO0qytXnOo-KHsw-1; Tue, 20 May 2025 10:42:09 -0400
X-MC-Unique: 6SBlNtEVO0qytXnOo-KHsw-1
X-Mimecast-MFC-AGG-ID: 6SBlNtEVO0qytXnOo-KHsw_1747752129
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-442f4a3851fso49548185e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 07:42:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747752128; x=1748356928;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BUukwfEnSXPmCGvCdBvi67igzNFP2XiJNFPtM3ycw68=;
        b=BKGDy4gYQmIMZjuj+EGiqYLAwniVPebKkk9XTEYZkB6PkoYRhd7TZ34O5+vEj/gvv5
         KVuuCmORR+RRVRD6cglvhO+mK3t0pGI4xdJgb6bIbqiQnQjPUWEDbT/TqHl1tjYTNKuQ
         Cw/be+7/E1K18Zh15CjTFtYoWkw9GmKXCb/s4F7BDlhE/syNvBFIpumvoYGyJ0MS51JY
         Q8AGWF+i+AFmw+W3xRYQARXGtjc1dvgkVbmWwY0WLW1csOsQO5Akhe1s9IOxwg8wGoX3
         NVy/+ZetqxHtF6EPEg0DeSMeIGf8U/+g8wriw/pj4Uj7JzdvNyvm4vXiEAxEsjnwQwcU
         OGKg==
X-Forwarded-Encrypted: i=1; AJvYcCVPBNWTY0h2hZbjNy2E49qN3eBCIUZchxq+yWPD+MRJQMxaLHxpnlgoSjA1WaUrH6z8HOmXM9m1Zlr5dsU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYWhh3UEMi5APOY78P1qV2+kI6umZkvxmfuJbmIJJrrB/gSmr8
	FNj6giKA9JCpRKK85RLJV+VobrNSdFkfPdqtJ66nq2XTpL5w5s3/rkA3UYtndpmw80qCYmqpmSK
	tJe9RyYdeOwwFJe3Zob4zeV37Z4KFtOhSES+PwbXPjyU0TxvNOb12qb7HnIO5XTtVPA==
X-Gm-Gg: ASbGncsAwoDOsk4hEeH12Fs83VI2HIWU26BkF6O6pykO97FCArwHgjUW6+uGLJohXRu
	huW06m/QjRFijUcLwX1mISU59K2hjGBPIB8xURLkqumk2/qrry7VC3A3EL+5Vey4BeG55hw+gDf
	WqQZj1ZJOFyyEgNyzUfiHV5ai1woWKsME7TWf6iR/cMG0Jgh0ROrXxtrYO9oOZH+O7K4ci0OmbV
	ckPsE+LvOI9Zp4a43LmuKBVuWLAd2uH+sILJC9B6wdouqyVE3y0DXY8AMsPfCLdqb1nY1Dy+TqO
	6NsTaXDlPKCkUDx9MKh0sBK3KWBZHvLyAyQom7HTV97gFvbDwWscGuq9P1IGwDklMQNQIA==
X-Received: by 2002:a05:600c:1e1c:b0:43c:fffc:7855 with SMTP id 5b1f17b1804b1-442feffb6damr179864175e9.15.1747752128639;
        Tue, 20 May 2025 07:42:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNEuQwcOFxv9bPRsE9EPoajonwSbszaR/pW3Z0ORoLRovxfk8Z15ual0SZVnipzIpeRyHUvA==
X-Received: by 2002:a05:600c:1e1c:b0:43c:fffc:7855 with SMTP id 5b1f17b1804b1-442feffb6damr179863805e9.15.1747752128231;
        Tue, 20 May 2025 07:42:08 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca8874bsm16831518f8f.67.2025.05.20.07.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 07:42:07 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Marcus Folkesson
 <marcus.folkesson@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Geert
 Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2] drm/sitronix: Remove broken backwards-compatibility
 layer
In-Reply-To: <20395b14effe5e2e05a4f0856fdcda51c410329d.1747751592.git.geert+renesas@glider.be>
References: <20395b14effe5e2e05a4f0856fdcda51c410329d.1747751592.git.geert+renesas@glider.be>
Date: Tue, 20 May 2025 16:42:06 +0200
Message-ID: <87msb7ny2p.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Geert Uytterhoeven <geert+renesas@glider.be> writes:

Hello Geert,

> When moving the Sitronix DRM drivers and renaming their Kconfig symbols,
> the old symbols were kept, aiming to provide a seamless migration path
> when running "make olddefconfig" or "make oldconfig".
>
> However, the old compatibility symbols are not visible.  Hence unless
> they are selected by another symbol (which they are not), they can never
> be enabled, and no backwards compatibility is provided.
>
> Drop the broken mechanism and the old symbols.
>
> Fixes: 9b8f32002cddf792 ("drm/sitronix: move tiny Sitronix drivers to their own subdir")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

