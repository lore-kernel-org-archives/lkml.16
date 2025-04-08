Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD5C2063FA;
	Tue,  8 Apr 2025 05:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744090965; cv=none; b=NK88DjOhB9k4hETS3Jw5afATAFgZcVDAUIqToKnLhcEjksPW13zWwrLh1sjJgWzD9p3KM7yScdajzLSqXldoVePrI1lh9nuOiX7+cRtiAE6EUtLMIrQSXyWzUmPeeRj3hGH5Oqs5g3g20RDWpg07ggWKCiLydutHVp0VECQ7KPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744090965; c=relaxed/simple;
	bh=JkXUz/XoGFUT5k9LVmtqJKl/eMUlgznfEvEGWx4dV+4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pa6fUPbFiah8U5U5ryx7jTd1SJKrRlQPeb01qGqaY25Fu4l6knQWZhnUyjG6X4YU3isb9iA+T7KqzaooLU2cOb9SjxygspkOPLNC2883oI7suoBNvqBESYGKKvXAbeIRBa+/e3pBmQ90LrADxGGM+WvDWyv/llCtj29Zl/M2+XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i+j0jLul; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i+j0jLul"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so34918935e9.1;
        Mon, 07 Apr 2025 22:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744090962; x=1744695762; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hNlU9IW0/3w2Hi0+ap/18NdS+AKkCCQ6NPlM5h3+t2Q=;
        b=i+j0jLuln+KI0Y2UUxmZzR+dOvwg7lHEWahV2+h43IO4+sDBbFFL4AHdqS/EGcC1Wj
         Mm2rSoa3tMgPF0av08ol2i/ZSue0K1AFgUXj/oG5WXZ7cPhyyXQBUd56DCEiQZzpJWpL
         4I4RMKNfr9JhojRkmE5X4ATLn82lyXb49JKGWGG0viZbbpFpjLF/IdJKF2cNOwsk9Wwn
         oPQNVOU4756eASssEXkECsgaO1rxDHTqRudgnwAZHXN0Ac5o3iL0xab4M6hCMxbmDO6k
         X5QGUNZ8hq/DLXeGPfc9EZ/yqZS2TF/NBmCd1QaNX72Jji2SmWboEoyfzuv76lASrP7y
         vMHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744090962; x=1744695762;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hNlU9IW0/3w2Hi0+ap/18NdS+AKkCCQ6NPlM5h3+t2Q=;
        b=jUljuY8AaKtHfxdPEP+D3YeCVSlXfUfLbHR48zFUa2YBlg6g+35blWFnog/+3YwDPK
         /EiKb4SahSNWIYL3ixNMq1FbbwtEMryKiDugCmQ6WjsTkJaT9a6E3TrYMKXrP3C8nMXb
         HKAslsiEbesOM0wzBsE+w8SwMNoEyc05ktBS2VrcvRiHYI1PeegMAY8Sz5OXySoBLhvY
         L+GGrIEMd9gvpKbHEWk6ZmniR1nvBsaZtlRjsMsgipTa2EscqGeCX2I8TgsZ43NW/K0Z
         N1ABH5bDWU/A8d04ZyQkraRtyJ1ymW0jw2hpu0NKBukxwsHcd6g4mo66HUSU4XEmHjNv
         K+uA==
X-Forwarded-Encrypted: i=1; AJvYcCX0h6RpirJR1I/UwdmLEoUgmJp0P13IBl1M12dzpPs8/11dhZLHC48fuRkMSq5vKfTDGfWQhxcG0QqI@vger.kernel.org, AJvYcCXgoqZwY6yoIDTNhDjXJxZ8IVCMhrBs2vvM/67t3HM/DxJgQWh/OD4Dyz5YgvKxf0RNt+2dcC5W7A6dydRB@vger.kernel.org
X-Gm-Message-State: AOJu0YwLRwLBAm+e4JvFny4bmLApWDLEcFfWQ/s8QzEfHNLCJYWJIY+n
	yh2b+7FqK/m0eUryinANQa9+/+G1pHr0qyCM9Zw7VxrTxB3Sr4lCW2//+cm2NWP/Jl4i3aKnOlX
	oi4er8TnAKFVb6Klmjf6icV+RJmo=
X-Gm-Gg: ASbGncu+2uuQSIDGBCCLKKno2nHcC/VTYcaIS+kOql8lIJIEf3z8kK6VY6pYXEADi93
	r1oZnpaTWRm1asCN/T1lulSsUMdrW7ca3sxgEam3Y476iZmbtT7K/B0y2dwcUZ26C6LA/FDMvD2
	eso6U7aBX7Ow+/mRGN8HJdb2iZ4y4=
X-Google-Smtp-Source: AGHT+IHmnqwp7fYLD9r0VzUZ9uVobcEtY3ANbSUHe5IqHvpSb08zJTe5lq7GR0A2HHq8TuJDFRWbEUa4D0HngXEzQro=
X-Received: by 2002:a05:6000:420f:b0:39c:30fb:fd97 with SMTP id
 ffacd0b85a97d-39d07ad8accmr11712104f8f.1.1744090962383; Mon, 07 Apr 2025
 22:42:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250223153244.149102-1-clamor95@gmail.com> <20250223153244.149102-3-clamor95@gmail.com>
In-Reply-To: <20250223153244.149102-3-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 8 Apr 2025 08:42:31 +0300
X-Gm-Features: ATxdqUFll3jD8BcEvaAkgpR3n64WmaGGcMsqo5zGxP_xFPaWja_GHAYRiR6wr5A
Message-ID: <CAPVz0n21dv1faVeWaRRtA=06D4Ve65cwP_nYF=f=orv_d67oWw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm: bridge: Add support for Solomon SSD2825
 RGB/DSI bridge
To: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BD=D0=B4, 23 =D0=BB=D1=8E=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 17:33 Svya=
toslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> SSD2825 is a cost-effective MIPI Bridge Chip solution targeting mainly
> smartphones. It can convert 24bit RGB interface into 4-lane MIPI-DSI
> interface to drive display modules of up to 800 x 1366, while supporting
> AMOLED, a-si LCD or LTPS panel technologies for smartphone applications.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/gpu/drm/bridge/Kconfig   |  13 +
>  drivers/gpu/drm/bridge/Makefile  |   1 +
>  drivers/gpu/drm/bridge/ssd2825.c | 821 +++++++++++++++++++++++++++++++
>  3 files changed, 835 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/ssd2825.c

These patches had no activity/feedback from maintainers for a while,
so, in case they got lost in the depths of email box, this is a
friendly reminder that they are still relevant and I would like them
to move on.

Best regards,
Svyatoslav R.
