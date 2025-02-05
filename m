Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB79211A11
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 20:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738788865; cv=none; b=hv2TUJrVCnMcyC5PdD8bRMLGStkDagdqo6Ltzy4dq6Ax4eOmEa98Ip5xSbQm0RFrYOSM1eHIsBtJc5tl/sAJzPAJmtvGKaDK8IhveMTM+WYk/yN0FK7land9CInyxmUDSaJeX2OB0hFr4VMeqVk7Ce9VLowN/c96d5x7ZVbDhdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738788865; c=relaxed/simple;
	bh=srTRpRYGr682EWc7LV8sEjg3JykzZ2tWV8h6N3VFFQk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kusZrJrfN70+iGWUAfcvUpzQ8AeW+3aC4qKchzLxMEawrsI9bk6amD/EyX8I+b/OZ96XDk+DAWxeVNX8V0HU4CUxEmG+cGL538fKLOVvKJAjqlBG5K+WRpb/NrAALv8B8nbLKzhNzTFS6VZWSghsonh1J3nZmyegHxRbWm8s9rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FMVqcxh4; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FMVqcxh4"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30737db1ab1so2041551fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 12:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738788860; x=1739393660; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gnfNJ31w8XMj5OUdUcMgE4H0lYz13gL6Ny9TiCxl+MI=;
        b=FMVqcxh4AQ76lIMBct5OcARizRHRLGojOoflDmNOD5Rm/7jW2jPyMa5w17TpOF8rsx
         07cCdb21ELVcNCCG0ACHknWMLo7lcK8tLMr3v9RXo8OUspFuKApjA2vxn1IbysanwqmH
         r0cszb2cshiAO9HxKhzd302HuX/6u9YABOdto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738788860; x=1739393660;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gnfNJ31w8XMj5OUdUcMgE4H0lYz13gL6Ny9TiCxl+MI=;
        b=psAK2LpKVPQsmwOh6Vyit9QAX47Ln9htZRBH7H2J6s/czFtmFSVX7L5YHHBfP/lX7Q
         2bnIkoSDOA8rnnAQSaDqY1cLbDiwCqrN8F8YqkXjbbvqW7Lvtm9zHida+3oUq+z/3mi3
         Dv+g0uDQG23WbK+hqtRnDruDyA+buqTmg+ML2YcUfyJlO+gCQ9FkEb72Ews025+pFVCe
         3do08YtTUd0jLVVru5/y+38gPEoLxcmIufBJD/lwNA9QrIXMzlhnOU5mp5tWVc4EXAuf
         ibfUCtJwZdpNFSJRNHRAFBdiHoMIccBppDoe9AKx3+EpHZJnnVZdX/pdmuQBXAHVvAvr
         rZlQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7y/VYZGbhdzfIdCBz4yGM9lu7J/zKOStqba/Ka5e6pieLrDus8iQEjtIsRBY7OnJ0ApJz77IyWcU7UIc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0H0q+k7KBoGxMRTTv/o3/8Gj1cqGPIr5fTCFwLIzkaVpG8eVA
	idcDuSbT506Lmzyhs+wRZGqFie2aQhotEicxJVfK/jhKG26xD93O3OgAr/dYkbRHV91EysBoDOB
	9KQ==
X-Gm-Gg: ASbGncu1ievYELgOq6mY16N7PyYBOtUPrc5a/eVYwX0XNuXF7aA5KqYFvPoior8yvHr
	myp6TJ75ALI4/j7O6ns+C3aUBYoLMcFFKHxsRU3bsu5Lu3oaZmac7MWjp3n4Eo/beme+/J7rAn+
	JEvcY/E1L6jW2pL7wnm8NWKEKtoEmjcUwKcldDuGhNF9kkweaQvb9pWzo6+cluqry6AA3vL2Hqn
	yPjSmceosqdgx/0lXKTw+UNtVFuqf+2mMmLssGKnCCwr5Oz+uc9k+koFl4bKVt6VQFhiG6VfZ9O
	rcGVC6yTVMLEE3j30Kogq9JR9cmRTc6i31HFeY7/7rqaj0DAQuVybHA=
X-Google-Smtp-Source: AGHT+IG2E4D6es6RPiNWkWeriFOOALch1RrgHaI0M6Sb5Pvt6J5FtnP3A5WxN7lBLR2pha4RTUtT0w==
X-Received: by 2002:a05:651c:1614:b0:302:264e:29dd with SMTP id 38308e7fff4ca-307cf370987mr16549511fa.24.1738788859706;
        Wed, 05 Feb 2025 12:54:19 -0800 (PST)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307a30699dcsm22299081fa.19.2025.02.05.12.54.18
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 12:54:18 -0800 (PST)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5440efe97baso71790e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 12:54:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX0g9C8Rb+2RsXOA/l5p5mYSPSkNnIqb5P3zx632dWHuUiTIHxYVxF2YqQOqzngyifYTY4qaM7SA8L3E3o=@vger.kernel.org
X-Received: by 2002:a05:6512:3c8d:b0:540:1f7d:8bce with SMTP id
 2adb3069b0e04-54405a6c098mr1369123e87.38.1738788858213; Wed, 05 Feb 2025
 12:54:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250201185439.157613-1-tejasvipin76@gmail.com> <CAD=FV=U+eg5P7qC9pMCQTc-eaPK2DgpC6xkqswFRc7FnQBYeJA@mail.gmail.com>
In-Reply-To: <CAD=FV=U+eg5P7qC9pMCQTc-eaPK2DgpC6xkqswFRc7FnQBYeJA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 5 Feb 2025 12:54:06 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V8xJtqYjdUmDZfdd9XP6r75-7-nDp1OL7pvE+wo0ZFDg@mail.gmail.com>
X-Gm-Features: AWEUYZk4A2PtUDWgKQwwAC8_vv9GiJYpZFEbo6pTOKrZFhPqND757eFC71ksSKU
Message-ID: <CAD=FV=V8xJtqYjdUmDZfdd9XP6r75-7-nDp1OL7pvE+wo0ZFDg@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: sharp-ls060t1sx01: transition to mipi_dsi
 wrapped functions
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	quic_jesszhan@quicinc.com, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Feb 3, 2025 at 9:59=E2=80=AFAM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi,
>
> On Sat, Feb 1, 2025 at 10:55=E2=80=AFAM Tejas Vipin <tejasvipin76@gmail.c=
om> wrote:
> >
> > Changes the sharp-ls060t1sx01 panel to use multi style functions for
>
> Not worth spinning for this, but s/Changes/Change/
>
> > improved error handling.
> >
> > Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> > ---
> >  .../gpu/drm/panel/panel-sharp-ls060t1sx01.c   | 59 +++++--------------
> >  1 file changed, 16 insertions(+), 43 deletions(-)
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> I'll wait a few days and apply if there are no objections.

Pushed to drm-misc-next:

[1/1] drm/panel: sharp-ls060t1sx01: transition to mipi_dsi wrapped function=
s
      commit: 7e3bf00047cdfe2b09e9a0d77b99bedc15406bfa
