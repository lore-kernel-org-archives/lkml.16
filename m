Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903CC194098
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 07:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751010743; cv=none; b=FSvpSldNKm/znAGVPYciZ1oH/N/0WtRK0G2MhnWmXLmhAAwrpseQV6hYakAXBKHOTVYaMZlmHDWFjhnw4HCN2i6peVBn1nYe8EmvVXFq1U8Hm6dS59+hSJSPyfbEV5sGd1/NjbKYHF+Q4xfFlGibv4uNefocSFIe7FPpHP51BdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751010743; c=relaxed/simple;
	bh=LZ8XvF7Mxx6us22Wtq1V0lH/iTurIql0J+590VcfcQU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kzk3ES6lyViDIqKIhmpErqaqO3c7n96Ot9/YmnUOttAirWIY2W+Rb2HBTdOgxconIYI6AEiUifSeRpANTLkvaKihO1sfv7km4zSSPqZyze/OsQsUVkCL7VnRLGiaxiuFxuZj/RPnzPdVAc4RHzTpDdKkUbWIRN0lZyvpSJFP2fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dzbt/qIZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dzbt/qIZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751010740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wP3Am+ANc8SurwHR78cTMLjrIEmhW8vePBXR1xmw9wg=;
	b=dzbt/qIZhtnDd4haCauvOn/KPsCVyec6aSq+WEd6iF+gQJS3S30Wg43Khuv+CLVT8Ed7Iu
	BNjqtGLeuDpPR9ydvqmDDgFx/tzcPwSyrzT42D+cguR6tm+jxM1Xqt9a2yps24sqMeekN7
	3FIO9L0IieovEUD986COr+rkrPz84IY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-360-xa73lO4iMYmniuN9Eoxeww-1; Fri, 27 Jun 2025 03:52:18 -0400
X-MC-Unique: xa73lO4iMYmniuN9Eoxeww-1
X-Mimecast-MFC-AGG-ID: xa73lO4iMYmniuN9Eoxeww_1751010738
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4f3796779so853004f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 00:52:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751010738; x=1751615538;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wP3Am+ANc8SurwHR78cTMLjrIEmhW8vePBXR1xmw9wg=;
        b=lepI0nEmnhd+hMTVIqqwNCOQp1y+lDZsrTvwllBD2YkZeWFf2dj3nH64WIYzs0Cs91
         lZbFjMVJFTjM4Vp8ToOm9YgK/ZC0yFNC3kUhrlPI5XdBnn8G2sGCbWDicr0Nr/kK9PRW
         BSkOW1lnVfoa0pcE8BV6Bro4AgPXzg0IYUWxjY4+16lmw5yszHyoPr+ygw89WQy4nb/n
         7AnFwCknX6V4ZM0e8jg9bCNDKuVJBixeot29MJHqFBI9mkguKJymOFKqyi/NfrALp5km
         ybzx9uIwdwdhfFieyb5ol3WqtXuBumN2XmCmMNJkiCtRww0fSw7yUahZCdBomgJt39WE
         UEtg==
X-Forwarded-Encrypted: i=1; AJvYcCW0UanANhxPpVGKc59zDUi8ToTtSvSQ67JCnt/LMwYN854d/tBmtUSfFopiiV3qdFZxOOtLDwCKvcLTOQk=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnmpg8bLBO8D9ftNJmt1CODeHIjvnBC6YJUKhFtSRW8L6NxdOM
	ssgYf41YcIn5cLFietdHZ90gPLcmnV1X4oY9jlliGIGvFFiTBemKVBbNF1gG4IDkF1vNKsXgwro
	COUrwOy1QA9duzK6/FYxs5Q8nhfh2GvdK4qQJoUTTWqWgOmQil9dhabhn567IqOQUwA==
X-Gm-Gg: ASbGnctewzJ80FdT4DvRp8PvQGKntrMI3YvhT2hwKqvm32tiOrFNjgHRETEhEAnGOVj
	oY9xwbhL6nxGj3uQ6b55ONqp9nYBRqCltn8MyoYWPUZHJba8fuWEuzNbdACM7ytMyKEisAIpvXt
	6dRRYMWkFBBOf9J9gQ74M/cPDEV2hqvJw5hyQzga0zW0yHyUV9vvKTenHO7T/oKVbkhgFaTYCNi
	zRxBDcvY18ZXxK/CfKcfV7Z1WekGu6Dnavh9eeRuagFpSnSnvZWa6sJbfD8gFIPrpUtmw40rLA9
	ftQS4Xl2fC1mp5X7FpQhCfuevp1cXTX1Pkrd2QX38T0qY3Ni4JPFbmgsvFJn046XY2ajt0Rfz4+
	te6fY
X-Received: by 2002:a5d:5189:0:b0:3a4:ffec:ee8e with SMTP id ffacd0b85a97d-3a917603a8amr1417648f8f.36.1751010737559;
        Fri, 27 Jun 2025 00:52:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7ntZFEdWDDOOUlWvZHIMomkMQZ1SFGsR8HVEbSnA9rjXNcpfTHf2xPjxO564UD5YkGxL3rA==
X-Received: by 2002:a5d:5189:0:b0:3a4:ffec:ee8e with SMTP id ffacd0b85a97d-3a917603a8amr1417618f8f.36.1751010737151;
        Fri, 27 Jun 2025 00:52:17 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7fadf3sm2001410f8f.34.2025.06.27.00.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 00:52:16 -0700 (PDT)
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
Subject: Re: [PATCH v2 4/5] fbdev/simplefb: Sort headers correctly
In-Reply-To: <20250623-simple-drm-fb-icc-v2-4-f69b86cd3d7d@fairphone.com>
References: <20250623-simple-drm-fb-icc-v2-0-f69b86cd3d7d@fairphone.com>
 <20250623-simple-drm-fb-icc-v2-4-f69b86cd3d7d@fairphone.com>
Date: Fri, 27 Jun 2025 09:52:15 +0200
Message-ID: <87o6u9d3kg.fsf@minerva.mail-host-address-is-not-set>
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

