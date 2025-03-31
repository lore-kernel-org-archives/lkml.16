Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBD121D3C9
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 15:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743433619; cv=none; b=TWpA1UapYVdJfDN2diBldV7UTrNgyqFJZeUfIX+0PJ53Lz8VkWoDFsD2p1sBwuPB8HMkkv9wNodl/+Ye9D4tiP9ZCiEEOlcwnUYrnTXv9FznLnBYEq2WTQDfPLyyR2JWk5rmn+g9QSqlP2cnwu576dEFj1LTLjb6kYqXcbrPhgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743433619; c=relaxed/simple;
	bh=Tv5LfbRTTaUZL++kwQgx2GFdjtT/LVhBGaJ0h348z/4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q+uikJnuZtz2BUM/LGgzXCDtM4bmQuvsx32LL71nY2GN4Cl8YOGY8jahuYPylqwXBtTvLPLI1UokTr1aIDB2dSfwZrDBHkejU0xol/ww2bgPUOaNKAsSRUYdEMNIjMpVj7Czg9971x5TzdNMZXdShm3VOEkmSHwVDuxZkiF5wqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EHKtWl3P; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EHKtWl3P"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-549967c72bcso4902553e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 08:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743433611; x=1744038411; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UcGdaRNt7zwbYw4AvOVG6yQbALs0693po5JMHnUNj3k=;
        b=EHKtWl3PjjHzXwuSqjy0JrZ45sIicN13XW3fU4ZAL2TFFhETsCOEu8Xc7Oy3Uo3d+9
         3jrc8RfO2uotLZezH+2AyL+OH2uK5Z7A4ejOc3dW2G1ntc9riAdwnyfBTMN7n6hQDadl
         z1z4G/QuWCsUskSQbjKZyEDriheoPybq7Fd64=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743433611; x=1744038411;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UcGdaRNt7zwbYw4AvOVG6yQbALs0693po5JMHnUNj3k=;
        b=VgIPKNuW/FGIG2J7cC5D8NMyy/ubW1iGOirjHylHAqD2OeN7kwo5+tDeVBxsK8urn1
         Yf806gLxp/PM5sYg9AD10MreJegBjDTNmAOMcv65DuC4/SbKpP1QXArl8j53YRdfr+t3
         GnPDv9RVK8l8plfOQVQev8UNXhm0RTeTiiag0I4NFEOq8cpSwX5+vOCTMSEOeCKE2zOl
         wSxSJ0sdN9OolSsy+JPpNSoLd0SzZIyBfIO7VQvj5WidYaBz8i05FmJgmiwKW2PTT/CA
         jbrK2UllVpGDJ/QlEyyD5/FnM7K/rzqnwdTgNG7Z3wZBIvDMEzvDP05yzaRRre02Jm4z
         hsxA==
X-Forwarded-Encrypted: i=1; AJvYcCXfUTeWthDnV4gpEws8cViZl3tuw3tW9+/hmetx2Ok0sguhG9v9/+JHvAsU0ft9UBR+7dJ/HuD6cyOXAmQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjsPPuolFNsnXPuhF858oM0et77FjvXlK60owRHRhrZADU7FTC
	jhc99pwVWhWhM4lSYgcYLXMmeqJ7P+xymrdvyZMn1OHNrnXBuuFA8KWntMcN7p3NFXi4MKvj+OG
	VzQ==
X-Gm-Gg: ASbGncvtFqAJSoiV3mGauBReYM7XFEcZwKQFDtIFGjZM8rJ6YHhiDQ7IHrmD56NtWdP
	WuuCfuRfivE+2OjnDEekpKBS/2hGISzo4eionHlwWyykNhy9sz4DjGTiXyR6ejVtRKreiXz2DX6
	TQBfCJfjcYbFXSrzuNfnFsk5YuJpMznTO1GtRTL2aFxXj8iMK6EGZXT1DTE0c8ifHeBIPrVJi2v
	TRsR30y5GaKMMdsSOmqXr/K/509VC3db0/eSuCNsxoHYW/kWvqXRxUDTyNubsl7jaibOroFyUHS
	a5sHdQXfOf8lJzJ+ipwIbjECi+43SjTOWGOkqHC2KAMI32VHfTYAkES+0s41XYtkNjbwcqaED9W
	APq985OOVr3Qc7t5O0Ga1LHM=
X-Google-Smtp-Source: AGHT+IHrzOZ0SFIPdDPHVrWn91eenNd0Tb+Fqsz0sR806GrQPorGT09X2H9H1RuEsp6JnNj6egtmzQ==
X-Received: by 2002:a05:6512:39c8:b0:545:fad:a747 with SMTP id 2adb3069b0e04-54b10db734cmr2430923e87.5.1743433610619;
        Mon, 31 Mar 2025 08:06:50 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b095a365asm1143529e87.250.2025.03.31.08.06.48
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 08:06:50 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30bf8632052so39725261fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 08:06:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVwD3GzUpFl1Z0GhyT8aoV1ILLTAOvdQyRPFWjydLJVTwrsaNrsYFGz4m54jxzjbBKQfrivLFe/bVRZtWg=@vger.kernel.org
X-Received: by 2002:a2e:9b05:0:b0:30d:626e:d03a with SMTP id
 38308e7fff4ca-30de02f8530mr27295971fa.34.1743433607807; Mon, 31 Mar 2025
 08:06:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250331061838.167781-1-tejasvipin76@gmail.com>
In-Reply-To: <20250331061838.167781-1-tejasvipin76@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 31 Mar 2025 08:06:36 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UbUqNf4WoWzqMe5bDQmxiT+bRG_cn0n1dBrkFRijx0Cw@mail.gmail.com>
X-Gm-Features: AQ5f1JpNALqbXefbGr_-OhdG6T9nJRItrlLN0TLPzRg4IlCEn1c8nByQj4w1VJw
Message-ID: <CAD=FV=UbUqNf4WoWzqMe5bDQmxiT+bRG_cn0n1dBrkFRijx0Cw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel: boe-bf060y8m-aj0: transition to mipi_dsi
 wrapped functions
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	quic_jesszhan@quicinc.com, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, asrivats@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Mar 30, 2025 at 11:18=E2=80=AFPM Tejas Vipin <tejasvipin76@gmail.co=
m> wrote:
>
> @@ -157,7 +137,6 @@ static int boe_bf060y8m_aj0_prepare(struct drm_panel =
*panel)
>
>         ret =3D boe_bf060y8m_aj0_on(boe);
>         if (ret < 0) {
> -               dev_err(dev, "Failed to initialize panel: %d\n", ret);
>                 gpiod_set_value_cansleep(boe->reset_gpio, 1);
>                 return ret;

It's not new, but the error handling here looks wrong to me. Instead
of just returning after setting the GPIO, this should be turning off
the regulators, shouldn't it? That would mean adding a new error label
for turning off "BF060Y8M_VREG_VCI" and then jumping to that.

Given that we're already squeezing an error handling fix into this
patch, maybe it would make sense to add this one too (and, of course,
mention it in the commit message).

-Doug
