Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A721494C2;
	Mon, 16 Jun 2025 06:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750056870; cv=none; b=XDeuJ4rwwdr33eJud34S+Ff8Rike33z/m+72VPlrsW2xomFOk0bI55aoA58bK6xc2oBtuSGis9g72i0Nyw1NPaVgVDxdymcVX++W5KmHhQJNGbGACwCGYjn4wgnj7W8d48tYrlNLkNFRt8ig4fwhOQky1+I50dq9ETxCEjclLFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750056870; c=relaxed/simple;
	bh=xTXhD1PieVFTPzYkVx5m5BYJQrQsHZiX18xQoY/GikM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PTZsdYfmfeSZY389DirTHVRxo9+HTdBIhgzmURnsW95cby74eLNahvd/q+hMSxRayFpkM5GC7YX1gfX9yl0A/KLl57k3O4sSeWVZ5j6k2CIzC+zKn1+jLtMGExlrstSH9+UyrC+0cg2PpbHq+OAkwD4JH+tkJMdz8O2yFvF9J8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=chG1Hbui; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="chG1Hbui"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a575a988f9so1036013f8f.0;
        Sun, 15 Jun 2025 23:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750056867; x=1750661667; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LA6qyNS9z6v4ERjgPYF6WqyvfBbPjoGj6cbNiGOvOfU=;
        b=chG1HbuiZMfT+yrR2ZbzmREYGMNJi3z1quFQdPRl0QtzV9iQZg7WzuU565EXN2Q5jq
         BDxqxG9SQ71/ZGiflEESDVdYFoKCw8JrNE885mUd/Lr4E4JNf3iF8q1A4XwmuLrOIAM8
         TYPOIv4Znx6SBOPbD5leClEMk6RTW6Ur8URRlqNKC0/fNv3KUz6wswytRtmVdifkjT/E
         iqjWKWvSvzvAvpOr9g2Ud8ztjywd4SFgxwEVO7dztO1XlcGixUMo1ytjc+dIMd+3I6K6
         kqepLM81AsREInOpbhWjHT17JPcJwuBdVlqt7QrSg7HBtIjjsNeG5Jnw/UTq/qkOXNRA
         Wjcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750056867; x=1750661667;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LA6qyNS9z6v4ERjgPYF6WqyvfBbPjoGj6cbNiGOvOfU=;
        b=vELuE2Jvjq1kcSsxtTNgBBpl7Kn9UEmPU/y+JCiJZBaTpnnYE6ojXDDlgnkMEmo0PQ
         w9i4Hd8e1WoaMhiO4MD3UhF+gXAJpNu/n2JEd8aEd5Avno1bIyoQIA+P+lQa/CNKw3Po
         8B2TZy5fgA7xBWT5RFdSgPkjFPf8IoO543l1RlMtQuQwa8NKcYsMSYDobljJ1JHPSq+i
         cqV49zFYnW9fgxUXPnIild7ZpHIAfM0VDn0WTl0M8xiyqzZchxD/SlMzKoaygXtDKzX+
         xxzKuzoyrXTUvHXGCK2P+3dUyYCrw5Z/4eSdE31W1DtQCVZuxNZ/CuLPKT6n5apvDu3X
         TvBg==
X-Forwarded-Encrypted: i=1; AJvYcCVO/E87uTHspLaSXnYpZUnthBG4m8hPLVyW4H86kzhbFYZ9yRA4I9fAbekdmWKNkqdAuB6hEUHjUUPB9hH0@vger.kernel.org, AJvYcCXyaSSod2BfXvldJPR3U8dXX61JwTNK6TB6+7MnomTLgA6ixhXz1s9VqgdCG+cJZqqwKRTLaD9YfTFr@vger.kernel.org
X-Gm-Message-State: AOJu0YzsIchhj6X+20Wsife0twrn6SDOIADHVJDyHadjgHVTve818Mar
	Uh2krT01NEo6/a1HIG3P/gwHO0DSU5++BYsOkncn7lYSaq2OxIKaECCiTOcsyubogQuaM0ybPri
	IiEGVbab4nIJN79ND6N2GJAv9bmrHD6U=
X-Gm-Gg: ASbGncvWvAUbW4LYy2c9k0UAj9Vl9yAkSLEOYy+Yy3ngXwHbPsxysjyxqNud3ZUaFhl
	7a3ADsQU4nOXuzo0nIwtTGhoZPgSvNdtwvQNjwfldJ45lleH9T9UrXfMuYan79jljbWtmXDyhgq
	CCFV7HebwI5pd7dYcCpkqrmTVz6jS7v0KUxsl1J8zYfmN8
X-Google-Smtp-Source: AGHT+IE6I/2rx5nV7gfMDtPJalNVlAfDKfRXQhOdtSztm+UZjqmnbWflX8kVdEbyui2m9twc6XUIRhcYi9XfbwIQvAM=
X-Received: by 2002:a5d:64c9:0:b0:3a4:dde7:ee12 with SMTP id
 ffacd0b85a97d-3a572e9e01cmr7227639f8f.53.1750056866681; Sun, 15 Jun 2025
 23:54:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303120455.90156-1-clamor95@gmail.com> <CAPVz0n0XSzxzkPocRVx6QF7xwmA4otSeSEiRZgJQ3oStyUBrLA@mail.gmail.com>
 <CAPVz0n2MLmHfVNb25=o1_woE7v16hoamwFbbT3ecE+BP1Bn9aw@mail.gmail.com> <6df6ecc4-088a-4b27-bebf-abc4560b00ae@kernel.org>
In-Reply-To: <6df6ecc4-088a-4b27-bebf-abc4560b00ae@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 16 Jun 2025 09:54:14 +0300
X-Gm-Features: AX0GCFsqWt_-u5ay7d5bbJVixmP9gUXeVtMWlZMdDA1f-EF5ljJHdYmn8kGXcoI
Message-ID: <CAPVz0n1S2rWW_08FoL+jsVJEOkQ0JJZBu+bB2U5K=fF-g87Y0A@mail.gmail.com>
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

=D0=BF=D0=BD, 16 =D1=87=D0=B5=D1=80=D0=B2. 2025=E2=80=AF=D1=80. =D0=BE 09:5=
0 Krzysztof Kozlowski <krzk@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On 16/06/2025 08:42, Svyatoslav Ryhel wrote:
> >>>
> >>>  .../devicetree/bindings/display/bridge/lvds-codec.yaml       | 1 +
> >>>  .../devicetree/bindings/display/bridge/simple-bridge.yaml    | 1 +
> >>>  drivers/gpu/drm/bridge/simple-bridge.c                       | 5 +++=
++
> >>>  3 files changed, 7 insertions(+)
> >>>
> >>> --
> >>> 2.43.0
> >>>
> >>
> >> These patches had no activity/feedback from maintainers for a while,
> >> so, in case they got lost in the depths of email box, this is a
> >> friendly reminder that they are still relevant and I would like them
> >> to move on.
> >>
> >> Best regards,
> >> Svyatoslav R.
> >
> > These patches had no activity/feedback from maintainers for a while,
>
> Really? No activity/feedback?
>
> What is this then:
>
> https://lore.kernel.org/all/567addb4-169b-4fd0-aabb-78ceded22702@kernel.o=
rg/#t
>
> https://lore.kernel.org/all/ptyvn34i377pdu7mqital6v2bqe36oy3yprxb5c3hztni=
7h52j@6eo64gzxvgg3/
>
> You already were sending such pings claiming there is no activity while
> we provide you the reviews.
>
>

Then why these patches were not picked for more then 2 month if
everyone acked and reviewed them? I am pinging every month to remind
that they are still relevant and were not picked!

> Best regards,
> Krzysztof
