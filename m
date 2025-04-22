Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7492C10A4
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 22:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745360638; cv=none; b=YqtDGTi1E3gv7p6mx7IBgiBz9CtqrLWwdcMLmofTA0hzxtlpnjMmdlyqxCkbGIepqSq2Ms3OuQBz9uKfZxtRgEzVVG6urIz3StGa8KDAWw8sNO0Ds30GMDpqI2TKc0JedVJ8G59edHtA8AW1/O7LfMIAPOxFZz838m+XgrqM/+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745360638; c=relaxed/simple;
	bh=A/bjtilL0vdqN/OtBIekryArmOABU88oniKVwTnXtIA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LYvIeHunMDWb/pD0xDBEoFF66ObInWnOsrdWjtc8AM0DLvQeA4KtmyyM0JC4aNP2pv1PbOeBfxJq19lAYIpztynWJyBWLBfvXSlNpdZHsL1LGHraV6MXVt02TI4dthzbaagN28EMLrne+xRFEJb/eBk/q3ZgAEr0SaXfA45SFVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OYAMW18Z; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OYAMW18Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745360635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tvsjP0TDhe7vvPFthlsElokr0igrf5zhdC2C47ukJlM=;
	b=OYAMW18ZaJn3ZTfboz4erFqlLiOZBuv7ZqljO6b6izL7zEk4agnObnJ/JPPN8/OdUxweZi
	X4pn/tOYsX7s5dtJdfeBTNwNVdbcE2X1u5sG46tQy/xxP43Y0kzfaFR3M+jMntTOP+QiZe
	1I38TOLZH6AZBpCRhHvoK1IcCClSeXw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-414-hgwX9N0NPWeBMwIhMCsH5Q-1; Tue, 22 Apr 2025 18:23:54 -0400
X-MC-Unique: hgwX9N0NPWeBMwIhMCsH5Q-1
X-Mimecast-MFC-AGG-ID: hgwX9N0NPWeBMwIhMCsH5Q_1745360633
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43ced8c2eb7so41413215e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 15:23:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745360633; x=1745965433;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tvsjP0TDhe7vvPFthlsElokr0igrf5zhdC2C47ukJlM=;
        b=YGU0l18ZihEWaXg6EbqEgjKlYEC41Kmy43ZuyiZDVnot+7/7mXCPue9UoOErUMGjJr
         vD08YuWwfC+lS6iQsA6nKJtCSznl4I+ienIGkSvysen3R+evPhl93lpyWa/BGulRxn6y
         Yuz0tLPh8394KLQHhtWL2Tf5m6sCr3nkgGhGPKNJLsPOd9bdp2bb1FB7fi+noBiF3gTt
         9ZjbbxvbUHvlUlfaKRy7PGAEFC45oi2m6ri0R+X1iUzFXWQZIOBMLenWvIQDkXI7VTYu
         VhfffUeZJmZ++hG3nUyWQQ7uKP0fsDwtdGTMPZrxgDSJJcrP+95u+VPlaRE4pM0OzgTC
         mZTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdb/11yVJ1RdWjGKKNmduNU7FHoSEOcOezBQfl6J8B10jacstnN8NeklXa91u/RXh1LduZZtA89asX5pU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVe0wXQH0mUvUBDELDWjYELtl+zhSPOK0OUL6t/vNQEC2XVc6q
	uwcfl3/D7BFn2ezoth/HHgOJqkBZ7rNF+bpyR1kiXMlLeY80zksIKI5oQHac+K9YTFEvg0NZwsU
	ihMPeg7gsF6lnBmgHQQjU4HYctXMFvHkkkQ2rNr4kjdeHGEbnUASp5lbH4volDA==
X-Gm-Gg: ASbGncuSmOhQINpTb4rYiaFJvykLmC32rEtZkqyPqw8oiAB6O6npxV4A4ihxTNGRd4D
	orIwYE6dUNvYutLHO89ajdsevkj9otNZiIMmWu/+OAuKWXu4KJIZcUo9HF6bFBQR8+QmjRxVCpq
	Pr48XvJ+JoAMl36hm2zOaxUZUL+W/FWvD2Ia7IbgzVsDp1MM05kdLBAamdM/+h5Kx2ljKDmlhrg
	sqA1TyfaNXRgWpqYiorQKIQ6KZHTCQB8pLt4S98aRZtok1L6qw1oVU/ELR5Xy828EkLi7aHk8+t
	Mj831mQjA/DKxL98qMHbuD0VIKuttdDiaScs55YBYotppwfo47NaHnTySJdsyrXebJtXVQ==
X-Received: by 2002:a05:600c:a143:b0:43d:878c:7c40 with SMTP id 5b1f17b1804b1-44076c9c6fbmr105894335e9.10.1745360633013;
        Tue, 22 Apr 2025 15:23:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZJAKqGmWcajS9TRVEoMGa1jAq7LeEdmZMU4PLf92uZSOCG1OGXX/B3J1SM4bQv8Xmuf3afQ==
X-Received: by 2002:a05:600c:a143:b0:43d:878c:7c40 with SMTP id 5b1f17b1804b1-44076c9c6fbmr105894215e9.10.1745360632629;
        Tue, 22 Apr 2025 15:23:52 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-44092d179ebsm3558725e9.2.2025.04.22.15.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 15:23:50 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Marcus Folkesson
 <marcus.folkesson@gmail.com>
Subject: Re: [PATCH v4 3/3] MAINTAINERS: add entry for Sitronix ST7571 LCD
 Controller
In-Reply-To: <20250415-st7571-v4-3-8b5c9be8bae7@gmail.com>
References: <20250415-st7571-v4-0-8b5c9be8bae7@gmail.com>
 <20250415-st7571-v4-3-8b5c9be8bae7@gmail.com>
Date: Wed, 23 Apr 2025 00:23:48 +0200
Message-ID: <877c3bbzt7.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Marcus Folkesson <marcus.folkesson@gmail.com> writes:

Hello Marcus,

> Add MAINTAINERS entry for the Sitronix ST7571 dot matrix LCD
> controller.
>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>  MAINTAINERS | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 889bd4a59551c9bc125f94944a6e1c7e3ef2de83..eeae24fda846b9f63400ebb08c3fa7f02f3f4b19 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7572,6 +7572,12 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>  F:	Documentation/devicetree/bindings/display/sitronix,st7586.txt
>  F:	drivers/gpu/drm/tiny/st7586.c
>  
> +DRM DRIVER FOR SITRONIX ST7571 PANELS
> +M:	Marcus Folkesson <marcus.folkesson@gmail.com>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/display/sitronix,st7571.yaml
> +F:	drivers/gpu/drm/tiny/st7571-i2c.c
> +

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

