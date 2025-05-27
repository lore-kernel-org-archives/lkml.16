Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC52E25DAE1
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 15:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748360700; cv=none; b=nm5mZqrBSV6SNGo7r4rL7dbVXJ19m3pdHlU2746D1CU0dwNHkUrzp6NQBhBdT9AhsgNmLVoq45S4k6MOdKeFItk7W7tUeafH1hdOH1wAAsItxdKIqpjm0+YJvLPGo9WUtw4ASvdplnkjuhsiqCJBnEdYa7HbramsgwGBmGqsp48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748360700; c=relaxed/simple;
	bh=o2VMFax/l+v6HlkSa/1givQ4DWN7y/3dbyrEdd9Sw5w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NnOnanTBwZKiPB+Qaloyr2aAaxDKXIf6v7KKlPiR6fC6YtERxYLKTTREqSrKDAOmKOkEm4YgW+InT3b6HBF3JiA8zUXgPGbN3d5U1I39gT2FgEqvZumslj00Z8rEE0lb1ePSSNDOE5qkTweemSXbr0HM4jOJF1ug9z58NojDJ+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bLbqAv1S; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bLbqAv1S"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-23228b9d684so32009155ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 08:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748360695; x=1748965495; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PakHKMJ8Xs6xyzsoFyIyRKOjGH16e9E/47uHjvou8JI=;
        b=bLbqAv1SzLO8f+7SYe6lS94TSslzg/JQzD6OSNdtyIb5P/ROAOwT68qYiy+zepwz70
         9tv1lxQq94DKnSxjF+iwIB5A8n7nj+LmOBjCtD6xsM4YtMw/vGHfqMLJCgB4OnV6Obuf
         aINMw3gePhIYi0mksouXE/xxV918v40r3e03o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748360695; x=1748965495;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PakHKMJ8Xs6xyzsoFyIyRKOjGH16e9E/47uHjvou8JI=;
        b=Ey+eZGsUXXo2CGniYYOJd4Wf8dS9dDjd1tWgZBRmlA90oLeBKTLZzF53v5of0ykP8x
         UAURUuajk5CLi84Iq0VQ5Te4iSns8vevxA96hv5VDFlAuj7DYONT/5rGjuVOF7VGc1PH
         QOOXpvB823JkslmZ7SYUJeE95oWbTgZbnKO0Y1ow6mfTK1PnTIAmpBGjehb6m2MNEQdZ
         vWIVdRoBgn0VaIgr1lM1+bqNbIxLGQd1kxtqrOfia35aG6/yVysD344evc/A2DvUopYl
         tJSgUwq/1KOxmLYpCFUxbn2Xa9h8iwl+u7B8HEqZFX+3k6HAXXLxGMrhrgacHWdUOsJt
         QJzg==
X-Forwarded-Encrypted: i=1; AJvYcCVBw6/phkXdAgOYKhkjno4WFSJ1+KBVlAeNf6MfoA/NT25xNx1HI7pFAwxFwzfAC7ifizdafAoeP7f4cYM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3qwunaKweq3SS6wcdJANjGmHzHmFyuSTuQfI/eqtz1vD7N9Ed
	r4zcWAnAAa+VnFNkm+yXnw4+o2UXGUAVvhb6Qrd2ScyCUSG8tK3wdBDZAuDt0l6iX2Amosy212+
	uTsQ=
X-Gm-Gg: ASbGncu2usOrczHYOIqcmXzodykc4TYs7oRjJDSt1vLpeQNSD+y58xq+OrDCLR4oKjx
	b/+t59v6cLgn5Q4TlZdqNg5TX3RTgin3E/9IlOJZOp5RU4O+UsK81c/8iWa7MFmiM0VsABxpIZG
	9MjS/GkOThd1lrQxKAoUQSY5JKoqPEJHkb5UhBGHThSzf0tUWqZyWisw8bsxr9gk5aL6V2QlFWO
	ym0dCaFovjvuENPuWnEGZ0bVumQcdG2BpZHMiSm4StY5tqmtHvBl+bir1E0ZYU1HZA1UJhrIIWi
	Sw3r/szAysy20y0WfK5aOy/Vt894HB/josdQtANPaPC3PeQrMIZYyiwxWhsw3+fNo0P10MeU7Vy
	S6Pwams1suQBIR56rxNY=
X-Google-Smtp-Source: AGHT+IEt7Ducy9/F9iQUtGc4LQkqaGQuB9uJLVcOWeB9u94TbGH7xSvPLDyorkQG1vpQUBhre5ofnA==
X-Received: by 2002:a17:902:fc46:b0:234:8eeb:d833 with SMTP id d9443c01a7336-2348eebd941mr72284575ad.41.1748360694956;
        Tue, 27 May 2025 08:44:54 -0700 (PDT)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com. [209.85.215.175])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2341d5394absm58317895ad.221.2025.05.27.08.44.51
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 08:44:51 -0700 (PDT)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b26f7d2c1f1so2948203a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 08:44:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXFB66b/JmBcvEqbhobTmrNId21cNUTLcS/alWjjTfykVxhQdmayHdP+MiYDh2m1ZsDLAB6uqdTs/5bJzk=@vger.kernel.org
X-Received: by 2002:a17:90b:574c:b0:30e:3718:e9d with SMTP id
 98e67ed59e1d1-31110d99815mr22019929a91.35.1748360690534; Tue, 27 May 2025
 08:44:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250508115433.449102-1-j-choudhary@ti.com> <mwh35anw57d6nvre3sguetzq3miu4kd43rokegvul7fk266lys@5h2euthpk7vq>
In-Reply-To: <mwh35anw57d6nvre3sguetzq3miu4kd43rokegvul7fk266lys@5h2euthpk7vq>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 27 May 2025 08:44:37 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U7XJZg4Vh4xMKEiAuaJHNA1H11SiD19KLBazPmMEVduw@mail.gmail.com>
X-Gm-Features: AX0GCFt2eGdb16tbpEFBJdqrS8eXhJRx6Q2nyER391D4cCLrL_PlO5GkVH2JRNQ
Message-ID: <CAD=FV=U7XJZg4Vh4xMKEiAuaJHNA1H11SiD19KLBazPmMEVduw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: ti-sn65dsi86: Add HPD for DisplayPort
 connector type
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: Jayesh Choudhary <j-choudhary@ti.com>, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
	rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, 
	dri-devel@lists.freedesktop.org, tomi.valkeinen@ideasonboard.com, 
	max.krummenacher@toradex.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, kieran.bingham+renesas@ideasonboard.com, 
	linux-kernel@vger.kernel.org, max.oss.09@gmail.com, devarsht@ti.com, 
	dmitry.baryshkov@oss.qualcomm.com, ernest.vanhoecke@toradex.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, May 26, 2025 at 1:41=E2=80=AFAM Ernest Van Hoecke
<ernestvanhoecke@gmail.com> wrote:
>
> Hi Jayesh,
>
> First of all, thanks for your patch. I applied it to our 6.6-based
> downstream kernel supporting a board I have here, and noticed some
> strange behaviour with eDP now.
>
> On Thu, May 08, 2025 at 05:24:33PM +0530, Jayesh Choudhary wrote:
> > +     if (pdata->bridge.type =3D=3D DRM_MODE_CONNECTOR_eDP)
> > +             regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG, HPD=
_DISABLE,
> > +                                HPD_DISABLE);
> >
>
> On my setup it seems that `pdata->bridge.type` is not yet set here,
> because it executes before `ti_sn_bridge_probe`. For the DP use case,
> this is not a problem because the type field is 0 (i.e., not
> DRM_MODE_CONNECTOR_eDP) in that case. But for eDP, it means that we are
> unexpectedly not disabling HDP.
>
> With working HDP, everything is fine in the end for both DP and eDP. But
> when the HDP line is not connected, eDP no longer works. So I wonder if
> this breaks some functionality for weird eDP panels or board
> implementations.
>
> I could certainly be missing something; from my understanding it looks
> like without a good HPD signal, the `ti_sn_bridge_probe` and quoted code
> are stuck in a loop. `ti_sn65dsi86_enable_comms` runs but does not
> disable HDP, after which the probe runs but fails and does not set the
> type field, so the next `enable_comms` run fails to disable HDP again,
> etc.

This does sound like a real problem.

I'm not sure I'll have the time to analyze it and come up with a
proposal myself right now, but Jayesh: you should make sure you
consider and address this issue before you send your next version.

Thanks!
