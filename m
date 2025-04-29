Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10B129B23E
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 10:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745922206; cv=none; b=UFEyJ3suHzN5XRlOZfQQoM+xwyvoaz0EhzxSclqJl9NoWFexsSYnF0c98/XI5sPeASci6CsfRUJwj0BHi8yYdKDbl1Zx/SYPDgfFykpmNykaMXrXL1QtMrfH/MVgkBhtZJhzPnI8681Z630O5DO5YJOFP3CognsOXrgkgZ1cBh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745922206; c=relaxed/simple;
	bh=I7q3nYlcWKLpxcjMtPxCCBKwbSdilqasANOOowJX4IE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DJdWrGrR6s/lD2hnQYJ01B/b10aHHEWDzEJMxVympGsUKcWAqvNUqNO4ova1yX//Z2PVBaGHJmwU1mhCVZiYf/T0hOgXkbvKR+PYrs1oaq65H4YQPJZg7X0ZJ7hkjpvPx3RcPnwzAF1olOoUwy7IVnR+GaeqtN4L3sZ9sZURKY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EGmvJyvZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EGmvJyvZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745922203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ou46RQiw27MHB6L9lNRbXAsrEhOAHGqjTdf1Xhm4BSg=;
	b=EGmvJyvZ2tTVZjKXFR3VfitiV+whaJ5eSBNQJn76g72fZg6sNsAUEWY4LAIs87pPeYKQ9t
	mb+IfZ9elxlnrr15HZnhbMftPYQahXR2RZ6ZpJNkkqj5sP66fnfvY6pn8QPK3m1S13AJp0
	VdiXLkd9FyQwcvrfPctlZ6LRKpHdMIc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-211--SCbnjbVO-uQRIPU9vzKVw-1; Tue, 29 Apr 2025 06:23:22 -0400
X-MC-Unique: -SCbnjbVO-uQRIPU9vzKVw-1
X-Mimecast-MFC-AGG-ID: -SCbnjbVO-uQRIPU9vzKVw_1745922201
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-39c30f26e31so3708207f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 03:23:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745922201; x=1746527001;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ou46RQiw27MHB6L9lNRbXAsrEhOAHGqjTdf1Xhm4BSg=;
        b=WPj5czlzwjE+M6yKRx2j9yazXwM7RpmVAO6H0xRkFDp+TLgIwXldOwa08AcxYtSBNY
         VzcXmqNUh6hhxk88wY5ZD7LrUjVk3tgCD1KF4Z3m95TdTch2QyP6NNnksqldDnuiQLUq
         hJoRWtlEWlYCGU0+uUEou5hVH4yosAIa1bYLW0Pbq7hduwcQtzFIfoHq9tiJz2FkXSNI
         1G8yW6UfoPCnkwe8uDFprnmoCcGSODFABO76dpuIL5rLQRc6+obGqzEAcM/+U8Z9gwBy
         dzqKrHPD0OiAx5qHhByT5Ok2Ng5/w1LSpUL2s4rzTECDQSQdAKg5TGhZx1kGIupaejDp
         e60A==
X-Forwarded-Encrypted: i=1; AJvYcCWbAQBRgPTQrknqglywf6M/+kuIv0kAS70B5+TVnVo9p5yd3Ua9IX16bPID57G6g0oXr5n16D++HOKKeNY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzP0OuP6B713xVUCca0DxDapEO19BZf1QgVTITgL34rp1r75YXz
	SNr5xOd/A9Fe7fBe0mTr1vdJ5KYS0mSEA1RD1NQ3R+hMHPhvwj8YkKltb+0wVV6M6b2qW5JJUHP
	ZP2ix0gthu4xcoiy7VUQDVBe3a8HsoBiBdt4SBOHmaE/v2oc8n5qlGiKJiLWc5A==
X-Gm-Gg: ASbGnctlfhNnP7sf9OiU4cA2NTkYutq1/eK+9bOx5Prh5XkAzLuFnYCT74Jx5dhe4Xb
	SQ3+i5YrUEQT1O9jiKN6ru365HSaWVIzUvjtQsuNugET78QnP0OEnKVPOA5E0e/b/WCYRS5WcEr
	4XtSnWatTl8q+bbvTtb2Ut0HFIom40S99ONrf8s8TlXH9jtSkgycvmSfNmkQnRdSSAel+i73KW6
	dHrQjY2mDMsnaWjc+4D7e3Pzz6CPHVhFD0HgqNb5LtKS9MSPDaFE84h2f4rWEGxuJYsdEPGCnxb
	uQckB9GRuoIiztjcT7EzY1DFadhRaM/zVd5quBaXT6np5FkkLXwyY85P3fACW4vQaKsYog==
X-Received: by 2002:a5d:598c:0:b0:391:2c67:798f with SMTP id ffacd0b85a97d-3a07ab8176emr9560331f8f.41.1745922200992;
        Tue, 29 Apr 2025 03:23:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTs5WgstZJckNJqUcEC4QQ/SCLXl1Ezn5Q82Us7fxkFAFEkizJrjHsAT0GnIPHkqaJtOYMjw==
X-Received: by 2002:a5d:598c:0:b0:391:2c67:798f with SMTP id ffacd0b85a97d-3a07ab8176emr9560294f8f.41.1745922200601;
        Tue, 29 Apr 2025 03:23:20 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5e345sm13720628f8f.94.2025.04.29.03.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 03:23:20 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Arnd Bergmann <arnd@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Marcus Folkesson
 <marcus.folkesson@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, David Lechner <david@lechnology.com>,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>, Alex Lanzano
 <lanzano.alex@gmail.com>, Kerem Karabay <kekrby@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/st7571-i2c: select CONFIG_DRM_CLIENT_SELECTION
In-Reply-To: <20250428150752.3970145-1-arnd@kernel.org>
References: <20250428150752.3970145-1-arnd@kernel.org>
Date: Tue, 29 Apr 2025 12:23:17 +0200
Message-ID: <87v7qnz2p6.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


Hello Arnd,

Arnd Bergmann <arnd@kernel.org> writes:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The newly added driver calls drm_client_setup(), but that is not
> always built in:
>
> x86_64-linux-ld: vmlinux.o: in function `st7571_probe':
> st7571-i2c.c:(.text+0x7b7119): undefined reference to `drm_client_setup'
>
> Select the appropriate Kconfig symbol.
>
> Fixes: 4b35f0f41ee2 ("drm/st7571-i2c: add support for Sitronix ST7571 LCD controller")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

