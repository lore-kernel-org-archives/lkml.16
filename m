Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA2C1A00FA;
	Sat,  3 May 2025 09:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746265871; cv=none; b=sRnAksx5uX7OGju/Ao7dKPNRcBcP1XZ5HAGR+sUOKhg6ZzFcuS3gPs/wQWq33Q6agWB8i/mmSvZ3yTPbEUe3hfOjs92RQ1cBR4q86w0CiVFnVbaX4APA0y2vUX2pom+qzR8hB9FAffXFojlntv7Iae329s4ZSKyp6aM54xNBp18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746265871; c=relaxed/simple;
	bh=qdTwr9XxWZHJpfg1C459Lmro6Gt4VJixVOsfhTugb1w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X/DPOjfDdiXf1fpLt0mI2pG9GC3x+u8oofbH5YTNfg3wdIbjPdaKfWLldRuqufYGTbwQpzz1tLv8wc6rkkSmCpLtzQDyetH5ZNgwv1eFuNfrsub+iyr849mz6YN2PptlV7lEgfTqw4sdvulzIURRf0QpQGofrUqUPFTiSy2o748=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CAYsbEOJ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CAYsbEOJ"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so26552395e9.1;
        Sat, 03 May 2025 02:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746265868; x=1746870668; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AWt/E24dFyub98qTTTZajSu/749h8/WuLO8wYKjQfmE=;
        b=CAYsbEOJv301gtus6EJ42JovsdMDN+Mt6XEhrFQFC9zCY6rFMLw2nfpDdSVBGezrHI
         AzBmGBLCxJA3R4nvTLKiXQT5Vz+5fOkMiq0Aou5cRSbFB+S+6AqLB86UuZtpF+FaM2xc
         fVUftvW7psHBqgpM3Ra0gSXSE+Rk9tH/sTqLS5/HiEsFnz1CaFFuC77aVOi2p+aa6G+D
         XXu1jLyoJzd57GDfKnPb72gk5GpcdGB2X1ujn3Z/FqZBTCCPtQTsKv5UiUCu/aVtojU7
         bbGnlvPDKBF7DA3cvThZw0HAaezh1dgphCycRDYBpk3zOjV05QG31a84iklLXDQkok8t
         qORw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746265868; x=1746870668;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AWt/E24dFyub98qTTTZajSu/749h8/WuLO8wYKjQfmE=;
        b=jfnLrksnWcJSRwnDrSCAOR2YorsBN6SPsNH09+ecxWgexChkXBx2jaJtUoc3wBDuod
         RTHFO3AyJkgJXs8MQcmir/Jhug50bDa+zA9X/zt3FS4Y6tFyAYj9uYK2fzchbuzGPrtI
         hIZ2oI397S/Ibhwx/+Q2hXddk60VdgjT1flJJUqAQvjfIBhuobOt40BbndCbTH0J5HMj
         xTFa4GyC6qkcEFAGV/apv5JG18pIz/QI7dpUoDDNPCf5cSwOxQ/PAQqeu/z4wlZDk6uT
         Lfw6xFXx1f+tJJ2PUikeRk8foke3ConjiskLFb7IggQ7GJDpFsbom1x7lygS5OoxpNCZ
         lTxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMtekLwz3T3DPOHsaRCfsYKWde1ZQWfhmjuPsqyTO562lqBuTdDNPLztScjXGGW4veoGssu6cu4Pvh@vger.kernel.org, AJvYcCVcs2thZQn91hIyv1RF/hCMnp0yaOk8EYhdpcyFDrdgC8QwAmRzugO7QrMSJ8idOUYHx0YkOty1BNAnYocS@vger.kernel.org
X-Gm-Message-State: AOJu0YzXLLEGO95u2rj8UURlmFMJVTa8EJuFEy3iugITMA37xMLkUtxY
	FKRSUPonCppT+WxobKDZOd1KQ0oUTo5o01lFcYdJi/vvHDRA93I8oubvI7ERJcKBwIoLMnp4Vye
	kofjTCt3cmkbgoe3QzZt2v3jnfx0=
X-Gm-Gg: ASbGncsBzCrLj+fjE5e9jn76msuxz+O/03iADeOh/sHRl1TYIy4K0DcvOvJ/e7s/3W9
	sXnDgzXHjW4pRhVIJ3eB9clE2CUs254MhErlI58lsyvAZWrAYPLzmryS+14xaauWMwnd2em/sS3
	dXqkg6+osg6XwwnQZjfJs7snVD2JpitaYpMA==
X-Google-Smtp-Source: AGHT+IELmDa8tUY8I6sTC32dmcWCs9uyqHPcxFCiqKy0asFsnzb6BDBRBXfnErIHdF0nShPafFx/rVrq/S2iBlEpens=
X-Received: by 2002:a05:6000:2411:b0:3a0:7afd:cbfd with SMTP id
 ffacd0b85a97d-3a094034df4mr7175956f8f.7.1746265867684; Sat, 03 May 2025
 02:51:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303120455.90156-1-clamor95@gmail.com>
In-Reply-To: <20250303120455.90156-1-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sat, 3 May 2025 12:50:56 +0300
X-Gm-Features: ATxdqUFfzmyWFFfsWmwTVH5O2UO-xmaaejS3vhiKg1fJkdEwVYfMrP98aXjh3Og
Message-ID: <CAPVz0n0XSzxzkPocRVx6QF7xwmA4otSeSEiRZgJQ3oStyUBrLA@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] drm: bridge: add support for Triple 10-BIT
To: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Svyatoslav Ryhel <clamor95@gmail.com>, Maxim Schwalm <maxim.schwalm@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 3 =D0=B1=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 14:05 Svyat=
oslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Triple 10-BIT LVDS Transmitter is used in Microsoft Surface RT and
> MStar TSUMU88ADT3-LF-1 HDMI bridge is used in ASUS Transformer AiO
> P1801-T.
>
> ---
> Changes on switching from v2 to v3:
> - place mstar,tsumu88adt3-lf-1 alphabetically
> - fix typos
>
> Changes on switching from v1 to v2:
> - sort compatible alphabetically in schema
> ---
>
> David Heidelberg (1):
>   dt-bindings: display: extend the LVDS codec with Triple 10-BIT LVDS
>     Transmitter
>
> Maxim Schwalm (1):
>   drm/bridge: simple-bridge: Add support for MStar TSUMU88ADT3-LF-1
>
> Svyatoslav Ryhel (1):
>   dt-bindings: display: extend the simple bridge with MStar
>     TSUMU88ADT3-LF-1
>
>  .../devicetree/bindings/display/bridge/lvds-codec.yaml       | 1 +
>  .../devicetree/bindings/display/bridge/simple-bridge.yaml    | 1 +
>  drivers/gpu/drm/bridge/simple-bridge.c                       | 5 +++++
>  3 files changed, 7 insertions(+)
>
> --
> 2.43.0
>

These patches had no activity/feedback from maintainers for a while,
so, in case they got lost in the depths of email box, this is a
friendly reminder that they are still relevant and I would like them
to move on.

Best regards,
Svyatoslav R.
