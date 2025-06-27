Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCEC293C67
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 09:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751015461; cv=none; b=QJlcX5UROfg5wWfjIwycjRqMQiATqDOsrS46atdJC/nb0wYWvASpDE45277b1nDx/glBNlqSjaa/Sautd0sAIhQgQwt5ihc5N50f7dNPha+xTh+8S4fiRZwvAgVFUAGtdleg9QYrGN02W0WaZmJYxg6zT/qtb+DARLa7CYFaCvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751015461; c=relaxed/simple;
	bh=HFKQRdvF2hyRVrR3iIDsim/jjWChq1EmARt8pKIg+y0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PoPiFz5SXiBFWhRaMgvn7StY2nOmHadh6Lqq5vyAWaaUY9HZv8HdvkSZHTTeQS35VIrCb5z4FaP9jiAN+HuvK4n4gq65EXBQ8mar6eI825tfO+XSjDmgq5xXRZsT2O006/gQtJHUDQML+RanLS+HxdZzY9WXQLfQBRsXBcYbrYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gUqBrm7M; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gUqBrm7M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751015458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mUC4ot/biTlOA3flAzZtM+HH2WgND0ss9Osu67FHk8w=;
	b=gUqBrm7MF/qa1Ge/X+yJKxVSF2lFq75ArFDPq5Nmm2UQHBagJJt1+OkpiQkybZZYWlW0Hn
	IMh7J8wOu22YyEdWleYCPl7WFTI3hEl58H2bNKvGuZgqoL4rD3rCurRRJ2lPlKKJAxhEcU
	9H5fSmCEb2C00ZVdhsPy2Qrx28TSXC8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-267-JaxMNYIEPRWI6PvOBmGzjA-1; Fri, 27 Jun 2025 05:10:56 -0400
X-MC-Unique: JaxMNYIEPRWI6PvOBmGzjA-1
X-Mimecast-MFC-AGG-ID: JaxMNYIEPRWI6PvOBmGzjA_1751015455
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4535d300d2dso15378745e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 02:10:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751015455; x=1751620255;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mUC4ot/biTlOA3flAzZtM+HH2WgND0ss9Osu67FHk8w=;
        b=DGOq6w7s4WsD37vvi9FXtYD0Z8GvoiJKx3tXLs6HRV4khJ7vHPM0g9gZpgkw4oLy1Z
         2QXFOTXjxSY7oi3wqvv7ixGnjVlJcrX2SyxaWvL9Suq4dM6M4r0wv/cSydNEOee8KDsu
         YwT5ZEtCxJtVllIqib86zWG0tvAMxM3YkLMFqcwHW0qPFyVX6q9Gy/Ley5FuI16wV+/j
         97K3AnainetZXXjRaXOFBCl25gnBN3kXWcLK3Mc1LjSoObT+DnckAy0L9K7CxoIP5ilX
         V6Ays4ryew4i337etepYTT0dS4zxrlm/+dkDhBxlLv8CzQnwm5quEvvkapGbbo7Tiwfg
         uBWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGGt/LhrwL994AzXBA0D61xvloj7YwekzdsxEOtXCtID9XeFBOwoNZqG80VfxnHcWoSUbeFDUCWl8lwno=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx74MKNsxp5ogJPqfdFK9nOt76FV1d9n8punJNr5bYCZiwLEOFo
	8nnfs406nEcskR0y2IoSVP2X+99DEovtTRa/xI5fDBtpyZ2xlNIBB0O+9/JsqUI9qT6aUFSbkeL
	6fazoVo+FaTLmzHElsqVg92WB+GAGJqKpKsCRn5vDzhUV1fly/5ZyFRbQ2fzfFcwUFQ==
X-Gm-Gg: ASbGncuKb0UBdvzDr4Xju354AJEeNWsz/yGpA4B+gj7RDI3iGlxNIra+rL+5Re9RhNI
	vXotSRPgw0OUHKQZUWf4UgQCYQx9Bm6ltfKbnweubRSEJGZE9AIrUtFvn5t2tqyIb5GPtg/FUXe
	MKL4D8YAA3soOlQWNSJT076d2mZ5dpDxrXKLRvom5wb3NFLBTz6B6/1adnH1DIwGvZpyoq7nYhv
	o9bgMO1se7EpEQjyf83jCxyEhVQS5Hx4DUVZXC7tO7Lsmv0HG2WTM7h/ouvnYNYtJD+RV22d0Sq
	0stg87TVNBjlCh66pZypjua4O6YXyD2Q3xr3k8kZh9Css0CpR/p27q7c1U/9lgUqzmOp7Fkmqsj
	U0ONG
X-Received: by 2002:a05:600c:c11b:b0:450:cfa7:5ea1 with SMTP id 5b1f17b1804b1-4538ee55a30mr23815295e9.16.1751015455340;
        Fri, 27 Jun 2025 02:10:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQ7MaK0HmuWyyuY3zMxmw4kpnQSfAZcXQCqQyG9nCH8ffS6eu1mWyaOP2gY64R2TPU1aKhZA==
X-Received: by 2002:a05:600c:c11b:b0:450:cfa7:5ea1 with SMTP id 5b1f17b1804b1-4538ee55a30mr23814955e9.16.1751015454908;
        Fri, 27 Jun 2025 02:10:54 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538f2fec5fsm18153555e9.40.2025.06.27.02.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 02:10:54 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Maxime Ripard <mripard@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Luca Ceresoli <luca.ceresoli@bootlin.com>, Anusha
 Srivatsa <asrivats@redhat.com>, Francesco Dolcini <francesco@dolcini.it>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Maxime
 Ripard <mripard@kernel.org>
Subject: Re: [PATCH v2 3/5] drm/panel: panel-simple: Make panel_simple_probe
 return its panel
In-Reply-To: <20250626-drm-panel-simple-fixes-v2-3-5afcaa608bdc@kernel.org>
References: <20250626-drm-panel-simple-fixes-v2-0-5afcaa608bdc@kernel.org>
 <20250626-drm-panel-simple-fixes-v2-3-5afcaa608bdc@kernel.org>
Date: Fri, 27 Jun 2025 11:10:53 +0200
Message-ID: <875xghczxe.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Maxime Ripard <mripard@kernel.org> writes:

> In order to fix the regession introduced by commit de04bb0089a9
> ("drm/panel/panel-simple: Use the new allocation in place of
> devm_kzalloc()"), we need to move the panel_desc lookup into the common
> panel_simple_probe() function.
>
> There's two callers for that function, the probe implementations of the
> platform and MIPI-DSI drivers panel-simple implements.
>
> The MIPI-DSI driver's probe will need to access the current panel_desc
> to initialize properly, which won't be possible anymore if we make that
> lookup in panel_simple_probe().
>
> However, we can make panel_simple_probe() return the initialized
> panel_simple structure it allocated, which will contain a pointer to the
> associated panel_desc in its desc field.
>
> This doesn't fix de04bb0089a9 ("drm/panel/panel-simple: Use the new
> allocation in place of devm_kzalloc()") still, but makes progress
> towards that goal.
>
> Fixes: de04bb0089a9 ("drm/panel/panel-simple: Use the new allocation in place of devm_kzalloc()")
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---

[...]

> -static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
> +static struct panel_simple *panel_simple_probe(struct device *dev, const struct panel_desc *desc)
>  {

[...]

>  
>  	ddc = of_parse_phandle(dev->of_node, "ddc-i2c-bus", 0);
>  	if (ddc) {
>  		panel->ddc = of_find_i2c_adapter_by_node(ddc);
>  		of_node_put(ddc);
>  
>  		if (!panel->ddc)
> -			return -EPROBE_DEFER;
> +			return ERR_PTR(-EPROBE_DEFER);

Not related with your patch, but it would be great to also add a
dev_err_probe() here to record the reason of this probe deferral.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

