Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94822293C68
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 09:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751015645; cv=none; b=NnRE3taKPIUMnry4IeyMI/+iaA+CpY/tuPq2WVkb+D0ZLHSpq0cv10BLfxIBUpUlQ/0MRJ1E6B3NRJtM5HUnE484KAlrEsXxNqlNJ9cVV3RWpPouIzhQEhs/oPG8MiJ2mECpAK2e6hGtkCRb1qzPwOPRUXxtRYtpLWW5V0h8jUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751015645; c=relaxed/simple;
	bh=fUxAP9bw7/20q3oYHqFFlLas5FT4SMsrKlcyWatvlYw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gDfeFfvFpS9wtcSptXRUoxh1S8lBOdZtnxwiv15F7CEkO4L1nwnXiudNWiBqtYUuBxYLg4CApPNlj3V2UIU/SxwtgXDDEN6fyqlDfk30HIOeqWXdiq403YNE2tTRFlhwV0qKDUPyLzCLhmXpXN/A3oM6DBFWY2qkmRijfKWAE+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MHNxj9hq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MHNxj9hq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751015642;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WHEPPQypc7TyMROzb6/6mBy5qbiegeyIWkWEFfEU5dw=;
	b=MHNxj9hq+mx50peQwnnFJkFnVYGUq4bj2QHzNmOHNpvujKNMREGdtjT8w9kmzLc2/t6FZz
	5fPG5EO7pZC9I/8iqB1CZqG7p52YfYtnyFphnrcFtxmiZZOzJJV6DR0qYxcgbJBTznWZGc
	kEsjW27ZY10adkv7usMOS7yKyPsyYrQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-434-SvHBsNIbOye1Bmpi5858EA-1; Fri, 27 Jun 2025 05:14:00 -0400
X-MC-Unique: SvHBsNIbOye1Bmpi5858EA-1
X-Mimecast-MFC-AGG-ID: SvHBsNIbOye1Bmpi5858EA_1751015639
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-450df53d461so14218535e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 02:14:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751015639; x=1751620439;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WHEPPQypc7TyMROzb6/6mBy5qbiegeyIWkWEFfEU5dw=;
        b=Qu0tNK4hiF4Xi0bFQ6McFFnUgWbJOT/cQIQ4azGShB/JwRkpLGUrxInGfP4HT9Ig8e
         yJGiltq5315Ma9t9OF3JAAESjKXLSFz3PPus2m1Tc8vdx83DYXI2nGZ/vprwPORBHrCU
         ju1Q6VrRLrbYu0JtfWr99CgooxRIwqYOK4MfCKSz25UNtcFHcAyFCuOZK6kR2ChTd697
         mRJppdMb9D7gsz8bsPhgYwHdO3x5k6Tcwk19LoRWtNmF8Fbd6TZ6NlDHEVeSnbggoLbs
         wIHVvWiDy/QWGnCJqe0D3ZSITZdSfu6WeXkPTOfPHYW5tuJjJzkI+9wIF33RuHMI7tS/
         HwTg==
X-Forwarded-Encrypted: i=1; AJvYcCVjSmowN2PAGSp2J5fPrF9GJTCtelj+MrIL9rT5DiHOHPmmry7keLoVr17HhB2SL8AfgJZ584lUwlcIKvQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3ytIAMgV/8JQMwEkCoDhcRf2SUGx6/gbfLEGzdv1iBcPEjnny
	f9XxArZtqagiJA9G9LCfpFlodd5HrP5A6Ph0BFzOv3u1U3IJZS2+77IoRzWNYGTdu3XQZo3C3+J
	jd6KA85las4Ughrm+v769nxoP3QQ9HGGpz1VjLU6/z4N1rUYLwiGZxx3JuIfdv86flg==
X-Gm-Gg: ASbGncuCe/8zct/aYQK5X/CR5gAJBm7q62cJhQzCPFmkRTe80+/Ob2PNpb7ke0TwRl6
	3y4VYjt/LVmgTAEwyyZkQ+ikxqQU+a6s+dIDnxJeNibhCO0KFtHpADRpGg7Ej9OdngjXr2HUvea
	lcrcmUIqdMV+tEkMZ3ItZUcRPfOS1jyyiP+HtoTDGYx23O93IUftl/H566m/EVQToprV76CNrVQ
	XHaG/mzPFdCdlYGP8XAL+KzLsaDeXfoxrai3w31th1Ni3R8Eq1wnD7F4k4aBsFo2PRLe77n6REs
	JL9M8A7u/+JlD9xKzOLMsrAmcZdbGRJtBU5glYY8lYfGmr387MIU6gVz8K/9duF213yiEFAVYhT
	Metmr
X-Received: by 2002:a05:600c:a009:b0:453:dbe:7574 with SMTP id 5b1f17b1804b1-453902d3100mr14621145e9.12.1751015639270;
        Fri, 27 Jun 2025 02:13:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHB0tCkdXhhhl/gt6aOIt9w77OJs1cM1dc5CK6KjZ2iCBIKXV50/rEpY9ZALrkejqxwGPFrZA==
X-Received: by 2002:a05:600c:a009:b0:453:dbe:7574 with SMTP id 5b1f17b1804b1-453902d3100mr14620745e9.12.1751015638873;
        Fri, 27 Jun 2025 02:13:58 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538234b6b3sm76386695e9.13.2025.06.27.02.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 02:13:58 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Maxime Ripard <mripard@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Luca Ceresoli <luca.ceresoli@bootlin.com>, Anusha
 Srivatsa <asrivats@redhat.com>, Francesco Dolcini <francesco@dolcini.it>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Maxime
 Ripard <mripard@kernel.org>
Subject: Re: [PATCH v2 5/5] drm/panel: panel-simple: get rid of panel_dpi hack
In-Reply-To: <20250626-drm-panel-simple-fixes-v2-5-5afcaa608bdc@kernel.org>
References: <20250626-drm-panel-simple-fixes-v2-0-5afcaa608bdc@kernel.org>
 <20250626-drm-panel-simple-fixes-v2-5-5afcaa608bdc@kernel.org>
Date: Fri, 27 Jun 2025 11:13:57 +0200
Message-ID: <87zfdtbl7u.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Maxime Ripard <mripard@kernel.org> writes:

> The empty panel_dpi struct was only ever used as a discriminant, but
> it's kind of a hack, and with the reworks done in the previous patches,
> we shouldn't need it anymore.
>
> Let's get rid of it.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

