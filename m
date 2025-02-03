Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036A81D5176
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 18:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738605612; cv=none; b=YnJ858wMaD5hDKBMHrZBqJQJATwRdiXpNklahWJ7zn3pg4s9ZJDjnmeGJyWp6+3QKTkrUUYra3AQu6TfMX484rEmyURvQb1Q+Mx7ao3RYIrnrPIzZeFe5PK8E1a6a/QNhDRcHgL3FSihR2fh6jYKV2JYXXxUj8x//YIFFzKmbA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738605612; c=relaxed/simple;
	bh=NdYElx0RPhXCNMMsMyVnunqitvafqEO42krTByKJwNA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KU/cln5oEQsYP/lYYz1+9EXMmkV7LFUWghyclacgWBXq6ANnsKFbE9BEOsjuT/dovoqvOdYQtKN5l3q41uf2tDN3HP7fSoF3tC8UCVFEUYO7jdO2VbR/OvpaDsryP4iG+LOylBei5hCWk6Q0VwdfjqqWze8xQxA5+supkrqt3Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FVWkpw64; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FVWkpw64"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-305d843d925so37424171fa.2
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 10:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738605606; x=1739210406; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rj69N8eshnsgwGXgbMTqaWaytIEdPdApaQMseLoPlUE=;
        b=FVWkpw64/BAOTm1dh6faLJ2iZ8mXR7W2LwvQEeNp1UxDf4Yg/VxkljcojTtdQuaKsL
         KJ6+wUN5E0QFM9hMkfUtFYkQlNs7btB7Y5zwnSNdP/iQIF8MXJkdRX9lJCGieU5Cf0kQ
         inGwtRAe5DN46WuaaGNvTJeGvQ88shKWM5C5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738605606; x=1739210406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rj69N8eshnsgwGXgbMTqaWaytIEdPdApaQMseLoPlUE=;
        b=rjSUjUmvICdiD7tHzkVFv5Tz22t67GjZBwNbpkNGsfCS72YSrgxT5t17eAJ8xmsUYE
         ejAYI+2d8/I2dsq7S8ytRtCrT7Ww7vpieb60VXTNgnW9LCAP5rBKC+jKtJZbp8ote+Zd
         P3nlcD0D0T69Z0mELmvf/gL/sapSXFGo3vQcZEVONcdRbYsRhXy+2QVmqqC4duBC2KqC
         zsMvkmW4DNL8xr6jGEUZIylx+4XUdsJBdd+0x6DlG6I8gPOZzzZrd2dT6ZJzDxYn3zH0
         kvKIIaOT7BWeJ0OLI94US3BYz2CQBh+uqs+V1D8oXzohXijAAtTn39z2ajCL5JrLoqwv
         eRQg==
X-Forwarded-Encrypted: i=1; AJvYcCWaytTze2Txkcu6aZQRPt8nh0R9ID6t+4Pw2OlDZB9OdDE9ij/PQzphEJAYv/yMy8OH0Dezy+VHKFGDraI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyfae+HoYJc2WZHjAZsGjOUj7LWJ/jr1JDVINEHKscBoFuYwYBQ
	5CjYQ5/x6e5aB+vqiHgUbm10KSt3+hchIEqqwEX5Zz5a435wPb4ixcAFbAnu0G8OEpk1EH24VsM
	XgA==
X-Gm-Gg: ASbGncvdfF6QLvptoeKn1KHH+BB+5ppD9/AKtYOfzItq4j0Qet5Y1JWl1naHhrGnHSA
	4nNHSjvlKkfpKPIk+ZGGSj/KwaV6/W3LuMKMhBknwp/uBqc4+wuPulca14TlnCkMzprNljM7utF
	yFsqbcor7lhVrUFsdDQHzXz2+M33NnBQwq6MnMhLlWQLJTqgT5v6ZcDbMKIB/QSkrUfZbQZQpt2
	XGVGm9TMsnKluQn4K2wnVP913fBfoLgWEQkE3MzjgQjTUOg/3itZDCDwtZemEueG/FxPsO3usl1
	aVx8CdjY2T9wpf1wvJGa1Q3VX5IFzdqyl1Im2/BR8fO98C7XyOQye+/3vGQ=
X-Google-Smtp-Source: AGHT+IEu9MjG0bIxn6TzV/A16fMFP0di6tvHI5d/4BMWw8qu003eR1d9AEh31oUi3wTtrv9TD2RqWw==
X-Received: by 2002:a2e:a591:0:b0:302:3de5:b039 with SMTP id 38308e7fff4ca-3079680c842mr69483311fa.8.1738605606199;
        Mon, 03 Feb 2025 10:00:06 -0800 (PST)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307a33f7cd2sm15457321fa.65.2025.02.03.10.00.04
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 10:00:05 -0800 (PST)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3043e84c687so40702791fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 10:00:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWqjKGTs+ySTlKbcWvRW3X0NRP9RSM6FxHJbWmw3/4E729WUzA8AVoM2KoWH24wo3Z4ubdJXEMC0lKng3I=@vger.kernel.org
X-Received: by 2002:a2e:a90d:0:b0:302:29a5:6e21 with SMTP id
 38308e7fff4ca-3079680c84dmr71971241fa.3.1738605603726; Mon, 03 Feb 2025
 10:00:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250201185439.157613-1-tejasvipin76@gmail.com>
In-Reply-To: <20250201185439.157613-1-tejasvipin76@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 3 Feb 2025 09:59:52 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U+eg5P7qC9pMCQTc-eaPK2DgpC6xkqswFRc7FnQBYeJA@mail.gmail.com>
X-Gm-Features: AWEUYZkAkz6Lt1anmV2cYxMuD89go-NN0PowJVelpFObbIRazNrFa7JhV9cYyKg
Message-ID: <CAD=FV=U+eg5P7qC9pMCQTc-eaPK2DgpC6xkqswFRc7FnQBYeJA@mail.gmail.com>
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

On Sat, Feb 1, 2025 at 10:55=E2=80=AFAM Tejas Vipin <tejasvipin76@gmail.com=
> wrote:
>
> Changes the sharp-ls060t1sx01 panel to use multi style functions for

Not worth spinning for this, but s/Changes/Change/

> improved error handling.
>
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
>  .../gpu/drm/panel/panel-sharp-ls060t1sx01.c   | 59 +++++--------------
>  1 file changed, 16 insertions(+), 43 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I'll wait a few days and apply if there are no objections.

-Doug
