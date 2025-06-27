Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676D829347C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 09:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751015200; cv=none; b=HUyusqOvPvZb+m5CCs/Z5lryHR8f0Xi6fv73A595NfP4YAkYTIyhu8KcPoyM1aPmljO3pWoTU5p8F9uKOpwva7W5Do2CqQsWQEq5bKkROEHMiCPmkferv7TZm6iaM7861BIe98r7GKgXGKq0vVbKqljnSkPTpFhmZE990vW1TQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751015200; c=relaxed/simple;
	bh=A4KQe5VnnVDStL+HivmXjepmhorDkQbvnSex3Sf6VUs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RIJVGB6Hn/ivtNAZAw8Bwtm4FFS5ZlOeugkns1O6ZfJ32GyQ7GtBK21NhOwh9gpLmgC/xdUQplmVcPw4Ki0NrRlYvRAEcXGaYWvEb5+7TMcz8EvRzCcMbHu9fRQiyFia/Oj8oVNYZKruqSf0EXxr0KHllfOl0183R1wt3DIHAcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FLoLRBWY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FLoLRBWY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751015197;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=weTtDMWNN7YSLXQgrJlrHEZYSSuXxc+tmwDFpPNc3l4=;
	b=FLoLRBWYDmk/XcYd+po1v59dUjfF9YLkackeXO1F4HsX77FpSCZ6JjXN8A95Wu6haE97dY
	hmWiniPIjbKmk+pj9sUczSfRRMmATsvNxLQrdyxENVlk3aQ7fG0BGU0v6ZQVYtucdHJ5xn
	8aenVW6PLSSiAnn8oWvKjcvR58hQRvc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-gyO6OeZ4MUCIfBQVQJioyA-1; Fri, 27 Jun 2025 05:06:34 -0400
X-MC-Unique: gyO6OeZ4MUCIfBQVQJioyA-1
X-Mimecast-MFC-AGG-ID: gyO6OeZ4MUCIfBQVQJioyA_1751015193
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4530c186394so7453535e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 02:06:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751015193; x=1751619993;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=weTtDMWNN7YSLXQgrJlrHEZYSSuXxc+tmwDFpPNc3l4=;
        b=M0Lh2vojH5N0htXzgLNFYE8B1bmqPleH5SBjnhqXARP9hlTr6dt8n/HSfoQJZvvL4Z
         AsRTH4P0sRyQ6MbdvtHGqpnJcpwsYcF7dcmrP3n3lQp164YJvtGKrhAY6x58S+ZO0DD8
         gqNCTnHeQydhzqh7lsD+DpSG4cfzPwY5NVpM+OBi4TX60dL+xhIiMxAjRsACSUSrU5Wi
         jVU5nZQI2PzB65+49ykqIL/3NY0MszeTNeQo+tyaySZHgNg0DVPgdeSjBJcwnaYKlquc
         XNbmNae33crPd3OtRqoppPLr6Dg2wijy0Sl2WKDVabReWnNzLo5SZtECp5ghUzOqYLjP
         WivQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5XrfeYLFvM+kIZDczQeGRgBYQtwPWXY+LMY68PbbsksN5bxUtJsl6c0bXKNWJqKUEppFWeYiMRSV+KlQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCW+vdTCZMtG1hwRq03+vZYlHMl6vGBgBi8wiqL5lUQGSnXb3a
	tduy4hkaDc5W9ix5bgLPBMrPn//pPXr5mf4IhMzqydYu74nqpYo34oDHQl3bnowr1EUy7GUSDCp
	0XEMlYNjnD3io2Rtl1wc+b/kdyGr7sxSoUIgLReG85wUELtdRUHgHm8yh5bfod6XTgQ==
X-Gm-Gg: ASbGncu3LOZnJEGCC7/+cqlnWFZNh2Rvpd7A/mJX5rhAG5RDdTxwmgenVkelD8CqnQF
	a6INRQvXBpE9N8dk2kwLFlNuLUo3DnN0v3iZih8pxTSrA1VHA8pxQA5R4iUT8YAzXtZ6qt97Tcw
	w2yzvz4ortHV3lGf+X7I9oC/sSyPGE+G4MqzzPOv0oZNelB6QOYk1+jwxqXyvU0KUgtbMGghr88
	Vqx6z//EjQXpj3uDCVMy1CLoZzKxY77QsDlpsbH44kRBXgN5I3VGhyEN8DhP/MQumEztGgwDZ+N
	IjwGrR9JfY81zKS/iMW1j6F7JeMsnjT1HrAWHAKtBYDQ5ad/hxs7M3bHiKXZ7Kud+EemaG5Iu1z
	QYoWt
X-Received: by 2002:a05:600c:3594:b0:450:d01e:78ee with SMTP id 5b1f17b1804b1-4538ee6e8f1mr23038495e9.24.1751015192904;
        Fri, 27 Jun 2025 02:06:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4Mvx/qWgWpxdan50sihI5BekWcumExGV3A3PH4UaTNsxDTsLKLACD2J9WcWAGdluKQIYFqw==
X-Received: by 2002:a05:600c:3594:b0:450:d01e:78ee with SMTP id 5b1f17b1804b1-4538ee6e8f1mr23038055e9.24.1751015192410;
        Fri, 27 Jun 2025 02:06:32 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a3fe0efsm43771555e9.24.2025.06.27.02.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 02:06:31 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Maxime Ripard <mripard@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Luca Ceresoli <luca.ceresoli@bootlin.com>, Anusha
 Srivatsa <asrivats@redhat.com>, Francesco Dolcini <francesco@dolcini.it>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Maxime
 Ripard <mripard@kernel.org>
Subject: Re: [PATCH v2 2/5] drm/panel: panel-simple: make panel_dpi_probe
 return a panel_desc
In-Reply-To: <20250626-drm-panel-simple-fixes-v2-2-5afcaa608bdc@kernel.org>
References: <20250626-drm-panel-simple-fixes-v2-0-5afcaa608bdc@kernel.org>
 <20250626-drm-panel-simple-fixes-v2-2-5afcaa608bdc@kernel.org>
Date: Fri, 27 Jun 2025 11:06:30 +0200
Message-ID: <878qldd04p.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Maxime Ripard <mripard@kernel.org> writes:

> If the panel-simple driver is probed from a panel-dpi compatible, the
> driver will use an empty panel_desc structure as a descriminant. It
> will then allocate and fill another panel_desc as part of its probe.
>
> However, that allocation needs to happen after the panel_simple
> structure has been allocated, since panel_dpi_probe(), the function
> doing the panel_desc allocation and initialization, takes a panel_simple
> pointer as an argument.
>
> This pointer is used to fill the panel_simple->desc pointer that is
> still initialized with the empty panel_desc when panel_dpi_probe() is
> called.
>
> Since commit de04bb0089a9 ("drm/panel/panel-simple: Use the new
> allocation in place of devm_kzalloc()"), we will need the panel
> connector type found in panel_desc to allocate panel_simple. This
> creates a circular dependency where we need panel_desc to create
> panel_simple, and need panel_simple to create panel_desc.
>
> Let's break that dependency by making panel_dpi_probe simply return the
> panel_desc it initialized and move the panel_simple->desc assignment to
> the caller.
>
> This will not fix the breaking commit entirely, but will move us towards
> the right direction.
>
> Fixes: de04bb0089a9 ("drm/panel/panel-simple: Use the new allocation in place of devm_kzalloc()")
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

