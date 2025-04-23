Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFB828F930
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 19:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745436935; cv=none; b=T1jKaU81DSMHKFBjJLontBE8gukP9Dy3BrzR9li8o4hIY9PjG4NRVmNGTqWxtKup9/vb9yqzpSMgH09Y2HmGe0zkPzdN7SA5v/uPEUpTx+NR4eqg9/uPIMzGI6MSed9OoNO+BeK1AnH6KtI122BO0lyUnoUk5Ko+cVyARXXNPxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745436935; c=relaxed/simple;
	bh=MUZFYYt03FT+VpNLoBtNnK5YADixP5iwgRhQLqAvFzk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YcyucWocPDCQFVI+MvGEyrer//TLeXvBDapuMVbEutF2qne1x2bpzpI4HikN+0o8UWrvVmKdytF3/d8rvRxPYmCOCx1svRZjqx49LnD+1WUMV69GH5tVYonlDi7cT5+UFswZ9tUIvHZBcjV21nK1j/a0nrZaL6HXiMCJXLwGID0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RkAFCpue; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RkAFCpue"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745436932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mHwM84CGYO+3jNCMTmmYeka00nVSY0LWa8c5ny3yQ7I=;
	b=RkAFCpue/37DAtODKeya5SjWEsLU3Ei+CxaByI48Jg+Se/l26B2FMTiHXmyeciC5CbnVrR
	d44gWBgi0IT/Fr4TAcJ1piQoGBd8H57UTj+yq6UB4VBqMAMatCP9bcFrGrwSZbYewtweGC
	xscZ0Md+tYLNFlLqt5CkOnx/PmOMiq0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-130-C5Lct9J3P12705nv8FFkQQ-1; Wed, 23 Apr 2025 15:35:31 -0400
X-MC-Unique: C5Lct9J3P12705nv8FFkQQ-1
X-Mimecast-MFC-AGG-ID: C5Lct9J3P12705nv8FFkQQ_1745436930
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43947a0919aso1241015e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 12:35:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745436930; x=1746041730;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mHwM84CGYO+3jNCMTmmYeka00nVSY0LWa8c5ny3yQ7I=;
        b=eGASuXr0Zn1VTYrqiFwmVXfgRuOGk1i/qbL/aq1Z2U7iVdKgbX99uQDKIhZ09qO7Kn
         kd394zA2alBkbJblYWvGg+gnQly7gg9mxvJzmjiSGGUyix9tOSt9ZAmYjylj5i3cuHm8
         DOYre7ftsp1No2WlgB7ggRElS4e+urMgc0oh7XPtZlHo8kcyvxOVjJUK75vo4DNxhJeT
         OjuX8YNtLUDV9RODQvYjyGmFOacYZ94VQerUSZqslYh+nlWOXkUvTkxtcxmK34KSusJs
         izg5PX61+lVaZ97FPj/pQH0fVae6v6jUHpciXzIcQO3A+SFh7ZpbuLgfoCsFMOb1dEmh
         u5VA==
X-Forwarded-Encrypted: i=1; AJvYcCWcKay789qL8fv3g/CUGH+wyYxqcDvTGTZ6NIH/CQiLiF42v6gcKpt5CCFB3LrzYcNSzkjtnYAZYjZO8iw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoqeAQZsHyW0P3U0/nH8WDpSq2wBO+EVWhGJZG9I40oRHj2eXu
	63ubkEjOyEymGySC4mdKBOtLJoHaa0K4dT4o9Py/rPz1K2PlacDBL63RlYEIFFXeE86nUb2X9eP
	6mglAgM2y8TiUMyB/de4o8HyAMH20240uMI0qP3j2lB5CleJcpaiIc4GQRtJfOA==
X-Gm-Gg: ASbGnctHQAuoW3ITvUrLEGqfBQMnk34vPUKSSrZtWmT/HduvqoydROBESJfyvzc0qzd
	M9/MOvTDDpOdhLPSKfNpPX6bJoF/K0GvXJAEl4Ug+jYUmHzz1HybQkM/l1U+ZamcnjSeANtkO74
	yalvGsFWhDdfxwWLLn8T5tb6gbKYFLVsFCu23AO2Wb8SKV2cmKHMX5GlKFOKMyJowOJ4zyWNOjr
	EalObOBiLBsskJOQe5tMPuf40Pkk2rVnL+M0ecg97vkW2CUtLMoaWKabavSPHYhtlXfA/oUlast
	B1AUNAf7UFK0SWxPKNBacFQY7Ndm7IVIi80uHhGAjX/YKoNhSQRbpTFPGOR5Rdtn0ISQMA==
X-Received: by 2002:a05:600c:384b:b0:43d:b85:1831 with SMTP id 5b1f17b1804b1-4406aa872edmr213880955e9.0.1745436930111;
        Wed, 23 Apr 2025 12:35:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3o9b9voFidMYGql7TPjF6NJBpEq4Fi6/itjQOx6j+R+KZEPRTl/Eo2lQx2cIZP+I8qEWd0Q==
X-Received: by 2002:a05:600c:384b:b0:43d:b85:1831 with SMTP id 5b1f17b1804b1-4406aa872edmr213880635e9.0.1745436929653;
        Wed, 23 Apr 2025 12:35:29 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa433191sm20045996f8f.31.2025.04.23.12.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 12:35:29 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Marcus Folkesson
 <marcus.folkesson@gmail.com>, Thomas Zimmermann <tzimmrmann@suse.de>
Subject: Re: [PATCH v6 2/3] drm/st7571-i2c: add support for Sitronix ST7571
 LCD controller
In-Reply-To: <20250423-st7571-v6-2-e9519e3c4ec4@gmail.com>
References: <20250423-st7571-v6-0-e9519e3c4ec4@gmail.com>
 <20250423-st7571-v6-2-e9519e3c4ec4@gmail.com>
Date: Wed, 23 Apr 2025 21:35:28 +0200
Message-ID: <87y0vqacxr.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Marcus Folkesson <marcus.folkesson@gmail.com> writes:

Hello Marcus,

> Sitronix ST7571 is a 4bit gray scale dot matrix LCD controller.
> The controller has a SPI, I2C and 8bit parallel interface, this
> driver is for the I2C interface only.
>
> Reviewed-by: Thomas Zimmermann <tzimmrmann@suse.de>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---

[...]

> +
> +static void st7571_reset(struct st7571_device *st7571)
> +{
> +	gpiod_set_value_cansleep(st7571->reset, 1);
> +	fdelay(20);

There's no fdelay() and this leads to a build failure now:

make -j16 M=3Ddrivers/gpu/drm/tiny/
...
  CC [M]  st7571-i2c.o
st7571-i2c.c: In function =E2=80=98st7571_reset=E2=80=99:
st7571-i2c.c:815:9: error: implicit declaration of function =E2=80=98fdelay=
=E2=80=99; did you mean =E2=80=98ndelay=E2=80=99? [-Wimplicit-function-decl=
aration]
  815 |         fdelay(20);
      |         ^~~~~~
      |         ndelay


but I think you meant fsleep() here (which makes sense to me), so I will ap=
ply
the following fixup to this patch before pushing it:

diff --git a/drivers/gpu/drm/tiny/st7571-i2c.c b/drivers/gpu/drm/tiny/st757=
1-i2c.c
index ba089a7e2b61..dc410ec41baf 100644
--- a/drivers/gpu/drm/tiny/st7571-i2c.c
+++ b/drivers/gpu/drm/tiny/st7571-i2c.c
@@ -812,7 +812,7 @@ static int st7571_parse_dt(struct st7571_device *st7571)
 static void st7571_reset(struct st7571_device *st7571)
 {
        gpiod_set_value_cansleep(st7571->reset, 1);
-       fdelay(20);
+       fsleep(20);
        gpiod_set_value_cansleep(st7571->reset, 0);
 }

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

