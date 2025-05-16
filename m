Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B078022B595
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 17:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747417395; cv=none; b=KmqvvWExaKa33F5eK4OOyE5pHT4njLbGb5Zbezy+3x4IVoDZ+otQZGk5OfkkCxBanRX6K6aD3r9eQai0A7G7GZ7cgPFTXj6DrwGyljrmUkaozgiQzlM/HFscNzLg2rnLI7HvOkdAX3/NgHBnbolSX0IkoFyR6kJ6Z4jadLlXAWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747417395; c=relaxed/simple;
	bh=sBay1aenEjXfkacn+ZY+Cr1OwhROHPoxGk23mUtmbX8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H4iXxWYyVfMLHJMSuSwG+Q/7xXZvd+cCHCzsUEc2nNN6Hx1JNiP7wBO+wG10ClnyZUJOTKoI+ps2DJ5PBD1rpCivCNk7Rd5EgYbvdI3TgcQYedGM7MyvxGBSBEWkCPWiKKGPbcDzkeaNWiLQJMcuepMwm1EslvWzHcZWoeUFHKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=g5G0G4u1; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="g5G0G4u1"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-30e542e4187so1796529a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 10:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747417388; x=1748022188; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+KFX83QNItwP0IuJnpM+8MJlz755t87bEyDF8uRue2k=;
        b=g5G0G4u1eTfA8MEoVGpWxpd+FWroIHC9MMRqy3UQr4kiDvpo0yC9WlACpp3B4f88PE
         0ju9DvlYO1SZ9e2pG8c8oKDzN9MDXMSxBvtwF1WGbkG09uXmwDg2EAKAz5bcjcK0tt9e
         T7/VyE0mPm+dWmdTCXKEREvmY+N1C3YGKGEk4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747417388; x=1748022188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+KFX83QNItwP0IuJnpM+8MJlz755t87bEyDF8uRue2k=;
        b=Fe0uixW3u+p0oMrUbaI9kFN8LSsFozYu2unIvYy3MyttYNxgEB9ktQNS/kPc9ke/kw
         TJQ7SxvFyLEvLh+yY8R3Aez65sisTap0tdfnWuNjAqGE4KXKJp+uEE9EboSd4Y8ulvqG
         Mzi/hGBjSxbSYuDOdkerXIB2zCtwR9cnuC79gbqmBpnqO3ZSL4HSsQpfBXYt3e1LdJ72
         TGfEqW2uic9VjGwYE49mRQIJ6suE0CfqUMhme92VdwJ8JFHjBVn5RKuow9HXTFFzwFuW
         pYY3ovs2UuN7+gr6ihFvcrS2FbJhfVzQe5P+hPGYAM5PkGghjzCG9EiXjLBCFgNmwcXR
         RzBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUf/AlXJ+CKJzH6W5uUa3OL9guJWZlHRVBzi3V+LYvC3NMzoY6S1M4jXpWltrWcxInpgFUIZeq8SCnCfVM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHQlYu/XyoP7aHngBVBT7b/nNI+n4ET9Z2AlrrfBo+NoZ0MzGL
	UkBL98VDoHJwtHPAyurBnbUmsY6ef6FckQZ0sqN1rzeRqVd5G6BE5te4o59ZAXc/ghsbOaLPQQ+
	MAUM=
X-Gm-Gg: ASbGncvG62KlAUtQgbfXSaQUz6b8e136Ay4da376+Iwxp1AxCdLPWt2qQMKeqoxPtoF
	XBb9/kTIbxieCrIyo8S6Lkk6GO7P5SWkuJz/LZo9t5Aqlqv+//WYAHTHfRhkdOek24Klbx0LPk9
	4NAETrq7o1MS8JwjZcOFY8o1kt8xFTHQ62565DiAgu8cAfo9ED+kkejnZZfg92tMdjm7iy2y8RY
	Y2hvn9NMubWPQjK9Oc9MB1k0CauDyAY9HL7/SthNONeZ6yAVjuZGNq1qlg6xKO4faNPC6GqQMBD
	CaxiABVdalRQXxzQ9+JVMA3N8Ph5S+dx8ue6lG9Ep6v01BrNubzwLuhMqiD9ocCSUGb4ye+Rjgy
	Ak268DlOcSRO51Px63Ss=
X-Google-Smtp-Source: AGHT+IFP6v9PwzmDfuWBuEezudX2s5gibQ6Z6LxElR52J30FLGXHxgl6bbKcezWP3rDDGKftGVTysw==
X-Received: by 2002:a17:90b:38c5:b0:30e:9aa2:6d35 with SMTP id 98e67ed59e1d1-30e9aa26ef5mr1958030a91.0.1747417387886;
        Fri, 16 May 2025 10:43:07 -0700 (PDT)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com. [209.85.210.175])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e334390b7sm5992024a91.19.2025.05.16.10.43.05
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 10:43:05 -0700 (PDT)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-74248a3359fso2650130b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 10:43:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW8mDBIeWuB+qMwhHownQDZgSwEedAJSoBPrJ//VdPQ3Zoi0IWYJdqX8BKxQ5AGE6q6Mb/bMrPKawbkswg=@vger.kernel.org
X-Received: by 2002:a17:903:3d0f:b0:231:7e15:f7a with SMTP id
 d9443c01a7336-231d453469cmr47600355ad.27.1747417384710; Fri, 16 May 2025
 10:43:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515211110.8806-1-robdclark@gmail.com>
In-Reply-To: <20250515211110.8806-1-robdclark@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 16 May 2025 10:42:53 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VhOhGHnHZKBmzFKAFG-WnGhWRyqPm=FwK5mxUJ-ChWGQ@mail.gmail.com>
X-Gm-Features: AX0GCFsvr22QrX8yE42n8nz9bH4x0JASq7vWnUdqtPzSrItPo7-Ymzm-4RYVtfc
Message-ID: <CAD=FV=VhOhGHnHZKBmzFKAFG-WnGhWRyqPm=FwK5mxUJ-ChWGQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add BOE NV133WUM-N61 panel entry
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	Rob Clark <robdclark@chromium.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, May 15, 2025 at 2:11=E2=80=AFPM Rob Clark <robdclark@gmail.com> wro=
te:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Add an eDP panel for BOE NV133WUM-N61, which appears to be a 3rd panel
> option on the lenevo x13s laptop.
>
> edid:
> 00 ff ff ff ff ff ff 00 09 e5 64 09 00 00 00 00
> 16 1e 01 04 a5 1d 12 78 03 55 8e a7 51 4c 9c 26
> 0f 52 53 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 74 3c 80 a0 70 b0 28 40 30 20
> 36 00 1e b3 10 00 00 1a 5d 30 80 a0 70 b0 28 40
> 30 20 36 00 1e b3 10 00 00 1a 00 00 00 fe 00 42
> 4f 45 20 48 46 0a 20 20 20 20 20 20 00 00 00 fe
> 00 4e 56 31 33 33 57 55 4d 2d 4e 36 31 0a 00 7d
>
> datasheet: https://datasheet4u.com/pdf-down/N/V/1/NV133WUM-N61-BOE.pdf
>
> v2: Actually get the panel name correct in the table
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next

[1/1] drm/panel-edp: Add BOE NV133WUM-N61 panel entry
      commit: 3330b71caff6cdc387fdad68a895c9c81cc2f477
