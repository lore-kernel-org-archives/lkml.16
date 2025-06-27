Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F63293C63
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 09:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751015571; cv=none; b=isO2RiUz1Q1BiQj2IzxGZboH0Y8uok+QTx3mewDwn0sP9UOR3VG493Efe38j78tEGCE9lWqyehqSDHft0SO/gNTszUgMGgvcoXb7Kt7uXAZPcwQXrrkWjMfQrDGcD3QeeputRboUg4f51QjR90ZKJzw5qNjx7ybGK/leMn1LvaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751015571; c=relaxed/simple;
	bh=bkW3GZbWbQDdNFr1naRi59/VXIHN3lE27NvLHntnQvw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=O/iEip5ZfHdayxjygeGr4/ghtt62rMz/LkS0R2SWGRW4cmJQr4NXvT1iz1dft+hve8RA3qZz+luVUOBVgN45UuyUWatXs6peKPXoq65/abDVcErneNMKVSAocOw10nOhXUoPyZaoyrhpn3UA69BK7Lcu7sn46yvbuhy5SmmQNOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QyzHvsT6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QyzHvsT6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751015568;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wYCV/mmnu9quiFORIT64HDfZgAbi4d31P/K4WpqK4Ew=;
	b=QyzHvsT6ZONHJVWxVrRFSfJQ8aHFaQw/UZhxboZ9nOkA23osrcDHs/XKQEIlzp3Sautrqm
	iNbNby+6o9S0wmycLDqmzZ3laq0RKEv3lheYT4wm/q+RCfjTVkQHD35PrikyHmgRAbQDF8
	7hZ/tyXCuJYbHVgYXZCFdZXhnI9RF5U=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-llVQ55deMrqV4vR3a79IhQ-1; Fri, 27 Jun 2025 05:12:46 -0400
X-MC-Unique: llVQ55deMrqV4vR3a79IhQ-1
X-Mimecast-MFC-AGG-ID: llVQ55deMrqV4vR3a79IhQ_1751015565
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-451d2037f1eso11117505e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 02:12:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751015565; x=1751620365;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wYCV/mmnu9quiFORIT64HDfZgAbi4d31P/K4WpqK4Ew=;
        b=ZppaAdu5uoqm7M+vRC5yf0Iv6XvrMkjY87iV+2oiCjAQT2u6gFMYKwK/7i1tivp86L
         DCWzuYhyFAWvr/VzIW8Q4yMFB7ae14GsW8sUegUJeVjqCb2BCQ40ces4Lft9J/2DdVhJ
         eOEvi5zXny8Zdx/t5oHo3tpF4TMp5+xvXT54ZIcT70Rz3/5P+q4HxqNM3bVHyy9H4Kc4
         958qm177kFXJqZfsnG0/0KhoDvXAssuO+q4CZVn92UI6IRJy4fbtFaN65f19tKsJo44c
         MXXNEzYx4n4s5LUvWwlMLunEu8XL7+FEKlteM7PRiAloFaeQimj2Yjk6aqxIPw7p4Jq8
         ynhw==
X-Forwarded-Encrypted: i=1; AJvYcCXymhvLC6rV6iRgs91vJc7YqCNTEC7yz6qKf2PeYw0kCI2pMEV90DSuNWUB+y1ePOya2ffajm4HGOsf138=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8LS0rFvEikCZv6KhcprFaTe6uw8jrFk1qlue7BA0ycMV/PYjm
	q8jT9GNOMt+qg8Qj+kA85du5PiLteSHNmtRo1jMqzPUpSZeDu/eECuX84HEjg+aHLKgNTzbaiGN
	cDD61t+zeRh7dEosgwejQ6cwnuWamX8lE5YJFCyBXbT3N9RIXq88PN7+sfR3R3hxSkw==
X-Gm-Gg: ASbGnctn+xD3CZb4sZTqSuz8Y57tyjGrMryCPB0RrjnQtTIHjsH/Mdwj+QO+wmNh88d
	WyirwrhBFzeVjYAVOgTMPspXwdvepWL/ihvGcmoG/u2y8xsuEXltAAo+vvsUEJltMWoPKB8Pwsf
	XovMnTf0JrR3pTnZOYDkjU8Jkf8pFWEMuoihWrNAoM/Jk3tBE0UTdmbcAa1lgEBLuky39wr9wn4
	0P5ongvv1nMuUdy9XvtEr8A0diU0P0bO9XcPa30u+YHS3lth6ug2hKhxxPNfOFPCoHZBp4p+P3f
	MIFkoNebi/fyqIe0HDYpwnesPVkIxpXenDoCbHdGvux3JweDW2x55e/i4mqFTdFSPTHcpTeg8l4
	XMlG+
X-Received: by 2002:a05:600c:8b8b:b0:453:b1c:442a with SMTP id 5b1f17b1804b1-4538ee70f31mr24187975e9.27.1751015565254;
        Fri, 27 Jun 2025 02:12:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrPuxSZs8zruo6edxrSyEN0yDly0bJfK6/O6yP8vrNS1ZzI1Ta9cGuoIvNVmYoF464I92XwQ==
X-Received: by 2002:a05:600c:8b8b:b0:453:b1c:442a with SMTP id 5b1f17b1804b1-4538ee70f31mr24187655e9.27.1751015564743;
        Fri, 27 Jun 2025 02:12:44 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e78e8sm2203570f8f.19.2025.06.27.02.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 02:12:44 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Maxime Ripard <mripard@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Luca Ceresoli <luca.ceresoli@bootlin.com>, Anusha
 Srivatsa <asrivats@redhat.com>, Francesco Dolcini <francesco@dolcini.it>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Maxime
 Ripard <mripard@kernel.org>
Subject: Re: [PATCH v2 4/5] drm/panel: panel-simple: Add function to look
 panel data up
In-Reply-To: <20250626-drm-panel-simple-fixes-v2-4-5afcaa608bdc@kernel.org>
References: <20250626-drm-panel-simple-fixes-v2-0-5afcaa608bdc@kernel.org>
 <20250626-drm-panel-simple-fixes-v2-4-5afcaa608bdc@kernel.org>
Date: Fri, 27 Jun 2025 11:12:43 +0200
Message-ID: <8734blczuc.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Maxime Ripard <mripard@kernel.org> writes:

> Commit de04bb0089a9 ("drm/panel/panel-simple: Use the new allocation in
> place of devm_kzalloc()") moved the call to drm_panel_init into the
> devm_drm_panel_alloc(), which needs a connector type to initialize
> properly.
>
> In the panel-dpi compatible case, the passed panel_desc structure is an
> empty one used as a discriminant, and the connector type it contains
> isn't actually initialized.
>
> It is initialized through a call to panel_dpi_probe() later in the
> function, which used to be before the call to drm_panel_init() that got
> merged into devm_drm_panel_alloc().
>
> So, we do need a proper panel_desc pointer before the call to
> devm_drm_panel_alloc() now. All cases associate their panel_desc with
> the panel compatible and use of_device_get_match_data, except for the
> panel-dpi compatible.
>
> In that case, we're expected to call panel_dpi_probe, which will
> allocate and initialize the panel_desc for us.
>
> Let's create such a helper function that would be called first in the
> driver and will lookup the desc by compatible, or allocate one if
> relevant.
>
> Reported-by: Francesco Dolcini <francesco@dolcini.it>
> Closes: https://lore.kernel.org/all/20250612081834.GA248237@francesco-nb/
> Fixes: de04bb0089a9 ("drm/panel/panel-simple: Use the new allocation in place of devm_kzalloc()")
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

