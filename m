Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE97E22069A
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 07:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751010070; cv=none; b=ORGL1HlXrMcmTasI7iGjjELYx1yDcGJ/+rtvS/RqYc/8hkkxi4feKRIrubCRhl6HXdbqHLtPiD7JgXAT4Wuy7tB/7IpBcR4EyXJA0eivkP6Hg80BjD52sAWyx8X10btBRwUnUs13kf6B8rK9JKTKKquCWnNk4xMBZR5ue3E4SgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751010070; c=relaxed/simple;
	bh=LZ8XvF7Mxx6us22Wtq1V0lH/iTurIql0J+590VcfcQU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GGafGBF+X/I7+qTzganTRAJKyWSKMIOm6zo8vwtA5enHgTKKnF0xi/XqFvs4vuDRz05cvFnkSARSX6IK7pT6LO1pUWCZEKIBst1JcTbtaOiA/Oq+Bfi6fV3SoqRKZOH9jGegqL3dnMmznfwCcxcv8tA9Qo7FIqytZWWO1gnT9Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OQrJD/EM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OQrJD/EM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751010068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wP3Am+ANc8SurwHR78cTMLjrIEmhW8vePBXR1xmw9wg=;
	b=OQrJD/EM+1tRFQt9QFvsXa5KD5oYktnmXtY5gBe/zt1NqN2jmhVtQURNn02+nfePRo/0NK
	6rlOKqa3DMH1FoU6K7i8arHQgYuauhwKcuhCUntfCzAKU9frDy7guG0s0O1hs7UnSrgsfa
	z92SG1A2zyrJc72VnE/pewQcfVUieUA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-228-0ENRMRd9Nh2rRzESzWl5vQ-1; Fri, 27 Jun 2025 03:41:06 -0400
X-MC-Unique: 0ENRMRd9Nh2rRzESzWl5vQ-1
X-Mimecast-MFC-AGG-ID: 0ENRMRd9Nh2rRzESzWl5vQ_1751010065
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a54a8a0122so831022f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 00:41:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751010065; x=1751614865;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wP3Am+ANc8SurwHR78cTMLjrIEmhW8vePBXR1xmw9wg=;
        b=KXt6rSe8EkmAfu9SYZDRSQkzyMCz6wruM8vxuOEaJ+Jth04m7tL+uDeYlNUkEuTAbR
         3772C2jgvUsv45JHffj61pqXELHLM8cZW+WBKQenuWAiFKb3F6wyHI9zHGMqIw945drX
         PmJVpW464/nIND6McJPQ89j3zm9g/MiVKA9V4O4OoSo7aCQr1Swdq/qIEenzMbSQ0vCA
         XG5SiRVFotsv9R7IFpsi+RMixfXBkEgRDlWje+HyiXPb6lCaToSqzExp/0RVO1QHxmv4
         60PjaKSlPbLjyqhyON9uYwGxvKq9mK0xBrdbZiFn4sg1LWvpHiagQaT2oEJJ4LWxcCjo
         Nxng==
X-Forwarded-Encrypted: i=1; AJvYcCWVmcTFOGXBz4zTLSuV+7Xp+WcOLiie1JVV3s5XjZD4CqbIPZcEX0ejWpzqRCR2P0LSFT7xSigdH6qG6t8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMKp2vBACskZupCnPUYivGFzbll5q/mZBQVhV+Ntk41mAZANDM
	OLGQh7uGNYnyxRlxzrc63eusRv+MwACgeyorYE3moVHpBmzq+WgsW+EXoNCEgT7jB2Bk7fVO5K0
	uKbHdT8jNL3FA5Ycc43wJ5W/2mVlDQsTRDH+Atcw8S2Y3lM8zjdyxKWlG9agzoFZLug==
X-Gm-Gg: ASbGncsJSjklFlip3VxB/DB31Pag8NRbozYGwxgjRWiISZZB4gSwdRtn15dCnKaeWDt
	WbGb/FCuzYDHR42vFm+hxEZQJedlupv2WjZiWztxO3pw4IwMVxvzeO/Qsewav8TcI9Bx4Dm6qoo
	PeDCziZm/pbt1HexPDOC4ln6lq89xDyUh/vbDpMgGRCGWFcjqHBZi8bLttJYoMNPOX/3IL2lYUl
	spxa1NCJ05DsTVh1uarqN1oEus4eqz+WBi29Wbl7Z9Zd0mVT6E5WDKrCeKdXGrzaSMq4dCXW6qP
	DzFnvB8nDfHaegHR8mzkJHp4WlEw9UEGjj1WIZYvCRm9BXFJQ2tAbpf+Zu/MQ34GtGEw5Sq0yuG
	OB5o0
X-Received: by 2002:a05:6000:23c2:b0:3a3:6991:dcbb with SMTP id ffacd0b85a97d-3a8fdb2abe0mr1344027f8f.12.1751010064955;
        Fri, 27 Jun 2025 00:41:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETMdv3eRrEgFX+6vBwltJ/r+6ntnIOfFnB39tunb/PTwDz2TLiyLlcS2Z8MbRYWj+B7lKx0g==
X-Received: by 2002:a05:6000:23c2:b0:3a3:6991:dcbb with SMTP id ffacd0b85a97d-3a8fdb2abe0mr1344015f8f.12.1751010064572;
        Fri, 27 Jun 2025 00:41:04 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7ec69dsm1911505f8f.6.2025.06.27.00.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 00:41:04 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Luca Weiss <luca.weiss@fairphone.com>, Hans de Goede
 <hdegoede@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Helge
 Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Luca Weiss
 <luca.weiss@fairphone.com>
Subject: Re: [PATCH v2 2/5] drm/sysfb: simpledrm: Sort headers correctly
In-Reply-To: <20250623-simple-drm-fb-icc-v2-2-f69b86cd3d7d@fairphone.com>
References: <20250623-simple-drm-fb-icc-v2-0-f69b86cd3d7d@fairphone.com>
 <20250623-simple-drm-fb-icc-v2-2-f69b86cd3d7d@fairphone.com>
Date: Fri, 27 Jun 2025 09:41:02 +0200
Message-ID: <87tt41d435.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Luca Weiss <luca.weiss@fairphone.com> writes:

> Make sure the headers are sorted alphabetically to ensure consistent
> code.
>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

