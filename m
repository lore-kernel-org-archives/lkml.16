Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9AB27F726
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 22:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744755345; cv=none; b=DMun2B0kIB8YJCdcfCunhO0KU+STwiaRwK+DQ1bO20YTrMZ80JC5EashwEIsgxpLMLV2tckMy/Q/2jgJFrn3B4YG7/N+gmOE+4wA0BWZ+zv3f2k1zOUKQtySuIpGXVy0tNocFcxb6yFIG4Bc/NyiWkbMWCPi0lpWP+v1SA0B1z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744755345; c=relaxed/simple;
	bh=3IDLTt/ybfWS/Yh/QoGmWJI4cRQW9Qqw72xuwSQQoz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z//ZEDlOJueX9yBxKyqXcyoeyWAfi4N4baR6KHK+k5ea3p0AaZ5fzUI/pfwFJo2L/er3gsF9guO7JIOWAFVjHOeYYwtJ8xXCIHc5adq38oAycbTIaSlajs9T2CD8boBquBLC7v3lVqYXBEwVMt9HsF7pWoSuknSTYBdcW6+lBhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xgJo06PG; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xgJo06PG"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30c44a87b9cso50350141fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 15:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744755341; x=1745360141; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3IDLTt/ybfWS/Yh/QoGmWJI4cRQW9Qqw72xuwSQQoz4=;
        b=xgJo06PGDjE/C/mqIWjOtCx+0tQ4IRb+or3O9QwH22qaijmjDXXgIC+KJLlZRXFUTV
         lIRVucqzW0Cdj4mB8TpzbuWFH7NFlOuf8czjP9eTEUKRIqdfYOItvy8N02+wlzXiw+f3
         Lzqpx+0Sz6A6GfVcnWcAK3hlAWh5IQNnA9sFbkCqTkqpi2y/eBs9p3lLjlwf9d7dsFKm
         TH5v2wnS3qbIlHqTAE5c8JEOySBTjuzL0TqfzJ0DJ4gX4PIrs6EROu0+X59Ewl0tr2CY
         WMwnFWHcNGhgAvfl0MLUvqriC80GW8TRApplSAHMMoux5wSMY2X6Q/4or2NOXe3nsP92
         J3vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744755341; x=1745360141;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3IDLTt/ybfWS/Yh/QoGmWJI4cRQW9Qqw72xuwSQQoz4=;
        b=k/K7x1j6zkjOt8XIvdXds11hBo8LNeAWz5RPa7+UyNkyL7d4b8y1hZq69Z/YivaEkY
         p/8BO9ngWutsgNqOyPz6++FHmhgbhrwyJoSDmOi10X34n5RR9IYfFpS47svAOi1CRn35
         PbTFFheRV822s8SZyfd9/2u+BbDOuXiwugv7sh2agPsUTNd0awQYj1CE/V7NSwDkC5fS
         /o7PwI+K3E2RHSSGWcivCIm6u/jpM7qgRkIayc9JiSHjPD401zSpqvJWiVzOJHf4rr8G
         URz7GLsA04Pp324pPtcX/W8WSMtWrAsHYyTWSrq29wibBtJico/q3WUJ1z2w8zHhQVRr
         nuTA==
X-Forwarded-Encrypted: i=1; AJvYcCUeGInzjentdn8nBNrD+2LC++F72Y0SLYYxENudQ0N8NlTupEQTq/WfcuwcBMLOM+ILklbYzjv7Y5YZ6j8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLLOtYFRoHDMWl0C0U9ScxNpkTC/xXqfCEfRcHX1HTLfbJjspn
	rOoLG+AnuYF5+hPSGIP+5gtlOhSXkBNjE8Ze9c4di8MjBHWkhlewJj/e3syIIEum8JGUkEjA891
	D+fc0GhfSMrqV/9As1/wO9Ry2eqI5NiCYIUA0Ng==
X-Gm-Gg: ASbGnct7zyUYBqonWQ0IYViXUhwNFUFCOsyLARAYDJWjC1o9QW5Dn6ro+t+3KGkNus6
	EzS0pcVhJBMtd9NTQmGc0jn3RszncNVR4RVB6fwKOQlVJMTGdWbFJ0J+NYEmlB2pNA5+/PcV9P1
	NTF6lPwCxxDM0WDqsNxKhSGw==
X-Google-Smtp-Source: AGHT+IGz291D+ba2B23NSZhprn8muxlxhfCK8P3qwCVwnjg64DejVDMET1qWa0V8mNtq0S/w6O4IvzOXyFabUdyweWA=
X-Received: by 2002:a2e:bcce:0:b0:30b:bce7:80da with SMTP id
 38308e7fff4ca-3107c2a5e07mr1935241fa.9.1744755341129; Tue, 15 Apr 2025
 15:15:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409-mdb-max7360-support-v6-0-7a2535876e39@bootlin.com> <20250409-mdb-max7360-support-v6-8-7a2535876e39@bootlin.com>
In-Reply-To: <20250409-mdb-max7360-support-v6-8-7a2535876e39@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Apr 2025 00:15:30 +0200
X-Gm-Features: ATxdqUHsUTdiuzHDBft1cRFTLonjrdMquqGFbjXe9OBWsOq1Lj_ycSHfvYfu6WU
Message-ID: <CACRpkdbN15ZTeeN2Gj24RC8cB=s8ZqeyOtz9fkPSS1fTgwRKhA@mail.gmail.com>
Subject: Re: [PATCH v6 08/12] gpio: regmap: Allow to provide init_valid_mask callback
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kamel Bouhara <kamel.bouhara@bootlin.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Michael Walle <mwalle@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-pwm@vger.kernel.org, andriy.shevchenko@intel.com, 
	=?UTF-8?Q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 9, 2025 at 4:56=E2=80=AFPM Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:

> Allows to populate the gpio_regmap_config structure with
> init_valid_mask() callback to set on the final gpio_chip structure.
>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> Reviewed-by: Michael Walle <mwalle@kernel.org>

Makes perfect sense!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
