Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F602BD5A2
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 11:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751024615; cv=none; b=CeWINS8lrIoQq2nH1CDuhfxacPu3XsvY63YCgppYWi8JOSt5Y7p3B3zhHCpozQLuoqRkjP9ISi12H75cPAKWVlAQ9UFu7PfLrU59Cwu5+ldsiDRTPNL/UycaXiSd8wfTid4eGAkyMKzKBtKjuDVoBh6S2qSbszSzRmFci672y/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751024615; c=relaxed/simple;
	bh=+iGcw+PtfwIM7ievMJRC8fS+eyL4YN2rOv9Hq1pYiqU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=o9awNQlldDHsczIOYB2EWp8XJhp4ugxXoOSRHcC8j5GWs40m3Qmely5dXW76D6s4JpxF05MYhU+2Ku79qUNp5m2vLEdkY6Meso1ODjbrbKbnQYOFJs2GvC5oWPWQ70UCa98C6553rvuG6c2xygLnWkSbmqH3BLWUl0d/8kWu8ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K1e6F4Mc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K1e6F4Mc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751024613;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jUmKLkX17iXsI2jcTtKOQRw0H+vEuZMVGDpj7iIwmzA=;
	b=K1e6F4McSJ3QCQJkkZqsDByzJdFwefpEp1qoyVgvNCD8X9Qyv47RwGSrUceYrEdlgS23w8
	dhnDHwHcnmUAJ6MYuqEjSmDH1BFOd3yRUyTkMCm42n0p6QgQ5xFC49xI+JxgOhelXAwoOo
	aXCa5gtTDV4ztZaTVe9+NQpmlFZZ9cA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-301-etGtSgDbN9y6AQcsk37laA-1; Fri, 27 Jun 2025 07:43:32 -0400
X-MC-Unique: etGtSgDbN9y6AQcsk37laA-1
X-Mimecast-MFC-AGG-ID: etGtSgDbN9y6AQcsk37laA_1751024611
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4f858bc5eso1449902f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 04:43:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751024611; x=1751629411;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jUmKLkX17iXsI2jcTtKOQRw0H+vEuZMVGDpj7iIwmzA=;
        b=hIE6aOf4S3Bok1vqhcaJYaGPD+S7FhCc0FFECFKZrVOIqR04u+s/R25XBLlid4MLoQ
         vADjWtZ+dMwvyZREzRCckh3UcVwXSXBhcawWFSN+4G4X0qRlBAlR1D17B+sYyqDL1JQY
         N2/Jywz6CrpLmAyXcAjutzN+V//LIrvOSGjgM2tY571jyNvQux7qcbB/OoOAi1EopJao
         k/ssp1opWmWW2AJFuLQkDX6gtlDZU/8+aVJNbnnkmcWqDJwERdR/bFdgdUTayPnp8Cuf
         T/R5bgpUGOjCKfLE5v31Cou7CeZK++TlEKh6LIE65n0t55S4k9+URHco1Zx/cAbS1EKO
         Wk3A==
X-Forwarded-Encrypted: i=1; AJvYcCWifobhAlkKVicTDAjk2gbBUJ2z0XWg8rKWYQ8+Bpj5WGu/7SmMVR3sujmW/u6LoeLELVp/yNBgwsvzzIo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXHW9THPJFRhjYE3gny7rD25jTp8BXGpz46eWckV60JWdy6fi0
	uSgt/uuruqzZ9TbPKq1Wdmp6NFQquMwCXFr2doO78B3Pnu5jIJZUiCOCiEt77ewK3CJOQIqc/mV
	B9elqxyH53/Myj+ARKdLc6NsnpjTlP7GVcl8u/0nc1yVrVdgvp2FYuk5DN12NjzhWcA==
X-Gm-Gg: ASbGnctWYRfuViPUKnBO0tVkJbk6zpQ/SNgBJDteTRIQRPWtQFzNlhjSsCmmCtU/Jn8
	f/miU7J3a++lE/qOjQGH17YzGAfTUd7+YIk5DI9U/VUp8tAshsp1Gg1kXqaSZfmlpAw4JbS4GZ0
	ajW7l5N2x4xWwzEekNBLnSRYiwVtw0GFne9lEvCqjh7LPZVKHLg7Au84BO+nGt1sLhnV9/eTrwW
	w33AO8jZ/BhqK7sp13XfzckjWA6VV9Raz3qfqL52UOvPm6tAX6kgf+NLtHZeMFnbbess9xYQYg6
	CjFXcWVvKVtfUj+h3uYZBNyleCJXyiZMUNa6BUJl9dM5LydbgjzPbk127kkWgbuM8pTgiCrLcM+
	BRkET
X-Received: by 2002:a05:6000:2082:b0:3a6:f2d7:e22b with SMTP id ffacd0b85a97d-3a8f482ce2dmr3118524f8f.18.1751024610703;
        Fri, 27 Jun 2025 04:43:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqa9ksaS7DGTCCj2sUyTBC9ZYvO5eiqt8mHI65N4aQiSc8WyhN8W3ePYCE3h36zJaWTbQjjw==
X-Received: by 2002:a05:6000:2082:b0:3a6:f2d7:e22b with SMTP id ffacd0b85a97d-3a8f482ce2dmr3118496f8f.18.1751024610179;
        Fri, 27 Jun 2025 04:43:30 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e52ad2sm2454072f8f.48.2025.06.27.04.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 04:43:29 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Luca Weiss
 <luca.weiss@fairphone.com>, Hans de Goede <hdegoede@redhat.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Helge Deller
 <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] fbdev/simplefb: Add support for interconnect paths
In-Reply-To: <f7c816a7-e93e-4146-80dc-8fec6113fcea@suse.de>
References: <20250623-simple-drm-fb-icc-v2-0-f69b86cd3d7d@fairphone.com>
 <20250623-simple-drm-fb-icc-v2-5-f69b86cd3d7d@fairphone.com>
 <87ldpdd3dn.fsf@minerva.mail-host-address-is-not-set>
 <f7c816a7-e93e-4146-80dc-8fec6113fcea@suse.de>
Date: Fri, 27 Jun 2025 13:43:28 +0200
Message-ID: <87cyapbean.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Hi

[...]

>> These two functions contain the same logic that you are using in the
>> simpledrm driver. I wonder if could be made helpers so that the code
>> isn't duplicated in both drivers.
>
> No please not!. Any work should rather be directed towards deleting 
> simplefb entirely.
>

That is a good point. You are correct that having some duplication to
make easier to get rid of the fbdev driver is a much better approach.

> Best regards
> Thomas
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

