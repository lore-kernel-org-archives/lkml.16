Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B004175D5D
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 17:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738951188; cv=none; b=Jl9QGMM5BNXyaSa0ztU19+Lp7npazJHr2/jNCUpi4sUPFNMeC6GN627ZaZVWX4VYUur4s4Mxhg2Krtjq9F7GPkDwowtEqjXqgYlCOH8eBHrYc7e5/p4oPw40ALMT7i2Mhv9//A3j6BLpxXoS7N3DxVduInA2e3kfIekZv5wIijw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738951188; c=relaxed/simple;
	bh=qsTJIapezLhW06qmRT26gxTR963xvPSpeajLEAGo7zU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=owJI9hLsQzvlOMVEuVsmDrZS65Fj8DeisoZAf+EE0FI9lT8KH1JrJIdMuPC1Y2uuy3iCwCrT6O/SBIwShlK9h5XmiWVMkSckPz3Mrw737G66IYONDtRvbjXnZYuq8pzeSr0rup/a+ti1KHK7Yuu7nuLETPmDAiYUS4v4OD/C2q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=manKdVlA; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="manKdVlA"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-307de8f18d6so17021881fa.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 09:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738951184; x=1739555984; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7PwmuaIBJ/10qYXXlbzfefJdtGyrGJpw93xkGEeBXLI=;
        b=manKdVlAEr21pgIoeTb/dwp8ulbOv2UqgP1EM9KyJx9Lvz660bhwrC8ToeF0SazzLA
         Ef1AQMFfQBN3G6imEWAAXvEunzuxgg/i0jOalxqZY1FPMLpJA5BfMSNCkRsCvr4M6+d/
         E6uCGFkDzl8D58Y3jLe2CqtwBOz7QLgN1bhhA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738951184; x=1739555984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7PwmuaIBJ/10qYXXlbzfefJdtGyrGJpw93xkGEeBXLI=;
        b=uk6BauKuju+XfLvnmsRwssIduiFXe7lkivIVnAbdJ+dTS1/4vln1fPMwjCB1G7YVAE
         H51zvlWmhCR9AKgvAskQ2j41r4iNuGFx3VHfNbL6g7yBN5+4rOE17v4QUIy65a6mGxOI
         n/U/IiUMlBZrz1AS5SjF09fBW29mJPaQ0tI+6hppjUt2zoZbkqGBJMz0UccXiZOw3i0n
         IIDBp1WaOGO00mFzRX1gnVfT7sKxjMmzggM7jCbWY+5G5ZN8DQP5l10lzwOhqD6RNSf+
         M5FuPNa0EiAiu47CwQ6igBxvgIfNo3Dt1BwPrIUZfHrP4Y8jrb89kvRyaB2p+CjpChpx
         iYww==
X-Forwarded-Encrypted: i=1; AJvYcCU+y49SvObp0go2a2Cj2SivmJz+cw0LUPGnEOsgasU3u2GxvYmxLOFuJozBrT+TCEGjUc2Xh9MSun0LFq4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyS2g3JS2dlVzLbAttZZQ8f986MbMuD6hSbxn9gtNU0CXwtVRxm
	8EWZkbAzj0Ucb4xethqcNhXaSs/N52FPD+kd0J+W4UnnZsF+7O5py4U63C2nDDyLR8erX7zVgRH
	eGLDo
X-Gm-Gg: ASbGncuG246zdTlvmexef/cdY4QVX5qmB6L+sVQ9922AXjw0oofTG/Ib3KWlw95rrrN
	Sr5KXMmB4l2PgIhMtFxMcbQh2B2HkOUYku6J3B4ZQy66+fKMI1MWIPsC1u48ioJT1h0+hcvoh6b
	6tq95TLsDyvx9gEXyDBrkncyCFZQC1xzG2UiZElV178aq7daGUWUkgffnqfRhL/qLwGOg00TJyA
	COBvW4DGHZawU7rqTvKUP6EN8M+z4aHoKYx4ji+mzW9Shsl5LC0kWMWH15aHTLCuFDA2TrpLdEt
	jmaGYQMwQGx3mKq1/O8iibwCXa3BC+RkXUUkLgAsk6kqj+X5laBWOlE=
X-Google-Smtp-Source: AGHT+IGN8Zg8gCYPOB74R3lO/Q4mqJe2zJioN6QW4A7FuETifGGJGb2t6vyZbEPtACufvn41+AbadQ==
X-Received: by 2002:a05:651c:b29:b0:2fb:5f9d:c284 with SMTP id 38308e7fff4ca-307e57f1261mr11961511fa.16.1738951183633;
        Fri, 07 Feb 2025 09:59:43 -0800 (PST)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de1a6549sm5386891fa.44.2025.02.07.09.59.42
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 09:59:42 -0800 (PST)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54410d769f7so2272949e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 09:59:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXTwIZSXJ5Ipfsv9VYgxpgP7B7uf4zeuX5ujLRGg8q3utRB0t03Dfm4nNKF0U0DzXrY71xVjSpwAxg/GJs=@vger.kernel.org
X-Received: by 2002:a05:6512:b8a:b0:542:6105:bb72 with SMTP id
 2adb3069b0e04-54414a9cbc3mr1362214e87.19.1738951182378; Fri, 07 Feb 2025
 09:59:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206131300.1295111-1-yelangyan@huaqin.corp-partner.google.com>
 <20250206131300.1295111-4-yelangyan@huaqin.corp-partner.google.com>
In-Reply-To: <20250206131300.1295111-4-yelangyan@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 7 Feb 2025 09:59:30 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Xe90b6x4JF716=O==U3US-vONovcvDm0yfOconkFRPcg@mail.gmail.com>
X-Gm-Features: AWEUYZnN1bml-NA4ebUvH8W9aveGL3aSVmaC8yx15fMw7Kdh-ZCSTxHkG5ADkjk
Message-ID: <CAD=FV=Xe90b6x4JF716=O==U3US-vONovcvDm0yfOconkFRPcg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/panel: panel-himax-hx83102: support for
 csot-pna957qt1-1 MIPI-DSI panel
To: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Feb 6, 2025 at 5:13=E2=80=AFAM Langyan Ye
<yelangyan@huaqin.corp-partner.google.com> wrote:
>
> The csot-pna957qt1-1 is a 10.95" TFT panel. The MIPI controller on this
> panel is the same as the other panels here, so add this panel to this
> driver.
>
> Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
> ---
>  drivers/gpu/drm/panel/panel-himax-hx83102.c | 123 ++++++++++++++++++++
>  1 file changed, 123 insertions(+)

Pushed to drm-misc-next:

[3/3] drm/panel: panel-himax-hx83102: support for csot-pna957qt1-1
MIPI-DSI panel
      commit: 05345cea4ff5a857612df3f10144dec685c07e6d
