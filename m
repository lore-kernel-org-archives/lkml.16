Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC771AA78E
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 22:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738274421; cv=none; b=YSBfOex3RBKfXNwja64sDRZIUjuP2ueZb7u23KB9syjt2ms4N8K+FbgYrG/VwQlrskYYsg6wMtM2PwUlSrpOtP3kSDOntLQgFNi4cJMzP/N02nPKyUQ2GgR7lpqYtRkERmdeJkcFj8MKrUV9bnPtcyEY31dKDgoCHpPxXp8Ozzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738274421; c=relaxed/simple;
	bh=PDx3eLdL8mc/JOoBrABGg5DGnjthUQVP0JFp6Oc59bg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bUNFRLVnqWPkjvryaZiIf0F41uUm48pboxnLY8YtexvfoodqKTb8N5wx4SaJpW/hpM91PZcfFFaCVwWcGzYudK3M9lchteOe5tNCB2nMmK4Eu6vFglBGMhL6MMfJvr/Db+nGnGpkH58JRU99dDcDRajtcdruKZjjFZoKlVJzGtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=PvFIgK1x; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="PvFIgK1x"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5d3f57582a2so4721938a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 14:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1738274417; x=1738879217; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PDx3eLdL8mc/JOoBrABGg5DGnjthUQVP0JFp6Oc59bg=;
        b=PvFIgK1xHW+kT4UJMHQxDGW7aXS9Pign1RGNjPYamfdQ10VHUeQv6nHgMgoPE8keNg
         SZVm6F+0v0X/IDbdm4dwOHKbB9QJElU5S39uA9/1bvKpP2BT4+aiYKrFWJ/r8DEoNi3E
         KxMywusGHL+9DQRo6pGTLBV7VNAjKOuo2CsFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738274417; x=1738879217;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PDx3eLdL8mc/JOoBrABGg5DGnjthUQVP0JFp6Oc59bg=;
        b=MOAbjjlrqQ9uXoVDoyegeZhweg8+HpP4J9CMgwgVx4uM0DSuQtngO+1v+WlA2TrAnt
         orLm9Vy+gwm4KkeFdtWbze+cIvdOt9rxBjLrrCYLNY84OcsSeW6/LRz7PHnibVmSchkU
         JjJ3GjSlM+tCb0lrCtqUS9WOYCpZkgc/u/9VaZN2LJYeMGk9YUr+eFWEGjhYS62lWRB0
         3rVjUmxwmRIbKeOW6GBkXkJEgh/X9Zfu90Lw52Tim9JQ8yDPY4qyI4kUSOPMeyi5AGXF
         va/Z34rpRY8R22+O+m8N8mhDdNYMezq0S1JxMUcnfH93gd8wz2P/yNAvcGhhBRSReuBx
         CG4g==
X-Forwarded-Encrypted: i=1; AJvYcCWb6wRlMCDG03ZJ/M47HGZeckMo8oowYHpZCIUoMgRvQZPdRWeiXb7heX5LE7+RSKdA1637DcUdScffsxs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmmC1xCNzwTQKvw6TYKgw+uTUzhA2tZw2CGnnz7ZUwBpvoeJ0E
	//RDQAPLrsP5VKPL8Tbi8dOykxarMbrMQoDlsm0VYj6k2RaRgUj1dXU76Z0jTVEEQMYBn5F9wIR
	BuDXpsxrl1e4gZ8/+zHNxL4OwhbyNtWm8W9i/
X-Gm-Gg: ASbGncvXsY+EYQ35mjVgEeNSRpbiIB1iYaCdeSKCUThcSC6DjDlJUD42hZuMKzGgIAW
	tsgQnnVDh8/Do7ecY22Ta1eV63h4Rm1I+g8rWvPQl8NMg2FBw4lxO7Hmj1GOtiZF2Av4UwWwh4w
	==
X-Google-Smtp-Source: AGHT+IGSUW54140T4OuYOk2vgP7BeRdGJ5tiGx1SbF9XB6jyHUjJCkopnlbK8Gw3x8EQtEHebiMmI74eFk2oo+MWuR4=
X-Received: by 2002:a17:907:7294:b0:aab:a02c:764e with SMTP id
 a640c23a62f3a-ab6f7491be4mr101639366b.14.1738274417545; Thu, 30 Jan 2025
 14:00:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250130-kona-gpio-fixes-v1-0-dd61e0c0a9e7@gmail.com>
 <20250130-kona-gpio-fixes-v1-1-dd61e0c0a9e7@gmail.com> <b7662246-813e-4e5f-b41a-574751110833@broadcom.com>
In-Reply-To: <b7662246-813e-4e5f-b41a-574751110833@broadcom.com>
From: Markus Mayer <mmayer@broadcom.com>
Date: Thu, 30 Jan 2025 14:00:05 -0800
X-Gm-Features: AWEUYZnxlB5TZe4w54AbCDYAyROrmW4GAY2NUB5c51Pu98RBWSk1lQdDFvKPT_o
Message-ID: <CAGt4E5spr9gdroYnvOqCR=YG8spNfOomTrUqPAynnQYP8a-jXQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] gpio: bcm-kona: Fix GPIO lock/unlock for banks above
 bank 0
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Artur Weber <aweber.kernel@gmail.com>, Ray Jui <rjui@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Scott Branden <sbranden@broadcom.com>, Markus Mayer <markus.mayer@linaro.org>, 
	Tim Kryger <tim.kryger@linaro.org>, Matt Porter <matt.porter@linaro.org>, 
	Christian Daudt <csd@broadcom.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"

On Thu, 30 Jan 2025 at 13:33, Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
> On 1/30/25 09:10, Artur Weber wrote:
> > The GPIO lock/unlock functions clear/write a bit to the relevant
> > register for each bank. However, due to an oversight the bit that
> > was being written was based on the total GPIO number, not the index
> > of the GPIO within the relevant bank, causing it to fail for any
> > GPIO above 32 (thus any GPIO for banks above bank 0).
> >
> > Fix lock/unlock for these banks by using the correct bit.
> >
> > Fixes: bdb93c03c550 ("gpio: bcm281xx: Centralize register locking")
> > Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
>
> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>

Wow. That recipient list brings back memories.

Also:

Reviewed-by: Markus Mayer <mmayer@broadcom.com>
