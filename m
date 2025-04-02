Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4B11C8603
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 09:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743585662; cv=none; b=S87yWHwnR6ENepeaS6kQ8Dw57toA2OAUv2KkhZtEnhqPlxUOIoKJxM9+cdy7NM7n9Xcu3A/n9lA8ZDTTqgCW8gxYlaJf6t/ax5zL6kBJBQcdcHqq+/pJ2Jcmm4ICwJ6oB19d/aDrNu64A0CwgNqyCIGnydH3B2g4KC+GkSRGLcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743585662; c=relaxed/simple;
	bh=cyRR7YwcTt1RVUuFWFxexpTiWgrITNp4gvcysQ5tmtU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fD4IJsd43b73XRV1WubOQ1zxqLCzfZmDlbv7xy6P06bOGSM4crVcHbYdyrG/gs1xrvlx4O1kzuQMoUjODnykQaOu3buamq0IgB3t5Zge5+cPmQ6B06RX1rqflBOzNRZwV3/ihnJdo/jl0fsfP8D5WtvKBWILlVB+TrurY1l+d7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Z6O36sOu; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Z6O36sOu"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54acc0cd458so805929e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 02:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743585658; x=1744190458; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cyRR7YwcTt1RVUuFWFxexpTiWgrITNp4gvcysQ5tmtU=;
        b=Z6O36sOufnewZxbHbgW9XPWl2THCMwLLTTow6DtxbOjoiFYQT38kANPQyXBDbVxreM
         ntnkAED85IwQR/4tyOIkctnYf7tCgUH12IAV2OguMj4Mot6Ww+7ddkkwFa7ctq5ogzCi
         MW+LRh+UVTM3989CbBgwdQlyHtvLnZkrpVXFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743585658; x=1744190458;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cyRR7YwcTt1RVUuFWFxexpTiWgrITNp4gvcysQ5tmtU=;
        b=ZB7OoPN2LLxTBlULfBnSjEHINOOgHofSe8prIRgDmyXBiBXhO8ar/kEhccrar1EbyC
         z1sVoDeBrcoOOuljQ8y6BVkKl4joiKa7gmubWIeIS4BnJq1GDjCs2LtTCQVHTXiMqoiy
         2fOIf5ZXVH5V90D2FuY92q2YaxizMwynlKAe/2Klwv4PpKURp07tWJv5sUq46XA24QKU
         IhyqCLNsEnbSwQujNcdvPgBR6hzlr7QmSQpF/Zq206ggZ57UH+GHOyXa9sR7XP74Bd4l
         H5zXA9Ie+ltvjRBizmdjBrJJ9z96UtOvqIDkhd3EJjBuGg5WNjpe/EAVeK2WES/IxzcM
         uLqQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0nl9E1mh2EN7oZpW8Z+lpqcJjIhtsjwEIEkdLhSxCkgobYK/X+N0835qLm+U4AQ2MQdS7AQxoZB3vRzE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfQ+ByTipuca/4PLgkMooM0zLcyvolhuK0r7Vr6rPeVxe2uv8b
	B8/kcR8En8TcVLLzmvC4iZ4a8os2hZ3gQFRfxcY8YQUAODQB6J8eoodpWgv9P3uptzBhaGbbJiT
	U/VynqvK3zXqEkoQM2OnJaWDTj6Ed9MStfBkp
X-Gm-Gg: ASbGncshcMuUFhGfCnkQ6NZeo7qb2jJhL64nFcEYyoQrvRsa9mEFDaOo7Uz93CifHsI
	z8NyMGIPTyIefIYEQECTTQ1QMSF/p6M6lII8983OSMaRbcho0jFBG3d6zBZ0Ay646PpirAMZcNF
	S7hBK4zKxQs2sL8QplDTCf87eDIEYn5UrAbHQgdCOjHy63Fs0aV90I
X-Google-Smtp-Source: AGHT+IFNQ8rh8uohCED3FsKCQuotU4QQf82Ifu/wJJpZo0zeWoQri2IhxtJ24b7PrATskKr8lE3tJp/lmcDLayTcKSY=
X-Received: by 2002:a05:6512:1582:b0:53e:39e6:a1c1 with SMTP id
 2adb3069b0e04-54c19c81f80mr468673e87.43.1743585658589; Wed, 02 Apr 2025
 02:20:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402083852.20624-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250402083852.20624-1-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 2 Apr 2025 17:20:47 +0800
X-Gm-Features: AQ5f1JrBOnaeLpNxIHL0qnzLitrLXH_ivJZiH5ry-mQ9PevMkY1uBQey-dy93ik
Message-ID: <CAGXv+5Fo3-5J1Tyn1JGP0+aTeCnkUJhwxiuLt71MLUp-zVSCkg@mail.gmail.com>
Subject: Re: [PATCH] thermal/drivers/mediatek/lvts: Fix debugfs unregister on failure
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com, 
	lukasz.luba@arm.com, matthias.bgg@gmail.com, npitre@baylibre.com, 
	jpanis@baylibre.com, nfraprado@collabora.com, bchihi@baylibre.com, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 4:39=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> When running the probe function for this driver, the function
> lvts_debugfs_init() gets called in lvts_domain_init() which, in
> turn, gets called in lvts_probe() before registering threaded
> interrupt handlers.
>
> Even though it's unlikely, the last call may fail and, if it does,
> there's nothing removing the already created debugfs folder and
> files.
>
> In order to fix that, instead of calling the lvts debugfs cleanup
> function upon failure, register a devm action that will take care
> of calling that upon failure or driver removal.
>
> Since devm was used, also delete the call to lvts_debugfs_exit()
> in the lvts_remove() callback, as now that's done automatically.
>
> Fixes: f5f633b18234 ("thermal/drivers/mediatek: Add the Low Voltage Therm=
al Sensor driver")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
