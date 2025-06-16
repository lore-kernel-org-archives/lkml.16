Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE68D1F428C;
	Mon, 16 Jun 2025 07:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750057497; cv=none; b=c/Pxgs10m3oHqa4EH3kmzyJPLGLpYYyqq76BYc05VQ4n4Nn9l3f9FnyDZsOANAj5d7wGoSRD/AyZm+fUarjLusUYil6h8M6fWp5EL8GF8QYaTPSTzinn27PM40olb05ZA3y/yg80fnytlLaTLgxqFBXLAmyT1mADwQ+NyVkbE4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750057497; c=relaxed/simple;
	bh=ZxuA9suF6QsGyRmQq+wm3t6R+rZpVnpLgmKi3jqAaRc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z9M1w9LmyugZbgHJiOMvEWJ2FIGj8yMYpVGstFQaDx2IjumrjV7SeU9WXyjR8zF/NN+ezF65v0bJGTdOUWyV9Lzm880gis/utbR8VKz2lbD/Me2rmce+y4xT2WOLjLs60y2bTEg7UQ2oahwepNjsoN/WUdlRrSNP5R/RsW/26uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nNJ5+HIS; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nNJ5+HIS"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a53ee6fcd5so2524486f8f.1;
        Mon, 16 Jun 2025 00:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750057494; x=1750662294; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1oEG3ysHjpdeGsIwj4yEvz5h+q+F2S7yXPMXla1Oxuw=;
        b=nNJ5+HIStgi51A29EBq0mMo9L6HEuTVYt4GgvXZEFJ505lu+ne3rjGEUX191Gki52a
         lpG36KimUXb0tW8B/oCPvUYDfk9EybwM3voE4ngPDs1ufJQXfgv6B7oDIadi7WUpMfX/
         XLsph3V3E+mHjzRPt4gE0qF6D+2UZ/saBYdpcfSMaDoW1F4SrUmgaN6GHLMALx5BTCJp
         gFJ/3uQcQo/C+GK7tNLEvSlLT6TQaDUA086cLGciLXA8H4JjjIxqN867jFvLv/renRvD
         S3IIK0fc5ugmFZ3MJbJS5cmgvSCk8BIUhIYk1ltOQYz+zu5nUvxn+iERe/Zb5ClTe3Gj
         5siQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750057494; x=1750662294;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1oEG3ysHjpdeGsIwj4yEvz5h+q+F2S7yXPMXla1Oxuw=;
        b=uL/e5Y/C589mG9uUMWImx54NKFGDKRKMCbABF/W38FXvis3cBnsDkEMpz7al3DfV8p
         fHFUa7caDO2/xRyJbBVBzl78Cj0hTfJN7ar6jdh1NaFGNSv0MILKsXx+KziY2vyeMkwd
         ldnlt58RAlrqWs5VWbnzGi189E5dYlqresD1jNd0QdL3Zmq2c5Cf/0XK6M8i/ha5En8I
         rga8NTiLMkjcSXm8xCByruhLgJrRwBO1VuPzYJl4IEedDnHNREwwHY6db+PvSqzHHiKN
         knujfpTDU0e62VpilNerPJgKhZlVvodlqDYyVX8X7DKpw+JEF5LW7NTwMlAB7HsJUhZW
         KJFA==
X-Forwarded-Encrypted: i=1; AJvYcCUAWT3VM+34VET/0/SzXdILF56egXmyn6lxxHyuM1jW7v7IxjyeXiyGy3J0/ykhMm1LWfqs833Y8zcEq90I@vger.kernel.org, AJvYcCUqFpnr2d2sFEme8M0QCif49XRYtVUJofgvpt8NzBsRfTnXZzDp0fli/fWH0g0EB7mZ6m1TUObIPcdt@vger.kernel.org
X-Gm-Message-State: AOJu0Yzjya9Aziv+C8PYKmHHvIU95hNZ2tFgAh+kLavsH/sU0DF7XJaf
	nfUlL+iMUgwnck89zPi/T3bKgIl+1qnsei64TG+f/QGO8DReNoVXYoevWTyew2jei8FewEEk2vr
	k4hScYdlM+koQFb7BIa42JerxnutZ4cQ=
X-Gm-Gg: ASbGncvyeAl3oMCimUOOaWHzx/TcI5I0FZIAFVJvkjsmB5AwiMoTSs/qhqXFzXdafqo
	OcueigiVB4K/7nqJbmVScJkrH7p3yeh6IHP1D0fQZBQmjzwYDsMJj3v3dur0FJmHOeIwAa7UiTD
	/IuKeYBa3hx0Nod4h4IVJpuhhqcdgeLLnI1YPl9MUqXVSKjSF4Tlq3dfM=
X-Google-Smtp-Source: AGHT+IH+83iGOUs6KGgkeXxI/hwC4jIryRkMXCNB4fAggGMDyUiBwodLdgfD+uL39t6KuVYf6bfWBRlf2qKO4sXhC4A=
X-Received: by 2002:a05:6000:711:b0:3a5:27ba:47a8 with SMTP id
 ffacd0b85a97d-3a572e99895mr6366894f8f.52.1750057494053; Mon, 16 Jun 2025
 00:04:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303120455.90156-1-clamor95@gmail.com> <CAPVz0n0XSzxzkPocRVx6QF7xwmA4otSeSEiRZgJQ3oStyUBrLA@mail.gmail.com>
 <CAPVz0n2MLmHfVNb25=o1_woE7v16hoamwFbbT3ecE+BP1Bn9aw@mail.gmail.com>
 <6df6ecc4-088a-4b27-bebf-abc4560b00ae@kernel.org> <CAPVz0n1S2rWW_08FoL+jsVJEOkQ0JJZBu+bB2U5K=fF-g87Y0A@mail.gmail.com>
 <c2bd6a03-6f65-41ff-ad26-71287068f2f9@kernel.org>
In-Reply-To: <c2bd6a03-6f65-41ff-ad26-71287068f2f9@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 16 Jun 2025 10:04:42 +0300
X-Gm-Features: AX0GCFupqmFcmgFpPCRebWxKUhnQj80OD2Gl-qOuC42ZRRk2nSdbfDWbKgqNKoU
Message-ID: <CAPVz0n1udjVZY3400hYMY07DjNKfOt4bwpW6He6A4qo_3pXtqQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] drm: bridge: add support for Triple 10-BIT
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxim Schwalm <maxim.schwalm@gmail.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 16 =D1=87=D0=B5=D1=80=D0=B2. 2025=E2=80=AF=D1=80. =D0=BE 10:0=
2 Krzysztof Kozlowski <krzk@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On 16/06/2025 08:54, Svyatoslav Ryhel wrote:
> > =D0=BF=D0=BD, 16 =D1=87=D0=B5=D1=80=D0=B2. 2025=E2=80=AF=D1=80. =D0=BE =
09:50 Krzysztof Kozlowski <krzk@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> >>
> >> On 16/06/2025 08:42, Svyatoslav Ryhel wrote:
> >>>>>
> >>>>>  .../devicetree/bindings/display/bridge/lvds-codec.yaml       | 1 +
> >>>>>  .../devicetree/bindings/display/bridge/simple-bridge.yaml    | 1 +
> >>>>>  drivers/gpu/drm/bridge/simple-bridge.c                       | 5 +=
++++
> >>>>>  3 files changed, 7 insertions(+)
> >>>>>
> >>>>> --
> >>>>> 2.43.0
> >>>>>
> >>>>
> >>>> These patches had no activity/feedback from maintainers for a while,
> >>>> so, in case they got lost in the depths of email box, this is a
> >>>> friendly reminder that they are still relevant and I would like them
> >>>> to move on.
> >>>>
> >>>> Best regards,
> >>>> Svyatoslav R.
> >>>
> >>> These patches had no activity/feedback from maintainers for a while,
> >>
> >> Really? No activity/feedback?
> >>
> >> What is this then:
> >>
> >> https://lore.kernel.org/all/567addb4-169b-4fd0-aabb-78ceded22702@kerne=
l.org/#t
> >>
> >> https://lore.kernel.org/all/ptyvn34i377pdu7mqital6v2bqe36oy3yprxb5c3hz=
tni7h52j@6eo64gzxvgg3/
> >>
> >> You already were sending such pings claiming there is no activity whil=
e
> >> we provide you the reviews.
> >>
> >>
> >
> > Then why these patches were not picked for more then 2 month if
> > everyone acked and reviewed them? I am pinging every month to remind
> > that they are still relevant and were not picked!
> So acking and reviewing is an activity or not? Because if it is not an
> activity, there is no point for me to keep doing it.
>
> It's not a question to me why DRM maintainers do not pick up such
> patches, but your message did not question that.
>

I will ensure that you will not get such pings in future.

> Best regards,
> Krzysztof
